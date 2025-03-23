// __DEBUG__
// __CLOSE_PRINT__
//
//  TeamMemberCardViewController.h
//  NIM
//
//  Created by Xuhui on 15/3/19.
//  Copyright (c) 2015年 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import <UIKit/UIKit.h>
#import <UIKit/UIKit.h>
//: #import "BBBTeamCardMemberItem.h"
#import "OnenceShould.h"
//: #import "CCCTeamMemberListDataSource.h"
#import "MessageSource.h"

//: @protocol NIMTeamMemberCardActionDelegate <NSObject>
@protocol IconRange <NSObject>
//: @optional
@optional

//: - (void)onTeamMemberMuted:(BBBTeamCardMemberItem *)member mute:(BOOL)mute;
- (void)bar:(OnenceShould *)member cellMute:(BOOL)mute;
//: - (void)onTeamMemberKicked:(BBBTeamCardMemberItem *)member;
- (void)sizes:(OnenceShould *)member;

//: @end
@end

//: @interface BBBTeamMemberCardViewController : UIViewController
@interface WithTeamViewController : UIViewController

//: @property (nonatomic, strong) id<NIMTeamMemberCardActionDelegate> delegate;
@property (nonatomic, strong) id<IconRange> delegate;

//: - (instancetype)initWithMember:(NSString *)userId
- (instancetype)initWithChange:(NSString *)userId
                    //: dataSource:(id <CCCTeamMemberListDataSource>) dataSource;
                    keyOriginSource:(id <MessageSource>) dataSource;

//: @end
@end