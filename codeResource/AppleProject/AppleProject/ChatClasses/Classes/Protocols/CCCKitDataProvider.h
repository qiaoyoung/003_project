//
//  CCCKitDataProvider.h
// AppleProjectKit
//
//  Created by amao on 8/13/15.
//  Copyright (c) 2015 NetEase. All rights reserved.
//

#import <Foundation/Foundation.h>

@class NIMSession;
@class CCCKitInfo;
@class BBBKitInfoFetchOption;
@class NIMMessage;

@protocol CCCKitDataProvider <NSObject>

@optional

/**
 *  上层提供用户信息的接口
 *
 *  @param userId  用户ID
 *  @param option  获取选项
 *
 *  @return 用户信息
 */
- (CCCKitInfo *)infoByUser:(NSString *)userId
                    option:(BBBKitInfoFetchOption *)option;


/**
 *  上层提供群组信息的接口
 *
 *  @param teamId 群组ID
 *  @param option 获取选项
 *
 *  @return 群组信息
 */
- (CCCKitInfo *)infoByTeam:(NSString *)teamId
                    option:(BBBKitInfoFetchOption *)option;

/**
 *  上层提供超大群组信息的接口
 *
 *  @param teamId 群组ID
 *  @param option 获取选项
 *
 *  @return 群组信息
 */
- (CCCKitInfo *)infoBySuperTeam:(NSString *)teamId
                         option:(BBBKitInfoFetchOption *)option;

/**
*  上层提供被回复消息内容给统一格式的接口
*
*  @param message 被回复的消息
*
*  @return 回复展示内容
*/
- (NSString *)replyedContentWithMessage:(NIMMessage *)message;

@end
