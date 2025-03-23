//
//  NTESSessionListCell.m
//  NIMDemo
//
//  Created by chris on 15/2/10.
//  Copyright (c) 2015年 Netease. All rights reserved.
//

#import "BBBSessionListCell.h"
#import "BBBAvatarImageView.h"
#import "UIViewNimKit.h"
#import "AAAKitUtil.h"
#import "NTESBadgeView.h"
#import "BBBKitInfoFetchOption.h"


@implementation BBBSessionListCell
#define AvatarWidth 40
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.backgroundColor = [UIColor clearColor];
        self.contentView.backgroundColor = [UIColor clearColor];
        
        _avatarImageView = [[BBBAvatarImageView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
        [self.contentView addSubview:_avatarImageView];
        
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _nameLabel.backgroundColor = [UIColor clearColor];
        _nameLabel.font            = [UIFont boldSystemFontOfSize:15.f];
        _nameLabel.textColor       = RGB_COLOR_String(@"#333333");
        [self.contentView addSubview:_nameLabel];
        
        _messageLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _messageLabel.backgroundColor = [UIColor clearColor];
        _messageLabel.font            = [UIFont systemFontOfSize:14.f];
        _messageLabel.textColor       = RGB_COLOR_String(@"#9B9EA8");
        [self.contentView addSubview:_messageLabel];
        
        _timeLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _timeLabel.backgroundColor = [UIColor clearColor];
        _timeLabel.font            = [UIFont systemFontOfSize:12.f];
        _timeLabel.textColor       = RGB_COLOR_String(@"#9B9EA8");
        [self.contentView addSubview:_timeLabel];
        
        _badgeView = [NTESBadgeView viewWithBadgeTip:@""];
        [self.contentView addSubview:_badgeView];
        
        _disnodistrubImg = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 14, 14)];
        _disnodistrubImg.image = [UIImage imageNamed:@"ic_nodistrub_g"];
        [self.contentView addSubview:_disnodistrubImg];
        
    }
    return self;
}


#define NameLabelMaxWidth    160.f
#define MessageLabelMaxWidth 200.f
- (void)refresh:(NIMRecentSession*)recent{
    self.nameLabel.nim_width = self.nameLabel.nim_width > NameLabelMaxWidth ? NameLabelMaxWidth : self.nameLabel.nim_width;
    self.messageLabel.nim_width = self.messageLabel.nim_width > MessageLabelMaxWidth ? MessageLabelMaxWidth : self.messageLabel.nim_width;
//    if (recent.unreadCount) {
//        self.badgeView.hidden = NO;
//        self.badgeView.badgeValue = @(recent.unreadCount).stringValue;
//        self.disnodistrubImg.hidden = YES;
//    }else{
//        self.badgeView.hidden = YES;

        CCCKitInfo *info = nil;
        if (recent.session.sessionType == NIMSessionTypeTeam) {
            info = [[AppleProjectKit sharedKit] infoByTeam:recent.session.sessionId option:nil];
            NIMTeamNotifyState notifyState = [[[NIMSDK sharedSDK] teamManager] notifyStateForNewMsg:info.infoId];
            BOOL ishidden = notifyState == NIMTeamNotifyStateAll ? YES: NO ;//判断消息是否勿扰
            self.disnodistrubImg.hidden = ishidden;
            if (recent.unreadCount && ishidden) {
                self.badgeView.hidden = NO;
                self.badgeView.badgeValue = @(recent.unreadCount).stringValue;
                self.disnodistrubImg.hidden = YES;
            }else{
                self.badgeView.hidden = YES;
            }

        } else if (recent.session.sessionType == NIMSessionTypeP2P) {
            BBBKitInfoFetchOption *option = [[BBBKitInfoFetchOption alloc] init];
            option.session = recent.session;
            info = [[AppleProjectKit sharedKit] infoByUser:recent.session.sessionId option:option];

            BOOL ishidden = [[NIMSDK sharedSDK].userManager notifyForNewMsg:info.infoId];//判断消息是否勿扰
            self.disnodistrubImg.hidden =  ishidden;
            
                if (recent.unreadCount && ishidden) {
                    self.badgeView.hidden = NO;
                    self.badgeView.badgeValue = @(recent.unreadCount).stringValue;
                    self.disnodistrubImg.hidden = YES;
                }else{
                    self.badgeView.hidden = YES;
                }
           
            
        }
//    }
    

    
    
    
}


- (void)layoutSubviews{
    [super layoutSubviews];
    //Session List
    NSInteger sessionListAvatarLeft             = 15;
    NSInteger sessionListNameTop                = 15;
    NSInteger sessionListNameLeftToAvatar       = 15;
    NSInteger sessionListMessageLeftToAvatar    = 15;
    NSInteger sessionListMessageBottom          = 15;
    NSInteger sessionListTimeRight              = 15;
    NSInteger sessionListTimeTop                = 15;
    NSInteger sessionBadgeTimeBottom            = 15;
    NSInteger sessionBadgeTimeRight             = 15;
    
    _avatarImageView.nim_left    = sessionListAvatarLeft;
    _avatarImageView.nim_centerY = self.nim_height * .5f;
    _nameLabel.nim_top           = sessionListNameTop;
    _nameLabel.nim_left          = _avatarImageView.nim_right + sessionListNameLeftToAvatar;
    _messageLabel.nim_left       = _avatarImageView.nim_right + sessionListMessageLeftToAvatar;
    _messageLabel.nim_bottom     = self.nim_height - sessionListMessageBottom;
    _timeLabel.nim_right         = self.nim_width - sessionListTimeRight;
    _timeLabel.nim_top           = sessionListTimeTop;
    _badgeView.nim_right         = self.nim_width - sessionBadgeTimeRight;
    _badgeView.nim_bottom        = self.nim_height - sessionBadgeTimeBottom;
    
    _disnodistrubImg.nim_right  = self.nim_width - sessionBadgeTimeRight;
    _disnodistrubImg.nim_bottom        = self.nim_height - sessionBadgeTimeBottom;
    
}

@end
