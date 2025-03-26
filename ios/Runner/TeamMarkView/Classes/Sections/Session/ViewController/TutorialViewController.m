
#import <Foundation/Foundation.h>
typedef struct {
    Byte indexTrend;
    Byte *genreAnal;
    unsigned int ginCart;
    bool thoughtBarn;
	int workYard;
} VaccineData;

NSString *StringFromVaccineData(VaccineData *data);


//: chating_top_bg
VaccineData str_firmText = (VaccineData){111, (Byte []){12, 7, 14, 27, 6, 1, 8, 48, 27, 0, 31, 48, 13, 8, 228}, 14, false, 111};


//: ic_more
VaccineData str_foreheadTitle = (VaccineData){183, (Byte []){222, 212, 232, 218, 216, 197, 210, 240}, 7, false, 121};


//: back_arrow_bl
VaccineData str_readilyValue = (VaccineData){59, (Byte []){89, 90, 88, 80, 100, 90, 73, 73, 84, 76, 100, 89, 87, 164}, 13, false, 178};


//: %@在群里@了你
VaccineData str_visionTitle = (VaccineData){153, (Byte []){188, 217, 124, 5, 49, 126, 39, 61, 112, 30, 21, 217, 125, 35, 31, 125, 36, 57, 168}, 18, false, 178};


//: 777777
VaccineData str_throatTitle = (VaccineData){54, (Byte []){1, 1, 1, 1, 1, 1, 201}, 6, false, 118};


//: #00B01B
VaccineData str_candidShowName = (VaccineData){20, (Byte []){55, 36, 36, 86, 36, 37, 86, 191}, 7, false, 113};


//: group_info_activity_op_failed
VaccineData str_ministrationName = (VaccineData){235, (Byte []){140, 153, 132, 158, 155, 180, 130, 133, 141, 132, 180, 138, 136, 159, 130, 157, 130, 159, 146, 180, 132, 155, 180, 141, 138, 130, 135, 142, 143, 176}, 29, false, 76};


//: message_please_enter_content
VaccineData str_basketballTitle = (VaccineData){80, (Byte []){61, 53, 35, 35, 49, 55, 53, 15, 32, 60, 53, 49, 35, 53, 15, 53, 62, 36, 53, 34, 15, 51, 63, 62, 36, 53, 62, 36, 248}, 28, false, 146};


//: group_head_def
VaccineData str_sweetCountTitle = (VaccineData){237, (Byte []){138, 159, 130, 152, 157, 178, 133, 136, 140, 137, 178, 137, 136, 139, 94}, 14, false, 34};


//: chating_bg
VaccineData str_relaxTitle = (VaccineData){66, (Byte []){33, 42, 35, 54, 43, 44, 37, 29, 32, 37, 203}, 10, false, 248};


//: message_administrator_speak
VaccineData str_textSpeciallyData = (VaccineData){34, (Byte []){79, 71, 81, 81, 67, 69, 71, 125, 67, 70, 79, 75, 76, 75, 81, 86, 80, 67, 86, 77, 80, 125, 81, 82, 71, 67, 73, 147}, 27, false, 89};

// __DEBUG__
// __CLOSE_PRINT__
//
//  TutorialViewController.m
// Indicator
//
//  Created by NetEase.
//  Copyright (c) 2015年 NetEase. All rights reserved.
//

// __M_A_C_R_O__
//: #import "UserSessionConfigurateProtocol.h"
#import "UserSessionConfigurateProtocol.h"
//: #import "AppleProjectKit.h"
#import "Indicator.h"
//: #import "UserMessageCellProtocol.h"
#import "UserMessageCellProtocol.h"
//: #import "BBBMessageModel.h"
#import "AccumulationCenter.h"
//: #import "AAAKitUtil.h"
#import "TypicalCenter.h"
//: #import "BBBBadgeView.h"
#import "BadgeView.h"
//: #import "UITableView+NIMScrollToBottom.h"
#import "UITableView+NIMScrollToBottom.h"
//: #import "CCCMessageMaker.h"
#import "Maker.h"
//: #import "UIViewNimKit.h"
#import "UIViewNimKit.h"
//: #import "CCCSessionConfigurator.h"
#import "MessageDoingIcon.h"
//: #import "BBBKitInfoFetchOption.h"
#import "TitleOption.h"
//: #import "BBBKitTitleView.h"
#import "DittyBagView.h"
//: #import "BBBKitKeyboardInfo.h"
#import "TeamInfo.h"
//: #import "AAAReplyContentView.h"
#import "StatuteTitleView.h"
//: #import "UserKitDependency.h"
#import "UserKitDependency.h"
//: #import "AAAKitQuickCommentUtil.h"
#import "CaseOfMaxTeam.h"
//: #import "CCCBubbleMenuView.h"
#import "InformationHideView.h"
//: #import "CCCTextView.h"
#import "LanguageWithPositionScrollView.h"
//: #import "CCCAppDelegate.h"
#import "AppDelegate.h"
//: #import "NSObject+tyl_internalIdentifier.h"
#import "NSObject+Ting.h"
//: #import "CCCBubbleMenuView.h"
#import "InformationHideView.h"
//: #import "CCCBubbleButtonModel.h"
#import "FromMax.h"
//: #import "UserInputEmoticonDefine.h"
#import "UserInputEmoticonDefine.h"
//: #import "KEKEInputAudioView.h"
#import "ElectronicSignalView.h"
//: #import "UIView+NTES.h"
#import "UIView+Status.h"
//: #import "NTESPersonalCardViewController.h"
#import "HideViewController.h"
//: #import "BBBTeamCardViewController.h"
#import "DoingViewController.h"
//: #import "CCCAdvancedTeamCardViewController.h"
#import "AssemblageViewController.h"
//: #import "SSZipArchiveManager.h"
#import "EnableChildWith.h"

//: @interface CCCSessionViewController ()<NIMMediaManagerDelegate,NIMInputDelegate,BBBTeamCardViewControllerDelegate,NIMConversationManagerDelegate>
@interface TutorialViewController ()<NIMMediaManagerDelegate,OffDelegate,TeamMark,NIMConversationManagerDelegate>

//: @property (nonatomic,readwrite) NIMMessage *messageForMenu;
@property (nonatomic,readwrite) NIMMessage *messageForMenu;

//: @property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UILabel *titleLabel;

//: @property (nonatomic,strong) UILabel *subTitleLabel;
@property (nonatomic,strong) UILabel *subTitleLabel;

//: @property (nonatomic,strong) NSIndexPath *lastVisibleIndexPathBeforeRotation;
@property (nonatomic,strong) NSIndexPath *lastVisibleIndexPathBeforeRotation;

//: @property (nonatomic,strong) CCCSessionConfigurator *configurator;
@property (nonatomic,strong) MessageDoingIcon *configurator;

//: @property (nonatomic,strong) UITapGestureRecognizer *tableViewTapGesture;
@property (nonatomic,strong) UITapGestureRecognizer *tableViewTapGesture;

//: @property (nonatomic,assign) NSInteger sessionUnreadCount;
@property (nonatomic,assign) NSInteger sessionUnreadCount;
//: @property (nonatomic,strong) BBBBadgeView *badgeView;
@property (nonatomic,strong) BadgeView *badgeView;
//: @property (nonatomic,strong) UIImageView *headerImage;
@property (nonatomic,strong) UIImageView *headerImage;
//: @property (nonatomic,strong) UILabel *labtitle;
@property (nonatomic,strong) UILabel *labtitle;
//: @property (nonatomic,strong) UILabel *subtitle;
@property (nonatomic,strong) UILabel *subtitle;

//: @property (nonatomic, strong) UIView *topview;
@property (nonatomic, strong) UIView *topview;
//: @property (nonatomic, strong) KEKEInputAudioView *audioContent;
@property (nonatomic, strong) ElectronicSignalView *audioContent;

//: @end
@end

//: @implementation CCCSessionViewController
@implementation TutorialViewController

//: - (instancetype)initWithSession:(NIMSession *)session{
- (instancetype)initWithOf:(NIMSession *)session{
    //: self = [super initWithNibName:nil bundle:nil];
    self = [super initWithNibName:nil bundle:nil];
    //: if (self) {
    if (self) {
        //: _session = session;
        _session = session;
    }
    //: return self;
    return self;
}

//: - (void)dealloc
- (void)dealloc
{
    //: [self removeListener];
    [self noneCircle];

    //: _tableView.delegate = nil;
    _tableView.delegate = nil;
    //: _tableView.dataSource = nil;
    _tableView.dataSource = nil;
}

//: - (void)viewDidLoad {
- (void)viewDidLoad {
    //: [super viewDidLoad];
    [super viewDidLoad];
    //    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"chating_bg"]];
        //: UIImageView *bg = [[UIImageView alloc]initWithFrame:self.view.bounds];
        UIImageView *bg = [[UIImageView alloc]initWithFrame:self.view.bounds];
        //: bg.image = [UIImage imageNamed:@"chating_bg"];
        bg.image = [UIImage imageNamed:StringFromVaccineData(&str_relaxTitle)];
        //: [self.view addSubview:bg];
        [self.view addSubview:bg];

    //: UIView *bottomview = [[UIView alloc]initWithFrame:CGRectMake(0, [[UIScreen mainScreen] bounds].size.height-(({UIEdgeInsets i; if(@available(iOS 11.0, *)) {i = [[[UIApplication sharedApplication] delegate] window].safeAreaInsets;} else {i = UIEdgeInsetsZero;} i;}).bottom), [[UIScreen mainScreen] bounds].size.width, (({UIEdgeInsets i; if(@available(iOS 11.0, *)) {i = [[[UIApplication sharedApplication] delegate] window].safeAreaInsets;} else {i = UIEdgeInsetsZero;} i;}).bottom))];
    UIView *bottomview = [[UIView alloc]initWithFrame:CGRectMake(0, [[UIScreen mainScreen] bounds].size.height-(({UIEdgeInsets i; if(@available(iOS 11.0, *)) {i = [[[UIApplication sharedApplication] delegate] window].safeAreaInsets;} else {i = UIEdgeInsetsZero;} i;}).bottom), [[UIScreen mainScreen] bounds].size.width, (({UIEdgeInsets i; if(@available(iOS 11.0, *)) {i = [[[UIApplication sharedApplication] delegate] window].safeAreaInsets;} else {i = UIEdgeInsetsZero;} i;}).bottom))];
    //: bottomview.backgroundColor = [UIColor whiteColor];
    bottomview.backgroundColor = [UIColor whiteColor];
    //: [self.view addSubview:bottomview];
    [self.view addSubview:bottomview];

    //消息 tableView
    //: [self setupTableView];
    [self aggregation];
    //导航栏
    //: [self setupNav];
    [self tableFrom];

    //输入框 inputView
    //: [self setupInputView];
    [self dismissIn];
    //会话相关逻辑配置器安装
    //: [self setupConfigurator];
    [self remote];
    //进入会话时，标记所有消息已读，并发送已读回执
    //: [self markRead];
    [self characterise];
    //更新已读位置

     //: dispatch_after(dispatch_time((0ull), (int64_t)(0.3 * 1000000000ull)), dispatch_get_main_queue(), ^{
     dispatch_after(dispatch_time((0ull), (int64_t)(0.3 * 1000000000ull)), dispatch_get_main_queue(), ^{
         //: [self setBanned];
         [self contentDeleteBanned];
     //: });
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

 //: - (void)setBanned {
 - (void)contentDeleteBanned {
     //: NIMSessionType type = self.session.sessionType;
     NIMSessionType type = self.session.sessionType;
     //: switch (type) {
     switch (type) {
         //: case NIMSessionTypeTeam:{
         case NIMSessionTypeTeam:{
             //: NIMTeam *team = [[[NIMSDK sharedSDK] teamManager] teamById:self.session.sessionId];
             NIMTeam *team = [[[NIMSDK sharedSDK] teamManager] teamById:self.session.sessionId];
             //: if (team.inAllMuteMode) {
             if (team.inAllMuteMode) {
                 //: if (team.allMuteMode == NIMTeamAllMuteModeMuteNormal || team.allMuteMode == NIMTeamAllMuteModeMuteAll) {
                 if (team.allMuteMode == NIMTeamAllMuteModeMuteNormal || team.allMuteMode == NIMTeamAllMuteModeMuteAll) {
                     //: NSString *userID = [NIMSDK sharedSDK].loginManager.currentAccount;
                     NSString *userID = [NIMSDK sharedSDK].loginManager.currentAccount;
                     //: NIMTeamMember *member = [[NIMSDK sharedSDK].teamManager teamMember:userID inTeam:self.session.sessionId];
                     NIMTeamMember *member = [[NIMSDK sharedSDK].teamManager teamMember:userID inTeam:self.session.sessionId];
                     //: if (member.isMuted) {
                     if (member.isMuted) {
                         //: [self setInputViewPlaceholder:YES];
                         [self setLabelPlaceholder:YES];
                     }
                 }
             }
         }
             //: break;
             break;

             //: break;
             break;
         //: case NIMSessionTypeSuperTeam: {
         case NIMSessionTypeSuperTeam: {
             //: NIMTeam *team = [[[NIMSDK sharedSDK] superTeamManager] teamById:self.session.sessionId];
             NIMTeam *team = [[[NIMSDK sharedSDK] superTeamManager] teamById:self.session.sessionId];
             //: if (team.inAllMuteMode) {
             if (team.inAllMuteMode) {
                 //: if (team.allMuteMode == NIMTeamAllMuteModeMuteNormal || team.allMuteMode == NIMTeamAllMuteModeMuteAll) {
                 if (team.allMuteMode == NIMTeamAllMuteModeMuteNormal || team.allMuteMode == NIMTeamAllMuteModeMuteAll) {
                     //: NSString *userID = [NIMSDK sharedSDK].loginManager.currentAccount;
                     NSString *userID = [NIMSDK sharedSDK].loginManager.currentAccount;
                     //: NIMTeamMember *member = [[NIMSDK sharedSDK].teamManager teamMember:userID inTeam:self.session.sessionId];
                     NIMTeamMember *member = [[NIMSDK sharedSDK].teamManager teamMember:userID inTeam:self.session.sessionId];
                     //: if (member.isMuted) {
                     if (member.isMuted) {
                         //: [self setInputViewPlaceholder:YES];
                         [self setLabelPlaceholder:YES];
                     }
                 }
             }
         }
         //: default:
         default:
             //: break;
             break;
     }
 }

//: #pragma mark - NIMConversationManagerDelegate
#pragma mark - NIMConversationManagerDelegate
//: - (void)didAddRecentSession:(NIMRecentSession *)recentSession
- (void)didAddRecentSession:(NIMRecentSession *)recentSession
           //: totalUnreadCount:(NSInteger)totalUnreadCount{
           totalUnreadCount:(NSInteger)totalUnreadCount{
    //: self.sessionUnreadCount = totalUnreadCount;
    self.sessionUnreadCount = totalUnreadCount;
    //: [self refreshSessionBadge];
    [self quick];
//    [self changeUnreadCount:recentSession totalUnreadCount:totalUnreadCount];
}


//: - (void)didUpdateRecentSession:(NIMRecentSession *)recentSession
- (void)didUpdateRecentSession:(NIMRecentSession *)recentSession
              //: totalUnreadCount:(NSInteger)totalUnreadCount{
              totalUnreadCount:(NSInteger)totalUnreadCount{
    //: self.sessionUnreadCount = totalUnreadCount;
    self.sessionUnreadCount = totalUnreadCount;
    //: [self refreshSessionBadge];
    [self quick];
//    [self changeUnreadCount:recentSession totalUnreadCount:totalUnreadCount];

}


//: - (void)didRemoveRecentSession:(NIMRecentSession *)recentSession totalUnreadCount:(NSInteger)totalUnreadCount{
- (void)didRemoveRecentSession:(NIMRecentSession *)recentSession totalUnreadCount:(NSInteger)totalUnreadCount{
    //: self.sessionUnreadCount = totalUnreadCount;
    self.sessionUnreadCount = totalUnreadCount;
    //: [self refreshSessionBadge];
    [self quick];
//    [self changeUnreadCount:recentSession totalUnreadCount:totalUnreadCount];
}

//: - (void)messagesDeletedInSession:(NIMSession *)session{
- (void)messagesDeletedInSession:(NIMSession *)session{
    //: self.sessionUnreadCount = [NIMSDK sharedSDK].conversationManager.allUnreadCount;
    self.sessionUnreadCount = [NIMSDK sharedSDK].conversationManager.allUnreadCount;
    //: [self refreshSessionBadge];
    [self quick];
    //: [self.interactor resetMessages:nil];
    [self.interactor distance:nil];
    //: [self.tableView reloadData];
    [self.tableView reloadData];
}

//: - (void)allMessagesDeleted{
- (void)allMessagesDeleted{
    //: self.sessionUnreadCount = 0;
    self.sessionUnreadCount = 0;
    //: [self refreshSessionBadge];
    [self quick];
}

//: - (void)allMessagesRead
- (void)allMessagesRead
{
    //: self.sessionUnreadCount = 0;
    self.sessionUnreadCount = 0;
    //: [self refreshSessionBadge];
    [self quick];
}

//: - (void)onBatchMarkMessagesReadInSessions:(NSArray<NIMSession *> *)sessions
- (void)onBatchMarkMessagesReadInSessions:(NSArray<NIMSession *> *)sessions
{
    //: self.sessionUnreadCount = [NIMSDK sharedSDK].conversationManager.allUnreadCount;
    self.sessionUnreadCount = [NIMSDK sharedSDK].conversationManager.allUnreadCount;
    //: [self refreshSessionBadge];
    [self quick];
}


//: - (void)refreshSessionBadge
- (void)quick
{

    //: if(self.sessionUnreadCount>0){
    if(self.sessionUnreadCount>0){
        //: _badgeView.badgeValue = self.sessionUnreadCount ? @(self.sessionUnreadCount).stringValue : nil;
        _badgeView.badgeValue = self.sessionUnreadCount ? @(self.sessionUnreadCount).stringValue : nil;
        //: _badgeView.hidden = NO;
        _badgeView.hidden = NO;
        //: _labtitle.frame = CGRectMake(_badgeView.right+10, [UIDevice vg_statusBarHeight], 100, 40);
        _labtitle.frame = CGRectMake(_badgeView.right+10, [UIDevice task], 100, 40);
    }
    //: else{
    else{
        //: _badgeView.hidden = YES;
        _badgeView.hidden = YES;
        //: _labtitle.frame = CGRectMake(65, [UIDevice vg_statusBarHeight], 200, 40);
        _labtitle.frame = CGRectMake(65, [UIDevice task], 200, 40);
    }
}

//: - (void)setupNav
- (void)tableFrom
{
    //: _topview = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, (44.0f + [UIDevice vg_statusBarHeight]))];
    _topview = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, (44.0f + [UIDevice task]))];
//    _topview.backgroundColor = [UIColor colorWithRed:216/255.0 green:242/255.0 blue:253/255.0 alpha:1];
    //: [self.view addSubview:_topview];
    [self.view addSubview:_topview];

    //: UIImageView *bg = [[UIImageView alloc]initWithFrame:_topview.bounds];
    UIImageView *bg = [[UIImageView alloc]initWithFrame:_topview.bounds];
    //: bg.image = [UIImage imageNamed:@"chating_top_bg"];
    bg.image = [UIImage imageNamed:StringFromVaccineData(&str_firmText)];
    //: [_topview addSubview:bg];
    [_topview addSubview:bg];



    //: UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    //: backBtn.frame = CGRectMake(15, [UIDevice vg_statusBarHeight], 40, 40);
    backBtn.frame = CGRectMake(15, [UIDevice task], 40, 40);
    //: [backBtn addTarget:self action:@selector(gotoBack:) forControlEvents:UIControlEventTouchUpInside];
    [backBtn addTarget:self action:@selector(mentalPictureBack:) forControlEvents:UIControlEventTouchUpInside];
    //: [backBtn setImage:[UIImage imageNamed:@"back_arrow_bl"] forState:UIControlStateNormal];
    [backBtn setImage:[UIImage imageNamed:StringFromVaccineData(&str_readilyValue)] forState:UIControlStateNormal];
    //: [_topview addSubview:backBtn];
    [_topview addSubview:backBtn];

//    NSString *userID = self.session.sessionId;
//    NIMUser *me = [[NIMSDK sharedSDK].userManager userInfo:userID];
//    TitleInfo *info = [[Indicator sharedKit] infoByUser:userID option:nil];

    //: self.sessionUnreadCount = [NIMSDK sharedSDK].conversationManager.allUnreadCount;
    self.sessionUnreadCount = [NIMSDK sharedSDK].conversationManager.allUnreadCount;

     //: _badgeView = [BBBBadgeView viewWithBadgeTip:@""];
     _badgeView = [BadgeView beMust:@""];
    //: _badgeView.frame = CGRectMake(backBtn.right+5, backBtn.top+8, 24, 24);
    _badgeView.frame = CGRectMake(backBtn.right+5, backBtn.top+8, 24, 24);
    //: [_topview addSubview:_badgeView];
    [_topview addSubview:_badgeView];
    //: _badgeView.badgeValue = self.sessionUnreadCount ? @(self.sessionUnreadCount).stringValue : nil;
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

    //: _labtitle = [[UILabel alloc]initWithFrame:CGRectMake(backBtn.right+10, [UIDevice vg_statusBarHeight], 200, 40)];
    _labtitle = [[UILabel alloc]initWithFrame:CGRectMake(backBtn.right+10, [UIDevice task], 200, 40)];
    //: _labtitle.textColor = [UIColor blackColor];
    _labtitle.textColor = [UIColor blackColor];
    //: _labtitle.font = [UIFont boldSystemFontOfSize:16];
    _labtitle.font = [UIFont boldSystemFontOfSize:16];
    //: _labtitle.text = self.sessionTitle;
    _labtitle.text = self.birdSEyeViewContent;
    //: [_topview addSubview:_labtitle];
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



    //: if (self.session.sessionType == NIMSessionTypeTeam)
    if (self.session.sessionType == NIMSessionTypeTeam)
    {
        //: NIMTeam *team = [[NIMSDK sharedSDK].teamManager teamById:self.session.sessionId];
        NIMTeam *team = [[NIMSDK sharedSDK].teamManager teamById:self.session.sessionId];

        //: CGFloat width = 30;
        CGFloat width = 30;
        //: UIButton *enterTeamCard = [UIButton buttonWithType:UIButtonTypeCustom];
        UIButton *enterTeamCard = [UIButton buttonWithType:UIButtonTypeCustom];
        //: [enterTeamCard addTarget:self action:@selector(enterTeamCard:) forControlEvents:UIControlEventTouchUpInside];
        [enterTeamCard addTarget:self action:@selector(stratfordDoingAvon:) forControlEvents:UIControlEventTouchUpInside];
//        [enterTeamCard setImage:[UIImage imageNamed:@"ic_more"] forState:UIControlStateNormal];
        //: [enterTeamCard sd_setImageWithURL:[NSURL URLWithString:team.avatarUrl] forState:UIControlStateNormal];
        [enterTeamCard sd_setImageWithURL:[NSURL URLWithString:team.avatarUrl] forState:UIControlStateNormal];
        //: [enterTeamCard sd_setImageWithURL:[NSURL URLWithString:team.avatarUrl] forState:(UIControlState)UIControlStateNormal placeholderImage:[UIImage imageNamed:@"group_head_def"]];
        [enterTeamCard sd_setImageWithURL:[NSURL URLWithString:team.avatarUrl] forState:(UIControlState)UIControlStateNormal placeholderImage:[UIImage imageNamed:StringFromVaccineData(&str_sweetCountTitle)]];
        //: enterTeamCard.frame = CGRectMake([[UIScreen mainScreen] bounds].size.width-width-15, [UIDevice vg_statusBarHeight]+10, width, width);
        enterTeamCard.frame = CGRectMake([[UIScreen mainScreen] bounds].size.width-width-15, [UIDevice task]+10, width, width);
        //: enterTeamCard.layer.cornerRadius = width/2;
        enterTeamCard.layer.cornerRadius = width/2;
        //: enterTeamCard.layer.masksToBounds = YES;
        enterTeamCard.layer.masksToBounds = YES;
        //: [_topview addSubview:enterTeamCard];
        [_topview addSubview:enterTeamCard];
    }
    //: else if(self.session.sessionType == NIMSessionTypeP2P)
    else if(self.session.sessionType == NIMSessionTypeP2P)
    {
        //: CGFloat width = 24;
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

        //: UIButton *infoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        UIButton *infoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        //: [infoBtn addTarget:self action:@selector(enterPersonInfoCard:) forControlEvents:UIControlEventTouchUpInside];
        [infoBtn addTarget:self action:@selector(colorCard:) forControlEvents:UIControlEventTouchUpInside];
        //: [infoBtn setImage:[UIImage imageNamed:@"ic_more"] forState:UIControlStateNormal];
        [infoBtn setImage:[UIImage imageNamed:StringFromVaccineData(&str_foreheadTitle)] forState:UIControlStateNormal];
        //: infoBtn.frame = CGRectMake([[UIScreen mainScreen] bounds].size.width-width-15, [UIDevice vg_statusBarHeight]+10, width, width);
        infoBtn.frame = CGRectMake([[UIScreen mainScreen] bounds].size.width-width-15, [UIDevice task]+10, width, width);
        //: [_topview addSubview:infoBtn];
        [_topview addSubview:infoBtn];
    }



}
//: #pragma mark - 导航按钮
#pragma mark - 导航按钮
//: - (void)enterPersonInfoCard:(id)sender
- (void)colorCard:(id)sender
{
    //: NTESPersonalCardViewController *vc = [[NTESPersonalCardViewController alloc] initWithUserId:self.session.sessionId];
    HideViewController *vc = [[HideViewController alloc] initWithOn:self.session.sessionId];
    //: [self.navigationController pushViewController:vc animated:YES];
    [self.navigationController pushViewController:vc animated:YES];

}
//: - (void)enterTeamCard:(id)sender {
- (void)stratfordDoingAvon:(id)sender {
    //: BBBTeamCardViewController *vc = nil;
    DoingViewController *vc = nil;
    //: BBBTeamCardViewControllerOption *option = [[BBBTeamCardViewControllerOption alloc] init];
    ViewOption *option = [[ViewOption alloc] init];
    //: option.isTop = [NIMSDK.sharedSDK.chatExtendManager stickTopInfoForSession:self.session] != nil;
    option.isTop = [NIMSDK.sharedSDK.chatExtendManager stickTopInfoForSession:self.session] != nil;

    //: if (self.session.sessionType == NIMSessionTypeTeam) {
    if (self.session.sessionType == NIMSessionTypeTeam) {
        //: NIMTeam *team = [[NIMSDK sharedSDK].teamManager teamById:self.session.sessionId];
        NIMTeam *team = [[NIMSDK sharedSDK].teamManager teamById:self.session.sessionId];
        //: if(team.type == NIMTeamTypeAdvanced){
        if(team.type == NIMTeamTypeAdvanced){
            //: vc = [[CCCAdvancedTeamCardViewController alloc] initWithTeam:team
            vc = [[AssemblageViewController alloc] initWithMax:team
                                                                 //: session:self.session
                                                                 length:self.session
                                                                  //: option:option];
                                                                  teamRecording:option];
            //: vc.delegate = self;
            vc.delegate = self;
        }
    }
    //: if (vc) {
    if (vc) {
        //: [self.navigationController pushViewController:vc animated:YES];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

//: - (void)gotoBack:(id)sender {
- (void)mentalPictureBack:(id)sender {
    //: [self.navigationController popViewControllerAnimated:NO];
    [self.navigationController popViewControllerAnimated:NO];
}

//: - (void)setupTableView
- (void)aggregation
{
    //: CGFloat safeAreaInsetsBottom = [UIDevice vg_safeDistanceBottom];
    CGFloat safeAreaInsetsBottom = [UIDevice dayEqual];
    //: CGFloat containerSafeHeight = [UIScreen mainScreen].bounds.size.height - safeAreaInsetsBottom - 0;
    CGFloat containerSafeHeight = [UIScreen mainScreen].bounds.size.height - safeAreaInsetsBottom - 0;

    //: self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, containerSafeHeight-101) style:UITableViewStylePlain];
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, containerSafeHeight-101) style:UITableViewStylePlain];
//    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, SCREEN_TOP_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT-SCREEN_TOP_HEIGHT-SCREEN_TABBAR_HEIGHT-SCREEN_BOTTOM_HEIGHT) style:UITableViewStylePlain];
//    self.tableView.backgroundColor = NEEKIT_UIColorFromRGB(0xe4e7ec);
    //: self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.backgroundColor = [UIColor clearColor];
    //: self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    //: self.tableView.estimatedRowHeight = 0;
    self.tableView.estimatedRowHeight = 0;
    //: self.tableView.estimatedSectionHeaderHeight = 0;
    self.tableView.estimatedSectionHeaderHeight = 0;
    //: self.tableView.estimatedSectionFooterHeight = 0;
    self.tableView.estimatedSectionFooterHeight = 0;
    //: self.tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    //: self.tableViewTapGesture = [[UITapGestureRecognizer alloc] init];
    self.tableViewTapGesture = [[UITapGestureRecognizer alloc] init];
    //: self.tableViewTapGesture.cancelsTouchesInView = NO;
    self.tableViewTapGesture.cancelsTouchesInView = NO;
    //: [self.tableViewTapGesture addTarget:self action:@selector(onTapTableView:)];
    [self.tableViewTapGesture addTarget:self action:@selector(borders:)];
    //: [self.tableView addGestureRecognizer:self.tableViewTapGesture];
    [self.tableView addGestureRecognizer:self.tableViewTapGesture];
    //: self.tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    self.tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;

    //: if ([self.sessionConfig respondsToSelector:@selector(sessionBackgroundImage)] && [self.sessionConfig sessionBackgroundImage]) {
    if ([self.sessionConfig respondsToSelector:@selector(toOn)] && [self.sessionConfig toOn]) {
        //: UIImageView *imgView = [[UIImageView alloc] initWithFrame:self.view.bounds];
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:self.view.bounds];
        //: imgView.image = [self.sessionConfig sessionBackgroundImage];
        imgView.image = [self.sessionConfig toOn];
        //: imgView.contentMode = UIViewContentModeScaleAspectFill;
        imgView.contentMode = UIViewContentModeScaleAspectFill;
        //: self.tableView.backgroundView = imgView;
        self.tableView.backgroundView = imgView;
    }
    //: [self.view addSubview:self.tableView];
    [self.view addSubview:self.tableView];

}


//: - (void)setupInputView
- (void)dismissIn
{
    //: if ([self shouldShowInputView])
    if ([self media])
    {
        //: self.sessionInputView = [[AAAInputView alloc] initWithFrame:CGRectMake(0, 0, self.view.nim_width,0) config:self.sessionConfig];
        self.sessionInputView = [[ClueView alloc] initWithTing:CGRectMake(0, 0, self.view.nim_width,0) valueEnableConfig:self.sessionConfig];
        //: self.sessionInputView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
        self.sessionInputView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
        //: [self.sessionInputView setSession:self.session];
        [self.sessionInputView setSession:self.session];
        //: [self.sessionInputView setInputDelegate:self];
        [self.sessionInputView setInputDelegate:self];
        //: [self.sessionInputView setInputActionDelegate:self];
        [self.sessionInputView setSignalingColor:self];
        //: [self.sessionInputView refreshStatus:NIMInputStatusText];
        [self.sessionInputView clean:NIMInputStatusText];
        //: [self.view addSubview:_sessionInputView];
        [self.view addSubview:_sessionInputView];
        //: self.tableView.bottom = self.sessionInputView.top;
        self.tableView.bottom = self.sessionInputView.top;
//        self.tableView.top = self.topview.bottom;
        //: [self.tableView sizeToFit];
        [self.tableView sizeToFit];
    }
}


//: - (void)setupConfigurator
- (void)remote
{
    //: _configurator = [[CCCSessionConfigurator alloc] init];
    _configurator = [[MessageDoingIcon alloc] init];
    //: [_configurator setup:self];
    [_configurator objectEmpty:self];

    //: BOOL needProximityMonitor = [self needProximityMonitor];
    BOOL needProximityMonitor = [self light];
    //: [[NIMSDK sharedSDK].mediaManager setNeedProximityMonitor:needProximityMonitor];
    [[NIMSDK sharedSDK].mediaManager setNeedProximityMonitor:needProximityMonitor];
}

//: - (void)viewWillAppear:(BOOL)animated
- (void)viewWillAppear:(BOOL)animated
{
    //: [super viewWillAppear:animated];
    [super viewWillAppear:animated];
    //: [self.interactor onViewWillAppear];
    [self.interactor viewObjectAppear];
    //: [self addListener];
    [self isClear];

    //: self.sessionUnreadCount = [NIMSDK sharedSDK].conversationManager.allUnreadCount;
    self.sessionUnreadCount = [NIMSDK sharedSDK].conversationManager.allUnreadCount;
    //: [self refreshSessionBadge];
    [self quick];
    //: [self.navigationController.navigationBar setHidden:YES];
    [self.navigationController.navigationBar setHidden:YES];
    //: [self.tableView reloadData];
    [self.tableView reloadData];
}

//: - (void)viewWillDisappear:(BOOL)animated
- (void)viewWillDisappear:(BOOL)animated
{
    //: [super viewWillDisappear:animated];
    [super viewWillDisappear:animated];
    //: [self.sessionInputView endEditing:YES];
    [self.sessionInputView endEditing:YES];
    // 隐藏长按弹窗
    //: [CCCBubbleMenuView.shareMenuView removeFromSuperview];
    [InformationHideView.pastCard removeFromSuperview];
    //: [self.navigationController.navigationBar setHidden:NO];
    [self.navigationController.navigationBar setHidden:NO];
}

//: - (void)viewDidDisappear:(BOOL)animated
- (void)viewDidDisappear:(BOOL)animated
{
    //: [super viewDidDisappear:animated];
    [super viewDidDisappear:animated];
    //: [self.interactor onViewDidDisappear];
    [self.interactor message];
    //: [[NIMSDK sharedSDK].mediaManager removeDelegate:self];
    [[NIMSDK sharedSDK].mediaManager removeDelegate:self];
}

//: - (void)viewDidLayoutSubviews
- (void)viewDidLayoutSubviews
{
    //: [super viewDidLayoutSubviews];
    [super viewDidLayoutSubviews];
//    [self changeLeftBarBadge:self.conversationManager.allUnreadCount];
    //: [self.interactor resetLayout];
    [self.interactor circle];
}

//: - (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    [self.serviceContentTextView hideTextSelection];
    //: [CCCBubbleMenuView.shareMenuView removeFromSuperview];
    [InformationHideView.pastCard removeFromSuperview];
    //: [self.view endEditing:YES];
    [self.view endEditing:YES];
}

//: - (void)scrollViewDidScroll:(UIScrollView *)scrollView {
- (void)deadLanguage:(UIScrollView *)scrollView {
    //: if ([scrollView isKindOfClass:[UITextView class]]) {
    if ([scrollView isKindOfClass:[UITextView class]]) {
        //: [CCCBubbleMenuView.shareMenuView removeFromSuperview];
        [InformationHideView.pastCard removeFromSuperview];
    }
    //: [self.view endEditing:YES];
    [self.view endEditing:YES];
}



//: #pragma mark - 消息收发接口
#pragma mark - 消息收发接口
//: - (void)sendMessage:(NIMMessage *)message
- (void)limit:(NIMMessage *)message
{
    //: [self.interactor sendMessage:message toMessage:nil];
    [self.interactor gesture:message recording:nil];
    //: [self cleanMenuMessage];
    [self finishMessage];

}

//: - (void)sendMessage:(NIMMessage *)message completion:(void(^)(NSError * err))completion
- (void)image:(NIMMessage *)message sortBy:(void(^)(NSError * err))completion
{
    //: __weak typeof(self) weakSelf = self;
    __weak typeof(self) weakSelf = self;
    //: [self.interactor sendMessage:message
    [self.interactor with:message
                        //: toMessage:nil
                        textDoing:nil
                      //: completion:^(NSError *err)
                      monitorAcrossCompletion:^(NSError *err)
    {
        //: if (completion)
        if (completion)
        {
            //: completion(err);
            completion(err);
        }
        //: [weakSelf cleanMenuMessage];
        [weakSelf finishMessage];
    //: }];
    }];
}


//: #pragma mark - CCCSessionConfiguratorDelegate
#pragma mark - CCCSessionConfiguratorDelegate

//: - (void)didFetchMessageData
- (void)addSelected
{
    //: [self uiCheckReceipts:nil];
    [self save:nil];
    //: [self.tableView reloadData];
    [self.tableView reloadData];
//    [self.tableView nim_scrollToBottom:NO];
}

//: - (void)didRefreshMessageData
- (void)buttonQuick
{
    //: [self refreshSessionTitle:self.sessionTitle];
    [self user:self.birdSEyeViewContent];
    //: [self refreshSessionSubTitle:self.sessionSubTitle];
    [self peculiarSpecialSession:self.input];
    //: [self.tableView reloadData];
    [self.tableView reloadData];
}

//: - (void)didPullUpMessageData {}
- (void)withTime {}

//: #pragma mark - 会话title
#pragma mark - 会话title
//: - (NSString *)sessionTitle
- (NSString *)birdSEyeViewContent
{
    //: NSString *title = @"";
    NSString *title = @"";
    //: NIMSessionType type = self.session.sessionType;
    NIMSessionType type = self.session.sessionType;
    //: switch (type) {
    switch (type) {
        //: case NIMSessionTypeTeam:{
        case NIMSessionTypeTeam:{
            //: NIMTeam *team = [[[NIMSDK sharedSDK] teamManager] teamById:self.session.sessionId];
            NIMTeam *team = [[[NIMSDK sharedSDK] teamManager] teamById:self.session.sessionId];
            //: title = [NSString stringWithFormat:@"%@(%zd)",[team teamName],[team memberNumber]];
            title = [NSString stringWithFormat:@"%@(%zd)",[team teamName],[team memberNumber]];
            //: title = [NSString stringWithFormat:@"%@",[team teamName]];
            title = [NSString stringWithFormat:@"%@",[team teamName]];//不要人数

        }
            //: break;
            break;
        //: case NIMSessionTypeP2P:{
        case NIMSessionTypeP2P:{
            //: title = [AAAKitUtil showNick:self.session.sessionId inSession:self.session];
            title = [TypicalCenter exhibit:self.session.sessionId withWill:self.session];
        }
            //: break;
            break;
        //: case NIMSessionTypeSuperTeam: {
        case NIMSessionTypeSuperTeam: {
            //: NIMTeam *team = [[[NIMSDK sharedSDK] superTeamManager] teamById:self.session.sessionId];
            NIMTeam *team = [[[NIMSDK sharedSDK] superTeamManager] teamById:self.session.sessionId];
            //: title = [NSString stringWithFormat:@"%@(%zd)",[team teamName],[team memberNumber]];
            title = [NSString stringWithFormat:@"%@(%zd)",[team teamName],[team memberNumber]];
            //: title = [NSString stringWithFormat:@"%@",[team teamName]];
            title = [NSString stringWithFormat:@"%@",[team teamName]];//不要人数

        }
        //: default:
        default:
            //: break;
            break;
    }
    //: return title;
    return title;
}

//: - (NSString *)sessionSubTitle{return @"";};
- (NSString *)input{return @"";};

//: #pragma mark - 状态操作
#pragma mark - 状态操作
//: - (NIMKitSessionState)sessionState {
- (NIMKitSessionState)tableTeam {
    //: return [self.interactor sessionState];
    return [self.interactor orientation];
}

//: - (void)setSessionState:(NIMKitSessionState)state {
- (void)setTableTeam:(NIMKitSessionState)state {
    //: [self.interactor setSessionState:state];
    [self.interactor setOrientation:state];
}

//: #pragma mark - NIMChatManagerDelegate
#pragma mark - NIMChatManagerDelegate
//开始发送
//: - (void)willSendMessage:(NIMMessage *)message
- (void)willSendMessage:(NIMMessage *)message
{
    //: id<NIMSessionInteractor> interactor = self.interactor;
    id<WriterSContentSumeractor> interactor = self.interactor;

    //: if ([message.session isEqual:self.session]) {
    if ([message.session isEqual:self.session]) {
        //: if ([interactor findMessageModel:message]) {
        if ([interactor agendaItem:message]) {
            //: [interactor updateMessage:message];
            [interactor text:message];
        //: }else{
        }else{
            //: [interactor addMessages:@[message]];
            [interactor supplement:@[message]];
        }
    }
}

//上传资源文件成功
//: - (void)uploadAttachmentSuccess:(NSString *)urlString
- (void)uploadAttachmentSuccess:(NSString *)urlString
                     //: forMessage:(NIMMessage *)message
                     forMessage:(NIMMessage *)message
{
    //如果需要使用富文本推送，可以在这里进行 message apns payload 的设置
//    [self.tableView reloadData];
}


//发送结果
//: - (void)sendMessage:(NIMMessage *)message didCompleteWithError:(NSError *)error
- (void)sendMessage:(NIMMessage *)message didCompleteWithError:(NSError *)error
{
    //: if ([message.session isEqual:_session])
    if ([message.session isEqual:_session])
    {
        //: if( message.messageType == NIMMessageTypeImage){
        if( message.messageType == NIMMessageTypeImage){
            //缓存图片URL
            //: NIMImageObject *imageObject = message.messageObject;
            NIMImageObject *imageObject = message.messageObject;
            //: NSString *urlString = imageObject.url;
            NSString *urlString = imageObject.url;

            //: NSMutableDictionary *dic = [[CCCConfig sharedConfig] Gdic];
            NSMutableDictionary *dic = [[IndueColor originAcross] Gdic];
            //: NSData *data = [dic objectForKey:message.messageId];
            NSData *data = [dic objectForKey:message.messageId];
            //: if(data && urlString){
            if(data && urlString){
                //: NSString *key = [[SDWebImageManager sharedManager]cacheKeyForURL:[NSURL URLWithString:urlString]];
                NSString *key = [[SDWebImageManager sharedManager]cacheKeyForURL:[NSURL URLWithString:urlString]];
                //: dic[message.messageId] = nil;
                dic[message.messageId] = nil;
                //: __weak typeof(self) weakSelf = self;
                __weak typeof(self) weakSelf = self;
                //: [[SDImageCache sharedImageCache] storeImageData:data forKey:key completion:^{
                [[SDImageCache sharedImageCache] storeImageData:data forKey:key completion:^{
                    //: [weakSelf.interactor updateMessage:message];
                    [weakSelf.interactor text:message];
                //: }];
                }];
            }
        //: }else{
        }else{
            //: [self.interactor updateMessage:message];
            [self.interactor text:message];
//            [self.tableView reloadData];
        }


        //: if (message.session.sessionType == NIMSessionTypeTeam ||
        if (message.session.sessionType == NIMSessionTypeTeam ||
            //: message.session.sessionType == NIMSessionTypeSuperTeam)
            message.session.sessionType == NIMSessionTypeSuperTeam)
        {
            //如果是群的话需要检查一下回执显示情况
            //: NIMMessageReceipt *receipt = [[NIMMessageReceipt alloc] initWithMessage:message];
            NIMMessageReceipt *receipt = [[NIMMessageReceipt alloc] initWithMessage:message];
            //: [self.interactor checkReceipts:@[receipt]];
            [self.interactor more:@[receipt]];
        }
    }

}


//发送进度
//: -(void)sendMessage:(NIMMessage *)message progress:(float)progress
-(void)sendMessage:(NIMMessage *)message progress:(float)progress
{
    //: if ([message.session isEqual:_session]) {
    if ([message.session isEqual:_session]) {
        //: [self.interactor updateMessage:message];
        [self.interactor text:message];
    }
}

//接收消息
//: - (void)onRecvMessages:(NSArray *)messages
- (void)onRecvMessages:(NSArray *)messages
{
    //: if ([self shouldAddListenerForNewMsg])
    if ([self color])
    {
        //: NIMMessage *message = messages.firstObject;
        NIMMessage *message = messages.firstObject;
        //: NIMSession *session = message.session;
        NIMSession *session = message.session;

        //: if (![session isEqual:self.session] || !messages.count)
        if (![session isEqual:self.session] || !messages.count)
        {
            //: return;
            return;
        }

        //: [self uiInsertMessages:messages];
        [self should:messages];
        //: [self.interactor markRead:NO];
        [self.interactor tinkleRead:NO];

        // 群禁言后输入框改变占位符文字
        //: [self setBannedSpeakingWithMessage:messages];
        [self setBubble:messages];
    }
}

//: - (void)setBannedSpeakingWithMessage:(NSArray <NIMMessage *>*)messages {
- (void)setBubble:(NSArray <NIMMessage *>*)messages {

    //: [messages enumerateObjectsUsingBlock:^(NIMMessage * _Nonnull message, NSUInteger idx, BOOL * _Nonnull stop) {
    [messages enumerateObjectsUsingBlock:^(NIMMessage * _Nonnull message, NSUInteger idx, BOOL * _Nonnull stop) {

        //: NIMNotificationObject *object = message.messageObject;
        NIMNotificationObject *object = message.messageObject;
        //: if (object && [object isKindOfClass:NIMNotificationObject.class] && object.notificationType == NIMNotificationTypeTeam)
        if (object && [object isKindOfClass:NIMNotificationObject.class] && object.notificationType == NIMNotificationTypeTeam)
        {
            //: NIMTeamNotificationContent *content = (NIMTeamNotificationContent*)object.content;
            NIMTeamNotificationContent *content = (NIMTeamNotificationContent*)object.content;
            //: id attachment = [content attachment];
            id attachment = [content attachment];
            //: if (attachment && [attachment isKindOfClass:[NIMUpdateTeamInfoAttachment class]]) {
            if (attachment && [attachment isKindOfClass:[NIMUpdateTeamInfoAttachment class]]) {

                //: NIMUpdateTeamInfoAttachment *teamAttachment = (NIMUpdateTeamInfoAttachment *)attachment;
                NIMUpdateTeamInfoAttachment *teamAttachment = (NIMUpdateTeamInfoAttachment *)attachment;
                //: if (teamAttachment && [teamAttachment.values count] > 0) {
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


                    //: if ([[teamAttachment.values allKeys] containsObject:@(101)]) {
                    if ([[teamAttachment.values allKeys] containsObject:@(101)]) {
                        //: BOOL banned = [teamAttachment.values boolValueForKey:@(101)];
                        BOOL banned = [teamAttachment.values packet:@(101)];
                        //: [self setInputViewPlaceholder:banned];
                        [self setLabelPlaceholder:banned];
                    }

                    //: else if ([[teamAttachment.values allKeys] containsObject:@(100)]) {
                    else if ([[teamAttachment.values allKeys] containsObject:@(100)]) {
                        //: BOOL banned = [teamAttachment.values boolValueForKey:@(100)];
                        BOOL banned = [teamAttachment.values packet:@(100)];
                        //: [self setInputViewPlaceholder:banned];
                        [self setLabelPlaceholder:banned];
                    }

                }

            }
        }
    //: }];
    }];
}

//: - (void)setInputViewPlaceholder:(BOOL)ban {
- (void)setLabelPlaceholder:(BOOL)ban {
    //: if (ban){
    if (ban){
        //: [self.sessionInputView setInputTextPlaceHolder:[NTESLanguageManager getTextWithKey:@"message_administrator_speak"] color:[UIColor redColor]];
        [self.sessionInputView message:[MaxInformation off:StringFromVaccineData(&str_textSpeciallyData)] color:[UIColor redColor]];
        //: self.sessionInputView.userInteractionEnabled = NO;
        self.sessionInputView.userInteractionEnabled = NO;
        //: self.canTapVoiceBtn = NO;
        self.canTapVoiceBtn = NO;
    //: } else {
    } else {
        //: [self.sessionInputView setInputTextPlaceHolder:[NTESLanguageManager getTextWithKey:@"message_please_enter_content"] color:[UIColor grayColor]];
        [self.sessionInputView message:[MaxInformation off:StringFromVaccineData(&str_basketballTitle)] color:[UIColor grayColor]];
        //: self.sessionInputView.userInteractionEnabled = YES;
        self.sessionInputView.userInteractionEnabled = YES;
        //: self.canTapVoiceBtn = YES;
        self.canTapVoiceBtn = YES;
    }
}

//: - (void)fetchMessageAttachment:(NIMMessage *)message progress:(float)progress
- (void)fetchMessageAttachment:(NIMMessage *)message progress:(float)progress
{
    //: if ([message.session isEqual:_session])
    if ([message.session isEqual:_session])
    {
        //: [self.interactor updateMessage:message];
        [self.interactor text:message];
    }
}

//: - (void)fetchMessageAttachment:(NIMMessage *)message didCompleteWithError:(NSError *)error
- (void)fetchMessageAttachment:(NIMMessage *)message didCompleteWithError:(NSError *)error
{
    //: if ([message.session isEqual:_session])
    if ([message.session isEqual:_session])
    {
        //: BBBMessageModel *model = [self.interactor findMessageModel:message];
        AccumulationCenter *model = [self.interactor agendaItem:message];
        //下完缩略图之后，因为比例有变化，重新刷下宽高。
        //: [model cleanCache];
        [model cell];
        //: [self.interactor updateMessage:message];
        [self.interactor text:message];
    }
}

//: - (void)onRecvMessageReceipts:(NSArray<NIMMessageReceipt *> *)receipts
- (void)onRecvMessageReceipts:(NSArray<NIMMessageReceipt *> *)receipts
{
    //: if ([self shouldAddListenerForNewMsg])
    if ([self color])
    {
        //: NSMutableArray *handledReceipts = [[NSMutableArray alloc] init];
        NSMutableArray *handledReceipts = [[NSMutableArray alloc] init];
        //: for (NIMMessageReceipt *receipt in receipts) {
        for (NIMMessageReceipt *receipt in receipts) {
            //: if ([receipt.session isEqual:self.session])
            if ([receipt.session isEqual:self.session])
            {
                //: [handledReceipts addObject:receipt];
                [handledReceipts addObject:receipt];
            }
        }
        //: if (handledReceipts.count)
        if (handledReceipts.count)
        {
            //: [self uiCheckReceipts:handledReceipts];
            [self save:handledReceipts];
        }
    }
}

//: #pragma mark - NIMConversationManagerDelegate
#pragma mark - NIMConversationManagerDelegate
//- (void)messagesDeletedInSession:(NIMSession *)session{
//    [self.interactor resetMessages:nil];
//    [self.tableView reloadData];
//}

// 远端消息清空回调
//: - (void)onRecvAllRemoteMessagesInSessionDeleted:(NIMSessionDeleteAllRemoteMessagesInfo *)info
- (void)onRecvAllRemoteMessagesInSessionDeleted:(NIMSessionDeleteAllRemoteMessagesInfo *)info
{
    //: [self refreshMessages];
    [self refresh];
}

// 远端消息批量删除删除回调
//: - (void)onRecvMessagesDeleted:(NSArray<NIMMessage *> *)messages exts:(NSDictionary<NSString *,NSString *> *)exts
- (void)onRecvMessagesDeleted:(NSArray<NIMMessage *> *)messages exts:(NSDictionary<NSString *,NSString *> *)exts
{
    //: [self refreshMessages];
    [self refresh];
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


//: - (void)changeUnreadCount:(NIMRecentSession *)recentSession
- (void)be:(NIMRecentSession *)recentSession
         //: totalUnreadCount:(NSInteger)totalUnreadCount{
         line:(NSInteger)totalUnreadCount{
    //: if ([recentSession.session isEqual:self.session]) {
    if ([recentSession.session isEqual:self.session]) {
        //: return;
        return;
    }

}

//: #pragma mark - NIMMediaManagerDelegate
#pragma mark - NIMMediaManagerDelegate
//: - (void)recordAudio:(NSString *)filePath didBeganWithError:(NSError *)error {
- (void)recordAudio:(NSString *)filePath didBeganWithError:(NSError *)error {
    //: if (!filePath || error) {
    if (!filePath || error) {
        //: _sessionInputView.recording = NO;
        _sessionInputView.recording = NO;
        //: [self onRecordFailed:error];
        [self color:error];
    }
}

//: - (void)recordAudio:(NSString *)filePath didCompletedWithError:(NSError *)error {
- (void)recordAudio:(NSString *)filePath didCompletedWithError:(NSError *)error {
    //: if(!error) {
    if(!error) {
        //: if ([self recordFileCanBeSend:filePath]) {
        if ([self childMax:filePath]) {
            //: [self sendMessage:[CCCMessageMaker msgWithAudio:filePath]];
            [self limit:[Maker image:filePath]];
        //: }else{
        }else{
            //: [self showRecordFileNotSendReason];
            [self chronicle];
        }
    //: } else {
    } else {
        //: [self onRecordFailed:error];
        [self color:error];
    }
    //: _sessionInputView.recording = NO;
    _sessionInputView.recording = NO;
}


//: - (void)recordAudioDidCancelled {
- (void)recordAudioDidCancelled {
    //: _sessionInputView.recording = NO;
    _sessionInputView.recording = NO;
}

//: - (void)recordAudioProgress:(NSTimeInterval)currentTime {
- (void)recordAudioProgress:(NSTimeInterval)currentTime {
    //: [_sessionInputView updateAudioRecordTime:currentTime];
    [_sessionInputView quick:currentTime];
}

//: - (void)recordAudioInterruptionBegin {
- (void)recordAudioInterruptionBegin {
    //: [[NIMSDK sharedSDK].mediaManager cancelRecord];
    [[NIMSDK sharedSDK].mediaManager cancelRecord];
}

//: #pragma mark - 录音相关接口
#pragma mark - 录音相关接口
//: - (void)onRecordFailed:(NSError *)error{}
- (void)color:(NSError *)error{}

//: - (BOOL)recordFileCanBeSend:(NSString *)filepath
- (BOOL)childMax:(NSString *)filepath
{
    //: return YES;
    return YES;
}

//: - (void)showRecordFileNotSendReason{}
- (void)chronicle{}

//: #pragma mark - NIMInputDelegate
#pragma mark - OffDelegate

//: - (void)didChangeInputHeight:(CGFloat)inputHeight
- (void)dataTip:(CGFloat)inputHeight
{
    //: [self.interactor changeLayout:inputHeight];
    [self.interactor viewSize:inputHeight];
}

//: #pragma mark - NIMInputActionDelegate
#pragma mark - ColorDelegate
//: - (BOOL)onTapMediaItem:(BBBMediaItem *)item{
- (BOOL)allOf:(WithMin *)item{
    //: SEL sel = item.selctor;
    SEL sel = item.selctor;
    //: BOOL handled = sel && [self respondsToSelector:sel];
    BOOL handled = sel && [self respondsToSelector:sel];
    //: if (handled) {
    if (handled) {
        //: do {
        do {
        //: [self performSelector:sel withObject:item];
        [self performSelector:sel withObject:item];
        //: } while (0);
        } while (0);
        //: handled = YES;
        handled = YES;
    }
    //: return handled;
    return handled;
}

//: - (void)onTextChanged:(id)sender{}
- (void)onGreen:(id)sender{}

//: - (void)onSendText:(NSString *)text atUsers:(NSArray *)atUsers
- (void)aggregationRemove:(NSString *)text input:(NSArray *)atUsers
{
    //: NSMutableArray *users = [NSMutableArray arrayWithArray:atUsers];
    NSMutableArray *users = [NSMutableArray arrayWithArray:atUsers];
    //: if (self.session.sessionType == NIMSessionTypeP2P)
    if (self.session.sessionType == NIMSessionTypeP2P)
    {
        //: [users addObject:self.session.sessionId];
        [users addObject:self.session.sessionId];
    }

    //: NIMMessage *message = [CCCMessageMaker msgWithText:text];
    NIMMessage *message = [Maker streetwiseTitle:text];
    //: if (atUsers.count)
    if (atUsers.count)
    {
        //: NIMMessageApnsMemberOption *apnsOption = [[NIMMessageApnsMemberOption alloc] init];
        NIMMessageApnsMemberOption *apnsOption = [[NIMMessageApnsMemberOption alloc] init];
        //: apnsOption.userIds = atUsers;
        apnsOption.userIds = atUsers;
        //: apnsOption.forcePush = YES;
        apnsOption.forcePush = YES;

        //: BBBKitInfoFetchOption *option = [[BBBKitInfoFetchOption alloc] init];
        TitleOption *option = [[TitleOption alloc] init];
        //: option.session = self.session;
        option.session = self.session;

        //: NSString *me = [[AppleProjectKit sharedKit].provider infoByUser:[NIMSDK sharedSDK].loginManager.currentAccount option:option].showName;
        NSString *me = [[Indicator reach].provider indoors:[NIMSDK sharedSDK].loginManager.currentAccount harvest:option].showName;
        //: apnsOption.apnsContent = [NSString stringWithFormat:@"%@在群里@了你".nim_localized, me];
        apnsOption.apnsContent = [NSString stringWithFormat:StringFromVaccineData(&str_visionTitle).trapLocalized, me];
        //: message.apnsMemberOption = apnsOption;
        message.apnsMemberOption = apnsOption;
    }

    //: [self sendMessage:message];
    [self limit:message];
}

//: - (void)onSelectEmoticon:(NIMInputEmoticon *)emoticon
- (void)sound:(LiquidEcstasyEmoticon *)emoticon
{
    //: NSString *emoticonID = emoticon.emoticonID;
    NSString *emoticonID = emoticon.emoticonID;
    //: NSArray *array = [emoticonID componentsSeparatedByString:@"_"];
    NSArray *array = [emoticonID componentsSeparatedByString:@"_"];
    //: NSString *numberStr = [array lastObject];
    NSString *numberStr = [array lastObject];
    //: NSInteger number = [numberStr integerValue];
    NSInteger number = [numberStr integerValue];
    //: __block NIMQuickComment *newComment = [NIMCommentMaker commentWithType:number content:emoticon.tag ext:@"扩展"];
    __block NIMQuickComment *newComment = [NameMaker thread:number item:emoticon.tag enableMy:@"扩展"];

    //: __weak typeof(self) weakSelf = self;
    __weak typeof(self) weakSelf = self;
    //: [self hadCommentThisMessage:self.messageForMenu type:number
    [self at:self.messageForMenu signal:number
                      //: compltion:^(NSMapTable *result)
                      toEvent:^(NSMapTable *result)
     {
        //: NIMQuickComment *oldComment = [AAAKitQuickCommentUtil myCommentFromComments:0 keys:@[@(number)] comments:result];
        NIMQuickComment *oldComment = [CaseOfMaxTeam edge:0 carte:@[@(number)] switchlineTable:result];
        //: BOOL contains = oldComment ? YES : NO;
        BOOL contains = oldComment ? YES : NO;
        //: if (!contains)
        if (!contains)
        {
            //: [weakSelf.interactor addQuickComment:newComment
            [weakSelf.interactor file:newComment
                                  //: completion:^(NSError *error)
                                  nim:^(NSError *error)
            {
//                [self.view hideToasts];
                //: if (error)
                if (error)
                {
                    //: [weakSelf.view makeToast:[NTESLanguageManager getTextWithKey:@"group_info_activity_op_failed"] duration:2 position:CSToastPositionCenter];
                    [weakSelf.view makeToast:[MaxInformation off:StringFromVaccineData(&str_ministrationName)] duration:2 position:CSToastPositionCenter];
                }

                //: [weakSelf cleanMenuMessage];
                [weakSelf finishMessage];
            //: }];
            }];
        }
        //: else
        else
        {
            //: [weakSelf.interactor delQuickComment:oldComment
            [weakSelf.interactor save:oldComment
                                   //: targetMessage:weakSelf.messageForMenu
                                   speedyWithoutCompletion:weakSelf.messageForMenu
                                      //: completion:^(NSError *error)
                                      message:^(NSError *error)
            {
//                [self.view hideToasts];
                //: if (error)
                if (error)
                {
                    //: [weakSelf.view makeToast:[NTESLanguageManager getTextWithKey:@"group_info_activity_op_failed"] duration:2 position:CSToastPositionCenter];
                    [weakSelf.view makeToast:[MaxInformation off:StringFromVaccineData(&str_ministrationName)] duration:2 position:CSToastPositionCenter];
                }

                //: [weakSelf cleanMenuMessage];
                [weakSelf finishMessage];
            //: }];
            }];
        }
    //: }];
    }];
}

//: - (void)didReplyCancelled
- (void)displayFor
{
    //: self.messageForMenu = nil;
    self.messageForMenu = nil;
    //: [self.interactor setReferenceMessage:nil];
    [self.interactor setReferenceMessage:nil];

    //: if ([self.sessionConfig respondsToSelector:@selector(clearThreadMessageAfterSent)])
    if ([self.sessionConfig respondsToSelector:@selector(handicappedCrop)])
    {
        //: if ([self.sessionConfig clearThreadMessageAfterSent])
        if ([self.sessionConfig handicappedCrop])
        {
            //: [self.sessionConfig cleanThreadMessage];
            [self.sessionConfig message];
        }
    }
}


//: - (void)onSelectChartlet:(NSString *)chartletId
- (void)compass:(NSString *)chartletId
                 //: catalog:(NSString *)catalogId
                 viewCatalog:(NSString *)catalogId
{
//    NSBundle *bundle = [Indicator sharedKit].emoticonBundle;
//    NSData *imageData = [NSData dataWithContentsOfFile:[bundle pathForResource:chartletId ofType:nil inDirectory:NEEKIT_EmojiPath]];
    //: NSString *emojiPath = [[SSZipArchiveManager sharedManager] getEmojiPath];
    NSString *emojiPath = [[EnableChildWith containerMessage] withSize];
    //: NSString *imagePath = [emojiPath stringByAppendingPathComponent:chartletId];
    NSString *imagePath = [emojiPath stringByAppendingPathComponent:chartletId];
    //: NSData *imageData = [NSData dataWithContentsOfFile:imagePath];
    NSData *imageData = [NSData dataWithContentsOfFile:imagePath];
//    UIImage *gif = [UIImage sd_imageWithGIFData:imageData];
//
//    NIMMessage *message = [Maker msgWithImage:gif];
//    [self sendMessage:message];
//

    //: NIMMessage *message = [CCCMessageMaker msgWithImageData:imageData extension:@""];
    NIMMessage *message = [Maker pressedText:imageData imaginationImageFrame:@""];
//    message.messageSubType = 77;//标记gif用
    //: NSMutableDictionary *dic = [[CCCConfig sharedConfig] Gdic];
    NSMutableDictionary *dic = [[IndueColor originAcross] Gdic];
//    NSData *imageData = UIImagePNGRepresentation(image);
    //: [dic setObject:imageData forKey:message.messageId];
    [dic setObject:imageData forKey:message.messageId];

    //: [self sendMessage:message];
    [self limit:message];

    //: [self.sessionInputView.toolBar setPlaceHolder:[NTESLanguageManager getTextWithKey:@"message_please_enter_content"]];
    [self.sessionInputView.toolBar setHolder:[MaxInformation off:StringFromVaccineData(&str_basketballTitle)]];

//    [self.sessionInputView endEditing:YES];
}

//: - (void)onCancelRecording
- (void)highlightClick
{
    //: [[NIMSDK sharedSDK].mediaManager cancelRecord];
    [[NIMSDK sharedSDK].mediaManager cancelRecord];
}

//: - (void)onStopRecording
- (void)signalLanguage
{
    //: [[NIMSDK sharedSDK].mediaManager stopRecord];
    [[NIMSDK sharedSDK].mediaManager stopRecord];
//    [self.audioContent animationClose];
}

//: - (void)onStartRecording
- (void)systemNumber
{
    //: _sessionInputView.recording = YES;
    _sessionInputView.recording = YES;
//    [_sessionInputView endEditing:YES];

    //: NIMAudioType type = [self recordAudioType];
    NIMAudioType type = [self tip];
    //: NSTimeInterval duration = [AppleProjectKit sharedKit].config.recordMaxDuration;
    NSTimeInterval duration = [Indicator reach].config.recordMaxDuration;

    //: [[NIMSDK sharedSDK].mediaManager addDelegate:self];
    [[NIMSDK sharedSDK].mediaManager addDelegate:self];

    //: [[NIMSDK sharedSDK].mediaManager record:type
    [[NIMSDK sharedSDK].mediaManager record:type
                                   //: duration:duration];
                                   duration:duration];
}

//: #pragma mark NIMChatExtendManagerDelegate
#pragma mark NIMChatExtendManagerDelegate

//: - (void)onRecvQuickComment:(NIMQuickComment *)comment
- (void)onRecvQuickComment:(NIMQuickComment *)comment
{
    //: [self.interactor updateMessage:comment.message];
    [self.interactor text:comment.message];
}


//: - (void)onRemoveQuickComment:(NIMQuickComment *)comment
- (void)onRemoveQuickComment:(NIMQuickComment *)comment
{
    //: [self.interactor updateMessage:comment.message];
    [self.interactor text:comment.message];
}

//: - (void)onNotifyAddMessagePin:(NIMMessagePinItem *)item
- (void)onNotifyAddMessagePin:(NIMMessagePinItem *)item
{
    //: NIMMessage *message = [NIMSDK.sharedSDK.conversationManager messagesInSession:self.session messageIds:@[item.messageId]].lastObject;
    NIMMessage *message = [NIMSDK.sharedSDK.conversationManager messagesInSession:self.session messageIds:@[item.messageId]].lastObject;
    //: [self uiPinMessage:message];
    [self recent:message];
}

//: - (void)onNotifyRemoveMessagePin:(NIMMessagePinItem *)item
- (void)onNotifyRemoveMessagePin:(NIMMessagePinItem *)item
{
    //: NIMMessage *message = [NIMSDK.sharedSDK.conversationManager messagesInSession:self.session messageIds:@[item.messageId]].lastObject;
    NIMMessage *message = [NIMSDK.sharedSDK.conversationManager messagesInSession:self.session messageIds:@[item.messageId]].lastObject;
    //: [self uiUnpinMessage:message];
    [self withMessage:message];
}

//: #pragma mark - CCCMessageCellDelegate
#pragma mark - StateAddLight
//: - (BOOL)onTapCell:(BBBKitEvent *)event{
- (BOOL)anTo:(MightHaveBeenAdd *)event{
    //: BOOL handle = NO;
    BOOL handle = NO;
    //: NSString *eventName = event.eventName;
    NSString *eventName = event.eventName;
    //: if ([eventName isEqualToString:BBBKitEventNameTapAudio])
    if ([eventName isEqualToString:k_messageData])
    {
        //: [self.interactor mediaAudioPressed:event.messageModel];
        [self.interactor remove:event.messageModel];
        //: handle = YES;
        handle = YES;
    }
    //: return handle;
    return handle;
}

//: - (void)onRetryMessage:(NIMMessage *)message
- (void)names:(NIMMessage *)message
{
    //: if (message.isReceivedMsg) {
    if (message.isReceivedMsg) {
        //: [[[NIMSDK sharedSDK] chatManager] fetchMessageAttachment:message
        [[[NIMSDK sharedSDK] chatManager] fetchMessageAttachment:message
                                                           //: error:nil];
                                                           error:nil];
    //: }else{
    }else{
        //: [[[NIMSDK sharedSDK] chatManager] resendMessage:message
        [[[NIMSDK sharedSDK] chatManager] resendMessage:message
                                                  //: error:nil];
                                                  error:nil];
    }
}

//: - (BOOL)onLongPressCell:(NIMMessage *)message
- (BOOL)squelch:(NIMMessage *)message
                 //: inView:(UIView *)view
                 flipOptionKey:(UIView *)view
{
    //: BOOL handle = NO;
    BOOL handle = NO;
    //: _messageForMenu = message;
    _messageForMenu = message;
    //: [self.interactor setReferenceMessage:message];
    [self.interactor setReferenceMessage:message];
    //: if (![self becomeFirstResponder]) {
    if (![self becomeFirstResponder]) {
        //: handle = NO;
        handle = NO;
        //: return handle;
        return handle;
    }
    //: if ([self shouldShowMenuByMessage:message])
    if ([self link:message])
    {
        //: [CCCBubbleMenuView.shareMenuView removeFromSuperview];
        [InformationHideView.pastCard removeFromSuperview];
        //: [self showMenuWithMessage:message withView:view];
        [self recording:message retort:view];
    }
    //: handle = YES;
    handle = YES;
    //: return handle;
    return handle;
}

//: - (BOOL)onLongPressCell:(NIMMessage *)message complete:(void(^)(id data))complete; {
- (BOOL)greenIn:(NIMMessage *)message past:(void(^)(id data))complete; {
    //: BOOL handle = NO;
    BOOL handle = NO;
    //: _messageForMenu = message;
    _messageForMenu = message;
    //: [self.interactor setReferenceMessage:message];
    [self.interactor setReferenceMessage:message];

    //: handle = [self shouldShowMenuByMessage:message];
    handle = [self link:message];
    //: __weak typeof(self) wself = self;
    __weak typeof(self) wself = self;
    //: !complete ? : complete(wself);
    !complete ? : complete(wself);

    //: return handle;
    return handle;
}

//: - (BOOL)onLongPressCell:(NIMMessage *)message
- (BOOL)itemCell:(NIMMessage *)message
{
    //: BOOL handle = NO;
    BOOL handle = NO;
    //: _messageForMenu = message;
    _messageForMenu = message;
    //: [self.interactor setReferenceMessage:message];
    [self.interactor setReferenceMessage:message];
    //: if (![self becomeFirstResponder]) {
    if (![self becomeFirstResponder]) {
        //: handle = NO;
        handle = NO;
        //: return handle;
        return handle;
    }
    //: handle = YES;
    handle = YES;
    //: return handle;
    return handle;
}


//: - (BOOL)disableAudioPlayedStatusIcon:(NIMMessage *)message
- (BOOL)titleScheme:(NIMMessage *)message
{
    //: BOOL disable = NO;
    BOOL disable = NO;
    //: if ([self.sessionConfig respondsToSelector:@selector(disableAudioPlayedStatusIcon)])
    if ([self.sessionConfig respondsToSelector:@selector(audioDisplay)])
    {
        //: disable = [self.sessionConfig disableAudioPlayedStatusIcon];
        disable = [self.sessionConfig audioDisplay];
    }
    //: return disable;
    return disable;
}

//: - (void)onClickEmoticon:(NIMMessage *)message
- (void)readRange:(NIMMessage *)message
                //: comment:(NIMQuickComment *)comment
                commentTab:(NIMQuickComment *)comment
               //: selected:(BOOL)isSelected
               line:(BOOL)isSelected
{
    //: __weak typeof(self) weakSelf = self;
    __weak typeof(self) weakSelf = self;
    //: if (isSelected)
    if (isSelected)
    {
        //: [self.interactor delQuickComment:comment
        [self.interactor save:comment
                           //: targetMessage:message
                           speedyWithoutCompletion:message
                              //: completion:^(NSError *error)
                              message:^(NSError *error)
         {
//            [self.view hideToasts];
            //: if (!error)
            if (!error)
            {
                //: return;
                return;
            }
            //: [weakSelf.view makeToast:[NTESLanguageManager getTextWithKey:@"group_info_activity_op_failed"] duration:2 position:CSToastPositionCenter];
            [weakSelf.view makeToast:[MaxInformation off:StringFromVaccineData(&str_ministrationName)] duration:2 position:CSToastPositionCenter];
        //: }];
        }];
    }
    //: else
    else
    {
        //: NIMQuickComment *aComment = [comment copy];
        NIMQuickComment *aComment = [comment copy];
        //: [self.interactor addQuickComment:aComment
        [self.interactor size:aComment
                               //: toMessage:message
                               titleQuantity:message
                              //: completion:^(NSError *error)
                              actionCompletion:^(NSError *error)
         {
//            [self.view hideToasts];
            //: if (!error)
            if (!error)
            {
                //: return;
                return;
            }
            //: [weakSelf.view makeToast:[NTESLanguageManager getTextWithKey:@"group_info_activity_op_failed"] duration:2 position:CSToastPositionCenter];
            [weakSelf.view makeToast:[MaxInformation off:StringFromVaccineData(&str_ministrationName)] duration:2 position:CSToastPositionCenter];
        //: }];
        }];
    }

}

//: #pragma mark - 配置项
#pragma mark - 配置项
//: - (id<CCCSessionConfig>)sessionConfig
- (id<FromConfig>)sessionConfig
{
    //: return nil; 
    return nil; //使用默认配置
}

//: #pragma mark - 配置项列表
#pragma mark - 配置项列表
//是否需要监听新消息通知 : 某些场景不需要监听新消息，如浏览服务器消息历史界面
//: - (BOOL)shouldAddListenerForNewMsg
- (BOOL)color
{
    //: BOOL should = YES;
    BOOL should = YES;
    //: if ([self.sessionConfig respondsToSelector:@selector(disableReceiveNewMessages)]) {
    if ([self.sessionConfig respondsToSelector:@selector(inputMobileRed)]) {
        //: should = ![self.sessionConfig disableReceiveNewMessages];
        should = ![self.sessionConfig inputMobileRed];
    }
    //: return should;
    return should;
}



//是否需要显示输入框 : 某些场景不需要显示输入框，如使用 3D touch 的场景预览会话界面内容
//: - (BOOL)shouldShowInputView
- (BOOL)media
{
    //: BOOL should = YES;
    BOOL should = YES;
    //: if ([self.sessionConfig respondsToSelector:@selector(disableInputView)]) {
    if ([self.sessionConfig respondsToSelector:@selector(recentTitle)]) {
        //: should = ![self.sessionConfig disableInputView];
        should = ![self.sessionConfig recentTitle];
    }
    //: return should;
    return should;
}


//当前录音格式 : NIMSDK 支持 aac 和 amr 两种格式
//: - (NIMAudioType)recordAudioType
- (NIMAudioType)tip
{
    //: NIMAudioType type = NIMAudioTypeAAC;
    NIMAudioType type = NIMAudioTypeAAC;
    //: if ([self.sessionConfig respondsToSelector:@selector(recordType)]) {
    if ([self.sessionConfig respondsToSelector:@selector(appOn)]) {
        //: type = [self.sessionConfig recordType];
        type = [self.sessionConfig appOn];
    }
    //: return type;
    return type;
}

//是否需要监听感应器事件
//: - (BOOL)needProximityMonitor
- (BOOL)light
{
    //: BOOL needProximityMonitor = YES;
    BOOL needProximityMonitor = YES;
    //: if ([self.sessionConfig respondsToSelector:@selector(disableProximityMonitor)]) {
    if ([self.sessionConfig respondsToSelector:@selector(textName)]) {
        //: needProximityMonitor = !self.sessionConfig.disableProximityMonitor;
        needProximityMonitor = !self.sessionConfig.textName;
    }
    //: return needProximityMonitor;
    return needProximityMonitor;
}


//: #pragma mark -
#pragma mark -
//: #pragma mark - 长按菜单事件
#pragma mark - 长按菜单事件
//: - (NIMMessage *)messageForMenu
- (NIMMessage *)messageForMenu
{
    //: return _messageForMenu;
    return _messageForMenu;
}

//: - (BOOL)canBecomeFirstResponder
- (BOOL)canBecomeFirstResponder
{
    //: return YES;
    return YES;
}

//: - (BOOL)canPerformAction:(SEL)action withSender:(id)sender
- (BOOL)canPerformAction:(SEL)action withSender:(id)sender
{
    //: NSArray *items = [[UIMenuController sharedMenuController] menuItems];
    NSArray *items = [[UIMenuController sharedMenuController] menuItems];
    //: for (UIMenuItem *item in items) {
    for (UIMenuItem *item in items) {
        //: if (action == [item action]){
        if (action == [item action]){
            //: return YES;
            return YES;
        }
    }
    //: return NO;
    return NO;
}


//: - (void)copyText:(id)sender
- (void)passkey:(id)sender
{
    //: NIMMessage *message = [self messageForMenu];
    NIMMessage *message = [self messageForMenu];
    //: if (message.tyl_internalIdentifier.length) {
    if (message.ting.length) {
        //: UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
        UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
        //: [pasteboard setString:message.tyl_internalIdentifier];
        [pasteboard setString:message.ting];
    }
    //: else if (message.text.length) {
    else if (message.text.length) {
        //: UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
        UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
        //: [pasteboard setString:message.text];
        [pasteboard setString:message.text];
    }
}

//: - (void)deleteMsg:(id)sender
- (void)session:(id)sender
{
    //: NIMMessage *message = [self messageForMenu];
    NIMMessage *message = [self messageForMenu];
    //: [self uiDeleteMessage:message];
    [self down:message];
    //: [self.conversationManager deleteMessage:message];
    [self.speakeasy deleteMessage:message];
}

//: - (void)menuDidHide:(NSNotification *)notification
- (void)menuBy:(NSNotification *)notification
{
    //: [UIMenuController sharedMenuController].menuItems = nil;
    [UIMenuController sharedMenuController].menuItems = nil;
}

- (void)onTapMenuItemCopy:(WithMin *)item
{
    //: NIMMessage *message = [self messageForMenu];
    NIMMessage *message = [self messageForMenu];
    //: if (message.tyl_internalIdentifier.length) {
    if (message.ting.length) {
        //: UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
        UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
        //: [pasteboard setString:message.tyl_internalIdentifier];
        [pasteboard setString:message.ting];
    }
    //: else if (message.text.length) {
    else if (message.text.length) {
        //: UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
        UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
        //: [pasteboard setString:message.text];
        [pasteboard setString:message.text];
    }
}

//: - (void)onTapMenuItemDelete:(BBBMediaItem *)item
- (void)onTapMenuItemDelete:(WithMin *)item
{
    //: NIMMessage *message = [self messageForMenu];
    NIMMessage *message = [self messageForMenu];
    //: [self uiDeleteMessage:message];
    [self down:message];
    //: [self.conversationManager deleteMessage:message];
    [self.speakeasy deleteMessage:message];
}

//: #pragma mark - 操作接口
#pragma mark - 操作接口
//: - (void)uiAddMessages:(NSArray *)messages
- (void)bubbleMessages:(NSArray *)messages
{
    //: [self.interactor addMessages:messages];
    [self.interactor supplement:messages];
}

//: - (void)uiInsertMessages:(NSArray *)messages
- (void)should:(NSArray *)messages
{
    //: [self.interactor insertMessages:messages];
    [self.interactor view:messages];
}

//: - (BBBMessageModel *)uiDeleteMessage:(NIMMessage *)message{
- (AccumulationCenter *)down:(NIMMessage *)message{
    //: BBBMessageModel *model = [self.interactor deleteMessage:message];
    AccumulationCenter *model = [self.interactor wireMessage:message];
    //: if (model.shouldShowReadLabel && model.message.session.sessionType == NIMSessionTypeP2P)
    if (model.shouldShowReadLabel && model.message.session.sessionType == NIMSessionTypeP2P)
    {
        //: [self uiCheckReceipts:nil];
        [self save:nil];
    }
    //: return model;
    return model;
}

//: - (void)uiUpdateMessage:(NIMMessage *)message{
- (void)close:(NIMMessage *)message{
    //: [self.interactor updateMessage:message];
    [self.interactor text:message];
}

//: - (void)uiPinMessage:(NIMMessage *)message
- (void)recent:(NIMMessage *)message
{
    //: [self.interactor addPinForMessage:message];
    [self.interactor sight:message];
}

//: - (void)uiUnpinMessage:(NIMMessage *)message
- (void)withMessage:(NIMMessage *)message
{
    //: [self.interactor removePinForMessage:message];
    [self.interactor detoxicate:message];
}

//: - (void)uiCheckReceipts:(NSArray<NIMMessageReceipt *> *)receipts
- (void)save:(NSArray<NIMMessageReceipt *> *)receipts
{
    //: [self.interactor checkReceipts:receipts];
    [self.interactor more:receipts];
}

//: - (void)onTapCameraBtn:(id)sender
- (void)extraView:(id)sender
{
    //: [self.interactor mediaShootPressed];
    [self.interactor foilChange];

}

//: - (void)onTapAlbunBtn:(id)sender
- (void)alongs:(id)sender
{
    //: [self.interactor mediaPicturePressed];
    [self.interactor color];
}

//: - (void)onTapAudioBtn:(id)sender
- (void)touching:(id)sender
{
    //: [self.view addSubview:self.audioContent];
    [self.view addSubview:self.audioContent];
    //: self.audioContent.actionDelegate = self;
    self.audioContent.actionDelegate = self;
    //: [self.audioContent animationShow];
    [self.audioContent key];
}


//: #pragma mark - NIMMeidaButton
#pragma mark - NIMMeidaButton
//: - (void)onTapMediaItemPicture:(BBBMediaItem *)item
- (void)diceBox:(WithMin *)item
{
    //: [self.interactor mediaPicturePressed];
    [self.interactor color];
}

//: - (void)onTapMediaItemShoot:(BBBMediaItem *)item
- (void)constituent:(WithMin *)item
{
    //: [self.interactor mediaShootPressed];
    [self.interactor foilChange];
}

//: - (void)onTapMediaItemLocation:(BBBMediaItem *)item
- (void)instance:(WithMin *)item
{
//    [self.interactor mediaLocationPressed];
    //: [self.view addSubview:self.audioContent];
    [self.view addSubview:self.audioContent];
    //: self.audioContent.actionDelegate = self;
    self.audioContent.actionDelegate = self;
    //: [self.audioContent animationShow];
    [self.audioContent key];

}

//: - (void)onTapTableView:(id)sender
- (void)borders:(id)sender
{
    //: [CCCBubbleMenuView.shareMenuView removeFromSuperview];
    [InformationHideView.pastCard removeFromSuperview];
    //: [self.sessionInputView endEditing:YES];
    [self.sessionInputView endEditing:YES];
}

//: #pragma mark - 旋转处理 (iOS8 or above)
#pragma mark - 旋转处理 (iOS8 or above)
//: - (void)viewWillTransitionToSize:(CGSize)size
- (void)viewWillTransitionToSize:(CGSize)size
       //: withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator
       withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator
{
    //: self.lastVisibleIndexPathBeforeRotation = [self.tableView indexPathsForVisibleRows].lastObject;
    self.lastVisibleIndexPathBeforeRotation = [self.tableView indexPathsForVisibleRows].lastObject;
    //: [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
    //: if (self.view.window) {
    if (self.view.window) {
        //: __weak typeof(self) wself = self;
        __weak typeof(self) wself = self;
        //: [coordinator animateAlongsideTransition:^(id <UIViewControllerTransitionCoordinatorContext> context)
        [coordinator animateAlongsideTransition:^(id <UIViewControllerTransitionCoordinatorContext> context)
         {
             //: [[NIMSDK sharedSDK].mediaManager cancelRecord];
             [[NIMSDK sharedSDK].mediaManager cancelRecord];
             //: [wself.interactor cleanCache];
             [wself.interactor maxUser];
             //: [wself.sessionInputView reset];
             [wself.sessionInputView date];
             //: [wself.tableView reloadData];
             [wself.tableView reloadData];
             //: [wself.tableView scrollToRowAtIndexPath:wself.lastVisibleIndexPathBeforeRotation atScrollPosition:UITableViewScrollPositionBottom animated:NO];
             [wself.tableView scrollToRowAtIndexPath:wself.lastVisibleIndexPathBeforeRotation atScrollPosition:UITableViewScrollPositionBottom animated:NO];
         //: } completion:nil];
         } completion:nil];
    }
}


//: #pragma mark - 标记已读
#pragma mark - 标记已读
//: - (void)markRead
- (void)characterise
{
    //: [self.interactor markRead:YES];
    [self.interactor tinkleRead:YES];
}


//: #pragma mark - Private
#pragma mark - Private

//: - (void)addListener
- (void)isClear
{
    //: [[NIMSDK sharedSDK].chatManager addDelegate:self];
    [[NIMSDK sharedSDK].chatManager addDelegate:self];
    //: [[NIMSDK sharedSDK].conversationManager addDelegate:self];
    [[NIMSDK sharedSDK].conversationManager addDelegate:self];
    //: [[NIMSDK sharedSDK].chatExtendManager addDelegate:self];
    [[NIMSDK sharedSDK].chatExtendManager addDelegate:self];
}

//: - (void)removeListener
- (void)noneCircle
{
    //: [[NIMSDK sharedSDK].chatManager removeDelegate:self];
    [[NIMSDK sharedSDK].chatManager removeDelegate:self];
    //: [[NIMSDK sharedSDK].conversationManager removeDelegate:self];
    [[NIMSDK sharedSDK].conversationManager removeDelegate:self];
    //: [[NIMSDK sharedSDK].mediaManager removeDelegate:self];
    [[NIMSDK sharedSDK].mediaManager removeDelegate:self];
    //: [[NIMSDK sharedSDK].chatExtendManager removeDelegate:self];
    [[NIMSDK sharedSDK].chatExtendManager removeDelegate:self];

}


//: - (id<NIMConversationManager>)conversationManager{
- (id<NIMConversationManager>)speakeasy{
    //: switch (self.session.sessionType) {
    switch (self.session.sessionType) {
        //: case NIMSessionTypeChatroom:
        case NIMSessionTypeChatroom:
            //: return nil;
            return nil;
            //: break;
            break;
        //: case NIMSessionTypeP2P:
        case NIMSessionTypeP2P:
        //: case NIMSessionTypeTeam:
        case NIMSessionTypeTeam:
        //: case NIMSessionTypeSuperTeam:
        case NIMSessionTypeSuperTeam:
        //: default:
        default:
            //: return [NIMSDK sharedSDK].conversationManager;
            return [NIMSDK sharedSDK].conversationManager;
    }
}


//: - (void)setUpTitleView
- (void)imaginationImage
{
    //: BBBKitTitleView *titleView = (BBBKitTitleView *)self.navigationItem.titleView;
    DittyBagView *titleView = (DittyBagView *)self.navigationItem.titleView;
    //: if (!titleView || ![titleView isKindOfClass:[BBBKitTitleView class]])
    if (!titleView || ![titleView isKindOfClass:[DittyBagView class]])
    {
        //: titleView = [[BBBKitTitleView alloc] initWithFrame:CGRectZero];
        titleView = [[DittyBagView alloc] initWithFrame:CGRectZero];
        //: self.navigationItem.titleView = titleView;
        self.navigationItem.titleView = titleView;

        //: titleView.titleLabel.text = self.sessionTitle;
        titleView.titleLabel.text = self.birdSEyeViewContent;
        //: titleView.subtitleLabel.text = self.sessionSubTitle;
        titleView.subtitleLabel.text = self.input;

        //: self.titleLabel = titleView.titleLabel;
        self.titleLabel = titleView.titleLabel;
        //: self.subTitleLabel = titleView.subtitleLabel;
        self.subTitleLabel = titleView.subtitleLabel;
    }

    //: [titleView sizeToFit];
    [titleView sizeToFit];
    //: self.subtitle.text = self.sessionSubTitle;
    self.subtitle.text = self.input;
}

//: - (void)refreshSessionTitle:(NSString *)title
- (void)user:(NSString *)title
{
    //: self.titleLabel.text = title;
    self.titleLabel.text = title;
//    self.labtitle.text = self.sessionTitle;
    //: [self setUpTitleView];
    [self imaginationImage];
}


//: - (void)refreshSessionSubTitle:(NSString *)title
- (void)peculiarSpecialSession:(NSString *)title
{
    //: self.subTitleLabel.text = title;
    self.subTitleLabel.text = title;
    //: self.subtitle.text = title;
    self.subtitle.text = title;
    //: if([title isEqualToString:@"离线".ntes_localized]){
    if([title isEqualToString:@"离线".language]){
        //: self.subtitle.textColor = [UIColor colorWithHexString:@"777777"];
        self.subtitle.textColor = [UIColor direction:StringFromVaccineData(&str_throatTitle)];
    //: }else{
    }else{
        //: self.subtitle.textColor = [UIColor colorWithHexString:@"#00B01B"];
        self.subtitle.textColor = [UIColor direction:StringFromVaccineData(&str_candidShowName)];
    }
    //: [self setUpTitleView];
    [self imaginationImage];
}

//: - (void)refreshMessages
- (void)refresh
{
    //: [self.interactor resetMessages:nil];
    [self.interactor distance:nil];
}

//: - (NSArray *)menusItems:(NIMMessage *)message {
- (NSArray *)objectOffChange:(NIMMessage *)message {
    //: return nil;
    return nil;
}

//: - (void)scrollToMessage:(NIMMessage *)message
- (void)green:(NIMMessage *)message
{
    //: NSInteger row = [self.interactor findMessageIndex:message];
    NSInteger row = [self.interactor socialRank:message];
    //: if (row != -1) {
    if (row != -1) {
        //: NSIndexPath *indexPath = [NSIndexPath indexPathForRow:row inSection:0];
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:row inSection:0];
        //: [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
        [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
    }
}

//: - (void)cleanMenuMessage
- (void)finishMessage
{
    //: [self.sessionInputView.replyedContent.closeButton sendActionsForControlEvents:UIControlEventTouchUpInside];
    [self.sessionInputView.replyedContent.closeButton sendActionsForControlEvents:UIControlEventTouchUpInside];
    //: self.messageForMenu = nil;
    self.messageForMenu = nil;
}

//: - (void)hadCommentThisMessage:(NIMMessage *)message
- (void)at:(NIMMessage *)message
                         //: type:(int64_t)type
                         signal:(int64_t)type
                    //: compltion:(void(^)(NSMapTable *))completion
                    toEvent:(void(^)(NSMapTable *))completion
{
    //: [[NIMSDK sharedSDK].chatExtendManager quickCommentsByMessage:message completion:^(NSError * _Nullable error, NSMapTable<NSNumber *,NSArray<NIMQuickComment *> * >* _Nullable result) {
    [[NIMSDK sharedSDK].chatExtendManager quickCommentsByMessage:message completion:^(NSError * _Nullable error, NSMapTable<NSNumber *,NSArray<NIMQuickComment *> * >* _Nullable result) {
        //: if (completion)
        if (completion)
        {
            //: completion(result);
            completion(result);
        }
    //: }];
    }];
}

//: - (BOOL)shouldShowMenuByMessage:(NIMMessage *)message
- (BOOL)link:(NIMMessage *)message
{
    //: if (message.session.sessionType == NIMSessionTypeChatroom ||
    if (message.session.sessionType == NIMSessionTypeChatroom ||
        //: message.messageType == NIMMessageTypeTip ||
        message.messageType == NIMMessageTypeTip ||
        //: message.messageType == NIMMessageTypeNotification)
        message.messageType == NIMMessageTypeNotification)
    {
        //: return NO;
        return NO;
    }
    //: return YES;
    return YES;
}


//: - (void)showMenuWithMessage:(NIMMessage *)message withView:(UIView *)view {
- (void)recording:(NIMMessage *)message retort:(UIView *)view {

    //: [[CCCBubbleMenuView shareMenuView] removeFromSuperview];
    [[InformationHideView pastCard] removeFromSuperview];

    //: NSArray *btns = [self genMediaButtonsWithMessage:message];
    NSArray *btns = [self text:message];

    //: if (btns.count > 0) {
    if (btns.count > 0) {

        //: CGRect tempRect = [view convertRect:view.bounds toView:self.view];
        CGRect tempRect = [view convertRect:view.bounds toView:self.view];
        //: CGRect cursorStartRectToWindow = [view convertRect:view.bounds toView:self.view];
        CGRect cursorStartRectToWindow = [view convertRect:view.bounds toView:self.view];

        @
         //: autoreleasepool{} __weak __typeof__(self) __weak_self__ = self;
         autoreleasepool{} __weak __typeof__(self) __weak_self__ = self;
                      ;
        //: [[CCCBubbleMenuView shareMenuView] showViewWithButtonModels:btns cursorStartRect:cursorStartRectToWindow selectionTextRectInWindow:tempRect selectBlock:^(BBBMediaItem *item) {
        [[InformationHideView pastCard] imageWithSize:btns panDraftCopyMonth:cursorStartRectToWindow button:tempRect place:^(WithMin *item) {
            @
             //: try{} @finally{} __typeof__(self) self = __weak_self__;
             try{} @finally{} __typeof__(self) self = __weak_self__;
                            ;
            //: [self onTapMediaItem:item];
            [self allOf:item];

            //: [CCCBubbleMenuView.shareMenuView removeFromSuperview];
            [InformationHideView.pastCard removeFromSuperview];
        //: }];
        }];
    }

}

//: - (NSArray *)genMediaButtonsWithMessage:(NIMMessage *)message {
- (NSArray *)text:(NIMMessage *)message {

    //: NSMutableArray *selectedAllRangeButtons = [NSMutableArray array];
    NSMutableArray *selectedAllRangeButtons = [NSMutableArray array];

    //: NSArray *items;
    NSArray *items;
    //: if (!self.sessionConfig)
    if (!self.sessionConfig)
    {
        //: items = [[AppleProjectKit sharedKit].config defaultMenuItemsWithMessage:message];
        items = [[Indicator reach].config keySize:message];
    }
    //: else if([self.sessionConfig respondsToSelector:@selector(menuItemsWithMessage:)])
    else if([self.sessionConfig respondsToSelector:@selector(oned:)])
    {
        //: items = [self.sessionConfig menuItemsWithMessage:message];
        items = [self.sessionConfig oned:message];
    }

    //: [items enumerateObjectsUsingBlock:^(BBBMediaItem *item, NSUInteger idx, BOOL *stop) {
    [items enumerateObjectsUsingBlock:^(WithMin *item, NSUInteger idx, BOOL *stop) {

        //: CCCBubbleButtonModel *model = [[CCCBubbleButtonModel alloc] init];
        FromMax *model = [[FromMax alloc] init];
        //: model.normalImage = item.normalImage;
        model.normalImage = item.normalImage;
        //: model.name = item.title;
        model.name = item.title;
        //: model.item = item;
        model.item = item;

        //: [selectedAllRangeButtons addObject:model];
        [selectedAllRangeButtons addObject:model];

    //: }];
    }];

    //: return selectedAllRangeButtons;
    return selectedAllRangeButtons;
}

//: - (KEKEInputAudioView *)audioContent
- (ElectronicSignalView *)audioContent
{
    //: if(!_audioContent){
    if(!_audioContent){
        //: _audioContent = [[KEKEInputAudioView alloc]initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height)];
        _audioContent = [[ElectronicSignalView alloc]initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height)];
//        _audioContent.hidden = YES;
    }
    //: return _audioContent;
    return _audioContent;
}

//: @end
@end

Byte *VaccineDataToByte(VaccineData *data) {
    if (data->thoughtBarn) return data->genreAnal;
    for (int i = 0; i < data->ginCart; i++) {
        data->genreAnal[i] ^= data->indexTrend;
    }
    data->genreAnal[data->ginCart] = 0;
    data->thoughtBarn = true;
	if (data->ginCart >= 1) {
		data->workYard = data->genreAnal[0];
	}
    return data->genreAnal;
}

NSString *StringFromVaccineData(VaccineData *data) {
    return [NSString stringWithUTF8String:(char *)VaccineDataToByte(data)];
}
