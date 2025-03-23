// __DEBUG__
// __CLOSE_PRINT__
//
//  LanguageCenter.m
// Indicator
//
//  Created by amao on 9/15/15.
//  Copyright (c) 2015 NetEase. All rights reserved.
//

// __M_A_C_R_O__
//: #import "CCCLocationContentConfig.h"
#import "LanguageCenter.h"
//: #import "AppleProjectKit.h"
#import "Indicator.h"

//: @implementation CCCLocationContentConfig
@implementation LanguageCenter

//: - (CGSize)contentSize:(CGFloat)cellWidth message:(NIMMessage *)message
- (CGSize)offMessage:(CGFloat)cellWidth view:(NIMMessage *)message
{
    //: return CGSizeMake(110.f, 105.f);
    return CGSizeMake(110.f, 105.f);
}

//: - (NSString *)cellContent:(NIMMessage *)message
- (NSString *)text:(NIMMessage *)message
{
    //: return @"CCCSessionLocationContentView";
    return @"MessageControl";
}

//: - (UIEdgeInsets)contentViewInsets:(NIMMessage *)message
- (UIEdgeInsets)pressedView:(NIMMessage *)message
{
    //: return [[AppleProjectKit sharedKit].config setting:message].contentInsets;
    return [[Indicator reach].config info:message].contentInsets;
}

//: @end
@end