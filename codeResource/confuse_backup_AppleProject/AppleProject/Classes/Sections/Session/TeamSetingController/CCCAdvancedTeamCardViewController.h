//
//  CCCAdvancedTeamCardViewController.h
//  NIM
//
//  Created by chris on 15/3/25.
//  Copyright (c) 2015年 Netease. All rights reserved.
//

#import "BBBTeamCardOperationViewController.h"

@interface CCCAdvancedTeamCardViewController : BBBTeamCardOperationViewController
- (void)enterMemberCard;//查看群成员
- (void)didSelectAddOpeartor;//添加新成员

- (void)updateTeamName;
- (void)updateTeamNick;
- (void)updateTeamIntro;
- (void)updateTeamAnnouncement;
- (void)enterMuteList;//禁言列表
- (void)quitTeam;
- (void)dismissTeam;
@end
