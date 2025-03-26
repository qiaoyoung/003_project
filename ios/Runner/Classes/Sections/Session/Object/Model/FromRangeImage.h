// __DEBUG__
// __CLOSE_PRINT__
//
//  FromRangeImage.h
//  NIM
//
//  Created by zhanggenning on 2019/10/18.
//  Copyright © 2019 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import <Foundation/Foundation.h>
#import <Foundation/Foundation.h>

//: @class NTESMessageModel;
@class TeamMessageModel;
//: @class NTESMultiRetweetAttachment;
@class AttachmentHide;

//: NS_ASSUME_NONNULL_BEGIN
NS_ASSUME_NONNULL_BEGIN

//: @interface NTESMergeMessageDataSource : NSObject
@interface FromRangeImage : NSObject

//: @property (nonatomic, strong) NSMutableArray<NTESMessageModel *> *items;
@property (nonatomic, strong) NSMutableArray<TeamMessageModel *> *items;

//: - (void)pullDataWithAttachment:(NTESMultiRetweetAttachment *)attachment
- (void)pin:(AttachmentHide *)attachment
                    //: completion:(void (^)(NSString *msg))complete;
                    powerCell:(void (^)(NSString *msg))complete;

//: - (NSIndexPath * _Nullable)updateMessage:(NIMMessage *)message;
- (NSIndexPath * _Nullable)month:(NIMMessage *)message;

//: - (NTESMessageModel *)setupMessageModel:(NIMMessage *)message;
- (TeamMessageModel *)indexShadow:(NIMMessage *)message;

//: - (NSMutableArray<NTESMessageModel *> *)itemsWithMessages:(NSMutableArray <NIMMessage *> *)messages;
- (NSMutableArray<TeamMessageModel *> *)value:(NSMutableArray <NIMMessage *> *)messages;

//: @end
@end

//: NS_ASSUME_NONNULL_END
NS_ASSUME_NONNULL_END