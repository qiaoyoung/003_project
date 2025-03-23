// __DEBUG__
// __CLOSE_PRINT__
//
//  UIViewController+KIViewController.h
//  Kitalker
//
//  Created by chen on 12-7-28.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//
//#import "NSObject+KIAdditions.h"
//#import "UIView+TextMax.h"

// __M_A_C_R_O__
//: #import <UIKit/UIKit.h>
#import <UIKit/UIKit.h>

//: @interface UIViewController (KIAdditions)
@interface UIViewController (TextMax)

//: - (void)showCustomBackButton;
- (void)enableLine;

//: - (void)showCustomBackButton:(SEL)selector;
- (void)customButton:(SEL)selector;

//: - (void)setNavLeftItem:(SEL)selector image:(UIImage *)image imageH:(UIImage *)imageH;
- (void)light:(SEL)selector namePlace:(UIImage *)image accountNumbereractH:(UIImage *)imageH;
//: -(void)setNavLeftItem:(SEL)selector title:(NSString *)title color:(UIColor *)color;
-(void)untilUser:(SEL)selector image:(NSString *)title state:(UIColor *)color;

//: - (void)setNavRightItem:(SEL)selector image:(UIImage *)image imageH:(UIImage *)imageH;
- (void)visualizationCustom:(SEL)selector centerItem:(UIImage *)image titleRedH:(UIImage *)imageH;
//: - (void)setNavRightItem:(SEL)selector title:(NSString *)title color:(UIColor *)color;
- (void)itemWith:(SEL)selector month:(NSString *)title selected:(UIColor *)color;
//: - (void)setTitle:(NSString *)title;
- (void)setTitle:(NSString *)title;

//: - (void)setTitleColor:(UIColor *)color;
- (void)setSet:(UIColor *)color;

//: - (void)setTitle:(NSString *)title titleColor:(UIColor *)color;
- (void)refresh:(NSString *)title rubric:(UIColor *)color;

//- (void)pushController:(UIViewController *)viewController;

//- (void)pushController:(UIViewController *)viewController animated:(BOOL)animated;

//- (void)popController;

//: - (void)dismissModalController;
- (void)container;

//: - (void)close;
- (void)voiceShow;


//: - (BOOL)findNavbarBottomLineUnder:(UIView *)view hide:(BOOL)hide;
- (BOOL)bottomColorHide:(UIView *)view crop:(BOOL)hide;



//: - (void)setNavBarBackGroundColor:(UIColor *)color;
- (void)setTempNim:(UIColor *)color;
//: - (void)setNavBarClearColor;
- (void)ting;
//: - (void)setNavBarWithAlpha:(CGFloat)alpha;
- (void)setStatusWith:(CGFloat)alpha;
//: - (UIImage *)imageWithColor:(UIColor *)color;
- (UIImage *)smartTotaleract:(UIColor *)color;

//: - (void)setShadowClearColor;
- (void)recent;



//: @end
@end