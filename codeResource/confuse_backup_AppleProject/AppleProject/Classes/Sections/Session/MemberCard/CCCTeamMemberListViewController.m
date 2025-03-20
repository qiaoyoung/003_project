//
//  NTESTeamMemberListViewController.m
//  NIM
//
//  Created by chris on 15/3/26.
//  Copyright (c) 2015年 Netease. All rights reserved.
//

#import "CCCTeamMemberListViewController.h"
#import "BBBCardHeaderCell.h"
#import "BBBTeamCardMemberItem.h"
#import "BBBTeamMemberCardViewController.h"
#import "CCCKitDependency.h"
#import "CCCKitProgressHUD.h"
#import "CCCGlobalMacro.h"
#import "NSString+AppleProjectKit.h"
#import "BBBTeamListDataManager.h"
#import "NTESPersonalCardViewController.h"
#import "NTESContactDataCell.h"
#import "ZMONGroupMemberTableViewCell.h"
#import "AAAContactSelectViewController.h"
#define CollectionCellReuseId @"cell"
#define CollectionItemWidth  55
#define CollectionItemHeight 80
#define CollectionEdgeInsetLeftRight 20

#define CollectionEdgeInsetTopFirstLine 25
#define CollectionEdgeInsetTop 15

typedef void(^NIMTeamMemberListFetchDataBlock)(BOOL isCompletion);

@interface CCCTeamMemberListViewController ()<UITableViewDataSource,UITableViewDelegate,NIMContactSelectDelegate,NIMMemberCardCellDelegate>

//@property (nonatomic, strong) UICollectionView *collectionView;
//@property (nonatomic, weak) id <CCCTeamMemberListDataSource> dataSource;
@property (nonatomic, assign) NSInteger pageIndex;
@property (nonatomic, assign) NSInteger totalPageCount;
@property (nonatomic, strong) UIButton *nextBtn;
@property (nonatomic, strong) UIButton *lastBtn;
@property (nonatomic, strong) NSDictionary *teamSettingConfig;

@property (nonatomic ,strong) UITableView *tableView;

@property (nonatomic ,copy) NSArray *muteArray;

@end

@implementation CCCTeamMemberListViewController

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

                           
- (instancetype)initWithDataSource:(BBBTeamListDataManager *)dataSource {
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        _teamListManager = dataSource;
//        _dataSource = dataSource;
//        _pageIndex = 0;
//        _teamListManager = [[BBBTeamListDataManager alloc] initWithTeam:dataSource.team session:dataSource.session];
        NSString *kNIMTeamListDataTeamMembersChanged = @"kNIMTeamListDataTeamMembersChanged";
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(teamMemberUpdate:) name:kNIMTeamListDataTeamMembersChanged object:nil];
        
        NSLog(@"self.teamListManager-%@",_teamListManager.memberIds);
    }
    return self;
}


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

- (void)rightNavButtonClick{
        NSMutableArray *users = [self.teamListManager memberIds];
        NSString *currentUserID = [self.teamListManager myAccount];
        [users addObject:currentUserID];
        
        NIMContactFriendSelectConfig *config = [[NIMContactFriendSelectConfig alloc] init];
        config.filterIds = users;
        config.needMutiSelected = YES;
        AAAContactSelectViewController *vc = [[AAAContactSelectViewController alloc] initWithConfig:config];
        vc.delegate = self;
        [vc show];
}


- (void)viewDidLoad {
    [super viewDidLoad];
//    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"common_bg"]];
    UIImageView *bg = [[UIImageView alloc]initWithFrame:self.view.bounds];
    bg.image = [UIImage imageNamed:@"common_bg"];
    [self.view addSubview:bg];
    
    [self setupUI];
    [self loadMuteListData];
    
    NSMutableDictionary *dict = @{}.mutableCopy;
    dict[@"id"] = self.teamListManager.team.teamId?:@"";
    [ZCHttpManager getWithUrl:Server_team_getTeamSetting params:dict isShow:NO success:^(id responseObject) {
        NSDictionary *resultDict = (NSDictionary *)responseObject;
        NSString *code = [resultDict newStringValueForKey:@"code"];
        if (code.integerValue <= 0) {
            NSDictionary *data = [resultDict valueObjectForKey:@"data"];
            _teamSettingConfig = data;
        }

    } failed:^(id responseObject, NSError *error) {

    }];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
//    [self refreshPage];
//    [_collectionView reloadData];
    [self.tableView reloadData];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
}

- (void)refreshPage {
//    NSInteger itemCountPerPage = self.itemCountPerPage;
//    NSInteger memberNumber = _dataSource.memberNumber;
//    _totalPageCount = memberNumber / itemCountPerPage;
//
//    if (memberNumber%itemCountPerPage != 0) {
//        _totalPageCount++;
//    }
//    self.navigationItem.title = [NSString stringWithFormat:@"%@(%d/%d)", LangKey(@"group_info_activity_team_member"),(int)_pageIndex+1, (int)_totalPageCount];
//    _nextBtn.hidden = (_totalPageCount == 1 || _pageIndex == _totalPageCount - 1);
//    _lastBtn.hidden = (_totalPageCount == 1 || _pageIndex == 0);
}

- (void)setupUI {
    
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
    labtitle.text = LangKey(@"group_info_activity_team_member");
    [bgView addSubview:labtitle];
    
    UIButton *submitButton = [UIButton buttonWithType:UIButtonTypeCustom];
    submitButton.frame = CGRectMake(SCREEN_WIDTH-15-40, SCREEN_STATUS_HEIGHT+4, 40, 40);
    [submitButton setImage:[UIImage imageNamed:@"ic_group_addmember"] forState:(UIControlStateNormal)];
    [submitButton addTarget:self action:@selector(rightNavButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [bgView addSubview:submitButton];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(15, SCREEN_TOP_HEIGHT+15, SCREEN_WIDTH-30, SCREEN_HEIGHT-SCREEN_TOP_HEIGHT) style:UITableViewStyleGrouped];
    [self.view addSubview:self.tableView];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = [UIColor clearColor];
    _tableView.estimatedSectionHeaderHeight=15.1;
    _tableView.estimatedSectionFooterHeight=.1;
    self.tableView.estimatedRowHeight = UITableViewAutomaticDimension;
    self.tableView.delegate   = self;
    self.tableView.dataSource = self;
    
//    _nextBtn = [UIButton buttonWithType:UIButtonTypeSystem];
//    _nextBtn.titleLabel.font = [UIFont systemFontOfSize:13.0];
//    [_nextBtn setTitle:@"下一页".nim_localized forState:UIControlStateNormal];
//    [_nextBtn addTarget:self action:@selector(nextPageAction:) forControlEvents:UIControlEventTouchUpInside];
//    _nextBtn.frame = CGRectMake(0, 0, 40, 40);
//    _nextBtn.hidden = YES;
//    _lastBtn = [UIButton buttonWithType:UIButtonTypeSystem];
//    _lastBtn.titleLabel.font = [UIFont systemFontOfSize:13.0];
//
//    [_lastBtn setTitle:@"上一页".nim_localized forState:UIControlStateNormal];
//    _lastBtn.frame = CGRectMake(0, 0, 40, 40);
//    _lastBtn.hidden = YES;
//    [_lastBtn addTarget:self action:@selector(lastPageAction:) forControlEvents:UIControlEventTouchUpInside];
//    UIBarButtonItem *nextBtnItem =[[UIBarButtonItem alloc] initWithCustomView:_nextBtn];
//    UIBarButtonItem *lastBtnItem = [[UIBarButtonItem alloc] initWithCustomView:_lastBtn];
//
//    nextBtnItem.tintColor = [UIColor whiteColor];
//    lastBtnItem.tintColor = [UIColor whiteColor];
//
//    self.navigationItem.rightBarButtonItems = @[nextBtnItem, lastBtnItem];
//    [self.view addSubview:self.collectionView];
    
}

- (void)loadMuteListData {
////    NSInteger itemCountPerPage = [self itemCountPerPage];
//    BBBMembersFetchOption *option = [[BBBMembersFetchOption alloc] init];
////    option.offset = _pageIndex*itemCountPerPage;
////    option.count = itemCountPerPage;
//    option.isRefresh = NO;
//    __weak typeof(self) weakSelf = self;
//    [CCCKitProgressHUD show];
//    [_dataSource fetchTeamMembersWithOption:option completion:^(NSError * _Nullable error, NSString * _Nullable msg) {
//        [CCCKitProgressHUD dismiss];
//        if (error) {
//            [weakSelf.view makeToast:msg duration:2 position:CSToastPositionCenter];
//        } else {
//            [weakSelf refreshPage];
//            [weakSelf.tableView reloadData];
//        }
//    }];
    
    NSString *teamId = self.teamListManager.team.teamId;
    if (self.teamListManager.team.type == NIMTeamTypeSuper) {
        [[NIMSDK sharedSDK].superTeamManager fetchTeamMutedMembers:teamId completion:^(NSError * _Nullable error, NSArray<NIMTeamMember *> * _Nullable members) {
            self.muteArray = members;
            [self.tableView reloadData];
        }];
    } else {
        [[NIMSDK sharedSDK].teamManager fetchTeamMutedMembers:teamId completion:^(NSError * _Nullable error, NSArray<NIMTeamMember *> * _Nullable members) {
            self.muteArray = members;
            [self.tableView reloadData];
        }];
    }
}



//更新群成员禁言
- (void)cellShouldBeMute:(NSString *)uid mute:(BOOL)mute
{
//    [_dataSource updateUserMuteState:uid mute:mute completion:^(NSError * _Nonnull error, NSString * _Nonnull msg) {
//        [self.tableView reloadData];
//    }];
    
    BOOL ismute = YES;
    for (NIMTeamMember *member in self.muteArray) {
        if([member.userId isEqualToString:uid]){
            ismute = NO;
        }else{
            ismute = YES;
        }
    }
   
    NSString *teamId = self.teamListManager.team.teamId;
    if (self.teamListManager.team.type == NIMTeamTypeSuper) {
        NSMutableArray *users = [NSMutableArray array];
        if (uid) {
            [users addObject:uid];
        }
        [[NIMSDK sharedSDK].superTeamManager updateMuteState:ismute
                                                      userIds:users
                                                       inTeam:teamId
                                                  completion:^(NSError *error) {
            [self loadMuteListData];
          
        }];
    } else {
        [[NIMSDK sharedSDK].teamManager updateMuteState:ismute
                                                 userId:uid
                                                 inTeam:teamId
                                             completion:^(NSError *error) {
            NSString *msg = nil;
            if (!error) {
                msg = @"修改成功".nim_localized;
            }else{
                msg = @"修改失败".nim_localized;
            }
            [self.view makeToast:msg duration:2.0 position:CSToastPositionCenter];
            
//            [self.tableView reloadData];
            [self loadMuteListData];
         }];
    }
    
}


- (void)cellShouldBeRemoved:(NSString *)uid
{
    [CCCKitProgressHUD show];
    [self.teamListManager kickUsers:@[uid] completion:^(NSError * _Nonnull error, NSString * _Nonnull msg) {
        [CCCKitProgressHUD dismiss];
//        NSString *msg = nil;
//        if (!error) {
//            msg = @"修改成功".nim_localized;
//        }else{
//            msg = @"修改失败".nim_localized;
//        }
        [self.view makeToast:msg duration:2.0 position:CSToastPositionCenter];
        [self.tableView reloadData];
    }];
}

#pragma mark - UITableViewDelegate
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
//    return _teamListManager.memberIds.count;
////    return _dataSource.members.count;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    return _dataSource.members.count;
    return _teamListManager.memberIds.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    return 60;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return CGFLOAT_MIN;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return [[UIView alloc] init];
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return CGFLOAT_MIN;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return [[UIView alloc] init];
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ZMONGroupMemberTableViewCell *cell = [ZMONGroupMemberTableViewCell cellWithTableView:tableView];
    cell.delegate = self;

    NSString *uId = _teamListManager.memberIds[indexPath.row];
    CCCKitInfo *usrInfo = [[AppleProjectKit sharedKit] infoByUser:uId option:nil];
//    BBBTeamCardMemberItem *member = _dataSource.members[indexPath.row];
//    CCCKitInfo *usrInfo = [[AppleProjectKit sharedKit] infoByUser:member.member.userId option:nil];
 
//    cell.userInfo = usrInfo;
    [cell reloadWithUserId:uId];
    [cell.roleImageView sd_setImageWithURL:[NSURL URLWithString:usrInfo.avatarUrlString] placeholderImage:usrInfo.avatarImage];
    cell.titleLabel.text = usrInfo.showName;
//    cell.subtitleLabel.text = LangKey(@"Group_Me");
    cell.subtitleLabel.text = @"Administrator";
    
//    BOOL isMe = [uId isEqualToString:[NIMSDK sharedSDK].loginManager.currentAccount];
    BOOL isown = [uId isEqualToString:_teamListManager.team.owner];
    if(isown){
        cell.roleImageView.frame = CGRectMake(15, 10, 40, 40);
        cell.titleLabel.frame = CGRectMake(cell.roleImageView.right+16, 10, 150, 20);
        cell.subtitleLabel.hidden = NO;
        cell.subtitleLabel.frame = CGRectMake(cell.roleImageView.right+16, 30, 150, 20);
      
    
    }else{
        cell.roleImageView.frame = CGRectMake(15, 10, 40, 40);
        cell.titleLabel.frame = CGRectMake(cell.roleImageView.right+16, 0, 150, 60);
        cell.subtitleLabel.hidden = YES;
        cell.muteBtn.hidden = YES;
        cell.removeBtn.hidden = YES;
    }
    
    if([_teamListManager.team.owner isEqualToString:[NIMSDK sharedSDK].loginManager.currentAccount]){
        cell.muteBtn.hidden = NO;
        cell.removeBtn.hidden = NO;
        cell.muteBtn.selected = NO;
        for (NIMTeamMember *member in self.muteArray) {
            if([member.userId isEqualToString:uId] && member.isMuted){
                cell.muteBtn.selected = YES;
            }
        }
    }else{
        cell.muteBtn.hidden = YES;
        cell.removeBtn.hidden = YES;
    }
    
    if(isown){
        cell.muteBtn.hidden = YES;
        cell.removeBtn.hidden = YES;
    }
   

    
//    BBBTeamCardMemberItem
//        NSString *showName = data.title;
//        if ([data isMyUserId]) {
//            showName = LangKey(@"Group_Me");//@"我".nim_localized;
//        }
//        self.titleLabel.text = showName;
    
    
//    id<NIMKitCardHeaderData> data = [_dataSource.members objectAtIndex:indexPath.row];
//    NIMUser *user = [[NIMSDK sharedSDK].userManager userInfo:data.userId];
//    [cell refreshData:member];

//    id<NIMKitCardHeaderData> data = [_dataSource.members objectAtIndex:indexPath.row];
//
//    [cell.roleImageView sd_setImageWithURL:[NSURL URLWithString:data.imageUrl] placeholderImage:data.imageNormal];
//    cell.titleLabel.text = data.title;
    
    return cell;
    
    

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSString *canMemberInfo = [_teamSettingConfig newStringValueForKey:@"canAddFriend"];
    if (canMemberInfo.integerValue > 0) {
        NSString *uId = _teamListManager.memberIds[indexPath.row];
        NTESPersonalCardViewController *vc = [[NTESPersonalCardViewController alloc] initWithUserId:uId];
        vc.teamSetingConfig = _teamSettingConfig;
        [self.navigationController pushViewController:vc animated:YES];
    }

}



#pragma mark - ContactSelectDelegate
- (void)didFinishedSelect:(NSArray *)selectedContacts{
    [self didInviteUsers:selectedContacts completion:nil];
}

- (void)didInviteUsers:(NSArray<NSString *> *)userIds
            completion:(dispatch_block_t)completion {
    
    if (userIds.count == 0) {
        return;
    }
    
    NSMutableDictionary *info = [NSMutableDictionary dictionary];
    info[@"attach"] = @"扩展消息";
    switch (self.teamListManager.team.type) {
        case NIMTeamTypeNormal:
            info[@"postscript"] = @"邀请你加入讨论组".nim_localized;
            break;
        case NIMTeamTypeAdvanced:
            info[@"postscript"] = @"邀请你加入高级群".nim_localized;
            break;
        case NIMTeamTypeSuper:
            info[@"postscript"] = @"邀请你加入超大群".nim_localized;
            break;
        default:
            break;
    }
    __weak typeof(self) wself = self;
//    [CCCKitProgressHUD show];
    [self.teamListManager addUsers:userIds info:info completion:^(NSError * _Nonnull error, NSString * _Nonnull msg) {
//        [CCCKitProgressHUD dismiss];

        if (completion) {
            completion();
        }
    }];
}

#pragma mark - Actions
//- (void)nextPageAction:(id)sender {
//    NSInteger targetPage = _pageIndex+1;
//    NSInteger itemCountPerPage = [self itemCountPerPage];
//    _pageIndex++;
//    if (targetPage*itemCountPerPage + itemCountPerPage > _dataSource.members.count) { //需要加载新数据
//        [self loadNextData];
//    } else {
//        [self refreshPage];
//        [_collectionView reloadData];
//    }
//}
//
//- (void)lastPageAction:(id)sender {
//    if (_pageIndex == 0) {
//        return;
//    }
//    _pageIndex--;
//    [self refreshPage];
//    [_collectionView reloadData];
//}
//
- (void)teamMemberUpdate:(NSNotification *)note {
    [self refreshPage];
    [self.tableView reloadData];
}

//#pragma mark - UICollectionViewDataSource
//- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
//    NSInteger count = 0;
//    if (_pageIndex == _totalPageCount - 1) {
//        count = _dataSource.members.count - _pageIndex * self.itemCountPerPage;
//    } else if (_pageIndex < _totalPageCount - 1) {
//        count = self.itemCountPerPage;
//    }
//    return count;
//}
//
//- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
//    BBBCardHeaderCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CollectionCellReuseId forIndexPath:indexPath];
//    cell.delegate = self;
//    NSInteger index = _pageIndex * self.itemCountPerPage + indexPath.row;
//    if (_dataSource.members.count >= index){
//        id<NIMKitCardHeaderData> data = [_dataSource.members objectAtIndex:index];
//        [cell refreshData:data];
//    }
//    return cell;
//}
//
//#pragma mark - UICollectionViewDelegateFlowLayout
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
//    return CGSizeMake(CollectionItemWidth, CollectionItemHeight);
//}
//
//- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
//    if (section == 0) {
//        return UIEdgeInsetsMake(CollectionEdgeInsetTopFirstLine, 0, 0, 0);
//    }
//    return UIEdgeInsetsMake(CollectionEdgeInsetTop, 0, 0, 0);
//}
//
//#pragma mark - BBBCardHeaderCellDelegate
//- (void)cellDidSelected:(BBBCardHeaderCell*)cell{
//    NSIndexPath *indexpath = [self.collectionView indexPathForCell:cell];
//    NSInteger index = _pageIndex * self.itemCountPerPage + indexpath.row;
//
//
//
//
//
//    BBBTeamCardMemberItem *manager = nil;
//    for (BBBTeamCardMemberItem *item in _dataSource.members) {
//        if ([item.userId isEqualToString:[[NIMSDK sharedSDK].loginManager currentAccount]]) {
//            manager = item;
//        }
//    }
//    BBBTeamCardMemberItem *member = _dataSource.members[index];
//    if (manager.member.type == NIMTeamMemberTypeOwner) {
//        BBBTeamMemberCardViewController *vc = [[BBBTeamMemberCardViewController alloc] initWithMember:member.userId
//                                                                                dataSource:_dataSource];
//        [self.navigationController pushViewController:vc animated:YES];
//    }else{
//        NSString *canMemberInfo = [_teamSettingConfig newStringValueForKey:@"canMemberInfo"];
//        if (canMemberInfo.integerValue > 0) {
//            NTESPersonalCardViewController *vc = [[NTESPersonalCardViewController alloc] initWithUserId:member.userId];
//            vc.teamSetingConfig = _teamSettingConfig;
//            [self.navigationController pushViewController:vc animated:YES];
//        }else{
//            [SVProgressHUD showMessage:LangKey(@"暂未开放,请联系管理员")];
//        }
//    }
//}

//#pragma mark - 旋转处理 (iOS8 or above)
//- (void)viewWillTransitionToSize:(CGSize)size
//       withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator
//{
//    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
//    flowLayout.minimumInteritemSpacing = CollectionEdgeInsetLeftRight;
//    [self.collectionView setCollectionViewLayout:flowLayout animated:YES];
//
//    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
//    [coordinator animateAlongsideTransition:^(id <UIViewControllerTransitionCoordinatorContext> context)
//     {
//         [self.collectionView reloadData];
//     } completion:nil];
//}

#pragma mark - Private
//- (UICollectionView *)collectionView {
//    if (!_collectionView) {
//        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
//        _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
//        flowLayout.minimumInteritemSpacing = CollectionEdgeInsetLeftRight;
//        _collectionView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
//        _collectionView.backgroundColor = [UIColor colorWithRed:236.0/255.0 green:241.0/255.0 blue:245.0/255.0 alpha:1];
//        _collectionView.delegate   = self;
//        _collectionView.dataSource = self;
//        [_collectionView registerClass:[BBBCardHeaderCell class] forCellWithReuseIdentifier:CollectionCellReuseId];
//        _collectionView.contentInset = UIEdgeInsetsMake(self.collectionView.contentInset.top,
//                                                        CollectionEdgeInsetLeftRight,
//                                                        _collectionView.contentInset.bottom,
//                                                        CollectionEdgeInsetLeftRight);
//    }
//    return _collectionView;
//}
//
//- (NSInteger)itemCountPerPage {
//    CGFloat minSpace = 20.f; //防止计算到最后出现左右贴边的情况
//    NSInteger lines = (self.collectionView.frame.size.width - minSpace)/ (CollectionItemWidth + CollectionEdgeInsetLeftRight);
//    NSInteger rows = (self.collectionView.frame.size.height - minSpace)/(CollectionItemHeight + CollectionEdgeInsetLeftRight);
//    return rows * lines;
//}

@end
