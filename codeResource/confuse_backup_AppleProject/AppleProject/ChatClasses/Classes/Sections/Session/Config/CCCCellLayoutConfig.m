//
//  NIMSessionDefaultConfig.m
// AppleProjectKit
//
//  Created by chris.
//  Copyright (c) 2015年 NetEase. All rights reserved.
//

#import "CCCCellLayoutConfig.h"
#import "CCCSessionMessageContentView.h"
#import "CCCSessionUnknowContentView.h"
#import "M80AttributedLabel+AppleProjectKit.h"
#import "AAAKitUtil.h"
#import "UIImage+AppleProjectKit.h"
#import "BBBMessageModel.h"
#import "CCCBaseSessionContentConfig.h"
#import "AppleProjectKit.h"

@interface CCCCellLayoutConfig()

@end

@implementation CCCCellLayoutConfig

- (CGSize)contentSize:(BBBMessageModel *)model cellWidth:(CGFloat)cellWidth{
    id<CCCSessionContentConfig>config = [[CCCSessionContentConfigFactory sharedFacotry] configBy:model.message];
    return [config contentSize:cellWidth message:model.message];
}

- (NSString *)cellContent:(BBBMessageModel *)model{
    id<CCCSessionContentConfig>config = [[CCCSessionContentConfigFactory sharedFacotry] configBy:model.message];
    NSString *cellContent = [config cellContent:model.message];
    return cellContent.length ? cellContent : @"CCCSessionUnknowContentView";
}


- (UIEdgeInsets)contentViewInsets:(BBBMessageModel *)model{
    id<CCCSessionContentConfig>config = [[CCCSessionContentConfigFactory sharedFacotry] configBy:model.message];    
    return [config contentViewInsets:model.message];
}


- (UIEdgeInsets)cellInsets:(BBBMessageModel *)model
{
    if ([[self cellContent:model] isEqualToString:@"CCCSessionNotificationContentView"]) {
        return UIEdgeInsetsZero;
    }
    CGFloat cellTopToBubbleTop           = 3;
    CGFloat otherNickNameHeight          = 20;
    CGFloat bubbleLeftToCellLeft         = 13;
    CGFloat otherBubbleOriginX           = [self shouldShowAvatar:model] ? [self avatarSize:model].width + bubbleLeftToCellLeft : 0;
    CGFloat cellBubbleButtomToCellButtom = 13;
    if ([self shouldShowNickName:model])
    {
        //要显示名字
        return UIEdgeInsetsMake(cellTopToBubbleTop + otherNickNameHeight ,otherBubbleOriginX,cellBubbleButtomToCellButtom, 0);
    }
    else
    {
        return UIEdgeInsetsMake(cellTopToBubbleTop,otherBubbleOriginX,cellBubbleButtomToCellButtom, 0);
    }

}

- (UIEdgeInsets)replyContentViewInsets:(BBBMessageModel *)model{
    id<CCCSessionContentConfig>config = [[CCCSessionContentConfigFactory sharedFacotry] replyConfigBy:model.repliedMessage];
    return [config contentViewInsets:model.repliedMessage];
}


- (UIEdgeInsets)replyCellInsets:(BBBMessageModel *)model
{
    if ([[self cellContent:model] isEqualToString:@"CCCSessionNotificationContentView"]) {
        return UIEdgeInsetsZero;
    }
    CGFloat cellTopToBubbleTop           = 3;
    CGFloat otherNickNameHeight          = 20;
    CGFloat bubbleLeftToCellLeft         = 13;
    CGFloat otherBubbleOriginX           = [self shouldShowAvatar:model] ? [self avatarSize:model].width + bubbleLeftToCellLeft : 0;
    CGFloat cellBubbleButtomToCellButtom = 1;
    if ([self shouldShowNickName:model])
    {
        //要显示名字
        return UIEdgeInsetsMake(cellTopToBubbleTop + otherNickNameHeight ,otherBubbleOriginX,cellBubbleButtomToCellButtom, 0);
    }
    else
    {
        return UIEdgeInsetsMake(cellTopToBubbleTop,otherBubbleOriginX,cellBubbleButtomToCellButtom, 0);
    }

}

- (CGSize)replyContentSize:(BBBMessageModel *)model cellWidth:(CGFloat)cellWidth {
    id<CCCSessionContentConfig>config = [[CCCSessionContentConfigFactory sharedFacotry] replyConfigBy:model.repliedMessage];
    return [config contentSize:cellWidth message:model.repliedMessage];
}

- (NSString *)replyContent:(BBBMessageModel *)model {
    id<CCCSessionContentConfig>config = [[CCCSessionContentConfigFactory sharedFacotry] replyConfigBy:model.repliedMessage];
    NSString *cellContent = [config cellContent:model.repliedMessage];
    return cellContent.length ? cellContent : @"CCCSessionUnknowContentView";
}

- (BOOL)shouldShowAvatar:(BBBMessageModel *)model
{
    return [[AppleProjectKit sharedKit].config setting:model.message].showAvatar;
}


- (BOOL)shouldShowNickName:(BBBMessageModel *)model{
    NIMMessage *message = model.message;
    if (message.messageType == NIMMessageTypeNotification)
    {
        NIMNotificationType type = [(NIMNotificationObject *)message.messageObject notificationType];
        if (type == NIMNotificationTypeTeam || type == NIMNotificationTypeSuperTeam) {
            return NO;
        }
    }
    if (message.messageType == NIMMessageTypeTip) {
        return NO;
    }

    BOOL isTeamMessage = (message.session.sessionType == NIMSessionTypeTeam
                          || message.session.sessionType == NIMSessionTypeSuperTeam);
    return (!message.isOutgoingMsg && isTeamMessage);
}


- (BOOL)shouldShowLeft:(BBBMessageModel *)model
{
    return !model.message.isOutgoingMsg;
}

- (CGPoint)avatarMargin:(BBBMessageModel *)model
{
    return CGPointMake(8.f, 0.f);
}

- (CGSize)avatarSize:(BBBMessageModel *)model
{
    return CGSizeMake(42, 42);
}

- (CGPoint)nickNameMargin:(BBBMessageModel *)model
{
    return [self shouldShowAvatar:model] ? CGPointMake([self avatarSize:model].width + 15.f, -3.f) : CGPointMake(10.f, -3.f);
}


- (NSArray *)customViews:(BBBMessageModel *)model
{
    return nil;
}

- (BOOL)disableRetryButton:(BBBMessageModel *)model
{
    
    if (model.message.session.sessionType == NIMSessionTypeTeam)
    {
        id<CCCCellLayoutConfig> layoutConfig = [[AppleProjectKit sharedKit] layoutConfig];
        BOOL left = [layoutConfig shouldShowLeft:model];
        if (!left) {
            NSString *userID = [NIMSDK sharedSDK].loginManager.currentAccount;
            NIMTeamMember *member = [[NIMSDK sharedSDK].teamManager teamMember:userID inTeam:model.message.session.sessionId];
            if (member.isMuted) {
                return YES;
            }
        }
    }
    else if (model.message.session.sessionType == NIMSessionTypeSuperTeam)
    {
        id<CCCCellLayoutConfig> layoutConfig = [[AppleProjectKit sharedKit] layoutConfig];
        BOOL left = [layoutConfig shouldShowLeft:model];
        if (!left) {
            NSString *userID = [NIMSDK sharedSDK].loginManager.currentAccount;
            NIMTeamMember *member = [[NIMSDK sharedSDK].superTeamManager teamMember:userID inTeam:model.message.session.sessionId];
            if (member.isMuted) {
                return YES;
            }
        }
    }
    
    if (!model.message.isReceivedMsg)
    {
        return model.message.deliveryState != NIMMessageDeliveryStateFailed;
    }
    else
    {
//        return model.message.attachmentDownloadState != NIMMessageAttachmentDownloadStateFailed;
        return YES;
    }
}

- (BOOL)shouldDisplayBubbleBackground:(BBBMessageModel *)model
{
    id<CCCSessionContentConfig> config = [[CCCSessionContentConfigFactory sharedFacotry] configBy:model.message];
    if ([config respondsToSelector:@selector(enableBackgroundBubbleView:)])
    {
        return [config enableBackgroundBubbleView:model.message];
    }
    return YES;
}

@end
