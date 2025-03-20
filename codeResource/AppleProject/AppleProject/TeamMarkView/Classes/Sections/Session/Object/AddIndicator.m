// __DEBUG__
// __CLOSE_PRINT__
//
//  AddIndicator.m
// Indicator
//
//  Created by chris.
//  Copyright (c) 2015年 NetEase. All rights reserved.
//

// __M_A_C_R_O__
//: #import "CCCSessionMsgDatasource.h"
#import "AddIndicator.h"
//: #import "UITableView+NIMScrollToBottom.h"
#import "UITableView+NIMScrollToBottom.h"
//: #import "BBBMessageModel.h"
#import "AccumulationCenter.h"
//: #import "BBBTimestampModel.h"
#import "FromTap.h"
//: #import "UserGlobalMacro.h"
#import "UserGlobalMacro.h"
//: #import "AppleProjectKit.h"
#import "Indicator.h"
//: #import "BBBKitInfoFetchOption.h"
#import "TitleOption.h"

//: @interface CCCSessionMsgDatasource()
@interface AddIndicator()

//: @property (nonatomic,strong) id<CCCKitMessageProvider> dataProvider;
@property (nonatomic,strong) id<ShowFlush> dataProvider;

//: @property (nonatomic,strong) NSMutableDictionary *msgIdDict;
@property (nonatomic,strong) NSMutableDictionary *msgIdDict;

//: @property (nonatomic,assign) BOOL messageModelShowSelect;
@property (nonatomic,assign) BOOL messageModelShowSelect;

//: @end
@end

//: @implementation CCCSessionMsgDatasource
@implementation AddIndicator
{
    //: NIMSession *_currentSession;
    NIMSession *_currentSession;
    //: dispatch_queue_t _messageQueue;
    dispatch_queue_t _messageQueue;
}

//: - (instancetype)initWithSession:(NIMSession*)session
- (instancetype)initWithContent:(NIMSession*)session
                         //: config:(id<CCCSessionConfig>)sessionConfig
                         tap:(id<FromConfig>)sessionConfig
{
    //: if (self = [self init]) {
    if (self = [self init]) {
        //: _currentSession = session;
        _currentSession = session;
        //: _sessionConfig = sessionConfig;
        _sessionConfig = sessionConfig;
        //: id<CCCKitMessageProvider> dataProvider = [_sessionConfig respondsToSelector:@selector(messageDataProvider)] ? [_sessionConfig messageDataProvider] : nil;
        id<ShowFlush> dataProvider = [_sessionConfig respondsToSelector:@selector(distributerTing)] ? [_sessionConfig distributerTing] : nil;

        //: NSInteger limit = [AppleProjectKit sharedKit].config.messageLimit;
        NSInteger limit = [Indicator reach].config.messageLimit;
        //: NSTimeInterval showTimestampInterval = [AppleProjectKit sharedKit].config.messageInterval;
        NSTimeInterval showTimestampInterval = [Indicator reach].config.messageInterval;

        //: _dataProvider = dataProvider;
        _dataProvider = dataProvider;
        //: _messageLimit = limit;
        _messageLimit = limit;
        //: _showTimeInterval = showTimestampInterval;
        _showTimeInterval = showTimestampInterval;
        //: _items = [NSMutableArray array];
        _items = [NSMutableArray array];
        //: _msgIdDict = [NSMutableDictionary dictionary];
        _msgIdDict = [NSMutableDictionary dictionary];
        //: _pinUsers = [NSMutableDictionary dictionary];
        _pinUsers = [NSMutableDictionary dictionary];
    }
    //: return self;
    return self;
}


//: - (void)resetMessages:(void(^)(NSError *error)) handler
- (void)color:(void(^)(NSError *error)) handler
{
    //: [self enhancedResetMessages:^(NSError *error, NSArray *models) {
    [self selection:^(NSError *error, NSArray *models) {
       //: if (handler)
       if (handler)
       {
           //: handler(error);
           handler(error);
       }
    //: }];
    }];
}

//: - (void)enhancedResetMessages:(void(^)(NSError *error, NSArray *))handler
- (void)selection:(void(^)(NSError *error, NSArray *))handler
{
    //: self.items = [NSMutableArray array];
    self.items = [NSMutableArray array];
    //: self.msgIdDict = [NSMutableDictionary dictionary];
    self.msgIdDict = [NSMutableDictionary dictionary];
    //: if ([self.dataProvider respondsToSelector:@selector(pullDown:handler:)])
    if ([self.dataProvider respondsToSelector:@selector(messageHandler:brandProvideHandler:)])
    {
        //: __weak typeof(self) wself = self;
        __weak typeof(self) wself = self;
        //: [self.dataProvider pullDown:nil handler:^(NSError *error, NSArray<NIMMessage *> *messages) {
        [self.dataProvider messageHandler:nil brandProvideHandler:^(NSError *error, NSArray<NIMMessage *> *messages) {
            //: if ([NSThread isMainThread]) {^{ NSArray *models = [self modelsWithMessages:messages]; [wself appendMessageModels:models]; if (handler) { handler(error, models); } }();} else {dispatch_async(dispatch_get_main_queue(), ^{ NSArray *models = [self modelsWithMessages:messages]; [wself appendMessageModels:models]; if (handler) { handler(error, models); } });};
            if ([NSThread isMainThread]) {^{ NSArray *models = [self shadow:messages]; [wself completeSend:models]; if (handler) { handler(error, models); } }();} else {dispatch_async(dispatch_get_main_queue(), ^{ NSArray *models = [self shadow:messages]; [wself completeSend:models]; if (handler) { handler(error, models); } });};






        //: }];
        }];
    }
    //: else
    else
    {
        //: NSArray<NIMMessage *> *messages = [[[NIMSDK sharedSDK] conversationManager] messagesInSession:_currentSession
        NSArray<NIMMessage *> *messages = [[[NIMSDK sharedSDK] conversationManager] messagesInSession:_currentSession
                                                                                   //: message:nil
                                                                                   message:nil
                                                                                     //: limit:_messageLimit];
                                                                                     limit:_messageLimit];


        //: if (messages.count == 0){
        if (messages.count == 0){
            //: [self pullDown:nil handler:^(NSError *error, NSArray<NIMMessage *> *messages) {
            [self messageHandler:nil brandProvideHandler:^(NSError *error, NSArray<NIMMessage *> *messages) {
                //: NSArray *models = [self modelsWithMessages:messages];
                NSArray *models = [self shadow:messages];
                //: [self appendMessageModels:models];
                [self completeSend:models];
                //: if (handler) {
                if (handler) {
                    //: handler(nil,models);
                    handler(nil,models);
                }
            //: }];
            }];
            //: return;
            return;
        }

        //: NSArray *models = [self modelsWithMessages:messages];
        NSArray *models = [self shadow:messages];
        //: [self appendMessageModels:models];
        [self completeSend:models];
        //: if (handler) {
        if (handler) {
            //: handler(nil,models);
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
//: - (NSInteger)insertMessages:(NSArray *)messages{
- (NSInteger)light:(NSArray *)messages{
    //: NSInteger count = self.items.count;
    NSInteger count = self.items.count;
    //: for (NIMMessage *message in messages.reverseObjectEnumerator.allObjects) {
    for (NIMMessage *message in messages.reverseObjectEnumerator.allObjects) {
        //: [self insertMessage:message];
        [self tool:message];
    }
    //: NSInteger currentIndex = self.items.count - 1;
    NSInteger currentIndex = self.items.count - 1;
    //: return currentIndex - count;
    return currentIndex - count;
}

/**
 *  从后插入消息
 *
 *  @param models 消息集合
 *
 *  @return 插入的消息的index
 */
//: - (NSArray *)appendMessageModels:(NSArray *)models{
- (NSArray *)completeSend:(NSArray *)models{
    //: if (!models.count) {
    if (!models.count) {
        //: return @[];
        return @[];
    }
    //: NSMutableArray *append = [[NSMutableArray alloc] init];
    NSMutableArray *append = [[NSMutableArray alloc] init];
    //: for (BBBMessageModel *model in models) {
    for (AccumulationCenter *model in models) {
        //: if ([self modelIsExist:model]) {
        if ([self submit:model]) {
            //: continue;
            continue;
        }
        //: NSArray *result = [self insertMessageModel:model index:self.items.count];
        NSArray *result = [self by:model assemblage:self.items.count];
        //: [append addObjectsFromArray:result];
        [append addObjectsFromArray:result];
    }
    //: return append;
    return append;
}


/**
 *  从中间插入消息
 *
 *  @param models 消息集合
 *
 *  @return 插入消息的index
 */
//: - (NSArray *)insertMessageModels:(NSArray *)models{
- (NSArray *)attachModels:(NSArray *)models{
    //: if (!models.count) {
    if (!models.count) {
        //: return @[];
        return @[];
    }
    //: NSMutableArray *insert = [[NSMutableArray alloc] init];
    NSMutableArray *insert = [[NSMutableArray alloc] init];
    //由于找到插入位置后会直接插入，所以这里按时间戳大小先排个序，避免造成先插了时间大的，再插了时间小的，导致之前时间大的消息的位置还需要后移的情况.
    //: NSArray *sortModels = [models sortedArrayUsingComparator:^NSComparisonResult(id _Nonnull obj1, id _Nonnull obj2) {
    NSArray *sortModels = [models sortedArrayUsingComparator:^NSComparisonResult(id _Nonnull obj1, id _Nonnull obj2) {
        //: BBBMessageModel *first = obj1;
        AccumulationCenter *first = obj1;
        //: BBBMessageModel *second = obj2;
        AccumulationCenter *second = obj2;
        //: return first.messageTime < second.messageTime ? NSOrderedAscending : NSOrderedDescending;
        return first.messageTime < second.messageTime ? NSOrderedAscending : NSOrderedDescending;
    //: }];
    }];
    //: for (BBBMessageModel *model in sortModels) {
    for (AccumulationCenter *model in sortModels) {
        //: if ([self modelIsExist:model]) {
        if ([self submit:model]) {
            //: continue;
            continue;
        }

        //: NSInteger i = [self findInsertPosistion:model];
        NSInteger i = [self doContent:model];
        //: NSArray *result = [self insertMessageModel:model index:i];
        NSArray *result = [self by:model assemblage:i];
        //: [insert addObjectsFromArray:result];
        [insert addObjectsFromArray:result];
    }
    //: return insert;
    return insert;
}


//: - (NSInteger)indexAtModelArray:(BBBMessageModel *)model
- (NSInteger)extraArray:(AccumulationCenter *)model
{
    //: __block NSInteger index = -1;
    __block NSInteger index = -1;
    //: if (![_msgIdDict objectForKey:model.message.messageId]) {
    if (![_msgIdDict objectForKey:model.message.messageId]) {
        //: return index;
        return index;
    }
    //: [self.items enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
    [self.items enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        //: if ([obj isKindOfClass:[BBBMessageModel class]]) {
        if ([obj isKindOfClass:[AccumulationCenter class]]) {
            //: if ([model isEqual:obj]) {
            if ([model isEqual:obj]) {
                //: index = idx;
                index = idx;
                //: *stop = YES;
                *stop = YES;
            }
        }
    //: }];
    }];
    //: return index;
    return index;
}

//: #pragma mark - msg
#pragma mark - msg

//: - (BOOL)modelIsExist:(BBBMessageModel *)model
- (BOOL)submit:(AccumulationCenter *)model
{
    //: return [_msgIdDict objectForKey:model.message.messageId] != nil;
    return [_msgIdDict objectForKey:model.message.messageId] != nil;
}


//: - (void)loadHistoryMessagesWithComplete:(void(^)(NSInteger index, NSArray *messages , NSError *error))handler
- (void)quick:(void(^)(NSInteger index, NSArray *messages , NSError *error))handler
{
    //: __block BBBMessageModel *currentOldestMsg = nil;
    __block AccumulationCenter *currentOldestMsg = nil;
    //: [self.items enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
    [self.items enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        //: if ([obj isKindOfClass:[BBBMessageModel class]]) {
        if ([obj isKindOfClass:[AccumulationCenter class]]) {
            //: currentOldestMsg = (BBBMessageModel*)obj;
            currentOldestMsg = (AccumulationCenter*)obj;
            //: *stop = YES;
            *stop = YES;
        }
    //: }];
    }];
    //: __block NSInteger index = 0;
    __block NSInteger index = 0;
    //: if ([self.dataProvider respondsToSelector:@selector(pullDown:handler:)])
    if ([self.dataProvider respondsToSelector:@selector(messageHandler:brandProvideHandler:)])
    {
        //: [self.dataProvider pullDown:currentOldestMsg.message handler:^(NSError *error, NSArray *messages) {
        [self.dataProvider messageHandler:currentOldestMsg.message brandProvideHandler:^(NSError *error, NSArray *messages) {
            //: if ([NSThread isMainThread]) {^{ if (handler) { handler(index,messages,error); } }();} else {dispatch_async(dispatch_get_main_queue(), ^{ if (handler) { handler(index,messages,error); } });};
            if ([NSThread isMainThread]) {^{ if (handler) { handler(index,messages,error); } }();} else {dispatch_async(dispatch_get_main_queue(), ^{ if (handler) { handler(index,messages,error); } });};




        //: }];
        }];
        //: return;
        return;
    }
    //: else
    else
    {
        //: NSArray *messages = [[[NIMSDK sharedSDK] conversationManager] messagesInSession:_currentSession
        NSArray *messages = [[[NIMSDK sharedSDK] conversationManager] messagesInSession:_currentSession
                                                                                //: message:currentOldestMsg.message
                                                                                message:currentOldestMsg.message
                                                                                  //: limit:self.messageLimit];
                                                                                  limit:self.messageLimit];

        //: if (messages.count == 0){
        if (messages.count == 0){
            /// 如果本地db 消息为空，读服务端会话
            //: [self pullDown:currentOldestMsg.message handler:^(NSError *error, NSArray<NIMMessage *> *messages) {
            [self messageHandler:currentOldestMsg.message brandProvideHandler:^(NSError *error, NSArray<NIMMessage *> *messages) {
                //: index = [self insertMessages:messages];
                index = [self light:messages];
                //: if (handler) {
                if (handler) {
                    //: handler(index,messages,nil);
                    handler(index,messages,nil);
                }
            //: }];
            }];
            //: return;
            return;
        }

        //: index = [self insertMessages:messages];
        index = [self light:messages];
        //: if (handler) {
        if (handler) {
            //: if ([NSThread isMainThread]) {^{ handler(index,messages,nil); }();} else {dispatch_async(dispatch_get_main_queue(), ^{ handler(index,messages,nil); });};
            if ([NSThread isMainThread]) {^{ handler(index,messages,nil); }();} else {dispatch_async(dispatch_get_main_queue(), ^{ handler(index,messages,nil); });};


        }
    }
}

//: - (void)pullDown:(NIMMessage *)firstMessage handler:(NIMKitDataProvideHandler)handler{
- (void)messageHandler:(NIMMessage *)firstMessage brandProvideHandler:(NIMKitDataProvideHandler)handler{
    //: [self remoteFetchMessage:firstMessage handler:handler];
    [self remoteInfo:firstMessage impregnateProvideHandler:handler];
}

//: - (void)remoteFetchMessage:(NIMMessage *)message
- (void)remoteInfo:(NIMMessage *)message
                   //: handler:(NIMKitDataProvideHandler)handler
                   impregnateProvideHandler:(NIMKitDataProvideHandler)handler
{
    //: NIMHistoryMessageSearchOption *searchOpt = [[NIMHistoryMessageSearchOption alloc] init];
    NIMHistoryMessageSearchOption *searchOpt = [[NIMHistoryMessageSearchOption alloc] init];
    //: searchOpt.startTime = 0;
    searchOpt.startTime = 0;
    //: searchOpt.endTime = message.timestamp;
    searchOpt.endTime = message.timestamp;
    //: searchOpt.currentMessage = message;
    searchOpt.currentMessage = message;
    //: searchOpt.limit = 20;
    searchOpt.limit = 20;
    //: [[NIMSDK sharedSDK].conversationManager fetchMessageHistory:_currentSession option:searchOpt result:^(NSError *error, NSArray *messages) {
    [[NIMSDK sharedSDK].conversationManager fetchMessageHistory:_currentSession option:searchOpt result:^(NSError *error, NSArray *messages) {
        //: if (handler) {
        if (handler) {
            //: handler(error,messages.reverseObjectEnumerator.allObjects);
            handler(error,messages.reverseObjectEnumerator.allObjects);
        //: };
        };
    //: }];
    }];
}

//: - (void)loadPullUpMessagesWithComplete:(void (^)(NSInteger, NSArray *, NSError *))handler {
- (void)custom:(void (^)(NSInteger, NSArray *, NSError *))handler {
    //: __block BBBMessageModel *currentNewestMsg = self.items.lastObject;
    __block AccumulationCenter *currentNewestMsg = self.items.lastObject;
    //: __block NSInteger index = 0;
    __block NSInteger index = 0;
    //: NIMMessageSearchOption *option = [NIMMessageSearchOption new];
    NIMMessageSearchOption *option = [NIMMessageSearchOption new];
    //: option.startTime = currentNewestMsg.messageTime - 0.1;
    option.startTime = currentNewestMsg.messageTime - 0.1;
    //: option.limit = [AppleProjectKit sharedKit].config.messageLimit;
    option.limit = [Indicator reach].config.messageLimit;
    //: option.allMessageTypes = YES;
    option.allMessageTypes = YES;
    //: option.order = NIMMessageSearchOrderAsc;
    option.order = NIMMessageSearchOrderAsc;
    //: __weak typeof(self) wself = self;
    __weak typeof(self) wself = self;
    //: [[NIMSDK sharedSDK].conversationManager searchMessages:_currentSession
    [[NIMSDK sharedSDK].conversationManager searchMessages:_currentSession
                                                    //: option:option
                                                    option:option
                                                    //: result:^(NSError * _Nullable error, NSArray<NIMMessage *> * _Nullable messages) {
                                                    result:^(NSError * _Nullable error, NSArray<NIMMessage *> * _Nullable messages) {
                                                        //: index = [wself appendMessageModels:[self modelsWithMessages:messages]].count;
                                                        index = [wself completeSend:[self shadow:messages]].count;
                                                        //: if (handler) {
                                                        if (handler) {
                                                            //: if ([NSThread isMainThread]) {^{ handler(index,messages,nil); }();} else {dispatch_async(dispatch_get_main_queue(), ^{ handler(index,messages,nil); });};
                                                            if ([NSThread isMainThread]) {^{ handler(index,messages,nil); }();} else {dispatch_async(dispatch_get_main_queue(), ^{ handler(index,messages,nil); });};


                                                        }
                                                    //: }];
                                                    }];
}

//: - (void)loadMessagePins:(void (^)(NSError *))handler
- (void)heather:(void (^)(NSError *))handler
{
    //: [NIMSDK.sharedSDK.chatExtendManager loadMessagePinsForSession:_currentSession completion:^(NSError * _Nonnull error, NSArray<NIMMessagePinItem *> * _Nullable items) {
    [NIMSDK.sharedSDK.chatExtendManager loadMessagePinsForSession:_currentSession completion:^(NSError * _Nonnull error, NSArray<NIMMessagePinItem *> * _Nullable items) {
        //: [items enumerateObjectsUsingBlock:^(NIMMessagePinItem * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [items enumerateObjectsUsingBlock:^(NIMMessagePinItem * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            //: NSString *pinUserID = obj.accountID ?: NIMSDK.sharedSDK.loginManager.currentAccount;
            NSString *pinUserID = obj.accountID ?: NIMSDK.sharedSDK.loginManager.currentAccount;
            //: BBBKitInfoFetchOption *option = [[BBBKitInfoFetchOption alloc] init];
            TitleOption *option = [[TitleOption alloc] init];
            //: option.session = _currentSession;
            option.session = _currentSession;
            //: self.pinUsers[obj.messageId] = [AppleProjectKit.sharedKit infoByUser:pinUserID option:option].showName;
            self.pinUsers[obj.messageId] = [Indicator.reach indoors:pinUserID harvest:option].showName;
        //: }];
        }];
        //: if (handler) {
        if (handler) {
            //: handler(nil);
            handler(nil);
        }
    //: }];
    }];
}

//: - (NSArray*)deleteMessageModel:(BBBMessageModel *)msgModel
- (NSArray*)dayDrop:(AccumulationCenter *)msgModel
{
    //: NSMutableArray *dels = [NSMutableArray array];
    NSMutableArray *dels = [NSMutableArray array];
    //: NSInteger delTimeIndex = -1;
    NSInteger delTimeIndex = -1;
    //: NSInteger delMsgIndex = [self.items indexOfObject:msgModel];
    NSInteger delMsgIndex = [self.items indexOfObject:msgModel];
    //: if (delMsgIndex > 0) {
    if (delMsgIndex > 0) {
        //: BOOL delMsgIsSingle = (delMsgIndex == self.items.count-1 || [self.items[delMsgIndex+1] isKindOfClass:[BBBTimestampModel class]]);
        BOOL delMsgIsSingle = (delMsgIndex == self.items.count-1 || [self.items[delMsgIndex+1] isKindOfClass:[FromTap class]]);
        //: if ([self.items[delMsgIndex-1] isKindOfClass:[BBBTimestampModel class]] && delMsgIsSingle) {
        if ([self.items[delMsgIndex-1] isKindOfClass:[FromTap class]] && delMsgIsSingle) {
            //: delTimeIndex = delMsgIndex-1;
            delTimeIndex = delMsgIndex-1;
            //: [self.items removeObjectAtIndex:delTimeIndex];
            [self.items removeObjectAtIndex:delTimeIndex];
            //: [dels addObject:@(delTimeIndex)];
            [dels addObject:@(delTimeIndex)];
        }
    }
    //: if (delMsgIndex > -1) {
    if (delMsgIndex > -1) {
        //: [self.items removeObject:msgModel];
        [self.items removeObject:msgModel];
        //: [_msgIdDict removeObjectForKey:msgModel.message.messageId];
        [_msgIdDict removeObjectForKey:msgModel.message.messageId];
        //: [dels addObject:@(delMsgIndex)];
        [dels addObject:@(delMsgIndex)];
    }
    //: return dels;
    return dels;
}

//: - (NSArray<NSIndexPath *> *)deleteModels:(NSRange)range
- (NSArray<NSIndexPath *> *)presentText:(NSRange)range
{
    //: NSArray *models = [self.items subarrayWithRange:range];
    NSArray *models = [self.items subarrayWithRange:range];
    //: NSMutableArray *dels = [NSMutableArray array];
    NSMutableArray *dels = [NSMutableArray array];
    //: NSMutableArray *all = [NSMutableArray arrayWithArray:self.items];
    NSMutableArray *all = [NSMutableArray arrayWithArray:self.items];
    //: for (BBBMessageModel *model in models) {
    for (AccumulationCenter *model in models) {
        //: if ([model isKindOfClass:[BBBTimestampModel class]]) {
        if ([model isKindOfClass:[FromTap class]]) {
            //: continue;
            continue;
        }
        //: NSInteger delTimeIndex = -1;
        NSInteger delTimeIndex = -1;
        //: NSInteger delMsgIndex = [all indexOfObject:model];
        NSInteger delMsgIndex = [all indexOfObject:model];
        //: if (delMsgIndex > 0) {
        if (delMsgIndex > 0) {
            //: BOOL delMsgIsSingle = (delMsgIndex == all.count-1 || [all[delMsgIndex+1] isKindOfClass:[BBBTimestampModel class]]);
            BOOL delMsgIsSingle = (delMsgIndex == all.count-1 || [all[delMsgIndex+1] isKindOfClass:[FromTap class]]);
            //: if ([all[delMsgIndex-1] isKindOfClass:[BBBTimestampModel class]] && delMsgIsSingle) {
            if ([all[delMsgIndex-1] isKindOfClass:[FromTap class]] && delMsgIsSingle) {
                //: delTimeIndex = delMsgIndex-1;
                delTimeIndex = delMsgIndex-1;
                //: [self.items removeObjectAtIndex:delTimeIndex];
                [self.items removeObjectAtIndex:delTimeIndex];
                //: NSIndexPath *indexpath = [NSIndexPath indexPathForRow:delTimeIndex inSection:0];
                NSIndexPath *indexpath = [NSIndexPath indexPathForRow:delTimeIndex inSection:0];
                //: [dels addObject:indexpath];
                [dels addObject:indexpath];
            }
        }
        //: if (delMsgIndex > -1) {
        if (delMsgIndex > -1) {
            //: [self.items removeObject:model];
            [self.items removeObject:model];
            //: [_msgIdDict removeObjectForKey:model.message.messageId];
            [_msgIdDict removeObjectForKey:model.message.messageId];
            //: NSIndexPath *indexpath = [NSIndexPath indexPathForRow:delMsgIndex inSection:0];
            NSIndexPath *indexpath = [NSIndexPath indexPathForRow:delMsgIndex inSection:0];
            //: [dels addObject:indexpath];
            [dels addObject:indexpath];
        }
    }
    //: return dels;
    return dels;
}

//: - (void)cleanCache
- (void)distanceCache
{
    //: for (id item in self.items)
    for (id item in self.items)
    {
        //: if ([item isKindOfClass:[BBBMessageModel class]])
        if ([item isKindOfClass:[AccumulationCenter class]])
        {
            //: BBBMessageModel *model = (BBBMessageModel *)item;
            AccumulationCenter *model = (AccumulationCenter *)item;
            //: [model cleanCache];
            [model cell];
        }
    }
}

//: - (void)refreshMessageModelShowSelect:(BOOL)isShow {
- (void)message:(BOOL)isShow {
    //: _messageModelShowSelect = isShow;
    _messageModelShowSelect = isShow;

    //: for (id item in self.items)
    for (id item in self.items)
    {
        //: if ([item isKindOfClass:[BBBMessageModel class]])
        if ([item isKindOfClass:[AccumulationCenter class]])
        {
            //: BBBMessageModel *model = (BBBMessageModel *)item;
            AccumulationCenter *model = (AccumulationCenter *)item;
            //: model.shouldShowSelect = isShow;
            model.shouldShowSelect = isShow;
            //: model.selected = NO;
            model.selected = NO;
            //: if ([_sessionConfig respondsToSelector:@selector(disableSelectedForMessage:)]) {
            if ([_sessionConfig respondsToSelector:@selector(searched:)]) {
                //: model.disableSelected = [_sessionConfig disableSelectedForMessage:model.message];;
                model.disableSelected = [_sessionConfig searched:model.message];;
            }
            //: if ([_sessionConfig respondsToSelector:@selector(needShowReplyContent)]) {
            if ([_sessionConfig respondsToSelector:@selector(requestTable)]) {
                //: model.enableRepliedContent = [_sessionConfig needShowReplyContent];
                model.enableRepliedContent = [_sessionConfig requestTable];
            }
            //: if ([_sessionConfig respondsToSelector:@selector(needShowQuickComments)]) {
            if ([_sessionConfig respondsToSelector:@selector(sizeAcross)]) {
                //: model.enableQuickComments = [_sessionConfig needShowQuickComments];
                model.enableQuickComments = [_sessionConfig sizeAcross];
            }
        }
    }
}

//: - (void)willDisplayMessageModel:(BBBMessageModel *)model
- (void)posture:(AccumulationCenter *)model
{
    //: if ([_sessionConfig respondsToSelector:@selector(shouldShowPinContent)]) {
    if ([_sessionConfig respondsToSelector:@selector(darkGreen)]) {
        //: model.shouldShowPinContent = [_sessionConfig shouldShowPinContent];
        model.shouldShowPinContent = [_sessionConfig darkGreen];
    }
    //: model.pinUserName = self.pinUsers[model.message.messageId];
    model.pinUserName = self.pinUsers[model.message.messageId];
}

//: - (void)addPinForMessage:(NIMMessage *)message callback:(void (^)(NSError *))handler
- (void)to:(NIMMessage *)message telegram:(void (^)(NSError *))handler
{
    //: if (!message) {
    if (!message) {
        //: !handler ?: handler(nil);
        !handler ?: handler(nil);
        //: return;
        return;
    }
    //: NIMMessagePinItem *item = [NIMSDK.sharedSDK.chatExtendManager pinItemForMessage:message];
    NIMMessagePinItem *item = [NIMSDK.sharedSDK.chatExtendManager pinItemForMessage:message];
    //: NSString *accountID = item.accountID ?: NIMSDK.sharedSDK.loginManager.currentAccount;
    NSString *accountID = item.accountID ?: NIMSDK.sharedSDK.loginManager.currentAccount;
    //: BBBKitInfoFetchOption *option = [[BBBKitInfoFetchOption alloc] init];
    TitleOption *option = [[TitleOption alloc] init];
    //: option.session = message.session;
    option.session = message.session;
    //: NSString *pinUserName = [AppleProjectKit.sharedKit infoByUser:accountID option:option].showName;
    NSString *pinUserName = [Indicator.reach indoors:accountID harvest:option].showName;
    //: self.pinUsers[message.messageId] = pinUserName;
    self.pinUsers[message.messageId] = pinUserName;
    //: !handler ?: handler(nil);
    !handler ?: handler(nil);
}

//: - (void)removePinForMessage:(NIMMessage *)message callback:(void (^)(NSError *))handler
- (void)show:(NIMMessage *)message searchedCallback:(void (^)(NSError *))handler
{
    //: if (message) {
    if (message) {
        //: self.pinUsers[message.messageId] = nil;
        self.pinUsers[message.messageId] = nil;
    }
    //: !handler ?: handler(nil);
    !handler ?: handler(nil);
}

//: #pragma mark - private methods
#pragma mark - private methods
//: - (void)insertMessage:(NIMMessage *)message{
- (void)tool:(NIMMessage *)message{
    //: BBBMessageModel *model = [[BBBMessageModel alloc] initWithMessage:message];
    AccumulationCenter *model = [[AccumulationCenter alloc] initWithDisplacement:message];
    //: model.shouldShowSelect = _messageModelShowSelect;
    model.shouldShowSelect = _messageModelShowSelect;
    //: if ([_sessionConfig respondsToSelector:@selector(disableSelectedForMessage:)]) {
    if ([_sessionConfig respondsToSelector:@selector(searched:)]) {
        //: model.disableSelected = [_sessionConfig disableSelectedForMessage:model.message];;
        model.disableSelected = [_sessionConfig searched:model.message];;
    }
    //: if ([_sessionConfig respondsToSelector:@selector(enableRepliedContent)]) {
    if ([_sessionConfig respondsToSelector:@selector(enableRepliedContent)]) {
        //: model.enableRepliedContent = [_sessionConfig needShowReplyContent];
        model.enableRepliedContent = [_sessionConfig requestTable];
    }
    //: if ([_sessionConfig respondsToSelector:@selector(shouldShowPinContent)]) {
    if ([_sessionConfig respondsToSelector:@selector(darkGreen)]) {
        //: model.shouldShowPinContent = [_sessionConfig shouldShowPinContent];
        model.shouldShowPinContent = [_sessionConfig darkGreen];
    }
    //: model.pinUserName = self.pinUsers[model.message.messageId];
    model.pinUserName = self.pinUsers[model.message.messageId];
    //: if ([self modelIsExist:model]) {
    if ([self submit:model]) {
        //: return;
        return;
    }


    //: NSTimeInterval firstTimeInterval = [self firstTimeInterval];
    NSTimeInterval firstTimeInterval = [self title];
    //: if (firstTimeInterval && firstTimeInterval - model.messageTime < self.showTimeInterval) {
    if (firstTimeInterval && firstTimeInterval - model.messageTime < self.showTimeInterval) {
        //此时至少有一条消息和时间戳（如果有的话）
        //干掉时间戳（如果有的话）
        //: if ([self.items.firstObject isKindOfClass:[BBBTimestampModel class]]) {
        if ([self.items.firstObject isKindOfClass:[FromTap class]]) {
            //: [self.items removeObjectAtIndex:0];
            [self.items removeObjectAtIndex:0];
        }
    }
    //: [self.items insertObject:model atIndex:0];
    [self.items insertObject:model atIndex:0];
    //: if ((![self.dataProvider respondsToSelector:@selector(needTimetag)] || self.dataProvider.needTimetag) && self.dataProvider) {
    if ((![self.dataProvider respondsToSelector:@selector(downModel)] || self.dataProvider.downModel) && self.dataProvider) {
        //这种情况下必须要插入时间戳
        //: BBBTimestampModel *timeModel = [[BBBTimestampModel alloc] init];
        FromTap *timeModel = [[FromTap alloc] init];
        //: timeModel.messageTime = model.messageTime;
        timeModel.messageTime = model.messageTime;
        //: [self.items insertObject:timeModel atIndex:0];
        [self.items insertObject:timeModel atIndex:0];
    }
    //: [self.msgIdDict setObject:model forKey:model.message.messageId];
    [self.msgIdDict setObject:model forKey:model.message.messageId];
}


//: - (NSArray *)insertMessageModel:(BBBMessageModel *)model index:(NSInteger)index{
- (NSArray *)by:(AccumulationCenter *)model assemblage:(NSInteger)index{
    //: NSMutableArray *inserts = [[NSMutableArray alloc] init];
    NSMutableArray *inserts = [[NSMutableArray alloc] init];
    //: if (![self.dataProvider respondsToSelector:@selector(needTimetag)] || self.dataProvider.needTimetag)
    if (![self.dataProvider respondsToSelector:@selector(downModel)] || self.dataProvider.downModel)
    {
        //: if ([self shouldInsertTimestamp:model]) {
        if ([self today:model]) {
            //: BBBTimestampModel *timeModel = [[BBBTimestampModel alloc] init];
            FromTap *timeModel = [[FromTap alloc] init];
            //: timeModel.messageTime = model.messageTime;
            timeModel.messageTime = model.messageTime;
            //: [self.items insertObject:timeModel atIndex:index];
            [self.items insertObject:timeModel atIndex:index];
            //: [inserts addObject:@(index)];
            [inserts addObject:@(index)];
            //: index++;
            index++;
        }
    }
    //: [self.items insertObject:model atIndex:index];
    [self.items insertObject:model atIndex:index];
    //: [self.msgIdDict setObject:model forKey:model.message.messageId];
    [self.msgIdDict setObject:model forKey:model.message.messageId];
    //: [inserts addObject:@(index)];
    [inserts addObject:@(index)];
    //: return inserts;
    return inserts;
}

//: - (void)subHeadMessages:(NSInteger)count
- (void)background:(NSInteger)count
{
    //: NSInteger catch = 0;
    NSInteger catch = 0;
    //: NSArray *modelArray = [NSArray arrayWithArray:self.items];
    NSArray *modelArray = [NSArray arrayWithArray:self.items];
    //: for (BBBMessageModel *model in modelArray) {
    for (AccumulationCenter *model in modelArray) {
        //: if ([model isKindOfClass:[BBBMessageModel class]]) {
        if ([model isKindOfClass:[AccumulationCenter class]]) {
            //: catch++;
            catch++;
            //: [self deleteMessageModel:model];
            [self dayDrop:model];
        }
        //: if (catch == count) {
        if (catch == count) {
            //: break;
            break;
        }
    }
}

//: - (NSArray<BBBMessageModel *> *)modelsWithMessages:(NSArray<NIMMessage *> *)messages
- (NSArray<AccumulationCenter *> *)shadow:(NSArray<NIMMessage *> *)messages
{
    //: NSMutableArray *array = [[NSMutableArray alloc] init];
    NSMutableArray *array = [[NSMutableArray alloc] init];
    //: for (NIMMessage *message in messages) {
    for (NIMMessage *message in messages) {
        //: BBBMessageModel *model = [[BBBMessageModel alloc] initWithMessage:message];
        AccumulationCenter *model = [[AccumulationCenter alloc] initWithDisplacement:message];
        //: model.shouldShowSelect = _messageModelShowSelect;
        model.shouldShowSelect = _messageModelShowSelect;
        //: if ([_sessionConfig respondsToSelector:@selector(disableSelectedForMessage:)]) {
        if ([_sessionConfig respondsToSelector:@selector(searched:)]) {
            //: model.disableSelected = [_sessionConfig disableSelectedForMessage:model.message];;
            model.disableSelected = [_sessionConfig searched:model.message];;
        }
        //: if ([_sessionConfig respondsToSelector:@selector(needShowReplyContent)]) {
        if ([_sessionConfig respondsToSelector:@selector(requestTable)]) {
            //: model.enableRepliedContent = [_sessionConfig needShowReplyContent];
            model.enableRepliedContent = [_sessionConfig requestTable];
        }

        //: if ([_sessionConfig respondsToSelector:@selector(needShowQuickComments)]) {
        if ([_sessionConfig respondsToSelector:@selector(sizeAcross)]) {
            //: model.enableQuickComments = [_sessionConfig needShowQuickComments];
            model.enableQuickComments = [_sessionConfig sizeAcross];
        }
        //: if ([_sessionConfig respondsToSelector:@selector(shouldShowPinContent)]) {
        if ([_sessionConfig respondsToSelector:@selector(darkGreen)]) {
            //: model.shouldShowPinContent = [_sessionConfig shouldShowPinContent];
            model.shouldShowPinContent = [_sessionConfig darkGreen];
        }
        //: model.pinUserName = self.pinUsers[model.message.messageId];
        model.pinUserName = self.pinUsers[model.message.messageId];
        //: [array addObject:model];
        [array addObject:model];
    }
    //: return array;
    return array;
}


//: - (NSInteger)findInsertPosistion:(BBBMessageModel *)model
- (NSInteger)doContent:(AccumulationCenter *)model
{
    //: return [self findInsertPosistion:self.items model:model];
    return [self center:self.items userAcross:model];
}

//: - (NSInteger)findInsertPosistion:(NSArray *)array model:(BBBMessageModel *)model
- (NSInteger)center:(NSArray *)array userAcross:(AccumulationCenter *)model
{
    //: if (array.count == 0) {
    if (array.count == 0) {
        //即初始什么消息都没的情况下，调用了插入消息，放在第一个就好了。
        //: return 0;
        return 0;
    }
    //: if (array.count == 1) {
    if (array.count == 1) {
        //递归出口
        //: BBBMessageModel *obj = array.firstObject;
        AccumulationCenter *obj = array.firstObject;
        //: NSInteger index = [self.items indexOfObject:obj];
        NSInteger index = [self.items indexOfObject:obj];
        //: return obj.messageTime > model.messageTime? index : index+1;
        return obj.messageTime > model.messageTime? index : index+1;
    }
    //: NSInteger sep = (array.count+1) / 2;
    NSInteger sep = (array.count+1) / 2;
    //: BBBMessageModel *center = array[sep];
    AccumulationCenter *center = array[sep];
    //: NSTimeInterval timestamp = [center messageTime];
    NSTimeInterval timestamp = [center messageTime];
    //: NSArray *half;
    NSArray *half;
    //: if (timestamp <= [model messageTime]) {
    if (timestamp <= [model messageTime]) {
        //: half = [array subarrayWithRange:NSMakeRange(sep, array.count - sep)];
        half = [array subarrayWithRange:NSMakeRange(sep, array.count - sep)];
    //: }else{
    }else{
        //: half = [array subarrayWithRange:NSMakeRange(0, sep)];
        half = [array subarrayWithRange:NSMakeRange(0, sep)];
    }
    //: return [self findInsertPosistion:half model:model];
    return [self center:half userAcross:model];
}


//: - (BOOL)shouldInsertTimestamp:(BBBMessageModel *)model
- (BOOL)today:(AccumulationCenter *)model
{
    //: BBBMessageModel *lastmodel = self.items.lastObject;
    AccumulationCenter *lastmodel = self.items.lastObject;
    //: if (model.message.messageType == NIMMessageTypeCustom && model.message.messageSubType == 20) {
    if (model.message.messageType == NIMMessageTypeCustom && model.message.messageSubType == 20) {
        //: return NO;
        return NO;
    }

    //: NIMNotificationObject *object = lastmodel.message.messageObject;
    NIMNotificationObject *object = lastmodel.message.messageObject;
    //: if (object && [object isKindOfClass:NIMNotificationObject.class] && object.notificationType == NIMNotificationTypeTeam)
    if (object && [object isKindOfClass:NIMNotificationObject.class] && object.notificationType == NIMNotificationTypeTeam)
    {
        //: return NO;
        return NO;
    }

    //: NSTimeInterval lastTimeInterval = lastmodel.messageTime;
    NSTimeInterval lastTimeInterval = lastmodel.messageTime;
    //: return model.messageTime - lastTimeInterval > self.showTimeInterval;
    return model.messageTime - lastTimeInterval > self.showTimeInterval;
}

//: - (NSTimeInterval)firstTimeInterval
- (NSTimeInterval)title
{
    //: if (!self.items.count) {
    if (!self.items.count) {
        //: return 0;
        return 0;
    }
    //: BBBMessageModel *model;
    AccumulationCenter *model;
    //: if (![self.dataProvider respondsToSelector:@selector(needTimetag)] || self.dataProvider.needTimetag) {
    if (![self.dataProvider respondsToSelector:@selector(downModel)] || self.dataProvider.downModel) {
        //: model = self.items[1];
        model = self.items[1];
    //: }else
    }else
    {
        //: model = self.items[0];
        model = self.items[0];
    }
    //: return model.messageTime;
    return model.messageTime;
}

//: @end
@end
