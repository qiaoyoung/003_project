
#import <Foundation/Foundation.h>

NSString *StringFromLuckyData(Byte *data);


//: 文件解码错误
Byte str_tingInfoNameText[] = {97, 18, 34, 12, 1, 14, 61, 47, 240, 20, 168, 110, 8, 184, 169, 6, 221, 216, 10, 201, 197, 9, 194, 163, 11, 182, 187, 10, 209, 209, 42};


//: 附件下载错误
Byte str_withDateData[] = {56, 18, 96, 7, 170, 220, 2, 73, 249, 228, 68, 27, 22, 68, 24, 235, 72, 29, 29, 73, 244, 249, 72, 15, 15, 253};


//: %@。error:%zd
Byte str_wasteName[] = {18, 14, 81, 7, 233, 241, 113, 118, 145, 52, 209, 211, 182, 195, 195, 192, 195, 139, 118, 203, 181, 73};

// __DEBUG__
// __CLOSE_PRINT__
//
//  FromRangeImage.m
//  NIM
//
//  Created by zhanggenning on 2019/10/18.
//  Copyright © 2019 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import "NTESMergeMessageDataSource.h"
#import "FromRangeImage.h"
//: #import "NTESMessageSerialization.h"
#import "NameSerialization.h"
//: #import "NTESMessageModel.h"
#import "TeamMessageModel.h"
//: #import "BBBTimestampModel.h"
#import "FromTap.h"
//: #import "NTESMultiRetweetAttachment.h"
#import "AttachmentHide.h"

//: @interface NTESMergeMessageDataSource ()
@interface FromRangeImage ()

//: @property (nonatomic, assign) NSInteger currentDay;
@property (nonatomic, assign) NSInteger currentDay;
//: @property (nonatomic, strong) NTESMessageSerialization *serialization;
@property (nonatomic, strong) NameSerialization *serialization;
//: @end
@end

//: @implementation NTESMergeMessageDataSource
@implementation FromRangeImage

//: - (instancetype)init {
- (instancetype)init {
    //: if (self = [super init]) {
    if (self = [super init]) {
        //: _serialization = [[NTESMessageSerialization alloc] init];
        _serialization = [[NameSerialization alloc] init];
    }
    //: return self;
    return self;
}

//: - (void)pullDataWithAttachment:(NTESMultiRetweetAttachment *)attachment
- (void)pin:(AttachmentHide *)attachment
                    //: completion:(void (^)(NSString *msg))complete {
                    powerCell:(void (^)(NSString *msg))complete {
    //: __block NSString *msg = nil;
    __block NSString *msg = nil;
    //: NSFileManager *fm = [NSFileManager defaultManager];
    NSFileManager *fm = [NSFileManager defaultManager];
    //: BOOL isDir = NO;
    BOOL isDir = NO;
    //: NSString *filePath = attachment.filePath;
    NSString *filePath = attachment.filePath;
    //: NSString *fileUrl = attachment.url;
    NSString *fileUrl = attachment.url;
    //: BOOL fileExist = ([fm fileExistsAtPath:filePath isDirectory:&isDir] && !isDir);
    BOOL fileExist = ([fm fileExistsAtPath:filePath isDirectory:&isDir] && !isDir);
    //: __weak typeof(self) weakSelf = self;
    __weak typeof(self) weakSelf = self;
    //: if (fileExist) {
    if (fileExist) {
        //: [weakSelf.serialization decode:filePath
        [weakSelf.serialization message:filePath
                               //: encrypt:attachment.encrypted
                               pin:attachment.encrypted
                              //: password:attachment.password
                              max:attachment.password
                            //: completion:^(NSError * _Nullable error, NSMutableArray<NIMMessage *> * _Nullable messages) {
                            dateTool:^(NSError * _Nullable error, NSMutableArray<NIMMessage *> * _Nullable messages) {
            //: if (error) {
            if (error) {
                //: msg = [NSString stringWithFormat:@"%@。error:%zd",@"文件解码错误".ntes_localized, error.code];
                msg = [NSString stringWithFormat:StringFromLuckyData(str_wasteName),StringFromLuckyData(str_tingInfoNameText).language, error.code];
            //: } else {
            } else {
                //: [weakSelf checkAttachmentState:messages];
                [weakSelf margin:messages];
                //: weakSelf.items = [weakSelf itemsWithMessages:messages];
                weakSelf.items = [weakSelf value:messages];
            }
            //: if (complete) {
            if (complete) {
                //: complete(msg);
                complete(msg);
            }
        //: }];
        }];
    //: } else {
    } else {
        //: __weak typeof(self) weakSelf = self;
        __weak typeof(self) weakSelf = self;
        //: [[NIMSDK sharedSDK].resourceManager download:fileUrl filepath:filePath progress:nil completion:^(NSError * _Nullable error) {
        [[NIMSDK sharedSDK].resourceManager download:fileUrl filepath:filePath progress:nil completion:^(NSError * _Nullable error) {
            //: if (error) {
            if (error) {
                //: msg = [NSString stringWithFormat:@"%@。error:%zd",@"附件下载错误".ntes_localized, error.code];
                msg = [NSString stringWithFormat:StringFromLuckyData(str_wasteName),StringFromLuckyData(str_withDateData).language, error.code];
            //: } else {
            } else {
                //: [weakSelf.serialization decode:filePath
                [weakSelf.serialization message:filePath
                                       //: encrypt:attachment.encrypted
                                       pin:attachment.encrypted
                                      //: password:attachment.password
                                      max:attachment.password
                                    //: completion:^(NSError * _Nullable error, NSMutableArray<NIMMessage *> * _Nullable messages) {
                                    dateTool:^(NSError * _Nullable error, NSMutableArray<NIMMessage *> * _Nullable messages) {
                    //: if (error) {
                    if (error) {
                        //: msg = [NSString stringWithFormat:@"%@。error:%zd",@"文件解码错误".ntes_localized, error.code];
                        msg = [NSString stringWithFormat:StringFromLuckyData(str_wasteName),StringFromLuckyData(str_tingInfoNameText).language, error.code];
                    //: } else {
                    } else {
                        //: [weakSelf checkAttachmentState:messages];
                        [weakSelf margin:messages];
                        //: weakSelf.items = [weakSelf itemsWithMessages:messages];
                        weakSelf.items = [weakSelf value:messages];
                    }
                    //: if (complete) {
                    if (complete) {
                        //: complete(msg);
                        complete(msg);
                    }
                //: }];
                }];
            }
        //: }];
        }];
    }
}

//: - (NSIndexPath *)updateMessage:(NIMMessage *)message
- (NSIndexPath *)month:(NIMMessage *)message
{
    //: NTESMessageModel *model = nil;
    TeamMessageModel *model = nil;
    //: NSIndexPath *indexPath = nil;
    NSIndexPath *indexPath = nil;
    //: for (id item in _items) {
    for (id item in _items) {

        //: if (![item isKindOfClass:[NTESMessageModel class]]) {
        if (![item isKindOfClass:[TeamMessageModel class]]) {
            //: continue;
            continue;
        }

        //: NTESMessageModel *modelItem = (NTESMessageModel *)item;
        TeamMessageModel *modelItem = (TeamMessageModel *)item;
        //: if ([modelItem.message.messageId isEqualToString:message.messageId]) {
        if ([modelItem.message.messageId isEqualToString:message.messageId]) {
            //: model = item;
            model = item;
            //: break;
            break;
        }
    }
    //: if (model)
    if (model)
    {
        //: NTESMessageModel *target = [self setupMessageModel:message];
        TeamMessageModel *target = [self indexShadow:message];
        //: NSInteger index = [_items indexOfObject:model];
        NSInteger index = [_items indexOfObject:model];
        //: [_items replaceObjectAtIndex:index withObject:target];
        [_items replaceObjectAtIndex:index withObject:target];
        //: indexPath = [NSIndexPath indexPathForRow:index inSection:0];
        indexPath = [NSIndexPath indexPathForRow:index inSection:0];
    }
    //: return indexPath;
    return indexPath;
}

//: - (NTESMessageModel *)setupMessageModel:(NIMMessage *)message {
- (TeamMessageModel *)indexShadow:(NIMMessage *)message {
    //: NTESMessageModel *model = [[NTESMessageModel alloc] initWithMessage:message];
    TeamMessageModel *model = [[TeamMessageModel alloc] initWithDisplacement:message];
    //: model.focreShowAvatar = YES;
    model.focreShowAvatar = YES;
    //: model.focreShowNickName = YES;
    model.focreShowNickName = YES;
    //: model.focreShowLeft = YES;
    model.focreShowLeft = YES;
    //: return model;
    return model;
}

//: - (BBBTimestampModel *)setupTimeModel:(NSTimeInterval)timestamp {
- (FromTap *)twentyFourHours:(NSTimeInterval)timestamp {
    //: BBBTimestampModel *ret = [[BBBTimestampModel alloc] init];
    FromTap *ret = [[FromTap alloc] init];
    //: ret.messageTime = timestamp;
    ret.messageTime = timestamp;
    //: ret.height = 8.0f;
    ret.height = 8.0f;
    //: return ret;
    return ret;
}

//: - (NSMutableArray<NTESMessageModel *> *)itemsWithMessages:(NSMutableArray <NIMMessage *> *)messages {
- (NSMutableArray<TeamMessageModel *> *)value:(NSMutableArray <NIMMessage *> *)messages {
    //: NSMutableArray *items = [NSMutableArray array];
    NSMutableArray *items = [NSMutableArray array];

    //: __weak typeof(self) weakSelf = self;
    __weak typeof(self) weakSelf = self;
    //: [messages enumerateObjectsUsingBlock:^(NIMMessage * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
    [messages enumerateObjectsUsingBlock:^(NIMMessage * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        //: if (idx == 0) { 
        if (idx == 0) { //插入时间
            //: weakSelf.currentDay = [weakSelf getDay:obj.timestamp];
            weakSelf.currentDay = [weakSelf row:obj.timestamp];
            //: BBBTimestampModel *timeModel = [weakSelf setupTimeModel:obj.timestamp];
            FromTap *timeModel = [weakSelf twentyFourHours:obj.timestamp];
            //: [items addObject:timeModel];
            [items addObject:timeModel];

            //: NTESMessageModel *msgModel = [self setupMessageModel:obj];
            TeamMessageModel *msgModel = [self indexShadow:obj];
            //: [items addObject:msgModel];
            [items addObject:msgModel];
        //: } else if ([weakSelf needInsertTimeModel:obj]){
        } else if ([weakSelf nim:obj]){

            //: id lastMsgModel = items.lastObject;
            id lastMsgModel = items.lastObject;
            //: if ([lastMsgModel isKindOfClass:[NTESMessageModel class]]) {
            if ([lastMsgModel isKindOfClass:[TeamMessageModel class]]) {
                //: NTESMessageModel *model = (NTESMessageModel *)lastMsgModel;
                TeamMessageModel *model = (TeamMessageModel *)lastMsgModel;
                //: model.hiddenSeparatorLine = YES;
                model.hiddenSeparatorLine = YES;
            }

            //: BBBTimestampModel *timeModel = [weakSelf setupTimeModel:obj.timestamp];
            FromTap *timeModel = [weakSelf twentyFourHours:obj.timestamp];
            //: [items addObject:timeModel];
            [items addObject:timeModel];

            //: NTESMessageModel *msgModel = [self setupMessageModel:obj];
            TeamMessageModel *msgModel = [self indexShadow:obj];
            //: [items addObject:msgModel];
            [items addObject:msgModel];
        //: } else {
        } else {
            //: NTESMessageModel *msgModel = [self setupMessageModel:obj];
            TeamMessageModel *msgModel = [self indexShadow:obj];
            //: [items addObject:msgModel];
            [items addObject:msgModel];
        }
    //: }];
    }];
    //: return items;
    return items;
}

//: - (BOOL)needInsertTimeModel:(NIMMessage *)message {
- (BOOL)nim:(NIMMessage *)message {
    //: BOOL ret = NO;
    BOOL ret = NO;
    //: NSInteger currentDay = [self getDay:message.timestamp];
    NSInteger currentDay = [self row:message.timestamp];
    //: if (_currentDay != currentDay) {
    if (_currentDay != currentDay) {
        //: _currentDay = currentDay;
        _currentDay = currentDay;
        //: ret = YES;
        ret = YES;
    }
    //: return ret;
    return ret;
}

//: - (NSInteger)getDay:(NSTimeInterval)timestamp {
- (NSInteger)row:(NSTimeInterval)timestamp {
    //: NSDate *date = [NSDate dateWithTimeIntervalSince1970:timestamp];
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timestamp];
    //: NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    //: [formatter setDateFormat:@"dd"];
    [formatter setDateFormat:@"dd"];
    //: NSInteger currentDay=[[formatter stringFromDate:date] integerValue];
    NSInteger currentDay=[[formatter stringFromDate:date] integerValue];
    //: return currentDay;
    return currentDay;
}


//: - (void)checkAttachmentState:(NSArray *)messages{
- (void)margin:(NSArray *)messages{
    //: NSArray *items = [NSArray arrayWithArray:messages];
    NSArray *items = [NSArray arrayWithArray:messages];
    //: for (id item in items) {
    for (id item in items) {
        //: NIMMessage *message;
        NIMMessage *message;
        //: if ([item isKindOfClass:[NIMMessage class]]) {
        if ([item isKindOfClass:[NIMMessage class]]) {
            //: message = item;
            message = item;
        }
        //: if ([item isKindOfClass:[BBBMessageModel class]]) {
        if ([item isKindOfClass:[AccumulationCenter class]]) {
            //: message = [(BBBMessageModel *)item message];
            message = [(AccumulationCenter *)item message];
        }
        //: if (message && !message.isOutgoingMsg
        if (message && !message.isOutgoingMsg
            //: && message.attachmentDownloadState == NIMMessageAttachmentDownloadStateNeedDownload
            && message.attachmentDownloadState == NIMMessageAttachmentDownloadStateNeedDownload
            //: && message.messageType != NIMMessageTypeFile)
            && message.messageType != NIMMessageTypeFile)
        {
            //: [[NIMSDK sharedSDK].chatManager fetchMessageAttachment:message error:nil];
            [[NIMSDK sharedSDK].chatManager fetchMessageAttachment:message error:nil];
        }
    }
}

//: @end
@end

Byte * LuckyDataToCache(Byte *data) {
    int cedePlain = data[0];
    int commissionTable = data[1];
    Byte clientBloc = data[2];
    int fairHearing = data[3];
    if (!cedePlain) return data + fairHearing;
    for (int i = fairHearing; i < fairHearing + commissionTable; i++) {
        int value = data[i] - clientBloc;
        if (value < 0) {
            value += 256;
        }
        data[i] = value;
    }
    data[0] = 0;
    data[fairHearing + commissionTable] = 0;
    return data + fairHearing;
}

NSString *StringFromLuckyData(Byte *data) {
    return [NSString stringWithUTF8String:(char *)LuckyDataToCache(data)];
}
