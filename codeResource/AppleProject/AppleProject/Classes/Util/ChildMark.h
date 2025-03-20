// __DEBUG__
// __CLOSE_PRINT__
//
//  ChildMark.h
//  NIMDemo
//
//  Created by ght on 15-1-27.
//  Copyright (c) 2015年 Netease. All rights reserved.
//
// 最近会话本地扩展标记类型

// __M_A_C_R_O__
//: #import <Foundation/Foundation.h>
#import <Foundation/Foundation.h>
//: #import <AVFoundation/AVFoundation.h>
#import <AVFoundation/AVFoundation.h>

//: typedef NS_ENUM(NSInteger, NTESRecentSessionMarkType){
typedef NS_ENUM(NSInteger, NTESRecentSessionMarkType){
    // @ 标记
    //: NTESRecentSessionMarkTypeAt,
    NTESRecentSessionMarkTypeAt,
    // 置顶标记（已废弃）
    //: NTESRecentSessionMarkTypeTop,
    NTESRecentSessionMarkTypeTop,
//: };
};

//: @interface NTESSessionUtil : NSObject
@interface ChildMark : NSObject

//: + (CGSize)getImageSizeWithImageOriginSize:(CGSize)originSize
+ (CGSize)perimeter:(CGSize)originSize
                                  //: minSize:(CGSize)imageMinSize
                                  we:(CGSize)imageMinSize
                                  //: maxSize:(CGSize)imageMaxSize;
                                  click:(CGSize)imageMaxSize;

//: + (NSString *)showNick:(NSString*)uid inSession:(NIMSession*)session;
+ (NSString *)corner:(NSString*)uid placeText:(NIMSession*)session;

//接收时间格式化
//: + (NSString*)showTime:(NSTimeInterval) msglastTime showDetail:(BOOL)showDetail;
+ (NSString*)detail:(NSTimeInterval) msglastTime file:(BOOL)showDetail;

//: + (void)sessionWithInputURL:(NSURL*)inputURL
+ (void)create:(NSURL*)inputURL
                  //: outputURL:(NSURL*)outputURL
                  with:(NSURL*)outputURL
               //: blockHandler:(void (^)(AVAssetExportSession*))handler;
               color:(void (^)(AVAssetExportSession*))handler;


//: + (NSDictionary *)dictByJsonData:(NSData *)data;
+ (NSDictionary *)size:(NSData *)data;

//: + (NSDictionary *)dictByJsonString:(NSString *)jsonString;
+ (NSDictionary *)shouldText:(NSString *)jsonString;

//: + (BOOL)canMessageBeForwarded:(NIMMessage *)message;
+ (BOOL)change:(NIMMessage *)message;

//: + (BOOL)canMessageBeRevoked:(NIMMessage *)message;
+ (BOOL)itemTo:(NIMMessage *)message;

//: + (BOOL)canMessageBeCanceled:(NIMMessage *)message;
+ (BOOL)session:(NIMMessage *)message;

//: + (NSString *)tipOnMessageRevoked:(NIMRevokeMessageNotification *)notificaton;
+ (NSString *)bubbleFileAllow:(NIMRevokeMessageNotification *)notificaton;

//: + (NSString *)tipOnMessageRevokedLocal:(NSString *)postscript;
+ (NSString *)roundBy:(NSString *)postscript;

//: + (void)addRecentSessionMark:(NIMSession *)session type:(NTESRecentSessionMarkType)type;
+ (void)magnitudeWith:(NIMSession *)session device:(NTESRecentSessionMarkType)type;

//: + (void)removeRecentSessionMark:(NIMSession *)session type:(NTESRecentSessionMarkType)type;
+ (void)member:(NIMSession *)session visualization:(NTESRecentSessionMarkType)type;

//: + (BOOL)recentSessionIsMark:(NIMRecentSession *)recent type:(NTESRecentSessionMarkType)type;
+ (BOOL)target:(NIMRecentSession *)recent extra:(NTESRecentSessionMarkType)type;



//: + (NSString *)onlineState:(NSString *)userId detail:(BOOL)detail;
+ (NSString *)nameDetail:(NSString *)userId detail:(BOOL)detail;

//: + (NSString *)formatAutoLoginMessage:(NSError *)error;
+ (NSString *)opticSurfaceSpace:(NSError *)error;

//: @end
@end