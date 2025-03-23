// __DEBUG__
// __CLOSE_PRINT__
//
//  OrientationContentView.m
// Indicator
//
//  Created by He on 2020/3/25.
//  Copyright © 2020 NetEase. All rights reserved.
//

// __M_A_C_R_O__
//: #import "CCCReplyedTextContentView.h"
#import "OrientationContentView.h"
//: #import "M80AttributedLabel+AppleProjectKit.h"
#import "MessageEnableTextView+Indicator.h"
//: #import "UIViewNimKit.h"
#import "UIViewNimKit.h"
//: #import "AppleProjectKit.h"
#import "Indicator.h"

//: @interface CCCReplyedTextContentView ()<M80AttributedLabelDelegate>
@interface OrientationContentView ()<DisableShowInput>
//: @end
@end

//: @implementation CCCReplyedTextContentView
@implementation OrientationContentView

//: - (instancetype)initSessionMessageContentView {
- (instancetype)initMessageOpen {
    //: self = [super initSessionMessageContentView];
    self = [super initMessageOpen];
    //: return self;
    return self;
}

//: - (void)refresh:(BBBMessageModel *)data {
- (void)video:(AccumulationCenter *)data {
    //: [super refresh:data];
    [super video:data];
    //: NSString *text = [[AppleProjectKit sharedKit] replyedContentWithMessage:data.repliedMessage];
    NSString *text = [[Indicator reach] limitState:data.repliedMessage];
    //: [self.textLabel nim_setText:text];
    [self.textLabel showName:text];

    //: CCCKitSetting *setting = [[AppleProjectKit sharedKit].config repliedSetting:data.message];
    CenterShould *setting = [[Indicator reach].config maxDown:data.message];
    //: self.textLabel.textColor = setting.replyedTextColor;
    self.textLabel.textColor = setting.replyedTextColor;
    //: self.textLabel.font = setting.replyedFont;
    self.textLabel.font = setting.replyedFont;
    //: [self setNeedsLayout];
    [self setNeedsLayout];
}

//: - (void)layoutSubviews{
- (void)layoutSubviews{
    //: [super layoutSubviews];
    [super layoutSubviews];
    //: UIEdgeInsets contentInsets = self.model.replyContentViewInsets;
    UIEdgeInsets contentInsets = self.model.replyContentViewInsets;

    //: CGFloat tableViewWidth = self.superview.nim_width;
    CGFloat tableViewWidth = self.superview.nim_width;
    //: CGSize contentsize = [self.model replyContentSize:tableViewWidth];
    CGSize contentsize = [self.model standard:tableViewWidth];
    //: CGRect labelFrame = CGRectMake(contentInsets.left, contentInsets.top, contentsize.width, contentsize.height);
    CGRect labelFrame = CGRectMake(contentInsets.left, contentInsets.top, contentsize.width, contentsize.height);
    //: self.textLabel.frame = labelFrame;
    self.textLabel.frame = labelFrame;
}

//: - (M80AttributedLabel *)textLabel
- (MessageEnableTextView *)textLabel
{
    //: if (!_textLabel)
    if (!_textLabel)
    {
        //: _textLabel = [[M80AttributedLabel alloc] initWithFrame:CGRectZero];
        _textLabel = [[MessageEnableTextView alloc] initWithFrame:CGRectZero];
        //: _textLabel.M80delegate = self;
        _textLabel.M80delegate = self;
        //: _textLabel.numberOfLines = 0;
        _textLabel.numberOfLines = 0;
        //: _textLabel.autoDetectLinks = NO;
        _textLabel.autoDetectLinks = NO;
        //: _textLabel.lineBreakMode = NSLineBreakByWordWrapping;
        _textLabel.lineBreakMode = NSLineBreakByWordWrapping;
        //: _textLabel.backgroundColor = [UIColor clearColor];
        _textLabel.backgroundColor = [UIColor clearColor];
        //: _textLabel.textColor = [UIColor grayColor];
        _textLabel.textColor = [UIColor grayColor];
        //: [self addSubview:_textLabel];
        [self addSubview:_textLabel];
    }

    //: return _textLabel;
    return _textLabel;
}

//: #pragma mark - M80AttributedLabelDelegate
#pragma mark - DisableShowInput
//: - (void)m80AttributedLabel:(M80AttributedLabel *)label
- (void)success:(MessageEnableTextView *)label
             //: clickedOnLink:(id)linkData{
             touch:(id)linkData{
    //: BBBKitEvent *event = [[BBBKitEvent alloc] init];
    MightHaveBeenAdd *event = [[MightHaveBeenAdd alloc] init];
    //: event.eventName = BBBKitEventNameTapLabelLink;
    event.eventName = k_managerContent;
    //: event.messageModel = self.model;
    event.messageModel = self.model;
    //: event.data = linkData;
    event.data = linkData;
    //: [self.delegate onCatchEvent:event];
    [self.delegate birthplaces:event];
}


//: - (void)onTouchUpInside:(id)sender
- (void)priceTag:(id)sender
{
    //: BBBKitEvent *event = [[BBBKitEvent alloc] init];
    MightHaveBeenAdd *event = [[MightHaveBeenAdd alloc] init];
    //: event.eventName = BBBKitEventNameTapRepliedContent;
    event.eventName = k_cropQueryVersionData;
    //: event.messageModel = self.model;
    event.messageModel = self.model;
    //: [self.delegate onCatchEvent:event];
    [self.delegate birthplaces:event];
}

//: - (void)onTouchDown:(id)sender
- (void)pyeDog:(id)sender
{

}

//: - (void)onTouchUpOutside:(id)sender{
- (void)shoulds:(id)sender{

}
//: @end
@end