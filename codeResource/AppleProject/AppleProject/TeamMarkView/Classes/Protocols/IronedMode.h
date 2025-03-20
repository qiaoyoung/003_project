// __DEBUG__
// __CLOSE_PRINT__
//
//  IronedMode.h
// Indicator
//
//  Created by amao on 8/13/15.
//  Copyright (c) 2015 NetEase. All rights reserved.
//
//: #import <Foundation/Foundation.h>
#import <Foundation/Foundation.h>

// __M_A_C_R_O__

//: @class NIMSession;
@class NIMSession;
//: @class CCCKitInfo;
@class TitleInfo;
//: @class BBBKitInfoFetchOption;
@class TitleOption;
//: @class NIMMessage;
@class NIMMessage;

//: @protocol CCCKitDataProvider <NSObject>
@protocol IronedMode <NSObject>

//: @optional
@optional

/**
 *  上层提供用户信息的接口
 *
 *  @param userId  用户ID
 *  @param option  获取选项
 *
 *  @return 用户信息
 */
//: - (CCCKitInfo *)infoByUser:(NSString *)userId
- (TitleInfo *)indoors:(NSString *)userId
                    //: option:(BBBKitInfoFetchOption *)option;
                    harvest:(TitleOption *)option;


/**
 *  上层提供群组信息的接口
 *
 *  @param teamId 群组ID
 *  @param option 获取选项
 *
 *  @return 群组信息
 */
//: - (CCCKitInfo *)infoByTeam:(NSString *)teamId
- (TitleInfo *)text:(NSString *)teamId
                    //: option:(BBBKitInfoFetchOption *)option;
                    byLabel:(TitleOption *)option;

/**
 *  上层提供超大群组信息的接口
 *
 *  @param teamId 群组ID
 *  @param option 获取选项
 *
 *  @return 群组信息
 */
//: - (CCCKitInfo *)infoBySuperTeam:(NSString *)teamId
- (TitleInfo *)noneShowOption:(NSString *)teamId
                         //: option:(BBBKitInfoFetchOption *)option;
                         viewMedia:(TitleOption *)option;

/**
*  上层提供被回复消息内容给统一格式的接口
*
*  @param message 被回复的消息
*
*  @return 回复展示内容
*/
//: - (NSString *)replyedContentWithMessage:(NIMMessage *)message;
- (NSString *)limitState:(NIMMessage *)message;

//: @end
@end