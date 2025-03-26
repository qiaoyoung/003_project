// __DEBUG__
// __CLOSE_PRINT__
//
//  RestoreView.h
//  NIM
//
//  Created by Yan Wang on 2024/9/3.
//  Copyright © 2024 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import <UIKit/UIKit.h>
#import <UIKit/UIKit.h>

//: NS_ASSUME_NONNULL_BEGIN
NS_ASSUME_NONNULL_BEGIN

//: @interface ZMONPrivacyPolicyView : UIView
@interface RestoreView : UIView

/** 动画显示 */
//: - (void)animationShow;
- (void)location;

/** 动画关闭 */
//: - (void)animationClose;
- (void)iconEnable;

//: @end
@end

//: NS_ASSUME_NONNULL_END
NS_ASSUME_NONNULL_END