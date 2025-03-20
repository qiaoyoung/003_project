//
//  CCCSessionNotificationContentView.m
// AppleProjectKit
//
//  Created by chris on 15/3/9.
//  Copyright (c) 2015年 Netease. All rights reserved.
//

#import "CCCSessionNotificationContentView.h"
#import "BBBMessageModel.h"
#import "UIViewNimKit.h"
#import "AAAKitUtil.h"
#import "UIImage+AppleProjectKit.h"
#import "AppleProjectKit.h"

@implementation CCCSessionNotificationContentView

- (instancetype)initSessionMessageContentView
{
    if (self = [super initSessionMessageContentView]) {
        _label = [[UILabel alloc] initWithFrame:CGRectZero];
        _label.numberOfLines = 0;
        [self addSubview:_label];
    }
    return self;
}

- (void)refresh:(BBBMessageModel *)model
{
    [super refresh:model];
    self.label.text = [AAAKitUtil messageTipContent:model.message];
    CCCKitSetting *setting = [[AppleProjectKit sharedKit].config setting:model.message];
    
    self.label.textColor = setting.textColor;
    self.label.font = setting.font;
    self.bubbleImageView.hidden = NO;
    
//    self.label.hidden = YES;
//    self.bubbleImageView.hidden = YES;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat padding = [AppleProjectKit sharedKit].config.maxNotificationTipPadding;
    self.label.nim_size = [self.label sizeThatFits:CGSizeMake(self.nim_width - 2 * padding, CGFLOAT_MAX)];
    self.label.nim_centerX = self.nim_width * .5f;
    self.label.nim_centerY = self.nim_height * .5f;
    self.bubbleImageView.frame = CGRectInset(self.label.frame, -8, -4);
}

@end
