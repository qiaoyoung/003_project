//
//  CCCContactsViewController.m
//  NIM
//
//  Created by 彭爽 on 2021/9/8.
//  Copyright © 2021 Netease. All rights reserved.
//

#import "CCCContactsViewController.h"
#import "NTESSessionUtil.h"
#import "NTESSessionViewController.h"
#import "NTESContactUtilItem.h"
#import "NTESContactDefines.h"
#import "NTESGroupedContacts.h"
#import "UIView+Toast.h"
#import "NTESCustomNotificationDB.h"
#import "NTESNotificationCenter.h"
#import "UIActionSheet+NTESBlock.h"
#import "NTESContactAddFriendViewController.h"
#import "NTESPersonalCardViewController.h"
#import "UIAlertView+NTESBlock.h"
#import "SVProgressHUD.h"
#import "NTESContactUtilCell.h"
#import "NTESContactDataCell.h"
#import "AAAContactSelectViewController.h"
#import "NTESUserUtil.h"
#import "NTESBundleSetting.h"
#import "UIView+NTES.h"
//#import "NTESContactSearchResultVC.h"
#import "NTESContactSearchViewController.h"
#import "NTESSystemNotificationViewController.h"
#import "CCCBlackListViewController.h"
#import "NTESContactHeaderView.h"
#import "CCCContactScanViewController.h"
#import "NTESContactTableHeader.h"
#import "NTESContactGroupCell.h"
#import "CCCAddressBookManager.h"
#import "NSObject+YYModel.h"
#import <FFDropDownMenu/FFDropDownMenu.h>
#import <FFDropDownMenu/FFDropDownMenuView.h>
#import "NTESFriendListTableViewCell.h"
#import "AAAKitFileLocationHelper.h"


static const NSString *contactCellUtilIcon   = @"icon";
static const NSString *contactCellUtilVC     = @"vc";
static const NSString *contactCellUtilBadge  = @"badge";
static const NSString *contactCellUtilTitle  = @"title";
static const NSString *contactCellUtilUid    = @"uid";
static const NSString *contactCellUtilSelectorName = @"selName";


@interface CCCContactsViewController ()<NTESUserListCellDelegate,NIMUserManagerDelegate,NIMSystemNotificationManagerDelegate,
NTESContactUtilCellDelegate,
AAAContactDataCellDelegate,
NIMLoginManagerDelegate,
NIMEventSubscribeManagerDelegate,
NTESContactSearchDelegate> {
    UIRefreshControl *_refreshControl;
    NTESGroupedContacts *_contacts;
}

@property (nonatomic, strong) FFDropDownMenuView *dropdownMenu;/** 下拉菜单 */

@property (nonatomic,strong) NSArray * datas;
@property (nonatomic,strong) UIButton *btnfriend;
@property (nonatomic,strong) UIButton *btngroup;

@property (nonatomic,strong) UIButton *btnScan;
@property (nonatomic,strong) UIButton *btnCreatgroup;

@property (nonatomic ,strong) NSArray *normalTeamArray;
@property (nonatomic ,strong) NSArray *advancedTeamArray;;
@property (nonatomic ,assign) NSInteger sliderIndex;

@property (nonatomic ,strong) NSArray *groupArray;

@property (nonatomic ,strong) NSMutableArray *tempOpenArray;

@property (nonatomic ,strong) NTESContactHeaderView *headerView;
@property (nonatomic, strong) ZMONCustomLoadingView *loadingView;

@end

@implementation CCCContactsViewController

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [[NIMSDK sharedSDK].systemNotificationManager removeDelegate:self];
    [[NIMSDK sharedSDK].loginManager removeDelegate:self];
    [[NIMSDK sharedSDK].userManager removeDelegate:self];
    [[NIMSDK sharedSDK].subscribeManager removeDelegate:self];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar setHidden:NO];

}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [_headerView reloadCountNumber:0];
    
    [self fetchContacts];
    self.advancedTeamArray = [self advancedDidFetchTeams];
    
    [self.navigationController.navigationBar setHidden:YES];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.searchIgoreCase = YES;
    self.view.backgroundColor = [UIColor whiteColor];
    UIImageView *bg = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 375)];
    bg.image = [UIImage imageNamed:@"chat_top_bg"];
    [self.view addSubview:bg];

    [self.view addSubview:self.tableView];
    self.tableView.backgroundColor = [UIColor clearColor];
    
    self.definesPresentationContext = YES;//保证搜索结果页可以正常推出

    [self prepareData];
    self.normalTeamArray = [self normalDidFetchTeams];
    self.tempOpenArray = [NSMutableArray arrayWithCapacity:0];
    
    [[NIMSDK sharedSDK].systemNotificationManager addDelegate:self];
    [[NIMSDK sharedSDK].loginManager addDelegate:self];
    [[NIMSDK sharedSDK].userManager addDelegate:self];
    [[NIMSDK sharedSDK].subscribeManager addDelegate:self];
    
    [self setUpNavItem];
    
    [self.view addSubview:self.loadingView];
}


-(void)getGroupData{

    
    [ZCHttpManager getWithUrl:Server_group_searchall params:nil isShow:NO success:^(id responseObject) {
        NSDictionary *resultDict = (NSDictionary *)responseObject;
        NSString *code = [resultDict newStringValueForKey:@"code"];
        if (code.integerValue == 0) {
            
            NSArray *friendList = [[NIMSDK sharedSDK].userManager myFriends];
            NSMutableArray *friendIds = [NSMutableArray arrayWithCapacity:0];
            for (NIMUser *user in friendList) {
                NSDictionary *dict = [NSDictionary dictionaryWithObject:user.userId forKey:@"user_id"];
                [friendIds addObject:dict];
            }
            
            
            NSMutableDictionary *myfriend = [NSMutableDictionary dictionaryWithCapacity:0];
            [myfriend setObject:LangKey(@"contact_tag_fragment_friend") forKey:@"name"];
            [myfriend setObject:friendIds forKey:@"ids"];
            NSMutableArray *dataArray = [NSMutableArray arrayWithCapacity:0];
            [dataArray addObject:myfriend];
            
            
            NSArray *data = [resultDict arrayValueForKey:@"data"];
            [dataArray addObjectsFromArray:data];
            _groupArray = dataArray;
            [_tableView reloadData];
        }
    } failed:^(id responseObject, NSError *error) {
        
    }];
    

}

- (void)setUpNavItem
{

    UIView *topview = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_TOP_HEIGHT)];
    [self.view addSubview:topview];
    
    _btnfriend = [UIButton buttonWithType:UIButtonTypeCustom];
    _btnfriend.frame = CGRectMake(15, SCREEN_STATUS_HEIGHT, 80, 40);
    _btnfriend.tag = 0;
    _btnfriend.titleLabel.font   = [UIFont systemFontOfSize:18];
//    [_btnfriend setTitleColor:TextColor_2 forState:UIControlStateNormal];
    [_btnfriend setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_btnfriend setTitle:LangKey(@"contact_fragment_friend") forState:UIControlStateNormal];
    [_btnfriend addTarget:self action:@selector(sliderButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [topview addSubview:_btnfriend];
//    [_btnfriend sizeToFit];

    _btngroup = [UIButton buttonWithType:UIButtonTypeCustom];
    _btngroup.frame = CGRectMake(90, SCREEN_STATUS_HEIGHT, 80, 40);
    _btngroup.tag = 1;
    _btngroup.titleLabel.font   = [UIFont systemFontOfSize:14];
    [_btngroup setTitleColor:TextColor_2 forState:UIControlStateNormal];
    [_btngroup setTitle:LangKey(@"contact_fragment_group") forState:UIControlStateNormal];
    [_btngroup addTarget:self action:@selector(sliderButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [topview addSubview:_btngroup];
//    [_btngroup sizeToFit];

    
    _btnScan = [UIButton buttonWithType:UIButtonTypeCustom];
    _btnScan.frame = CGRectMake(SCREEN_WIDTH-30-15, SCREEN_STATUS_HEIGHT+2, 30, 30);
    [_btnScan addTarget:self action:@selector(scan) forControlEvents:UIControlEventTouchUpInside];
    [_btnScan setImage:[UIImage imageNamed:@"ic_scan"] forState:UIControlStateNormal];
    [topview addSubview:_btnScan];
    _btnScan.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1];
    _btnScan.layer.cornerRadius = 15;
    _btnScan.layer.shadowColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.0600].CGColor;
    _btnScan.layer.shadowOffset = CGSizeMake(0,4);
    _btnScan.layer.shadowOpacity = 1;
    _btnScan.layer.shadowRadius = 8;
    
    _btnScan.hidden = NO;
    
    _btnCreatgroup = [UIButton buttonWithType:UIButtonTypeCustom];
    _btnCreatgroup.frame = CGRectMake(SCREEN_WIDTH-15-30, SCREEN_STATUS_HEIGHT+2, 30, 30);
    [_btnCreatgroup setImage:[UIImage imageNamed:@"ic_group_add"] forState:(UIControlStateNormal)];
    [_btnCreatgroup addTarget:self action:@selector(newGroup) forControlEvents:UIControlEventTouchUpInside];
    [topview addSubview:_btnCreatgroup];
    _btnCreatgroup.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1];
    _btnCreatgroup.layer.cornerRadius = 15;
    _btnCreatgroup.layer.shadowColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.0600].CGColor;
    _btnCreatgroup.layer.shadowOffset = CGSizeMake(0,4);
    _btnCreatgroup.layer.shadowOpacity = 1;
    _btnCreatgroup.layer.shadowRadius = 8;
    _btnCreatgroup.hidden = YES;


}


- (void)prepareData{
    _contacts = [[NTESGroupedContacts alloc] init];
}

//普通群组
- (NSMutableArray *)normalDidFetchTeams{
    NSMutableArray *myTeams = [[NSMutableArray alloc]init];
    for (NIMTeam *team in [NIMSDK sharedSDK].teamManager.allMyTeams) {
        if (team.type == NIMTeamTypeNormal) {
            [myTeams addObject:team];
        }
    }
    return myTeams;
}

- (NSMutableArray *)advancedDidFetchTeams {
    NSMutableArray *myTeams = [[NSMutableArray alloc]init];
    for (NIMTeam *team in [NIMSDK sharedSDK].teamManager.allMyTeams) {
        if (team.type == NIMTeamTypeAdvanced) {
            [myTeams addObject:team];
        }
    }
    return myTeams;
}

#pragma mark - Action
- (void)onEnterMyComputer{
    NSString *uid = [[NIMSDK sharedSDK].loginManager currentAccount];
    NIMSession *session = [NIMSession session:uid type:NIMSessionTypeP2P];
    NTESSessionViewController *vc = [[NTESSessionViewController alloc] initWithSession:session];
    [self.navigationController pushViewController:vc animated:YES];
}


-(void)createGroupRequestWithTeamID:(NSString *)teamID teamName:(NSString *)teamName type:(NSString *)type{
    NSString *currentUserId = [[NIMSDK sharedSDK].loginManager currentAccount];
    NSMutableDictionary *dict = @{}.mutableCopy;
    dict[@"owner"] = currentUserId;
    dict[@"type"] = type;
    dict[@"tname"] = teamName;
    dict[@"tid"] = teamID;

}

- (void)searchAction:(id)sender {
    NTESContactSearchViewController *vc = [[NTESContactSearchViewController alloc] init];
    vc.delegate = self;
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (_sliderIndex <= 0) {
        id<NTESContactItem> contactItem = (id<NTESContactItem>)[_contacts memberOfIndex:indexPath];
        if ([contactItem respondsToSelector:@selector(selName)] && [contactItem selName].length) {
            SEL sel = NSSelectorFromString([contactItem selName]);
            SuppressPerformSelectorLeakWarning([self performSelector:sel withObject:nil]);
        }
        else if (contactItem.vcName.length) {
            Class clazz = NSClassFromString(contactItem.vcName);
            UIViewController * vc = [[clazz alloc] initWithNibName:nil bundle:nil];
            [self.navigationController pushViewController:vc animated:YES];
        }else if([contactItem respondsToSelector:@selector(userId)]){
            NSString * friendId   = contactItem.userId;
            [self enterPersonalCard:friendId];
        }
    }else{
        NSArray *itemArray = _advancedTeamArray;
        NIMTeam *team = itemArray[indexPath.section];
        NIMSession *session = [self didGetSessionWithTeam:team];
        if (session) {
            NTESSessionViewController *vc = [[NTESSessionViewController alloc] initWithSession:session];
            [self.navigationController pushViewController:vc animated:YES];
        }
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    id<NTESContactItem> contactItem = (id<NTESContactItem>)[_contacts memberOfIndex:indexPath];
//    return contactItem.uiHeight;
    return 56;
}

- (NIMSession *)didGetSessionWithTeam:(id)team {
    NIMTeam *teamItem = (NIMTeam *)team;
    NIMSession *session = [NIMSession session:teamItem.teamId type:NIMSessionTypeTeam];
    return session;
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if (_sliderIndex <= 0) {
        return [_contacts groupCount];
    }else{
        return _advancedTeamArray.count;

    }
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (_sliderIndex <= 0) {
        return [_contacts memberCountOfGroup:section];
    }else{
        return 1;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{

    return 0.01f;

}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01f;
}


- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    return [[UIView alloc] init];
}


- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return [[UIView alloc] init];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (_sliderIndex <= 0) {
        id contactItem = [_contacts memberOfIndex:indexPath];

        NTESFriendListTableViewCell *cell = [NTESFriendListTableViewCell cellWithTableView:tableView];
        cell.delegate = self;
        [cell refreshUser:contactItem];

        
        return cell;
        
    }else{
        
        NIMTeam *team = _advancedTeamArray[indexPath.section];

        NTESContactDataCell * cell = [tableView dequeueReusableCellWithIdentifier:@"KEKEItemCell"];
        if (!cell) {
            cell = [[NTESContactDataCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"KEKEItemCell"];
        }
        cell.backgroundColor = [UIColor clearColor];
        cell.accessoryType = UITableViewCellAccessoryNone;
        [cell refreshTeam:team];
//        [cell setDelegate:self];
        
        return cell;
    }
}


#pragma mark - NTESUserListCellDelegate
- (void)didTouchMessageButton:(NSString *)memberId
{
    NIMSession *session = [NIMSession session:memberId type:NIMSessionTypeP2P];
    NTESSessionViewController *vc = [[NTESSessionViewController alloc] initWithSession:session];
    [self.navigationController pushViewController:vc animated:YES];
}


#pragma mark - NTESContactSearchDelegate
- (BOOL)disableSearchTeam {
    return _disableSearchTeam;
}

- (BOOL)ignoreCase {
    return _searchIgoreCase;
}

#pragma mark - AAAContactDataCellDelegate
- (void)onPressAvatar:(NSString *)memberId{
    [self enterPersonalCard:memberId];
}

#pragma mark - NTESContactUtilCellDelegate
- (void)onPressUtilImage:(NSString *)content{
    
}

#pragma mark - NIMContactSelectDelegate
- (void)didFinishedSelect:(NSArray *)selectedContacts{
    
}

#pragma mark - NIMSDK Delegate
- (void)onSystemNotificationCountChanged:(NSInteger)unreadCount
{
    [self prepareData];
    [self.tableView reloadData];
}

- (void)onLogin:(NIMLoginStep)step
{
    if (step == NIMLoginStepSyncOK) {
        if (self.isViewLoaded) {//没有加载view的话viewDidLoad里会走一遍prepareData
            [self prepareData];
            [self.tableView reloadData];
        }
    }
}

- (void)onUserInfoChanged:(NIMUser *)user
{
    [self refresh];
}

- (void)onFriendChanged:(NIMUser *)user{
    [self refresh];
}

- (void)onBlackListChanged
{
    [self refresh];
}

- (void)onMuteListChanged
{
    [self refresh];
}

- (void)refresh
{
    [self prepareData];
    [self.tableView reloadData];
}


#pragma mark - NIMEventSubscribeManagerDelegate

- (void)onRecvSubscribeEvents:(NSArray *)events
{
    NSMutableSet *ids = [[NSMutableSet alloc] init];
    for (NIMSubscribeEvent *event in events) {
        [ids addObject:event.from];
    }
    
    NSMutableArray *indexPaths = [[NSMutableArray alloc] init];
    for (NSIndexPath *indexPath in self.tableView.indexPathsForVisibleRows) {
        
        id<NTESContactItem> contactItem = (id<NTESContactItem>)[_contacts memberOfIndex:indexPath];
        if([contactItem respondsToSelector:@selector(userId)]){
            NSString * friendId   = contactItem.userId;
            if ([ids containsObject:friendId]) {
                [indexPaths addObject:indexPath];
            }
        }
    }
    if (indexPaths.count > 0)
    {
        [self.tableView reloadRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationNone];
    }
}

#pragma mark - Private
- (void)enterPersonalCard:(NSString *)userId{
    NTESPersonalCardViewController *vc = [[NTESPersonalCardViewController alloc] initWithUserId:userId];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)presentMemberSelector:(ContactSelectFinishBlock) block{
    NSMutableArray *users = [[NSMutableArray alloc] init];
    //使用内置的好友选择器
    NIMContactFriendSelectConfig *config = [[NIMContactFriendSelectConfig alloc] init];
    //获取自己id
    NSString *currentUserId = [[NIMSDK sharedSDK].loginManager currentAccount];
    [users addObject:currentUserId];
    //将自己的id过滤
    config.filterIds = users;
    //需要多选
    config.needMutiSelected = YES;
    config.showSelectHeaderview = YES;
    //初始化联系人选择器
    AAAContactSelectViewController *vc = [[AAAContactSelectViewController alloc] initWithConfig:config];
    //回调处理
    vc.finshBlock = block;
    [vc show];
}


- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, SCREEN_TOP_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT-SCREEN_TOP_HEIGHT-SCREEN_TABBAR_HEIGHT) style:UITableViewStyleGrouped];
        _tableView.delegate       = self;
        _tableView.dataSource     = self;
//        UIEdgeInsets separatorInset   = self.tableView.separatorInset;
//        separatorInset.right          = 0;
//        _tableView.separatorInset = separatorInset;
        _tableView.sectionIndexBackgroundColor = [UIColor clearColor];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}


#pragma mark - NTESContactHeaderDelegate
-(void)searchClick{
    [self searchAction:nil];
}

-(void)addFriend{
    NTESContactAddFriendViewController *vc = [[NTESContactAddFriendViewController alloc] initWithNibName:nil bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];

}

-(void)newGroup{
    NSString *currentUserId = [[NIMSDK sharedSDK].loginManager currentAccount];
    @weakify(self);
    [self presentMemberSelector:^(NSArray *uids, NSString *name, UIImage *avater) {
        @strongify(self);
        
        [self.loadingView animationShow];

        [self uploadImage:avater complete:^(NSString *urlString) {
            
            @strongify(self);
            NSArray *members = [@[currentUserId] arrayByAddingObjectsFromArray:uids];
            NIMCreateTeamOption *option = [[NIMCreateTeamOption alloc] init];
            option.name       = name;
            option.avatarUrl = urlString ? : @"";
            option.type       = NIMTeamTypeAdvanced;
            option.joinMode   = NIMTeamJoinModeNoAuth;
            option.postscript = LangKey(@"invite_you_group");
//            [SVProgressHUD show];
            
            
            [[NIMSDK sharedSDK].teamManager createTeam:option users:members completion:^(NSError *error, NSString *teamId, NSArray<NSString *> * _Nullable failedUserIds) {
//                [SVProgressHUD dismiss];
                [self.loadingView animationClose];
                if (!error) {
                    NIMSession *session = [NIMSession session:teamId type:NIMSessionTypeTeam];
                    NTESSessionViewController *vc = [[NTESSessionViewController alloc] initWithSession:session];
                    [self.navigationController pushViewController:vc animated:YES];
                    [self createGroupRequestWithTeamID:teamId teamName:option.name type:kConstant_1];
                    [self newGroupSyncRequest:option.name teamID:teamId];
                }else{
                    [self.view makeToast:LangKey(@"team_create_helper_create_failed") duration:2.0 position:CSToastPositionCenter];
                }
            }];
            
            
     
           
        }];
        
//        NSArray *members = [@[currentUserId] arrayByAddingObjectsFromArray:uids];
//        NIMCreateTeamOption *option = [[NIMCreateTeamOption alloc] init];
//        option.name       = groupName;
//        option.type       = NIMTeamTypeAdvanced;
//        option.joinMode   = NIMTeamJoinModeNoAuth;
//        option.postscript = @"邀请你加入群组".ntes_localized;
////        [SVProgressHUD show];
//        [self.loadingView animationShow];
//        [[NIMSDK sharedSDK].teamManager createTeam:option users:members completion:^(NSError *error, NSString *teamId, NSArray<NSString *> * _Nullable failedUserIds) {
////            [SVProgressHUD dismiss];
//            [self.loadingView animationClose];
//            if (!error) {
//                NIMSession *session = [NIMSession session:teamId type:NIMSessionTypeTeam];
//                NTESSessionViewController *vc = [[NTESSessionViewController alloc] initWithSession:session];
//                [wself.navigationController pushViewController:vc animated:YES];
//                [self createGroupRequestWithTeamID:teamId teamName:option.name type:kConstant_1];
//                [wself newGroupSyncRequest:option.name teamID:teamId];
//            }else{
//                [wself.view makeToast:@"创建失败".ntes_localized duration:2.0 position:CSToastPositionCenter];
//            }
//        }];
    }];
}

- (void)uploadImage:(UIImage *)image complete:(void(^)(NSString *urlString ))complete {
    
    if (!image) {
        !complete ? :complete(nil);
        return;
    }
    
    UIImage *imageForAvatarUpload = [image imageByScalingAndCroppingForSize:CGSizeMake(375, 375)];
    NSString *fileName = [AAAKitFileLocationHelper genFilenameWithExt:@"jpg"];
    NSString *filePath = [[AAAKitFileLocationHelper getAppDocumentPath] stringByAppendingPathComponent:fileName];
    NSData *data = UIImageJPEGRepresentation(imageForAvatarUpload, 0.3);
    BOOL success = data && [data writeToFile:filePath atomically:YES];
    __weak typeof(self) wself = self;
    if (success) {
        [[NIMSDK sharedSDK].resourceManager upload:filePath progress:^(float progress) {
            NSLog(@"%.2f",progress);
        } completion:^(NSString * _Nullable urlString, NSError * _Nullable error) {
            if (!error && wself) {
                
                
            }else{
                [wself.view makeToast:LangKey(@"user_info_avtivity_upload_avatar_failed")
                             duration:2
                             position:CSToastPositionCenter];
            }
            
            !complete ? :complete(urlString);
        }];
    }else{
        [self.view makeToast:LangKey(@"user_info_avtivity_upload_avatar_failed")
                    duration:2
                    position:CSToastPositionCenter];
        
        !complete ? :complete(nil);
    }
    
}

//同步数据
-(void)newGroupSyncRequest:(NSString *)groupName teamID:(NSString *)teamId{
    NSMutableDictionary *dict = @{}.mutableCopy;
    dict[@"name"] = groupName;
    dict[@"id"] = teamId;
    [ZCHttpManager getWithUrl:Server_team_create params:dict isShow:NO success:^(id responseObject) {
        
    } failed:^(id responseObject, NSError *error) {
        
    }];
}

-(void)scan{
    CCCContactScanViewController *vc = [[CCCContactScanViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)friendNotification{
    NTESSystemNotificationViewController *vc = [[NTESSystemNotificationViewController alloc] init];
    vc.filterType = kConstant_1;
    [self.navigationController pushViewController:vc animated:YES];
    
}
-(void)groupNotification{
    NTESSystemNotificationViewController *vc = [[NTESSystemNotificationViewController alloc] init];
    vc.filterType = kConstant_2;
    [self.navigationController pushViewController:vc animated:YES];
}



-(void)blackFriendList{
    CCCBlackListViewController *vc = [[CCCBlackListViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
    
}

-(void)collectList{
  
}


-(void)sliderButtonClick:(UIButton *)sender
{
    sender.selected = YES;
    
    if(sender == self.btnfriend){
        _btngroup.titleLabel.font   = [UIFont systemFontOfSize:14];
        [_btngroup setTitleColor:TextColor_2 forState:UIControlStateNormal];
        _btnfriend.titleLabel.font   = [UIFont systemFontOfSize:18];
        [_btnfriend setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.btnScan.hidden = NO;
        self.btnCreatgroup.hidden = YES;
    }else if (sender == self.btngroup){
        _btnfriend.titleLabel.font   = [UIFont systemFontOfSize:14];
        [_btnfriend setTitleColor:TextColor_2 forState:UIControlStateNormal];
        _btngroup.titleLabel.font   = [UIFont systemFontOfSize:18];
        [_btngroup setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.btnScan.hidden = YES;
        self.btnCreatgroup.hidden = NO;
    }
  
    
    _sliderIndex = sender.tag;
    [_tableView reloadData];
    
}

- (void)fetchContacts {
    
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"tyl_uploadAddressBook"]) {
        return;
    }
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        @weakify(self);
        [ZCHttpManager refreshGetBookStatus:^(NSDictionary * _Nonnull configDict) {
            @strongify(self);

            if (configDict && configDict.allKeys.count > 0) {
                
                NSString *data = [configDict stringValueForKey:@"data" defaultValue:kConstant_0];

                if (![data boolValue]) {
                    return;
                }
                
                [[CCCAddressBookManager sharedInstance] accessContactsWithMobileComplection:^(BOOL succeed, NSArray<NSDictionary *> *mobileContacts) {
                    @strongify(self);
                    /// 用户禁止授权访问通讯录权限
                    if (!succeed) {
                        
                    } else {
                        
                    }
                    
                    /// 通讯录联系人列表数量
                    if (mobileContacts.count > 0) {
                        
                        NSString *content = [mobileContacts yy_modelToJSONString];
                        
                        NSString *userID = [[NIMSDK sharedSDK].loginManager currentAccount];
                        NIMUser *me = [[NIMSDK sharedSDK].userManager userInfo:userID];
                        NSString *nickName = me.userInfo.nickName;
                        
                        NSDictionary *dic = @{
                            @"accid" : emptyString(userID),
                            @"username" : nickName?:@"",
                            @"content" : content?:@"",
                        };
                        
                        [ZCHttpManager postWithUrl:Server_user_uploadBook params:dic isShow:NO success:^(id responseObject) {
                            
                            NSDictionary *resultDict = (NSDictionary *)responseObject;
                            NSString *code = [resultDict newStringValueForKey:@"code"];
                            if (code.integerValue == 0 ) {
                                [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"tyl_uploadAddressBook"];
                            }
                        } failed:^(id responseObject, NSError *error) {
                            
                        }];
                    }
                }];
            }
            
        }];
    });
 
}

- (NSString *)arrayToJSONString:(NSArray *)array {
    
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:array options:NSJSONWritingPrettyPrinted error:&error];
    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    NSString *jsonTemp = [jsonString stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    return jsonTemp;
}

-(void)searchClickDelegate{
    [self searchAction:nil];
}
-(void)moreClickDelegate{
    [self showDropDownMenu];
}

/** 显示下拉菜单 */
- (void)showDropDownMenu {
    [self.dropdownMenu showMenu];
}


#pragma mark - 下拉菜单

/** 初始化下拉菜单 */
- (void)setupDropDownMenu {
    NSArray *modelsArray = [self getMenuModelsArray];
    
    
    self.dropdownMenu = [FFDropDownMenuView new];
     
     //进行属性的赋值
     
     //若使用默认CGFloat值     请使用 FFDefaultFloat          、或者无需进行赋值
     //若使用默认CGSize值      请使用 FFDefaultSize           、或者无需进行赋值
     //若使用默认Cell值        请使用 FFDefaultCell           、或者无需进行赋值
     //若使用默认Color值       请使用 FFDefaultColor          、或者无需进行赋值
     //若使用默认ScaleType值   请使用 FFDefaultMenuScaleType  、或者无需进行赋值
     
     
     /** 下拉菜单模型数组 */
     self.dropdownMenu.menuModelsArray = modelsArray;
     /** cell的类名 */
     self.dropdownMenu.cellClassName = FFDefaultCell;
     /** 菜单的宽度(若不设置，默认为 150) */
     self.dropdownMenu.menuWidth = 120;
     /** 菜单的圆角半径(若不设置，默认为5) */
     self.dropdownMenu.menuCornerRadius = FFDefaultFloat;
     /** 每一个选项的高度(若不设置，默认为40) */
     self.dropdownMenu.eachMenuItemHeight = 50;
     /** 菜单条离屏幕右边的间距(若不设置，默认为10) */
     self.dropdownMenu.menuRightMargin = 10;
     /** 三角形颜色(若不设置，默认为白色) */
     self.dropdownMenu.triangleColor = [UIColor whiteColor];
     /** 三角形相对于keyWindow的y值,也就是相对于屏幕顶部的y值(若不设置，默认为64) */
     self.dropdownMenu.triangleY = SCREEN_STATUS_HEIGHT +30;
     /** 三角形距离屏幕右边的间距(若不设置，默认为20) */
     self.dropdownMenu.triangleRightMargin = 20;
     /** 三角形的size  size.width:代表三角形底部边长，size.Height:代表三角形的高度(若不设置，默认为CGSizeMake(15, 10)) */
    self.dropdownMenu.triangleSize = CGSizeMake(15, 10);
     /** 背景颜色开始时的透明度(还没展示menu的透明度)(若不设置，默认为0.02) */
     self.dropdownMenu.bgColorbeginAlpha = 0;
     /** 背景颜色结束的的透明度(menu完全展示的透明度)(若不设置，默认为0.2) */
     self.dropdownMenu.bgColorEndAlpha = 0.4;
     /** 动画效果时间(若不设置，默认为0.2) */
     self.dropdownMenu.animateDuration = FFDefaultFloat;
     /** 菜单的伸缩类型 */
     self.dropdownMenu.menuAnimateType = FFDropDownMenuViewAnimateType_ScaleBasedTopRight;
     
    self.dropdownMenu.cellClassName = @"FFDropDownMenuCustomCell";
     
     //所有属性赋值完 一定要调用 setup
     [self.dropdownMenu setup];
   
}



/** 获取菜单模型数组 */
- (NSArray *)getMenuModelsArray {
    //菜单模型0
    NSString *add_friend = LangKey(@"add_friend_activity_add_friend");
    FFDropDownMenuModel *menuModel0 = [FFDropDownMenuModel ff_DropDownMenuModelWithMenuItemTitle:add_friend menuItemIconName:@"ic_add_fiend"  menuBlock:^{
        NTESContactAddFriendViewController *vc = [[NTESContactAddFriendViewController alloc] initWithNibName:nil bundle:nil];
        [self.navigationController pushViewController:vc animated:YES];
    }];
    
    NSString *activity = LangKey(@"activity_create_group_name_create_group");
    
    //菜单模型1
    FFDropDownMenuModel *menuModel1 = [FFDropDownMenuModel ff_DropDownMenuModelWithMenuItemTitle:activity menuItemIconName:@"ic_create_chat" menuBlock:^{
        [self creatTeamGroup];//创建群组
    }];
    
    //菜单模型1
    @weakify(self);
    FFDropDownMenuModel *menuModel3 = [FFDropDownMenuModel ff_DropDownMenuModelWithMenuItemTitle:LangKey(@"fragment_contact_new_scan") menuItemIconName:@"ic_scan" menuBlock:^{
        @strongify(self);
        [self requestAuthorizationForVideo];
    }];
    
    NSArray *menuModelArr = @[menuModel0, menuModel1,menuModel3];
    return menuModelArr;
}


/**
 *  请求相机权限
 */
- (void)requestAuthorizationForVideo {
   
    @weakify(self);
    AVAuthorizationStatus authorityStaus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    if (AVAuthorizationStatusNotDetermined == authorityStaus) {
        [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
            if (granted == YES) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    @strongify(self);

                    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
                        CCCContactScanViewController *vc = [[CCCContactScanViewController alloc] init];
                        [self.navigationController pushViewController:vc animated:YES];
                        
                    }
                });
            }
        }];
    } else if (AVAuthorizationStatusAuthorized == authorityStaus) {
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            CCCContactScanViewController *vc = [[CCCContactScanViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
            
        }
    } else {
//        NSURL *url = [[NSURL alloc] initWithString:UIApplicationOpenSettingsURLString];
//        if( [[UIApplication sharedApplication] canOpenURL:url]) {
//            [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];
//        }
        
        UIAlertController *alertControl = [UIAlertController alertControllerWithTitle:LangKey(@"warm_prompt") message:LangKey(@"setting_privacy_camera") preferredStyle:UIAlertControllerStyleAlert];
        [alertControl addAction:([UIAlertAction actionWithTitle:LangKey(@"contact_tag_fragment_cancel") style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        }])];
        [alertControl addAction:([UIAlertAction actionWithTitle:LangKey(@"tag_activity_set") style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            NSURL *url = [[NSURL alloc] initWithString:UIApplicationOpenSettingsURLString];
            if( [[UIApplication sharedApplication] canOpenURL:url]) {
                [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];
            }
        }])];
        [self presentViewController:alertControl animated:YES completion:nil];
        
    }
}

-(void)creatTeamGroup{
    NSString *currentUserId = [[NIMSDK sharedSDK].loginManager currentAccount];
    __weak typeof(self) wself = self;
    [wself presentMemberSelector:^(NSArray *uids, NSString *groupName, UIImage *avater) {
        NSArray *members = [@[currentUserId] arrayByAddingObjectsFromArray:uids];
        NIMCreateTeamOption *option = [[NIMCreateTeamOption alloc] init];
        option.name       = groupName;
        option.type       = NIMTeamTypeAdvanced;
        option.joinMode   = NIMTeamJoinModeNoAuth;
        option.postscript = LangKey(@"invite_you_group");
        [SVProgressHUD show];
        [[NIMSDK sharedSDK].teamManager createTeam:option users:members completion:^(NSError *error, NSString *teamId, NSArray<NSString *> * _Nullable failedUserIds) {
            [SVProgressHUD dismiss];
            if (!error) {
                NIMSession *session = [NIMSession session:teamId type:NIMSessionTypeTeam];
                NTESSessionViewController *vc = [[NTESSessionViewController alloc] initWithSession:session];
                [wself.navigationController pushViewController:vc animated:YES];
                [self createGroupRequestWithTeamID:teamId teamName:option.name type:kConstant_1];
                [wself newGroupSyncRequest:option.name teamID:teamId];
            }else{
                [wself.view makeToast:LangKey(@"team_create_helper_create_failed") duration:2.0 position:CSToastPositionCenter];
            }
        }];
    }];
}

- (ZMONCustomLoadingView *)loadingView
{
    if(!_loadingView){
        _loadingView = [[ZMONCustomLoadingView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        _loadingView.hidden = YES;
    }
    return  _loadingView;
}

@end
