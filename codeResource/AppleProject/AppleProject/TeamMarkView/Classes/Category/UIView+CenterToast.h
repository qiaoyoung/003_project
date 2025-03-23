// __DEBUG__
// __CLOSE_PRINT__
//
//  UIView+CenterToast.h
// Indicator
//
//  Created by 丁文超 on 2020/3/19.
//  Copyright © 2020 NetEase. All rights reserved.
//

// __M_A_C_R_O__
//: #import <UIKit/UIKit.h>
#import <UIKit/UIKit.h>
//: #import <Foundation/Foundation.h>
#import <Foundation/Foundation.h>

//: NS_ASSUME_NONNULL_BEGIN
NS_ASSUME_NONNULL_BEGIN

//: @interface UIView (NIMToast)
@interface UIView (CenterToast)

/**
 * 展示一个短暂的Toast
 *
 * @param message 要展示的内容
 * @param duration 显示的时长（秒）
 */
//: - (void)nim_showToast:(NSString *)message duration:(CGFloat)duration;
- (void)origin:(NSString *)message imageMessageDuration:(CGFloat)duration;

//: @end
@end

//: NS_ASSUME_NONNULL_END
NS_ASSUME_NONNULL_END