//
//  MainTabController.h
//  NIMDemo
//
//  Created by chris on 15/2/2.
//  Copyright (c) 2015年 Netease. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppleProjectKit.h"
#import "CustomTabBarController.h"

@interface NTESMainTabController : CustomTabBarController

+ (instancetype)instance;

/**
 * 显示自定义 TabBar
 */
- (void)showTabBar;

/**
 * 隐藏自定义 TabBar
 */
- (void)hideTabBar;

@end
