// __DEBUG__
// __CLOSE_PRINT__
//
//  IronedCenter.h
//  NIM
//
//  Created by Xuhui on 15/3/25.
//  Copyright (c) 2015年 Netease. All rights reserved.
//

// __M_A_C_R_O__

//: @class NTESCustomNotificationDB;
@class HideAddLight;

//: extern NSString *NTESCustomNotificationCountChanged;
extern NSString *k_versionData;

//: @interface NTESNotificationCenter : NSObject
@interface IronedCenter : NSObject

//: + (instancetype)sharedCenter;
+ (instancetype)common;
//: - (void)start;
- (void)doingLanguage;

//: @end
@end