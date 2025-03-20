// __DEBUG__
// __CLOSE_PRINT__
//
//  Maker.h
// Indicator
//
//  Created by chris.
//  Copyright (c) 2015年 NetEase. All rights reserved.
//

// __M_A_C_R_O__
//: #import <Foundation/Foundation.h>
#import <Foundation/Foundation.h>
//: #import <NIMSDK/NIMSDK.h>
#import <NIMSDK/NIMSDK.h>

//: @class AppleProjectKitLocationPoint;
@class AppleProjectKitLocationPoint;

//: @interface CCCMessageMaker : NSObject
@interface Maker : NSObject

//: + (NIMMessage*)msgWithText:(NSString *)text;
+ (NIMMessage*)streetwiseTitle:(NSString *)text;

//: + (NIMMessage *)msgWithAudio:(NSString *)filePath;
+ (NIMMessage *)image:(NSString *)filePath;

//: + (NIMMessage *)msgWithImage:(UIImage *)image;
+ (NIMMessage *)searched:(UIImage *)image;

//: + (NIMMessage *)msgWithImagePath:(NSString *)path;
+ (NIMMessage *)streetSmart:(NSString *)path;

//: + (NIMMessage *)msgWithImageData:(NSData *)data extension:(NSString *)extension;
+ (NIMMessage *)pressedText:(NSData *)data imaginationImageFrame:(NSString *)extension;

//: + (NIMMessage *)msgWithVideo:(NSString *)filePath;
+ (NIMMessage *)high:(NSString *)filePath;


//: @end
@end


//: @interface NIMCommentMaker : NSObject
@interface NameMaker : NSObject

//: + (NIMQuickComment *)commentWithType:(int64_t)type
+ (NIMQuickComment *)thread:(int64_t)type
                             //: content:(NSString *)content
                             item:(NSString *)content
                                 //: ext:(NSString *)ext;
                                 enableMy:(NSString *)ext;

//: @end
@end