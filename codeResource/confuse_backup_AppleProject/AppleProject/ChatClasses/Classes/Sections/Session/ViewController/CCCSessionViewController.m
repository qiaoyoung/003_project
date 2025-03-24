//
//  CCCSessionViewController.m
// AppleProjectKit
//
//  Created by NetEase.
//  Copyright (c) 2015年 NetEase. All rights reserved.
//

#import "CCCSessionConfigurateProtocol.h"
#import "AppleProjectKit.h"
#import "CCCMessageCellProtocol.h"
#import "BBBMessageModel.h"
#import "AAAKitUtil.h"
#import "BBBBadgeView.h"
#import "UITableView+NIMScrollToBottom.h"
#import "CCCMessageMaker.h"
#import "UIViewNimKit.h"
#import "CCCSessionConfigurator.h"
#import "BBBKitInfoFetchOption.h"
#import "BBBKitTitleView.h"
#import "BBBKitKeyboardInfo.h"
#import "AAAReplyContentView.h"
#import "CCCKitDependency.h"
#import "AAAKitQuickCommentUtil.h"
#import "CCCBubbleMenuView.h"
#import "CCCTextView.h"
#import "CCCAppDelegate.h"
#import "NSObject+tyl_internalIdentifier.h"
#import "CCCBubbleMenuView.h"
#import "CCCBubbleButtonModel.h"
#import "CCCInputEmoticonDefine.h"
#import "KEKEInputAudioView.h"
#import "UIView+NTES.h"
#import "NTESPersonalCardViewController.h"
#import "BBBTeamCardViewController.h"
#import "CCCAdvancedTeamCardViewController.h"
#import "SSZipArchiveManager.h"


@interface CCCSessionViewController ()<NIMMediaManagerDelegate,NIMInputDelegate,BBBTeamCardViewControllerDelegate,NIMConversationManagerDelegate>

@property (nonatomic,readwrite) NIMMessage *messageForMenu;

@property (nonatomic,strong)    UILabel *titleLabel;

@property (nonatomic,strong)    UILabel *subTitleLabel;

@property (nonatomic,strong)    NSIndexPath *lastVisibleIndexPathBeforeRotation;

@property (nonatomic,strong)    CCCSessionConfigurator *configurator;

@property (nonatomic,strong)    UITapGestureRecognizer *tableViewTapGesture;

@property (nonatomic,assign) NSInteger sessionUnreadCount;
@property (nonatomic,strong) BBBBadgeView *badgeView;
@property (nonatomic,strong) UIImageView *headerImage;
@property (nonatomic,strong) UILabel *labtitle;
@property (nonatomic,strong) UILabel *subtitle;

@property (nonatomic, strong)  UIView *topview;
@property (nonatomic, strong)   KEKEInputAudioView *audioContent;

@end

@implementation CCCSessionViewController

- (instancetype)initWithSession:(NIMSession *)session{
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        _session = session;
    }
    return self;
}

- (void)dealloc
{
    [self removeListener];
    
    _tableView.delegate = nil;
    _tableView.dataSource = nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"chating_bg"]];
        UIImageView *bg = [[UIImageView alloc]initWithFrame:self.view.bounds];
        bg.image = [UIImage imageNamed:@"chating_bg"];
        [self.view addSubview:bg];
    
    UIView *bottomview = [[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT-SCREEN_BOTTOM_HEIGHT, SCREEN_WIDTH, SCREEN_BOTTOM_HEIGHT)];
    bottomview.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:bottomview];
    
    //消息 tableView
    [self setupTableView];
    //导航栏
    [self setupNav];
    
    //输入框 inputView
    [self setupInputView];
    //会话相关逻辑配置器安装
    [self setupConfigurator];
    //进入会话时，标记所有消息已读，并发送已读回执
    [self markRead];
    //更新已读位置
    
     dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
         [self setBanned];
     });
    
//    [[NIMSDK sharedSDK].conversationManager addDelegate:self];
    
    // 执行设置回调监听
//    [NERtcCallKit.sharedInstance addDelegate:self];
 }

//- (void)onInvited:(NSString *)invitor
//          userIDs:(NSArray<NSString *> *)userIDs
//      isFromGroup:(BOOL)isFromGroup
//          groupID:(nullable NSString *)groupID
//             type:(NERtcCallType)type
//       attachment:(nullable NSString *)attachment
//{
//    ZMONVideoCallViewController *vc = [[ZMONVideoCallViewController alloc] init];
//    vc.isInvait = YES;
//    vc.userId = invitor;
//    vc.roomId = self.session.sessionId;
//    [self.navigationController pushViewController:vc animated:YES];
//}

 - (void)setBanned {
     NIMSessionType type = self.session.sessionType;
     switch (type) {
         case NIMSessionTypeTeam:{
             NIMTeam *team = [[[NIMSDK sharedSDK] teamManager] teamById:self.session.sessionId];
             if (team.inAllMuteMode) {
                 if (team.allMuteMode == NIMTeamAllMuteModeMuteNormal || team.allMuteMode == NIMTeamAllMuteModeMuteAll) {
                     NSString *userID = [NIMSDK sharedSDK].loginManager.currentAccount;
                     NIMTeamMember *member = [[NIMSDK sharedSDK].teamManager teamMember:userID inTeam:self.session.sessionId];
                     if (member.isMuted) {
                         [self setInputViewPlaceholder:YES];
                     }
                 }
             }
         }
             break;

             break;
         case NIMSessionTypeSuperTeam: {
             NIMTeam *team = [[[NIMSDK sharedSDK] superTeamManager] teamById:self.session.sessionId];
             if (team.inAllMuteMode) {
                 if (team.allMuteMode == NIMTeamAllMuteModeMuteNormal || team.allMuteMode == NIMTeamAllMuteModeMuteAll) {
                     NSString *userID = [NIMSDK sharedSDK].loginManager.currentAccount;
                     NIMTeamMember *member = [[NIMSDK sharedSDK].teamManager teamMember:userID inTeam:self.session.sessionId];
                     if (member.isMuted) {
                         [self setInputViewPlaceholder:YES];
                     }
                 }
             }
         }
         default:
             break;
     }
 }

#pragma mark - NIMConversationManagerDelegate
- (void)didAddRecentSession:(NIMRecentSession *)recentSession
           totalUnreadCount:(NSInteger)totalUnreadCount{
    self.sessionUnreadCount = totalUnreadCount;
    [self refreshSessionBadge];
//    [self changeUnreadCount:recentSession totalUnreadCount:totalUnreadCount];
}


- (void)didUpdateRecentSession:(NIMRecentSession *)recentSession
              totalUnreadCount:(NSInteger)totalUnreadCount{
    self.sessionUnreadCount = totalUnreadCount;
    [self refreshSessionBadge];
//    [self changeUnreadCount:recentSession totalUnreadCount:totalUnreadCount];

}


- (void)didRemoveRecentSession:(NIMRecentSession *)recentSession totalUnreadCount:(NSInteger)totalUnreadCount{
    self.sessionUnreadCount = totalUnreadCount;
    [self refreshSessionBadge];
//    [self changeUnreadCount:recentSession totalUnreadCount:totalUnreadCount];
}

- (void)messagesDeletedInSession:(NIMSession *)session{
    self.sessionUnreadCount = [NIMSDK sharedSDK].conversationManager.allUnreadCount;
    [self refreshSessionBadge];
    [self.interactor resetMessages:nil];
    [self.tableView reloadData];
}

- (void)allMessagesDeleted{
    self.sessionUnreadCount = 0;
    [self refreshSessionBadge];
}

- (void)allMessagesRead
{
    self.sessionUnreadCount = 0;
    [self refreshSessionBadge];
}

- (void)onBatchMarkMessagesReadInSessions:(NSArray<NIMSession *> *)sessions
{
    self.sessionUnreadCount = [NIMSDK sharedSDK].conversationManager.allUnreadCount;
    [self refreshSessionBadge];
}


- (void)refreshSessionBadge
{
  
    if(self.sessionUnreadCount>0){
        _badgeView.badgeValue = self.sessionUnreadCount ? @(self.sessionUnreadCount).stringValue : nil;
        _badgeView.hidden = NO;
        _labtitle.frame = CGRectMake(_badgeView.right+10, SCREEN_STATUS_HEIGHT, 100, 40);
    }
    else{
        _badgeView.hidden = YES;
        _labtitle.frame = CGRectMake(65, SCREEN_STATUS_HEIGHT, 200, 40);
    }
}

- (void)setupNav
{
    _topview = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_TOP_HEIGHT)];
//    _topview.backgroundColor = [UIColor colorWithRed:216/255.0 green:242/255.0 blue:253/255.0 alpha:1];
    [self.view addSubview:_topview];
    
    UIImageView *bg = [[UIImageView alloc]initWithFrame:_topview.bounds];
    bg.image = [UIImage imageNamed:@"chating_top_bg"];
    [_topview addSubview:bg];
    
    
    
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(15, SCREEN_STATUS_HEIGHT, 40, 40);
    [backBtn addTarget:self action:@selector(gotoBack:) forControlEvents:UIControlEventTouchUpInside];
    [backBtn setImage:[UIImage imageNamed:@"back_arrow_bl"] forState:UIControlStateNormal];
    [_topview addSubview:backBtn];
    
//    NSString *userID = self.session.sessionId;
//    NIMUser *me = [[NIMSDK sharedSDK].userManager userInfo:userID];
//    CCCKitInfo *info = [[AppleProjectKit sharedKit] infoByUser:userID option:nil];

    self.sessionUnreadCount = [NIMSDK sharedSDK].conversationManager.allUnreadCount;

     _badgeView = [BBBBadgeView viewWithBadgeTip:@""];
    _badgeView.frame = CGRectMake(backBtn.right+5, backBtn.top+8, 24, 24);
    [_topview addSubview:_badgeView];
    _badgeView.badgeValue = self.sessionUnreadCount ? @(self.sessionUnreadCount).stringValue : nil;
    
//    UILabel *labbadge = [[UILabel alloc]initWithFrame:CGRectMake(backBtn.right+5, backBtn.top+8, 24, 24)];
//    labbadge.backgroundColor = [UIColor redColor];
//    labbadge.layer.masksToBounds = YES;
//    labbadge.layer.cornerRadius = 12;
//    labbadge.textColor = [UIColor whiteColor];
//    labbadge.textAlignment = NSTextAlignmentCenter;
//    labbadge.font = [UIFont systemFontOfSize:12];
//    labbadge.text = @(self.sessionUnreadCount).stringValue;
//    [topview addSubview:labbadge];
    
//   _headerImage = [[UIImageView alloc] initWithFrame:CGRectMake(_badgeView.right+10, SCREEN_STATUS_HEIGHT, 40, 40)];
//    [topview addSubview:_headerImage];
//    _headerImage.layer.cornerRadius = 20;
//    _headerImage.layer.shadowColor = RGB_COLOR_String(kCommonBGColor_All).CGColor;
//    _headerImage.layer.shadowOffset = CGSizeMake(5, 5);
//    _headerImage.layer.masksToBounds = YES;
//    [_headerImage sd_setImageWithURL:[NSURL URLWithString:me.userInfo.avatarUrl] placeholderImage:info.avatarImage];
    
    _labtitle = [[UILabel alloc]initWithFrame:CGRectMake(backBtn.right+10, SCREEN_STATUS_HEIGHT, 200, 40)];
    _labtitle.textColor = [UIColor blackColor];
    _labtitle.font = [UIFont boldSystemFontOfSize:16];
    _labtitle.text = self.sessionTitle;
    [_topview addSubview:_labtitle];
    
//    _subtitle = [[UILabel alloc]initWithFrame:CGRectMake(_headerImage.right+10, _labtitle.bottom, 100, 20)];
//    _subtitle.textColor = RGB_COLOR_String(@"777777");
//    _subtitle.font = [UIFont boldSystemFontOfSize:12];
//    _subtitle.text = self.sessionSubTitle;
//    [topview addSubview:_subtitle];
//    if([self.sessionSubTitle isEqualToString:@"离线".ntes_localized]){
//        self.subtitle.textColor = RGB_COLOR_String(@"777777");
//    }else{
//        self.subtitle.textColor = RGB_COLOR_String(@"#00B01B");
//    }
    
  
    
    if (self.session.sessionType == NIMSessionTypeTeam)
    {
        NIMTeam *team = [[NIMSDK sharedSDK].teamManager teamById:self.session.sessionId];
        
        CGFloat width = 30;
        UIButton *enterTeamCard = [UIButton buttonWithType:UIButtonTypeCustom];
        [enterTeamCard addTarget:self action:@selector(enterTeamCard:) forControlEvents:UIControlEventTouchUpInside];
//        [enterTeamCard setImage:[UIImage imageNamed:@"ic_more"] forState:UIControlStateNormal];
        [enterTeamCard sd_setImageWithURL:[NSURL URLWithString:team.avatarUrl] forState:UIControlStateNormal];
        [enterTeamCard sd_setImageWithURL:[NSURL URLWithString:team.avatarUrl] forState:(UIControlState)UIControlStateNormal placeholderImage:[UIImage imageNamed:@"group_head_def"]];
        enterTeamCard.frame = CGRectMake(SCREEN_WIDTH-width-15, SCREEN_STATUS_HEIGHT+10, width, width);
        enterTeamCard.layer.cornerRadius = width/2;
        enterTeamCard.layer.masksToBounds = YES;
        [_topview addSubview:enterTeamCard];
    }
    else if(self.session.sessionType == NIMSessionTypeP2P)
    {
        CGFloat width = 24;
//        UIButton *btnVideo = [UIButton buttonWithType:UIButtonTypeCustom];
//        btnVideo.frame = CGRectMake(SCREEN_WIDTH-width*3-15*3, SCREEN_STATUS_HEIGHT+10, width, width);
//        [btnVideo addTarget:self action:@selector(enterVideoCall:) forControlEvents:UIControlEventTouchUpInside];
//        [btnVideo setImage:[UIImage imageNamed:@"chat_video"] forState:UIControlStateNormal];
//        [_topview addSubview:btnVideo];
//
//        UIButton *btnVoice = [UIButton buttonWithType:UIButtonTypeCustom];
//        btnVoice.frame = CGRectMake(SCREEN_WIDTH-width*2-15*2, SCREEN_STATUS_HEIGHT+10, width, width);
//        [btnVoice addTarget:self action:@selector(enterAudioCall:) forControlEvents:UIControlEventTouchUpInside];
//        [btnVoice setImage:[UIImage imageNamed:@"chat_voice"] forState:UIControlStateNormal];
//        [_topview addSubview:btnVoice];
        
        UIButton *infoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [infoBtn addTarget:self action:@selector(enterPersonInfoCard:) forControlEvents:UIControlEventTouchUpInside];
        [infoBtn setImage:[UIImage imageNamed:@"ic_more"] forState:UIControlStateNormal];
        infoBtn.frame = CGRectMake(SCREEN_WIDTH-width-15, SCREEN_STATUS_HEIGHT+10, width, width);
        [_topview addSubview:infoBtn];
    }
 
    
    
}
#pragma mark - 导航按钮
- (void)enterPersonInfoCard:(id)sender
{
    NTESPersonalCardViewController *vc = [[NTESPersonalCardViewController alloc] initWithUserId:self.session.sessionId];
    [self.navigationController pushViewController:vc animated:YES];
    
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

- (void)gotoBack:(id)sender {
    [self.navigationController popViewControllerAnimated:NO];
}

- (void)setupTableView
{
    CGFloat safeAreaInsetsBottom = [UIDevice vg_safeDistanceBottom];
    CGFloat containerSafeHeight = [UIScreen mainScreen].bounds.size.height - safeAreaInsetsBottom - 0;
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, containerSafeHeight-101) style:UITableViewStylePlain];
//    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, SCREEN_TOP_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT-SCREEN_TOP_HEIGHT-SCREEN_TABBAR_HEIGHT-SCREEN_BOTTOM_HEIGHT) style:UITableViewStylePlain];
//    self.tableView.backgroundColor = NEEKIT_UIColorFromRGB(0xe4e7ec);
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.estimatedRowHeight = 0;
    self.tableView.estimatedSectionHeaderHeight = 0;
    self.tableView.estimatedSectionFooterHeight = 0;
    self.tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.tableViewTapGesture = [[UITapGestureRecognizer alloc] init];
    self.tableViewTapGesture.cancelsTouchesInView = NO;
    [self.tableViewTapGesture addTarget:self action:@selector(onTapTableView:)];
    [self.tableView addGestureRecognizer:self.tableViewTapGesture];
    self.tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    
    if ([self.sessionConfig respondsToSelector:@selector(sessionBackgroundImage)] && [self.sessionConfig sessionBackgroundImage]) {
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:self.view.bounds];
        imgView.image = [self.sessionConfig sessionBackgroundImage];
        imgView.contentMode = UIViewContentModeScaleAspectFill;
        self.tableView.backgroundView = imgView;
    }
    [self.view addSubview:self.tableView];
    
}


- (void)setupInputView
{
    if ([self shouldShowInputView])
    {
        self.sessionInputView = [[AAAInputView alloc] initWithFrame:CGRectMake(0, 0, self.view.nim_width,0) config:self.sessionConfig];
        self.sessionInputView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
        [self.sessionInputView setSession:self.session];
        [self.sessionInputView setInputDelegate:self];
        [self.sessionInputView setInputActionDelegate:self];
        [self.sessionInputView refreshStatus:NIMInputStatusText];
        [self.view addSubview:_sessionInputView];
        self.tableView.bottom = self.sessionInputView.top;
//        self.tableView.top = self.topview.bottom;
        [self.tableView sizeToFit];
    }
}


- (void)setupConfigurator
{
    _configurator = [[CCCSessionConfigurator alloc] init];
    [_configurator setup:self];
    
    BOOL needProximityMonitor = [self needProximityMonitor];
    [[NIMSDK sharedSDK].mediaManager setNeedProximityMonitor:needProximityMonitor];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.interactor onViewWillAppear];
    [self addListener];
    
    self.sessionUnreadCount = [NIMSDK sharedSDK].conversationManager.allUnreadCount;
    [self refreshSessionBadge];
    [self.navigationController.navigationBar setHidden:YES];
    [self.tableView reloadData];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.sessionInputView endEditing:YES];
    // 隐藏长按弹窗
    [CCCBubbleMenuView.shareMenuView removeFromSuperview];
    [self.navigationController.navigationBar setHidden:NO];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [self.interactor onViewDidDisappear];
    [[NIMSDK sharedSDK].mediaManager removeDelegate:self];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
//    [self changeLeftBarBadge:self.conversationManager.allUnreadCount];
    [self.interactor resetLayout];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    [self.serviceContentTextView hideTextSelection];
    [CCCBubbleMenuView.shareMenuView removeFromSuperview];
    [self.view endEditing:YES];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if ([scrollView isKindOfClass:[UITextView class]]) {
        [CCCBubbleMenuView.shareMenuView removeFromSuperview];
    }
    [self.view endEditing:YES];
}



#pragma mark - 消息收发接口
- (void)sendMessage:(NIMMessage *)message
{
    [self.interactor sendMessage:message toMessage:nil];
    [self cleanMenuMessage];

}

- (void)sendMessage:(NIMMessage *)message completion:(void(^)(NSError * err))completion
{
    __weak typeof(self) weakSelf = self;
    [self.interactor sendMessage:message
                        toMessage:nil
                      completion:^(NSError *err)
    {
        if (completion)
        {
            completion(err);
        }
        [weakSelf cleanMenuMessage];
    }];
}


#pragma mark - CCCSessionConfiguratorDelegate

- (void)didFetchMessageData
{
    [self uiCheckReceipts:nil];
    [self.tableView reloadData];
//    [self.tableView nim_scrollToBottom:NO];
}

- (void)didRefreshMessageData
{
    [self refreshSessionTitle:self.sessionTitle];
    [self refreshSessionSubTitle:self.sessionSubTitle];
    [self.tableView reloadData];
}

- (void)didPullUpMessageData {}

#pragma mark - 会话title
- (NSString *)sessionTitle
{
    NSString *title = @"";
    NIMSessionType type = self.session.sessionType;
    switch (type) {
        case NIMSessionTypeTeam:{
            NIMTeam *team = [[[NIMSDK sharedSDK] teamManager] teamById:self.session.sessionId];
            title = [NSString stringWithFormat:@"%@(%zd)",[team teamName],[team memberNumber]];
            title = [NSString stringWithFormat:@"%@",[team teamName]];//不要人数

        }
            break;
        case NIMSessionTypeP2P:{
            title = [AAAKitUtil showNick:self.session.sessionId inSession:self.session];
        }
            break;
        case NIMSessionTypeSuperTeam: {
            NIMTeam *team = [[[NIMSDK sharedSDK] superTeamManager] teamById:self.session.sessionId];
            title = [NSString stringWithFormat:@"%@(%zd)",[team teamName],[team memberNumber]];
            title = [NSString stringWithFormat:@"%@",[team teamName]];//不要人数

        }
        default:
            break;
    }
    return title;
}

- (NSString *)sessionSubTitle{return @"";};

#pragma mark - 状态操作
- (NIMKitSessionState)sessionState {
    return [self.interactor sessionState];
}

- (void)setSessionState:(NIMKitSessionState)state {
    [self.interactor setSessionState:state];
}

#pragma mark - NIMChatManagerDelegate
//开始发送
- (void)willSendMessage:(NIMMessage *)message
{
    id<NIMSessionInteractor> interactor = self.interactor;
    
    if ([message.session isEqual:self.session]) {
        if ([interactor findMessageModel:message]) {
            [interactor updateMessage:message];
        }else{
            [interactor addMessages:@[message]];
        }
    }
}

//上传资源文件成功
- (void)uploadAttachmentSuccess:(NSString *)urlString
                     forMessage:(NIMMessage *)message
{
    //如果需要使用富文本推送，可以在这里进行 message apns payload 的设置
//    [self.tableView reloadData];
}


//发送结果
- (void)sendMessage:(NIMMessage *)message didCompleteWithError:(NSError *)error
{
    if ([message.session isEqual:_session])
    {
        if( message.messageType == NIMMessageTypeImage){
            //缓存图片URL
            NIMImageObject *imageObject = message.messageObject;
            NSString *urlString = imageObject.url;

            NSMutableDictionary *dic = [[CCCConfig sharedConfig] Gdic];
            NSData *data =  [dic objectForKey:message.messageId];
            if(data && urlString){
                NSString *key = [[SDWebImageManager sharedManager]cacheKeyForURL:[NSURL URLWithString:urlString]];
                dic[message.messageId] = nil;
                __weak typeof(self) weakSelf = self;
                [[SDImageCache sharedImageCache] storeImageData:data forKey:key completion:^{
                    [weakSelf.interactor updateMessage:message];
                }];
            }
        }else{
            [self.interactor updateMessage:message];
//            [self.tableView reloadData];
        }
      
        
        if (message.session.sessionType == NIMSessionTypeTeam ||
            message.session.sessionType == NIMSessionTypeSuperTeam)
        {
            //如果是群的话需要检查一下回执显示情况
            NIMMessageReceipt *receipt = [[NIMMessageReceipt alloc] initWithMessage:message];
            [self.interactor checkReceipts:@[receipt]];
        }
    }
    
}


//发送进度
-(void)sendMessage:(NIMMessage *)message progress:(float)progress
{
    if ([message.session isEqual:_session]) {
        [self.interactor updateMessage:message];
    }
}

//接收消息
- (void)onRecvMessages:(NSArray *)messages
{
    if ([self shouldAddListenerForNewMsg])
    {
        NIMMessage *message = messages.firstObject;
        NIMSession *session = message.session;
 
        if (![session isEqual:self.session] || !messages.count)
        {
            return;
        }
        
        [self uiInsertMessages:messages];
        [self.interactor markRead:NO];
        
        // 群禁言后输入框改变占位符文字
        [self setBannedSpeakingWithMessage:messages];
    }
}

- (void)setBannedSpeakingWithMessage:(NSArray <NIMMessage *>*)messages {
    
    [messages enumerateObjectsUsingBlock:^(NIMMessage * _Nonnull message, NSUInteger idx, BOOL * _Nonnull stop) {
        
        NIMNotificationObject *object = message.messageObject;
        if (object && [object isKindOfClass:NIMNotificationObject.class] && object.notificationType == NIMNotificationTypeTeam)
        {
            NIMTeamNotificationContent *content = (NIMTeamNotificationContent*)object.content;
            id attachment = [content attachment];
            if (attachment && [attachment isKindOfClass:[NIMUpdateTeamInfoAttachment class]]) {

                NIMUpdateTeamInfoAttachment *teamAttachment = (NIMUpdateTeamInfoAttachment *)attachment;
                if (teamAttachment && [teamAttachment.values count] > 0) {

                    /**
                     *  群禁言模式
                     *  @discussion 0: 禁言关闭 1: 全员禁言，不包括管理员
                     */
                    // NIMTeamUpdateTagMuteMode       = 100,
                    /**
                     *  群全体禁言模式
                     *  @discussion 参考NIMTeamAllMuteMode定义。0: 禁言关闭 1: 全员禁言，不包括管理员 3: 全员禁言，包括群组和管理员
                     */
                    // NIMTeamUpdateTagAllMuteMode    = 101,
                    
                    //                        if ([[teamAttachment.values allKeys] containsObject:@(100)]) {
                    //                            BOOL banned = [teamAttachment.values objectForKey:@(100)];
                    //                        }
                    
                    
                    if ([[teamAttachment.values allKeys] containsObject:@(101)]) {
                        BOOL banned = [teamAttachment.values boolValueForKey:@(101)];
                        [self setInputViewPlaceholder:banned];
                    }
                    
                    else if ([[teamAttachment.values allKeys] containsObject:@(100)]) {
                        BOOL banned = [teamAttachment.values boolValueForKey:@(100)];
                        [self setInputViewPlaceholder:banned];
                    }
                    
                }
                
            }
        }
    }];
}

- (void)setInputViewPlaceholder:(BOOL)ban {
    if (ban){
        [self.sessionInputView setInputTextPlaceHolder:LangKey(@"message_administrator_speak") color:[UIColor redColor]];
        self.sessionInputView.userInteractionEnabled = NO;
        self.canTapVoiceBtn = NO;
    } else {
        [self.sessionInputView setInputTextPlaceHolder:LangKey(@"message_please_enter_content") color:[UIColor grayColor]];
        self.sessionInputView.userInteractionEnabled = YES;
        self.canTapVoiceBtn = YES;
    }
}
 
- (void)fetchMessageAttachment:(NIMMessage *)message progress:(float)progress
{
    if ([message.session isEqual:_session])
    {
        [self.interactor updateMessage:message];
    }
}

- (void)fetchMessageAttachment:(NIMMessage *)message didCompleteWithError:(NSError *)error
{
    if ([message.session isEqual:_session])
    {
        BBBMessageModel *model = [self.interactor findMessageModel:message];
        //下完缩略图之后，因为比例有变化，重新刷下宽高。
        [model cleanCache];
        [self.interactor updateMessage:message];
    }
}

- (void)onRecvMessageReceipts:(NSArray<NIMMessageReceipt *> *)receipts
{
    if ([self shouldAddListenerForNewMsg])
    {
        NSMutableArray *handledReceipts = [[NSMutableArray alloc] init];
        for (NIMMessageReceipt *receipt in receipts) {
            if ([receipt.session isEqual:self.session])
            {
                [handledReceipts addObject:receipt];
            }
        }
        if (handledReceipts.count)
        {
            [self uiCheckReceipts:handledReceipts];
        }
    }
}

#pragma mark - NIMConversationManagerDelegate
//- (void)messagesDeletedInSession:(NIMSession *)session{
//    [self.interactor resetMessages:nil];
//    [self.tableView reloadData];
//}

// 远端消息清空回调
- (void)onRecvAllRemoteMessagesInSessionDeleted:(NIMSessionDeleteAllRemoteMessagesInfo *)info
{
    [self refreshMessages];
}

// 远端消息批量删除删除回调
- (void)onRecvMessagesDeleted:(NSArray<NIMMessage *> *)messages exts:(NSDictionary<NSString *,NSString *> *)exts
{
    [self refreshMessages];
}

//- (void)didAddRecentSession:(NIMRecentSession *)recentSession
//           totalUnreadCount:(NSInteger)totalUnreadCount{
//    [self changeUnreadCount:recentSession totalUnreadCount:totalUnreadCount];
//}
//
//- (void)didUpdateRecentSession:(NIMRecentSession *)recentSession
//              totalUnreadCount:(NSInteger)totalUnreadCount{
//    [self changeUnreadCount:recentSession totalUnreadCount:totalUnreadCount];
//}
//
//- (void)didRemoveRecentSession:(NIMRecentSession *)recentSession
//              totalUnreadCount:(NSInteger)totalUnreadCount{
//    [self changeUnreadCount:recentSession totalUnreadCount:totalUnreadCount];
//}


- (void)changeUnreadCount:(NIMRecentSession *)recentSession
         totalUnreadCount:(NSInteger)totalUnreadCount{
    if ([recentSession.session isEqual:self.session]) {
        return;
    }
    
}

#pragma mark - NIMMediaManagerDelegate
- (void)recordAudio:(NSString *)filePath didBeganWithError:(NSError *)error {
    if (!filePath || error) {
        _sessionInputView.recording = NO;
        [self onRecordFailed:error];
    }
}

- (void)recordAudio:(NSString *)filePath didCompletedWithError:(NSError *)error {
    if(!error) {
        if ([self recordFileCanBeSend:filePath]) {
            [self sendMessage:[CCCMessageMaker msgWithAudio:filePath]];
        }else{
            [self showRecordFileNotSendReason];
        }
    } else {
        [self onRecordFailed:error];
    }
    _sessionInputView.recording = NO;
}


- (void)recordAudioDidCancelled {
    _sessionInputView.recording = NO;
}

- (void)recordAudioProgress:(NSTimeInterval)currentTime {
    [_sessionInputView updateAudioRecordTime:currentTime];
}

- (void)recordAudioInterruptionBegin {
    [[NIMSDK sharedSDK].mediaManager cancelRecord];
}

#pragma mark - 录音相关接口
- (void)onRecordFailed:(NSError *)error{}

- (BOOL)recordFileCanBeSend:(NSString *)filepath
{
    return YES;
}

- (void)showRecordFileNotSendReason{}

#pragma mark - NIMInputDelegate

- (void)didChangeInputHeight:(CGFloat)inputHeight
{
    [self.interactor changeLayout:inputHeight];
}

#pragma mark - NIMInputActionDelegate
- (BOOL)onTapMediaItem:(BBBMediaItem *)item{
    SEL sel = item.selctor;
    BOOL handled = sel && [self respondsToSelector:sel];
    if (handled) {
        NEEKIT_SuppressPerformSelectorLeakWarning([self performSelector:sel withObject:item]);
        handled = YES;
    }
    return handled;
}

- (void)onTextChanged:(id)sender{}

- (void)onSendText:(NSString *)text atUsers:(NSArray *)atUsers
{
    NSMutableArray *users = [NSMutableArray arrayWithArray:atUsers];
    if (self.session.sessionType == NIMSessionTypeP2P)
    {
        [users addObject:self.session.sessionId];
    }

    NIMMessage *message = [CCCMessageMaker msgWithText:text];
    if (atUsers.count)
    {
        NIMMessageApnsMemberOption *apnsOption = [[NIMMessageApnsMemberOption alloc] init];
        apnsOption.userIds = atUsers;
        apnsOption.forcePush = YES;
        
        BBBKitInfoFetchOption *option = [[BBBKitInfoFetchOption alloc] init];
        option.session = self.session;
        
        NSString *me = [[AppleProjectKit sharedKit].provider infoByUser:[NIMSDK sharedSDK].loginManager.currentAccount option:option].showName;
        apnsOption.apnsContent = [NSString stringWithFormat:@"%@在群里@了你".nim_localized, me];
        message.apnsMemberOption = apnsOption;
    }
    
    [self sendMessage:message];
}

- (void)onSelectEmoticon:(NIMInputEmoticon *)emoticon
{
    NSString *emoticonID = emoticon.emoticonID;
    NSArray *array = [emoticonID componentsSeparatedByString:@"_"];
    NSString *numberStr = [array lastObject];
    NSInteger number = [numberStr integerValue];
    __block NIMQuickComment *newComment = [NIMCommentMaker commentWithType:number content:emoticon.tag ext:@"扩展"];
    
    __weak typeof(self) weakSelf = self;
    [self hadCommentThisMessage:self.messageForMenu type:number
                      compltion:^(NSMapTable *result)
     {
        NIMQuickComment *oldComment = [AAAKitQuickCommentUtil myCommentFromComments:0 keys:@[@(number)] comments:result];
        BOOL contains = oldComment ? YES : NO;
        if (!contains)
        {
            [weakSelf.interactor addQuickComment:newComment
                                  completion:^(NSError *error)
            {
//                [self.view hideToasts];
                if (error)
                {
                    [weakSelf.view makeToast:LangKey(@"group_info_activity_op_failed") duration:2 position:CSToastPositionCenter];
                }
                
                [weakSelf cleanMenuMessage];
            }];
        }
        else
        {
            [weakSelf.interactor delQuickComment:oldComment
                                   targetMessage:weakSelf.messageForMenu
                                      completion:^(NSError *error)
            {
//                [self.view hideToasts];
                if (error)
                {
                    [weakSelf.view makeToast:LangKey(@"group_info_activity_op_failed") duration:2 position:CSToastPositionCenter];
                }

                [weakSelf cleanMenuMessage];
            }];
        }
    }];
}

- (void)didReplyCancelled
{
    self.messageForMenu = nil;
    [self.interactor setReferenceMessage:nil];
    
    if ([self.sessionConfig respondsToSelector:@selector(clearThreadMessageAfterSent)])
    {
        if ([self.sessionConfig clearThreadMessageAfterSent])
        {
            [self.sessionConfig cleanThreadMessage];
        }
    }
}


- (void)onSelectChartlet:(NSString *)chartletId
                 catalog:(NSString *)catalogId
{
//    NSBundle *bundle = [AppleProjectKit sharedKit].emoticonBundle;
//    NSData *imageData = [NSData dataWithContentsOfFile:[bundle pathForResource:chartletId ofType:nil inDirectory:NEEKIT_EmojiPath]];
    NSString *emojiPath = [[SSZipArchiveManager sharedManager] getEmojiPath];
    NSString *imagePath = [emojiPath stringByAppendingPathComponent:chartletId];
    NSData *imageData = [NSData dataWithContentsOfFile:imagePath];
//    UIImage *gif = [UIImage sd_imageWithGIFData:imageData];
//
//    NIMMessage *message = [CCCMessageMaker msgWithImage:gif];
//    [self sendMessage:message];
//
    
    NIMMessage *message = [CCCMessageMaker msgWithImageData:imageData extension:@""];
//    message.messageSubType = 77;//标记gif用
    NSMutableDictionary *dic = [[CCCConfig sharedConfig] Gdic];
//    NSData *imageData = UIImagePNGRepresentation(image);
    [dic setObject:imageData forKey:message.messageId];
    
    [self sendMessage:message];
    
    [self.sessionInputView.toolBar setPlaceHolder:LangKey(@"message_please_enter_content")];
 
//    [self.sessionInputView endEditing:YES];
}

- (void)onCancelRecording
{
    [[NIMSDK sharedSDK].mediaManager cancelRecord];
}

- (void)onStopRecording
{
    [[NIMSDK sharedSDK].mediaManager stopRecord];
//    [self.audioContent animationClose];
}

- (void)onStartRecording
{
    _sessionInputView.recording = YES;
//    [_sessionInputView endEditing:YES];
    
    NIMAudioType type = [self recordAudioType];
    NSTimeInterval duration = [AppleProjectKit sharedKit].config.recordMaxDuration;
    
    [[NIMSDK sharedSDK].mediaManager addDelegate:self];
    
    [[NIMSDK sharedSDK].mediaManager record:type
                                   duration:duration];
}

#pragma mark NIMChatExtendManagerDelegate

- (void)onRecvQuickComment:(NIMQuickComment *)comment
{
    [self.interactor updateMessage:comment.message];
}


- (void)onRemoveQuickComment:(NIMQuickComment *)comment
{
    [self.interactor updateMessage:comment.message];
}

- (void)onNotifyAddMessagePin:(NIMMessagePinItem *)item
{
    NIMMessage *message = [NIMSDK.sharedSDK.conversationManager messagesInSession:self.session messageIds:@[item.messageId]].lastObject;
    [self uiPinMessage:message];
}

- (void)onNotifyRemoveMessagePin:(NIMMessagePinItem *)item
{
    NIMMessage *message = [NIMSDK.sharedSDK.conversationManager messagesInSession:self.session messageIds:@[item.messageId]].lastObject;
    [self uiUnpinMessage:message];
}

#pragma mark - CCCMessageCellDelegate
- (BOOL)onTapCell:(BBBKitEvent *)event{
    BOOL handle = NO;
    NSString *eventName = event.eventName;
    if ([eventName isEqualToString:BBBKitEventNameTapAudio])
    {
        [self.interactor mediaAudioPressed:event.messageModel];
        handle = YES;
    }
    return handle;
}

- (void)onRetryMessage:(NIMMessage *)message
{
    if (message.isReceivedMsg) {
        [[[NIMSDK sharedSDK] chatManager] fetchMessageAttachment:message
                                                           error:nil];
    }else{
        [[[NIMSDK sharedSDK] chatManager] resendMessage:message
                                                  error:nil];
    }
}

- (BOOL)onLongPressCell:(NIMMessage *)message
                 inView:(UIView *)view
{
    BOOL handle = NO;
    _messageForMenu = message;
    [self.interactor setReferenceMessage:message];
    if (![self becomeFirstResponder]) {
        handle = NO;
        return handle;
    }
    if ([self shouldShowMenuByMessage:message])
    {
        [CCCBubbleMenuView.shareMenuView removeFromSuperview];
        [self showMenuWithMessage:message withView:view];
    }
    handle = YES;
    return handle;
}

- (BOOL)onLongPressCell:(NIMMessage *)message complete:(void(^)(id data))complete; {
    BOOL handle = NO;
    _messageForMenu = message;
    [self.interactor setReferenceMessage:message];
    
    handle = [self shouldShowMenuByMessage:message];
    __weak typeof(self) wself = self;
    !complete ? : complete(wself);
    
    return handle;
}

- (BOOL)onLongPressCell:(NIMMessage *)message
{
    BOOL handle = NO;
    _messageForMenu = message;
    [self.interactor setReferenceMessage:message];
    if (![self becomeFirstResponder]) {
        handle = NO;
        return handle;
    }
    handle = YES;
    return handle;
}


- (BOOL)disableAudioPlayedStatusIcon:(NIMMessage *)message
{
    BOOL disable = NO;
    if ([self.sessionConfig respondsToSelector:@selector(disableAudioPlayedStatusIcon)])
    {
        disable = [self.sessionConfig disableAudioPlayedStatusIcon];
    }
    return disable;
}

- (void)onClickEmoticon:(NIMMessage *)message
                comment:(NIMQuickComment *)comment
               selected:(BOOL)isSelected
{
    __weak typeof(self) weakSelf = self;
    if (isSelected)
    {
        [self.interactor delQuickComment:comment
                           targetMessage:message
                              completion:^(NSError *error)
         {
//            [self.view hideToasts];
            if (!error)
            {
                return;
            }
            [weakSelf.view makeToast:LangKey(@"group_info_activity_op_failed") duration:2 position:CSToastPositionCenter];
        }];
    }
    else
    {
        NIMQuickComment *aComment = [comment copy];
        [self.interactor addQuickComment:aComment
                               toMessage:message
                              completion:^(NSError *error)
         {
//            [self.view hideToasts];
            if (!error)
            {
                return;
            }
            [weakSelf.view makeToast:LangKey(@"group_info_activity_op_failed") duration:2 position:CSToastPositionCenter];
        }];
    }
    
}

#pragma mark - 配置项
- (id<CCCSessionConfig>)sessionConfig
{
    return nil; //使用默认配置
}

#pragma mark - 配置项列表
//是否需要监听新消息通知 : 某些场景不需要监听新消息，如浏览服务器消息历史界面
- (BOOL)shouldAddListenerForNewMsg
{
    BOOL should = YES;
    if ([self.sessionConfig respondsToSelector:@selector(disableReceiveNewMessages)]) {
        should = ![self.sessionConfig disableReceiveNewMessages];
    }
    return should;
}



//是否需要显示输入框 : 某些场景不需要显示输入框，如使用 3D touch 的场景预览会话界面内容
- (BOOL)shouldShowInputView
{
    BOOL should = YES;
    if ([self.sessionConfig respondsToSelector:@selector(disableInputView)]) {
        should = ![self.sessionConfig disableInputView];
    }
    return should;
}


//当前录音格式 : NIMSDK 支持 aac 和 amr 两种格式
- (NIMAudioType)recordAudioType
{
    NIMAudioType type = NIMAudioTypeAAC;
    if ([self.sessionConfig respondsToSelector:@selector(recordType)]) {
        type = [self.sessionConfig recordType];
    }
    return type;
}

//是否需要监听感应器事件
- (BOOL)needProximityMonitor
{
    BOOL needProximityMonitor = YES;
    if ([self.sessionConfig respondsToSelector:@selector(disableProximityMonitor)]) {
        needProximityMonitor = !self.sessionConfig.disableProximityMonitor;
    }
    return needProximityMonitor;
}


#pragma mark -
#pragma mark - 长按菜单事件
- (NIMMessage *)messageForMenu
{
    return _messageForMenu;
}

- (BOOL)canBecomeFirstResponder
{
    return YES;
}

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender
{
    NSArray *items = [[UIMenuController sharedMenuController] menuItems];
    for (UIMenuItem *item in items) {
        if (action == [item action]){
            return YES;
        }
    }
    return NO;
}


- (void)copyText:(id)sender
{
    NIMMessage *message = [self messageForMenu];
    if (message.tyl_internalIdentifier.length) {
        UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
        [pasteboard setString:message.tyl_internalIdentifier];
    }
    else if (message.text.length) {
        UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
        [pasteboard setString:message.text];
    }
}

- (void)deleteMsg:(id)sender
{
    NIMMessage *message    = [self messageForMenu];
    [self uiDeleteMessage:message];
    [self.conversationManager deleteMessage:message];
}

- (void)menuDidHide:(NSNotification *)notification
{
    [UIMenuController sharedMenuController].menuItems = nil;
}

- (void)onTapMenuItemCopy:(BBBMediaItem *)item
{
    NIMMessage *message = [self messageForMenu];
    if (message.tyl_internalIdentifier.length) {
        UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
        [pasteboard setString:message.tyl_internalIdentifier];
    }
    else if (message.text.length) {
        UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
        [pasteboard setString:message.text];
    }
}

- (void)onTapMenuItemDelete:(BBBMediaItem *)item
{
    NIMMessage *message    = [self messageForMenu];
    [self uiDeleteMessage:message];
    [self.conversationManager deleteMessage:message];
}

#pragma mark - 操作接口
- (void)uiAddMessages:(NSArray *)messages
{
    [self.interactor addMessages:messages];
}

- (void)uiInsertMessages:(NSArray *)messages
{
    [self.interactor insertMessages:messages];
}

- (BBBMessageModel *)uiDeleteMessage:(NIMMessage *)message{
    BBBMessageModel *model = [self.interactor deleteMessage:message];
    if (model.shouldShowReadLabel && model.message.session.sessionType == NIMSessionTypeP2P)
    {
        [self uiCheckReceipts:nil];
    }
    return model;
}

- (void)uiUpdateMessage:(NIMMessage *)message{
    [self.interactor updateMessage:message];
}

- (void)uiPinMessage:(NIMMessage *)message
{
    [self.interactor addPinForMessage:message];
}

- (void)uiUnpinMessage:(NIMMessage *)message
{
    [self.interactor removePinForMessage:message];
}

- (void)uiCheckReceipts:(NSArray<NIMMessageReceipt *> *)receipts
{
    [self.interactor checkReceipts:receipts];
}

- (void)onTapCameraBtn:(id)sender
{
    [self.interactor mediaShootPressed];
   
}

- (void)onTapAlbunBtn:(id)sender
{
    [self.interactor mediaPicturePressed];
}

- (void)onTapAudioBtn:(id)sender
{
    [self.view addSubview:self.audioContent];
    self.audioContent.actionDelegate = self;
    [self.audioContent animationShow];
}


#pragma mark - NIMMeidaButton
- (void)onTapMediaItemPicture:(BBBMediaItem *)item
{
    [self.interactor mediaPicturePressed];
}

- (void)onTapMediaItemShoot:(BBBMediaItem *)item
{
    [self.interactor mediaShootPressed];
}

- (void)onTapMediaItemLocation:(BBBMediaItem *)item
{
//    [self.interactor mediaLocationPressed];
    [self.view addSubview:self.audioContent];
    self.audioContent.actionDelegate = self;
    [self.audioContent animationShow];
    
}

- (void)onTapTableView:(id)sender
{
    [CCCBubbleMenuView.shareMenuView removeFromSuperview];
    [self.sessionInputView endEditing:YES];
}

#pragma mark - 旋转处理 (iOS8 or above)
- (void)viewWillTransitionToSize:(CGSize)size
       withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator
{
    self.lastVisibleIndexPathBeforeRotation = [self.tableView indexPathsForVisibleRows].lastObject;
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
    if (self.view.window) {
        __weak typeof(self) wself = self;
        [coordinator animateAlongsideTransition:^(id <UIViewControllerTransitionCoordinatorContext> context)
         {
             [[NIMSDK sharedSDK].mediaManager cancelRecord];
             [wself.interactor cleanCache];
             [wself.sessionInputView reset];
             [wself.tableView reloadData];
             [wself.tableView scrollToRowAtIndexPath:wself.lastVisibleIndexPathBeforeRotation atScrollPosition:UITableViewScrollPositionBottom animated:NO];
         } completion:nil];
    }
}


#pragma mark - 标记已读
- (void)markRead
{
    [self.interactor markRead:YES];
}


#pragma mark - Private

- (void)addListener
{
    [[NIMSDK sharedSDK].chatManager addDelegate:self];
    [[NIMSDK sharedSDK].conversationManager addDelegate:self];
    [[NIMSDK sharedSDK].chatExtendManager addDelegate:self];
}

- (void)removeListener
{
    [[NIMSDK sharedSDK].chatManager removeDelegate:self];
    [[NIMSDK sharedSDK].conversationManager removeDelegate:self];
    [[NIMSDK sharedSDK].mediaManager removeDelegate:self];
    [[NIMSDK sharedSDK].chatExtendManager removeDelegate:self];

}


- (id<NIMConversationManager>)conversationManager{
    switch (self.session.sessionType) {
        case NIMSessionTypeChatroom:
            return nil;
            break;
        case NIMSessionTypeP2P:
        case NIMSessionTypeTeam:
        case NIMSessionTypeSuperTeam:
        default:
            return [NIMSDK sharedSDK].conversationManager;
    }
}


- (void)setUpTitleView
{
    BBBKitTitleView *titleView = (BBBKitTitleView *)self.navigationItem.titleView;
    if (!titleView || ![titleView isKindOfClass:[BBBKitTitleView class]])
    {
        titleView = [[BBBKitTitleView alloc] initWithFrame:CGRectZero];
        self.navigationItem.titleView = titleView;
        
        titleView.titleLabel.text = self.sessionTitle;
        titleView.subtitleLabel.text = self.sessionSubTitle;
        
        self.titleLabel    = titleView.titleLabel;
        self.subTitleLabel = titleView.subtitleLabel;
    }

    [titleView sizeToFit];
    self.subtitle.text = self.sessionSubTitle;
}

- (void)refreshSessionTitle:(NSString *)title
{
    self.titleLabel.text = title;
//    self.labtitle.text = self.sessionTitle;
    [self setUpTitleView];
}


- (void)refreshSessionSubTitle:(NSString *)title
{
    self.subTitleLabel.text = title;
    self.subtitle.text = title;
    if([title isEqualToString:@"离线".ntes_localized]){
        self.subtitle.textColor = RGB_COLOR_String(@"777777");
    }else{
        self.subtitle.textColor = RGB_COLOR_String(@"#00B01B");
    }
    [self setUpTitleView];
}

- (void)refreshMessages
{
    [self.interactor resetMessages:nil];
}

- (NSArray *)menusItems:(NIMMessage *)message {
    return nil;
}

- (void)scrollToMessage:(NIMMessage *)message
{
    NSInteger row = [self.interactor findMessageIndex:message];
    if (row != -1) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:row inSection:0];
        [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
    }
}

- (void)cleanMenuMessage
{
    [self.sessionInputView.replyedContent.closeButton sendActionsForControlEvents:UIControlEventTouchUpInside];
    self.messageForMenu = nil;
}

- (void)hadCommentThisMessage:(NIMMessage *)message
                         type:(int64_t)type
                    compltion:(void(^)(NSMapTable *))completion
{
    [[NIMSDK sharedSDK].chatExtendManager quickCommentsByMessage:message completion:^(NSError * _Nullable error, NSMapTable<NSNumber *,NSArray<NIMQuickComment *> * >* _Nullable result) {
        if (completion)
        {
            completion(result);
        }
    }];
}

- (BOOL)shouldShowMenuByMessage:(NIMMessage *)message
{
    if (message.session.sessionType == NIMSessionTypeChatroom ||
        message.messageType == NIMMessageTypeTip ||
        message.messageType == NIMMessageTypeNotification)
    {
        return NO;
    }
    return YES;
}


- (void)showMenuWithMessage:(NIMMessage *)message withView:(UIView *)view {
    
    [[CCCBubbleMenuView shareMenuView] removeFromSuperview];
    
    NSArray *btns = [self genMediaButtonsWithMessage:message];
    
    if (btns.count > 0) {
        
        CGRect tempRect = [view convertRect:view.bounds toView:self.view];
        CGRect cursorStartRectToWindow = [view convertRect:view.bounds toView:self.view];
           
        @weakify(self);
        [[CCCBubbleMenuView shareMenuView] showViewWithButtonModels:btns cursorStartRect:cursorStartRectToWindow selectionTextRectInWindow:tempRect selectBlock:^(BBBMediaItem *item) {
            @strongify(self);
            [self onTapMediaItem:item];

            [CCCBubbleMenuView.shareMenuView removeFromSuperview];
        }];
    }
    
}

- (NSArray *)genMediaButtonsWithMessage:(NIMMessage *)message {
    
    NSMutableArray *selectedAllRangeButtons = [NSMutableArray array];

    NSArray *items;
    if (!self.sessionConfig)
    {
        items = [[AppleProjectKit sharedKit].config defaultMenuItemsWithMessage:message];
    }
    else if([self.sessionConfig respondsToSelector:@selector(menuItemsWithMessage:)])
    {
        items = [self.sessionConfig menuItemsWithMessage:message];
    }
    
    [items enumerateObjectsUsingBlock:^(BBBMediaItem *item, NSUInteger idx, BOOL *stop) {
        
        CCCBubbleButtonModel *model = [[CCCBubbleButtonModel alloc] init];
        model.normalImage = item.normalImage;
        model.name = item.title;
        model.item = item;

        [selectedAllRangeButtons addObject:model];
        
    }];
   
    return selectedAllRangeButtons;
}

- (KEKEInputAudioView *)audioContent
{
    if(!_audioContent){
        _audioContent = [[KEKEInputAudioView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
//        _audioContent.hidden = YES;
    }
    return _audioContent;
}

@end

