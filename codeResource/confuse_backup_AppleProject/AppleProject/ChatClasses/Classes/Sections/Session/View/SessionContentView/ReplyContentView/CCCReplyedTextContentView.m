//
//  CCCReplyedTextContentView.m
// AppleProjectKit
//
//  Created by He on 2020/3/25.
//  Copyright © 2020 NetEase. All rights reserved.
//

#import "CCCReplyedTextContentView.h"
#import "M80AttributedLabel+AppleProjectKit.h"
#import "UIViewNimKit.h"
#import "AppleProjectKit.h"

@interface CCCReplyedTextContentView ()<M80AttributedLabelDelegate>
@end

@implementation CCCReplyedTextContentView

- (instancetype)initSessionMessageContentView {
    self = [super initSessionMessageContentView];
    return self;
}

- (void)refresh:(BBBMessageModel *)data {
    [super refresh:data];
    NSString *text = [[AppleProjectKit sharedKit] replyedContentWithMessage:data.repliedMessage];
    [self.textLabel nim_setText:text];
    
    CCCKitSetting *setting = [[AppleProjectKit sharedKit].config repliedSetting:data.message];
    self.textLabel.textColor = setting.replyedTextColor;
    self.textLabel.font = setting.replyedFont;
    [self setNeedsLayout];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    UIEdgeInsets contentInsets = self.model.replyContentViewInsets;
    
    CGFloat tableViewWidth = self.superview.nim_width;
    CGSize contentsize = [self.model replyContentSize:tableViewWidth];
    CGRect labelFrame = CGRectMake(contentInsets.left, contentInsets.top, contentsize.width, contentsize.height);
    self.textLabel.frame = labelFrame;
}

- (M80AttributedLabel *)textLabel
{
    if (!_textLabel)
    {
        _textLabel = [[M80AttributedLabel alloc] initWithFrame:CGRectZero];
        _textLabel.M80delegate = self;
        _textLabel.numberOfLines = 0;
        _textLabel.autoDetectLinks = NO;
        _textLabel.lineBreakMode = NSLineBreakByWordWrapping;
        _textLabel.backgroundColor = [UIColor clearColor];
        _textLabel.textColor = [UIColor grayColor];
        [self addSubview:_textLabel];
    }
    
    return _textLabel;
}

#pragma mark - M80AttributedLabelDelegate
- (void)m80AttributedLabel:(M80AttributedLabel *)label
             clickedOnLink:(id)linkData{
    BBBKitEvent *event = [[BBBKitEvent alloc] init];
    event.eventName = BBBKitEventNameTapLabelLink;
    event.messageModel = self.model;
    event.data = linkData;
    [self.delegate onCatchEvent:event];
}


- (void)onTouchUpInside:(id)sender
{
    BBBKitEvent *event = [[BBBKitEvent alloc] init];
    event.eventName = BBBKitEventNameTapRepliedContent;
    event.messageModel = self.model;
    [self.delegate onCatchEvent:event];
}

- (void)onTouchDown:(id)sender
{
    
}

- (void)onTouchUpOutside:(id)sender{
    
}
@end
