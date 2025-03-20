// __DEBUG__
// __CLOSE_PRINT__
//
//  MessageStatus.h
//  NIM
//
//  Created by Netease on 2019/10/17.
//  Copyright © 2019 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import <Foundation/Foundation.h>
#import <Foundation/Foundation.h>
//: #import "NTESSnapchatAttachment.h"
#import "TopOfTap.h"
//: #import "NTESJanKenPonAttachment.h"
#import "MaxOnStatusAttachment.h"
//: #import "NTESWhiteboardAttachment.h"
#import "ToContainer.h"
//: #import "NTESRedPacketAttachment.h"
#import "MarkTing.h"
//: #import "NTESRedPacketTipAttachment.h"
#import "LightNameAttachment.h"
//: #import "NTESMultiRetweetAttachment.h"
#import "AttachmentHide.h"

//: NS_ASSUME_NONNULL_BEGIN
NS_ASSUME_NONNULL_BEGIN

//: @interface NTESMessageUtil : NSObject
@interface MessageStatus : NSObject

//: + (NSString *)messageContent:(NIMMessage *)message;
+ (NSString *)textCipher:(NIMMessage *)message;

//: @end
@end

//: NS_ASSUME_NONNULL_END
NS_ASSUME_NONNULL_END