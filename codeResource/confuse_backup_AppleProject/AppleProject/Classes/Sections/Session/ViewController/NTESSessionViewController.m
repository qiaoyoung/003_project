//
//  NTESSessionViewController.m
//  NIM
//
//  Created by amao on 8/11/15.
//  Copyright (c) 2015 Netease. All rights reserved.
//

#import "NTESSessionViewController.h"
@import MobileCoreServices;
@import AVFoundation;
#import "Reachability.h"
#import "UIActionSheet+NTESBlock.h"
#import "NTESCustomSysNotificationSender.h"
#import "NTESSessionConfig.h"
#import "BBBMediaItem.h"
#import "NTESSessionMsgConverter.h"
#import "NTESFileLocationHelper.h"
#import "NTESSessionMsgConverter.h"
#import "UIView+Toast.h"
#import "NTESVideoViewController.h"
#import "NSDictionary+NTESJson.h"
#import "CCCAdvancedTeamCardViewController.h"
#import "UIView+NTES.h"
#import "NTESBundleSetting.h"
#import "NTESPersonalCardViewController.h"
#import "AAAContactSelectViewController.h"
#import "SVProgressHUD.h"
#import "NTESFPSLabel.h"
#import "UIAlertView+NTESBlock.h"
#import "NTESSessionUtil.h"
#import "BBBKitMediaFetcher.h"
#import "BBBKitInfoFetchOption.h"
#import "NTESSubscribeManager.h"
#import "AAAInputAtCache.h"
#import "NTESRedPacketAttachment.h"
#import "NTESRedPacketTipAttachment.h"
#import "NTESCellLayoutConfig.h"
#import "NTESMulSelectFunctionBar.h"
#import "NTESMergeForwardSession.h"
#import "NTESSessionMultiRetweetContentView.h"
#import "CCCCommonTableData.h"
#import "AAAReplyContentView.h"
#import "NTESThreadTalkSessionViewController.h"
#import "UIView+NIMToast.h"
#import "NTESWhiteboardAttachment.h"
#import "NTESOpenRedPackageSheet.h"
#import "ZOMNForwardViewController.h"
#import "ZMONGalleryImgViewController.h"
#import "SNLeadCompleteManager.h"
#import "AAAKitUtil.h"
#import "BBBTeamAnnouncementListViewController.h"
#import "BBBTeamListDataManager.h"
#import "LEEAlert.h"
#import "ZCHttpManager+Addtionals.h"
#import "NTESListHeader.h"
#import "ZMONTranslateView.h"
#import "ZMONReportNextView.h"
#import "ZMONReportBlackView.h"
#import "ZMONReportDeleteView.h"
#import "ZMONReportHisView.h"

NSString *kNTESDemoRevokeMessageFromMeNotication = @"kNTESDemoRevokeMessageFromMeNotication";

@interface NTESSessionViewController ()
<UIImagePickerControllerDelegate,
UINavigationControllerDelegate,
UISearchControllerDelegate,
NIMSystemNotificationManagerDelegate,
NIMMediaManagerDelegate,
NIMEventSubscribeManagerDelegate,
BBBTeamCardViewControllerDelegate,
NIMChatExtendManagerDelegate,
UISearchBarDelegate,
NTESListHeaderDelegate,
NIMLoginManagerDelegate,
NTESOpenRedPackageSheetDelegate,
NIMTeamManagerDelegate,
NTESReportContentDelegate,
NTESReportNextDelegate,
NTESReportHisNextDelegate>
{
    BOOL _canSendText;
}

@property (nonatomic,strong)    NTESCustomSysNotificationSender *notificaionSender;
@property (nonatomic,strong)    NTESSessionConfig       *sessionConfig;
@property (nonatomic,strong)    UIImagePickerController *imagePicker;
@property (nonatomic,strong)    UIView *currentSingleSnapView;
@property (nonatomic,strong)    NTESFPSLabel *fpsLabel;
@property (nonatomic,strong)    BBBKitMediaFetcher *mediaFetcher;
@property (nonatomic,strong)    NSMutableArray *selectedMessages;
@property (nonatomic,strong)    NTESMulSelectFunctionBar *mulSelectedSureBar;
@property (nonatomic,strong)    UIButton *mulSelectCancelBtn;
@property (nonatomic,strong)    NTESMergeForwardSession *mergeForwardSession;

@property (nonatomic,assign)    NSInteger intervalTime;
@property (nonatomic,assign)    BOOL isSend;
@property (nonatomic,strong)    NSTimer *timer;

// "canMemberInfo": 1,//0 不允许查看资料 1 是允许
@property (nonatomic,assign)    BOOL canMemberInfo;
@property (nonatomic, strong)   NSDictionary *teamSettingConfig;

@property (nonatomic, strong) UILabel *invalid_tip;// 不在群聊view

@property (nonatomic, strong) NTESListHeader *header;
@property (nonatomic, strong) ZMONTranslateView *translateView;

@property (nonatomic, strong) ZMONReportNextView *reprotNextView;
@property (nonatomic, strong) ZMONReportBlackView *reprotBlackView;
@property (nonatomic, strong) ZMONReportDeleteView *reprotDeleteView;
@property (nonatomic, strong) NSString *userId;
@property (nonatomic, strong) ZMONReportHisView *reprotHisNextView;

@end


@implementation NTESSessionViewController


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    //    self.navigationController.navigationBarHidden = NO;
    //    [self.navigationController.navigationBar setHidden:YES];
    [self showNotice];
    
    // 当前用户不在群聊
    NIMTeam *team = [[NIMSDK sharedSDK].teamManager teamById:self.session.sessionId];
    if (team) {
        BOOL isMyTeam = [[NIMSDK sharedSDK].teamManager isMyTeam:self.session.sessionId];
        if (!isMyTeam) {
            
            self.invalid_tip.hidden = NO;
            
            NIMSessionDeleteAllRemoteMessagesOptions *options = [[NIMSessionDeleteAllRemoteMessagesOptions alloc] init];
            options.removeOtherClients = YES;
            [NIMSDK.sharedSDK.conversationManager deleteAllRemoteMessagesInSession:self.session options:options completion:^(NSError * _Nullable error) {
                if (error) {
                    return;
                }
                [self refreshMessages];
            }];
        } else {
            
            [[NIMSDK sharedSDK].teamManager fetchTeamMembers:team.teamId
                                                  completion:^(NSError * _Nullable error, NSArray<NIMTeamMember *> * _Nullable members) {
                
                if (members && members.count >= 100) {
                    
                    [[[NIMSDK sharedSDK] teamManager] updateNotifyState:NIMTeamNotifyStateOnlyManager
                                                                 inTeam:team.teamId
                                                             completion:^(NSError *error) {
                        
                    }];
                }
            }];
        }
    }
}

- (void)showNotice {
    
    NIMTeam *team = [[NIMSDK sharedSDK].teamManager teamById:self.session.sessionId];
    if (team) {
        BOOL isMyTeam = [[NIMSDK sharedSDK].teamManager isMyTeam:self.session.sessionId];
        if (!isMyTeam) {
            return;
        }
    }
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        NIMTeam *team = [[NIMSDK sharedSDK].teamManager teamById:self.session.sessionId];
        if (team && team.announcement && team.announcement.length > 0) {
            //取出标题和内容
            NSData* data = [team.announcement dataUsingEncoding:NSUTF8StringEncoding];
            NSArray *datas = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            if (datas.count <= 0){
                [[SNLeadCompleteManager sharedInstance] dismissLeadView];
                return;
            }
            
            NSString *title = [datas lastObject][@"title"];
            NSString *content = [datas lastObject][@"content"];
            
            NSString *message = [NSString stringWithFormat:@"%@：%@",title,content];
            
            if (title.length > 0 || content.length > 0){
                
                @weakify(self);
                [[SNLeadCompleteManager sharedInstance] showLeadViewForCompletingUserInfoWithSuperView:self.view withMessage:message cancleBlock:^{
                    @strongify(self);
                    
                    NIMTeamAnnouncementListOption *option = [[NIMTeamAnnouncementListOption alloc] init];
                    option.canCreateAnnouncement = NO;
                    option.announcement = team.announcement;
                    option.nick = team.teamName;
                    option.team = team;
                    BBBTeamAnnouncementListViewController *vc = [[BBBTeamAnnouncementListViewController alloc] initWithOption:option];
                    [self.navigationController pushViewController:vc animated:YES];
                }];
            } else {
                [[SNLeadCompleteManager sharedInstance] dismissLeadView];
            }
        }
        
    });
}


#pragma mark - Notifitcation
- (void)vcBecomeActive:(NSNotification *)notification {
    [self showNotice];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _isSend = YES;
    _canSendText = YES;
    self.canTapVoiceBtn = YES;
    
    //    self.view.backgroundColor = [UIColor colorWithRed:243/255.0 green:242/255.0 blue:252/255.0 alpha:1];
    //    self.tableView.frame = CGRectMake(0, SCREEN_TOP_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT-SCREEN_TOP_HEIGHT-SCREEN_TABBAR_HEIGHT-SCREEN_BOTTOM_HEIGHT);
    
    _notificaionSender  = [[NTESCustomSysNotificationSender alloc] init];
    [self setupNormalNav];
    BOOL disableCommandTyping = self.disableCommandTyping || (self.session.sessionType == NIMSessionTypeP2P &&[[NIMSDK sharedSDK].userManager isUserInBlackList:self.session.sessionId]);
    if (!disableCommandTyping) {
        [[NIMSDK sharedSDK].systemNotificationManager addDelegate:self];
    }
    
    if ([[NTESBundleSetting sharedConfig] showFps])
    {
        self.fpsLabel = [[NTESFPSLabel alloc] initWithFrame:CGRectZero];
        [self.view addSubview:self.fpsLabel];
        self.fpsLabel.right = self.view.width;
        self.fpsLabel.top   = self.tableView.top + self.tableView.contentInset.top;
    }
    
    if (self.session.sessionType == NIMSessionTypeP2P && !self.disableOnlineState)
    {
        //临时订阅这个人的在线状态
        [[NTESSubscribeManager sharedManager] subscribeTempUserOnlineState:self.session.sessionId];
        [[NIMSDK sharedSDK].subscribeManager addDelegate:self];
    }
    
    if (self.session.sessionType == NIMSessionTypeTeam) {
        [[NIMSDK sharedSDK].teamManager addDelegate:self];
    }
    
    //删除最近会话列表中有人@你的标记
    [NTESSessionUtil removeRecentSessionMark:self.session type:NTESRecentSessionMarkTypeAt];
    
    //批量转发
    _mergeForwardSession = [[NTESMergeForwardSession alloc] init];
    //    [self setupSearchVC];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(onRevokeMessageFromMe:)
                                                 name:kNTESDemoRevokeMessageFromMeNotication
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(vcBecomeActive:) name:UIApplicationDidBecomeActiveNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(languageChanged:) name:KEKENotificationLanguageChanged object:nil];
    
    __weak typeof(self) weakself = self;
    NSMutableDictionary *dict = @{}.mutableCopy;
    dict[@"id"] = self.session.sessionId;
    [ZCHttpManager getWithUrl:Server_team_getTeamSetting params:dict isShow:NO success:^(id responseObject) {
        NSDictionary *resultDict = (NSDictionary *)responseObject;
        NSString *code = [resultDict newStringValueForKey:@"code"];
        if (code.integerValue <= 0) {
            NSDictionary *data = [resultDict valueObjectForKey:@"data"];
            _teamSettingConfig = data;
            
            NSString *frequency = [data newStringValueForKey:@"frequency"];
            self.canMemberInfo = [data boolValueForKey:@"canMemberInfo"];
            weakself.intervalTime = frequency.integerValue;
            if (weakself.intervalTime > 0) {
                weakself.timer = [NSTimer scheduledTimerWithTimeInterval:weakself.intervalTime target:weakself selector:@selector(timerWithTimeInterval) userInfo:nil repeats:YES];
            }
        }
        
    } failed:^(id responseObject, NSError *error) {
        
    }];
    
    [ZCHttpManager getWithUrl:Server_team_getStatusSendText params:dict isShow:NO success:^(id responseObject) {
        NSDictionary *resultDict = (NSDictionary *)responseObject;
        NSString *code = [resultDict newStringValueForKey:@"code"];
        if (code.integerValue <= 0) {
            NSDictionary *data = [resultDict valueObjectForKey:@"data"];
            NSString *canSendText = [data stringValueForKey:@"canSendText" defaultValue:kConstant_1];
            _canSendText = canSendText.boolValue;
        }
        
    } failed:^(id responseObject, NSError *error) {
        
    }];
    
    
    // 群公告
    NSString * flag = [[NSUserDefaults standardUserDefaults] valueForKey:[[NSString alloc]initWithFormat:@"%@%@",@"teamgonggao_",self.session.sessionId]];
    if([kConstant_1 isEqualToString:flag]){
        [[NSUserDefaults standardUserDefaults] setValue:kConstant_0 forKey:[[NSString alloc]initWithFormat:@"%@%@",@"teamgonggao_",self.session.sessionId]];
        //取出标题和内容
        NSString * title = [[NSUserDefaults standardUserDefaults] valueForKey:[[NSString alloc] initWithFormat:@"%@%@",@"teamgonggao_title_",self.session.sessionId]];
        NSString * content = [[NSUserDefaults standardUserDefaults] valueForKey:[[NSString alloc] initWithFormat:@"%@%@",@"teamgonggao_content_",self.session.sessionId]];
        
        if (title.length > 0 || content.length > 0){
            
            [LEEAlert alert].config
                .LeeAddTitle(^(UILabel *label) {
                    label.text = title;
                    label.textColor = [UIColor darkGrayColor];
                })
                .LeeAddContent(^(UILabel *label) {
                    label.text = content;
                    label.textColor = [UIColor grayColor];
                })
                .LeeAddAction(^(LEEAction *action) {
                    
                    action.type = LEEActionTypeCancel;
                    action.title = LangKey(@"contact_tag_fragment_sure");
                    action.titleColor = [UIColor colorWithHexString:@"01B0FD"];
                    action.backgroundColor = [UIColor whiteColor];
                    action.backgroundHighlightColor = [UIColor colorWithRed:239/255.0f green:239/255.0f blue:239/255.0f alpha:1.0f];
                    action.borderWidth = 1.0f;
                    action.borderColor = action.backgroundHighlightColor;
                })
                .LeeShow();
        }
        
    }
    
    [[NIMSDK sharedSDK].loginManager addDelegate:self];
    
    self.header = [[NTESListHeader alloc] initWithFrame:CGRectMake(0, SCREEN_TOP_HEIGHT, self.view.width, 0)];
    self.header.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    self.header.delegate = self;
    [self.view addSubview:self.header];
    
    NSInteger step = ((CCCAppDelegate*)([UIApplication sharedApplication].delegate)).loginStep;
    [self.header refreshWithType:ListHeaderTypeNetStauts value:@(step)];
}

- (void)languageChanged:(NSNotification *)noti {
    [self refreshMessages];
    [self.tableView reloadData];
}

/** NIMTeamManagerDelegate
 *  群组成员变动回调,包含被移除的群成员ID
 *
 *  @param team 变动的群组
 *  @param memberIDs 变动的成员ID
 */
- (void)onTeamMemberRemoved:(NIMTeam *)team
                withMembers:(nullable NSArray<NSString *> *)memberIDs; {
    
    NSString *currentAcount = [[NIMSDK sharedSDK].loginManager currentAccount];
    if ([self.session.sessionId isEqualToString:team.teamId] && [memberIDs containsObject:currentAcount]) {
        self.invalid_tip.hidden = NO;
        
        NIMSessionDeleteAllRemoteMessagesOptions *options = [[NIMSessionDeleteAllRemoteMessagesOptions alloc] init];
        options.removeOtherClients = YES;
        [NIMSDK.sharedSDK.conversationManager deleteAllRemoteMessagesInSession:self.session options:options completion:^(NSError * _Nullable error) {
            if (error) {
                return;
            }
            [self refreshMessages];
        }];
    }
}

//- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    [self.view endEditing:YES];
//}

#pragma mark - NIMLoginManagerDelegate
- (void)onLogin:(NIMLoginStep)step{
    [self.header refreshWithType:ListHeaderTypeNetStauts value:@(step)];
}

-(void)timerWithTimeInterval{
    _isSend = YES;
}

- (void)dealloc
{
    [[NIMSDK sharedSDK].systemNotificationManager removeDelegate:self];
    if (self.session.sessionType == NIMSessionTypeP2P && !self.disableOnlineState)
    {
        [[NIMSDK sharedSDK].subscribeManager removeDelegate:self];
        [[NTESSubscribeManager sharedManager] unsubscribeTempUserOnlineState:self.session.sessionId];
    }
    
    if (self.session.sessionType == NIMSessionTypeTeam) {
        [[NIMSDK sharedSDK].teamManager removeDelegate:self];
    }
    
    [_fpsLabel invalidate];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
    [self.timer invalidate];
}



- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    self.fpsLabel.right = self.view.width;
    self.fpsLabel.top   = self.tableView.top + self.tableView.contentInset.top;
    self.mulSelectedSureBar.frame = self.sessionInputView.frame;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [[NIMSDK sharedSDK].mediaManager addDelegate:self];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [[NIMSDK sharedSDK].mediaManager stopRecord];
    [[NIMSDK sharedSDK].mediaManager stopPlay];
    [[NIMSDK sharedSDK].mediaManager removeDelegate:self];
    
    [[SNLeadCompleteManager sharedInstance] dismissLeadView];
    //    [self.navigationController.navigationBar setHidden:NO];
}

- (id<CCCSessionConfig>)sessionConfig
{
    if (_sessionConfig == nil) {
        _sessionConfig = [[NTESSessionConfig alloc] init];
        _sessionConfig.session = self.session;
    }
    return _sessionConfig;
}

#pragma mark - BBBTeamCardViewControllerDelegate

- (void)NIMTeamCardVCDidSetTop:(BOOL)isTop {
    NIMRecentSession *recent = [[NIMSDK sharedSDK].conversationManager recentSessionBySession:self.session];
    if (isTop) {
        if (!recent) {
            [[NIMSDK sharedSDK].conversationManager addEmptyRecentSessionBySession:self.session];
        }
        NIMAddStickTopSessionParams *params = [[NIMAddStickTopSessionParams alloc] initWithSession:self.session];
        [NIMSDK.sharedSDK.chatExtendManager addStickTopSession:params completion:nil];
    } else {
        if (recent) {
            NIMStickTopSessionInfo *stickTopInfo = [NIMSDK.sharedSDK.chatExtendManager stickTopInfoForSession:self.session];
            [NIMSDK.sharedSDK.chatExtendManager removeStickTopSession:stickTopInfo completion:nil];
        } else {}
    }
}

#pragma mark - NIMEventSubscribeManagerDelegate
- (void)onRecvSubscribeEvents:(NSArray *)events
{
    for (NIMSubscribeEvent *event in events) {
        if ([event.from isEqualToString:self.session.sessionId]) {
            [self refreshSessionSubTitle:[NTESSessionUtil onlineState:self.session.sessionId detail:YES]];
        }
    }
}

#pragma mark - NIMSystemNotificationManagerDelegate
- (void)onReceiveCustomSystemNotification:(NIMCustomSystemNotification *)notification
{
    if (!notification.sendToOnlineUsersOnly) {
        return;
    }
    NSData *data = [[notification content] dataUsingEncoding:NSUTF8StringEncoding];
    if (data) {
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data
                                                             options:0
                                                               error:nil];
        if ([dict jsonInteger:NTESNotifyID] == NTESCommandTyping && self.session.sessionType == NIMSessionTypeP2P && [notification.sender isEqualToString:self.session.sessionId])
        {
            [self refreshSessionTitle:[NSString stringWithFormat:@"%@...",@"正在输入".ntes_localized]];
           
        }
    }
    
    
}

#pragma mark - NIMMediaManagerDelegate


- (void)playAudio:(NSString *)filePath progress:(float)value
{
}


#pragma mark - UISearchControllerDelegate

- (NSString *)sessionTitle
{
    if ([self.session.sessionId isEqualToString:[NIMSDK sharedSDK].loginManager.currentAccount]) {
        return  @"我的电脑".ntes_localized;
    }
    return [super sessionTitle];
}

- (NSString *)sessionSubTitle
{
    if (self.session.sessionType == NIMSessionTypeP2P && ![self.session.sessionId isEqualToString:[NIMSDK sharedSDK].loginManager.currentAccount]) {
        return [NTESSessionUtil onlineState:self.session.sessionId detail:YES];
    }
    return @"";
}

- (void)onTextChanged:(id)sender
{
    [_notificaionSender sendTypingState:self.session];
}


#pragma mark - 文本消息

- (void)onSendText:(NSString *)text atUsers:(NSArray *)atUsers{
    [super onSendText:text atUsers:atUsers];
}

//正则过滤，字符串是否是纯数字
- (BOOL)filterInputShouldNumber:(NSString *)str
{
   if (str.length == 0) {
        return NO;
    }
    NSString *regex = @"[0-9]*";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    if ([pred evaluateWithObject:str]) {
        return YES;
    }
    return NO;
}

// 设置成垃圾消息，发送给服务器
- (void)hitClientAntispamWithMessage:(NIMMessage *)message type:(NSString *)type
{
    NIMAntiSpamOption *option = [[NIMAntiSpamOption alloc] init];
    option.hitClientAntispam = YES;
    message.antiSpamOption = option;

    NSString *userID = [[NIMSDK sharedSDK].loginManager currentAccount];
    NIMUser *me = [[NIMSDK sharedSDK].userManager userInfo:userID];
    NSString *nickName = me.userInfo.nickName;
    
    NSDictionary *dic = @{
        @"accid" : emptyString(userID),
        @"username" : nickName?:@"",
        @"content" : message.text?:@"",
        @"recid" : self.session.sessionId?:@"",
        @"type" : [NSString stringWithFormat:@"apple+%@",type],
        @"sessionname" : self.sessionTitle?:@"",
    };
    
    [ZCHttpManager refreshForbiddenWordsparams:dic GenerateUser:^(NSDictionary * _Nonnull configDict) {
        
    }];
}
// 发送的所有消息类型最终 都会走这个 sendMessage方法，所以在这拦截
- (void)sendMessage:(NIMMessage *)message
{
    // 不再群聊 不允许发送消息
    NIMTeam *team = [[NIMSDK sharedSDK].teamManager teamById:self.session.sessionId];
    if (team) {
        BOOL isMyTeam = [[NIMSDK sharedSDK].teamManager isMyTeam:self.session.sessionId];
        if (!isMyTeam) {
            return;
        }
    }
    
    // 发送频率设置，距离上一次发送消息间隔小于frequency秒，提示 @"发言频次过快，请%ld秒后重试"
    if (_intervalTime > 0 && _isSend == NO) {
        [self hitClientAntispamWithMessage:message type:@"发言频次"];
        NSString *title = [NSString stringWithFormat:LangKey(@"发言频次过快，请%ld秒后重试"),(long)_intervalTime];
        [SVProgressHUD showMessage:title];
        return;
    }
    _isSend = NO;
    
    // 发送消息的间隔时间 frequency>0 && 文本消息 && 输入不是数字
    if (!_canSendText && message.messageType == NIMMessageTypeText && ![self filterInputShouldNumber:message.text]) {
        [self hitClientAntispamWithMessage:message type:@"不允许文字"];
    }
    
    if ([[NTESBundleSetting sharedConfig] enableLocalAnti] && message.messageType == NIMMessageTypeText)
    {
        NIMLocalAntiSpamCheckOption *checkOption = [[NIMLocalAntiSpamCheckOption alloc] init];
        checkOption.content = message.text;
        checkOption.replacement = @"*";
        NSError *error = nil;
        NIMLocalAntiSpamCheckResult *result = [[NIMSDK sharedSDK].antispamManager checkLocalAntispam:checkOption error:&error];
        if (error)
        {
            [self.view makeToast:@"本地反垃圾失败".ntes_localized];
        }
        else
        {
            switch (result.type) {
                case NIMAntiSpamOperateFileNotExists:
                    break;
                case NIMAntiSpamResultLocalReplace:
                    message.text = result.content;
                    break;
                case NIMAntiSpamResultLocalForbidden:
                    [self.view makeToast:@"** 该消息被屏蔽 **".ntes_localized];
                    return;
                case NIMAntiSpamResultServerForbidden:
                {
                    [self hitClientAntispamWithMessage:message type:@"反垃圾消息"];
                }
                    break;
                case NIMAntiSpamResultNotHit:
                    break;
                default:
                    break;
            }
        }
    }
    [super sendMessage:message];
}



#pragma mark - NIMInputActionProtocol

- (BOOL)onTapVoiceBtn:(id)sender {
    return _canSendText;
}

#pragma mark - 菜单
- (void)onTapMenuItemReply:(BBBMediaItem *)item
{
    NIMMessage *menuMessage = [self messageForMenu];
    if ([self.sessionConfig respondsToSelector:@selector(setThreadMessage:)])
    {
        [self.sessionConfig setThreadMessage:menuMessage];
    }
    
    [self.sessionInputView refreshStatus:NIMInputStatusText];
    [self.sessionInputView.toolBar.inputTextView becomeFirstResponder];
    [self.sessionInputView refreshReplyedContent:menuMessage];
    [self.sessionInputView sizeToFit];
    if (self.session.sessionType != NIMSessionTypeP2P &&
        menuMessage)
    {
        [self.sessionInputView addAtItems:@[[NSString stringWithFormat:@"%@", menuMessage.from]]];
    }
}

- (void)onTapMenuItemForword:(BBBMediaItem *)item
{
    ZOMNForwardViewController *vc = [[ZOMNForwardViewController alloc]init];
    vc.message = [self messageForMenu];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)onTapMenuItemMark:(BBBMediaItem *)item
{
    NIMMessage *message = [self messageForMenu];
    NSData *messageData = [NIMSDK.sharedSDK.conversationManager encodeMessageToData:message];
    NIMAddCollectParams *params = [[NIMAddCollectParams alloc] init];
    params.data = [[NSString alloc] initWithData:messageData encoding:NSUTF8StringEncoding];
    params.type = 1;
    params.uniqueId = message.messageId.MD5String;
    [[NIMSDK sharedSDK].chatExtendManager addCollect:params completion:^(NSError * _Nullable error, NIMCollectInfo * _Nullable collectInfo) {
        if (error) {
            [SVProgressHUD showErrorWithStatus:LangKey(@"收藏失败")];
            return;
        }
        [SVProgressHUD showSuccessWithStatus:LangKey(@"收藏成功")];
    }];
}

- (void)onTapMenuItemPin:(BBBMediaItem *)item
{
    NIMMessage *message = [self messageForMenu];
    NIMMessagePinItem *pinItem = [[NIMMessagePinItem alloc] initWithMessage:message];
    
    __weak typeof(self) wself = self;
    [[NIMSDK sharedSDK].chatExtendManager addMessagePin:pinItem completion:^(NSError * _Nullable error, NIMMessagePinItem * _Nullable item) {
        if (!wself) {
            return;
        }
        __strong typeof(wself) sself = wself;
        if (error) {
            [SVProgressHUD showErrorWithStatus:@"添加失败".ntes_localized];
            return;
        }
        [sself uiPinMessage:message];
    }];
}

- (void)onTapMenuItemUnpin:(BBBMediaItem *)item
{
    NIMMessage *message = [self messageForMenu];
    NIMMessagePinItem *pinItem = [NIMSDK.sharedSDK.chatExtendManager pinItemForMessage:message];
    
    __weak typeof(self) wself = self;
    [[NIMSDK sharedSDK].chatExtendManager removeMessagePin:pinItem completion:^(NSError * _Nullable error, NIMMessagePinItem * _Nullable item) {
        if (!wself) {
            return;
        }
        __strong typeof(wself) sself = wself;
        if (error) {
            [SVProgressHUD showErrorWithStatus:@"取消标记失败".ntes_localized];
            return;
        }
        [sself uiUnpinMessage:message];
    }];
    
}

- (void)onTapMenuItemRevoke:(BBBMediaItem *)item
{
    NIMMessage *message = [self messageForMenu];
    BOOL enableRevokePostscript = [[NTESBundleSetting sharedConfig] enableRevokeMsgPostscript];
    if (enableRevokePostscript) {
        [self doShowInputRevokePostscriptAlert:message];
    } else {
        [self doRevokeMessage:message postscript:nil];
    }
}
///获取UTC时间戳
- (NSString *)getNowUTCTimeTimestamp{
//      NSDate *datenow = [NSDate date];
//      NSTimeZone *zone = [NSTimeZone localTimeZone];
//    // 获取指定时间所在时区与UTC时区的间隔秒数
//    NSInteger seconds = [zone secondsFromGMTForDate:[NSDate date]];
//    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[datenow timeIntervalSince1970] - seconds];
//    return timeSp;
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
        [formatter setDateStyle:NSDateFormatterMediumStyle];
        [formatter setTimeStyle:NSDateFormatterShortStyle];
        [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"]; // ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
        //设置时区,这个对于时间的处理有时很重要
        NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
        [formatter setTimeZone:timeZone];
        NSDate *datenow = [NSDate date];//现在时间,你可以输出来看下是什么格式
        NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[datenow timeIntervalSince1970]];

        return timeSp;
}


- (void)onTapMenuItemReport:(BBBMediaItem *)item
{
    [self.view addSubview:self.translateView];
    [self.translateView animationShow];
}

- (void)onTapMenuItemTranslation:(BBBMediaItem *)item
{
    NIMMessage *message = [self messageForMenu];
     
    NSString *time = [self getNowUTCTimeTimestamp];
    NSMutableDictionary *param = @{}.mutableCopy;
    param[@"curTime"] = time;
    
    [ZCHttpManager getWithUrl:Server_getNimCheckSum params:param isShow:NO success:^(id responseObject) {
        NSDictionary *resultDict = (NSDictionary *)responseObject;
        NSString *code = [resultDict newStringValueForKey:@"code"];
        if (code.integerValue <= 0) {
            NSDictionary *data = [resultDict valueObjectForKey:@"data"];
            NSString *checksum = [data newStringValueForKey:@"checksum"];
            NSString *nonce = [data newStringValueForKey:@"nonce"];

            NSString *userID = [[NIMSDK sharedSDK].loginManager currentAccount];
            NSString *lang = emptyString([NIMUserDefaults standardUserDefaults].language);
            if([lang isEqualToString:@"zh"]){
                lang = @"zh-CHS";
            }else if ([lang isEqualToString:@"hant"]){
                lang = @"zh-CHT";
            }
            NSMutableDictionary *dict = @{}.mutableCopy;
            [dict setObject:userID forKey:@"accid"];
            [dict setObject:message.text forKey:@"text"];
            [dict setObject:lang forKey:@"to"];
            
            [ZCHttpManager postWithUrl:@"http://api-sg.netease.im/nimserver/translator/textMsg.action" checksum:checksum nonce:nonce CurTime:time params:dict success:^(id responseObject) {
                
                NSDictionary *resultDict = (NSDictionary *)responseObject;
                NSLog(@"resultDict-%@",resultDict);
                NSString *code = [resultDict newStringValueForKey:@"code"];
                
                if (code.integerValue == 200) {
                    NSDictionary *data = [resultDict valueObjectForKey:@"data"];
                    NSString *translation = [data newStringValueForKey:@"translation"];
//                    [SVProgressHUD showMessage:translation];
                    
                    message.localExt = @{@"NTESMessageTranslate": translation };
                    [[NIMSDK sharedSDK].conversationManager updateMessage:message forSession:self.session completion:^(NSError * _Nullable error) {
//////                        [self.interactor resetLayout];
//                        [self refreshMessages];
//                        [self.tableView reloadData];
                        
                        [self uiUpdateMessage:message];
                        [self.tableView reloadData];
//                        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//                        // 需要延迟执行的代码
//
//                            NIMMessage *message = [self messageForMenu];
//                            [self scrollToMessage:message];
//                        });

                        
//                        NIMMessage *message = [self messageForMenu];
//                        [self scrollToMessage:message];
//                        [self uiUpdateMessage:message];
//                        [self scrollsafelyReloadRowAtToMessage:message];
//                        [self.tableView reloadData];
                    }];
                    
                 
                }else{
                    NSString *desc = [resultDict newStringValueForKey:@"desc"];
                    [SVProgressHUD showMessage:desc];
                }
                
               
            } failed:^(id responseObject, NSError *error) {
                [SVProgressHUD showMessage:error.domain];
            }];
            
        }

    } failed:^(id responseObject, NSError *error) {
        NSLog(@"%@",error);
    }];
  
}

- (void)scrollsafelyReloadRowAtToMessage:(NIMMessage *)message
{
    NSInteger row = [self.interactor findMessageIndex:message];
    if (row != -1) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:row inSection:0];
//        [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
        
        if (indexPath) {
            [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
        } else {
            [self.tableView reloadData];
        }
        
    }
   
    
    
}


- (void)doShowInputRevokePostscriptAlert:(NIMMessage *)message {
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"撤回附言"
                                                                     message:nil
                                                              preferredStyle:UIAlertControllerStyleAlert];
    [alertVC addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"请输入附言";
    }];
    __weak typeof(self) weakSelf = self;
    UIAlertAction *sure = [UIAlertAction actionWithTitle:LangKey(@"contact_tag_fragment_sure") style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        UITextField *input = alertVC.textFields.firstObject;
        [weakSelf doRevokeMessage:message postscript:input.text];
    }];
    [alertVC addAction:sure];
    [self presentViewController:alertVC animated:YES completion:nil];
}

- (void)doRevokeMessage:(NIMMessage *)message postscript:(NSString *)postscript{
    __weak typeof(self) weakSelf = self;
    NSString *collapseId = message.apnsPayload[@"apns-collapse-id"];
    NSDictionary *payload = @{
        @"apns-collapse-id": collapseId ? : @"",
    };
    NIMRevokeMessageOption *option = [[NIMRevokeMessageOption alloc] init];
    option.apnsContent = LangKey(@"撤回一条消息");
    option.apnsPayload = payload;
    option.shouldBeCounted = ![[NTESBundleSetting sharedConfig] isIgnoreRevokeMessageCount];
    option.postscript = postscript;
    option.attach = _revokeAttach;
    [[NIMSDK sharedSDK].chatManager revokeMessage:message option:option completion:^(NSError * _Nullable error) {
        if (error) {
            if (error.code == NIMRemoteErrorCodeDomainExpireOld) {
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:LangKey(@"发送时间超过2分钟的消息不能被撤回") delegate:nil cancelButtonTitle:LangKey(@"contact_tag_fragment_sure") otherButtonTitles:nil, nil];
                [alert show];
            } else {
                [weakSelf.view makeToast:@"消息撤回失败，请重试".ntes_localized duration:2.0 position:CSToastPositionCenter];
            }
        } else {
            NSMutableDictionary *userInfo = [NSMutableDictionary dictionary];
            userInfo[@"msg"] = message;
            userInfo[@"postscript"] = postscript;
            [[NSNotificationCenter defaultCenter] postNotificationName:kNTESDemoRevokeMessageFromMeNotication
                                                                object:nil
                                                              userInfo:userInfo];
            
            // 撤回的消息 作为自定义消息发出去
            NIMMessage *revocationMessage = [NTESSessionMsgConverter msgWithRevocationMessage:message];
            [weakSelf sendMessage:revocationMessage];
        }
    }];
}

- (void)onRevokeMessageFromMe:(NSNotification *)note {
    NIMMessage *message = note.userInfo[@"msg"];
    NSString *postscript = note.userInfo[@"postscript"];
    if (message) {
        BBBMessageModel *model = [self uiDeleteMessage:message];
        //主动撤回场景下，将之前填充的attach内容再次填充保存
        NIMMessage *tip = [NTESSessionMsgConverter msgWithTip:[NTESSessionUtil tipOnMessageRevokedLocal:postscript]
                                                 revokeAttach:_revokeAttach
                                            revokeCallbackExt:nil];
        tip.timestamp = model.messageTime;
        //[self uiInsertMessages:@[tip]];//撤回消息不显示

        tip.timestamp = message.timestamp;
        // saveMessage 方法执行成功后会触发 onRecvMessages: 回调，但是这个回调上来的 NIMMessage 时间为服务器时间，和界面上的时间有一定出入，所以要提前先在界面上插入一个和被删消息的界面时间相符的 Tip, 当触发 onRecvMessages: 回调时，组件判断这条消息已经被插入过了，就会忽略掉。
        [[NIMSDK sharedSDK].conversationManager saveMessage:tip forSession:message.session completion:nil];//撤回消息不显示
    }
}

- (void)onTapMenuItemDelete:(BBBMediaItem *)item
{
    NIMMessage *message    = [self messageForMenu];
    BOOL deleteFromServer = [NTESBundleSetting sharedConfig].isDeleteMsgFromServer;
    if (deleteFromServer)
    {
        __weak typeof(self) wSelf = self;
        [[NIMSDK sharedSDK].conversationManager deleteMessageFromServer:message
                                                                    ext:@"扩展字段"
                                                             completion:^(NSError * _Nullable error)
        {
            if (error)
            {
                return;
            }
            
            [wSelf uiDeleteMessage:message];
        }];
    }
    else
    {
        BOOL isDeleteFromDB = [NTESBundleSetting sharedConfig].isDeleteMsgFromDB;
        NIMDeleteMessageOption *option = [[NIMDeleteMessageOption alloc] init];
        option.removeFromDB = isDeleteFromDB;
        [[NIMSDK sharedSDK].conversationManager deleteMessage:message option:option];
        [self uiDeleteMessage:message];
    }
}

- (void)onTapMenuItemMutiSelect:(BBBMediaItem *)item
{
    [self switchUIWithSessionState:NIMKitSessionStateSelect];
}

- (void)onTapMenuItemAudio2Text:(BBBMediaItem *)item
{
  
}

#pragma mark - 消息发送时间截获
- (void)sendMessage:(NIMMessage *)message didCompleteWithError:(NSError *)error
{
    if (error.code == NIMRemoteErrorCodeInBlackList)
    {
        //消息打上拉黑拒收标记，方便 UI 显示
        message.localExt = @{NTESMessageRefusedTag:@(true)};
        [[NIMSDK sharedSDK].conversationManager updateMessage:message forSession:self.session completion:nil];
        
        //插入一条 Tip 提示
        NIMMessage *tip = [NTESSessionMsgConverter msgWithTip:@"消息已发送，但对方拒收".ntes_localized];
        [[NIMSDK sharedSDK].conversationManager saveMessage:tip forSession:self.session completion:nil];
        
        // 文本消息 && 当前用户被拉黑 上报
        if (message.messageType == NIMMessageTypeText && _intervalTime<=0) {
            [self hitClientAntispamWithMessage:message type:@"被拉黑"];
        }
        
    } else if (error.code == NIMRemoteErrorCodeTeamBlackList) {
        NIMMessage *tip = [NTESSessionMsgConverter msgWithTip:@"您已被禁言"];
        [[NIMSDK sharedSDK].conversationManager saveMessage:tip forSession:self.session completion:nil];
        
        // 群聊 && 文本消息 && 被禁言的消息 上报
        // 超级群聊 && 文本消息 && 被禁言的消息 上报
        if (message.messageType == NIMMessageTypeText && _intervalTime<=0)
        {
            NSString *userID = [NIMSDK sharedSDK].loginManager.currentAccount;
            [self hitClientAntispamWithMessage:message type:@"被禁言"];
        }

    } 
    else if (error.code == NIMRemoteErrorCodeTeamAccessError) {
  
        // 群聊 && 文本消息 && 被禁言的消息 上报
        // 超级群聊 && 文本消息 && 被禁言的消息 上报
        if (message.messageType == NIMMessageTypeText && _intervalTime<=0)
        {
            NSString *userID = [NIMSDK sharedSDK].loginManager.currentAccount;
            NIMTeamMember *member = [[NIMSDK sharedSDK].teamManager teamMember:userID inTeam:self.session.sessionId];
            [self hitClientAntispamWithMessage:message type:@""];
        }

    }
    [super sendMessage:message didCompleteWithError:error];
}


#pragma mark - 录音事件
- (void)onRecordFailed:(NSError *)error
{
    [self.view makeToast:@"录音失败".ntes_localized duration:2 position:CSToastPositionCenter];
}

- (BOOL)recordFileCanBeSend:(NSString *)filepath
{
    NSURL    *URL = [NSURL fileURLWithPath:filepath];
    AVURLAsset *urlAsset = [[AVURLAsset alloc]initWithURL:URL options:nil];
    CMTime time = urlAsset.duration;
    CGFloat mediaLength = CMTimeGetSeconds(time);
    return mediaLength > 2;
}

- (void)showRecordFileNotSendReason
{
    [self.view makeToast:@"录音时间太短".ntes_localized duration:0.2f position:CSToastPositionCenter];
}

#pragma mark - Cell事件
- (BOOL)onTapCell:(BBBKitEvent *)event
{
    BOOL handled = [super onTapCell:event];
    NSString *eventName = event.eventName;
    
    if ([eventName isEqualToString:BBBKitEventNameTapContent])
    {
        NIMMessage *message = event.messageModel.message;
        NSDictionary *actions = [self cellActions];
        NSString *value = actions[@(message.messageType)];
        if (value) {
            SEL selector = NSSelectorFromString(value);
            if (selector && [self respondsToSelector:selector]) {
                SuppressPerformSelectorLeakWarning([self performSelector:selector withObject:message]);
                handled = YES;
            }
        }
    }
    else if ([eventName isEqualToString:BBBKitEventNameTapRepliedContent])
    {
        handled = YES;
        BBBMessageModel *model = event.messageModel;
        NIMMessage *message = model.parentMessage;
        if (!message)
        {
            [self.view makeToast:@"父消息不存在".ntes_localized];
            return handled;
        }
        NTESThreadTalkSessionViewController *vc = [[NTESThreadTalkSessionViewController alloc] initWithThreadMessage:message];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if([eventName isEqualToString:BBBKitEventNameTapLabelLink])
    {
        NSString *link = event.data;
        [self openSafari:link];
        handled = YES;
    }
  
    if (!handled) {
        NSAssert(0, @"invalid event");
    }
    return handled;
}

- (BOOL)onTapAvatar:(NIMMessage *)message{
    NSString *userId = [self messageSendSource:message];
    NTESPersonalCardViewController *vc = [[NTESPersonalCardViewController alloc] initWithUserId:userId];

    //进入个人名片
    if (self.canMemberInfo) {
        vc.teamSetingConfig = _teamSettingConfig;
        [self.navigationController pushViewController:vc animated:YES];
    }
    return YES;
}


- (BOOL)onLongPressAvatar:(NIMMessage *)message
{
    NSString *userId = [self messageSendSource:message];
    NIMSessionType sessionType = self.session.sessionType;
    if ((sessionType == NIMSessionTypeTeam || sessionType == NIMSessionTypeSuperTeam)
        && ![userId isEqualToString:[NIMSDK sharedSDK].loginManager.currentAccount])
    {
        BBBKitInfoFetchOption *option = [[BBBKitInfoFetchOption alloc] init];
        option.session = self.session;
        option.forbidaAlias = YES;
        
        NSString *nick = [[AppleProjectKit sharedKit].provider infoByUser:userId option:option].showName;
        NSString *text = [NSString stringWithFormat:@"%@%@%@",NIMInputAtStartChar,nick,NIMInputAtEndChar];
        
        NIMInputAtItem *item = [[NIMInputAtItem alloc] init];
        item.uid  = userId;
        item.name = nick;
        [self.sessionInputView.atCache addAtItem:item];
        
        [self.sessionInputView.toolBar insertText:text];
    }
    return YES;
}

- (BOOL)onPressReadLabel:(NIMMessage *)message
{
    return YES;
}

- (void)onSelectedMessage:(BOOL)selected message:(NIMMessage *)message {
    if (!_selectedMessages) {
        _selectedMessages = [NSMutableArray array];
    }
    if (selected) {
        [_selectedMessages addObject:message];
    } else {
        [_selectedMessages removeObject:message];
    }
}

- (void)onClickReplyButton:(NIMMessage *)message
{
    NTESThreadTalkSessionViewController *vc = [[NTESThreadTalkSessionViewController alloc] initWithThreadMessage:message];
    [self.navigationController pushViewController:vc animated:YES];
}


- (NSString *)messageSendSource:(NIMMessage *)message {
    return message.from;
}

#pragma mark - Cell Actions
- (void)showImage:(NIMMessage *)message
{
    NIMImageObject *object = message.messageObject;
    NTESGalleryItem *item = [[NTESGalleryItem alloc] init];
    item.thumbPath      = [object thumbPath];
    item.imageURL       = [object url];
    item.name           = [object displayName];
    item.itemId         = [message messageId];
    item.size           = [object size];
    item.imagePath      = [object path];
    
    NIMSession *session = [self isMemberOfClass:[NTESSessionViewController class]]? self.session : nil;
    
    
    ZMONGalleryImgViewController *vc = [[ZMONGalleryImgViewController alloc] init];
    vc.imageURL = [object url];
    vc.imagePath = [object path];
//    NTESGalleryViewController *vc = [[NTESGalleryViewController alloc] initWithItem:item session:session];
    [self.navigationController pushViewController:vc animated:YES];

    
//    if(![[NSFileManager defaultManager] fileExistsAtPath:object.thumbPath]){
//        //如果缩略图下跪了，点进看大图的时候再去下一把缩略图
//        __weak typeof(self) wself = self;
//        [[NIMSDK sharedSDK].resourceManager download:object.thumbUrl filepath:object.thumbPath progress:nil completion:^(NSError *error) {
//            if (!error) {
//                [wself uiUpdateMessage:message];
//            }
//        }];
//    }
}

- (void)showVideo:(NIMMessage *)message
{
    NIMVideoObject *object = message.messageObject;
    NIMSession *session = [self isMemberOfClass:[NTESSessionViewController class]]? self.session : nil;
    
    NTESVideoViewItem *item = [[NTESVideoViewItem alloc] init];
    item.path = object.path;
    item.url  = object.url;
    item.session = session;
    item.itemId  = object.message.messageId;
    
    NTESVideoViewController *playerViewController = [[NTESVideoViewController alloc] initWithVideoViewItem:item];
    [self.navigationController pushViewController:playerViewController animated:YES];
    if(![[NSFileManager defaultManager] fileExistsAtPath:object.coverPath]){
        //如果封面图下跪了，点进视频的时候再去下一把封面图
        __weak typeof(self) wself = self;
        [[NIMSDK sharedSDK].resourceManager download:object.coverUrl filepath:object.coverPath progress:nil completion:^(NSError *error) {
            if (!error) {
                [wself uiUpdateMessage:message];
            }
        }];
    }
}

- (void)showCustom:(NIMMessage *)message
{
   //普通的自定义消息点击事件可以在这里做哦~
    
    NIMCustomObject * cardObject = (NIMCustomObject*)message.messageObject;
    
    NSString *content = [cardObject.attachment encodeAttachment];
    NSData *dataaaaa = [content dataUsingEncoding:NSUTF8StringEncoding];
    if (dataaaaa) {
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:dataaaaa
                                                             options:0
                                                               error:nil];
        if ([dict isKindOfClass:[NSDictionary class]])
        {
            NSInteger type     = [[dict objectForKey:@"type"] intValue];
            NSDictionary *datatyl = [dict objectForKey:@"data"];
            if (type == 105) {
                NSString *type = [datatyl stringValueForKey:CMPersonCardtype defaultValue:kConstant_0];
                NSString *personCardId = [datatyl objectForKey:CMPersonCardId];
                if ([type boolValue]) {
                    BOOL isMyTeam = [[NIMSDK sharedSDK].teamManager isMyTeam:personCardId];
                    NIMTeam *team = [[NIMSDK sharedSDK].teamManager teamById:personCardId];
                    if (!team) {
                        [self.view makeToast:LangKey(@"group_info_activity_group_already_jiesan") duration:2.0 position:CSToastPositionCenter];
                        return;
                    }
                    if (isMyTeam) {
                        NIMSession *session = [NIMSession session:personCardId type:NIMSessionTypeTeam];
                        NTESSessionViewController *vc = [[NTESSessionViewController alloc] initWithSession:session];
                        [self.navigationController pushViewController:vc animated:YES];
                    } else {
                        [self onJionTeamWithTeam:team];
                    }
                } else {
                    NSLog(@"personCardIdpersonCardIdpersonCardIdpersonCardId:%@",personCardId);
                    NTESPersonalCardViewController *vc = [[NTESPersonalCardViewController alloc] initWithUserId:personCardId];
                    [self.navigationController pushViewController:vc animated:YES];
                }
            }
        }
    }
}

- (void)onJionTeamWithTeam:(NIMTeam *)team {
    __weak typeof(self) wself = self;
    
    if(team.joinMode == NIMTeamJoinModeNoAuth) {
        [self didApplyToTeamWithMessage:@"" WithTeam:team];
    } else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"输入验证信息".nim_localized delegate:nil cancelButtonTitle:LangKey(@"contact_tag_fragment_sure") otherButtonTitles:nil, nil];
        alert.alertViewStyle = UIAlertViewStylePlainTextInput;
        [alert showAlertWithCompletionHandler:^(NSInteger index) {
            NSString *message = [alert textFieldAtIndex:0].text ? : @"";
            [wself didApplyToTeamWithMessage:message WithTeam:team];
        }];
    }
    
}

- (void)handleApplyToTeam:(NSError *)error status:(NIMTeamApplyStatus)status WithId:(NSString *)cardId{
    if (!error) {
        switch (status) {
            case NIMTeamApplyStatusAlreadyInTeam:{
                NIMSession *session = [NIMSession session:cardId type:NIMSessionTypeTeam];
                NTESSessionViewController *vc = [[NTESSessionViewController alloc] initWithSession:session];
                [self.navigationController pushViewController:vc animated:YES];
                break;
            }
            case NIMTeamApplyStatusWaitForPass:
                [self.view makeToast:@"申请成功，等待验证".nim_localized duration:2.0 position:CSToastPositionCenter];
            default:
                break;
        }
    }else{
        switch (error.code) {
            case NIMRemoteErrorCodeTeamAlreadyIn:
            {
                //                [self.view makeToast:@"已经在群里" duration:2.0 position:CSToastPositionCenter];
                NIMSession *session = [NIMSession session:cardId type:NIMSessionTypeTeam];
                NTESSessionViewController *vc = [[NTESSessionViewController alloc] initWithSession:session];
                [self.navigationController pushViewController:vc animated:YES];
            }
                break;
            default:
                [self.view makeToast:@"群申请失败".nim_localized duration:2.0 position:CSToastPositionCenter];
                break;
        }
    }
}

- (void)didApplyToTeamWithMessage:(NSString *)message WithTeam:(NIMTeam *)team {
    
    __weak typeof(self) wself = self;

    [LEEAlert alert].config
        .LeeAddTitle(^(UILabel *label) {
            NSString *msg = [NSString stringWithFormat:@"%@: %@",LangKey(@"message_helper_apply_to_group"),team.teamName];
            label.text = msg;
            label.textColor = [UIColor grayColor];
        })
        .LeeAddAction(^(LEEAction *action) {
            
            action.type = LEEActionTypeCancel;
            action.title = LangKey(@"contact_tag_fragment_cancel");//@"取消"
            action.titleColor = [UIColor grayColor];
            action.backgroundColor = [UIColor whiteColor];
            action.backgroundHighlightColor = [UIColor colorWithRed:239/255.0f green:239/255.0f blue:239/255.0f alpha:1.0f];
            action.borderWidth = 1.0f;
            action.borderColor = action.backgroundHighlightColor;
            action.clickBlock = ^{
                
            };
        })
        .LeeAddAction(^(LEEAction *action) {
            
            action.type = LEEActionTypeDefault;
            action.title = LangKey(@"contact_tag_fragment_sure"); //@"确定";
            action.titleColor = [UIColor redColor];
            action.backgroundColor = [UIColor whiteColor];
            action.backgroundHighlightColor = [UIColor colorWithRed:239/255.0f green:239/255.0f blue:239/255.0f alpha:1.0f];
            action.borderWidth = 1.0f;
            action.borderColor = action.backgroundHighlightColor;
            action.clickBlock = ^{

                [SVProgressHUD show];
                [[NIMSDK sharedSDK].teamManager applyToTeam:team.teamId
                                                    message:message
                                                 completion:^(NSError *error,NIMTeamApplyStatus applyStatus) {
                    [SVProgressHUD dismiss];
                    [wself handleApplyToTeam:error status:applyStatus WithId:team.teamId];
                }];
            };
        })
        .LeeHeaderColor([UIColor whiteColor])
        .LeeShow();
}


- (void)openSafari:(NSString *)link
{
    NSURLComponents *components = [[NSURLComponents alloc] initWithString:link];
    if (components)
    {
        if (!components.scheme)
        {
            //默认添加 http
            components.scheme = @"http";
        }
        [[UIApplication sharedApplication] openURL:[components URL] options:@{} completionHandler:nil];
    }
}


#pragma mark - 导航按钮
- (void)enterPersonInfoCard:(id)sender
{
    NTESPersonalCardViewController *vc = [[NTESPersonalCardViewController alloc] initWithUserId:self.session.sessionId];
    [self.navigationController pushViewController:vc animated:YES];
    
}


- (void)showDeleteSureVCWithTitle:(NSString *)title confirmBlock:(void(^)(void))confirmBlock {
    UIAlertAction *sure = [UIAlertAction actionWithTitle:@"确定".ntes_localized style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (confirmBlock) {
            confirmBlock();
        }
    }];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消".ntes_localized
                                                     style:UIAlertActionStyleCancel
                                                   handler:nil];
    UIAlertController *sheet = [UIAlertController alertControllerWithTitle:title message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    [sheet addAction:sure];
    [sheet addAction:cancel];
    [self presentViewController:sheet animated:YES completion:nil];
}


- (void)enterTeamCard:(id)sender {
    BBBTeamCardViewController *vc = nil;
    BBBTeamCardViewControllerOption *option = [[BBBTeamCardViewControllerOption alloc] init];
    option.isTop = [NIMSDK.sharedSDK.chatExtendManager stickTopInfoForSession:self.session] != nil;

    if (self.session.sessionType == NIMSessionTypeTeam) {
        NIMTeam *team = [[NIMSDK sharedSDK].teamManager teamById:self.session.sessionId];
        if(team.type == NIMTeamTypeAdvanced){
            vc = [[CCCAdvancedTeamCardViewController alloc] initWithTeam:team
                                                                 session:self.session
                                                                  option:option];
            vc.delegate = self;
        }
    }
    if (vc) {
        [self.navigationController pushViewController:vc animated:YES];
    }
}

- (void)enterSuperTeamCard:(id)sender{
    
}

#pragma mark - 菜单
- (NSArray *)menusItems:(NIMMessage *)message
{
    NSMutableArray *items = [NSMutableArray array];
    NSArray *defaultItems = [super menusItems:message];
    if (defaultItems) {
        [items addObjectsFromArray:defaultItems];
    }
    
    if ([NTESSessionUtil canMessageBeForwarded:message]) {
        [items addObject:[[UIMenuItem alloc] initWithTitle:LangKey(@"转发") action:@selector(forwardMessage:)]];
        [items addObject:[[UIMenuItem alloc] initWithTitle:@"多选".ntes_localized action:@selector(multiSelect:)]];
    }
    
    if ([NTESSessionUtil canMessageBeRevoked:message]) {
        [items addObject:[[UIMenuItem alloc] initWithTitle:LangKey(@"撤回") action:@selector(revokeMessage:)]];
    }
    
    return items;
    
}

- (void)cancelMessage:(id)sender {
    NIMMessage *message = [self messageForMenu];

    [[NIMSDK sharedSDK].chatManager cancelSendingMessage:message];
}

- (void)audio2Text:(id)sender
{
//    NIMMessage *message = [self messageForMenu];
//    __weak typeof(self) wself = self;
//    NTESAudio2TextViewController *vc = [[NTESAudio2TextViewController alloc] initWithMessage:message];
//    vc.completeHandler = ^(void){
//        [wself uiUpdateMessage:message];
//    };
//    [self presentViewController:vc
//                       animated:YES
//                     completion:nil];
}

- (void)deleteMsg:(id)sender
{
    NIMMessage *message    = [self messageForMenu];
    BOOL deleteFromServer = [NTESBundleSetting sharedConfig].isDeleteMsgFromServer;
    if (deleteFromServer)
    {
        __weak typeof(self) wSelf = self;
        [[NIMSDK sharedSDK].conversationManager deleteMessageFromServer:message
                                                                    ext:@"扩展字段"
                                                             completion:^(NSError * _Nullable error)
        {
            if (error)
            {
                return;
            }
            
            [wSelf uiDeleteMessage:message];
        }];
    }
    else
    {
        [self uiDeleteMessage:message];
        [[NIMSDK sharedSDK].conversationManager deleteMessage:message];
    }
    
}

#pragma mark - 转发
- (void)doMergerForwardToSession:(NIMSession *)session {
    __weak typeof(self) weakSelf = self;
    NTESMergeForwardTask *task = [_mergeForwardSession forwardTaskWithMessages:_selectedMessages process:nil completion:^(NSError * _Nonnull error, NIMMessage * _Nonnull message) {
        if (error) {
            NSString *msg = [NSString stringWithFormat:@"%@：%zd",@"消息合并转发失败".ntes_localized, error.code];
            [weakSelf.view makeToast:msg duration:2.0 position:CSToastPositionCenter];
        } else {
            [weakSelf forwardMessage:message toSession:session];
        }
    }];
    [task resume];
}

- (void)switchUIWithSessionState:(NIMKitSessionState)state {
    switch (state) {
        case NIMKitSessionStateSelect:
        {
            [self setupSelectedNav];
            [self setSessionState:NIMKitSessionStateSelect];
            [self.view addSubview:self.mulSelectedSureBar];
            break;
        }
        case NIMKitSessionStateNormal:
        default:
        {
            [self.mulSelectedSureBar removeFromSuperview];
            [self setSessionState:NIMKitSessionStateNormal];
            [self setupNormalNav];
            _selectedMessages = nil;
            break;
        }
    }
}

- (void)cancelSelected:(id)sender {
    [self switchUIWithSessionState:NIMKitSessionStateNormal];
}

- (void)confirmSelected:(id)sender {
    __weak typeof(self) weakSelf = self;
    [self selectForwardSessionCompletion:^(NIMSession *targetSession) {
        //转发批量消息
        [weakSelf doMergerForwardToSession:targetSession];
        //返回正常页面
        [weakSelf switchUIWithSessionState:NIMKitSessionStateNormal];
    }];
}

- (void)confirmDelete:(id)sender
{
    [self showDeleteSureVCWithTitle:@"确定删除？".ntes_localized confirmBlock:^{
        [NIMSDK.sharedSDK.conversationManager deleteRemoteMessages:_selectedMessages
                                                              exts: nil
                                                        completion:^(NSError * _Nullable error) {
            [self.view makeToast:error.localizedDescription ?: @"删除成功".ntes_localized];
            if (!error) {
                [self.interactor resetMessages:^(NSError *error) {
                    [self switchUIWithSessionState:NIMKitSessionStateNormal];
                }];
            }
        }];
    }];
}

- (void)multiSelect:(id)sender {
    [self switchUIWithSessionState:NIMKitSessionStateSelect];
}

- (void)forwardMessage:(id)sender
{
    NIMMessage *message = [self messageForMenu];
    message.setting.teamReceiptEnabled = NO;
    
    
//    __weak typeof(self) weakSelf = self;
//    [self selectForwardSessionCompletion:^(NIMSession *targetSession) {
//        [weakSelf forwardMessage:message toSession:targetSession];
//    }];
    
    NIMContactFriendSelectConfig *config = [[NIMContactFriendSelectConfig alloc] init];
    config.needMutiSelected = NO;
    AAAContactSelectViewController *vc = [[AAAContactSelectViewController alloc] initWithConfig:config];
    vc.finshBlock = ^(NSArray *array, NSString *name, UIImage *avater){
        NSString *userId = array.firstObject;
        NIMSession *session = [NIMSession session:userId type:NIMSessionTypeP2P];
        [self forwardMessage:message toSession:session];
    };
    [vc show];
}

- (void)selectForwardSessionCompletion:(void (^)(NIMSession *targetSession))completion {
    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:LangKey(@"选择会话类型") delegate:nil cancelButtonTitle:LangKey(@"friend_circle_adapter_cancel") destructiveButtonTitle:nil otherButtonTitles:LangKey(@"watch_multiretweet_activity_person"), LangKey(@"contact_fragment_group"), LangKey(@"message_super_team"), nil];
    [sheet showInView:self.view completionHandler:^(NSInteger index) {
        switch (index) {
            case 0:{
                NIMContactFriendSelectConfig *config = [[NIMContactFriendSelectConfig alloc] init];
                config.needMutiSelected = NO;
                AAAContactSelectViewController *vc = [[AAAContactSelectViewController alloc] initWithConfig:config];
                vc.finshBlock = ^(NSArray *array, NSString *name, UIImage *avater){
                    NSString *userId = array.firstObject;
                    NIMSession *session = [NIMSession session:userId type:NIMSessionTypeP2P];
                    if (completion) {
                        completion(session);
                    }
                };
                [vc show];
            }
                break;
            case 1:{
                NIMContactTeamSelectConfig *config = [[NIMContactTeamSelectConfig alloc] init];
                config.teamType = NIMKitTeamTypeNomal;
                AAAContactSelectViewController *vc = [[AAAContactSelectViewController alloc] initWithConfig:config];
                vc.finshBlock = ^(NSArray *array, NSString *name, UIImage *avater){
                    NSString *teamId = array.firstObject;
                    NIMSession *session = [NIMSession session:teamId type:NIMSessionTypeTeam];
                    if (completion) {
                        completion(session);
                    }
                };
                [vc show];
            }
                break;
            case 2: {
                NIMContactTeamSelectConfig *config = [[NIMContactTeamSelectConfig alloc] init];
                config.teamType = NIMKitTeamTypeSuper;
                AAAContactSelectViewController *vc = [[AAAContactSelectViewController alloc] initWithConfig:config];
                vc.finshBlock = ^(NSArray *array, NSString *name, UIImage *avater){
                    NSString *teamId = array.firstObject;
                    NIMSession *session = [NIMSession session:teamId type:NIMSessionTypeSuperTeam];
                    if (completion) {
                        completion(session);
                    }
                };
                [vc show];
            }
                break;
            default:
                break;
        }
    }];
}


- (void)revokeMessage:(id)sender
{
    NIMMessage *message = [self messageForMenu];
    
    __weak typeof(self) weakSelf = self;
    NSString *collapseId = message.apnsPayload[@"apns-collapse-id"];
    NSDictionary *payload = @{
        @"apns-collapse-id": collapseId ? : @"",
    };
 
    [[NIMSDK sharedSDK].chatManager revokeMessage:message
                                      apnsContent:@"撤回一条消息"
                                      apnsPayload:payload
                                  shouldBeCounted:![[NTESBundleSetting sharedConfig] isIgnoreRevokeMessageCount]
                                         completion:^(NSError * _Nullable error)
    {
        if (error) {
            if (error.code == NIMRemoteErrorCodeDomainExpireOld) {
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"发送时间超过2分钟的消息，不能被撤回".ntes_localized delegate:nil cancelButtonTitle:@"确定".ntes_localized otherButtonTitles:nil, nil];
                [alert show];
            } else {
                [weakSelf.view makeToast:@"消息撤回失败，请重试".ntes_localized duration:2.0 position:CSToastPositionCenter];
            }
        } else {
            BBBMessageModel *model = [weakSelf uiDeleteMessage:message];
            NIMMessage *tip = [NTESSessionMsgConverter msgWithTip:[NTESSessionUtil tipOnMessageRevoked:nil]];
            tip.timestamp = model.messageTime;
            //[weakSelf uiInsertMessages:@[tip]];//撤回消息不显示
            
            tip.timestamp = message.timestamp;
            // saveMessage 方法执行成功后会触发 onRecvMessages: 回调，但是这个回调上来的 NIMMessage 时间为服务器时间，和界面上的时间有一定出入，所以要提前先在界面上插入一个和被删消息的界面时间相符的 Tip, 当触发 onRecvMessages: 回调时，组件判断这条消息已经被插入过了，就会忽略掉。
            [[NIMSDK sharedSDK].conversationManager saveMessage:tip forSession:message.session completion:nil];//撤回消息不显示
        }
    }];
}

 - (void)forwardMessage:(NIMMessage *)message toSession:(NIMSession *)session
{
    NSString *name;
    if (session.sessionType == NIMSessionTypeP2P) {
        BBBKitInfoFetchOption *option = [[BBBKitInfoFetchOption alloc] init];
        option.session = session;
        name = [[AppleProjectKit sharedKit] infoByUser:session.sessionId option:option].showName;
    }
    else if (session.sessionType == NIMSessionTypeTeam) {
        name = [[AppleProjectKit sharedKit] infoByTeam:session.sessionId option:nil].showName;
    }
    else if (session.sessionType == NIMSessionTypeSuperTeam) {
        name = [[AppleProjectKit sharedKit] infoBySuperTeam:session.sessionId option:nil].showName;
    }
    else {
    }
    NSString *tip = [NSString stringWithFormat:@"%@ %@ ?", @"确认转发给".ntes_localized, name];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"确认转发".ntes_localized message:tip delegate:nil cancelButtonTitle:@"取消".ntes_localized otherButtonTitles:@"确认".ntes_localized, nil];
    
    __weak typeof(self) weakSelf = self;
    [alert showAlertWithCompletionHandler:^(NSInteger index) {
        if(index == 1)
        {
            NSError *error = nil;
            if (message.session) {
                [[NIMSDK sharedSDK].chatManager forwardMessage:message toSession:session error:&error];
            } else {
                [[NIMSDK sharedSDK].chatManager sendMessage:message toSession:session error:&error];
            }
            
            if (error) {
                NSString *msg = [NSString stringWithFormat:@"%@.code:%zd", @"转发失败".ntes_localized, error.code];
                [weakSelf.view makeToast:msg duration:2.0 position:CSToastPositionCenter];
            } else {
                [weakSelf.view makeToast:@"已发送".ntes_localized duration:2.0 position:CSToastPositionCenter];
            }
        }
    }];
}


- (BOOL)checkRTSCondition
{
    BOOL result = YES;
    
    if (![[Reachability reachabilityForInternetConnection] isReachable])
    {
        [self.view makeToast:@"请检查网络".ntes_localized duration:2.0 position:CSToastPositionCenter];
        result = NO;
    }
    NSString *currentAccount = [[NIMSDK sharedSDK].loginManager currentAccount];
    if (self.session.sessionType == NIMSessionTypeP2P && [currentAccount isEqualToString:self.session.sessionId])
    {
        [self.view makeToast:@"不能和自己通话哦".ntes_localized duration:2.0 position:CSToastPositionCenter];
        result = NO;
    }
    if (self.session.sessionType == NIMSessionTypeTeam)
    {
        NIMTeam *team = [[NIMSDK sharedSDK].teamManager teamById:self.session.sessionId];
        NSInteger memberNumber = team.memberNumber;
        if (memberNumber < 2)
        {
            [self.view makeToast:@"无法发起，群人数少于2人".ntes_localized duration:2.0 position:CSToastPositionCenter];
            result = NO;
        }
    }
    if (self.session.sessionType == NIMSessionTypeSuperTeam)
    {
        NIMTeam *team = [[NIMSDK sharedSDK].superTeamManager teamById:self.session.sessionId];
        NSInteger memberNumber = team.memberNumber;
        if (memberNumber < 2)
        {
            [self.view makeToast:@"无法发起，群人数少于2人".ntes_localized duration:2.0 position:CSToastPositionCenter];
            result = NO;
        }
    }
    return result;
}

- (NSDictionary *)cellActions
{
    static NSDictionary *actions = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        actions = @{@(NIMMessageTypeImage) :    @"showImage:",
                    @(NIMMessageTypeVideo) :    @"showVideo:",
                    @(NIMMessageTypeLocation) : @"showLocation:",
                    @(NIMMessageTypeFile)  :    @"showFile:",
                    @(NIMMessageTypeCustom):    @"showCustom:"};
    });
    return actions;
}

- (BBBKitMediaFetcher *)mediaFetcher
{
    if (!_mediaFetcher) {
        _mediaFetcher = [[BBBKitMediaFetcher alloc] init];
        _mediaFetcher.limit = 1;
        _mediaFetcher.mediaTypes = @[(NSString *)kUTTypeImage, (NSString *)kUTTypeGIF];
    }
    return _mediaFetcher;
}

- (void)setupNormalNav {
    
    UIButton *enterTeamCard = [UIButton buttonWithType:UIButtonTypeCustom];
    [enterTeamCard addTarget:self action:@selector(enterTeamCard:) forControlEvents:UIControlEventTouchUpInside];
    [enterTeamCard setImage:[UIImage imageNamed:@"more_icon"] forState:UIControlStateNormal];
    [enterTeamCard setImage:[UIImage imageNamed:@"icon_session_info_pressed"] forState:UIControlStateHighlighted];
    [enterTeamCard sizeToFit];
    UIBarButtonItem *enterTeamCardItem = [[UIBarButtonItem alloc] initWithCustomView:enterTeamCard];

    UIButton *enterSuperTeamCard = [UIButton buttonWithType:UIButtonTypeCustom];
    [enterSuperTeamCard addTarget:self action:@selector(enterSuperTeamCard:) forControlEvents:UIControlEventTouchUpInside];
    [enterSuperTeamCard setImage:[UIImage imageNamed:@"more_icon"] forState:UIControlStateNormal];
    [enterSuperTeamCard sizeToFit];
    UIBarButtonItem *enterSuperTeamCardItem = [[UIBarButtonItem alloc] initWithCustomView:enterSuperTeamCard];

    UIButton *infoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [infoBtn addTarget:self action:@selector(enterPersonInfoCard:) forControlEvents:UIControlEventTouchUpInside];
    [infoBtn setImage:[UIImage imageNamed:@"more_icon"] forState:UIControlStateNormal];
    [infoBtn sizeToFit];
    UIBarButtonItem *enterUInfoItem = [[UIBarButtonItem alloc] initWithCustomView:infoBtn];

    UIButton *historyBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [historyBtn addTarget:self action:@selector(enterHistory:) forControlEvents:UIControlEventTouchUpInside];
    [historyBtn setImage:[UIImage imageNamed:@"icon_history_normal"] forState:UIControlStateNormal];
    [historyBtn sizeToFit];
    //UIBarButtonItem *historyButtonItem = [[UIBarButtonItem alloc] initWithCustomView:historyBtn];

    enterTeamCardItem.tintColor = [UIColor whiteColor];
    enterUInfoItem.tintColor = [UIColor whiteColor];
    enterSuperTeamCardItem.tintColor = [UIColor whiteColor];

    if (self.session.sessionType == NIMSessionTypeTeam)
    {
        self.navigationItem.rightBarButtonItems  = @[enterTeamCardItem];
    }
    else if (self.session.sessionType == NIMSessionTypeSuperTeam)
    {
        self.navigationItem.rightBarButtonItems  = @[enterSuperTeamCardItem];
    }
    else if(self.session.sessionType == NIMSessionTypeP2P)
    {
        if ([self.session.sessionId isEqualToString:[[NIMSDK sharedSDK].loginManager currentAccount]])
        {
            //self.navigationItem.rightBarButtonItems = @[historyButtonItem];
        }
        else
        {
            self.navigationItem.rightBarButtonItems = @[enterUInfoItem];
        }
    }
    self.navigationItem.leftBarButtonItem.customView.hidden = NO;
    self.navigationItem.hidesBackButton = NO;
    [self.mulSelectCancelBtn removeFromSuperview];
}

- (void)setupSelectedNav {
    self.navigationItem.rightBarButtonItems = nil;
    self.navigationItem.leftBarButtonItem.customView.hidden = YES;
    self.navigationItem.hidesBackButton = YES;
    [self.navigationController.navigationBar addSubview:self.mulSelectCancelBtn];
}

- (BOOL)shouldAutorotate{
    return !self.currentSingleSnapView;
}

- (NTESMulSelectFunctionBar *)mulSelectedSureBar {
    if (!_mulSelectedSureBar) {
        _mulSelectedSureBar = [[NTESMulSelectFunctionBar alloc] initWithFrame:self.sessionInputView.frame];
        [_mulSelectedSureBar.sureBtn addTarget:self
                                        action:@selector(confirmSelected:)
                              forControlEvents:UIControlEventTouchUpInside];
        [_mulSelectedSureBar.deleteButton addTarget:self
                                             action:@selector(confirmDelete:)
                                   forControlEvents:UIControlEventTouchUpInside];
    }
    return _mulSelectedSureBar;
}

- (UIButton *)mulSelectCancelBtn {
    if (!_mulSelectCancelBtn) {
        UIButton *cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [cancelBtn addTarget:self action:@selector(cancelSelected:) forControlEvents:UIControlEventTouchUpInside];
        [cancelBtn setTitle:@"取消".ntes_localized forState:UIControlStateNormal];
        [cancelBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        cancelBtn.frame = CGRectMake(0, 0, 48, 40);
        UIEdgeInsets titleInsets = cancelBtn.titleEdgeInsets;
        [cancelBtn setTitleEdgeInsets:titleInsets];
        cancelBtn.titleLabel.font = [UIFont systemFontOfSize:13.0];
        _mulSelectCancelBtn = cancelBtn;
    }
    return _mulSelectCancelBtn;
}



- (BOOL)shouldShowMenuByMessage:(NIMMessage *)message
{
    id<NIMMessageObject> messageObject = message.messageObject;
    
    
    if (message.session.sessionType == NIMSessionTypeChatroom ||
        message.messageType == NIMMessageTypeTip ||
        message.messageType == NIMMessageTypeNotification ||
        [self cancelMenuByMessageObject:messageObject])
    {
        return NO;
    }
    return YES;
}

- (BOOL)cancelMenuByMessageObject:(id<NIMMessageObject>) object
{
    if ([object isKindOfClass:[NIMCustomObject class]])
    {
        NIMCustomObject *custom = object;
        id<NIMCustomAttachment>  attachment = custom.attachment;
        if ([attachment isKindOfClass:[NTESWhiteboardAttachment class]])
        {
            return YES;
        }
    }
    return NO;
}


- (UILabel *)invalid_tip {
    if (!_invalid_tip) {
        _invalid_tip = [[UILabel alloc] initWithFrame:CGRectMake(0, SCREEN_TOP_HEIGHT, SCREEN_WIDTH, 50)];
        _invalid_tip.backgroundColor = TextColor_yellow_2;
        _invalid_tip.textColor = TextColor_yellow;
        _invalid_tip.text = LangKey(@"app_team_invalid_tip"); //
        _invalid_tip.textAlignment = NSTextAlignmentCenter;
        _invalid_tip.hidden = YES;

        [self.view addSubview:_invalid_tip];
    }
    return _invalid_tip;
}

- (ZMONTranslateView *)translateView
{
    if(!_translateView){
        _translateView = [[ZMONTranslateView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        _translateView.delegate = self;
    }
    return  _translateView;
}

- (void)didTouchSubmitContentButton:(NSString *)reason
{
    NIMMessage *message = [self messageForMenu];
    self.userId = message.from;
    BOOL isMyFriend = [[NIMSDK sharedSDK].userManager isMyFriend:self.userId];
    
    if(isMyFriend){
        [self.view addSubview:self.reprotNextView];
        [self.reprotNextView animationShow];
    }else{
        [self.view addSubview:self.reprotHisNextView];
        [self.reprotHisNextView animationShow];
    }
    
        NSMutableDictionary *dict = @{}.mutableCopy;
        dict[@"contact"] = reason;
        [ZCHttpManager postWithUrl:Server_other_feedback params:dict isShow:NO success:^(id responseObject) {
//            [SVProgressHUD showMessage:LangKey(@"report_sucessed")];
        } failed:^(id responseObject, NSError *error) {
        }];
    
}

- (ZMONReportNextView *)reprotNextView
{
    if(!_reprotNextView){
        _reprotNextView  = [[ZMONReportNextView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        _reprotNextView.delegate = self;
    }
    return _reprotNextView;

}
- (void)didTouchBlackButton
{
    [self.view addSubview:self.reprotBlackView];
//    self.reprotBlackView.userID = self.userId;
    [self.reprotBlackView animationShow];
    @weakify(self)
    self.reprotBlackView.speiceBackBlock = ^(NSString *Name){
        @strongify(self)
        [[NIMSDK sharedSDK].userManager addToBlackList:self.userId completion:^(NSError *error) {
       
                   if (!error) {
                       [self.view makeToast:LangKey(@"group_chat_avatar_activity_add_black_success") duration:2.0f position:CSToastPositionCenter];
                   }else{
                       [self.view makeToast:LangKey(@"black_list_activity_add_black_failed") duration:2.0f position:CSToastPositionCenter];
       
                   }
        }];
        

        NIMDeleteRecentSessionOption *option = [[NIMDeleteRecentSessionOption alloc] init];
        option.isDeleteRoamMessage = YES;
        NIMSession *session = [NIMSession session:self.userId type:NIMSessionTypeP2P];
        NIMRecentSession *recent = [[NIMSDK sharedSDK].conversationManager recentSessionBySession:session];
        [[[NIMSDK sharedSDK] conversationManager] deleteRecentSession:recent option:option completion:^(NSError * _Nullable error) {
        }];
        
        if (self.session.sessionType == NIMSessionTypeP2P) {
            [self.navigationController popToRootViewControllerAnimated:YES];
        }
        
    };
}
- (void)didTouchDeleteButton
{
    [self.view addSubview:self.reprotDeleteView];
//    self.reprotDeleteView.userID = self.userId
    [self.reprotDeleteView animationShow];
    @weakify(self)
    self.reprotDeleteView.speiceBackBlock = ^(NSString *Name){
        @strongify(self)
        [[NIMSDK sharedSDK].userManager deleteFriend:self.userId
                                         removeAlias:[[NTESBundleSetting sharedConfig] autoRemoveAlias]
                                          completion:^(NSError *error) {

            if (!error) {
                [self.view makeToast:LangKey(@"contact_tag_fragment_delete_success") duration:2.0f position:CSToastPositionCenter];
            }else{
                [self.view makeToast:LangKey(@"friend_delete_fail") duration:2.0f position:CSToastPositionCenter];
            }
        }];
        

        NIMDeleteRecentSessionOption *option = [[NIMDeleteRecentSessionOption alloc] init];
        option.isDeleteRoamMessage = YES;
        NIMSession *session = [NIMSession session:self.userId type:NIMSessionTypeP2P];
        NIMRecentSession *recent = [[NIMSDK sharedSDK].conversationManager recentSessionBySession:session];
        [[[NIMSDK sharedSDK] conversationManager] deleteRecentSession:recent option:option completion:^(NSError * _Nullable error) {
        }];
        
       
        
        if (self.session.sessionType == NIMSessionTypeP2P) {
            [self.navigationController popToRootViewControllerAnimated:YES];
            
//            NIMSessionDeleteAllRemoteMessagesOptions *options = [[NIMSessionDeleteAllRemoteMessagesOptions alloc] init];
//            options.removeOtherClients = YES;
//            [NIMSDK.sharedSDK.conversationManager deleteAllRemoteMessagesInSession:self.session options:options completion:^(NSError * _Nullable error) {
//                if (error) {
//                    return;
//                }
//                [self.navigationController popToRootViewControllerAnimated:YES];
//
//            }];
        }
        
        
    };
}

- (ZMONReportBlackView *)reprotBlackView
{
    if(!_reprotBlackView){
        _reprotBlackView  = [[ZMONReportBlackView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    }
    return _reprotBlackView;

}

- (ZMONReportDeleteView *)reprotDeleteView
{
    if(!_reprotDeleteView){
        _reprotDeleteView  = [[ZMONReportDeleteView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    }
    return _reprotDeleteView;
}

- (ZMONReportHisView *)reprotHisNextView
{
    if(!_reprotHisNextView){
        _reprotHisNextView  = [[ZMONReportHisView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        _reprotHisNextView.delegate = self;
    }
    return _reprotHisNextView;

}


@end
