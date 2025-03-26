
#import <Foundation/Foundation.h>

NSString *StringFromRecentData(Byte *data);


//: back_arrow_bl
Byte str_modelLengthValue[] = {29, 13, 4, 75, 108, 98, 95, 119, 111, 114, 114, 97, 95, 107, 99, 97, 98, 95};


//: black_list_activity_black
Byte str_postData[] = {62, 25, 10, 2, 34, 35, 51, 91, 21, 210, 107, 99, 97, 108, 98, 95, 121, 116, 105, 118, 105, 116, 99, 97, 95, 116, 115, 105, 108, 95, 107, 99, 97, 108, 98, 24};


//: group_chat_avatar_activity_add_black_success
Byte str_recordContent[] = {16, 44, 11, 152, 33, 116, 16, 168, 180, 184, 143, 115, 115, 101, 99, 99, 117, 115, 95, 107, 99, 97, 108, 98, 95, 100, 100, 97, 95, 121, 116, 105, 118, 105, 116, 99, 97, 95, 114, 97, 116, 97, 118, 97, 95, 116, 97, 104, 99, 95, 112, 117, 111, 114, 103, 115};


//: group_info_activity_op_failed
Byte str_titleText[] = {61, 29, 12, 165, 65, 204, 198, 106, 62, 202, 112, 24, 100, 101, 108, 105, 97, 102, 95, 112, 111, 95, 121, 116, 105, 118, 105, 116, 99, 97, 95, 111, 102, 110, 105, 95, 112, 117, 111, 114, 103, 49};


//: black_list_activity_black_list_tip
Byte str_showChangeData[] = {36, 34, 6, 221, 82, 27, 112, 105, 116, 95, 116, 115, 105, 108, 95, 107, 99, 97, 108, 98, 95, 121, 116, 105, 118, 105, 116, 99, 97, 95, 116, 115, 105, 108, 95, 107, 99, 97, 108, 98, 161};


//: common_bg
Byte str_fromValue[] = {97, 9, 6, 239, 196, 27, 103, 98, 95, 110, 111, 109, 109, 111, 99, 55};


//: friend_delete_fail
Byte str_titleLabText[] = {8, 18, 11, 196, 169, 227, 117, 193, 132, 250, 228, 108, 105, 97, 102, 95, 101, 116, 101, 108, 101, 100, 95, 100, 110, 101, 105, 114, 102, 56};


//: icon_friend_add
Byte str_thatValue[] = {53, 15, 3, 100, 100, 97, 95, 100, 110, 101, 105, 114, 102, 95, 110, 111, 99, 105, 193};


//: #999999
Byte str_viewAreaText[] = {71, 7, 5, 120, 205, 57, 57, 57, 57, 57, 57, 35, 151};

// __DEBUG__
// __CLOSE_PRINT__
//
//  TitleAtViewController.m
//  NIM
//
//  Created by chris on 15/8/18.
//  Copyright (c) 2015年 Netease. All rights reserved.
//
//#import "MarkViewCell.h"

// __M_A_C_R_O__
//: #import "CCCBlackListViewController.h"
#import "TitleAtViewController.h"
//: #import "UIView+Toast.h"
#import "UIView+Toast.h"
//: #import "AAAContactSelectViewController.h"
#import "SelectDisableViewController.h"
//: #import "NTESListHeader.h"
#import "AlterView.h"
//: #import "UIView+NTES.h"
#import "UIView+Status.h"
//: #import "NTESPersonalCardViewController.h"
#import "HideViewController.h"
//: #import "NTESContactDataMember.h"
#import "ContactAt.h"
//: #import "SVProgressHUD.h"
#import "SVProgressHUD.h"
//: #import "NTESBlackListTableViewCell.h"
#import "FromViewCell.h"

//: @interface CCCBlackListViewController ()<UITableViewDataSource,UITableViewDelegate,NIMContactSelectDelegate,NTESListHeaderDelegate,NTESUserListCellDelegate>
@interface TitleAtViewController ()<UITableViewDataSource,UITableViewDelegate,ContainerDelegate,StateDelegate,LightHide>

//: @property (nonatomic,strong) NSMutableArray *data;
@property (nonatomic,strong) NSMutableArray *data;
//: @property(nonatomic, strong) UILabel *subtitleLabel;
@property(nonatomic, strong) UILabel *subtitleLabel;
//: @property (nonatomic,strong) NTESListHeader *header;
@property (nonatomic,strong) AlterView *header;

//: @end
@end

//: @implementation CCCBlackListViewController
@implementation TitleAtViewController

//: - (void)viewWillAppear:(BOOL)animated{
- (void)viewWillAppear:(BOOL)animated{
    //: [super viewWillAppear:animated];
    [super viewWillAppear:animated];
    //: [self.navigationController.navigationBar setHidden:YES];
    [self.navigationController.navigationBar setHidden:YES];
}

//: -(void)viewWillDisappear:(BOOL)animated{
-(void)viewWillDisappear:(BOOL)animated{
    //: [super viewWillDisappear:animated];
    [super viewWillDisappear:animated];
    //: [self.navigationController.navigationBar setHidden:NO];
    [self.navigationController.navigationBar setHidden:NO];

}
//: - (void)backAction{
- (void)withItem{
    //: [self.navigationController popViewControllerAnimated:NO];
    [self.navigationController popViewControllerAnimated:NO];
}

//: - (void)viewDidLoad {
- (void)viewDidLoad {
    //: [super viewDidLoad];
    [super viewDidLoad];
//    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"common_bg"]];
    //: UIImageView *bg = [[UIImageView alloc]initWithFrame:self.view.bounds];
    UIImageView *bg = [[UIImageView alloc]initWithFrame:self.view.bounds];
    //: bg.image = [UIImage imageNamed:@"common_bg"];
    bg.image = [UIImage imageNamed:StringFromRecentData(str_fromValue)];
    //: [self.view addSubview:bg];
    [self.view addSubview:bg];

    //: UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, (44.0f + [UIDevice vg_statusBarHeight]))];
    UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, (44.0f + [UIDevice task]))];
    //: [self.view addSubview:bgView];
    [self.view addSubview:bgView];

    //: UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    //: backButton.frame = CGRectMake(5, [UIDevice vg_statusBarHeight]+4, 40, 40);
    backButton.frame = CGRectMake(5, [UIDevice task]+4, 40, 40);
    //: [backButton setImage:[UIImage imageNamed:@"back_arrow_bl"] forState:(UIControlStateNormal)];
    [backButton setImage:[UIImage imageNamed:StringFromRecentData(str_modelLengthValue)] forState:(UIControlStateNormal)];
    //: [backButton addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    [backButton addTarget:self action:@selector(withItem) forControlEvents:UIControlEventTouchUpInside];
    //: [bgView addSubview:backButton];
    [bgView addSubview:backButton];

    //: UILabel *labtitle = [[UILabel alloc] initWithFrame:CGRectMake(([[UIScreen mainScreen] bounds].size.width-200)/2, [UIDevice vg_statusBarHeight]+4, 200, 40)];
    UILabel *labtitle = [[UILabel alloc] initWithFrame:CGRectMake(([[UIScreen mainScreen] bounds].size.width-200)/2, [UIDevice task]+4, 200, 40)];
    //: labtitle.font = [UIFont systemFontOfSize:16.f];
    labtitle.font = [UIFont systemFontOfSize:16.f];
    //: labtitle.textColor = [UIColor blackColor];
    labtitle.textColor = [UIColor blackColor];
    //: labtitle.textAlignment = NSTextAlignmentCenter;
    labtitle.textAlignment = NSTextAlignmentCenter;
    //: labtitle.text = [NTESLanguageManager getTextWithKey:@"black_list_activity_black"];
    labtitle.text = [MaxInformation off:StringFromRecentData(str_postData)];
    //: [bgView addSubview:labtitle];
    [bgView addSubview:labtitle];

    //: UIButton *submitButton = [UIButton buttonWithType:UIButtonTypeCustom];
    UIButton *submitButton = [UIButton buttonWithType:UIButtonTypeCustom];
    //: submitButton.frame = CGRectMake([[UIScreen mainScreen] bounds].size.width-15-40, [UIDevice vg_statusBarHeight]+4, 40, 40);
    submitButton.frame = CGRectMake([[UIScreen mainScreen] bounds].size.width-15-40, [UIDevice task]+4, 40, 40);
    //: [submitButton setImage:[UIImage imageNamed:@"icon_friend_add"] forState:(UIControlStateNormal)];
    [submitButton setImage:[UIImage imageNamed:StringFromRecentData(str_thatValue)] forState:(UIControlStateNormal)];
    //: [submitButton addTarget:self action:@selector(onOpera:) forControlEvents:UIControlEventTouchUpInside];
    [submitButton addTarget:self action:@selector(indexUser:) forControlEvents:UIControlEventTouchUpInside];
    //: [bgView addSubview:submitButton];
    [bgView addSubview:submitButton];

    //: [self.view addSubview:self.subtitleLabel];
    [self.view addSubview:self.subtitleLabel];
    //: self.subtitleLabel.frame = CGRectMake(15, (44.0f + [UIDevice vg_statusBarHeight])+10, [[UIScreen mainScreen] bounds].size.width-30, 40);
    self.subtitleLabel.frame = CGRectMake(15, (44.0f + [UIDevice task])+10, [[UIScreen mainScreen] bounds].size.width-30, 40);

        //: self.data = self.myBlackListUser;
        self.data = self.image;

    //: self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(15, (44.0f + [UIDevice vg_statusBarHeight])+60, [[UIScreen mainScreen] bounds].size.width-30, [[UIScreen mainScreen] bounds].size.height-(44.0f + [UIDevice vg_statusBarHeight])-60) style:UITableViewStyleGrouped];
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(15, (44.0f + [UIDevice task])+60, [[UIScreen mainScreen] bounds].size.width-30, [[UIScreen mainScreen] bounds].size.height-(44.0f + [UIDevice task])-60) style:UITableViewStyleGrouped];
    //: self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.backgroundColor = [UIColor clearColor];
        //: self.tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        self.tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        //: [self.view addSubview:self.tableView];
        [self.view addSubview:self.tableView];
        //: self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        //: self.tableView.delegate = self;
        self.tableView.delegate = self;
        //: self.tableView.dataSource = self;
        self.tableView.dataSource = self;
}

//: - (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    //: return 60.f;
    return 60.f;
}

//: - (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    //: return self.data.count;
    return self.data.count;
}

//: - (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    //: return 1;
    return 1;
}

//: - (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    //: return 2.2250738585072014e-308;
    return 2.2250738585072014e-308;
}

//: - (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    //: UIView *backView = [UIView new];
    UIView *backView = [UIView new];
    //: backView.backgroundColor = [UIColor clearColor];
    backView.backgroundColor = [UIColor clearColor];
    //: return backView;
    return backView;
}

//: - (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    //: return 16.f;
    return 16.f;
}

//: - (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    //: UIView *backView = [UIView new];
    UIView *backView = [UIView new];
    //: backView.backgroundColor = [UIColor clearColor];
    backView.backgroundColor = [UIColor clearColor];
    //: return backView;
    return backView;
}

//: - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //: static NSString *identity = @"cell";
    static NSString *identity = @"cell";
    //: NTESBlackListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identity];
    FromViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identity];
    //: if (!cell) {
    if (!cell) {
        //: cell = [[NTESBlackListTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identity];
        cell = [[FromViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identity];
        //: cell.delegate = self;
        cell.delegate = self;
    }
    //: NTESContactDataMember *member = self.data[indexPath.section];
    ContactAt *member = self.data[indexPath.section];
    //: [cell refreshWithMember:member];
    [cell director:member];
    //: return cell;
    return cell;
}

//: - (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //: [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    //: NTESContactDataMember *member = self.data[indexPath.section];
    ContactAt *member = self.data[indexPath.section];

    //: if (member) {
    if (member) {
        //: [self didTouchUserListAvatar:member.info.infoId];
        [self ting:member.info.infoId];
    }

}

//: - (void)didTouchCancleButton:(NTESContactDataMember *)dataMemeber {
- (void)containerExamineed:(ContactAt *)dataMemeber {
    //: __weak typeof(self) wself = self;
    __weak typeof(self) wself = self;
    //: [SVProgressHUD show];
    [SVProgressHUD show];
    //: [[NIMSDK sharedSDK].userManager removeFromBlackBlackList:dataMemeber.info.infoId completion:^(NSError *error) {
    [[NIMSDK sharedSDK].userManager removeFromBlackBlackList:dataMemeber.info.infoId completion:^(NSError *error) {
        //: [SVProgressHUD dismiss];
        [SVProgressHUD dismiss];
        //: if (!error) {
        if (!error) {
            //: NSInteger index = [wself.data indexOfObject:dataMemeber];
            NSInteger index = [wself.data indexOfObject:dataMemeber];
            //: if (wself.data.count > index) {
            if (wself.data.count > index) {
                //: [wself.data removeObject:dataMemeber];
                [wself.data removeObject:dataMemeber];
//                [wself.tableView deleteRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:index inSection:0]] withRowAnimation:UITableViewRowAnimationAutomatic];
                //: [wself.tableView reloadData];
                [wself.tableView reloadData];
            }
        //: }else{
        }else{
            //: [wself.view makeToast:[NTESLanguageManager getTextWithKey:@"friend_delete_fail"] duration:2.0f position:CSToastPositionCenter];
            [wself.view makeToast:[MaxInformation off:StringFromRecentData(str_titleLabText)] duration:2.0f position:CSToastPositionCenter];
        }
    //: }];
    }];
}

//: - (void)onOpera:(id)sender{
- (void)indexUser:(id)sender{
    //: NSMutableArray *users = [[NSMutableArray alloc] init];
    NSMutableArray *users = [[NSMutableArray alloc] init];
    //: for (NTESContactDataMember *member in self.data) {
    for (ContactAt *member in self.data) {
        //: [users addObject:member.info.infoId];
        [users addObject:member.info.infoId];
    }
    //: NIMContactFriendSelectConfig *config = [[NIMContactFriendSelectConfig alloc] init];
    ChildTeam *config = [[ChildTeam alloc] init];
    //: config.filterIds = users;
    config.filterIds = users;
    //: config.showSelectHeaderview = NO;
    config.showSelectHeaderview = NO;
    //: AAAContactSelectViewController *vc = [[AAAContactSelectViewController alloc] initWithConfig:config];
    SelectDisableViewController *vc = [[SelectDisableViewController alloc] initWithTextConfig:config];
    //: vc.delegate = self;
    vc.delegate = self;
    //: [vc show];
    [vc fromOn];
}


//: #pragma mark - NTESContactSelectDelegate
#pragma mark - NTESContactSelectDelegate
//: - (void)didFinishedSelect:(NSArray *)selectedContacts{
- (void)sourceTeamInfo:(NSArray *)selectedContacts{
    //: if (selectedContacts.count) {
    if (selectedContacts.count) {
        //: __weak typeof(self) wself = self;
        __weak typeof(self) wself = self;
        //: [[NIMSDK sharedSDK].userManager addToBlackList:selectedContacts.firstObject completion:^(NSError *error) {
        [[NIMSDK sharedSDK].userManager addToBlackList:selectedContacts.firstObject completion:^(NSError *error) {
            //: if (!error) {
            if (!error) {
                //: [wself.view makeToast:[NTESLanguageManager getTextWithKey:@"group_chat_avatar_activity_add_black_success"] duration:2.0 position:CSToastPositionCenter];
                [wself.view makeToast:[MaxInformation off:StringFromRecentData(str_recordContent)] duration:2.0 position:CSToastPositionCenter];
                //: wself.data = wself.myBlackListUser;
                wself.data = wself.image;
                //: [wself.tableView reloadData];
                [wself.tableView reloadData];
            //: }else{
            }else{
                //: [wself.view makeToast:[NTESLanguageManager getTextWithKey:@"group_info_activity_op_failed"] duration:2.0 position:CSToastPositionCenter];
                [wself.view makeToast:[MaxInformation off:StringFromRecentData(str_titleText)] duration:2.0 position:CSToastPositionCenter];
            }
        //: }];
        }];
    }
}

//: #pragma mark - NTESUserListCellDelegate
#pragma mark - LightHide
//: - (void)didTouchUserListAvatar:(NSString *)userId{
- (void)ting:(NSString *)userId{
    //: NTESPersonalCardViewController *vc = [[NTESPersonalCardViewController alloc] initWithUserId:userId];
    HideViewController *vc = [[HideViewController alloc] initWithOn:userId];
    //: [self.navigationController pushViewController:vc animated:YES];
    [self.navigationController pushViewController:vc animated:YES];
}


//: #pragma mark - Private
#pragma mark - Private
//: - (void)refreshSubviews
- (void)user
{
}

//: - (NSMutableArray *)myBlackListUser{
- (NSMutableArray *)image{
    //: NSMutableArray *list = [[NSMutableArray alloc] init];
    NSMutableArray *list = [[NSMutableArray alloc] init];
    //: for (NIMUser *user in [NIMSDK sharedSDK].userManager.myBlackList) {
    for (NIMUser *user in [NIMSDK sharedSDK].userManager.myBlackList) {
        //: NTESContactDataMember *member = [[NTESContactDataMember alloc] init];
        ContactAt *member = [[ContactAt alloc] init];
        //: CCCKitInfo *info = [[AppleProjectKit sharedKit] infoByUser:user.userId option:nil];
        TitleInfo *info = [[Indicator reach] indoors:user.userId harvest:nil];
        //: member.info = info;
        member.info = info;
        //: [list addObject:member];
        [list addObject:member];
    }
    //: return list;
    return list;
}

//: - (UILabel *)subtitleLabel {
- (UILabel *)subtitleLabel {
    //: if (!_subtitleLabel) {
    if (!_subtitleLabel) {
        //: _subtitleLabel = [[UILabel alloc] init];
        _subtitleLabel = [[UILabel alloc] init];
        //: _subtitleLabel.font = [UIFont systemFontOfSize:14.f];
        _subtitleLabel.font = [UIFont systemFontOfSize:14.f];
        //: _subtitleLabel.textColor = [UIColor colorWithHexString:@"#999999"];
        _subtitleLabel.textColor = [UIColor direction:StringFromRecentData(str_viewAreaText)];
        //: _subtitleLabel.textAlignment = NSTextAlignmentLeft;
        _subtitleLabel.textAlignment = NSTextAlignmentLeft;
        //: _subtitleLabel.text = [NTESLanguageManager getTextWithKey:@"black_list_activity_black_list_tip"];
        _subtitleLabel.text = [MaxInformation off:StringFromRecentData(str_showChangeData)];
        //: _subtitleLabel.numberOfLines = 2;
        _subtitleLabel.numberOfLines = 2;
        //: _subtitleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        _subtitleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    }
    //: return _subtitleLabel;
    return _subtitleLabel;
}

//: @end
@end

Byte * RecentDataToCache(Byte *data) {
    int incentiveScheme = data[0];
    int distance = data[1];
    int postLink = data[2];
    if (!incentiveScheme) return data + postLink;
    for (int i = 0; i < distance / 2; i++) {
        int begin = postLink + i;
        int end = postLink + distance - i - 1;
        Byte temp = data[begin];
        data[begin] = data[end];
        data[end] = temp;
    }
    data[0] = 0;
    data[postLink + distance] = 0;
    return data + postLink;
}

NSString *StringFromRecentData(Byte *data) {
    return [NSString stringWithUTF8String:(char *)RecentDataToCache(data)];
}  
