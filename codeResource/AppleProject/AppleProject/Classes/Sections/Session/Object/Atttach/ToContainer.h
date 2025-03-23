// __DEBUG__
// __CLOSE_PRINT__
//
//  ToContainer.h
//  NIM
//
//  Created by 高峰 on 15/7/28.
//  Copyright (c) 2015年 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import <Foundation/Foundation.h>
#import <Foundation/Foundation.h>
//: #import "NTESCustomAttachmentDefines.h"
#import "NTESCustomAttachmentDefines.h"

//: typedef NS_ENUM(NSInteger, CustomWhiteboardFlag) {
typedef NS_ENUM(NSInteger, CustomWhiteboardFlag) {
    //: CustomWhiteboardFlagInvite = 0,
    CustomWhiteboardFlagInvite = 0,//邀请
    //: CustomWhiteboardFlagClose = 1,
    CustomWhiteboardFlagClose = 1,//关闭
//: };
};

//: @interface NTESWhiteboardAttachment : NSObject<NIMCustomAttachment,NTESCustomAttachmentInfo>
@interface ToContainer : NSObject<NIMCustomAttachment,TingChild>

//: @property (nonatomic,assign) CustomWhiteboardFlag flag;
@property (nonatomic,assign) CustomWhiteboardFlag flag;

//: @end
@end