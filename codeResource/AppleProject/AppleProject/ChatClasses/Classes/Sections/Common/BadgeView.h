// __DEBUG__
// __CLOSE_PRINT__
//
//  BadgeView.h
// Indicator
//
//  Created by chris on 15/2/12.
//  Copyright (c) 2015年 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import <UIKit/UIKit.h>
#import <UIKit/UIKit.h>

//: @interface BBBBadgeView : UIView
@interface BadgeView : UIView

//@property (nonatomic, strong) UIColor *badgeBackgroundColor;

//: @property (nonatomic, copy) NSString *badgeValue;
@property (nonatomic, copy) NSString *badgeValue;

//: + (instancetype)viewWithBadgeTip:(NSString *)badgeValue;
+ (instancetype)beMust:(NSString *)badgeValue;


//: @end
@end