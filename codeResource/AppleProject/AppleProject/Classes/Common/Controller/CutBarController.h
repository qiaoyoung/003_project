// __DEBUG__
// __CLOSE_PRINT__
//
//  MainTabController.h
//  NIMDemo
//
//  Created by chris on 15/2/2.
//  Copyright (c) 2015年 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import <UIKit/UIKit.h>
#import <UIKit/UIKit.h>
//: #import "AppleProjectKit.h"
#import "Indicator.h"
//: #import "CustomTabBarController.h"
#import "StatusTeamViewController.h"

//: @interface NTESMainTabController : CustomTabBarController
@interface CutBarController : StatusTeamViewController

//: + (instancetype)instance;
+ (instancetype)textInstance;

/**
 * 显示自定义 TabBar
 */
//: - (void)showTabBar;
- (void)message;

/**
 * 隐藏自定义 TabBar
 */
//: - (void)hideTabBar;
- (void)text;

//: @end
@end