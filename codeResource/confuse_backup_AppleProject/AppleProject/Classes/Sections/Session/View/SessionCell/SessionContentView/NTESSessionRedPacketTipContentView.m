//
//  NTESSessionRedPacketTipContentView.m
//  NIM
//
//  Created by chris on 2017/7/17.
//  Copyright © 2017年 Netease. All rights reserved.
//

#import "NTESSessionRedPacketTipContentView.h"
#import "NTESRedPacketTipAttachment.h"
#import "UIView+NTES.h"
#import "UIImage+AppleProjectKit.h"
#import "NTESCustomAttachmentDefines.h"

@interface NTESSessionRedPacketTipContentView()<M80AttributedLabelDelegate>

@end

@implementation NTESSessionRedPacketTipContentView

- (instancetype)initSessionMessageContentView
{
    if (self = [super initSessionMessageContentView]) {
        _label = [[M80AttributedLabel alloc] initWithFrame:CGRectZero];
        _label.font = [UIFont systemFontOfSize:Notification_Font_Size];
        _label.textColor = [UIColor whiteColor];;
        
        _label.backgroundColor = [UIColor clearColor];
        _label.numberOfLines = 0;
        _label.M80delegate = self;
        _label.underLineForLink = NO;
        [self addSubview:_label];
    }
    return self;
}

- (void)refresh:(BBBMessageModel *)model{
    [super refresh:model];
    NIMCustomObject *object = (NIMCustomObject *)model.message.messageObject;
    id<NTESCustomAttachmentInfo> attachment = (id<NTESCustomAttachmentInfo>)object.attachment;
    [self.label setText:nil];
    if ([attachment respondsToSelector:@selector(formatedMessage)]) {
        NSString *formatedMessage = attachment.formatedMessage;
        [self.label appendText:formatedMessage];
        NSRange range = [formatedMessage rangeOfString:@"红包".ntes_localized];
        if (range.location != NSNotFound)
        {
            //由于还有个 icon , 需要将 range 往后挪一个位置
//            range = NSMakeRange(range.location+1, range.length);
//            [self.label addCustomLink:model forRange:range linkColor:UIColorFromRGB(0x238efa)];
        }
    }
}




- (UIImage *)chatBubbleImageForState:(UIControlState)state outgoing:(BOOL)outgoing
{
    UIImage *image = [UIImage imageNamed:@"icon_session_time_bg"];
    UIEdgeInsets insets = UIEdgeInsetsFromString(@"{8,20,8,20}");
    return [image resizableImageWithCapInsets:insets resizingMode:UIImageResizingModeStretch];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat padding = 20.f;
    self.label.size = [self.label sizeThatFits:CGSizeMake(self.width - 2 * padding, CGFLOAT_MAX)];
    self.label.centerX = self.width * .5f;
    self.label.centerY = self.height * .5f;
    self.bubbleImageView.frame = CGRectInset(self.label.frame, -8, -4);
}


#pragma mark - M80AttributedLabelDelegate
- (void)m80AttributedLabel:(M80AttributedLabel *)label
             clickedOnLink:(id)linkData
{
    if ([self.delegate respondsToSelector:@selector(onCatchEvent:)]) {
        BBBKitEvent *event = [[BBBKitEvent alloc] init];
        event.eventName = NTESShowRedPacketDetailEvent;
        event.messageModel = self.model;
        event.data = self;
        [self.delegate onCatchEvent:event];
    }
}


@end
