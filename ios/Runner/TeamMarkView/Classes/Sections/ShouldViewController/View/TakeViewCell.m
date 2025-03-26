
#import <Foundation/Foundation.h>

NSString *StringFromSkillData(Byte *data);        


//: #333333
Byte str_soldierText[] = {47, 7, 87, 14, 204, 219, 52, 78, 51, 113, 213, 206, 5, 226, 204, 220, 220, 220, 220, 220, 220, 90};


//: ic_nodistrub_g
Byte str_mainlyName[] = {18, 14, 65, 14, 145, 87, 43, 50, 250, 125, 59, 69, 218, 137, 40, 34, 30, 45, 46, 35, 40, 50, 51, 49, 52, 33, 30, 38, 123};


//: #9B9EA8
Byte str_orationProofName[] = {28, 7, 90, 4, 201, 223, 232, 223, 235, 231, 222, 243};

// __DEBUG__
// __CLOSE_PRINT__
//
//  NTESSessionListCell.m
//  NIMDemo
//
//  Created by chris on 15/2/10.
//  Copyright (c) 2015年 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import "BBBSessionListCell.h"
#import "TakeViewCell.h"
//: #import "BBBAvatarImageView.h"
#import "AvatarControl.h"
//: #import "UIViewNimKit.h"
#import "UIViewNimKit.h"
//: #import "AAAKitUtil.h"
#import "TypicalCenter.h"
//: #import "NTESBadgeView.h"
#import "CuttingEdgeView.h"
//: #import "BBBKitInfoFetchOption.h"
#import "TitleOption.h"

//: @implementation BBBSessionListCell
@implementation TakeViewCell

//: - (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    //: self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    //: if (self) {
    if (self) {

        //: self.backgroundColor = [UIColor clearColor];
        self.backgroundColor = [UIColor clearColor];
        //: self.contentView.backgroundColor = [UIColor clearColor];
        self.contentView.backgroundColor = [UIColor clearColor];

        //: _avatarImageView = [[BBBAvatarImageView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
        _avatarImageView = [[AvatarControl alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
        //: [self.contentView addSubview:_avatarImageView];
        [self.contentView addSubview:_avatarImageView];

        //: _nameLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        //: _nameLabel.backgroundColor = [UIColor clearColor];
        _nameLabel.backgroundColor = [UIColor clearColor];
        //: _nameLabel.font = [UIFont boldSystemFontOfSize:15.f];
        _nameLabel.font = [UIFont boldSystemFontOfSize:15.f];
        //: _nameLabel.textColor = [UIColor colorWithHexString:@"#333333"];
        _nameLabel.textColor = [UIColor direction:StringFromSkillData(str_soldierText)];
        //: [self.contentView addSubview:_nameLabel];
        [self.contentView addSubview:_nameLabel];

        //: _messageLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _messageLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        //: _messageLabel.backgroundColor = [UIColor clearColor];
        _messageLabel.backgroundColor = [UIColor clearColor];
        //: _messageLabel.font = [UIFont systemFontOfSize:14.f];
        _messageLabel.font = [UIFont systemFontOfSize:14.f];
        //: _messageLabel.textColor = [UIColor colorWithHexString:@"#9B9EA8"];
        _messageLabel.textColor = [UIColor direction:StringFromSkillData(str_orationProofName)];
        //: [self.contentView addSubview:_messageLabel];
        [self.contentView addSubview:_messageLabel];

        //: _timeLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _timeLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        //: _timeLabel.backgroundColor = [UIColor clearColor];
        _timeLabel.backgroundColor = [UIColor clearColor];
        //: _timeLabel.font = [UIFont systemFontOfSize:12.f];
        _timeLabel.font = [UIFont systemFontOfSize:12.f];
        //: _timeLabel.textColor = [UIColor colorWithHexString:@"#9B9EA8"];
        _timeLabel.textColor = [UIColor direction:StringFromSkillData(str_orationProofName)];
        //: [self.contentView addSubview:_timeLabel];
        [self.contentView addSubview:_timeLabel];

        //: _badgeView = [NTESBadgeView viewWithBadgeTip:@""];
        _badgeView = [CuttingEdgeView whiteImage:@""];
        //: [self.contentView addSubview:_badgeView];
        [self.contentView addSubview:_badgeView];

        //: _disnodistrubImg = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 14, 14)];
        _disnodistrubImg = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 14, 14)];
        //: _disnodistrubImg.image = [UIImage imageNamed:@"ic_nodistrub_g"];
        _disnodistrubImg.image = [UIImage imageNamed:StringFromSkillData(str_mainlyName)];
        //: [self.contentView addSubview:_disnodistrubImg];
        [self.contentView addSubview:_disnodistrubImg];

    }
    //: return self;
    return self;
}




//: - (void)refresh:(NIMRecentSession*)recent{
- (void)kit:(NIMRecentSession*)recent{
    //: self.nameLabel.nim_width = self.nameLabel.nim_width > 160.f ? 160.f : self.nameLabel.nim_width;
    self.nameLabel.nim_width = self.nameLabel.nim_width > 160.f ? 160.f : self.nameLabel.nim_width;
    //: self.messageLabel.nim_width = self.messageLabel.nim_width > 200.f ? 200.f : self.messageLabel.nim_width;
    self.messageLabel.nim_width = self.messageLabel.nim_width > 200.f ? 200.f : self.messageLabel.nim_width;
//    if (recent.unreadCount) {
//        self.badgeView.hidden = NO;
//        self.badgeView.badgeValue = @(recent.unreadCount).stringValue;
//        self.disnodistrubImg.hidden = YES;
//    }else{
//        self.badgeView.hidden = YES;

        //: CCCKitInfo *info = nil;
        TitleInfo *info = nil;
        //: if (recent.session.sessionType == NIMSessionTypeTeam) {
        if (recent.session.sessionType == NIMSessionTypeTeam) {
            //: info = [[AppleProjectKit sharedKit] infoByTeam:recent.session.sessionId option:nil];
            info = [[Indicator reach] text:recent.session.sessionId byLabel:nil];
            //: NIMTeamNotifyState notifyState = [[[NIMSDK sharedSDK] teamManager] notifyStateForNewMsg:info.infoId];
            NIMTeamNotifyState notifyState = [[[NIMSDK sharedSDK] teamManager] notifyStateForNewMsg:info.infoId];
            //: BOOL ishidden = notifyState == NIMTeamNotifyStateAll ? YES: NO ;
            BOOL ishidden = notifyState == NIMTeamNotifyStateAll ? YES: NO ;//判断消息是否勿扰
            //: self.disnodistrubImg.hidden = ishidden;
            self.disnodistrubImg.hidden = ishidden;
            //: if (recent.unreadCount && ishidden) {
            if (recent.unreadCount && ishidden) {
                //: self.badgeView.hidden = NO;
                self.badgeView.hidden = NO;
                //: self.badgeView.badgeValue = @(recent.unreadCount).stringValue;
                self.badgeView.badgeValue = @(recent.unreadCount).stringValue;
                //: self.disnodistrubImg.hidden = YES;
                self.disnodistrubImg.hidden = YES;
            //: }else{
            }else{
                //: self.badgeView.hidden = YES;
                self.badgeView.hidden = YES;
            }

        //: } else if (recent.session.sessionType == NIMSessionTypeP2P) {
        } else if (recent.session.sessionType == NIMSessionTypeP2P) {
            //: BBBKitInfoFetchOption *option = [[BBBKitInfoFetchOption alloc] init];
            TitleOption *option = [[TitleOption alloc] init];
            //: option.session = recent.session;
            option.session = recent.session;
            //: info = [[AppleProjectKit sharedKit] infoByUser:recent.session.sessionId option:option];
            info = [[Indicator reach] indoors:recent.session.sessionId harvest:option];

            //: BOOL ishidden = [[NIMSDK sharedSDK].userManager notifyForNewMsg:info.infoId];
            BOOL ishidden = [[NIMSDK sharedSDK].userManager notifyForNewMsg:info.infoId];//判断消息是否勿扰
            //: self.disnodistrubImg.hidden = ishidden;
            self.disnodistrubImg.hidden = ishidden;

                //: if (recent.unreadCount && ishidden) {
                if (recent.unreadCount && ishidden) {
                    //: self.badgeView.hidden = NO;
                    self.badgeView.hidden = NO;
                    //: self.badgeView.badgeValue = @(recent.unreadCount).stringValue;
                    self.badgeView.badgeValue = @(recent.unreadCount).stringValue;
                    //: self.disnodistrubImg.hidden = YES;
                    self.disnodistrubImg.hidden = YES;
                //: }else{
                }else{
                    //: self.badgeView.hidden = YES;
                    self.badgeView.hidden = YES;
                }


        }
//    }





}


//: - (void)layoutSubviews{
- (void)layoutSubviews{
    //: [super layoutSubviews];
    [super layoutSubviews];
    //Session List
    //: NSInteger sessionListAvatarLeft = 15;
    NSInteger sessionListAvatarLeft = 15;
    //: NSInteger sessionListNameTop = 15;
    NSInteger sessionListNameTop = 15;
    //: NSInteger sessionListNameLeftToAvatar = 15;
    NSInteger sessionListNameLeftToAvatar = 15;
    //: NSInteger sessionListMessageLeftToAvatar = 15;
    NSInteger sessionListMessageLeftToAvatar = 15;
    //: NSInteger sessionListMessageBottom = 15;
    NSInteger sessionListMessageBottom = 15;
    //: NSInteger sessionListTimeRight = 15;
    NSInteger sessionListTimeRight = 15;
    //: NSInteger sessionListTimeTop = 15;
    NSInteger sessionListTimeTop = 15;
    //: NSInteger sessionBadgeTimeBottom = 15;
    NSInteger sessionBadgeTimeBottom = 15;
    //: NSInteger sessionBadgeTimeRight = 15;
    NSInteger sessionBadgeTimeRight = 15;

    //: _avatarImageView.nim_left = sessionListAvatarLeft;
    _avatarImageView.nim_left = sessionListAvatarLeft;
    //: _avatarImageView.nim_centerY = self.nim_height * .5f;
    _avatarImageView.nim_centerY = self.nim_height * .5f;
    //: _nameLabel.nim_top = sessionListNameTop;
    _nameLabel.nim_top = sessionListNameTop;
    //: _nameLabel.nim_left = _avatarImageView.nim_right + sessionListNameLeftToAvatar;
    _nameLabel.nim_left = _avatarImageView.nim_right + sessionListNameLeftToAvatar;
    //: _messageLabel.nim_left = _avatarImageView.nim_right + sessionListMessageLeftToAvatar;
    _messageLabel.nim_left = _avatarImageView.nim_right + sessionListMessageLeftToAvatar;
    //: _messageLabel.nim_bottom = self.nim_height - sessionListMessageBottom;
    _messageLabel.nim_bottom = self.nim_height - sessionListMessageBottom;
    //: _timeLabel.nim_right = self.nim_width - sessionListTimeRight;
    _timeLabel.nim_right = self.nim_width - sessionListTimeRight;
    //: _timeLabel.nim_top = sessionListTimeTop;
    _timeLabel.nim_top = sessionListTimeTop;
    //: _badgeView.nim_right = self.nim_width - sessionBadgeTimeRight;
    _badgeView.nim_right = self.nim_width - sessionBadgeTimeRight;
    //: _badgeView.nim_bottom = self.nim_height - sessionBadgeTimeBottom;
    _badgeView.nim_bottom = self.nim_height - sessionBadgeTimeBottom;

    //: _disnodistrubImg.nim_right = self.nim_width - sessionBadgeTimeRight;
    _disnodistrubImg.nim_right = self.nim_width - sessionBadgeTimeRight;
    //: _disnodistrubImg.nim_bottom = self.nim_height - sessionBadgeTimeBottom;
    _disnodistrubImg.nim_bottom = self.nim_height - sessionBadgeTimeBottom;

}

//: @end
@end

Byte * SkillDataToCache(Byte *data) {
    int leasedFishing = data[0];
    int aleOrigin = data[1];
    Byte namePot = data[2];
    int goToMeeting = data[3];
    if (!leasedFishing) return data + goToMeeting;
    for (int i = goToMeeting; i < goToMeeting + aleOrigin; i++) {
        int value = data[i] + namePot;
        if (value > 255) {
            value -= 256;
        }
        data[i] = value;
    }
    data[0] = 0;
    data[goToMeeting + aleOrigin] = 0;
    return data + goToMeeting;
}

NSString *StringFromSkillData(Byte *data) {
    return [NSString stringWithUTF8String:(char *)SkillDataToCache(data)];
}
