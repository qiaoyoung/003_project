// __DEBUG__
// __CLOSE_PRINT__
//
//  ShowTable.h
//  NIM
//
//  Created by chris on 15/9/18.
//  Copyright © 2015年 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import <UIKit/UIKit.h>
#import <UIKit/UIKit.h>

//: @interface AAAKitDevice : NSObject
@interface ShowTable : NSObject

//: + (AAAKitDevice *)currentDevice;
+ (ShowTable *)menu;

/// 语言
//: + (NSString *)language;
+ (NSString *)my;

//图片/音频推荐参数
//: - (CGFloat)suggestImagePixels;
- (CGFloat)endPixels;

//: - (CGFloat)compressQuality;
- (CGFloat)electronicNetwork;

//: - (CGFloat)statusBarHeight;
- (CGFloat)atBookHeight;

//: @end
@end