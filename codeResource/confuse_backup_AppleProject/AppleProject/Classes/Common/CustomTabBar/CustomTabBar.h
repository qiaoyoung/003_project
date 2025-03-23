//
//  CustomTabBar.h
//  AppleProject
//
//  Created by AI Assistant on 2023-05-12.
//  Copyright © 2023 Netease. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class CustomTabBar;

@protocol CustomTabBarDelegate <NSObject>

- (void)tabBar:(CustomTabBar *)tabBar didSelectItemAtIndex:(NSInteger)index;

@end

@interface CustomTabBar : UIView

@property (nonatomic, weak) id<CustomTabBarDelegate> delegate;
@property (nonatomic, strong) NSArray<UITabBarItem *> *items;
@property (nonatomic, assign) NSInteger selectedIndex;
@property (nonatomic, strong) UIColor *itemTintColor;
@property (nonatomic, strong) UIColor *selectedItemTintColor;

/**
 * 设置某个item的badge
 */
- (void)setBadgeValue:(NSString *)badgeValue atIndex:(NSInteger)index;

/**
 * 刷新TabBar的显示
 */
- (void)refreshTabBarItems;

@end

NS_ASSUME_NONNULL_END 