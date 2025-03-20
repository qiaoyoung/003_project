
#import <Foundation/Foundation.h>
typedef struct {
    Byte accomplish;
    Byte *collateral;
    unsigned int jurorImpossible;
    bool achillesTendon;
	int instal;
	int gainSpecially;
} CompetitiveFishData;

NSString *StringFromCompetitiveFishData(CompetitiveFishData *data);


//: message should be notification
CompetitiveFishData str_priseEdgeData = (CompetitiveFishData){91, (Byte []){54, 62, 40, 40, 58, 60, 62, 123, 40, 51, 52, 46, 55, 63, 123, 57, 62, 123, 53, 52, 47, 50, 61, 50, 56, 58, 47, 50, 52, 53, 147}, 30, false, 3, 217};


//: not supported notification type %zd
CompetitiveFishData str_customSwingName = (CompetitiveFishData){106, (Byte []){4, 5, 30, 74, 25, 31, 26, 26, 5, 24, 30, 15, 14, 74, 4, 5, 30, 3, 12, 3, 9, 11, 30, 3, 5, 4, 74, 30, 19, 26, 15, 74, 79, 16, 14, 148}, 35, false, 148, 235};

// __DEBUG__
// __CLOSE_PRINT__
//
//  OnShow.m
// Indicator
//
//  Created by amao on 9/15/15.
//  Copyright (c) 2015 NetEase. All rights reserved.
//

// __M_A_C_R_O__
//: #import "CCCNotificationContentConfig.h"
#import "OnShow.h"
//: #import "M80AttributedLabel+AppleProjectKit.h"
#import "MessageEnableTextView+Indicator.h"
//: #import "AAAKitUtil.h"
#import "TypicalCenter.h"
//: #import "CCCUnsupportContentConfig.h"
#import "TitleConfig.h"
//: #import "AppleProjectKit.h"
#import "Indicator.h"

//: @implementation CCCNotificationContentConfig
@implementation OnShow
//: - (CGSize)contentSize:(CGFloat)cellWidth message:(NIMMessage *)message
- (CGSize)offMessage:(CGFloat)cellWidth view:(NIMMessage *)message
{
    //: NIMNotificationObject *object = message.messageObject;
    NIMNotificationObject *object = message.messageObject;
    //: NSAssert([object isKindOfClass:[NIMNotificationObject class]], @"message should be notification");
    NSAssert([object isKindOfClass:[NIMNotificationObject class]], StringFromCompetitiveFishData(&str_priseEdgeData));

    //: CGSize contentSize = CGSizeZero;
    CGSize contentSize = CGSizeZero;

    //: switch (object.notificationType) {
    switch (object.notificationType) {
        //: case NIMNotificationTypeTeam:
        case NIMNotificationTypeTeam:
        //: case NIMNotificationTypeSuperTeam:
        case NIMNotificationTypeSuperTeam:
        //: case NIMNotificationTypeChatroom:
        case NIMNotificationTypeChatroom:
        {
            //: CGFloat TeamNotificationMessageWidth = cellWidth;
            CGFloat TeamNotificationMessageWidth = cellWidth;
            //: UILabel *label = [[UILabel alloc] init];
            UILabel *label = [[UILabel alloc] init];
            //: label.text = [AAAKitUtil messageTipContent:message];
            label.text = [TypicalCenter mode:message];
            //: label.font = [[AppleProjectKit sharedKit].config setting:message].font;
            label.font = [[Indicator reach].config info:message].font;
            //: label.numberOfLines = 0;
            label.numberOfLines = 0;
            //: CGFloat padding = [AppleProjectKit sharedKit].config.maxNotificationTipPadding;
            CGFloat padding = [Indicator reach].config.sumRangeWindow;
            //: CGSize size = [label sizeThatFits:CGSizeMake(cellWidth - 2 * padding, 1.7976931348623157e+308)];
            CGSize size = [label sizeThatFits:CGSizeMake(cellWidth - 2 * padding, 1.7976931348623157e+308)];
            //: CGFloat cellPadding = 11.f;
            CGFloat cellPadding = 11.f;
            //: contentSize = CGSizeMake(TeamNotificationMessageWidth, size.height + 2 * cellPadding);
            contentSize = CGSizeMake(TeamNotificationMessageWidth, size.height + 2 * cellPadding);
            //: break;
            break;
        }
        //: case NIMNotificationTypeNetCall:{
        case NIMNotificationTypeNetCall:{
            //: M80AttributedLabel *label = [[M80AttributedLabel alloc] initWithFrame:CGRectZero];
            MessageEnableTextView *label = [[MessageEnableTextView alloc] initWithFrame:CGRectZero];
            //: label.autoDetectLinks = NO;
            label.autoDetectLinks = NO;
            //: label.font = [[AppleProjectKit sharedKit].config setting:message].font;
            label.font = [[Indicator reach].config info:message].font;
            //: NSString *text = [AAAKitUtil messageTipContent:message];
            NSString *text = [TypicalCenter mode:message];
            //: [label nim_setText:text];
            [label showName:text];

            //: CGFloat msgBubbleMaxWidth = (cellWidth - 130);
            CGFloat msgBubbleMaxWidth = (cellWidth - 130);
            //: CGFloat bubbleLeftToContent = 14;
            CGFloat bubbleLeftToContent = 14;
            //: CGFloat contentRightToBubble = 14;
            CGFloat contentRightToBubble = 14;
            //: CGFloat msgContentMaxWidth = (msgBubbleMaxWidth - contentRightToBubble - bubbleLeftToContent);
            CGFloat msgContentMaxWidth = (msgBubbleMaxWidth - contentRightToBubble - bubbleLeftToContent);
            //: contentSize = [label sizeThatFits:CGSizeMake(msgContentMaxWidth, 1.7976931348623157e+308)];
            contentSize = [label sizeThatFits:CGSizeMake(msgContentMaxWidth, 1.7976931348623157e+308)];
            //: break;
            break;
        }
        //: default:
        default:
        {
            //: CCCUnsupportContentConfig *config = [[CCCUnsupportContentConfig alloc] init];
            TitleConfig *config = [[TitleConfig alloc] init];
            //: contentSize = [config contentSize:cellWidth message:message];
            contentSize = [config offMessage:cellWidth view:message];
            //: NSAssert(0, @"not supported notification type %zd",object.notificationType);
            NSAssert(0, StringFromCompetitiveFishData(&str_customSwingName),object.notificationType);
        }
            //: break;
            break;
    }
    //: return contentSize;
    return contentSize;
}

//: - (NSString *)cellContent:(NIMMessage *)message
- (NSString *)text:(NIMMessage *)message
{
    //: NIMNotificationObject *object = message.messageObject;
    NIMNotificationObject *object = message.messageObject;
    //: NSAssert([object isKindOfClass:[NIMNotificationObject class]], @"message should be notification");
    NSAssert([object isKindOfClass:[NIMNotificationObject class]], StringFromCompetitiveFishData(&str_priseEdgeData));

    //: switch (object.notificationType) {
    switch (object.notificationType) {
        //: case NIMNotificationTypeTeam:
        case NIMNotificationTypeTeam:
        //: case NIMNotificationTypeSuperTeam:
        case NIMNotificationTypeSuperTeam:
        //: case NIMNotificationTypeChatroom:
        case NIMNotificationTypeChatroom:
            //: return @"CCCSessionNotificationContentView";
            return @"DisableControl";
        //: case NIMNotificationTypeNetCall:
        case NIMNotificationTypeNetCall:
            //: return @"CCCSessionNetChatNotifyContentView";
            return @"OfControl";
        //: case NIMNotificationTypeUnsupport:
        case NIMNotificationTypeUnsupport:
            //: return @"CCCSessionUnknowContentView";
            return @"TopControl";
        //: default:
        default:
            //: break;
            break;
    }
}

//: - (UIEdgeInsets)contentViewInsets:(NIMMessage *)message
- (UIEdgeInsets)pressedView:(NIMMessage *)message
{
    //: return [[AppleProjectKit sharedKit].config setting:message].contentInsets;
    return [[Indicator reach].config info:message].contentInsets;
}

//: - (BOOL)enableBackgroundBubbleView:(NIMMessage *)message
- (BOOL)backgrounded:(NIMMessage *)message
{
    //: NIMNotificationObject *object = message.messageObject;
    NIMNotificationObject *object = message.messageObject;
    //: NSAssert([object isKindOfClass:[NIMNotificationObject class]], @"message should be notification");
    NSAssert([object isKindOfClass:[NIMNotificationObject class]], StringFromCompetitiveFishData(&str_priseEdgeData));

    //: switch (object.notificationType) {
    switch (object.notificationType) {
        //: case NIMNotificationTypeTeam:
        case NIMNotificationTypeTeam:
        //: case NIMNotificationTypeSuperTeam:
        case NIMNotificationTypeSuperTeam:
        //: case NIMNotificationTypeChatroom:
        case NIMNotificationTypeChatroom:
            //: return NO;
            return NO;
        //: case NIMNotificationTypeNetCall:
        case NIMNotificationTypeNetCall:
            //: return YES;
            return YES;
        //: case NIMNotificationTypeUnsupport:
        case NIMNotificationTypeUnsupport:
            //: return NO;
            return NO;
        //: default:
        default:
            //: break;
            break;
    }
    //: return YES;
    return YES;
}

//: @end
@end

Byte *CompetitiveFishDataToByte(CompetitiveFishData *data) {
    if (data->achillesTendon) return data->collateral;
    for (int i = 0; i < data->jurorImpossible; i++) {
        data->collateral[i] ^= data->accomplish;
    }
    data->collateral[data->jurorImpossible] = 0;
    data->achillesTendon = true;
	if (data->jurorImpossible >= 2) {
		data->instal = data->collateral[0];
		data->gainSpecially = data->collateral[1];
	}
    return data->collateral;
}

NSString *StringFromCompetitiveFishData(CompetitiveFishData *data) {
    return [NSString stringWithUTF8String:(char *)CompetitiveFishDataToByte(data)];
}
