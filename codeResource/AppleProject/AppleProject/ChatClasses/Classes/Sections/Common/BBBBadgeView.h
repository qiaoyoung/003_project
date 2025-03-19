//
//  BBBBadgeView.h
// AppleProjectKit
//
//  Created by chris on 15/2/12.
//  Copyright (c) 2015年 Netease. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BBBBadgeView : UIView

//@property (nonatomic, strong) UIColor *badgeBackgroundColor;

@property (nonatomic, copy) NSString *badgeValue;

+ (instancetype)viewWithBadgeTip:(NSString *)badgeValue;


@end
