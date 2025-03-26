
#import <Foundation/Foundation.h>
typedef struct {
    Byte dateFile;
    Byte *camera;
    unsigned int insertBottom;
    bool areaThread;
	int icon;
} PostData;

NSString *StringFromPostData(PostData *data);


//: 智能机器人
PostData str_onContent = (PostData){116, (Byte []){146, 237, 206, 156, 247, 201, 146, 232, 206, 145, 237, 220, 144, 206, 206, 201}, 15, false, 212};

// __DEBUG__
// __CLOSE_PRINT__
//
//  MessageViewController.m
//  NIM
//
//  Created by chris on 2017/6/23.
//  Copyright © 2017年 Netease. All rights reserved.
//
//: #import "NTESRobotListViewController.h"
#import "MessageViewController.h"
//: #import "UIView+NTES.h"
#import "UIView+Status.h"
//: #import "NTESUserListCell.h"
#import "MarkViewCell.h"
//: #import "SVProgressHUD.h"
#import "SVProgressHUD.h"
//: #import "NTESContactDataMember.h"
#import "ContactAt.h"
//: #import "UIView+Toast.h"
#import "UIView+Toast.h"
//: #import "NTESRobotCardViewController.h"
#import "SearchedViewController.h"
//: #import "NTESSessionViewController.h"
#import "PointBlankViewController.h"

// __M_A_C_R_O__

//: @interface NTESRobotListViewController ()<UITableViewDelegate,UITableViewDataSource,NIMUserManagerDelegate,NTESUserListCellDelegate>
@interface MessageViewController ()<UITableViewDelegate,UITableViewDataSource,NIMUserManagerDelegate,LightHide>

//: @property (nonatomic,strong) NSMutableArray *data;
@property (nonatomic,strong) NSMutableArray *data;

//: @property (nonatomic,strong) UIRefreshControl *refreshControl;
@property (nonatomic,strong) UIRefreshControl *refreshControl;

//: @end
@end

//: @implementation NTESRobotListViewController
@implementation MessageViewController


//: - (void)dealloc
- (void)dealloc
{
    //: [self removeListenr];
    [self can];
}

//: - (void)viewDidLoad {
- (void)viewDidLoad {
    //: [super viewDidLoad];
    [super viewDidLoad];
    //: [self setUpNavItem];
    [self name];
    //: [self addListener];
    [self doing];
    //: self.data = self.robots;
    self.data = self.outside;
    //: self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
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
    //: [self.tableView addSubview:self.refreshControl];
    [self.tableView addSubview:self.refreshControl];
}


//: - (void)setUpNavItem{
- (void)name{
    //: self.navigationItem.title = @"智能机器人";
    self.navigationItem.title = StringFromPostData(&str_onContent);
}

//: - (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
- (CGFloat)change:(UITableView *)tableView secret:(NSIndexPath *)indexPath{
    //: return 60.f;
    return 60.f;
}


//: - (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
- (NSInteger)messageId:(UITableView *)tableView intervalPath:(NSInteger)section{
    //: return self.data.count;
    return self.data.count;
}

//: - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
- (UITableViewCell *)nameRange:(UITableView *)tableView warpathOff:(NSIndexPath *)indexPath{
    //: static NSString *identity = @"cell";
    static NSString *identity = @"cell";
    //: NTESUserListCell *cell = [tableView dequeueReusableCellWithIdentifier:identity];
    MarkViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identity];
    //: if (!cell) {
    if (!cell) {
        //: cell = [[NTESUserListCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identity];
        cell = [[MarkViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identity];
        //: cell.delegate = self;
        cell.delegate = self;
    }
    //: NTESContactDataMember *member = self.data[indexPath.row];
    ContactAt *member = self.data[indexPath.row];
    //: [cell refreshWithMember:member];
    [cell refreshWithMember:member];
    //: return cell;
    return cell;
}


//: - (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
- (void)canId:(UITableView *)tableView info:(NSIndexPath *)indexPath
{
    //: [tableView deselectRowAtIndexPath:indexPath animated:NO];
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    //: NTESContactDataMember *member = self.data[indexPath.row];
    ContactAt *member = self.data[indexPath.row];

    //: NTESRobotCardViewController *vc = [[NTESRobotCardViewController alloc] initWithUserId:member.info.infoId];
    SearchedViewController *vc = [[SearchedViewController alloc] initWithUserId:member.info.infoId];
    //: [self.navigationController pushViewController:vc animated:YES];
    [self.navigationController pushViewController:vc animated:YES];
}



//: #pragma mark - NTESUserListCellDelegate
#pragma mark - LightHide
//: - (void)didTouchUserListAvatar:(NSString *)userId{
- (void)ting:(NSString *)userId{
    //: NTESRobotCardViewController *vc = [[NTESRobotCardViewController alloc] initWithUserId:userId];
    SearchedViewController *vc = [[SearchedViewController alloc] initWithUserId:userId];
    //: [self.navigationController pushViewController:vc animated:YES];
    [self.navigationController pushViewController:vc animated:YES];
}


//: #pragma mark - Notification
#pragma mark - Notification
//: - (void)onUserInfoChanged:(NSNotification *)notification
- (void)tingFrom:(NSNotification *)notification
{
    //: self.data = self.robots;
    self.data = self.outside;
    //: [self.tableView reloadData];
    [self.tableView reloadData];
}

//: - (void)onPull2Refresh:(id)sender
- (void)label:(id)sender
{
    //: [self.refreshControl beginRefreshing];
    [self.refreshControl beginRefreshing];
    //: __weak typeof(self) weakSelf = self;
    __weak typeof(self) weakSelf = self;
    //: [[NIMSDK sharedSDK].robotManager fetchAllRobotsFromServer:^(NSError * _Nullable error, NSArray<NIMRobot *> * _Nullable robots) {
    [[NIMSDK sharedSDK].robotManager fetchAllRobotsFromServer:^(NSError * _Nullable error, NSArray<NIMRobot *> * _Nullable robots) {
        //: [weakSelf.refreshControl endRefreshing];
        [weakSelf.refreshControl endRefreshing];
        //: if (!error)
        if (!error)
        {
            //: NSMutableArray *list = [[NSMutableArray alloc] init];
            NSMutableArray *list = [[NSMutableArray alloc] init];
            //: for (NIMRobot *robot in robots) {
            for (NIMRobot *robot in robots) {
                //: NTESContactDataMember *member = [[NTESContactDataMember alloc] init];
                ContactAt *member = [[ContactAt alloc] init];
                //: NIMKitInfo *info = [[NIMKit sharedKit] infoByUser:robot.userId option:nil];
                NIMKitInfo *info = [[NIMKit sharedKit] infoByUser:robot.userId option:nil];
                //: member.info = info;
                member.info = info;
                //: [list addObject:member];
                [list addObject:member];
            }
            //: weakSelf.data = list;
            weakSelf.data = list;
            //: [weakSelf.tableView reloadData];
            [weakSelf.tableView reloadData];
        }
    //: }];
    }];

}

//: #pragma mark - Private
#pragma mark - Private

//: - (void)addListener
- (void)doing
{
    //: extern NSString *NIMKitUserInfoHasUpdatedNotification;
    extern NSString *NIMKitUserInfoHasUpdatedNotification;
    //: [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onUserInfoChanged:) name:NIMKitUserInfoHasUpdatedNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onUserInfoChanged:) name:NIMKitUserInfoHasUpdatedNotification object:nil];
}

//: - (void)removeListenr
- (void)can
{
    //: [[NSNotificationCenter defaultCenter] removeObserver:self];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

//: - (NSMutableArray *)robots{
- (NSMutableArray *)outside{
    //: NSMutableArray *list = [[NSMutableArray alloc] init];
    NSMutableArray *list = [[NSMutableArray alloc] init];
    //: for (NIMRobot *robot in [NIMSDK sharedSDK].robotManager.allRobots) {
    for (NIMRobot *robot in [NIMSDK sharedSDK].robotManager.allRobots) {
        //: NTESContactDataMember *member = [[NTESContactDataMember alloc] init];
        ContactAt *member = [[ContactAt alloc] init];
        //: NIMKitInfo *info = [[NIMKit sharedKit] infoByUser:robot.userId option:nil];
        NIMKitInfo *info = [[NIMKit sharedKit] infoByUser:robot.userId option:nil];
        //: member.info = info;
        member.info = info;
        //: [list addObject:member];
        [list addObject:member];
    }
    //: return list;
    return list;
}

//: - (UIRefreshControl *)refreshControl
- (UIRefreshControl *)refreshControl
{
    //: if (!_refreshControl) {
    if (!_refreshControl) {
        //: _refreshControl = [[UIRefreshControl alloc] initWithFrame:CGRectZero];
        _refreshControl = [[UIRefreshControl alloc] initWithFrame:CGRectZero];
        //: [_refreshControl addTarget:self action:@selector(onPull2Refresh:) forControlEvents:UIControlEventValueChanged];
        [_refreshControl addTarget:self action:@selector(onPull2Refresh:) forControlEvents:UIControlEventValueChanged];
    }
    //: return _refreshControl;
    return _refreshControl;
}


//: @end
@end

Byte *PostDataToByte(PostData *data) {
    if (data->areaThread) return data->camera;
    for (int i = 0; i < data->insertBottom; i++) {
        data->camera[i] ^= data->dateFile;
    }
    data->camera[data->insertBottom] = 0;
    data->areaThread = true;
	if (data->insertBottom >= 1) {
		data->icon = data->camera[0];
	}
    return data->camera;
}

NSString *StringFromPostData(PostData *data) {
    return [NSString stringWithUTF8String:(char *)PostDataToByte(data)];
}
