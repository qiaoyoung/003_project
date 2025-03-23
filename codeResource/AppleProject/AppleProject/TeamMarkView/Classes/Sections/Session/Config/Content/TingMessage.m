// __DEBUG__
// __CLOSE_PRINT__
//
//  TingMessage.m
// Indicator
//
//  Created by amao on 9/15/15.
//  Copyright (c) 2015 NetEase. All rights reserved.
//

// __M_A_C_R_O__
//: #import "CCCTextContentConfig.h"
#import "TingMessage.h"
//: #import "M80AttributedLabel+AppleProjectKit.h"
#import "MessageEnableTextView+Indicator.h"
//: #import "AppleProjectKit.h"
#import "Indicator.h"

//: @interface CCCTextContentConfig()
@interface TingMessage()

//: @property (nonatomic,strong) M80AttributedLabel *label;
@property (nonatomic,strong) MessageEnableTextView *label;

//: @end
@end


//: @implementation CCCTextContentConfig
@implementation TingMessage

//: - (CGSize)contentSize:(CGFloat)cellWidth message:(NIMMessage *)message
- (CGSize)offMessage:(CGFloat)cellWidth view:(NIMMessage *)message
{
    //: NSString *text = message.text;
    NSString *text = message.text;
//    NSString *text = message.text;
//    if ([message.localExt.allKeys containsObject:@"NTESMessageTranslate"])
//    {
//        text = [NSString stringWithFormat:@"%@\n%@",text,[message.localExt objectForKey:@"NTESMessageTranslate"]];
//    }

    //: self.label.font = [[AppleProjectKit sharedKit].config setting:message].font;
    self.label.font = [[Indicator reach].config info:message].font;

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

    //: return [self.label sizeThatFits:CGSizeMake(msgContentMaxWidth, 1.7976931348623157e+308)];
    return [self.label sizeThatFits:CGSizeMake(msgContentMaxWidth, 1.7976931348623157e+308)];
}

//: - (NSString *)cellContent:(NIMMessage *)message
- (NSString *)text:(NIMMessage *)message
{
    //: return @"CCCSessionTextContentView";
    return @"AggregationView";
}

//: - (UIEdgeInsets)contentViewInsets:(NIMMessage *)message
- (UIEdgeInsets)pressedView:(NIMMessage *)message
{
    //: return [[AppleProjectKit sharedKit].config setting:message].contentInsets;
    return [[Indicator reach].config info:message].contentInsets;
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