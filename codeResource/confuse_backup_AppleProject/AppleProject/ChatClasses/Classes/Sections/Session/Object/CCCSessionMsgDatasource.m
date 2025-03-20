//
//  CCCSessionMsgDatasource.m
// AppleProjectKit
//
//  Created by chris.
//  Copyright (c) 2015年 NetEase. All rights reserved.
//

#import "CCCSessionMsgDatasource.h"
#import "UITableView+NIMScrollToBottom.h"
#import "BBBMessageModel.h"
#import "BBBTimestampModel.h"
#import "CCCGlobalMacro.h"
#import "AppleProjectKit.h"
#import "BBBKitInfoFetchOption.h"

@interface CCCSessionMsgDatasource()

@property (nonatomic,strong) id<CCCKitMessageProvider> dataProvider;

@property (nonatomic,strong) NSMutableDictionary *msgIdDict;

@property (nonatomic,assign) BOOL messageModelShowSelect;

@end

@implementation CCCSessionMsgDatasource
{
    NIMSession *_currentSession;
    dispatch_queue_t _messageQueue;
}

- (instancetype)initWithSession:(NIMSession*)session
                         config:(id<CCCSessionConfig>)sessionConfig
{
    if (self = [self init]) {
        _currentSession    = session;
        _sessionConfig     = sessionConfig;
        id<CCCKitMessageProvider> dataProvider = [_sessionConfig respondsToSelector:@selector(messageDataProvider)] ? [_sessionConfig messageDataProvider] : nil;
        
        NSInteger limit = [AppleProjectKit sharedKit].config.messageLimit;
        NSTimeInterval showTimestampInterval = [AppleProjectKit sharedKit].config.messageInterval;
        
        _dataProvider      = dataProvider;
        _messageLimit      = limit;
        _showTimeInterval  = showTimestampInterval;
        _items             = [NSMutableArray array];
        _msgIdDict         = [NSMutableDictionary dictionary];
        _pinUsers          = [NSMutableDictionary dictionary];
    }
    return self;
}


- (void)resetMessages:(void(^)(NSError *error)) handler
{
    [self enhancedResetMessages:^(NSError *error, NSArray *models) {
       if (handler)
       {
           handler(error);
       }
    }];
}

- (void)enhancedResetMessages:(void(^)(NSError *error, NSArray *))handler
{
    self.items              = [NSMutableArray array];
    self.msgIdDict         = [NSMutableDictionary dictionary];
    if ([self.dataProvider respondsToSelector:@selector(pullDown:handler:)])
    {
        __weak typeof(self) wself = self;
        [self.dataProvider pullDown:nil handler:^(NSError *error, NSArray<NIMMessage *> *messages) {
            NEEKIT_Dispatch_Async_Main(^{
                NSArray *models = [self modelsWithMessages:messages];
                [wself appendMessageModels:models];
                if (handler) {
                    handler(error, models);
                }
            });
        }];
    }
    else
    {
        NSArray<NIMMessage *> *messages = [[[NIMSDK sharedSDK] conversationManager] messagesInSession:_currentSession
                                                                                   message:nil
                                                                                     limit:_messageLimit];

        
        if (messages.count == 0){
            [self pullDown:nil handler:^(NSError *error, NSArray<NIMMessage *> *messages) {
                NSArray *models = [self modelsWithMessages:messages];
                [self appendMessageModels:models];
                if (handler) {
                    handler(nil,models);
                }
            }];
            return;
        }
        
        NSArray *models = [self modelsWithMessages:messages];
        [self appendMessageModels:models];
        if (handler) {
            handler(nil,models);
        }
    }
}


/**
 *  从头插入消息
 *
 *  @param messages 消息
 *
 *  @return 插入后table要滑动到的位置
 */
- (NSInteger)insertMessages:(NSArray *)messages{
    NSInteger count = self.items.count;
    for (NIMMessage *message in messages.reverseObjectEnumerator.allObjects) {
        [self insertMessage:message];
    }
    NSInteger currentIndex = self.items.count - 1;
    return currentIndex - count;
}

/**
 *  从后插入消息
 *
 *  @param models 消息集合
 *
 *  @return 插入的消息的index
 */
- (NSArray *)appendMessageModels:(NSArray *)models{
    if (!models.count) {
        return @[];
    }
    NSMutableArray *append = [[NSMutableArray alloc] init];
    for (BBBMessageModel *model in models) {
        if ([self modelIsExist:model]) {
            continue;
        }
        NSArray *result = [self insertMessageModel:model index:self.items.count];
        [append addObjectsFromArray:result];
    }
    return append;
}


/**
 *  从中间插入消息
 *
 *  @param models 消息集合
 *
 *  @return 插入消息的index
 */
- (NSArray *)insertMessageModels:(NSArray *)models{
    if (!models.count) {
        return @[];
    }
    NSMutableArray *insert = [[NSMutableArray alloc] init];
    //由于找到插入位置后会直接插入，所以这里按时间戳大小先排个序，避免造成先插了时间大的，再插了时间小的，导致之前时间大的消息的位置还需要后移的情况.
    NSArray *sortModels = [models sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        BBBMessageModel *first  = obj1;
        BBBMessageModel *second = obj2;
        return first.messageTime < second.messageTime ? NSOrderedAscending : NSOrderedDescending;
    }];
    for (BBBMessageModel *model in sortModels) {
        if ([self modelIsExist:model]) {
            continue;
        }

        NSInteger i = [self findInsertPosistion:model];
        NSArray *result = [self insertMessageModel:model index:i];
        [insert addObjectsFromArray:result];
    }
    return insert;
}


- (NSInteger)indexAtModelArray:(BBBMessageModel *)model
{
    __block NSInteger index = -1;
    if (![_msgIdDict objectForKey:model.message.messageId]) {
        return index;
    }
    [self.items enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if ([obj isKindOfClass:[BBBMessageModel class]]) {
            if ([model isEqual:obj]) {
                index = idx;
                *stop = YES;
            }
        }
    }];
    return index;
}

#pragma mark - msg

- (BOOL)modelIsExist:(BBBMessageModel *)model
{
    return [_msgIdDict objectForKey:model.message.messageId] != nil;
}


- (void)loadHistoryMessagesWithComplete:(void(^)(NSInteger index, NSArray *messages , NSError *error))handler
{
    __block BBBMessageModel *currentOldestMsg = nil;
    [self.items enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if ([obj isKindOfClass:[BBBMessageModel class]]) {
            currentOldestMsg = (BBBMessageModel*)obj;
            *stop = YES;
        }
    }];
    __block NSInteger index = 0;
    if ([self.dataProvider respondsToSelector:@selector(pullDown:handler:)])
    {
        [self.dataProvider pullDown:currentOldestMsg.message handler:^(NSError *error, NSArray *messages) {
            NEEKIT_Dispatch_Async_Main(^{
                if (handler) {
                    handler(index,messages,error);
                }
            });
        }];
        return;
    }
    else
    {
        NSArray *messages = [[[NIMSDK sharedSDK] conversationManager] messagesInSession:_currentSession
                                                                                message:currentOldestMsg.message
                                                                                  limit:self.messageLimit];

        if (messages.count == 0){
            /// 如果本地db 消息为空，读服务端会话
            [self pullDown:currentOldestMsg.message handler:^(NSError *error, NSArray<NIMMessage *> *messages) {
                index = [self insertMessages:messages];
                if (handler) {
                    handler(index,messages,nil);
                }
            }];
            return;
        }
        
        index = [self insertMessages:messages];
        if (handler) {
            NEEKIT_Dispatch_Async_Main(^{
                handler(index,messages,nil);
            });
        }
    }
}

- (void)pullDown:(NIMMessage *)firstMessage handler:(NIMKitDataProvideHandler)handler{
    [self remoteFetchMessage:firstMessage handler:handler];
}

- (void)remoteFetchMessage:(NIMMessage *)message
                   handler:(NIMKitDataProvideHandler)handler
{
    NIMHistoryMessageSearchOption *searchOpt = [[NIMHistoryMessageSearchOption alloc] init];
    searchOpt.startTime  = 0;
    searchOpt.endTime    = message.timestamp;
    searchOpt.currentMessage = message;
    searchOpt.limit      = 20;
    [[NIMSDK sharedSDK].conversationManager fetchMessageHistory:_currentSession option:searchOpt result:^(NSError *error, NSArray *messages) {
        if (handler) {
            handler(error,messages.reverseObjectEnumerator.allObjects);
        };
    }];
}

- (void)loadPullUpMessagesWithComplete:(void (^)(NSInteger, NSArray *, NSError *))handler {
    __block BBBMessageModel *currentNewestMsg = self.items.lastObject;
    __block NSInteger index = 0;
    NIMMessageSearchOption *option = [NIMMessageSearchOption new];
    option.startTime = currentNewestMsg.messageTime - 0.1;
    option.limit = [AppleProjectKit sharedKit].config.messageLimit;
    option.allMessageTypes = YES;
    option.order = NIMMessageSearchOrderAsc;
    __weak typeof(self) wself = self;
    [[NIMSDK sharedSDK].conversationManager searchMessages:_currentSession
                                                    option:option
                                                    result:^(NSError * _Nullable error, NSArray<NIMMessage *> * _Nullable messages) {
                                                        index = [wself appendMessageModels:[self modelsWithMessages:messages]].count;
                                                        if (handler) {
                                                            NEEKIT_Dispatch_Async_Main(^{
                                                                handler(index,messages,nil);
                                                            });
                                                        }
                                                    }];
}

- (void)loadMessagePins:(void (^)(NSError *))handler
{
    [NIMSDK.sharedSDK.chatExtendManager loadMessagePinsForSession:_currentSession completion:^(NSError * _Nonnull error, NSArray<NIMMessagePinItem *> * _Nullable items) {
        [items enumerateObjectsUsingBlock:^(NIMMessagePinItem * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSString *pinUserID = obj.accountID ?: NIMSDK.sharedSDK.loginManager.currentAccount;
            BBBKitInfoFetchOption *option = [[BBBKitInfoFetchOption alloc] init];
            option.session = _currentSession;
            self.pinUsers[obj.messageId] = [AppleProjectKit.sharedKit infoByUser:pinUserID option:option].showName;
        }];
        if (handler) {
            handler(nil);
        }
    }];
}

- (NSArray*)deleteMessageModel:(BBBMessageModel *)msgModel
{
    NSMutableArray *dels = [NSMutableArray array];
    NSInteger delTimeIndex = -1;
    NSInteger delMsgIndex = [self.items indexOfObject:msgModel];
    if (delMsgIndex > 0) {
        BOOL delMsgIsSingle = (delMsgIndex == self.items.count-1 || [self.items[delMsgIndex+1] isKindOfClass:[BBBTimestampModel class]]);
        if ([self.items[delMsgIndex-1] isKindOfClass:[BBBTimestampModel class]] && delMsgIsSingle) {
            delTimeIndex = delMsgIndex-1;
            [self.items removeObjectAtIndex:delTimeIndex];
            [dels addObject:@(delTimeIndex)];
        }
    }
    if (delMsgIndex > -1) {
        [self.items removeObject:msgModel];
        [_msgIdDict removeObjectForKey:msgModel.message.messageId];
        [dels addObject:@(delMsgIndex)];
    }
    return dels;
}

- (NSArray<NSIndexPath *> *)deleteModels:(NSRange)range
{
    NSArray *models = [self.items subarrayWithRange:range];
    NSMutableArray *dels = [NSMutableArray array];
    NSMutableArray *all = [NSMutableArray arrayWithArray:self.items];
    for (BBBMessageModel *model in models) {
        if ([model isKindOfClass:[BBBTimestampModel class]]) {
            continue;
        }
        NSInteger delTimeIndex = -1;
        NSInteger delMsgIndex = [all indexOfObject:model];
        if (delMsgIndex > 0) {
            BOOL delMsgIsSingle = (delMsgIndex == all.count-1 || [all[delMsgIndex+1] isKindOfClass:[BBBTimestampModel class]]);
            if ([all[delMsgIndex-1] isKindOfClass:[BBBTimestampModel class]] && delMsgIsSingle) {
                delTimeIndex = delMsgIndex-1;
                [self.items removeObjectAtIndex:delTimeIndex];
                NSIndexPath *indexpath = [NSIndexPath indexPathForRow:delTimeIndex inSection:0];
                [dels addObject:indexpath];
            }
        }
        if (delMsgIndex > -1) {
            [self.items removeObject:model];
            [_msgIdDict removeObjectForKey:model.message.messageId];
            NSIndexPath *indexpath = [NSIndexPath indexPathForRow:delMsgIndex inSection:0];
            [dels addObject:indexpath];
        }
    }
    return dels;
}

- (void)cleanCache
{
    for (id item in self.items)
    {
        if ([item isKindOfClass:[BBBMessageModel class]])
        {
            BBBMessageModel *model = (BBBMessageModel *)item;
            [model cleanCache];
        }
    }
}

- (void)refreshMessageModelShowSelect:(BOOL)isShow {
    _messageModelShowSelect = isShow;

    for (id item in self.items)
    {
        if ([item isKindOfClass:[BBBMessageModel class]])
        {
            BBBMessageModel *model = (BBBMessageModel *)item;
            model.shouldShowSelect = isShow;
            model.selected = NO;
            if ([_sessionConfig respondsToSelector:@selector(disableSelectedForMessage:)]) {
                model.disableSelected = [_sessionConfig disableSelectedForMessage:model.message];;
            }
            if ([_sessionConfig respondsToSelector:@selector(needShowReplyContent)]) {
                model.enableRepliedContent = [_sessionConfig needShowReplyContent];
            }
            if ([_sessionConfig respondsToSelector:@selector(needShowQuickComments)]) {
                model.enableQuickComments = [_sessionConfig needShowQuickComments];
            }
        }
    }
}

- (void)willDisplayMessageModel:(BBBMessageModel *)model
{
    if ([_sessionConfig respondsToSelector:@selector(shouldShowPinContent)]) {
        model.shouldShowPinContent = [_sessionConfig shouldShowPinContent];
    }
    model.pinUserName = self.pinUsers[model.message.messageId];
}

- (void)addPinForMessage:(NIMMessage *)message callback:(void (^)(NSError *))handler
{
    if (!message) {
        !handler ?: handler(nil);
        return;
    }
    NIMMessagePinItem *item = [NIMSDK.sharedSDK.chatExtendManager pinItemForMessage:message];
    NSString *accountID = item.accountID ?: NIMSDK.sharedSDK.loginManager.currentAccount;
    BBBKitInfoFetchOption *option = [[BBBKitInfoFetchOption alloc] init];
    option.session = message.session;
    NSString *pinUserName = [AppleProjectKit.sharedKit infoByUser:accountID option:option].showName;
    self.pinUsers[message.messageId] = pinUserName;
    !handler ?: handler(nil);
}

- (void)removePinForMessage:(NIMMessage *)message callback:(void (^)(NSError *))handler
{
    if (message) {
        self.pinUsers[message.messageId] = nil;
    }
    !handler ?: handler(nil);
}

#pragma mark - private methods
- (void)insertMessage:(NIMMessage *)message{
    BBBMessageModel *model = [[BBBMessageModel alloc] initWithMessage:message];
    model.shouldShowSelect = _messageModelShowSelect;
    if ([_sessionConfig respondsToSelector:@selector(disableSelectedForMessage:)]) {
        model.disableSelected = [_sessionConfig disableSelectedForMessage:model.message];;
    }
    if ([_sessionConfig respondsToSelector:@selector(enableRepliedContent)]) {
        model.enableRepliedContent = [_sessionConfig needShowReplyContent];
    }
    if ([_sessionConfig respondsToSelector:@selector(shouldShowPinContent)]) {
        model.shouldShowPinContent = [_sessionConfig shouldShowPinContent];
    }
    model.pinUserName = self.pinUsers[model.message.messageId];
    if ([self modelIsExist:model]) {
        return;
    }

    
    NSTimeInterval firstTimeInterval = [self firstTimeInterval];
    if (firstTimeInterval && firstTimeInterval - model.messageTime < self.showTimeInterval) {
        //此时至少有一条消息和时间戳（如果有的话）
        //干掉时间戳（如果有的话）
        if ([self.items.firstObject isKindOfClass:[BBBTimestampModel class]]) {
            [self.items removeObjectAtIndex:0];
        }
    }
    [self.items insertObject:model atIndex:0];
    if ((![self.dataProvider respondsToSelector:@selector(needTimetag)] || self.dataProvider.needTimetag) && self.dataProvider) {
        //这种情况下必须要插入时间戳
        BBBTimestampModel *timeModel = [[BBBTimestampModel alloc] init];
        timeModel.messageTime = model.messageTime;
        [self.items insertObject:timeModel atIndex:0];
    }
    [self.msgIdDict setObject:model forKey:model.message.messageId];
}


- (NSArray *)insertMessageModel:(BBBMessageModel *)model index:(NSInteger)index{
    NSMutableArray *inserts = [[NSMutableArray alloc] init];
    if (![self.dataProvider respondsToSelector:@selector(needTimetag)] || self.dataProvider.needTimetag)
    {
        if ([self shouldInsertTimestamp:model]) {
            BBBTimestampModel *timeModel = [[BBBTimestampModel alloc] init];
            timeModel.messageTime = model.messageTime;
            [self.items insertObject:timeModel atIndex:index];
            [inserts addObject:@(index)];
            index++;
        }
    }
    [self.items insertObject:model atIndex:index];
    [self.msgIdDict setObject:model forKey:model.message.messageId];
    [inserts addObject:@(index)];
    return inserts;
}

- (void)subHeadMessages:(NSInteger)count
{
    NSInteger catch = 0;
    NSArray *modelArray = [NSArray arrayWithArray:self.items];
    for (BBBMessageModel *model in modelArray) {
        if ([model isKindOfClass:[BBBMessageModel class]]) {
            catch++;
            [self deleteMessageModel:model];
        }
        if (catch == count) {
            break;
        }
    }
}

- (NSArray<BBBMessageModel *> *)modelsWithMessages:(NSArray<NIMMessage *> *)messages
{
    NSMutableArray *array = [[NSMutableArray alloc] init];
    for (NIMMessage *message in messages) {
        BBBMessageModel *model = [[BBBMessageModel alloc] initWithMessage:message];
        model.shouldShowSelect = _messageModelShowSelect;
        if ([_sessionConfig respondsToSelector:@selector(disableSelectedForMessage:)]) {
            model.disableSelected = [_sessionConfig disableSelectedForMessage:model.message];;
        }
        if ([_sessionConfig respondsToSelector:@selector(needShowReplyContent)]) {
            model.enableRepliedContent = [_sessionConfig needShowReplyContent];
        }

        if ([_sessionConfig respondsToSelector:@selector(needShowQuickComments)]) {
            model.enableQuickComments = [_sessionConfig needShowQuickComments];
        }
        if ([_sessionConfig respondsToSelector:@selector(shouldShowPinContent)]) {
            model.shouldShowPinContent = [_sessionConfig shouldShowPinContent];
        }
        model.pinUserName = self.pinUsers[model.message.messageId];
        [array addObject:model];
    }
    return array;
}


- (NSInteger)findInsertPosistion:(BBBMessageModel *)model
{
    return [self findInsertPosistion:self.items model:model];
}

- (NSInteger)findInsertPosistion:(NSArray *)array model:(BBBMessageModel *)model
{
    if (array.count == 0) {
        //即初始什么消息都没的情况下，调用了插入消息，放在第一个就好了。
        return 0;
    }
    if (array.count == 1) {
        //递归出口
        BBBMessageModel *obj = array.firstObject;
        NSInteger index = [self.items indexOfObject:obj];
        return obj.messageTime > model.messageTime? index : index+1;
    }
    NSInteger sep = (array.count+1) / 2;
    BBBMessageModel *center = array[sep];
    NSTimeInterval timestamp = [center messageTime];
    NSArray *half;
    if (timestamp <= [model messageTime]) {
        half = [array subarrayWithRange:NSMakeRange(sep, array.count - sep)];
    }else{
        half = [array subarrayWithRange:NSMakeRange(0, sep)];
    }
    return [self findInsertPosistion:half model:model];
}


- (BOOL)shouldInsertTimestamp:(BBBMessageModel *)model
{
    BBBMessageModel *lastmodel = self.items.lastObject;
    if (model.message.messageType == NIMMessageTypeCustom && model.message.messageSubType == 20) {
        return NO;
    }
    
    NIMNotificationObject *object = lastmodel.message.messageObject;
    if (object && [object isKindOfClass:NIMNotificationObject.class] && object.notificationType == NIMNotificationTypeTeam)
    {
        return NO;
    }
    
    NSTimeInterval lastTimeInterval = lastmodel.messageTime;
    return model.messageTime - lastTimeInterval > self.showTimeInterval;
}

- (NSTimeInterval)firstTimeInterval
{
    if (!self.items.count) {
        return 0;
    }
    BBBMessageModel *model;
    if (![self.dataProvider respondsToSelector:@selector(needTimetag)] || self.dataProvider.needTimetag) {
        model = self.items[1];
    }else
    {
        model = self.items[0];
    }
    return model.messageTime;
}

@end
