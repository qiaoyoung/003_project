//
//  CCCBlackListViewController.m
//  NIM
//
//  Created by chris on 15/8/18.
//  Copyright (c) 2015年 Netease. All rights reserved.
//

#import "CCCBlackListViewController.h"
//#import "NTESUserListCell.h"
#import "UIView+Toast.h"
#import "AAAContactSelectViewController.h"
#import "NTESListHeader.h"
#import "UIView+NTES.h"
#import "NTESPersonalCardViewController.h"
#import "NTESContactDataMember.h"
#import "SVProgressHUD.h"
#import "NTESBlackListTableViewCell.h"
@interface CCCBlackListViewController ()<UITableViewDataSource,UITableViewDelegate,NIMContactSelectDelegate,NTESListHeaderDelegate,NTESUserListCellDelegate>

@property (nonatomic,strong) NSMutableArray *data;
@property(nonatomic, strong) UILabel *subtitleLabel;
@property (nonatomic,strong) NTESListHeader *header;

@end

@implementation CCCBlackListViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setHidden:YES];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar setHidden:NO];

}
- (void)backAction{
    [self.navigationController popViewControllerAnimated:NO];
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"common_bg"]];
    UIImageView *bg = [[UIImageView alloc]initWithFrame:self.view.bounds];
    bg.image = [UIImage imageNamed:@"common_bg"];
    [self.view addSubview:bg];

    UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_TOP_HEIGHT)];
    [self.view addSubview:bgView];
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(5, SCREEN_STATUS_HEIGHT+4, 40, 40);
    [backButton setImage:[UIImage imageNamed:@"back_arrow_bl"] forState:(UIControlStateNormal)];
    [backButton addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    [bgView addSubview:backButton];
    
    UILabel *labtitle = [[UILabel alloc] initWithFrame:CGRectMake((SCREEN_WIDTH-200)/2, SCREEN_STATUS_HEIGHT+4, 200, 40)];
    labtitle.font = [UIFont systemFontOfSize:16.f];
    labtitle.textColor = [UIColor blackColor];
    labtitle.textAlignment = NSTextAlignmentCenter;
    labtitle.text = LangKey(@"black_list_activity_black");
    [bgView addSubview:labtitle];
    
    UIButton *submitButton = [UIButton buttonWithType:UIButtonTypeCustom];
    submitButton.frame = CGRectMake(SCREEN_WIDTH-15-40, SCREEN_STATUS_HEIGHT+4, 40, 40);
    [submitButton setImage:[UIImage imageNamed:@"icon_friend_add"] forState:(UIControlStateNormal)];
    [submitButton addTarget:self action:@selector(onOpera:) forControlEvents:UIControlEventTouchUpInside];
    [bgView addSubview:submitButton];
    
    [self.view addSubview:self.subtitleLabel];
    self.subtitleLabel.frame = CGRectMake(15, SCREEN_TOP_HEIGHT+10, SCREEN_WIDTH-30, 40);
    
        self.data = self.myBlackListUser;
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(15, SCREEN_TOP_HEIGHT+60, SCREEN_WIDTH-30, SCREEN_HEIGHT-SCREEN_TOP_HEIGHT-60) style:UITableViewStyleGrouped];
    self.tableView.backgroundColor = [UIColor clearColor];
        self.tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [self.view addSubview:self.tableView];
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60.f;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.data.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return CGFLOAT_MIN;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *backView = [UIView new];
    backView.backgroundColor = [UIColor clearColor];
    return backView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 16.f;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *backView = [UIView new];
    backView.backgroundColor = [UIColor clearColor];
    return backView;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identity = @"cell";
    NTESBlackListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identity];
    if (!cell) {
        cell = [[NTESBlackListTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identity];
        cell.delegate = self;
    }
    NTESContactDataMember *member = self.data[indexPath.section];
    [cell refreshWithMember:member];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NTESContactDataMember *member = self.data[indexPath.section];
    
    if (member) {
        [self didTouchUserListAvatar:member.info.infoId];
    }
   
}

- (void)didTouchCancleButton:(NTESContactDataMember *)dataMemeber {
    __weak typeof(self) wself = self;
    [SVProgressHUD show];
    [[NIMSDK sharedSDK].userManager removeFromBlackBlackList:dataMemeber.info.infoId completion:^(NSError *error) {
        [SVProgressHUD dismiss];
        if (!error) {
            NSInteger index = [wself.data indexOfObject:dataMemeber];
            if (wself.data.count > index) {
                [wself.data removeObject:dataMemeber];
//                [wself.tableView deleteRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:index inSection:0]] withRowAnimation:UITableViewRowAnimationAutomatic];
                [wself.tableView reloadData];
            }
        }else{
            [wself.view makeToast:LangKey(@"friend_delete_fail") duration:2.0f position:CSToastPositionCenter];
        }
    }];
}

- (void)onOpera:(id)sender{
    NSMutableArray *users = [[NSMutableArray alloc] init];
    for (NTESContactDataMember *member in self.data) {
        [users addObject:member.info.infoId];
    }
    NIMContactFriendSelectConfig *config = [[NIMContactFriendSelectConfig alloc] init];
    config.filterIds = users;
    config.showSelectHeaderview = NO;
    AAAContactSelectViewController *vc = [[AAAContactSelectViewController alloc] initWithConfig:config];
    vc.delegate = self;
    [vc show];
}


#pragma mark - NTESContactSelectDelegate
- (void)didFinishedSelect:(NSArray *)selectedContacts{
    if (selectedContacts.count) {
        __weak typeof(self) wself = self;
        [[NIMSDK sharedSDK].userManager addToBlackList:selectedContacts.firstObject completion:^(NSError *error) {
            if (!error) {
                [wself.view makeToast:LangKey(@"group_chat_avatar_activity_add_black_success") duration:2.0 position:CSToastPositionCenter];
                wself.data = wself.myBlackListUser;
                [wself.tableView reloadData];
            }else{
                [wself.view makeToast:LangKey(@"group_info_activity_op_failed") duration:2.0 position:CSToastPositionCenter];
            }
        }];
    }
}

#pragma mark - NTESUserListCellDelegate
- (void)didTouchUserListAvatar:(NSString *)userId{
    NTESPersonalCardViewController *vc = [[NTESPersonalCardViewController alloc] initWithUserId:userId];
    [self.navigationController pushViewController:vc animated:YES];
}


#pragma mark - Private
- (void)refreshSubviews
{
}

- (NSMutableArray *)myBlackListUser{
    NSMutableArray *list = [[NSMutableArray alloc] init];
    for (NIMUser *user in [NIMSDK sharedSDK].userManager.myBlackList) {
        NTESContactDataMember *member = [[NTESContactDataMember alloc] init];
        CCCKitInfo *info = [[AppleProjectKit sharedKit] infoByUser:user.userId option:nil];
        member.info = info;
        [list addObject:member];
    }
    return list;
}

- (UILabel *)subtitleLabel {
    if (!_subtitleLabel) {
        _subtitleLabel = [[UILabel alloc] init];
        _subtitleLabel.font = [UIFont systemFontOfSize:14.f];
        _subtitleLabel.textColor = TextColor_3;
        _subtitleLabel.textAlignment = NSTextAlignmentLeft;
        _subtitleLabel.text = LangKey(@"black_list_activity_black_list_tip");
        _subtitleLabel.numberOfLines = 2;
        _subtitleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    }
    return _subtitleLabel;
}

@end
