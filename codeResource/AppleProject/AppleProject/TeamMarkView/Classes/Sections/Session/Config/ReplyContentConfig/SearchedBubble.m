// __DEBUG__
// __CLOSE_PRINT__
//
//  SearchedBubble.m
// Indicator
//
//  Created by He on 2020/3/25.
//  Copyright © 2020 NetEase. All rights reserved.
//

// __M_A_C_R_O__
//: #import "CCCReplyedTextContentConfig.h"
#import "SearchedBubble.h"
//: #import "M80AttributedLabel+AppleProjectKit.h"
#import "MessageEnableTextView+Indicator.h"
//: #import "AppleProjectKit.h"
#import "Indicator.h"

//: @interface CCCReplyedTextContentConfig ()
@interface SearchedBubble ()

//: @property (nonatomic,strong) M80AttributedLabel *label;
@property (nonatomic,strong) MessageEnableTextView *label;

//: @end
@end

//: @implementation CCCReplyedTextContentConfig
@implementation SearchedBubble


//: - (CGSize)contentSize:(CGFloat)cellWidth message:(NIMMessage *)message
- (CGSize)offMessage:(CGFloat)cellWidth view:(NIMMessage *)message
{
    //: NSString *text = [[AppleProjectKit sharedKit] replyedContentWithMessage:message];
    NSString *text = [[Indicator reach] limitState:message];
    //: self.label.font = [[AppleProjectKit sharedKit].config repliedSetting:message].replyedFont;
    self.label.font = [[Indicator reach].config maxDown:message].replyedFont;

    //: [self.label nim_setText:text];
    [self.label showName:text];
    //: CGFloat msgBubbleMaxWidth = (cellWidth - 130);
    CGFloat msgBubbleMaxWidth = (cellWidth - 130);
    //: CGFloat bubbleLeftToContent = 14;
    CGFloat bubbleLeftToContent = 14;
    //: CGFloat contentRightToBubble = 14;
    CGFloat contentRightToBubble = 14;
    //: CGFloat msgContentMaxWidth = (msgBubbleMaxWidth - contentRightToBubble - bubbleLeftToContent);
    CGFloat msgContentMaxWidth = (msgBubbleMaxWidth - contentRightToBubble - bubbleLeftToContent);

    //: CGSize sizeToFit = [self.label sizeThatFits:CGSizeMake(msgContentMaxWidth, 1.7976931348623157e+308)];
    CGSize sizeToFit = [self.label sizeThatFits:CGSizeMake(msgContentMaxWidth, 1.7976931348623157e+308)];
    //: return CGSizeMake(ceilf(sizeToFit.width)+2, ceilf(sizeToFit.height)+2);
    return CGSizeMake(ceilf(sizeToFit.width)+2, ceilf(sizeToFit.height)+2);
}

//: - (UIEdgeInsets)contentViewInsets:(NIMMessage *)message
- (UIEdgeInsets)pressedView:(NIMMessage *)message
{
    //: return [[AppleProjectKit sharedKit].config repliedSetting:message].contentInsets;
    return [[Indicator reach].config maxDown:message].contentInsets;
}

//: - (NSString *)cellContent:(NIMMessage *)message
- (NSString *)text:(NIMMessage *)message
{
    //: return @"CCCReplyedTextContentView";
    return @"OrientationContentView";
}

//: #pragma mark - Private
#pragma mark - Private
//: - (M80AttributedLabel *)label
- (MessageEnableTextView *)label
{
    //: if (_label) {
    if (_label) {
        //: return _label;
        return _label;
    }
    //: _label = [[M80AttributedLabel alloc] initWithFrame:CGRectZero];
    _label = [[MessageEnableTextView alloc] initWithFrame:CGRectZero];
    //: return _label;
    return _label;
}


//: @end
@end