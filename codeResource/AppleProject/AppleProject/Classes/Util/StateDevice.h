// __DEBUG__
// __CLOSE_PRINT__
//
//  StateDevice.h
//  NIM
//
//  Created by chris on 15/9/18.
//  Copyright © 2015年 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import <UIKit/UIKit.h>
#import <UIKit/UIKit.h>

//: typedef NS_ENUM(NSUInteger,NTESNetworkType) {
typedef NS_ENUM(NSUInteger,NTESNetworkType) {
    //: NTESNetworkTypeUnknown,
    NTESNetworkTypeUnknown,
    //: NTESNetworkTypeWifi,
    NTESNetworkTypeWifi,
    //: NTESNetworkTypeWwan,
    NTESNetworkTypeWwan,
    //: NTESNetworkType2G,
    NTESNetworkType2G,
    //: NTESNetworkType3G,
    NTESNetworkType3G,
    //: NTESNetworkType4G,
    NTESNetworkType4G,
//: };
};

//: @interface NTESDevice : NSObject
@interface StateDevice : NSObject

//: + (NTESDevice *)currentDevice;
+ (StateDevice *)straddle;

//图片/音频推荐参数
//: - (CGFloat)suggestImagePixels;
- (CGFloat)allowButton;

//: - (CGFloat)compressQuality;
- (CGFloat)sharedColor;

//App状态
//: - (BOOL)isUsingWifi;
- (BOOL)size;
//: - (BOOL)isInBackground;
- (BOOL)rangeWith;

//: - (NTESNetworkType)currentNetworkType;
- (NTESNetworkType)kit;
//: - (NSString *)networkStatus:(NTESNetworkType)networkType;
- (NSString *)graduateIsland:(NTESNetworkType)networkType;

//: - (NSInteger)cpuCount;
- (NSInteger)sub;

//: - (BOOL)isLowDevice;
- (BOOL)perspectiveDevice;
//: - (BOOL)isIphone;
- (BOOL)action;
//: - (NSString *)machineName;
- (NSString *)placeName;


//: - (CGFloat)statusBarHeight;
- (CGFloat)cinema;

//: @end
@end