//
//  CCCUnsupportContentConfig.m
// AppleProjectKit
//
//  Created by amao on 9/15/15.
//  Copyright (c) 2015 NetEase. All rights reserved.
//

#import "CCCUnsupportContentConfig.h"
#import "AppleProjectKit.h"

@interface CCCUnsupportContentConfig ()

@property (nonatomic,strong) UILabel *label;

@end

@implementation CCCUnsupportContentConfig

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        _label = [[UILabel alloc] initWithFrame:CGRectZero];
        _label.text = @"未知类型消息".nim_localized;
    }
    return self;
}

- (CGSize)contentSize:(CGFloat)cellWidth message:(NIMMessage *)message
{
    CGSize size = [self.label sizeThatFits:CGSizeMake(CGFLOAT_MAX, 40.f)];
    return CGSizeMake(size.width, 40.f);
}

- (NSString *)cellContent:(NIMMessage *)message
{
    CCCKitSetting *setting = [[AppleProjectKit sharedKit].config setting:message];
    self.label.textColor = setting.textColor;
    self.label.font = setting.font;
    
    return @"CCCSessionUnknowContentView";
}

- (UIEdgeInsets)contentViewInsets:(NIMMessage *)message
{
    CCCKitSettings *settings = message.isOutgoingMsg? [AppleProjectKit sharedKit].config.rightBubbleSettings : [AppleProjectKit sharedKit].config.leftBubbleSettings;
    return settings.unsupportSetting.contentInsets;
}

@end
