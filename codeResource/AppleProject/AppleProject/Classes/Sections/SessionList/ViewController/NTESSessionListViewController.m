//
//  NTESSessionListViewController.m
//  NIMDemo
//
//  Created by chris on 15/2/2.
//  Copyright (c) 2015年 Netease. All rights reserved.
//

#import "NTESSessionListViewController.h"
#import "NTESSessionViewController.h"

#import "UIView+NTES.h"
#import "NTESBundleSetting.h"
#import "NTESListHeader.h"

#import "NTESSessionUtil.h"
#import "NTESPersonalCardViewController.h"
#import "NTESMessageUtil.h"


#import "NSString+NTES.h"
#import <SVProgressHUD/SVProgressHUD.h>
#import <Toast/UIView+Toast.h>
#import <FFDropDownMenu/FFDropDownMenu.h>
#import <FFDropDownMenu/FFDropDownMenuView.h>
#import "NTESContactAddFriendViewController.h"
#import "CCCContactScanViewController.h"
#import "AAAContactSelectViewController.h"
#import "NTESSystemSignNotificationSheet.h"
#import "ZCHttpInterfacedConst.h"
#import <YYText.h>
#import "SNTextHighlight.h"
#import "AAAInputEmoticonParser.h"
#import "AAAInputEmoticonManager.h"
#import "UIImage+AppleProjectKit.h"
#import "NSString+AppleProjectKit.h"
#import <objc/runtime.h>
#import "BBBKitInfoFetchOption.h"
#import "NTESSystemNotificationViewController.h"
#import "NTESNotificationView.h"
#import "UIButton+Badge.h"
#import "CCCContactsViewController.h"
#import "NTESMainTabController.h"
#import "AAAKitFileLocationHelper.h"
#import "ZMONPrivacyPolicyView.h"

@interface NTESSessionListViewController ()<NIMLoginManagerDelegate,NTESListHeaderDelegate,NIMEventSubscribeManagerDelegate,UIViewControllerPreviewingDelegate,NIMChatExtendManagerDelegate, NIMConversationManagerDelegate,NTESSystemSignNotificationDelegate,NIMSystemNotificationManagerDelegate>

@property (nonatomic,strong) NTESListHeader *header;

@property (nonatomic,assign) BOOL supportsForceTouch;

@property (nonatomic,strong) NSMutableDictionary *previews;

@property (nonatomic,strong) NSMutableDictionary<NIMSession *,NIMStickTopSessionInfo *> *stickTopInfos;

@property (nonatomic, strong) FFDropDownMenuView *dropdownMenu;/** 下拉菜单 */

@property (nonatomic, strong) NSString *creatTeam;

@property (nonatomic, strong) NTESNotificationView *noticeView;

@property (nonatomic, strong) UIButton *mesBtn;
@property (nonatomic, strong) UIButton *resqBtn;

@property (nonatomic, strong) UIView *reqView;
@property (nonatomic, strong) ZMONCustomLoadingView *loadingView;

@property (nonatomic, strong) ZMONPrivacyPolicyView *policyView;


@end

@implementation NTESSessionListViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _previews = [[NSMutableDictionary alloc] init];
        self.stickTopInfos = NSMutableDictionary.dictionary;
        self.autoRemoveRemoteSession = [[NTESBundleSetting sharedConfig] autoRemoveRemoteSession];
    }
    return self;
}

- (void)dealloc{
    [[NIMSDK sharedSDK].loginManager removeDelegate:self];
    [[NIMSDK sharedSDK].chatExtendManager removeDelegate:self];
    [[NIMSDK sharedSDK].conversationManager removeDelegate:self];
    [[NIMSDK sharedSDK].systemNotificationManager removeDelegate:self];
}

#pragma mark - NIMSystemNotificationManagerDelegate
- (void)onSystemNotificationCountChanged:(NSInteger)unreadCount
{
    _resqBtn.badgeValue = [NSString stringWithFormat:@"%ld",(long)unreadCount];
    CGFloat width = SCREEN_WIDTH/4;
    _resqBtn.badgeOriginX = width/2+20;
    _resqBtn.badgeOriginY = -5;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    
    self.supportsForceTouch = [self.traitCollection respondsToSelector:@selector(forceTouchCapability)] && self.traitCollection.forceTouchCapability == UIForceTouchCapabilityAvailable;
    
    [[NIMSDK sharedSDK].loginManager addDelegate:self];
    [[NIMSDK sharedSDK].subscribeManager addDelegate:self];
    [[NIMSDK sharedSDK].chatExtendManager addDelegate:self];
    [[NIMSDK sharedSDK].conversationManager addDelegate:self];
    [[NIMSDK sharedSDK].systemNotificationManager addDelegate:self];
    
    self.header = [[NTESListHeader alloc] initWithFrame:CGRectMake(0, 0, self.view.width, 0)];
    self.header.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    self.header.delegate = self;
    [self.view addSubview:self.header];
    
    self.emptyImageView = [[UIImageView alloc] init];
    self.emptyImageView.hidden = YES;
    self.emptyImageView.image = [UIImage imageNamed:@"icon_session_list_empty"];
    [self.view addSubview:self.emptyImageView];
    [self.emptyImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_offset(0);
        make.centerY.mas_offset(0).mas_offset(-50);
        make.width.mas_equalTo(177);
        make.height.mas_offset(177);
    }];
    
    self.emptyTipLabel = [[UILabel alloc] init];
    self.emptyTipLabel.hidden = YES;
    self.emptyTipLabel.text = LangKey(@"no_conversation");//@"还没有会话，在通讯录中找个人聊聊吧".ntes_localized;
    self.emptyTipLabel.numberOfLines = 0;
    self.emptyTipLabel.font = [UIFont systemFontOfSize:12];
    self.emptyTipLabel.textColor = RGB_COLOR_String(@"#999999");
    self.emptyTipLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.emptyTipLabel];
    [self.emptyTipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.emptyImageView);
        make.top.mas_equalTo(self.emptyImageView.mas_bottom).mas_offset(15);
        make.height.mas_equalTo(60);
        make.width.mas_equalTo(SCREEN_WIDTH-40);
    }];
    
    self.definesPresentationContext = YES;
    [self setUpNavItem];
    
    /** 初始化下拉菜单 */
    [self setupDropDownMenu];
    
    self.tableView.frame = CGRectMake(0, SCREEN_STATUS_HEIGHT+140, SCREEN_WIDTH, SCREEN_SAFE_HEIGHT-140);
    [self.view addSubview:self.noticeView];
    [self.view addSubview:self.loadingView];
    
    if(![[NIMUserDefaults standardUserDefaults].yspop isEqualToString:@"1"]){
        UIWindow *window =  [[[UIApplication sharedApplication] windows] objectAtIndex:0];
        [window addSubview:self.policyView];
    }
    

    [ZCHttpManager refreshGlobalConfig:^(NSDictionary * _Nonnull configDict) {
        if (configDict.allKeys.count > 0) {
            NSString *globalsign = [configDict newStringValueForKey:@"globalsign"];
            if (globalsign.integerValue > 0) {
                NTESSystemSignNotificationSheet *sheet = [[NTESSystemSignNotificationSheet alloc] initWithFrame:self.view.bounds dictionary:@{}];
                sheet.delegate = self;
                [sheet show];
            }
        }
    }];
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        id<NIMApnsManager> apnsManager = [[NIMSDK sharedSDK] apnsManager];
        NIMPushNotificationSetting *setting = [apnsManager currentSetting];
        setting.type = NIMPushNotificationDisplayTypeNoDetail;
        
        [[NIMSDK sharedSDK].apnsManager updateApnsSetting:setting completion:^(NSError * _Nullable error) {
            if (error)
            {
                
            }
        }];
    });
    
}

- (void)addfriends {
    NTESContactAddFriendViewController *vc = [[NTESContactAddFriendViewController alloc] initWithNibName:nil bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)leftAction {
    [self requestAuthorizationForVideo];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self loadStickTopSessions];
    [self.navigationController.navigationBar setHidden:YES];
    [self checkCreateTeam];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar setHidden:NO];
}

-(void)checkCreateTeam{
    __weak typeof(self) weakself = self;
    [ZCHttpManager getWithUrl:Server_check_createteam params:nil isShow:NO success:^(id responseObject) {
        NSDictionary *resultDict = (NSDictionary *)responseObject;
        NSString *code = [resultDict newStringValueForKey:@"code"];
        weakself.creatTeam = code;
    } failed:^(id responseObject, NSError *error) {
        
    }];
}

-(void)reloadUnreadCount{
    NSInteger unreadCount = [[NIMSDK sharedSDK].conversationManager allUnreadCount:YES];
    
    UINavigationController *nav = self.navigationController.viewControllers[0];
    nav.tabBarItem.badgeValue = unreadCount ? @(unreadCount).stringValue : nil;
}

- (void)setUpNavItem{
    
    UIView *topview = [[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_STATUS_HEIGHT, SCREEN_WIDTH, 130)];
    [self.view addSubview:topview];
    
    UILabel *labtitle = [[UILabel alloc]initWithFrame:CGRectMake(15, 5, 200, 50)];
    labtitle.textColor = [UIColor blackColor];
    labtitle.font = [UIFont boldSystemFontOfSize:18];
    labtitle.text = LangKey(@"activity_user_profile_chat");
    [topview addSubview:labtitle];
    
    UIButton *moreBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    moreBtn.frame = CGRectMake(SCREEN_WIDTH-30-15, 10, 30, 30);
    [moreBtn addTarget:self action:@selector(requestAuthorizationForVideo) forControlEvents:UIControlEventTouchUpInside];
    [moreBtn setImage:[UIImage imageNamed:@"ic_scan"] forState:UIControlStateNormal];
    moreBtn.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1];
    moreBtn.layer.cornerRadius = 15;
    moreBtn.layer.shadowColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.0600].CGColor;
    moreBtn.layer.shadowOffset = CGSizeMake(0,4);
    moreBtn.layer.shadowOpacity = 1;
    moreBtn.layer.shadowRadius = 8;
    [topview addSubview:moreBtn];
    
    CGFloat width = SCREEN_WIDTH/3;
    UIView *box1 = [[UIView alloc]initWithFrame:CGRectMake(0, 70, width, 60)];
    [topview addSubview:box1];
    box1.userInteractionEnabled = YES;
    UITapGestureRecognizer *singleTap1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handlerAddfriend)];
    [box1 addGestureRecognizer:singleTap1];
    UIImageView *image1 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"top_add_friend"]];
    image1.frame = CGRectMake((width-44)/2, 0, 44, 44);
    [box1 addSubview:image1];
    UILabel *label12 = [[UILabel alloc] initWithFrame:CGRectMake(0, image1.bottom+5, width, 15)];
    label12.font = [UIFont systemFontOfSize:13.f];
    label12.textAlignment = NSTextAlignmentCenter;
    label12.textColor = [UIColor blackColor];
    label12.text = LangKey(@"add_friend_activity_add_friend");
    [box1 addSubview:label12];
    
    UIView *box2 = [[UIView alloc]initWithFrame:CGRectMake(width, 70, width, 60)];
    [topview addSubview:box2];
    box2.userInteractionEnabled = YES;
    UITapGestureRecognizer *singleTap2 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handlerAddgroup)];
    [box2 addGestureRecognizer:singleTap2];
    
    UIImageView *image2 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"top_add_group"]];
    image2.frame = CGRectMake((width-44)/2, 0, 44, 44);
    [box2 addSubview:image2];
    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(0, image2.bottom+5, width, 15)];
    label2.font = [UIFont systemFontOfSize:13.f];
    label2.textAlignment = NSTextAlignmentCenter;
    label2.textColor = [UIColor blackColor];
    label2.text = LangKey(@"activity_create_group_name_create_group");
    [box2 addSubview:label2];
    
    UIView *box4 = [[UIView alloc]initWithFrame:CGRectMake(width*2, 70, width, 60)];
    [topview addSubview:box4];

    _resqBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _resqBtn.frame = CGRectMake(0, 0, width, 60);
//    _resqBtn.layer.cornerRadius = 30;
    _resqBtn.titleLabel.font   = [UIFont systemFontOfSize:13];
    [_resqBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_resqBtn setImage:[UIImage imageNamed:@"top_notice"] forState:UIControlStateNormal];
    [_resqBtn setTitle:LangKey(@"notification") forState:UIControlStateNormal];
    [_resqBtn addTarget:self action:@selector(handlerNotice) forControlEvents:UIControlEventTouchUpInside];
    [_resqBtn layoutButtonWithEdgeInsetsStyle:(MKButtonEdgeInsetsStyleTop) imageTitleSpace:10];
     [box4 addSubview:_resqBtn];
    
    NSInteger systemUnreadCount = [NIMSDK sharedSDK].systemNotificationManager.allUnreadCount;
    _resqBtn.badgeValue = [NSString stringWithFormat:@"%ld",(long)systemUnreadCount];
    _resqBtn.badgeOriginX = width/2+20;
    _resqBtn.badgeOriginY = -5;
    
}

- (void)handlerMessage {
    [_mesBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _mesBtn.backgroundColor = RGB_COLOR_String(kCommonBGColor_begin);
    [_resqBtn setTitleColor:TextColor_2 forState:UIControlStateNormal];
    _resqBtn.backgroundColor = [UIColor clearColor];
    self.noticeView.hidden = YES;
    self.tableView.hidden = NO;
}
- (void)handlerRequests {
    [_resqBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _resqBtn.backgroundColor = RGB_COLOR_String(kCommonBGColor_begin);
    [_mesBtn setTitleColor:TextColor_2 forState:UIControlStateNormal];
    _mesBtn.backgroundColor = [UIColor clearColor];
    self.noticeView.hidden = NO;
    self.tableView.hidden = YES;
}
- (void)handlerAddfriend {
    NTESContactAddFriendViewController *vc = [[NTESContactAddFriendViewController alloc] initWithNibName:nil bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
}
- (void)handlerAddgroup {
    [self creatTeamGroup];
}

- (void)handlerNotice {
    NTESSystemNotificationViewController *vc = [[NTESSystemNotificationViewController alloc] initWithNibName:nil bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
}


- (void)refresh{
    [super refresh];
    self.emptyTipLabel.hidden = self.recentSessions.count;
    self.emptyImageView.hidden = self.recentSessions.count;
    self.addBtn.hidden = self.recentSessions.count;

}

- (void)onSelectedRecent:(NIMRecentSession *)recent atIndexPath:(NSIndexPath *)indexPath{
    NTESSessionViewController *vc = [[NTESSessionViewController alloc] initWithSession:recent.session];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)onSelectedAvatar:(NIMRecentSession *)recent
             atIndexPath:(NSIndexPath *)indexPath{
    if (recent.session.sessionType == NIMSessionTypeP2P) {
        UIViewController *vc;
        vc = [[NTESPersonalCardViewController alloc] initWithUserId:recent.session.sessionId];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

- (void)onDeleteRecentAtIndexPath:(NIMRecentSession *)recent atIndexPath:(NSIndexPath *)indexPath
{
    id<NIMConversationManager> manager = [[NIMSDK sharedSDK] conversationManager];
    NIMDeleteRecentSessionOption *option = [[NIMDeleteRecentSessionOption alloc] init];
    option.isDeleteRoamMessage = self.autoRemoveRemoteSession;
    [manager deleteRecentSession:recent option:option completion:^(NSError * _Nullable error) {
        NSLog(@"deleteRecentSessionError:%@",error);
        if (!error) {
            //清理本地数据
            [self.recentSessions removeObject:recent];
            self.recentSessions = [self customSortRecents:self.recentSessions];
            [self refresh];
        }
    }];
    
//    [manager deleteRecentSession:recent];
    
}

- (void)onTopRecentAtIndexPath:(NIMRecentSession *)recent
                   atIndexPath:(NSIndexPath *)indexPath
                         isTop:(BOOL)isTop
{
    if (isTop)
    {
        __weak typeof(self) wself = self;
        [NIMSDK.sharedSDK.chatExtendManager removeStickTopSession:self.stickTopInfos[recent.session] completion:^(NSError * _Nullable error, NIMStickTopSessionInfo * _Nullable removedInfo) {
            __weak typeof(self) sself = wself;
            if (!sself) return;
            if (error) {
                [SVProgressHUD showErrorWithStatus:error.localizedDescription];
                return;
            }
            self.stickTopInfos[recent.session] = nil;
            [self refresh];
        }];
    } else {
        __weak typeof(self) wself = self;
        NIMAddStickTopSessionParams *params = [[NIMAddStickTopSessionParams alloc] initWithSession:recent.session];
        [NIMSDK.sharedSDK.chatExtendManager addStickTopSession:params completion:^(NSError * _Nullable error, NIMStickTopSessionInfo * _Nullable newInfo) {
            __weak typeof(self) sself = wself;
            if (!sself) return;
            if (error) {
                [SVProgressHUD showErrorWithStatus:error.localizedDescription];
                return;
            }
            self.stickTopInfos[newInfo.session] = newInfo;
            [self refresh];
        }];
    }
}

- (void)onDisnodistrubRecentAtIndexPath:(NIMRecentSession *)recent isDis:(BOOL)isDis
{
    CCCKitInfo *info = nil;
    if (recent.session.sessionType == NIMSessionTypeTeam) {
        info = [[AppleProjectKit sharedKit] infoByTeam:recent.session.sessionId option:nil];
        NIMTeamNotifyState notifyState = [[[NIMSDK sharedSDK] teamManager] notifyStateForNewMsg:info.infoId];
        notifyState = notifyState == NIMTeamNotifyStateAll ? NIMTeamNotifyStateNone: NIMTeamNotifyStateAll;
        
        [[[NIMSDK sharedSDK] teamManager] updateNotifyState:notifyState inTeam:info.infoId completion:^(NSError * _Nullable error) {
            [self refresh];
        }];
    } else if (recent.session.sessionType == NIMSessionTypeP2P) {
        BBBKitInfoFetchOption *option = [[BBBKitInfoFetchOption alloc] init];
        option.session = recent.session;
        info = [[AppleProjectKit sharedKit] infoByUser:recent.session.sessionId option:option];
//        isDisnodistrub = [[NIMSDK sharedSDK].userManager notifyForNewMsg:info.infoId];//判断消息是否勿扰
        
        [[NIMSDK sharedSDK].userManager updateNotifyState:!isDis forUser:info.infoId completion:^(NSError *error) {
            [self refresh];
        }];
    }
//
//    if(!isDis){
//        [self reloadUnreadCount];
//    }
    
    
}

///置顶会话的cell
- (BOOL)isTopWithNIMRecentSession:(NIMRecentSession *)recentSession; {
    BOOL isTop = self.stickTopInfos[recentSession.session] != nil;
    return isTop;
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    [self refreshSubview];
}


- (NSString *)nameForRecentSession:(NIMRecentSession *)recent{
    if ([recent.session.sessionId isEqualToString:[[NIMSDK sharedSDK].loginManager currentAccount]]) {
        return @"我的电脑".ntes_localized;
    }
    return [super nameForRecentSession:recent];
}

- (NSMutableArray *)customSortRecents:(NSMutableArray *)recentSessions
{
    [NIMSDK.sharedSDK.chatExtendManager sortRecentSessions:recentSessions withStickTopInfos:self.stickTopInfos];
    return recentSessions;
}


#pragma mark - NIMLoginManagerDelegate
- (void)onLogin:(NIMLoginStep)step {
    
    ((CCCAppDelegate*)([UIApplication sharedApplication].delegate)).loginStep = step;
    
    [super onLogin:step];
    switch (step) {
        case NIMLoginStepLinkFailed:
            self.navigationItem.title = @"(未连接)".ntes_localized;
            break;
        case NIMLoginStepLinking:
            self.navigationItem.title = @"(连接中)".ntes_localized;
            break;
        case NIMLoginStepLinkOK:
        case NIMLoginStepSyncOK:
            self.navigationItem.title = @"";
            break;
        case NIMLoginStepSyncing:
            self.navigationItem.title = @"(同步数据)".ntes_localized;
            break;
        default:
            break;
    }
    [self.header refreshWithType:ListHeaderTypeNetStauts value:@(step)];
    [self refreshSubview];
}

- (void)onMultiLoginClientsChanged
{
//    [self.header refreshWithType:ListHeaderTypeLoginClients value:[NIMSDK sharedSDK].loginManager.currentLoginClients];
//    [self refreshSubview];
}

- (void)onTeamUsersSyncFinished:(BOOL)success
{
}


#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.supportsForceTouch) {
        id<UIViewControllerPreviewing> preview = [self registerForPreviewingWithDelegate:self sourceView:cell];
        [self.previews setObject:preview forKey:@(indexPath.row)];
    }
}

- (void)tableView:(UITableView *)tableView didEndDisplayingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.supportsForceTouch) {
        id<UIViewControllerPreviewing> preview = [self.previews objectForKey:@(indexPath.row)];
        [self unregisterForPreviewingWithContext:preview];
        [self.previews removeObjectForKey:@(indexPath.row)];
    }
}


- (UIViewController *)previewingContext:(id<UIViewControllerPreviewing>)context viewControllerForLocation:(CGPoint)point {
    UITableViewCell *touchCell = (UITableViewCell *)context.sourceView;
  
    return nil;
}

- (void)previewingContext:(id <UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit
{
    UITableViewCell *touchCell = (UITableViewCell *)previewingContext.sourceView;
    if ([touchCell isKindOfClass:[UITableViewCell class]]) {
        NSIndexPath *indexPath = [self.tableView indexPathForCell:touchCell];
        NIMRecentSession *recent = self.recentSessions[indexPath.row];
        NTESSessionViewController *vc = [[NTESSessionViewController alloc] initWithSession:recent.session];
        [self.navigationController showViewController:vc sender:nil];
    }
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 偶现侧滑数组越界，但并没有发现并发问题，暂且防护
    return indexPath.row < self.recentSessions.count;
}

- (UISwipeActionsConfiguration *)tableView:(UITableView *)tableView trailingSwipeActionsConfigurationForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    @weakify(self);
    UIContextualAction *deleteAction1 = [UIContextualAction contextualActionWithStyle:UIContextualActionStyleNormal title:nil handler:^(UIContextualAction * _Nonnull action, __kindof UIView * _Nonnull sourceView, void (^ _Nonnull completionHandler)(BOOL)) {
        
        @strongify(self);
        [tableView setEditing:NO animated:YES];  // 这句很重要，退出编辑模式，隐藏左滑菜单

        NIMRecentSession *recentSession = self.recentSessions[indexPath.row];
        [self onDeleteRecentAtIndexPath:recentSession atIndexPath:indexPath];
        [tableView setEditing:NO animated:YES];
        
        // 删除置顶
        NIMStickTopSessionInfo *stickTopInfo = [NIMSDK.sharedSDK.chatExtendManager stickTopInfoForSession:recentSession.session];
        if (stickTopInfo) {
            [NIMSDK.sharedSDK.chatExtendManager removeStickTopSession:stickTopInfo completion:^(NSError * _Nullable error, NIMStickTopSessionInfo * _Nullable removedInfo) {
                @strongify(self);

                if (!self) return;
                if (!error) {
                    self.stickTopInfos[recentSession.session] = nil;
                }
            }];
        }
    }];
    
    NIMRecentSession *recentSession = self.recentSessions[indexPath.row];
    BOOL isTop = self.stickTopInfos[recentSession.session] != nil;
    UIContextualAction *deleteAction2 = [UIContextualAction contextualActionWithStyle:UIContextualActionStyleNormal title:nil handler:^(UIContextualAction * _Nonnull action, __kindof UIView * _Nonnull sourceView, void (^ _Nonnull completionHandler)(BOOL)) {
        @strongify(self);
        [tableView setEditing:NO animated:YES];
        [self onTopRecentAtIndexPath:recentSession atIndexPath:indexPath isTop:isTop];
    }];
    
    BOOL isDisnodistrub = NO;
    CCCKitInfo *info = nil;
    if (recentSession.session.sessionType == NIMSessionTypeTeam) {
        info = [[AppleProjectKit sharedKit] infoByTeam:recentSession.session.sessionId option:nil];
        NIMTeamNotifyState notifyState = [[[NIMSDK sharedSDK] teamManager] notifyStateForNewMsg:info.infoId];
        isDisnodistrub =  notifyState == NIMTeamNotifyStateAll ? YES: NO ;
        
    } else if (recentSession.session.sessionType == NIMSessionTypeP2P) {
        BBBKitInfoFetchOption *option = [[BBBKitInfoFetchOption alloc] init];
        option.session = recentSession.session;
        info = [[AppleProjectKit sharedKit] infoByUser:recentSession.session.sessionId option:option];
        isDisnodistrub = [[NIMSDK sharedSDK].userManager notifyForNewMsg:info.infoId];//判断消息是否勿扰
    }
    UIContextualAction *deleteAction3 = [UIContextualAction contextualActionWithStyle:UIContextualActionStyleNormal title:nil handler:^(UIContextualAction * _Nonnull action, __kindof UIView * _Nonnull sourceView, void (^ _Nonnull completionHandler)(BOOL)) {
        @strongify(self);
        [tableView setEditing:NO animated:YES];
        [self onDisnodistrubRecentAtIndexPath:recentSession isDis:isDisnodistrub];
    }];
    
//    //只能设置背景颜色，图片，文字
    deleteAction1.backgroundColor = [UIColor whiteColor];
    deleteAction1.image = [UIImage imageNamed:@"ic_delete"];
//
    deleteAction2.backgroundColor = [UIColor whiteColor];
    if(isTop){
        deleteAction2.image = [UIImage imageNamed:@"ic_topno"];
    }else{
        deleteAction2.image = [UIImage imageNamed:@"ic_top"];
    }

    
    deleteAction3.backgroundColor = [UIColor whiteColor];
    if(isDisnodistrub){
        deleteAction3.image = [UIImage imageNamed:@"ic_nodistrub"];
    }else{
        deleteAction3.image = [UIImage imageNamed:@"ic_distrub"];
    }
//    // 创建包含图片和文字的自定义视图
//    UIView *customView1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 70, 74)];
//    customView1.backgroundColor = [UIColor redColor];
//    // 图片
//    UIImageView *imageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(23, 20, 14, 14)];
//    imageView1.centerX = customView1.centerX;
//    imageView1.image = [UIImage imageNamed:@"ic_delete"];
//    [customView1 addSubview:imageView1];
//    // 文字
//    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 42, 70, 15)];
//    label1.text = @"删除".nim_localized;
//    label1.textColor = [UIColor whiteColor];
//    label1.textAlignment = NSTextAlignmentCenter;
//    label1.font = [UIFont systemFontOfSize:12.0];
//    label1.centerX = customView1.centerX;
//    [customView1 addSubview:label1];
//    // 将自定义视图添加到背景色中
////    [deleteAction1 setBackgroundColor:[UIColor clearColor]];
//    deleteAction1.backgroundColor = [UIColor colorWithPatternImage:[self imageWithView:customView1]];
//    // 创建包含图片和文字的自定义视图
//    UIView *customView2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 70, 74)];
//    customView2.backgroundColor = kCommonColor;
//    // 图片
//    UIImageView *imageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(23, 20, 14, 14)];
//    imageView2.centerX = customView2.centerX;
//    imageView2.image = [UIImage imageNamed:@"ic_top"];
//    [customView2 addSubview:imageView2];
//    // 文字
//    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(0, 42, 70, 15)];
//    label2.text = isTop?@"取消置顶".nim_localized:@"置顶".nim_localized;
//    label2.textColor = [UIColor whiteColor];
//    label2.textAlignment = NSTextAlignmentCenter;
//    label2.font = [UIFont systemFontOfSize:12.0];
//    label2.centerX = customView2.centerX;
//    [customView2 addSubview:label2];
//    // 将自定义视图添加到背景色中
////    [deleteAction1 setBackgroundColor:[UIColor clearColor]];
//    deleteAction2.backgroundColor = [UIColor colorWithPatternImage:[self imageWithView:customView2]];

//    // 创建包含图片和文字的自定义视图
//    UIView *customView3 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 70, 74)];
//    customView3.backgroundColor = RGB_COLOR_String(@"#FFA339");
//    // 图片
//    UIImageView *imageView3 = [[UIImageView alloc] initWithFrame:CGRectMake(23, 20, 14, 14)];
//    imageView3.centerX = customView3.centerX;
//    imageView3.image = [UIImage imageNamed:@"ic_nodistrub"];
//    [customView3 addSubview:imageView3];
//    // 文字
//    UILabel *label3 = [[UILabel alloc] initWithFrame:CGRectMake(0, 42, 70, 15)];
//    label3.text = isDisnodistrub?LangKey(@"Block"):LangKey(@"unBlock");
//    label3.textColor = [UIColor whiteColor];
//    label3.textAlignment = NSTextAlignmentCenter;
//    label3.font = [UIFont systemFontOfSize:12.0];
//    label3.centerX = customView3.centerX;
//    [customView3 addSubview:label3];
//    // 将自定义视图添加到背景色中
////    [deleteAction1 setBackgroundColor:[UIColor clearColor]];
//    deleteAction3.backgroundColor = [UIColor colorWithPatternImage:[self imageWithView:customView3]];
    
    NSArray<UIContextualAction*> *contextualAction = @[deleteAction1,deleteAction3,deleteAction2];
    UISwipeActionsConfiguration *actions = [UISwipeActionsConfiguration configurationWithActions:contextualAction];
    actions.performsFirstActionWithFullSwipe = NO;       // 禁止侧滑无线拉伸
    return actions;
}
- (UIImage *)imageWithView:(UIView *)view {
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, NO, [UIScreen mainScreen].scale);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
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
        NIMRecentSession *recent = self.recentSessions[indexPath.row];
        if (recent.session.sessionType == NIMSessionTypeP2P) {
            NSString *from = recent.session.sessionId;
            if ([ids containsObject:from]) {
                [indexPaths addObject:indexPath];
            }
        }
    }
    
    [self.tableView reloadRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationNone];
}

- (void)onNotifyAddStickTopSession:(NIMStickTopSessionInfo *)newInfo
{
    self.stickTopInfos[newInfo.session] = newInfo;
    [self refresh];
}

- (void)onNotifyRemoveStickTopSession:(NIMStickTopSessionInfo *)removedInfo
{
    self.stickTopInfos[removedInfo.session] = nil;
    [self refresh];
}

- (void)onNotifySyncStickTopSessions:(NIMSyncStickTopSessionResponse *)response
{
    if (response.hasChange) {
        [self.stickTopInfos removeAllObjects];
        [response.allInfos enumerateObjectsUsingBlock:^(NIMStickTopSessionInfo * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            self.stickTopInfos[obj.session] = obj;
        }];
        [self refresh];
    }
}

#pragma mark - NIMConversationManagerDelegate
- (void)onMarkMessageReadCompleteInSession:(NIMSession *)session error:(NSError *)error {
    if (error) {
//        UIWindow *keyWindow = [UIApplication sharedApplication].windows.firstObject;
//        NSString *msg = [NSString stringWithFormat:@"session %@ type %@ mark fail.code:%@",
//                         session.sessionId, @(session.sessionType), @(error.code)];
//        [keyWindow makeToast:msg duration:2 position:CSToastPositionCenter];
    }
}

#pragma mark - Private

- (void)refreshSubview{
    self.header.top = SCREEN_STATUS_HEIGHT+140;
//    self.tableView.top = SCREEN_STATUS_HEIGHT +44;
//    CGFloat offset = self.view.safeAreaInsets.bottom;
//    self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
//    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, offset, 0);
//
//    self.tableView.height = self.view.height - self.tableView.top;

}

- (NSAttributedString *)contentForRecentSession:(NIMRecentSession *)recent{
    NSAttributedString *content;
    if (recent.lastMessage.messageType == NIMMessageTypeCustom)
    {
        NIMMessage *msg = recent.lastMessage;
        if ([recent.lastMessage.text containsString:LangKey(@"retracted_message")]) {
            msg = [self lastMessageWithNoRevocationMessage:recent.lastMessage];
        }
        NSString *text = [NTESMessageUtil messageContent:msg];
        if (recent.session.sessionType != NIMSessionTypeP2P)
        {
            NSString *nickName = [NTESSessionUtil showNick:msg.from inSession:msg.session];
            text =  nickName.length ? [nickName stringByAppendingFormat:@" : %@",text] : @"";
        }
        content = [[NSAttributedString alloc] initWithString:text];
    }
    else
    {
        content = [super contentForRecentSession:recent];
    }
    NSMutableAttributedString *attContent = [[NSMutableAttributedString alloc] initWithAttributedString:content];
    [self checkNeedAtTip:recent content:attContent];
    [self checkOnlineState:recent content:attContent];
    
    NSMutableAttributedString *resultS = [self transformEmojiDescToEomjiImageWithAttributedString:attContent];
    
    return resultS;
}

- (NIMMessage *)lastMessageWithNoRevocationMessage:(NIMMessage *)recentMsg {
    
    NSArray<NIMMessage *> *messages = [NIMSDK.sharedSDK.conversationManager messagesInSession:recentMsg.session message:recentMsg limit:1];
    NIMMessage *msg = recentMsg;
    if (messages.count > 0) {
        msg = messages.firstObject;
        if (msg.messageType == NIMMessageTypeCustom && msg.messageSubType == 20) {
            return [self lastMessageWithNoRevocationMessage:msg];
        }
    }
    return msg;
}

+ (NSRegularExpression *)regexEmoticon {
    static NSRegularExpression *regex;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        regex = [NSRegularExpression regularExpressionWithPattern:@"\\[[^ \\[\\]]+?\\]" options:kNilOptions error:NULL];
    });
    return regex;
}

- (NSMutableAttributedString *)transformEmojiDescToEomjiImageWithAttributedString:(NSAttributedString *)attributedString {
    // 匹配 [表情]
    NSMutableAttributedString *attrM = [[NSMutableAttributedString alloc] initWithAttributedString:attributedString];
    if (attrM.length > 0) {
        
        NSArray<NSTextCheckingResult *> *emoticonResults = [[NTESSessionListViewController regexEmoticon] matchesInString:attrM.string options:kNilOptions range:attrM.yy_rangeOfAll];
        UIFont *fontSize = [UIFont systemFontOfSize:13];
        NSTextAlignment textAlignment = attrM.yy_alignment;
        CGFloat lineSpacing = attrM.yy_lineSpacing;

        [emoticonResults enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(NSTextCheckingResult * _Nonnull emo, NSUInteger idx, BOOL * _Nonnull stop) {
            NSRange range = emo.range;
            if (range.location == NSNotFound && range.length <= 1) return;
            
            if ([attrM yy_attribute:YYTextHighlightAttributeName atIndex:range.location]) return;
            if ([attrM yy_attribute:YYTextAttachmentAttributeName atIndex:range.location]) return;
            NSString *emoString = [attrM.string substringWithRange:range];
            
            NIMInputEmoticon *emoticon = [[AAAInputEmoticonManager sharedManager] emoticonByTag:emoString];
           
            UIImage *image = [UIImage nim_emoticonInKit:emoticon.filename];
                                          
            NSTextAttachment *attachment = [[NSTextAttachment alloc] init];
            attachment.image = image;
            CGFloat emojiHeight = fontSize.lineHeight;
            attachment.bounds = CGRectMake(0, fontSize.descender, emojiHeight, emojiHeight);
            
            NSMutableAttributedString *emoText = [[NSMutableAttributedString alloc] initWithString:YYTextAttachmentToken];
            [emoText appendAttributedString:[[NSAttributedString alloc] initWithString:@" "]];
            [emoText yy_setAttribute:NSKernAttributeName value:@(-1)];
            [emoText yy_setAttachment:attachment range:emoText.yy_rangeOfAll];
            
            if (!image && emoticon.unicode){
                emoText = [[NSMutableAttributedString alloc] initWithString:emoticon.unicode];
                [emoText yy_setAttribute:NSKernAttributeName value:@(-1)];
            }
            
            SNTextHighlight *highlight = [[SNTextHighlight alloc] init];
            highlight.type = SNTextHighlightTypeEmoji;
            highlight.text = emoString;
            [emoText yy_setTextHighlight:highlight range:NSMakeRange(0, emoText.length)];
            if (image || (!image && emoticon.unicode)) {
                [attrM replaceCharactersInRange:range withAttributedString:emoText];
            }
        }];
        attrM.yy_font = fontSize;
        attrM.yy_alignment = textAlignment;
        attrM.yy_lineSpacing = lineSpacing;
    }
    return attrM;
}

- (void)checkNeedAtTip:(NIMRecentSession *)recent content:(NSMutableAttributedString *)content
{
    if ([NTESSessionUtil recentSessionIsMark:recent type:NTESRecentSessionMarkTypeAt]) {
        NSAttributedString *atTip = [[NSAttributedString alloc] initWithString:@"[有人@你]".ntes_localized attributes:@{NSForegroundColorAttributeName:[UIColor redColor]}];
        [content insertAttributedString:atTip atIndex:0];
    }
}

- (void)checkOnlineState:(NIMRecentSession *)recent content:(NSMutableAttributedString *)content
{
    if (recent.session.sessionType == NIMSessionTypeP2P) {
//        NSString *state  = [NTESSessionUtil onlineState:recent.session.sessionId detail:NO];
//        if (state.length) {
//            NSString *format = [NSString stringWithFormat:@"[%@] ",state];
//            NSAttributedString *atTip = [[NSAttributedString alloc] initWithString:format attributes:nil];
//            [content insertAttributedString:atTip atIndex:0];
//        }
    }
}

- (void)loadStickTopSessions
{
    __weak typeof(self) wself = self;
    [NIMSDK.sharedSDK.chatExtendManager loadStickTopSessionInfos:^(NSError * _Nullable error, NSDictionary<NIMSession *,NIMStickTopSessionInfo *> * _Nullable infos) {
        __strong typeof(self) sself = wself;
        if (!sself) return;
        sself.stickTopInfos = [NSMutableDictionary dictionaryWithDictionary:infos];
        [sself refresh];
    }];
}


-(void)moreClickDelegate{
    [self showDropDownMenu];
}



-(void)createGroupRequestWithTeamID:(NSString *)teamID teamName:(NSString *)teamName type:(NSString *)type{
    NSString *currentUserId = [[NIMSDK sharedSDK].loginManager currentAccount];
    NSMutableDictionary *dict = @{}.mutableCopy;
    dict[@"owner"] = currentUserId;
    dict[@"type"] = type;
    dict[@"tname"] = teamName;
    dict[@"tid"] = teamID;
    
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
        if (_creatTeam.integerValue != 0) {
            [SVProgressHUD showMessage:LangKey(@"please_contact_your_administrator")];
        }else{
            [self creatTeamGroup];//创建群组
        }
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
    @weakify(self);
    [self presentMemberSelector:^(NSArray *uids, NSString *name, UIImage *avater) {
        @strongify(self);
        
//        [SVProgressHUD show];
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


/** 显示下拉菜单 */
- (void)showDropDownMenu {
    [self.dropdownMenu showMenu];
}

- (NTESNotificationView *)noticeView
{
    if(!_noticeView){
        _noticeView = [[NTESNotificationView alloc]initWithFrame:CGRectMake(0, SCREEN_STATUS_HEIGHT+140, SCREEN_WIDTH, SCREEN_SAFE_HEIGHT-140)];
        _noticeView.hidden = YES;
    }
    return _noticeView;
}

- (ZMONCustomLoadingView *)loadingView
{
    if(!_loadingView){
        _loadingView = [[ZMONCustomLoadingView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        _loadingView.hidden = YES;
    }
    return  _loadingView;
}

- (ZMONPrivacyPolicyView *)policyView
{
    if(!_policyView){
        _policyView = [[ZMONPrivacyPolicyView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
//        _policyView.hidden = YES;
    }
    return  _policyView;
}


@end
