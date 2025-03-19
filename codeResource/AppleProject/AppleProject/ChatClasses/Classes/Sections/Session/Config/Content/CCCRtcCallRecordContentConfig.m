//
//  NIMRtcCallRecordCntentConfig.m
// AppleProjectKit
//
//  Created by Wenchao Ding on 2020/11/7.
//  Copyright © 2020 NetEase. All rights reserved.
//

#import "CCCRtcCallRecordContentConfig.h"
#import "M80AttributedLabel+AppleProjectKit.h"
#import "AppleProjectKit.h"
#import "AAAKitUtil.h"

@implementation CCCRtcCallRecordContentConfig

- (CGSize)contentSize:(CGFloat)cellWidth message:(NIMMessage *)message
{
    NSString *text = [AAAKitUtil messageTipContent:message];
    UIFont *font = [[AppleProjectKit sharedKit].config setting:message].font;;
    CGFloat msgBubbleMaxWidth    = (cellWidth - 130);
    CGFloat bubbleLeftToContent  = 14;
    CGFloat contentRightToBubble = 14;
    CGFloat msgContentMaxWidth = (msgBubbleMaxWidth - contentRightToBubble - bubbleLeftToContent);
    
    CGSize contentSize = [text boundingRectWithSize:CGSizeMake(msgContentMaxWidth, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: font} context:nil].size;
    contentSize.width +=25;
    return contentSize;
}

- (NSString *)cellContent:(NIMMessage *)message
{
    return @"CCCSessionRtcCallRecordContentView";
}

- (UIEdgeInsets)contentViewInsets:(NIMMessage *)message
{
    return [[AppleProjectKit sharedKit].config setting:message].contentInsets;
}

@end
