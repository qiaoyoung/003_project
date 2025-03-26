// __DEBUG__
// __CLOSE_PRINT__
//
//  OfControl.m
// Indicator
//
//  Created by chris on 15/5/8.
//  Copyright (c) 2015年 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import "CCCSessionNetChatNotifyContentView.h"
#import "OfControl.h"
//: #import "M80AttributedLabel+AppleProjectKit.h"
#import "MessageEnableTextView+Indicator.h"
//: #import "BBBMessageModel.h"
#import "AccumulationCenter.h"
//: #import "AAAKitUtil.h"
#import "TypicalCenter.h"
//: #import "UIViewNimKit.h"
#import "UIViewNimKit.h"
//: #import "AppleProjectKit.h"
#import "Indicator.h"

//: @implementation CCCSessionNetChatNotifyContentView
@implementation OfControl

//: -(instancetype)initSessionMessageContentView
-(instancetype)initMessageOpen
{
    //: if (self = [super initSessionMessageContentView]) {
    if (self = [super initMessageOpen]) {
        //: _textLabel = [[M80AttributedLabel alloc] initWithFrame:CGRectZero];
        _textLabel = [[MessageEnableTextView alloc] initWithFrame:CGRectZero];
        //: _textLabel.numberOfLines = 0;
        _textLabel.numberOfLines = 0;
        //: _textLabel.autoDetectLinks = NO;
        _textLabel.autoDetectLinks = NO;
        //: _textLabel.lineBreakMode = NSLineBreakByWordWrapping;
        _textLabel.lineBreakMode = NSLineBreakByWordWrapping;
        //: _textLabel.backgroundColor = [UIColor clearColor];
        _textLabel.backgroundColor = [UIColor clearColor];
        //: [self addSubview:_textLabel];
        [self addSubview:_textLabel];
    }
    //: return self;
    return self;
}

//: - (void)refresh:(BBBMessageModel *)data
- (void)video:(AccumulationCenter *)data
{
    //: [super refresh:data];
    [super video:data];
    //: NSString *text = [AAAKitUtil messageTipContent:data.message];
    NSString *text = [TypicalCenter mode:data.message];

    //: CCCKitSetting *setting = [[AppleProjectKit sharedKit].config setting:data.message];
    CenterShould *setting = [[Indicator reach].config info:data.message];
    //: self.textLabel.textColor = setting.textColor;;
    self.textLabel.textColor = setting.textColor;;
    //: self.textLabel.font = setting.font;
    self.textLabel.font = setting.font;

    //: [self.textLabel nim_setText:text];
    [self.textLabel showName:text];


}

//: - (void)layoutSubviews{
- (void)layoutSubviews{
    //: [super layoutSubviews];
    [super layoutSubviews];
    //: UIEdgeInsets contentInsets = self.model.contentViewInsets;
    UIEdgeInsets contentInsets = self.model.contentViewInsets;
    //: CGFloat tableViewWidth = self.superview.nim_width;
    CGFloat tableViewWidth = self.superview.nim_width;
    //: CGSize contentsize = [self.model contentSize:tableViewWidth];
    CGSize contentsize = [self.model aggregation:tableViewWidth];
    //: CGRect labelFrame = CGRectMake(contentInsets.left, contentInsets.top, contentsize.width, contentsize.height);
    CGRect labelFrame = CGRectMake(contentInsets.left, contentInsets.top, contentsize.width, contentsize.height);
    //: self.textLabel.frame = labelFrame;
    self.textLabel.frame = labelFrame;
}


//: @end
@end