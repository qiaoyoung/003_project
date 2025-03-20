// __DEBUG__
// __CLOSE_PRINT__
//
//  HideViewController.h
//  NIM
//
//  Created by chris on 15/8/18.
//  Copyright (c) 2015年 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import <UIKit/UIKit.h>
#import <UIKit/UIKit.h>

//: @class ContactDataMember;
@class ContactDataMember;

//: @interface NTESPersonalCardViewController : UIViewController
@interface HideViewController : UIViewController

//: @property (nonatomic ,strong) NSDictionary *teamSetingConfig;
@property (nonatomic ,strong) NSDictionary *teamSetingConfig;

//: @property (nonatomic,strong) NSDictionary *groupDict;
@property (nonatomic,strong) NSDictionary *groupDict;

//: @property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UITableView *tableView;

//: - (instancetype)initWithUserId:(NSString *)userId;
- (instancetype)initWithOn:(NSString *)userId;

//: - (void)onActionEditAlias:(id)sender;
- (void)speedy:(id)sender;

//: -(void)onActionGroup:(id)sender;
-(void)birthday:(id)sender;

//: - (void)onActionNeedNotifyValueChange:(id)sender;
- (void)nameMediaRead:(id)sender;
//: - (void)onActionBlackListValueChange:(id)sender;
- (void)bies:(id)sender;

//: - (void)chat;
- (void)schemeWith;
//: - (void)deleteFriend;
- (void)pressLong;
//: -(void)addFriend;
-(void)searchedFriend;
//: @end
@end