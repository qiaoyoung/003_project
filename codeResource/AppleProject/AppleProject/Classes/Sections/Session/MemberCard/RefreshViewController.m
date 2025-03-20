
#import <Foundation/Foundation.h>

NSString *StringFromModeData(Byte *data);


//: 修改成功
Byte str_mansionCuriousName[] = {3, 12, 5, 117, 248, 159, 138, 229, 144, 136, 230, 185, 148, 230, 174, 191, 228, 76};


//: code
Byte str_flavorData[] = {44, 4, 3, 101, 100, 111, 99, 89};


//: Administrator
Byte str_immunePopularQuitData[] = {94, 13, 6, 236, 241, 5, 114, 111, 116, 97, 114, 116, 115, 105, 110, 105, 109, 100, 65, 150};


//: kNIMTeamListDataTeamMembersChanged
Byte str_suraContent[] = {24, 34, 12, 38, 168, 77, 149, 112, 17, 118, 170, 210, 100, 101, 103, 110, 97, 104, 67, 115, 114, 101, 98, 109, 101, 77, 109, 97, 101, 84, 97, 116, 97, 68, 116, 115, 105, 76, 109, 97, 101, 84, 77, 73, 78, 107, 13};


//: 扩展消息
Byte str_typicallyName[] = {60, 12, 8, 164, 164, 49, 14, 153, 175, 129, 230, 136, 182, 230, 149, 177, 229, 169, 137, 230, 146};


//: back_arrow_bl
Byte str_listenPostData[] = {87, 13, 6, 73, 231, 1, 108, 98, 95, 119, 111, 114, 114, 97, 95, 107, 99, 97, 98, 206};


//: data
Byte str_campName[] = {48, 4, 4, 227, 97, 116, 97, 100, 124};


//: 修改失败
Byte str_insistData[] = {49, 12, 7, 40, 57, 130, 194, 165, 180, 232, 177, 164, 229, 185, 148, 230, 174, 191, 228, 121};


//: 邀请你加入高级群
Byte str_attractiveData[] = {87, 24, 9, 126, 215, 107, 207, 192, 105, 164, 190, 231, 167, 186, 231, 152, 171, 233, 165, 133, 229, 160, 138, 229, 160, 189, 228, 183, 175, 232, 128, 130, 233, 228};


//: postscript
Byte str_limbTingInputValue[] = {16, 10, 7, 66, 150, 60, 243, 116, 112, 105, 114, 99, 115, 116, 115, 111, 112, 161};


//: 邀请你加入超大群
Byte str_yardKickTitle[] = {23, 24, 12, 246, 59, 3, 130, 136, 134, 140, 124, 219, 164, 190, 231, 167, 164, 229, 133, 182, 232, 165, 133, 229, 160, 138, 229, 160, 189, 228, 183, 175, 232, 128, 130, 233, 120};


//: common_bg
Byte str_tingMediaValue[] = {69, 9, 8, 106, 173, 76, 181, 51, 103, 98, 95, 110, 111, 109, 109, 111, 99, 152};


//: 邀请你加入讨论组
Byte str_introduceContent[] = {11, 24, 6, 153, 37, 154, 132, 187, 231, 186, 174, 232, 168, 174, 232, 165, 133, 229, 160, 138, 229, 160, 189, 228, 183, 175, 232, 128, 130, 233, 69};


//: group_info_activity_team_member
Byte str_jurorText[] = {28, 31, 11, 45, 89, 144, 208, 214, 99, 144, 187, 114, 101, 98, 109, 101, 109, 95, 109, 97, 101, 116, 95, 121, 116, 105, 118, 105, 116, 99, 97, 95, 111, 102, 110, 105, 95, 112, 117, 111, 114, 103, 230};


//: canAddFriend
Byte str_thatNameData[] = {6, 12, 7, 34, 146, 128, 192, 100, 110, 101, 105, 114, 70, 100, 100, 65, 110, 97, 99, 192};


//: attach
Byte str_lifeName[] = {52, 6, 11, 212, 11, 20, 191, 38, 157, 173, 173, 104, 99, 97, 116, 116, 97, 139};


//: /team/getTeamSetting
Byte str_fessData[] = {5, 20, 6, 246, 16, 9, 103, 110, 105, 116, 116, 101, 83, 109, 97, 101, 84, 116, 101, 103, 47, 109, 97, 101, 116, 47, 58};


//: ic_group_addmember
Byte str_fessLabData[] = {76, 18, 7, 232, 123, 76, 76, 114, 101, 98, 109, 101, 109, 100, 100, 97, 95, 112, 117, 111, 114, 103, 95, 99, 105, 61};

// __DEBUG__
// __CLOSE_PRINT__
//
//  NTESTeamMemberListViewController.m
//  NIM
//
//  Created by chris on 15/3/26.
//  Copyright (c) 2015年 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import "CCCTeamMemberListViewController.h"
#import "RefreshViewController.h"
//: #import "BBBCardHeaderCell.h"
#import "TingReusableView.h"
//: #import "BBBTeamCardMemberItem.h"
#import "OnenceShould.h"
//: #import "BBBTeamMemberCardViewController.h"
#import "WithTeamViewController.h"
//: #import "CCCKitDependency.h"
#import "CCCKitDependency.h"
//: #import "CCCKitProgressHUD.h"
#import "KitDisableView.h"
//: #import "CCCGlobalMacro.h"
#import "CCCGlobalMacro.h"
//: #import "NSString+AppleProjectKit.h"
#import "NSString+Indicator.h"
//: #import "BBBTeamListDataManager.h"
#import "ListHideState.h"
//: #import "NTESPersonalCardViewController.h"
#import "HideViewController.h"
//: #import "NTESContactDataCell.h"
#import "AccountingDataTeamViewCell.h"
//: #import "ZMONGroupMemberTableViewCell.h"
#import "BubbleViewCell.h"
//: #import "AAAContactSelectViewController.h"
#import "SelectDisableViewController.h"

//: typedef void(^NIMTeamMemberListFetchDataBlock)(BOOL isCompletion);
typedef void(^NIMTeamMemberListFetchDataBlock)(BOOL isCompletion);

//: @interface CCCTeamMemberListViewController ()<UITableViewDataSource,UITableViewDelegate,NIMContactSelectDelegate,NIMMemberCardCellDelegate>
@interface RefreshViewController ()<UITableViewDataSource,UITableViewDelegate,ContainerDelegate,NameDelegate>

//@property (nonatomic, strong) UICollectionView *collectionView;
//@property (nonatomic, weak) id <MessageSource> dataSource;
//: @property (nonatomic, assign) NSInteger pageIndex;
@property (nonatomic, assign) NSInteger pageIndex;
//: @property (nonatomic, assign) NSInteger totalPageCount;
@property (nonatomic, assign) NSInteger totalPageCount;
//: @property (nonatomic, strong) UIButton *nextBtn;
@property (nonatomic, strong) UIButton *nextBtn;
//: @property (nonatomic, strong) UIButton *lastBtn;
@property (nonatomic, strong) UIButton *lastBtn;
//: @property (nonatomic, strong) NSDictionary *teamSettingConfig;
@property (nonatomic, strong) NSDictionary *teamSettingConfig;

//: @property (nonatomic ,strong) UITableView *tableView;
@property (nonatomic ,strong) UITableView *tableView;

//: @property (nonatomic ,copy) NSArray *muteArray;
@property (nonatomic ,copy) NSArray *muteArray;

//: @end
@end

//: @implementation CCCTeamMemberListViewController
@implementation RefreshViewController

//: - (void)dealloc {
- (void)dealloc {
    //: [[NSNotificationCenter defaultCenter] removeObserver:self];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


//: - (instancetype)initWithDataSource:(BBBTeamListDataManager *)dataSource {
- (instancetype)initWithOutOfSightSource:(ListHideState *)dataSource {
    //: self = [super initWithNibName:nil bundle:nil];
    self = [super initWithNibName:nil bundle:nil];
    //: if (self) {
    if (self) {
        //: _teamListManager = dataSource;
        _teamListManager = dataSource;
//        _dataSource = dataSource;
//        _pageIndex = 0;
//        _teamListManager = [[ListHideState alloc] initWithTeam:dataSource.team session:dataSource.session];
        //: NSString *kNIMTeamListDataTeamMembersChanged = @"kNIMTeamListDataTeamMembersChanged";
        NSString *k_showName = StringFromModeData(str_suraContent);
        //: [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(teamMemberUpdate:) name:kNIMTeamListDataTeamMembersChanged object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(commentsed:) name:k_showName object:nil];

        //: NSLog(@"self.teamListManager-%@",_teamListManager.memberIds);
    }
    //: return self;
    return self;
}


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

//: - (void)rightNavButtonClick{
- (void)timeCircle{
        //: NSMutableArray *users = [self.teamListManager memberIds];
        NSMutableArray *users = [self.teamListManager memberIds];
        //: NSString *currentUserID = [self.teamListManager myAccount];
        NSString *currentUserID = [self.teamListManager myAccount];
        //: [users addObject:currentUserID];
        [users addObject:currentUserID];

        //: NIMContactFriendSelectConfig *config = [[NIMContactFriendSelectConfig alloc] init];
        ChildTeam *config = [[ChildTeam alloc] init];
        //: config.filterIds = users;
        config.filterIds = users;
        //: config.needMutiSelected = YES;
        config.needMutiSelected = YES;
        //: AAAContactSelectViewController *vc = [[AAAContactSelectViewController alloc] initWithConfig:config];
        SelectDisableViewController *vc = [[SelectDisableViewController alloc] initWithTextConfig:config];
        //: vc.delegate = self;
        vc.delegate = self;
        //: [vc show];
        [vc fromOn];
}


//: - (void)viewDidLoad {
- (void)viewDidLoad {
    //: [super viewDidLoad];
    [super viewDidLoad];
//    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"common_bg"]];
    //: UIImageView *bg = [[UIImageView alloc]initWithFrame:self.view.bounds];
    UIImageView *bg = [[UIImageView alloc]initWithFrame:self.view.bounds];
    //: bg.image = [UIImage imageNamed:@"common_bg"];
    bg.image = [UIImage imageNamed:StringFromModeData(str_tingMediaValue)];
    //: [self.view addSubview:bg];
    [self.view addSubview:bg];

    //: [self setupUI];
    [self matronymicContent];
    //: [self loadMuteListData];
    [self playList];

    //: NSMutableDictionary *dict = @{}.mutableCopy;
    NSMutableDictionary *dict = @{}.mutableCopy;
    //: dict[@"id"] = self.teamListManager.team.teamId?:@"";
    dict[@"id"] = self.teamListManager.team.teamId?:@"";
    //: [ZCHttpManager getWithUrl:[NSString stringWithFormat:@"/team/getTeamSetting"] params:dict isShow:NO success:^(id responseObject) {
    [FromMessage maxColor:[NSString stringWithFormat:StringFromModeData(str_fessData)] flush:dict countIn:NO alongResponseSuccess:^(id responseObject) {
        //: NSDictionary *resultDict = (NSDictionary *)responseObject;
        NSDictionary *resultDict = (NSDictionary *)responseObject;
        //: NSString *code = [resultDict newStringValueForKey:@"code"];
        NSString *code = [resultDict cord:StringFromModeData(str_flavorData)];
        //: if (code.integerValue <= 0) {
        if (code.integerValue <= 0) {
            //: NSDictionary *data = [resultDict valueObjectForKey:@"data"];
            NSDictionary *data = [resultDict eigenvalueOfAMatrix:StringFromModeData(str_campName)];
            //: _teamSettingConfig = data;
            _teamSettingConfig = data;
        }

    //: } failed:^(id responseObject, NSError *error) {
    } searched:^(id responseObject, NSError *error) {

    //: }];
    }];
}

//: - (void)viewDidAppear:(BOOL)animated {
- (void)viewDidAppear:(BOOL)animated {
    //: [super viewDidAppear:animated];
    [super viewDidAppear:animated];
//    [self refreshPage];
//    [_collectionView reloadData];
    //: [self.tableView reloadData];
    [self.tableView reloadData];
}

//: - (void)viewDidLayoutSubviews {
- (void)viewDidLayoutSubviews {
    //: [super viewDidLayoutSubviews];
    [super viewDidLayoutSubviews];
}

//: - (void)refreshPage {
- (void)successTapSpreadHead {
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

//: - (void)setupUI {
- (void)matronymicContent {

    //: UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, (44.0f + [UIDevice vg_statusBarHeight]))];
    UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, (44.0f + [UIDevice task]))];
    //: [self.view addSubview:bgView];
    [self.view addSubview:bgView];

    //: UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    //: backButton.frame = CGRectMake(5, [UIDevice vg_statusBarHeight]+4, 40, 40);
    backButton.frame = CGRectMake(5, [UIDevice task]+4, 40, 40);
    //: [backButton setImage:[UIImage imageNamed:@"back_arrow_bl"] forState:(UIControlStateNormal)];
    [backButton setImage:[UIImage imageNamed:StringFromModeData(str_listenPostData)] forState:(UIControlStateNormal)];
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
    //: labtitle.text = [NTESLanguageManager getTextWithKey:@"group_info_activity_team_member"];
    labtitle.text = [MaxInformation off:StringFromModeData(str_jurorText)];
    //: [bgView addSubview:labtitle];
    [bgView addSubview:labtitle];

    //: UIButton *submitButton = [UIButton buttonWithType:UIButtonTypeCustom];
    UIButton *submitButton = [UIButton buttonWithType:UIButtonTypeCustom];
    //: submitButton.frame = CGRectMake([[UIScreen mainScreen] bounds].size.width-15-40, [UIDevice vg_statusBarHeight]+4, 40, 40);
    submitButton.frame = CGRectMake([[UIScreen mainScreen] bounds].size.width-15-40, [UIDevice task]+4, 40, 40);
    //: [submitButton setImage:[UIImage imageNamed:@"ic_group_addmember"] forState:(UIControlStateNormal)];
    [submitButton setImage:[UIImage imageNamed:StringFromModeData(str_fessLabData)] forState:(UIControlStateNormal)];
    //: [submitButton addTarget:self action:@selector(rightNavButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [submitButton addTarget:self action:@selector(timeCircle) forControlEvents:UIControlEventTouchUpInside];
    //: [bgView addSubview:submitButton];
    [bgView addSubview:submitButton];

    //: self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(15, (44.0f + [UIDevice vg_statusBarHeight])+15, [[UIScreen mainScreen] bounds].size.width-30, [[UIScreen mainScreen] bounds].size.height-(44.0f + [UIDevice vg_statusBarHeight])) style:UITableViewStyleGrouped];
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(15, (44.0f + [UIDevice task])+15, [[UIScreen mainScreen] bounds].size.width-30, [[UIScreen mainScreen] bounds].size.height-(44.0f + [UIDevice task])) style:UITableViewStyleGrouped];
    //: [self.view addSubview:self.tableView];
    [self.view addSubview:self.tableView];
    //: self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    //: self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.backgroundColor = [UIColor clearColor];
    //: _tableView.estimatedSectionHeaderHeight=15.1;
    _tableView.estimatedSectionHeaderHeight=15.1;
    //: _tableView.estimatedSectionFooterHeight=.1;
    _tableView.estimatedSectionFooterHeight=.1;
    //: self.tableView.estimatedRowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = UITableViewAutomaticDimension;
    //: self.tableView.delegate = self;
    self.tableView.delegate = self;
    //: self.tableView.dataSource = self;
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

//: - (void)loadMuteListData {
- (void)playList {
////    NSInteger itemCountPerPage = [self itemCountPerPage];
//    TypicalOption *option = [[TypicalOption alloc] init];
////    option.offset = _pageIndex*itemCountPerPage;
////    option.count = itemCountPerPage;
//    option.isRefresh = NO;
//    __weak typeof(self) weakSelf = self;
//    [KitDisableView show];
//    [_dataSource fetchTeamMembersWithOption:option completion:^(NSError * _Nullable error, NSString * _Nullable msg) {
//        [KitDisableView dismiss];
//        if (error) {
//            [weakSelf.view makeToast:msg duration:2 position:CSToastPositionCenter];
//        } else {
//            [weakSelf refreshPage];
//            [weakSelf.tableView reloadData];
//        }
//    }];

    //: NSString *teamId = self.teamListManager.team.teamId;
    NSString *teamId = self.teamListManager.team.teamId;
    //: if (self.teamListManager.team.type == NIMTeamTypeSuper) {
    if (self.teamListManager.team.type == NIMTeamTypeSuper) {
        //: [[NIMSDK sharedSDK].superTeamManager fetchTeamMutedMembers:teamId completion:^(NSError * _Nullable error, NSArray<NIMTeamMember *> * _Nullable members) {
        [[NIMSDK sharedSDK].superTeamManager fetchTeamMutedMembers:teamId completion:^(NSError * _Nullable error, NSArray<NIMTeamMember *> * _Nullable members) {
            //: self.muteArray = members;
            self.muteArray = members;
            //: [self.tableView reloadData];
            [self.tableView reloadData];
        //: }];
        }];
    //: } else {
    } else {
        //: [[NIMSDK sharedSDK].teamManager fetchTeamMutedMembers:teamId completion:^(NSError * _Nullable error, NSArray<NIMTeamMember *> * _Nullable members) {
        [[NIMSDK sharedSDK].teamManager fetchTeamMutedMembers:teamId completion:^(NSError * _Nullable error, NSArray<NIMTeamMember *> * _Nullable members) {
            //: self.muteArray = members;
            self.muteArray = members;
            //: [self.tableView reloadData];
            [self.tableView reloadData];
        //: }];
        }];
    }
}



//更新群成员禁言
//: - (void)cellShouldBeMute:(NSString *)uid mute:(BOOL)mute
- (void)noneStartMute:(NSString *)uid at:(BOOL)mute
{
//    [_dataSource updateUserMuteState:uid mute:mute completion:^(NSError * _Nonnull error, NSString * _Nonnull msg) {
//        [self.tableView reloadData];
//    }];

    //: BOOL ismute = YES;
    BOOL ismute = YES;
    //: for (NIMTeamMember *member in self.muteArray) {
    for (NIMTeamMember *member in self.muteArray) {
        //: if([member.userId isEqualToString:uid]){
        if([member.userId isEqualToString:uid]){
            //: ismute = NO;
            ismute = NO;
        //: }else{
        }else{
            //: ismute = YES;
            ismute = YES;
        }
    }

    //: NSString *teamId = self.teamListManager.team.teamId;
    NSString *teamId = self.teamListManager.team.teamId;
    //: if (self.teamListManager.team.type == NIMTeamTypeSuper) {
    if (self.teamListManager.team.type == NIMTeamTypeSuper) {
        //: NSMutableArray *users = [NSMutableArray array];
        NSMutableArray *users = [NSMutableArray array];
        //: if (uid) {
        if (uid) {
            //: [users addObject:uid];
            [users addObject:uid];
        }
        //: [[NIMSDK sharedSDK].superTeamManager updateMuteState:ismute
        [[NIMSDK sharedSDK].superTeamManager updateMuteState:ismute
                                                      //: userIds:users
                                                      userIds:users
                                                       //: inTeam:teamId
                                                       inTeam:teamId
                                                  //: completion:^(NSError *error) {
                                                  completion:^(NSError *error) {
            //: [self loadMuteListData];
            [self playList];

        //: }];
        }];
    //: } else {
    } else {
        //: [[NIMSDK sharedSDK].teamManager updateMuteState:ismute
        [[NIMSDK sharedSDK].teamManager updateMuteState:ismute
                                                 //: userId:uid
                                                 userId:uid
                                                 //: inTeam:teamId
                                                 inTeam:teamId
                                             //: completion:^(NSError *error) {
                                             completion:^(NSError *error) {
            //: NSString *msg = nil;
            NSString *msg = nil;
            //: if (!error) {
            if (!error) {
                //: msg = @"修改成功".nim_localized;
                msg = StringFromModeData(str_mansionCuriousName).trapLocalized;
            //: }else{
            }else{
                //: msg = @"修改失败".nim_localized;
                msg = StringFromModeData(str_insistData).trapLocalized;
            }
            //: [self.view makeToast:msg duration:2.0 position:CSToastPositionCenter];
            [self.view makeToast:msg duration:2.0 position:CSToastPositionCenter];

//            [self.tableView reloadData];
            //: [self loadMuteListData];
            [self playList];
         //: }];
         }];
    }

}


//: - (void)cellShouldBeRemoved:(NSString *)uid
- (void)imaged:(NSString *)uid
{
    //: [CCCKitProgressHUD show];
    [KitDisableView grade];
    //: [self.teamListManager kickUsers:@[uid] completion:^(NSError * _Nonnull error, NSString * _Nonnull msg) {
    [self.teamListManager say:@[uid] messageSearch:^(NSError * _Nonnull error, NSString * _Nonnull msg) {
        //: [CCCKitProgressHUD dismiss];
        [KitDisableView input];
//        NSString *msg = nil;
//        if (!error) {
//            msg = @"修改成功".nim_localized;
//        }else{
//            msg = @"修改失败".nim_localized;
//        }
        //: [self.view makeToast:msg duration:2.0 position:CSToastPositionCenter];
        [self.view makeToast:msg duration:2.0 position:CSToastPositionCenter];
        //: [self.tableView reloadData];
        [self.tableView reloadData];
    //: }];
    }];
}

//: #pragma mark - UITableViewDelegate
#pragma mark - UITableViewDelegate
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
//    return _teamListManager.memberIds.count;
////    return _dataSource.members.count;
//}

//: - (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    return _dataSource.members.count;
    //: return _teamListManager.memberIds.count;
    return _teamListManager.memberIds.count;
}

//: - (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    //: return 60;
    return 60;
}

//: - (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    //: return 2.2250738585072014e-308;
    return 2.2250738585072014e-308;
}

//: - (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    //: return [[UIView alloc] init];
    return [[UIView alloc] init];
}

//: - (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    //: return 2.2250738585072014e-308;
    return 2.2250738585072014e-308;
}

//: - (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    //: return [[UIView alloc] init];
    return [[UIView alloc] init];
}

//: - (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    //: ZMONGroupMemberTableViewCell *cell = [ZMONGroupMemberTableViewCell cellWithTableView:tableView];
    BubbleViewCell *cell = [BubbleViewCell equalView:tableView];
    //: cell.delegate = self;
    cell.delegate = self;

    //: NSString *uId = _teamListManager.memberIds[indexPath.row];
    NSString *uId = _teamListManager.memberIds[indexPath.row];
    //: CCCKitInfo *usrInfo = [[AppleProjectKit sharedKit] infoByUser:uId option:nil];
    TitleInfo *usrInfo = [[Indicator reach] indoors:uId harvest:nil];
//    OnenceShould *member = _dataSource.members[indexPath.row];
//    TitleInfo *usrInfo = [[Indicator sharedKit] infoByUser:member.member.userId option:nil];

//    cell.userInfo = usrInfo;
    //: [cell reloadWithUserId:uId];
    [cell bottom:uId];
    //: [cell.roleImageView sd_setImageWithURL:[NSURL URLWithString:usrInfo.avatarUrlString] placeholderImage:usrInfo.avatarImage];
    [cell.roleImageView sd_setImageWithURL:[NSURL URLWithString:usrInfo.avatarUrlString] placeholderImage:usrInfo.avatarImage];
    //: cell.titleLabel.text = usrInfo.showName;
    cell.titleLabel.text = usrInfo.showName;
//    cell.subtitleLabel.text = LangKey(@"Group_Me");
    //: cell.subtitleLabel.text = @"Administrator";
    cell.subtitleLabel.text = StringFromModeData(str_immunePopularQuitData);

//    BOOL isMe = [uId isEqualToString:[NIMSDK sharedSDK].loginManager.currentAccount];
    //: BOOL isown = [uId isEqualToString:_teamListManager.team.owner];
    BOOL isown = [uId isEqualToString:_teamListManager.team.owner];
    //: if(isown){
    if(isown){
        //: cell.roleImageView.frame = CGRectMake(15, 10, 40, 40);
        cell.roleImageView.frame = CGRectMake(15, 10, 40, 40);
        //: cell.titleLabel.frame = CGRectMake(cell.roleImageView.right+16, 10, 150, 20);
        cell.titleLabel.frame = CGRectMake(cell.roleImageView.right+16, 10, 150, 20);
        //: cell.subtitleLabel.hidden = NO;
        cell.subtitleLabel.hidden = NO;
        //: cell.subtitleLabel.frame = CGRectMake(cell.roleImageView.right+16, 30, 150, 20);
        cell.subtitleLabel.frame = CGRectMake(cell.roleImageView.right+16, 30, 150, 20);


    //: }else{
    }else{
        //: cell.roleImageView.frame = CGRectMake(15, 10, 40, 40);
        cell.roleImageView.frame = CGRectMake(15, 10, 40, 40);
        //: cell.titleLabel.frame = CGRectMake(cell.roleImageView.right+16, 0, 150, 60);
        cell.titleLabel.frame = CGRectMake(cell.roleImageView.right+16, 0, 150, 60);
        //: cell.subtitleLabel.hidden = YES;
        cell.subtitleLabel.hidden = YES;
        //: cell.muteBtn.hidden = YES;
        cell.muteBtn.hidden = YES;
        //: cell.removeBtn.hidden = YES;
        cell.removeBtn.hidden = YES;
    }

    //: if([_teamListManager.team.owner isEqualToString:[NIMSDK sharedSDK].loginManager.currentAccount]){
    if([_teamListManager.team.owner isEqualToString:[NIMSDK sharedSDK].loginManager.currentAccount]){
        //: cell.muteBtn.hidden = NO;
        cell.muteBtn.hidden = NO;
        //: cell.removeBtn.hidden = NO;
        cell.removeBtn.hidden = NO;
        //: cell.muteBtn.selected = NO;
        cell.muteBtn.selected = NO;
        //: for (NIMTeamMember *member in self.muteArray) {
        for (NIMTeamMember *member in self.muteArray) {
            //: if([member.userId isEqualToString:uId] && member.isMuted){
            if([member.userId isEqualToString:uId] && member.isMuted){
                //: cell.muteBtn.selected = YES;
                cell.muteBtn.selected = YES;
            }
        }
    //: }else{
    }else{
        //: cell.muteBtn.hidden = YES;
        cell.muteBtn.hidden = YES;
        //: cell.removeBtn.hidden = YES;
        cell.removeBtn.hidden = YES;
    }

    //: if(isown){
    if(isown){
        //: cell.muteBtn.hidden = YES;
        cell.muteBtn.hidden = YES;
        //: cell.removeBtn.hidden = YES;
        cell.removeBtn.hidden = YES;
    }



//    OnenceShould
//        NSString *showName = data.title;
//        if ([data isMyUserId]) {
//            showName = LangKey(@"Group_Me");//@"我".nim_localized;
//        }
//        self.titleLabel.text = showName;


//    id<WithChild> data = [_dataSource.members objectAtIndex:indexPath.row];
//    NIMUser *user = [[NIMSDK sharedSDK].userManager userInfo:data.userId];
//    [cell refreshData:member];

//    id<WithChild> data = [_dataSource.members objectAtIndex:indexPath.row];
//
//    [cell.roleImageView sd_setImageWithURL:[NSURL URLWithString:data.imageUrl] placeholderImage:data.imageNormal];
//    cell.titleLabel.text = data.title;

    //: return cell;
    return cell;



}

//: - (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //: [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    //: NSString *canMemberInfo = [_teamSettingConfig newStringValueForKey:@"canAddFriend"];
    NSString *canMemberInfo = [_teamSettingConfig cord:StringFromModeData(str_thatNameData)];
    //: if (canMemberInfo.integerValue > 0) {
    if (canMemberInfo.integerValue > 0) {
        //: NSString *uId = _teamListManager.memberIds[indexPath.row];
        NSString *uId = _teamListManager.memberIds[indexPath.row];
        //: NTESPersonalCardViewController *vc = [[NTESPersonalCardViewController alloc] initWithUserId:uId];
        HideViewController *vc = [[HideViewController alloc] initWithOn:uId];
        //: vc.teamSetingConfig = _teamSettingConfig;
        vc.teamSetingConfig = _teamSettingConfig;
        //: [self.navigationController pushViewController:vc animated:YES];
        [self.navigationController pushViewController:vc animated:YES];
    }

}



//: #pragma mark - ContactSelectDelegate
#pragma mark - ContactSelectDelegate
//: - (void)didFinishedSelect:(NSArray *)selectedContacts{
- (void)sourceTeamInfo:(NSArray *)selectedContacts{
    //: [self didInviteUsers:selectedContacts completion:nil];
    [self name:selectedContacts length:nil];
}

//: - (void)didInviteUsers:(NSArray<NSString *> *)userIds
- (void)name:(NSArray<NSString *> *)userIds
            //: completion:(dispatch_block_t)completion {
            length:(dispatch_block_t)completion {

    //: if (userIds.count == 0) {
    if (userIds.count == 0) {
        //: return;
        return;
    }

    //: NSMutableDictionary *info = [NSMutableDictionary dictionary];
    NSMutableDictionary *info = [NSMutableDictionary dictionary];
    //: info[@"attach"] = @"扩展消息";
    info[StringFromModeData(str_lifeName)] = StringFromModeData(str_typicallyName);
    //: switch (self.teamListManager.team.type) {
    switch (self.teamListManager.team.type) {
        //: case NIMTeamTypeNormal:
        case NIMTeamTypeNormal:
            //: info[@"postscript"] = @"邀请你加入讨论组".nim_localized;
            info[StringFromModeData(str_limbTingInputValue)] = StringFromModeData(str_introduceContent).trapLocalized;
            //: break;
            break;
        //: case NIMTeamTypeAdvanced:
        case NIMTeamTypeAdvanced:
            //: info[@"postscript"] = @"邀请你加入高级群".nim_localized;
            info[StringFromModeData(str_limbTingInputValue)] = StringFromModeData(str_attractiveData).trapLocalized;
            //: break;
            break;
        //: case NIMTeamTypeSuper:
        case NIMTeamTypeSuper:
            //: info[@"postscript"] = @"邀请你加入超大群".nim_localized;
            info[StringFromModeData(str_limbTingInputValue)] = StringFromModeData(str_yardKickTitle).trapLocalized;
            //: break;
            break;
        //: default:
        default:
            //: break;
            break;
    }
    //: __weak typeof(self) wself = self;
    __weak typeof(self) wself = self;
//    [KitDisableView show];
    //: [self.teamListManager addUsers:userIds info:info completion:^(NSError * _Nonnull error, NSString * _Nonnull msg) {
    [self.teamListManager completion:userIds beforeSearched:info top:^(NSError * _Nonnull error, NSString * _Nonnull msg) {
//        [KitDisableView dismiss];

        //: if (completion) {
        if (completion) {
            //: completion();
            completion();
        }
    //: }];
    }];
}

//: #pragma mark - Actions
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
//: - (void)teamMemberUpdate:(NSNotification *)note {
- (void)commentsed:(NSNotification *)note {
    //: [self refreshPage];
    [self successTapSpreadHead];
    //: [self.tableView reloadData];
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
//    TingReusableView *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CollectionCellReuseId forIndexPath:indexPath];
//    cell.delegate = self;
//    NSInteger index = _pageIndex * self.itemCountPerPage + indexPath.row;
//    if (_dataSource.members.count >= index){
//        id<WithChild> data = [_dataSource.members objectAtIndex:index];
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
//#pragma mark - TapWithOf
//- (void)cellDidSelected:(TingReusableView*)cell{
//    NSIndexPath *indexpath = [self.collectionView indexPathForCell:cell];
//    NSInteger index = _pageIndex * self.itemCountPerPage + indexpath.row;
//
//
//
//
//
//    OnenceShould *manager = nil;
//    for (OnenceShould *item in _dataSource.members) {
//        if ([item.userId isEqualToString:[[NIMSDK sharedSDK].loginManager currentAccount]]) {
//            manager = item;
//        }
//    }
//    OnenceShould *member = _dataSource.members[index];
//    if (manager.member.type == NIMTeamMemberTypeOwner) {
//        WithTeamViewController *vc = [[WithTeamViewController alloc] initWithMember:member.userId
//                                                                                dataSource:_dataSource];
//        [self.navigationController pushViewController:vc animated:YES];
//    }else{
//        NSString *canMemberInfo = [_teamSettingConfig newStringValueForKey:@"canMemberInfo"];
//        if (canMemberInfo.integerValue > 0) {
//            HideViewController *vc = [[HideViewController alloc] initWithUserId:member.userId];
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

//: #pragma mark - Private
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
//        [_collectionView registerClass:[TingReusableView class] forCellWithReuseIdentifier:CollectionCellReuseId];
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

//: @end
@end

Byte * ModeDataToCache(Byte *data) {
    int fedImage = data[0];
    int impose = data[1];
    int statisticalTable = data[2];
    if (!fedImage) return data + statisticalTable;
    for (int i = 0; i < impose / 2; i++) {
        int begin = statisticalTable + i;
        int end = statisticalTable + impose - i - 1;
        Byte temp = data[begin];
        data[begin] = data[end];
        data[end] = temp;
    }
    data[0] = 0;
    data[statisticalTable + impose] = 0;
    return data + statisticalTable;
}

NSString *StringFromModeData(Byte *data) {
    return [NSString stringWithUTF8String:(char *)ModeDataToCache(data)];
}  
