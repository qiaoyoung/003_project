// __DEBUG__
// __CLOSE_PRINT__
//
//  SelectedConfig.m
// Indicator
//
//  Created by amao on 9/15/15.
//  Copyright (c) 2015 NetEase. All rights reserved.
//

// __M_A_C_R_O__
//: #import "CCCFileContentConfig.h"
#import "SelectedConfig.h"
//: #import "AppleProjectKit.h"
#import "Indicator.h"

//: @implementation CCCFileContentConfig
@implementation SelectedConfig

//: - (CGSize)contentSize:(CGFloat)cellWidth message:(NIMMessage *)message
- (CGSize)offMessage:(CGFloat)cellWidth view:(NIMMessage *)message
{
    //: return CGSizeMake(110, 110);
    return CGSizeMake(110, 110);
}

//: - (NSString *)cellContent:(NIMMessage *)message
- (NSString *)text:(NIMMessage *)message
{
    //: return @"CCCSessionFileTransContentView";
    return @"TitleControl";
}

//: - (UIEdgeInsets)contentViewInsets:(NIMMessage *)message
- (UIEdgeInsets)pressedView:(NIMMessage *)message
{
    //: return [[AppleProjectKit sharedKit].config setting:message].contentInsets;
    return [[Indicator reach].config info:message].contentInsets;
}



//: @end
@end