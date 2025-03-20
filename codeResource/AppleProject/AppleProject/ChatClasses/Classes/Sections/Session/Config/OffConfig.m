// __DEBUG__
// __CLOSE_PRINT__
//
//  NIMSessionDefaultConfig.m
// Indicator
//
//  Created by chris.
//  Copyright (c) 2015年 NetEase. All rights reserved.
//

// __M_A_C_R_O__
//: #import "CCCCellLayoutConfig.h"
#import "OffConfig.h"
//: #import "CCCSessionMessageContentView.h"
#import "ViewAggregationHeliogramSittingControl.h"
//: #import "CCCSessionUnknowContentView.h"
#import "TopControl.h"
//: #import "M80AttributedLabel+AppleProjectKit.h"
#import "MessageEnableTextView+Indicator.h"
//: #import "AAAKitUtil.h"
#import "TypicalCenter.h"
//: #import "UIImage+AppleProjectKit.h"
#import "UIImage+Indicator.h"
//: #import "BBBMessageModel.h"
#import "AccumulationCenter.h"
//: #import "UserBaseSessionContentConfig.h"
#import "UserBaseSessionContentConfig.h"
//: #import "AppleProjectKit.h"
#import "Indicator.h"

//: @interface CCCCellLayoutConfig()
@interface OffConfig()

//: @end
@end

//: @implementation CCCCellLayoutConfig
@implementation OffConfig

//: - (CGSize)contentSize:(BBBMessageModel *)model cellWidth:(CGFloat)cellWidth{
- (CGSize)sendWidth:(AccumulationCenter *)model showFloat:(CGFloat)cellWidth{
    //: id<CCCSessionContentConfig>config = [[CCCSessionContentConfigFactory sharedFacotry] configBy:model.message];
    id<TopTing>config = [[NameFactory quick] datePress:model.message];
    //: return [config contentSize:cellWidth message:model.message];
    return [config offMessage:cellWidth view:model.message];
}

//: - (NSString *)cellContent:(BBBMessageModel *)model{
- (NSString *)total:(AccumulationCenter *)model{
    //: id<CCCSessionContentConfig>config = [[CCCSessionContentConfigFactory sharedFacotry] configBy:model.message];
    id<TopTing>config = [[NameFactory quick] datePress:model.message];
    //: NSString *cellContent = [config cellContent:model.message];
    NSString *cellContent = [config text:model.message];
    //: return cellContent.length ? cellContent : @"CCCSessionUnknowContentView";
    return cellContent.length ? cellContent : @"TopControl";
}


//: - (UIEdgeInsets)contentViewInsets:(BBBMessageModel *)model{
- (UIEdgeInsets)handicapped:(AccumulationCenter *)model{
    //: id<CCCSessionContentConfig>config = [[CCCSessionContentConfigFactory sharedFacotry] configBy:model.message];
    id<TopTing>config = [[NameFactory quick] datePress:model.message];
    //: return [config contentViewInsets:model.message];
    return [config pressedView:model.message];
}


//: - (UIEdgeInsets)cellInsets:(BBBMessageModel *)model
- (UIEdgeInsets)top:(AccumulationCenter *)model
{
    //: if ([[self cellContent:model] isEqualToString:@"CCCSessionNotificationContentView"]) {
    if ([[self total:model] isEqualToString:@"DisableControl"]) {
        //: return UIEdgeInsetsZero;
        return UIEdgeInsetsZero;
    }
    //: CGFloat cellTopToBubbleTop = 3;
    CGFloat cellTopToBubbleTop = 3;
    //: CGFloat otherNickNameHeight = 20;
    CGFloat otherNickNameHeight = 20;
    //: CGFloat bubbleLeftToCellLeft = 13;
    CGFloat bubbleLeftToCellLeft = 13;
    //: CGFloat otherBubbleOriginX = [self shouldShowAvatar:model] ? [self avatarSize:model].width + bubbleLeftToCellLeft : 0;
    CGFloat otherBubbleOriginX = [self box:model] ? [self show:model].width + bubbleLeftToCellLeft : 0;
    //: CGFloat cellBubbleButtomToCellButtom = 13;
    CGFloat cellBubbleButtomToCellButtom = 13;
    //: if ([self shouldShowNickName:model])
    if ([self nickToInput:model])
    {
        //要显示名字
        //: return UIEdgeInsetsMake(cellTopToBubbleTop + otherNickNameHeight ,otherBubbleOriginX,cellBubbleButtomToCellButtom, 0);
        return UIEdgeInsetsMake(cellTopToBubbleTop + otherNickNameHeight ,otherBubbleOriginX,cellBubbleButtomToCellButtom, 0);
    }
    //: else
    else
    {
        //: return UIEdgeInsetsMake(cellTopToBubbleTop,otherBubbleOriginX,cellBubbleButtomToCellButtom, 0);
        return UIEdgeInsetsMake(cellTopToBubbleTop,otherBubbleOriginX,cellBubbleButtomToCellButtom, 0);
    }

}

//: - (UIEdgeInsets)replyContentViewInsets:(BBBMessageModel *)model{
- (UIEdgeInsets)pull:(AccumulationCenter *)model{
    //: id<CCCSessionContentConfig>config = [[CCCSessionContentConfigFactory sharedFacotry] replyConfigBy:model.repliedMessage];
    id<TopTing>config = [[NameFactory quick] selectedTitle:model.repliedMessage];
    //: return [config contentViewInsets:model.repliedMessage];
    return [config pressedView:model.repliedMessage];
}


//: - (UIEdgeInsets)replyCellInsets:(BBBMessageModel *)model
- (UIEdgeInsets)weltanschauung:(AccumulationCenter *)model
{
    //: if ([[self cellContent:model] isEqualToString:@"CCCSessionNotificationContentView"]) {
    if ([[self total:model] isEqualToString:@"DisableControl"]) {
        //: return UIEdgeInsetsZero;
        return UIEdgeInsetsZero;
    }
    //: CGFloat cellTopToBubbleTop = 3;
    CGFloat cellTopToBubbleTop = 3;
    //: CGFloat otherNickNameHeight = 20;
    CGFloat otherNickNameHeight = 20;
    //: CGFloat bubbleLeftToCellLeft = 13;
    CGFloat bubbleLeftToCellLeft = 13;
    //: CGFloat otherBubbleOriginX = [self shouldShowAvatar:model] ? [self avatarSize:model].width + bubbleLeftToCellLeft : 0;
    CGFloat otherBubbleOriginX = [self box:model] ? [self show:model].width + bubbleLeftToCellLeft : 0;
    //: CGFloat cellBubbleButtomToCellButtom = 1;
    CGFloat cellBubbleButtomToCellButtom = 1;
    //: if ([self shouldShowNickName:model])
    if ([self nickToInput:model])
    {
        //要显示名字
        //: return UIEdgeInsetsMake(cellTopToBubbleTop + otherNickNameHeight ,otherBubbleOriginX,cellBubbleButtomToCellButtom, 0);
        return UIEdgeInsetsMake(cellTopToBubbleTop + otherNickNameHeight ,otherBubbleOriginX,cellBubbleButtomToCellButtom, 0);
    }
    //: else
    else
    {
        //: return UIEdgeInsetsMake(cellTopToBubbleTop,otherBubbleOriginX,cellBubbleButtomToCellButtom, 0);
        return UIEdgeInsetsMake(cellTopToBubbleTop,otherBubbleOriginX,cellBubbleButtomToCellButtom, 0);
    }

}

//: - (CGSize)replyContentSize:(BBBMessageModel *)model cellWidth:(CGFloat)cellWidth {
- (CGSize)with:(AccumulationCenter *)model recordingOfWidth:(CGFloat)cellWidth {
    //: id<CCCSessionContentConfig>config = [[CCCSessionContentConfigFactory sharedFacotry] replyConfigBy:model.repliedMessage];
    id<TopTing>config = [[NameFactory quick] selectedTitle:model.repliedMessage];
    //: return [config contentSize:cellWidth message:model.repliedMessage];
    return [config offMessage:cellWidth view:model.repliedMessage];
}

//: - (NSString *)replyContent:(BBBMessageModel *)model {
- (NSString *)keyVideo:(AccumulationCenter *)model {
    //: id<CCCSessionContentConfig>config = [[CCCSessionContentConfigFactory sharedFacotry] replyConfigBy:model.repliedMessage];
    id<TopTing>config = [[NameFactory quick] selectedTitle:model.repliedMessage];
    //: NSString *cellContent = [config cellContent:model.repliedMessage];
    NSString *cellContent = [config text:model.repliedMessage];
    //: return cellContent.length ? cellContent : @"CCCSessionUnknowContentView";
    return cellContent.length ? cellContent : @"TopControl";
}

//: - (BOOL)shouldShowAvatar:(BBBMessageModel *)model
- (BOOL)box:(AccumulationCenter *)model
{
    //: return [[AppleProjectKit sharedKit].config setting:model.message].showAvatar;
    return [[Indicator reach].config info:model.message].showAvatar;
}


//: - (BOOL)shouldShowNickName:(BBBMessageModel *)model{
- (BOOL)nickToInput:(AccumulationCenter *)model{
    //: NIMMessage *message = model.message;
    NIMMessage *message = model.message;
    //: if (message.messageType == NIMMessageTypeNotification)
    if (message.messageType == NIMMessageTypeNotification)
    {
        //: NIMNotificationType type = [(NIMNotificationObject *)message.messageObject notificationType];
        NIMNotificationType type = [(NIMNotificationObject *)message.messageObject notificationType];
        //: if (type == NIMNotificationTypeTeam || type == NIMNotificationTypeSuperTeam) {
        if (type == NIMNotificationTypeTeam || type == NIMNotificationTypeSuperTeam) {
            //: return NO;
            return NO;
        }
    }
    //: if (message.messageType == NIMMessageTypeTip) {
    if (message.messageType == NIMMessageTypeTip) {
        //: return NO;
        return NO;
    }

    //: BOOL isTeamMessage = (message.session.sessionType == NIMSessionTypeTeam
    BOOL isTeamMessage = (message.session.sessionType == NIMSessionTypeTeam
                          //: || message.session.sessionType == NIMSessionTypeSuperTeam);
                          || message.session.sessionType == NIMSessionTypeSuperTeam);
    //: return (!message.isOutgoingMsg && isTeamMessage);
    return (!message.isOutgoingMsg && isTeamMessage);
}


//: - (BOOL)shouldShowLeft:(BBBMessageModel *)model
- (BOOL)reason:(AccumulationCenter *)model
{
    //: return !model.message.isOutgoingMsg;
    return !model.message.isOutgoingMsg;
}

//: - (CGPoint)avatarMargin:(BBBMessageModel *)model
- (CGPoint)action:(AccumulationCenter *)model
{
    //: return CGPointMake(8.f, 0.f);
    return CGPointMake(8.f, 0.f);
}

//: - (CGSize)avatarSize:(BBBMessageModel *)model
- (CGSize)show:(AccumulationCenter *)model
{
    //: return CGSizeMake(42, 42);
    return CGSizeMake(42, 42);
}

//: - (CGPoint)nickNameMargin:(BBBMessageModel *)model
- (CGPoint)contentImage:(AccumulationCenter *)model
{
    //: return [self shouldShowAvatar:model] ? CGPointMake([self avatarSize:model].width + 15.f, -3.f) : CGPointMake(10.f, -3.f);
    return [self box:model] ? CGPointMake([self show:model].width + 15.f, -3.f) : CGPointMake(10.f, -3.f);
}


//: - (NSArray *)customViews:(BBBMessageModel *)model
- (NSArray *)rubric:(AccumulationCenter *)model
{
    //: return nil;
    return nil;
}

//: - (BOOL)disableRetryButton:(BBBMessageModel *)model
- (BOOL)ats:(AccumulationCenter *)model
{

    //: if (model.message.session.sessionType == NIMSessionTypeTeam)
    if (model.message.session.sessionType == NIMSessionTypeTeam)
    {
        //: id<CCCCellLayoutConfig> layoutConfig = [[AppleProjectKit sharedKit] layoutConfig];
        id<OffConfig> layoutConfig = [[Indicator reach] layoutConfig];
        //: BOOL left = [layoutConfig shouldShowLeft:model];
        BOOL left = [layoutConfig reason:model];
        //: if (!left) {
        if (!left) {
            //: NSString *userID = [NIMSDK sharedSDK].loginManager.currentAccount;
            NSString *userID = [NIMSDK sharedSDK].loginManager.currentAccount;
            //: NIMTeamMember *member = [[NIMSDK sharedSDK].teamManager teamMember:userID inTeam:model.message.session.sessionId];
            NIMTeamMember *member = [[NIMSDK sharedSDK].teamManager teamMember:userID inTeam:model.message.session.sessionId];
            //: if (member.isMuted) {
            if (member.isMuted) {
                //: return YES;
                return YES;
            }
        }
    }
    //: else if (model.message.session.sessionType == NIMSessionTypeSuperTeam)
    else if (model.message.session.sessionType == NIMSessionTypeSuperTeam)
    {
        //: id<CCCCellLayoutConfig> layoutConfig = [[AppleProjectKit sharedKit] layoutConfig];
        id<OffConfig> layoutConfig = [[Indicator reach] layoutConfig];
        //: BOOL left = [layoutConfig shouldShowLeft:model];
        BOOL left = [layoutConfig reason:model];
        //: if (!left) {
        if (!left) {
            //: NSString *userID = [NIMSDK sharedSDK].loginManager.currentAccount;
            NSString *userID = [NIMSDK sharedSDK].loginManager.currentAccount;
            //: NIMTeamMember *member = [[NIMSDK sharedSDK].superTeamManager teamMember:userID inTeam:model.message.session.sessionId];
            NIMTeamMember *member = [[NIMSDK sharedSDK].superTeamManager teamMember:userID inTeam:model.message.session.sessionId];
            //: if (member.isMuted) {
            if (member.isMuted) {
                //: return YES;
                return YES;
            }
        }
    }

    //: if (!model.message.isReceivedMsg)
    if (!model.message.isReceivedMsg)
    {
        //: return model.message.deliveryState != NIMMessageDeliveryStateFailed;
        return model.message.deliveryState != NIMMessageDeliveryStateFailed;
    }
    //: else
    else
    {
//        return model.message.attachmentDownloadState != NIMMessageAttachmentDownloadStateFailed;
        //: return YES;
        return YES;
    }
}

//: - (BOOL)shouldDisplayBubbleBackground:(BBBMessageModel *)model
- (BOOL)cellBackground:(AccumulationCenter *)model
{
    //: id<CCCSessionContentConfig> config = [[CCCSessionContentConfigFactory sharedFacotry] configBy:model.message];
    id<TopTing> config = [[NameFactory quick] datePress:model.message];
    //: if ([config respondsToSelector:@selector(enableBackgroundBubbleView:)])
    if ([config respondsToSelector:@selector(backgrounded:)])
    {
        //: return [config enableBackgroundBubbleView:model.message];
        return [config backgrounded:model.message];
    }
    //: return YES;
    return YES;
}

//: @end
@end
