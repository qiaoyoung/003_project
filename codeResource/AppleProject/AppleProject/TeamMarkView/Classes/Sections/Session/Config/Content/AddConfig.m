// __DEBUG__
// __CLOSE_PRINT__
//
//  NIMRtcCallRecordCntentConfig.m
// Indicator
//
//  Created by Wenchao Ding on 2020/11/7.
//  Copyright © 2020 NetEase. All rights reserved.
//

// __M_A_C_R_O__
//: #import "CCCRtcCallRecordContentConfig.h"
#import "AddConfig.h"
//: #import "M80AttributedLabel+AppleProjectKit.h"
#import "MessageEnableTextView+Indicator.h"
//: #import "AppleProjectKit.h"
#import "Indicator.h"
//: #import "AAAKitUtil.h"
#import "TypicalCenter.h"

//: @implementation CCCRtcCallRecordContentConfig
@implementation AddConfig

//: - (CGSize)contentSize:(CGFloat)cellWidth message:(NIMMessage *)message
- (CGSize)offMessage:(CGFloat)cellWidth view:(NIMMessage *)message
{
    //: NSString *text = [AAAKitUtil messageTipContent:message];
    NSString *text = [TypicalCenter mode:message];
    //: UIFont *font = [[AppleProjectKit sharedKit].config setting:message].font;;
    UIFont *font = [[Indicator reach].config info:message].font;;
    //: CGFloat msgBubbleMaxWidth = (cellWidth - 130);
    CGFloat msgBubbleMaxWidth = (cellWidth - 130);
    //: CGFloat bubbleLeftToContent = 14;
    CGFloat bubbleLeftToContent = 14;
    //: CGFloat contentRightToBubble = 14;
    CGFloat contentRightToBubble = 14;
    //: CGFloat msgContentMaxWidth = (msgBubbleMaxWidth - contentRightToBubble - bubbleLeftToContent);
    CGFloat msgContentMaxWidth = (msgBubbleMaxWidth - contentRightToBubble - bubbleLeftToContent);

    //: CGSize contentSize = [text boundingRectWithSize:CGSizeMake(msgContentMaxWidth, 1.7976931348623157e+308) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: font} context:nil].size;
    CGSize contentSize = [text boundingRectWithSize:CGSizeMake(msgContentMaxWidth, 1.7976931348623157e+308) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: font} context:nil].size;
    //: contentSize.width +=25;
    contentSize.width +=25;
    //: return contentSize;
    return contentSize;
}

//: - (NSString *)cellContent:(NIMMessage *)message
- (NSString *)text:(NIMMessage *)message
{
    //: return @"CCCSessionRtcCallRecordContentView";
    return @"MessageOfView";
}

//: - (UIEdgeInsets)contentViewInsets:(NIMMessage *)message
- (UIEdgeInsets)pressedView:(NIMMessage *)message
{
    //: return [[AppleProjectKit sharedKit].config setting:message].contentInsets;
    return [[Indicator reach].config info:message].contentInsets;
}

//: @end
@end