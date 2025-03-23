// __DEBUG__
// __CLOSE_PRINT__
//
//  DisableControl.m
// Indicator
//
//  Created by chris on 15/3/9.
//  Copyright (c) 2015年 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import "CCCSessionNotificationContentView.h"
#import "DisableControl.h"
//: #import "BBBMessageModel.h"
#import "AccumulationCenter.h"
//: #import "UIViewNimKit.h"
#import "UIViewNimKit.h"
//: #import "AAAKitUtil.h"
#import "TypicalCenter.h"
//: #import "UIImage+AppleProjectKit.h"
#import "UIImage+Indicator.h"
//: #import "AppleProjectKit.h"
#import "Indicator.h"

//: @implementation CCCSessionNotificationContentView
@implementation DisableControl

//: - (instancetype)initSessionMessageContentView
- (instancetype)initMessageOpen
{
    //: if (self = [super initSessionMessageContentView]) {
    if (self = [super initMessageOpen]) {
        //: _label = [[UILabel alloc] initWithFrame:CGRectZero];
        _label = [[UILabel alloc] initWithFrame:CGRectZero];
        //: _label.numberOfLines = 0;
        _label.numberOfLines = 0;
        //: [self addSubview:_label];
        [self addSubview:_label];
    }
    //: return self;
    return self;
}

//: - (void)refresh:(BBBMessageModel *)model
- (void)video:(AccumulationCenter *)model
{
    //: [super refresh:model];
    [super video:model];
    //: self.label.text = [AAAKitUtil messageTipContent:model.message];
    self.label.text = [TypicalCenter mode:model.message];
    //: CCCKitSetting *setting = [[AppleProjectKit sharedKit].config setting:model.message];
    CenterShould *setting = [[Indicator reach].config info:model.message];

    //: self.label.textColor = setting.textColor;
    self.label.textColor = setting.textColor;
    //: self.label.font = setting.font;
    self.label.font = setting.font;
    //: self.bubbleImageView.hidden = NO;
    self.bubbleImageView.hidden = NO;

//    self.label.hidden = YES;
//    self.bubbleImageView.hidden = YES;
}

//: - (void)layoutSubviews
- (void)layoutSubviews
{
    //: [super layoutSubviews];
    [super layoutSubviews];
    //: CGFloat padding = [AppleProjectKit sharedKit].config.maxNotificationTipPadding;
    CGFloat padding = [Indicator reach].config.sumRangeWindow;
    //: self.label.nim_size = [self.label sizeThatFits:CGSizeMake(self.nim_width - 2 * padding, 1.7976931348623157e+308)];
    self.label.nim_size = [self.label sizeThatFits:CGSizeMake(self.nim_width - 2 * padding, 1.7976931348623157e+308)];
    //: self.label.nim_centerX = self.nim_width * .5f;
    self.label.nim_centerX = self.nim_width * .5f;
    //: self.label.nim_centerY = self.nim_height * .5f;
    self.label.nim_centerY = self.nim_height * .5f;
    //: self.bubbleImageView.frame = CGRectInset(self.label.frame, -8, -4);
    self.bubbleImageView.frame = CGRectInset(self.label.frame, -8, -4);
}

//: @end
@end