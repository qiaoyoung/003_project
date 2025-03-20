// __DEBUG__
// __CLOSE_PRINT__
//
//  NTESSessionMsgHelper.h
//  NIMDemo
//
//  Created by ght on 15-1-28.
//  Copyright (c) 2015年 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import <Foundation/Foundation.h>
#import <Foundation/Foundation.h>
//: #import <UIKit/UIKit.h>
#import <UIKit/UIKit.h>

//: @class NTESJanKenPonAttachment;
@class MaxOnStatusAttachment;
//: @class NTESSnapchatAttachment;
@class TopOfTap;
//: @class NTESWhiteboardAttachment;
@class ToContainer;
//: @class NTESRedPacketAttachment;
@class MarkTing;
//: @class NTESRedPacketTipAttachment;
@class LightNameAttachment;
//: @class NTESMultiRetweetAttachment;
@class AttachmentHide;

//: @interface NTESSessionMsgConverter : NSObject
@interface LanguageTop : NSObject

//: + (NIMMessage *)msgWithText:(NSString *)text;
+ (NIMMessage *)text:(NSString *)text;

//: + (NIMMessage *)msgWithImage:(UIImage *)image;
+ (NIMMessage *)input:(UIImage *)image;

//: + (NIMMessage *)msgWithImagePath:(NSString *)path;
+ (NIMMessage *)state:(NSString *)path;

//: + (NIMMessage *)msgWithAudio:(NSString *)filePath;
+ (NIMMessage *)ting:(NSString *)filePath;

//: + (NIMMessage *)msgWithVideo:(NSString *)filePath;
+ (NIMMessage *)statusSave:(NSString *)filePath;

//: + (NIMMessage *)msgWithJenKenPon:(NTESJanKenPonAttachment *)attachment;
+ (NIMMessage *)link:(MaxOnStatusAttachment *)attachment;

//: + (NIMMessage *)msgWithSnapchatAttachment:(NTESSnapchatAttachment *)attachment;
+ (NIMMessage *)library:(TopOfTap *)attachment;

//: + (NIMMessage *)msgWithWhiteboardAttachment:(NTESWhiteboardAttachment *)attachment;
+ (NIMMessage *)item:(ToContainer *)attachment;

//: + (NIMMessage *)msgWithFilePath:(NSString *)path;
+ (NIMMessage *)trademark:(NSString *)path;

//: + (NIMMessage *)msgWithFileData:(NSData *)data extension:(NSString *)extension;
+ (NIMMessage *)can:(NSData *)data key:(NSString *)extension;

//: + (NIMMessage *)msgWithTip:(NSString *)tip;
+ (NIMMessage *)message:(NSString *)tip;

//: + (NIMMessage *)msgWithTip:(NSString *)tip
+ (NIMMessage *)with:(NSString *)tip
              //: revokeAttach:(NSString *)revokeAttach
              view:(NSString *)revokeAttach
         //: revokeCallbackExt:(NSString *)revokeCallbackExt;
         fundamentalCount:(NSString *)revokeCallbackExt;

//: + (NIMMessage *)msgWithRedPacket:(NTESRedPacketAttachment *)attachment;
+ (NIMMessage *)nameEnable:(MarkTing *)attachment;

//: + (NIMMessage *)msgWithRedPacketTip:(NTESRedPacketTipAttachment *)attachment;
+ (NIMMessage *)team:(LightNameAttachment *)attachment;

//: + (NIMMessage *)msgWithMultiRetweetAttachment:(NTESMultiRetweetAttachment *)attachment;
+ (NIMMessage *)reply:(AttachmentHide *)attachment;

//: + (NIMMessage *)msgWithRevocationMessage:(NIMMessage *)revocationMessage;
+ (NIMMessage *)statusText:(NIMMessage *)revocationMessage;

//: @end
@end