//
//  NTESPersonalCardViewController.h
//  NIM
//
//  Created by chris on 15/8/18.
//  Copyright (c) 2015年 Netease. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ContactDataMember;

@interface NTESPersonalCardViewController : UIViewController

@property (nonatomic ,strong) NSDictionary *teamSetingConfig;

@property (nonatomic,strong) NSDictionary *groupDict;

@property (nonatomic, strong) UITableView *tableView;

- (instancetype)initWithUserId:(NSString *)userId;

- (void)onActionEditAlias:(id)sender;

-(void)onActionGroup:(id)sender;

- (void)onActionNeedNotifyValueChange:(id)sender;
- (void)onActionBlackListValueChange:(id)sender;

- (void)chat;
- (void)deleteFriend;
-(void)addFriend;
@end
