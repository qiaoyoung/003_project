//
//  NIMAdvancedTeamCardCell.m
//  NIM
//
//  Created by 彭爽 on 2021/10/22.
//  Copyright © 2021 Netease. All rights reserved.
//

#import "NIMAdvancedTeamCardCell.h"

@implementation NIMAdvancedTeamCardCell

- (void)initSubviews{
    
    self.backgroundColor = [UIColor clearColor];
    UIView *whiteView = [[UIView alloc] init];
    whiteView.backgroundColor = [UIColor whiteColor];
    [self addSubview:whiteView];
    whiteView.layer.masksToBounds = YES;
    whiteView.layer.cornerRadius = 5;
    [whiteView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(10);
        make.right.mas_offset(-10);
        make.top.mas_offset(0);
        make.bottom.mas_offset(0);
        make.height.mas_equalTo(120);
    }];

    UILabel *label = [[UILabel alloc] init];
    label.text = LangKey(@"Group_master_administrator");//@"群主及管理员";
    label.font = [UIFont systemFontOfSize:16];
    label.textColor = RGB_COLOR_String(@"#3F3F3F");
    [whiteView addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(15);
        make.top.mas_offset(20);
        make.width.mas_equalTo(150);
        make.height.mas_equalTo(20);
    }];
    
//    UIImageView *iconImageView = [[UIImageView alloc] init];
//    iconImageView.image = [UIImage grayImageWithName:@"contact_group_header" color:RGB_COLOR_String(kCommonBGColor_All)];
//    [whiteView addSubview:iconImageView];
//    [iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_offset(15);
//        make.top.mas_equalTo(label.mas_bottom).mas_offset(15);
//        make.width.height.mas_equalTo(50);
//    }];
    
    _headerBackView = [[UIView alloc] init];
    [whiteView addSubview:_headerBackView];
    [_headerBackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(10);
        make.top.mas_equalTo(label.mas_bottom).mas_offset(15);
        make.height.mas_equalTo(50);
        make.right.mas_equalTo(-10);

    }];
    
    
    UIImageView *arrowImage = [[UIImageView alloc] init];
    arrowImage.image = [UIImage imageNamed:@"mine_btn_right"];
    [whiteView addSubview:arrowImage];
    [arrowImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_offset(-10);
        make.centerY.mas_equalTo(whiteView.mas_centerY);
        make.width.mas_equalTo(12);
        make.height.mas_equalTo(12);
    }];
    
    _titleLabel= [[UILabel alloc] init];
    _titleLabel.text = LangKey(@"activity_group_info_look_member");//@"查看群成员";
    _titleLabel.font = [UIFont systemFontOfSize:15];
    _titleLabel.textColor = [UIColor lightGrayColor];
    _titleLabel.textAlignment = NSTextAlignmentRight;
    [whiteView addSubview:_titleLabel];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(arrowImage.mas_left).mas_offset(-1);
        make.top.mas_offset(20);
        make.width.mas_equalTo(150);
        make.height.mas_equalTo(20);
    }];
    
    UIButton *cheakButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [cheakButton addTarget:self action:@selector(cheakButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [whiteView addSubview:cheakButton];
    [cheakButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_offset(0);
        make.top.mas_offset(0);
        make.height.mas_equalTo(50);
        make.width.mas_equalTo(100);
    }];
}

-(void)reloadWith:(BBBTeamListDataManager *)teamListManager{
    
//    NSString *titleStr = [NSString stringWithFormat:@"查看%ld名群成员",(long)teamListManager.memberNumber];
//    NSString *titleStr = [NSString stringWithFormat:@"%@%ld%@",LangKey(@"check"),(long)teamListManager.memberNumber,LangKey(@"members_of_group")];

    NSString *titleStr = [NSString stringWithFormat:@"%@ %@",LangKey(@"check"),LangKey(@"members_of_group")];

    _titleLabel.text = titleStr;
    
    for (int i = 0; i < MIN(5, teamListManager.members.count); i++) {
        BBBTeamCardMemberItem *obj = teamListManager.members[i];
        BBBKitInfoFetchOption *option = [[BBBKitInfoFetchOption alloc] init];
        option.session = teamListManager.session;
        CCCKitInfo *info = [[AppleProjectKit sharedKit] infoByUser:obj.userId option:option];
        
        NSString *avatarUrlString = info.avatarUrlString;//头像
        NSArray *avatarUrlStringArray = [avatarUrlString componentsSeparatedByString:@"?"];
        
        UIImageView *imageView = [[UIImageView alloc] init];
        [imageView sd_setImageWithURL:[NSURL URLWithString:avatarUrlStringArray.firstObject]];
        [_headerBackView addSubview:imageView];
        imageView.layer.masksToBounds = YES;
        imageView.layer.cornerRadius = 25;
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_offset(60*i);
            make.top.mas_offset(0);
            make.height.width.mas_equalTo(50);
        }];
        
    }
}
//查看群成员
-(void)cheakButtonClick{
    [_vc enterMemberCard];
}


@end


@implementation NIMAdvancedTeamCardCell_1

- (void)initSubviews{
}

- (void)setTeamListManager:(BBBTeamListDataManager *)teamListManager {
    _teamListManager = teamListManager;
    
    BOOL isOwner    = teamListManager.myTeamInfo.type == NIMTeamMemberTypeOwner;
    BOOL isManager  = teamListManager.myTeamInfo.type == NIMTeamMemberTypeManager;

    __block NSInteger cellCount = 1;
    if (isManager || isOwner) {
        cellCount = 2;
    }
    
    if (!_whiteView) {
    
        self.backgroundColor = [UIColor clearColor];
        UIView *whiteView = [[UIView alloc] init];
        whiteView.backgroundColor = [UIColor whiteColor];
        [self addSubview:whiteView];
        whiteView.layer.masksToBounds = YES;
        whiteView.layer.cornerRadius = 5;
        
        [whiteView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_offset(10);
            make.right.mas_offset(-10);
            make.top.mas_offset(0);
            make.bottom.mas_offset(0);
            make.height.mas_equalTo(50*cellCount);
        }];
        
        for (int i = 0; i < cellCount; i++) {
            
            UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            backBtn.tag = 100 +i;
            [backBtn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
            [whiteView addSubview:backBtn];
            [backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_offset(0);
                make.top.mas_offset(50*i);
                make.right.mas_equalTo(0);
                make.height.mas_equalTo(50);
            }];
            
            UILabel *label = [[UILabel alloc] init];
            label.font = [UIFont systemFontOfSize:16];
            label.textColor = RGB_COLOR_String(@"#3F3F3F");
            [whiteView addSubview:label];
            [label mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_offset(15);
                make.top.mas_offset(50*i);
                make.width.mas_equalTo(200);
                make.height.mas_equalTo(50);
            }];
            UIImageView *arrowImage = [[UIImageView alloc] init];
            arrowImage.image = [UIImage imageNamed:@"mine_btn_right"];
            [whiteView addSubview:arrowImage];
            [arrowImage mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.mas_offset(-10);
                make.centerY.mas_equalTo(whiteView.mas_centerY);
                make.width.mas_equalTo(12);
                make.height.mas_equalTo(12);
            }];
            
            UIView *line = [[UIView alloc] init];
            line.backgroundColor = RGB_COLOR_String(@"#F7F8FB");
            [whiteView addSubview:line];
            [line mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_offset(10);
                make.top.mas_offset(50*i);
                make.right.mas_offset(-10);
                make.height.mas_equalTo(1);
            }];
            
            switch (i) {
                case 0:
                    label.text = LangKey(@"Invite_group_members");//@"邀请群成员";
                    line.hidden = YES;
                    
                    break;
                case 1:
                    label.text = LangKey(@"Removing_group_members");//@"移除群成员";
                    break;
                default:
                    break;
            }
        }
    }
}

-(void)buttonClick:(UIButton *)sender{
    NSInteger tag = sender.tag -100;
    if (tag == 0) {
        [_vc didSelectAddOpeartor];
    }else if (tag == 1){
        [_vc enterMemberCard];
    }
}
-(void)reloadWith:(BBBTeamListDataManager *)teamListManager{
    
}

@end



@implementation NIMAdvancedTeamCardCell_2

- (void)initSubviews{
}

- (void)setTeamListManager:(BBBTeamListDataManager *)teamListManager {
    _teamListManager = teamListManager;
    
    BOOL isOwner    = teamListManager.myTeamInfo.type == NIMTeamMemberTypeOwner;
    BOOL isManager  = teamListManager.myTeamInfo.type == NIMTeamMemberTypeManager;
    
    if (!_whiteView) {
        
        NSInteger cellCount = 6;
        if (isManager || isOwner) {
            cellCount = 8;
        }
        
        self.backgroundColor = [UIColor clearColor];
        UIView *whiteView = [[UIView alloc] init];
        whiteView.backgroundColor = [UIColor whiteColor];
        [self addSubview:whiteView];
        whiteView.layer.masksToBounds = YES;
        whiteView.layer.cornerRadius = 5;
        _whiteView = whiteView;
        [whiteView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_offset(10);
            make.right.mas_offset(-10);
            make.top.mas_offset(0);
            make.bottom.mas_offset(0);
            make.height.mas_equalTo(50*cellCount);
        }];
        
        __block NSInteger heightCount = 0;
        for (int i = 0; i < 8; i++) {
                    
            @weakify(self);
            NIMAdvancedTeamSubview *(^newSubView)(void) = ^NIMAdvancedTeamSubview *(void){
                @strongify(self);
                NIMAdvancedTeamSubview *subview = [[NIMAdvancedTeamSubview alloc] init];
                subview.tag = 1000+i;
                subview.backButton.tag = 2000+i;
                [subview.backButton addTarget:self action:@selector(backButtonClick:) forControlEvents:UIControlEventTouchUpInside];
                [whiteView addSubview:subview];
                [subview mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.left.mas_offset(0);
                    make.right.mas_offset(0);
                    make.top.mas_offset(50*heightCount);
                    make.height.mas_equalTo(50);
                }];
                
                heightCount += 1;

                return subview;
            };
            
            
            switch (i) {
                case 0:
                {
                    NIMAdvancedTeamSubview *subview = newSubView();
                    subview.titleLabel.text = LangKey(@"Group_name");//@"群名称";

                }
                    break;
                case 1:
                {
                    NIMAdvancedTeamSubview *subview = newSubView();
                    subview.titleLabel.text = LangKey(@"activity_group_info_group_nick");//@"群昵称";

                }
                    break;
                case 2:
                {
                    NIMAdvancedTeamSubview *subview = newSubView();
                    subview.titleLabel.text = LangKey(@"team_info_set_activity_group_tip");//@"群介绍";

                }
                    break;
                case 3:
                {
                    NIMAdvancedTeamSubview *subview = newSubView();
                    subview.titleLabel.text = LangKey(@"activity_group_info_group_toast");//@"群公告";

                }
                    break;
                case 4:
                {
                    if (isManager || isOwner) {
                        NIMAdvancedTeamSubview *subview = newSubView();
                        subview.titleLabel.text = LangKey(@"activity_group_info_group_mute");//@"群禁言";
                    }

                }
                    break;
                case 5:
                {
                    if (isManager || isOwner) {
                        NIMAdvancedTeamSubview *subview = newSubView();
                        subview.titleLabel.text = LangKey(@"activity_group_info_mute_list");//@"禁言列表";
                    }

                }
                    break;
                case 6:
                {
                    NIMAdvancedTeamSubview *subview = newSubView();
                    subview.titleLabel.text = LangKey(@"message_info_activity_msg_notice");//@"消息提醒";

                }
                    break;
                case 7:
                {
                    NIMAdvancedTeamSubview *subview = newSubView();
                    subview.titleLabel.text = LangKey(@"Chat_settop");//@"聊天置顶";

                }
                    break;

                default:
                    break;
            }
        }
    }    
}

-(void)reloadWith:(BBBTeamListDataManager *)teamListManager{
    _teamListManager = teamListManager;
    BOOL canEdit = [AAAKitUtil canEditTeamInfo:teamListManager.myTeamInfo];
    BOOL isOwner    = teamListManager.myTeamInfo.type == NIMTeamMemberTypeOwner;
    BOOL isManager  = teamListManager.myTeamInfo.type == NIMTeamMemberTypeManager;
    
    for (NIMAdvancedTeamSubview *subview in _whiteView.subviews) {
        switch (subview.tag -1000) {
            case 0:
            {
                subview.titleLabel.text = LangKey(@"Group_name");//@"群名称";
                subview.contentLabel.text = teamListManager.team.teamName;
                
            }
                break;
            case 1:
            {
                subview.titleLabel.text = LangKey(@"activity_group_info_group_nick");//@"群昵称";
                subview.contentLabel.text = teamListManager.myTeamInfo.nickname;
                
            }
                break;
            case 2:
            {
                subview.titleLabel.text = LangKey(@"team_info_set_activity_group_tip");//@"群介绍";
                subview.contentLabel.text = teamListManager.team.intro.length ? teamListManager.team.intro : (canEdit ? LangKey(@"team_info_set_activity_default_group_tip") : @"");
                
            }
                break;
            case 3:
            {
                subview.titleLabel.text = LangKey(@"activity_group_info_group_toast");//@"群公告";
                subview.contentLabel.text = LangKey(@"Click_view_group_announcements");//@"点击查看群公告".nim_localized;
                
            }
                break;
            case 4:
            {
                subview.titleLabel.text = LangKey(@"activity_group_info_group_mute");//@"群禁言";
                BOOL inAllMuteMode = teamListManager.team.inAllMuteMode;
                subview.contentLabel.text = [BBBTeamHelper teamMuteText:inAllMuteMode];
                
                
            }
                break;
            case 5:
            {
                subview.titleLabel.text = LangKey(@"group_mute_member_list_activity_title");//@"禁言列表";
                
            }
                break;
            case 6:
            {
                subview.titleLabel.text = LangKey(@"activity_comment_setting_msg_notify");//@"消息提醒";
                subview.contentLabel.text = [BBBTeamHelper notifyStateText:teamListManager.team.notifyStateForNewMsg];
                
            }
                break;
            case 7:
            {
                subview.titleLabel.text = LangKey(@"Chat_settop");//@"聊天置顶";
                subview.switchView.hidden = NO;
                subview.switchView.on = self.option.isTop;
                [subview.switchView addTarget:self action:@selector(switchAction:) forControlEvents:UIControlEventValueChanged];
                subview.backButton.userInteractionEnabled = NO;
                subview.arrowImage.hidden = YES;
                
            }
                break;
                
            default:
                break;
        }
    }
    
    
}

-(void)backButtonClick:(UIButton *)sender{
    BOOL canEdit = [AAAKitUtil canEditTeamInfo:self.teamListManager.myTeamInfo];
    
    NSInteger tag = sender.tag - 2000;
    switch (tag) {
        case 0:
        {
            if (canEdit) {
                [_vc updateTeamName];
            }
        }
            break;
        case 1:
        {
            [_vc updateTeamNick];
        }
            break;
        case 2:
        {
            if (canEdit) {
                [_vc updateTeamIntro];
            }

        }
            break;
        case 3:
        {
            [_vc updateTeamAnnouncement];

        }
            break;
        case 4:
        {
            BOOL inAllMuteMode = self.teamListManager.team.inAllMuteMode;
            BBBTeamCardRowItem *teamMute = [[BBBTeamCardRowItem alloc] init];
            teamMute.title = LangKey(@"activity_group_info_group_mute");//@"群禁言".nim_localized;
            teamMute.subTitle = [BBBTeamHelper teamMuteText:inAllMuteMode];
            teamMute.rowHeight = 50.f;
            teamMute.type = TeamCardRowItemTypeSelected;
            teamMute.optionItems = [BBBTeamHelper teamMuteItemsWithSeleced:inAllMuteMode];
            teamMute.actionDisabled = !canEdit;
            teamMute.selectedBlock = ^(id<NIMKitSelectCardData> item) {
                [_vc didUpdateTeamMute:[item.value integerValue]];
            };
            BBBTeamCardSelectedViewController *vc = [BBBTeamCardSelectedViewController instanceWithTitle:teamMute.title
                                                                                   items:teamMute.optionItems
                                                                                  result:^(id<NIMKitSelectCardData>  _Nonnull item) {
                  if (teamMute.selectedBlock) {
                      teamMute.selectedBlock(item);
                  }
              }];
            [_vc.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 5:
        {
            [_vc enterMuteList];
        }
            break;
        case 6:
        {
            BBBTeamCardRowItem *teamNotify = [[BBBTeamCardRowItem alloc] init];
            teamNotify.title  = LangKey(@"message_info_activity_msg_notice");//@"消息提醒".nim_localized;
            teamNotify.subTitle = [BBBTeamHelper notifyStateText:self.teamListManager.team.notifyStateForNewMsg];
            teamNotify.rowHeight = 50.f;
            teamNotify.type = TeamCardRowItemTypeSelected;
            teamNotify.optionItems = [BBBTeamHelper notifyStateItemsWithSeleced:self.teamListManager.team.notifyStateForNewMsg];
            teamNotify.selectedBlock = ^(id<NIMKitSelectCardData> item) {
                [_vc didUpdateNotifiyState:[item.value integerValue]];
            };
            BBBTeamCardSelectedViewController *vc = [BBBTeamCardSelectedViewController instanceWithTitle:teamNotify.title
                                                                                   items:teamNotify.optionItems
                                                                                  result:^(id<NIMKitSelectCardData>  _Nonnull item) {
                  if (teamNotify.selectedBlock) {
                      teamNotify.selectedBlock(item);
                  }
              }];
            [_vc.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 7:
        {
            
        }
            break;
            
        default:
            break;
    }
    
    
}

-(void)switchAction:(UISwitch *)switchview{
    BOOL isTop = switchview.on;
    NIMSession *session = _teamListManager.session;
    NIMRecentSession *recent = [[NIMSDK sharedSDK].conversationManager recentSessionBySession:session];
    if (isTop) {
        if (!recent) {
            [[NIMSDK sharedSDK].conversationManager addEmptyRecentSessionBySession:session];
        }
        NIMAddStickTopSessionParams *params = [[NIMAddStickTopSessionParams alloc] initWithSession:session];
        [NIMSDK.sharedSDK.chatExtendManager addStickTopSession:params completion:nil];
    } else {
        if (recent) {
            NIMStickTopSessionInfo *stickTopInfo = [NIMSDK.sharedSDK.chatExtendManager stickTopInfoForSession:session];
            [NIMSDK.sharedSDK.chatExtendManager removeStickTopSession:stickTopInfo completion:nil];
        } else {}
    }
}



@end

@implementation NIMAdvancedTeamCardCell_3

- (void)initSubviews{
    self.backgroundColor = [UIColor clearColor];
    UIView *whiteView = [[UIView alloc] init];
    whiteView.backgroundColor = [UIColor whiteColor];
    [self addSubview:whiteView];
    whiteView.layer.masksToBounds = YES;
    whiteView.layer.cornerRadius = 5;
    [whiteView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(10);
        make.right.mas_offset(-10);
        make.top.mas_offset(0);
        make.bottom.mas_offset(0);
        make.height.mas_equalTo(50);
    }];
    
    for (int i = 0; i < 1; i++) {
        NIMAdvancedTeamSubview *subview = [[NIMAdvancedTeamSubview alloc] init];
        subview.tag = 1000+i;
        subview.backButton.tag = 2000+i;
        [subview.backButton addTarget:self action:@selector(backButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [whiteView addSubview:subview];
        [subview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_offset(0);
            make.right.mas_offset(0);
            make.top.mas_offset(50*i);
            make.height.mas_equalTo(50);
        }];
        [subview.backButton addTarget:self action:@selector(backButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        subview.titleLabel.text = LangKey(@"activity_user_profile_clear_chat");//@"清除聊天记录";
        subview.arrowImage.hidden = YES;
        
    }
}

-(void)backButtonClick:(UIButton *)sender{
    
    UIAlertAction *sure = [UIAlertAction actionWithTitle:LangKey(@"contact_tag_fragment_sure") style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self clearLocalityMessage];
    }];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:LangKey(@"contact_tag_fragment_cancel")
                                                     style:UIAlertActionStyleCancel
                                                   handler:nil];
    NSString *title = LangKey(@"clear_history");//@"确定清空聊天记录?";
    UIAlertController *sheet = [UIAlertController alertControllerWithTitle:title message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    [sheet addAction:sure];
    [sheet addAction:cancel];
    [self.viewController presentViewController:sheet animated:YES completion:nil];
    
}

-(void)clearLocalityMessage{
    
//    BOOL removeRecentSession = [NTESBundleSetting sharedConfig].removeSessionWhenDeleteMessages;
//    BOOL removeTable = [NTESBundleSetting sharedConfig].dropTableWhenDeleteMessages;
//    NIMDeleteMessagesOption *option = [[NIMDeleteMessagesOption alloc] init];
//    option.removeSession = removeRecentSession;
    
    NIMBatchDeleteMessagesOption *option = [[NIMBatchDeleteMessagesOption alloc] init];
    option.start = 0;
    [[NIMSDK sharedSDK].conversationManager deleteMessagesInSession:_teamListManager.session option:option completion:^(NSError * _Nullable error) {
        
    }];
    
    UIAlertController *result = [UIAlertController alertControllerWithTitle:@"" message:LangKey(@"Clean_success") preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:LangKey(@"got_it") style:UIAlertActionStyleCancel handler:nil];
    [result addAction:action];
    [self.viewController presentViewController:result animated:YES completion:nil];
    
}
-(void)reloadWith:(BBBTeamListDataManager *)teamListManager{
    
}
@end


@implementation NIMAdvancedTeamCardCell_4

- (void)initSubviews{
    self.backgroundColor = [UIColor clearColor];
    UIView *whiteView = [[UIView alloc] init];
    whiteView.backgroundColor = [UIColor whiteColor];
    [self addSubview:whiteView];
    whiteView.layer.masksToBounds = YES;
    whiteView.layer.cornerRadius = 5;
    _whiteView = whiteView;
    [whiteView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(10);
        make.right.mas_offset(-10);
        make.top.mas_offset(0);
        make.bottom.mas_offset(0);
        make.height.mas_equalTo(50);
    }];
    
 
    for (int i = 0; i < 1; i++) {
        NIMAdvancedTeamSubview *subview = [[NIMAdvancedTeamSubview alloc] init];
        subview.tag = 1000+i;
        subview.backButton.tag = 2000+i;
        [subview.backButton addTarget:self action:@selector(backButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [whiteView addSubview:subview];
        [subview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_offset(0);
            make.right.mas_offset(0);
            make.top.mas_offset(50*i);
            make.height.mas_equalTo(50);
        }];
        [subview.backButton addTarget:self action:@selector(backButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        subview.titleLabel.text = LangKey(@"authentication");//@"身份验证";
    }
}
-(void)reloadWith:(BBBTeamListDataManager *)teamListManager{
    NIMAdvancedTeamSubview *subview = [_whiteView viewWithTag:1000];
    subview.contentLabel.text = [BBBTeamHelper jonModeText:self.teamListManager.team.joinMode];

}

-(void)backButtonClick:(UIButton *)sender{
    BOOL canEdit = [AAAKitUtil canEditTeamInfo:_teamListManager.myTeamInfo];
    BBBTeamCardRowItem *itemAuth = [[BBBTeamCardRowItem alloc] init];
    itemAuth.title  = LangKey(@"authentication");//@"身份验证".nim_localized;
    itemAuth.subTitle = [BBBTeamHelper jonModeText:self.teamListManager.team.joinMode];
    itemAuth.actionDisabled = !canEdit;
    itemAuth.rowHeight = 60.f;
    itemAuth.type   = TeamCardRowItemTypeSelected;
    itemAuth.optionItems = [BBBTeamHelper joinModeItemsWithSeleced:self.teamListManager.team.joinMode];
    itemAuth.selectedBlock = ^(id<NIMKitSelectCardData> item) {
        [_vc didupdateTeamJoinMode:[item.value integerValue]];
    };
    BBBTeamCardSelectedViewController *vc = [BBBTeamCardSelectedViewController instanceWithTitle:itemAuth.title
                                                                           items:itemAuth.optionItems
                                                                          result:^(id<NIMKitSelectCardData>  _Nonnull item) {
          if (itemAuth.selectedBlock) {
              itemAuth.selectedBlock(item);
          }
      }];
    [_vc.navigationController pushViewController:vc animated:YES];
}

@end

@implementation NIMAdvancedTeamCardCell_5

- (void)initSubviews{
    self.backgroundColor = [UIColor clearColor];
    UIView *whiteView = [[UIView alloc] init];
    whiteView.backgroundColor = [UIColor whiteColor];
    [self addSubview:whiteView];
    whiteView.layer.masksToBounds = YES;
    whiteView.layer.cornerRadius = 5;
    _whiteView = whiteView;
    [whiteView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(10);
        make.right.mas_offset(-10);
        make.top.mas_offset(0);
        make.bottom.mas_offset(0);
        make.height.mas_equalTo(150);
    }];
    
    for (int i = 0; i < 3; i++) {
        NIMAdvancedTeamSubview *subview = [[NIMAdvancedTeamSubview alloc] init];
        subview.tag = 1000+i;
        subview.backButton.tag = 2000+i;
        [subview.backButton addTarget:self action:@selector(backButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [whiteView addSubview:subview];
        [subview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_offset(0);
            make.right.mas_offset(0);
            make.top.mas_offset(50*i);
            make.height.mas_equalTo(50);
        }];
 
        switch (i) {
            case 0:
            {
                subview.titleLabel.text = LangKey(@"activity_group_info_invite_permission");//@"邀请他人权限";
            }
                break;
            case 1:
            {
                subview.titleLabel.text = LangKey(@"activity_group_info_group_modify_permission");//@"群资料修改权限";
            }
                break;
            case 2:
            {
                subview.titleLabel.text = LangKey(@"activity_group_info_invite_verify");//@"被邀请人身份验证";
            }
                break;

            default:
                break;
        }
    }
    
}

-(void)reloadWith:(BBBTeamListDataManager *)teamListManager{
    
    for (NIMAdvancedTeamSubview *subview in _whiteView.subviews) {
        switch (subview.tag -1000) {
            case 0:
            {
                subview.contentLabel.text = [BBBTeamHelper InviteModeText:teamListManager.team.inviteMode];

            }
                break;
            case 1:
            {
                subview.contentLabel.text = [BBBTeamHelper updateInfoModeText:teamListManager.team.updateInfoMode];

                
            }
                break;
            case 2:
            {
                subview.contentLabel.text = [BBBTeamHelper beInviteModeText:teamListManager.team.beInviteMode];

                
            }
                break;
                
            default:
                break;
        }
    }
    
}

-(void)backButtonClick:(UIButton *)sender{
    BOOL canEdit = [AAAKitUtil canEditTeamInfo:_teamListManager.myTeamInfo];

    NSInteger tag = sender.tag - 2000;
    switch (tag) {
        case 0:
        {
            BBBTeamCardRowItem *itemInvite = [[BBBTeamCardRowItem alloc] init];
            itemInvite.title  = LangKey(@"activity_group_info_invite_permission");//@"邀请他人权限".nim_localized;
            itemInvite.subTitle = [BBBTeamHelper InviteModeText:self.teamListManager.team.inviteMode];
            itemInvite.actionDisabled = !canEdit;
            itemInvite.rowHeight = 60.f;
            itemInvite.type = TeamCardRowItemTypeSelected;
            itemInvite.optionItems = [BBBTeamHelper InviteModeItemsWithSeleced:self.teamListManager.team.inviteMode];
            itemInvite.selectedBlock = ^(id<NIMKitSelectCardData> item) {
                [_vc didUpdateTeamInviteMode:[item.value integerValue]];
            };
            BBBTeamCardSelectedViewController *vc = [BBBTeamCardSelectedViewController instanceWithTitle:itemInvite.title
                                                                                   items:itemInvite.optionItems
                                                                                  result:^(id<NIMKitSelectCardData>  _Nonnull item) {
                  if (itemInvite.selectedBlock) {
                      itemInvite.selectedBlock(item);
                  }
              }];
            [_vc.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 1:
        {
            BBBTeamCardRowItem *itemUpdateInfo = [[BBBTeamCardRowItem alloc] init];
            itemUpdateInfo.title  = LangKey(@"activity_group_info_group_modify_permission");//@"群资料修改权限".nim_localized;
            itemUpdateInfo.subTitle = [BBBTeamHelper updateInfoModeText:self.teamListManager.team.updateInfoMode];
            itemUpdateInfo.actionDisabled = !canEdit;
            itemUpdateInfo.rowHeight = 60.f;
            itemUpdateInfo.type = TeamCardRowItemTypeSelected;
            itemUpdateInfo.optionItems = [BBBTeamHelper updateInfoModeItemsWithSeleced:self.teamListManager.team.updateInfoMode];
            itemUpdateInfo.selectedBlock = ^(id<NIMKitSelectCardData> item) {
                [_vc didUpdateTeamInfoMode:[item.value integerValue]];
            };
            BBBTeamCardSelectedViewController *vc = [BBBTeamCardSelectedViewController instanceWithTitle:itemUpdateInfo.title
                                                                                   items:itemUpdateInfo.optionItems
                                                                                  result:^(id<NIMKitSelectCardData>  _Nonnull item) {
                  if (itemUpdateInfo.selectedBlock) {
                      itemUpdateInfo.selectedBlock(item);
                  }
              }];
            [_vc.navigationController pushViewController:vc animated:YES];
            
        }
            break;
        case 2:
        {
            BBBTeamCardRowItem *itemBeInvite = [[BBBTeamCardRowItem alloc] init];
            itemBeInvite.title  = LangKey(@"activity_group_info_invite_verify");//@"被邀请人身份验证".nim_localized;
            itemBeInvite.subTitle = [BBBTeamHelper beInviteModeText:self.teamListManager.team.beInviteMode];
            itemBeInvite.actionDisabled = !canEdit;
            itemBeInvite.rowHeight = 60.f;
            itemBeInvite.type = TeamCardRowItemTypeSelected;
            itemBeInvite.optionItems = [BBBTeamHelper beInviteModeItemsWithSeleced:self.teamListManager.team.beInviteMode];
            itemBeInvite.selectedBlock = ^(id<NIMKitSelectCardData> item) {
                [_vc didUpdateTeamBeInviteMode:[item.value integerValue]];
            };
            BBBTeamCardSelectedViewController *vc = [BBBTeamCardSelectedViewController instanceWithTitle:itemBeInvite.title
                                                                                   items:itemBeInvite.optionItems
                                                                                  result:^(id<NIMKitSelectCardData>  _Nonnull item) {
                  if (itemBeInvite.selectedBlock) {
                      itemBeInvite.selectedBlock(item);
                  }
              }];
            [_vc.navigationController pushViewController:vc animated:YES];
            
        }
            break;
            
        default:
            break;
    }
}

@end

@implementation NIMAdvancedTeamCardCell_6

- (void)initSubviews{
    self.backgroundColor = [UIColor clearColor];
    UIView *whiteView = [[UIView alloc] init];
    whiteView.backgroundColor = [UIColor whiteColor];
    [self addSubview:whiteView];
    whiteView.layer.masksToBounds = YES;
    whiteView.layer.cornerRadius = 5;
    [whiteView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(10);
        make.right.mas_offset(-10);
        make.top.mas_offset(0);
        make.bottom.mas_offset(-20);
        make.height.mas_equalTo(50);
    }];
    
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [backBtn setTitleColor:RGB_COLOR_String(@"#FF4067") forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(backButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:backBtn];
    [backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(0);
        make.top.mas_offset(0);
        make.right.mas_equalTo(0);
        make.height.mas_equalTo(50);
    }];
    _backBtn = backBtn;

    
   
}

-(void)reloadWith:(BBBTeamListDataManager *)teamListManager{
    BOOL isOwner    = teamListManager.myTeamInfo.type == NIMTeamMemberTypeOwner;
    if (isOwner) {
        [_backBtn setTitle:LangKey(@"group_info_activity_jiesan") forState:UIControlStateNormal];//@"解散群聊"
    }else{
        [_backBtn setTitle:LangKey(@"group_info_activity_exit") forState:UIControlStateNormal];//@"退出群聊"

    }
}

-(void)backButtonClick{
    
    BOOL isOwner    = _teamListManager.myTeamInfo.type == NIMTeamMemberTypeOwner;
    if (isOwner) {
        [_vc dismissTeam];
    }else{
        [_vc quitTeam];
    }
    
}


@end




@implementation NIMAdvancedTeamSubview

- (instancetype)initWithImageName:(NSString *)imageName; {
    self = [super init];
    if (self) {
        
        UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:backBtn];
        _backButton = backBtn;
        [backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_offset(0);
            make.top.mas_offset(0);
            make.right.mas_equalTo(0);
            make.height.mas_equalTo(50);
        }];
        
        UIImageView *iconImageView = [[UIImageView alloc] init];
        iconImageView.image = [UIImage imageNamed:imageName];
        [self addSubview:iconImageView];
        self.iconImage = iconImageView;
        [iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_offset(15);
            make.top.mas_equalTo(15);
            make.width.height.mas_equalTo(20);
        }];
        
        UILabel *label = [[UILabel alloc] init];
        label.font = [UIFont systemFontOfSize:15];
        label.textColor = RGB_COLOR_String(@"#3F3F3F");
        [self addSubview:label];
        _titleLabel = label;
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.iconImage.mas_right).mas_offset(15);
            make.top.mas_offset(0);
            make.width.mas_equalTo(150);
            make.height.mas_equalTo(50);
        }];
        
        UIImageView *arrowImage = [[UIImageView alloc] init];
        _arrowImage = arrowImage;
        arrowImage.image = [UIImage imageNamed:@"mine_btn_right"];
        [self addSubview:arrowImage];
        [arrowImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_offset(-10);
            make.centerY.mas_equalTo(label);
            make.width.mas_equalTo(12);
            make.height.mas_equalTo(12);
        }];
        
        
        UIView *line = [[UIView alloc] init];
        line.backgroundColor = RGB_COLOR_String(@"#F7F8FB");
        [self addSubview:line];
        _lineView = line;
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_offset(10);
            make.top.mas_offset(0);
            make.right.mas_offset(-10);
            make.height.mas_equalTo(1);
        }];
        
        _contentLabel = [[UILabel alloc] init];
        _contentLabel.font = [UIFont systemFontOfSize:14];
        _contentLabel.textAlignment = NSTextAlignmentRight;
        _contentLabel.textColor = [UIColor lightGrayColor];
        [self addSubview:_contentLabel];
        [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(_arrowImage.mas_left).mas_offset(1);
            make.top.mas_offset(0);
            make.width.mas_equalTo(150);
            make.height.mas_equalTo(50);
        }];
        
        _switchView = [[UISwitch alloc] init];
        [self addSubview:_switchView];
        [_switchView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(_arrowImage.mas_left).mas_offset(-5);
            make.centerY.mas_equalTo(_arrowImage);
            make.width.mas_equalTo(30);
            make.height.mas_equalTo(30);
        }];
        _switchView.hidden = YES;
        
    }
    return self;
}


-(instancetype)init{
    self = [super init];
    if (self) {
        UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:backBtn];
        _backButton = backBtn;
        [backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_offset(0);
            make.top.mas_offset(0);
            make.right.mas_equalTo(0);
            make.height.mas_equalTo(50);
        }];
        
        UILabel *label = [[UILabel alloc] init];
        label.font = [UIFont systemFontOfSize:15];
        label.textColor = RGB_COLOR_String(@"#3F3F3F");
        [self addSubview:label];
        _titleLabel = label;
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_offset(15);
            make.top.mas_offset(0);
            make.width.mas_equalTo(150);
            make.height.mas_equalTo(50);
        }];

        UIImageView *arrowImage = [[UIImageView alloc] init];
        _arrowImage = arrowImage;
        arrowImage.image = [UIImage imageNamed:@"mine_btn_right"];
        [self addSubview:arrowImage];
        [arrowImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_offset(-10);
            make.centerY.mas_equalTo(label);
            make.width.mas_equalTo(12);
            make.height.mas_equalTo(12);
        }];
        
        UIView *line = [[UIView alloc] init];
        line.backgroundColor = RGB_COLOR_String(@"#F7F8FB");
        [self addSubview:line];
        _lineView = line;
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_offset(10);
            make.top.mas_offset(0);
            make.right.mas_offset(-10);
            make.height.mas_equalTo(1);
        }];
        
        _contentLabel = [[UILabel alloc] init];
        _contentLabel.font = [UIFont systemFontOfSize:14];
        _contentLabel.textAlignment = NSTextAlignmentRight;
        _contentLabel.textColor = [UIColor lightGrayColor];
        [self addSubview:_contentLabel];
        [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(_arrowImage.mas_left).mas_offset(1);
            make.top.mas_offset(0);
            make.width.mas_equalTo(150);
            make.height.mas_equalTo(50);
        }];
        
        _switchView = [[UISwitch alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
        [self addSubview:_switchView];
        [_switchView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(_arrowImage.mas_left).mas_offset(-5);
            make.centerY.mas_equalTo(_arrowImage);
            make.width.mas_equalTo(30);
            make.height.mas_equalTo(30);
        }];
        _switchView.hidden = YES;
        _switchView.onImage = [UIImage imageNamed:@"switch_on"];
        _switchView.offImage = [UIImage imageNamed:@"switch_off"];
    }
    return self;
}

@end


