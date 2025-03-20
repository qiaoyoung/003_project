// __DEBUG__
// __CLOSE_PRINT__
//
//  UIViewNimKit.h
// Indicator
//
//  Created by chris.
//  Copyright (c) 2015年 NetEase. All rights reserved.
//

// __M_A_C_R_O__
//: #import <UIKit/UIKit.h>
#import <UIKit/UIKit.h>

//: @interface UIView (AppleProjectKit)
@interface UIView (Indicator)

//: @property (nonatomic) CGFloat nim_left;
@property (nonatomic) CGFloat nim_left;

/**
 * Shortcut for frame.origin.y
 *
 * Sets frame.origin.y = top
 */
//: @property (nonatomic) CGFloat nim_top;
@property (nonatomic) CGFloat nim_top;

/**
 * Shortcut for frame.origin.x + frame.size.width
 *
 * Sets frame.origin.x = right - frame.size.width
 */
//: @property (nonatomic) CGFloat nim_right;
@property (nonatomic) CGFloat nim_right;

/**
 * Shortcut for frame.origin.y + frame.size.height
 *
 * Sets frame.origin.y = bottom - frame.size.height
 */
//: @property (nonatomic) CGFloat nim_bottom;
@property (nonatomic) CGFloat nim_bottom;

/**
 * Shortcut for frame.size.width
 *
 * Sets frame.size.width = width
 */
//: @property (nonatomic) CGFloat nim_width;
@property (nonatomic) CGFloat nim_width;

/**
 * Shortcut for frame.size.height
 *
 * Sets frame.size.height = height
 */
//: @property (nonatomic) CGFloat nim_height;
@property (nonatomic) CGFloat nim_height;

/**
 * Shortcut for center.x
 *
 * Sets center.x = centerX
 */
//: @property (nonatomic) CGFloat nim_centerX;
@property (nonatomic) CGFloat nim_centerX;

/**
 * Shortcut for center.y
 *
 * Sets center.y = centerY
 */
//: @property (nonatomic) CGFloat nim_centerY;
@property (nonatomic) CGFloat nim_centerY;
/**
 * Shortcut for frame.origin
 */
//: @property (nonatomic) CGPoint nim_origin;
@property (nonatomic) CGPoint nim_origin;

/**
 * Shortcut for frame.size
 */
//: @property (nonatomic) CGSize nim_size;
@property (nonatomic) CGSize nim_size;

//找到自己的vc
//: - (UIViewController *)nim_viewController;
- (UIViewController *)atWith;



//: @end
@end