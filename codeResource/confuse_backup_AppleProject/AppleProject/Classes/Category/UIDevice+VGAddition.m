//
//  UIDevice+VGAddition.m
//  NIM
//
//  Created by 彭爽 on 2022/7/17.
//  Copyright © 2022 Netease. All rights reserved.
//

#import "UIDevice+VGAddition.h"

@implementation UIDevice (VGAddition)

/// 顶部安全区高度
+ (CGFloat)vg_safeDistanceTop {
    NSSet *set = [UIApplication sharedApplication].connectedScenes;
    UIWindowScene *windowScene = [set anyObject];
    UIWindow *window = windowScene.windows.firstObject;
    return window.safeAreaInsets.top;
}

/// 底部安全区高度
+ (CGFloat)vg_safeDistanceBottom {
    NSSet *set = [UIApplication sharedApplication].connectedScenes;
    UIWindowScene *windowScene = [set anyObject];
    UIWindow *window = windowScene.windows.firstObject;
    return window.safeAreaInsets.bottom;
}


/// 顶部状态栏高度（包括安全区）
+ (CGFloat)vg_statusBarHeight {
    
    static CGFloat statusBarHeight;
    if (statusBarHeight <= 0) {
        
        CGFloat topPadding = [UIDevice vg_safeDistanceTop];
        statusBarHeight = topPadding ? : 20.f;
    }
    
    return statusBarHeight;
}

/// 导航栏高度
+ (CGFloat)vg_navigationBarHeight {
    return 44.0f;
}

/// 状态栏+导航栏的高度
+ (CGFloat)vg_navigationFullHeight {
    return [UIDevice vg_statusBarHeight] + [UIDevice vg_navigationBarHeight];
}

/// 底部导航栏高度
+ (CGFloat)vg_tabBarHeight {
    return 49.0f;
}

/// 底部导航栏高度（包括安全区）
+ (CGFloat)vg_tabBarFullHeight {
    return [UIDevice vg_statusBarHeight] + [UIDevice vg_safeDistanceBottom];
}

@end
