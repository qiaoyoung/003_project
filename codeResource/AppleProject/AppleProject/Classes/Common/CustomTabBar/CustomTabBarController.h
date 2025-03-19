//
//  CustomTabBarController.h
//  AppleProject
//
//  Created by AI Assistant on 2023-05-12.
//  Copyright © 2023 Netease. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomTabBar.h"

NS_ASSUME_NONNULL_BEGIN

@protocol CustomTabBarControllerDelegate <UITabBarControllerDelegate>

@optional
- (BOOL)customTabBarController:(UIViewController *)tabBarController shouldSelectViewController:(UIViewController *)viewController;
- (void)customTabBarController:(UIViewController *)tabBarController didSelectViewController:(UIViewController *)viewController;

@end

@interface CustomTabBarController : UIViewController

@property (nonatomic, strong, readonly) CustomTabBar *customTabBar;
@property (nonatomic, strong, readonly) UIView *containerView;
@property (nonatomic, copy) NSArray<__kindof UIViewController *> *viewControllers;
@property (nonatomic, weak, nullable) id<CustomTabBarControllerDelegate> delegate;
@property (nonatomic, assign) NSUInteger selectedIndex;
@property (nonatomic, strong, nullable, readonly) __kindof UIViewController *selectedViewController;

/**
 * 设置某个 tab 项的角标值
 * @param badgeValue 角标值，nil 表示隐藏角标
 * @param index tab 项的索引
 */
- (void)setBadgeValue:(nullable NSString *)badgeValue atIndex:(NSInteger)index;

@end

NS_ASSUME_NONNULL_END 