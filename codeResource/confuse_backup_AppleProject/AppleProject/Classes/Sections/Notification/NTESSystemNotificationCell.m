//
//  NTESSystemNotificationCell.m
//  NIM
//
//  Created by amao on 3/17/15.
//  Copyright (c) 2015 Netease. All rights reserved.
//

#import "NTESSystemNotificationCell.h"
#import "UIView+NTES.h"
#import "BBBAvatarImageView.h"

@interface NTESSystemNotificationCell ()

@property (nonatomic,strong) NIMSystemNotification *notification;
//@property (nonatomic,strong) IBOutlet BBBAvatarImageView *avatarImageView;
@end

@implementation NTESSystemNotificationCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.avatarImageView];
        [self.contentView addSubview:self.titleLabel];
//        [self.contentView addSubview:self.timeLabel];
        [self.contentView addSubview:self.messageLabel];
        [self.contentView addSubview:self.handleInfoLabel];
        [self.contentView addSubview:self.acceptButton];
        [self.contentView addSubview:self.refuseButton];
//        [self.contentView addSubview:self.handleInfoLabel];
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (UIImageView *)avatarImageView {
    if (!_avatarImageView) {
        _avatarImageView = [[UIImageView alloc] initWithFrame:CGRectMake(15, 12, 50, 50)];
        _avatarImageView.contentMode = UIViewContentModeScaleToFill;
        _avatarImageView.layer.cornerRadius = 25;
        _avatarImageView.layer.masksToBounds = YES;

//        UITapGestureRecognizer *panGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onTouchAvatar:)];
//        [_avatarImageView addGestureRecognizer:panGesture];
    }
    return _avatarImageView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.avatarImageView.right + 15, 18, 200 , 20)];
        _titleLabel.font = [UIFont systemFontOfSize:16.f];
        _titleLabel.textColor = TextColor_4;
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        _titleLabel.numberOfLines = 1;
        _titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    }
    return _titleLabel;
}

//- (UILabel *)timeLabel {
//    if (!_timeLabel) {
//        _timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.titleLabel.left, self.titleLabel.bottom, self.titleLabel.width, 18)];
//        _timeLabel.font = [UIFont systemFontOfSize:13.f];
//        _timeLabel.textColor = TextColor_Subtitle;
//        _timeLabel.textAlignment = NSTextAlignmentLeft;
//        _timeLabel.numberOfLines = 1;
//        _timeLabel.lineBreakMode = NSLineBreakByTruncatingTail;
//    }
//    return _timeLabel;
//}

- (YYLabel *)messageLabel {
    if (!_messageLabel) {
        _messageLabel = [[YYLabel alloc] initWithFrame:CGRectMake(self.titleLabel.left, self.titleLabel.bottom, self.titleLabel.width, 20)];
        _messageLabel.font = [UIFont systemFontOfSize:12.f];
//        _messageLabel.textContainerInset = UIEdgeInsetsMake(5, 5, 5, 5);
        _messageLabel.textColor = TextColor_3;
        _messageLabel.textAlignment = NSTextAlignmentLeft;
//        _messageLabel.numberOfLines = 3;
//        _messageLabel.lineBreakMode = NSLineBreakByTruncatingMiddle;
//        _messageLabel.layer.cornerRadius = 6;
//        _messageLabel.layer.borderColor = TextColor_Subtitle.CGColor;
//        _messageLabel.layer.borderWidth = 1.f/[UIScreen mainScreen].scale;
//        _messageLabel.layer.masksToBounds = YES;
    }
    return _messageLabel;
}

- (UILabel *)handleInfoLabel {
    if (!_handleInfoLabel) {
        _handleInfoLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _handleInfoLabel.frame = CGRectMake(0, 0, 130, 20);
        _handleInfoLabel.right = SCREEN_WIDTH - 15;
        _handleInfoLabel.centerY = self.avatarImageView.centerY;
        _handleInfoLabel.font = [UIFont systemFontOfSize:12.f];
        _handleInfoLabel.textColor = TextColor_3;
        _handleInfoLabel.textAlignment = NSTextAlignmentRight;
//        _handleInfoLabel.numberOfLines = 1;
//        _handleInfoLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    }
    return _handleInfoLabel;
}

- (UIButton *)acceptButton {
    if (!_acceptButton) {
        _acceptButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
        _acceptButton.frame = CGRectMake(SCREEN_WIDTH - 15 -32, 21, 32, 32);
//        _acceptButton.titleLabel.font = [UIFont systemFontOfSize:15];
//        [_acceptButton setTitle:LangKey(@"request_add_accept") forState:(UIControlStateNormal)];
        [_acceptButton addTarget:self action:@selector(onAcceptBtn) forControlEvents:(UIControlEventTouchUpInside)];
//        [_acceptButton setTitleColor:[KEKESkinColorManager shareInstance].skinColor forState:(UIControlStateNormal)];
//        [_acceptButton setBackgroundColor:RGB_COLOR_String(@"#ffffff")];
        [_acceptButton setImage:[UIImage imageNamed:@"ic_btn_accept"] forState:UIControlStateNormal];
//        _acceptButton.layer.cornerRadius = 16;
//        _acceptButton.layer.masksToBounds = YES;
    }
    return _acceptButton;
}

- (UIButton *)refuseButton {
    if (!_refuseButton) {
        _refuseButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
        _refuseButton.frame = CGRectMake(0, 0, 32, 32);
        _refuseButton.right = self.acceptButton.left - 20;
        _refuseButton.top = self.acceptButton.top;
//        _refuseButton.titleLabel.font = [UIFont systemFontOfSize:15];
//        [_refuseButton setTitle:LangKey(@"request_add_reject") forState:(UIControlStateNormal)];
        [_refuseButton addTarget:self action:@selector(onRefusebtn) forControlEvents:(UIControlEventTouchUpInside)];
//        [_refuseButton setTitleColor:TextColor_1 forState:(UIControlStateNormal)];
//        [_refuseButton setBackgroundColor:RGB_COLOR_String(@"#ffffff")];
        [_refuseButton setImage:[UIImage imageNamed:@"ic_btn_disaccept"] forState:UIControlStateNormal];
//        _refuseButton.layer.cornerRadius = 16;
//        _refuseButton.layer.masksToBounds = YES;
    }
    return _refuseButton;
}


- (void)update:(NIMSystemNotification *)notification{
    self.notification = notification;
    [self updateUI];
}

- (void)updateUI{
    BOOL hideActionButton = [self shouldHideActionButton];

    [self.acceptButton setHidden:hideActionButton];
    [self.refuseButton setHidden:hideActionButton];
    if(hideActionButton) {
        self.handleInfoLabel.hidden = NO;
        switch (self.notification.handleStatus) {
            case NotificationHandleTypeOk:
                self.handleInfoLabel.text = LangKey(@"message_helper_already_ok");//@"已同意".nim_localized;
                break;
            case NotificationHandleTypeNo:
                self.handleInfoLabel.text = LangKey(@"message_helper_already_no");//@"已拒绝".nim_localized;
                break;
            case NotificationHandleTypeOutOfDate:
                self.handleInfoLabel.text = LangKey(@"message_helper_already_time");//@"已过期".nim_localized;
                break;
            default:
                self.handleInfoLabel.text = @"已读".nim_localized;
                break;
        }
    } else {
        self.handleInfoLabel.hidden = YES;
    }


//    self.timeLabel.text = [KEKEUserMemberUtil showTime:self.notification.timestamp showDetail:YES];

    NSString *sourceID = self.notification.sourceID;
    CCCKitInfo *sourceMember = [[AppleProjectKit sharedKit] infoByUser:sourceID option:nil];
    [self updateSourceMember:sourceMember];
}

- (void)updateSourceMember:(CCCKitInfo *)sourceMember{
    
    NIMSystemNotificationType type = self.notification.type;
    NSString *avatarUrlString = sourceMember.avatarUrlString;
    NSURL *url;
    if (avatarUrlString.length) {
        url = [NSURL URLWithString:avatarUrlString];
    }
//    [self.avatarImageView nim_setImageWithURL:url placeholderImage:sourceMember.avatarImage options:SDWebImageRetryFailed];
    [self.avatarImageView sd_setImageWithURL:url placeholderImage:sourceMember.avatarImage];
    self.titleLabel.text        = sourceMember.showName;
    switch (type) {
        case NIMSystemNotificationTypeTeamApply:
        {
            NSString *message_helper_apply_to_group = LangKey(@"message_helper_apply_to_group");//@"申请加入群".nim_localized
            NIMTeam *team = [[NIMSDK sharedSDK].teamManager teamById:self.notification.targetID];
            self.messageLabel.text = [NSString stringWithFormat:@"%@ %@",message_helper_apply_to_group, team.teamName];
        }
            break;
        case NIMSystemNotificationTypeTeamApplyReject:
        {
            NSString *contact_fragment_group = LangKey(@"contact_fragment_group");//@"群".nim_localized
            NSString *message_helper_refuse_you = LangKey(@"message_helper_refuse_you");//@"拒绝你加入".nim_localized
            NIMTeam *team = [[NIMSDK sharedSDK].teamManager teamById:self.notification.targetID];
            self.messageLabel.text = [NSString stringWithFormat:@"%@ %@ %@",
                                         contact_fragment_group,
                                         team.teamName,
                                         message_helper_refuse_you];
        }
            break;
        case NIMSystemNotificationTypeTeamInvite:
        {
            NSString *contact_fragment_group = LangKey(@"contact_fragment_group");//@"群".nim_localized
            NSString *invite_you_group = LangKey(@"invite_you_group");//@"邀请你加入".nim_localized
            NIMTeam *team = [[NIMSDK sharedSDK].teamManager teamById:self.notification.targetID];
            
            self.messageLabel.text = [NSString stringWithFormat:@"%@ %@ %@",
                                         contact_fragment_group,
                                         team.teamName,
                                         invite_you_group];
            
            if (self.notification.notifyExt.length>0) {
                self.messageLabel.text = [NSString stringWithFormat:@"%@ attach:%@",self.messageLabel.text , self.notification.notifyExt?:@""];
            }
            
        }
            break;
        case NIMSystemNotificationTypeTeamIviteReject:
        {
            NSString *message_helper_refuse_group = LangKey(@"message_helper_refuse_group");
            NSString *message_helper_invite = LangKey(@"message_helper_invite");//@"邀请".nim_localized
            NIMTeam *team = [[NIMSDK sharedSDK].teamManager teamById:self.notification.targetID];
            self.messageLabel.text = [NSString stringWithFormat:@"%@ %@ %@",
                                         message_helper_refuse_group,
                                         team.teamName,
                                         message_helper_invite];
        }
            break;
        case NIMSystemNotificationTypeSuperTeamApply:
        {
            NSString *apply_join_supergroup = LangKey(@"apply_join_supergroup");//@"申请加入超大群 %@".nim_localized
            NIMTeam *team = [[NIMSDK sharedSDK].superTeamManager teamById:self.notification.targetID];
            self.messageLabel.text = [NSString stringWithFormat:apply_join_supergroup, team.teamName];
            break;
        }
        case NIMSystemNotificationTypeSuperTeamApplyReject:
        {
            NSString *large_group = LangKey(@"large_group");//超大群
            NSString *to_deny_entry = LangKey(@"to_deny_entry");//拒绝你加入
            NIMTeam *team = [[NIMSDK sharedSDK].superTeamManager teamById:self.notification.targetID];
            self.messageLabel.text = [NSString stringWithFormat:@"%@ %@ %@",large_group, team.teamName,to_deny_entry];
            break;
        }
        case NIMSystemNotificationTypeSuperTeamInvite:
        {
            NSString *large_group = LangKey(@"large_group");//超大群
            NSString *invite_you_join_us = LangKey(@"invite_you_join_us");//邀请你加入
            NIMTeam *team = [[NIMSDK sharedSDK].superTeamManager teamById:self.notification.targetID];
            self.messageLabel.text = [NSString stringWithFormat:@"%@ %@  %@",large_group, team.teamName,invite_you_join_us];
            break;
        }
        case NIMSystemNotificationTypeSuperTeamIviteReject:
        {
            NSString *rejected_group_invitation = LangKey(@"rejected_group_invitation");
            NIMTeam *team = [[NIMSDK sharedSDK].superTeamManager teamById:self.notification.targetID];
            self.messageLabel.text = [NSString stringWithFormat:@"%@ %@",rejected_group_invitation, team.teamName];
            break;
        }
        case NIMSystemNotificationTypeFriendAdd:
        {
            NSString *text = @"未知请求".nim_localized;
            id object = self.notification.attachment;
            if ([object isKindOfClass:[NIMUserAddAttachment class]]) {
                NIMUserOperation operation = [(NIMUserAddAttachment *)object operationType];
                NSString *serverExt = [(NIMUserAddAttachment *)object serverExt];

                switch (operation) {
                    case NIMUserOperationAdd:
                        text = LangKey(@"message_helper_already_add");//@"已添加你为好友".nim_localized;
                        break;
                    case NIMUserOperationRequest:
                        text = LangKey(@"request_add_you_as_a_friend");//@"请求添加你为好友".nim_localized;
                        break;
                    case NIMUserOperationVerify:
                        text = LangKey(@"message_helper_allow_you_apply");//@"通过了你的好友请求".nim_localized;
                        break;
                    case NIMUserOperationReject:
                        text = LangKey(@"message_helper_refuse_you_apply");//@"拒绝了你的好友请求".nim_localized;
                        break;
                    default:
                        break;
                }

                if (serverExt && [serverExt length]) {
                    text = [NSString stringWithFormat:@"%@（%@）", text, serverExt];
                }
            }

            self.messageLabel.text = text;
        }
            break;
        default:
            break;
    }
    
//    if (self.notification.postscript.length > 0) {
//        self.messageLabel.text = [NSString stringWithFormat:@"%@ %@",self.notification.postscript, self.messageLabel.text];
//    }
    
//    CGSize contentSize = [self.messageLabel.text boundingRectWithSize:CGSizeMake(SCREEN_WIDTH-48-15-12-15, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:13]} context:nil].size;
//
//    self.messageLabel.height = contentSize.height + 10;
    
//    _refuseButton.top = _handleInfoLabel.top = _acceptButton.top = self.messageLabel.bottom + 8;
}

- (void)onAcceptBtn{
    if (_actionDelegate && [_actionDelegate respondsToSelector:@selector(onAccept:)]){
        [_actionDelegate onAccept:self.notification];
    }
}
- (void)onRefusebtn {
    if (_actionDelegate && [_actionDelegate respondsToSelector:@selector(onRefuse:)]){
        [_actionDelegate onRefuse:self.notification];
    }
}

- (BOOL)shouldHideActionButton
{
    NIMSystemNotificationType type = self.notification.type;
    BOOL handled = self.notification.handleStatus != 0;
    BOOL needHandle = NO;
    if (type == NIMSystemNotificationTypeTeamApply ||
        type == NIMSystemNotificationTypeTeamInvite ||
        type == NIMSystemNotificationTypeSuperTeamApply ||
        type == NIMSystemNotificationTypeSuperTeamInvite) {
        needHandle = YES;
    }
    if (type == NIMSystemNotificationTypeFriendAdd) {
        id object = self.notification.attachment;
        if ([object isKindOfClass:[NIMUserAddAttachment class]]) {
            NIMUserOperation operation = [(NIMUserAddAttachment *)object operationType];
            needHandle = operation == NIMUserOperationRequest;
        }
    }
    return !(!handled && needHandle);
    
}
//- (void)awakeFromNib{
//    [super awakeFromNib];
//    self.textLabel.lineBreakMode = NSLineBreakByTruncatingMiddle;
//    self.detailTextLabel.backgroundColor = [UIColor clearColor];
//    self.detailTextLabel.lineBreakMode = NSLineBreakByTruncatingMiddle;
//    self.avatarImageView = [[BBBAvatarImageView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
//    [self.contentView addSubview:self.avatarImageView];
//
////    UIButton *a = (UIButton *)self.acceptButton;
////    UIButton *b = (UIButton *)self.refuseButton;
////    [a setTitle:LangKey(@"request_add_accept") forState:UIControlStateNormal];
////    [b setTitle:LangKey(@"request_add_reject") forState:UIControlStateNormal];
//
//}
//
//- (void)update:(NIMSystemNotification *)notification{
//    self.notification = notification;
//    [self updateUI];
//}
//
//- (void)updateUI{
//    BOOL hideActionButton = [self shouldHideActionButton];
//
//    [self.acceptButton setHidden:hideActionButton];
//    [self.refuseButton setHidden:hideActionButton];
//    if(hideActionButton) {
//        self.handleInfoLabel.hidden = NO;
//        switch (self.notification.handleStatus) {
//            case NotificationHandleTypeOk:
//                self.handleInfoLabel.text = LangKey(@"message_helper_already_ok");//@"已同意".ntes_localized;
//                break;
//            case NotificationHandleTypeNo:
//                self.handleInfoLabel.text = LangKey(@"message_helper_already_no");//@"已拒绝".ntes_localized;
//                break;
//            case NotificationHandleTypeOutOfDate:
//                self.handleInfoLabel.text = LangKey(@"message_helper_already_time");//@"已过期".ntes_localized;
//                break;
//            default:
//                self.handleInfoLabel.text = nil;
//                break;
//        }
//    } else {
//        self.handleInfoLabel.hidden = YES;
//    }
//
//
//    NSString *sourceID = self.notification.sourceID;
//    CCCKitInfo *sourceMember = [[AppleProjectKit sharedKit] infoByUser:sourceID option:nil];
//    [self updateSourceMember:sourceMember];
//}
//
//- (void)updateSourceMember:(CCCKitInfo *)sourceMember{
//    NIMSystemNotificationType type = self.notification.type;
//    NSString *avatarUrlString = sourceMember.avatarUrlString;
//    NSURL *url;
//    if (avatarUrlString.length) {
//        url = [NSURL URLWithString:avatarUrlString];
//    }
//    [self.avatarImageView nim_setImageWithURL:url placeholderImage:sourceMember.avatarImage options:SDWebImageRetryFailed];
//    self.textLabel.text        = sourceMember.showName;
//    [self.textLabel sizeToFit];
//    switch (type) {
//        case NIMSystemNotificationTypeTeamApply:
//        {
//            NSString *message_helper_apply_to_group = LangKey(@"message_helper_apply_to_group");//@"申请加入群".ntes_localized
//            NIMTeam *team = [[NIMSDK sharedSDK].teamManager teamById:self.notification.targetID];
//            self.detailTextLabel.text = [NSString stringWithFormat:@"%@ %@",message_helper_apply_to_group, team.teamName];
//        }
//            break;
//        case NIMSystemNotificationTypeTeamApplyReject:
//        {
//            NSString *contact_fragment_group = LangKey(@"contact_fragment_group");//@"群".ntes_localized
//            NSString *message_helper_refuse_you = LangKey(@"message_helper_refuse_you");//@"拒绝你加入".ntes_localized
//            NIMTeam *team = [[NIMSDK sharedSDK].teamManager teamById:self.notification.targetID];
//            self.detailTextLabel.text = [NSString stringWithFormat:@"%@ %@ %@",
//                                         contact_fragment_group,
//                                         team.teamName,
//                                         message_helper_refuse_you];
//        }
//            break;
//        case NIMSystemNotificationTypeTeamInvite:
//        {
//            NSString *contact_fragment_group = LangKey(@"contact_fragment_group");//@"群".ntes_localized
//            NSString *invite_you_group = LangKey(@"invite_you_group");//@"邀请你加入".ntes_localized
//            NIMTeam *team = [[NIMSDK sharedSDK].teamManager teamById:self.notification.targetID];
//
//            self.detailTextLabel.text = [NSString stringWithFormat:@"%@ %@ %@ attach:%@",
//                                         contact_fragment_group,
//                                         team.teamName,
//                                         invite_you_group,
//                                         self.notification.notifyExt ? : @""];
//        }
//            break;
//        case NIMSystemNotificationTypeTeamIviteReject:
//        {
//            NSString *message_helper_refuse_group = LangKey(@"message_helper_refuse_group");
//            NSString *message_helper_invite = LangKey(@"message_helper_invite");//@"邀请".ntes_localized
//            NIMTeam *team = [[NIMSDK sharedSDK].teamManager teamById:self.notification.targetID];
//            self.detailTextLabel.text = [NSString stringWithFormat:@"%@ %@ %@",
//                                         message_helper_refuse_group,
//                                         team.teamName,
//                                         message_helper_invite];
//        }
//            break;
//        case NIMSystemNotificationTypeSuperTeamApply:
//        {
//            NSString *apply_join_supergroup = LangKey(@"apply_join_supergroup");//@"申请加入超大群 %@".ntes_localized
//            NIMTeam *team = [[NIMSDK sharedSDK].superTeamManager teamById:self.notification.targetID];
//            self.detailTextLabel.text = [NSString stringWithFormat:apply_join_supergroup, team.teamName];
//            break;
//        }
//        case NIMSystemNotificationTypeSuperTeamApplyReject:
//        {
//            NSString *large_group = LangKey(@"large_group");//超大群
//            NSString *to_deny_entry = LangKey(@"to_deny_entry");//拒绝你加入
//            NIMTeam *team = [[NIMSDK sharedSDK].superTeamManager teamById:self.notification.targetID];
//            self.detailTextLabel.text = [NSString stringWithFormat:@"%@ %@ %@",large_group, team.teamName,to_deny_entry];
//            break;
//        }
//        case NIMSystemNotificationTypeSuperTeamInvite:
//        {
//            NSString *large_group = LangKey(@"large_group");//超大群
//            NSString *invite_you_join_us = LangKey(@"invite_you_join_us");//邀请你加入
//            NIMTeam *team = [[NIMSDK sharedSDK].superTeamManager teamById:self.notification.targetID];
//            self.detailTextLabel.text = [NSString stringWithFormat:@"%@ %@  %@",large_group, team.teamName,invite_you_join_us];
//            break;
//        }
//        case NIMSystemNotificationTypeSuperTeamIviteReject:
//        {
//            NSString *rejected_group_invitation = LangKey(@"rejected_group_invitation");
//            NIMTeam *team = [[NIMSDK sharedSDK].superTeamManager teamById:self.notification.targetID];
//            self.detailTextLabel.text = [NSString stringWithFormat:@"%@ %@",rejected_group_invitation, team.teamName];
//            break;
//        }
//        case NIMSystemNotificationTypeFriendAdd:
//        {
//            NSString *text = @"未知请求".ntes_localized;
//            id object = self.notification.attachment;
//            if ([object isKindOfClass:[NIMUserAddAttachment class]]) {
//                NIMUserOperation operation = [(NIMUserAddAttachment *)object operationType];
//                NSString *serverExt = [(NIMUserAddAttachment *)object serverExt];
//
//                switch (operation) {
//                    case NIMUserOperationAdd:
//                        text = LangKey(@"message_helper_already_add");//@"已添加你为好友".ntes_localized;
//                        break;
//                    case NIMUserOperationRequest:
//                        text = LangKey(@"request_add_you_as_a_friend");//@"请求添加你为好友".ntes_localized;
//                        break;
//                    case NIMUserOperationVerify:
//                        text = LangKey(@"message_helper_allow_you_apply");//@"通过了你的好友请求".ntes_localized;
//                        break;
//                    case NIMUserOperationReject:
//                        text = LangKey(@"message_helper_refuse_you_apply");//@"拒绝了你的好友请求".ntes_localized;
//                        break;
//                    default:
//                        break;
//                }
//
//                if (serverExt && [serverExt length]) {
//                    text = [NSString stringWithFormat:@"%@（%@）", text, serverExt];
//                }
//            }
//
//            self.detailTextLabel.text = text;
//        }
//            break;
//        default:
//            break;
//    }
//    [self.detailTextLabel sizeToFit];
//    self.messageLabel.text = self.notification.postscript;
//    [self.messageLabel sizeToFit];
//    [self setNeedsLayout];
//}
//
//- (IBAction)onAccept:(id)sender {
//    if (_actionDelegate && [_actionDelegate respondsToSelector:@selector(onAccept:)]){
//        [_actionDelegate onAccept:self.notification];
//    }
//}
//- (IBAction)onRefuse:(id)sender {
//    if (_actionDelegate && [_actionDelegate respondsToSelector:@selector(onRefuse:)]){
//        [_actionDelegate onRefuse:self.notification];
//    }
//}
//
//- (BOOL)shouldHideActionButton
//{
//    NIMSystemNotificationType type = self.notification.type;
//    BOOL handled = self.notification.handleStatus != 0;
//    BOOL needHandle = NO;
//    if (type == NIMSystemNotificationTypeTeamApply ||
//        type == NIMSystemNotificationTypeTeamInvite ||
//        type == NIMSystemNotificationTypeSuperTeamApply ||
//        type == NIMSystemNotificationTypeSuperTeamInvite) {
//        needHandle = YES;
//    }
//    if (type == NIMSystemNotificationTypeFriendAdd) {
//        id object = self.notification.attachment;
//        if ([object isKindOfClass:[NIMUserAddAttachment class]]) {
//            NIMUserOperation operation = [(NIMUserAddAttachment *)object operationType];
//            needHandle = operation == NIMUserOperationRequest;
//        }
//    }
//    return !(!handled && needHandle);
//
//}
//
//#define MaxTextLabelWidth 120.0 * UISreenWidthScale
//#define MaxDetailLabelWidth 160.0 * UISreenWidthScale
//#define MaxMessageLabelWidth 150.0 * UISreenWidthScale
//#define TextLabelAndMessageLabelSpacing 20.f
//#define AvatarImageViewLeft 15.f
//#define MessageAndAvatarSpacing 15.f
//- (void)layoutSubviews{
//    [super layoutSubviews];
//    self.avatarImageView.centerY = self.height * .5f;
//    self.avatarImageView.left = AvatarImageViewLeft;
//    if (self.textLabel.width > MaxTextLabelWidth) {
//        self.textLabel.width = MaxTextLabelWidth;
//    }
//    if (self.detailTextLabel.width > MaxDetailLabelWidth) {
//        self.detailTextLabel.width = MaxDetailLabelWidth;
//    }
//    self.textLabel.left = self.avatarImageView.right + MessageAndAvatarSpacing;
//    self.detailTextLabel.left = self.textLabel.left;
//    self.detailTextLabel.bottom = self.avatarImageView.bottom;
//
////    if (self.messageLabel.width > MaxMessageLabelWidth) {
////        self.messageLabel.width = MaxMessageLabelWidth;
////    }
////    self.messageLabel.left = self.textLabel.right + TextLabelAndMessageLabelSpacing;
//
//}

@end
