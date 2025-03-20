//
//  TeamMemberCardViewController.h
//  NIM
//
//  Created by Xuhui on 15/3/19.
//  Copyright (c) 2015年 Netease. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BBBTeamCardMemberItem.h"
#import "CCCTeamMemberListDataSource.h"

@protocol NIMTeamMemberCardActionDelegate <NSObject>
@optional

- (void)onTeamMemberMuted:(BBBTeamCardMemberItem *)member mute:(BOOL)mute;
- (void)onTeamMemberKicked:(BBBTeamCardMemberItem *)member;

@end

@interface BBBTeamMemberCardViewController : UIViewController

@property (nonatomic, strong) id<NIMTeamMemberCardActionDelegate> delegate;

- (instancetype)initWithMember:(NSString *)userId
                    dataSource:(id <CCCTeamMemberListDataSource>) dataSource;

@end
