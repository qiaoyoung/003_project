// __DEBUG__
// __CLOSE_PRINT__
//
//  NTESSessionFileTransDelegate.h
//  NIMDemo
//
//  Created by ght on 15-1-29.
//  Copyright (c) 2015年 Netease. All rights reserved.
//
//: #import <Foundation/Foundation.h>
#import <Foundation/Foundation.h>

// __M_A_C_R_O__

/**
 * 图片 视频等上传进度 和 语音播放等子状态回调
 */
//: @protocol NTESSessionFileStatusProtocol <NSObject>
@protocol CenterTeam <NSObject>

//: @optional
@optional
//: - (void)updateMsgSubStatusByAudio:(NSInteger)status;
- (void)updateMsgSubStatusByAudio:(NSInteger)status;

//: - (void)updateProgress:(float)progress;
- (void)updateProgress:(float)progress;


//: @end
@end