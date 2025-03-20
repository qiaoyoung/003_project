//
//  BBBSessionListViewController.m
// AppleProjectKit
//
//  Created by NetEase.
//  Copyright (c) 2015年 NetEase. All rights reserved.
//

#import "BBBSessionListViewController.h"
#import "CCCSessionViewController.h"
#import "BBBSessionListCell.h"
#import "UIViewNimKit.h"
#import "BBBAvatarImageView.h"
#import "AAAMessageUtil.h"
#import "AAAKitUtil.h"
#import "AppleProjectKit.h"
#import <YYText.h>
#import "SNTextHighlight.h"
#import "AAAInputEmoticonParser.h"
#import "AAAInputEmoticonManager.h"
#import "UIImage+AppleProjectKit.h"
#import "NSString+AppleProjectKit.h"
#import <objc/runtime.h>
#import "LEEAlert.h"

@interface BBBSessionListViewController ()

//@property (nonatomic,strong)  UIImageView *navBarHairlineImageView;

@end

@implementation BBBSessionListViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

    }
    return self;
}

- (void)dealloc{
    [[NIMSDK sharedSDK].conversationManager removeDelegate:self];
    [[NIMSDK sharedSDK].loginManager removeDelegate:self];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
//    _navBarHairlineImageView.hidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
//    _navBarHairlineImageView.hidden = NO;
}


- (UIImageView *)findHairlineImageViewUnder:(UIView *)view {
    if ([view isKindOfClass:UIImageView.class] && view.bounds.size.height <= 1.0) {
        return (UIImageView *)view;
    }
    for (UIView *subview in view.subviews) {
        UIImageView *imageView = [self findHairlineImageViewUnder:subview];
        if (imageView) {
            return imageView;
        }
    }
    return nil;
}


- (void)viewDidLoad {
    [super viewDidLoad];
//    _navBarHairlineImageView = [self findHairlineImageViewUnder:self.navigationController.navigationBar];
    
//    self.view.backgroundColor = [UIColor colorWithRed:243/255.0 green:242/255.0 blue:252/255.0 alpha:1];
    self.view.backgroundColor = [UIColor whiteColor];
//    UIImage *bgImg = [SNGradientHelper getLinearGradientImage:RGB_COLOR_String(kCommonBGColor_begin) and:RGB_COLOR_String(kCommonBGColor_end) directionType:SNLinearGradientDirectionLevel];
    UIImageView *bg = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 375)];
    bg.image = [UIImage imageNamed:@"chat_top_bg"];
//    bg.image = bgImg;
    [self.view addSubview:bg];

    
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    
//    UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"chat_bg"]];
//    imageView.frame = self.tableView.bounds;
//  imageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.tableView.backgroundColor = [UIColor clearColor];
//    [self.tableView setBackgroundView:imageView];
//    if (@available(iOS 11.0, *)) {
//        self.tableView.layer.cornerRadius = 20;
//        self.tableView.layer.maskedCorners = kCALayerMinXMinYCorner | kCALayerMaxXMinYCorner; // 左上圆角 // 右上圆角
//    }
    
    [self.view addSubview:self.tableView];
    self.tableView.delegate         = self;
    self.tableView.dataSource       = self;
    self.tableView.tableFooterView  = [[UIView alloc] init];
    self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    
    [[NIMSDK sharedSDK].conversationManager addDelegate:self];
    [[NIMSDK sharedSDK].loginManager addDelegate:self];
    
    extern NSString *const NIMKitTeamInfoHasUpdatedNotification;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onTeamInfoHasUpdatedNotification:) name:NIMKitTeamInfoHasUpdatedNotification object:nil];
    
    extern NSString *const NIMKitTeamMembersHasUpdatedNotification;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onTeamMembersHasUpdatedNotification:) name:NIMKitTeamMembersHasUpdatedNotification object:nil];
    
    extern NSString *const NIMKitUserInfoHasUpdatedNotification;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onUserInfoHasUpdatedNotification:) name:NIMKitUserInfoHasUpdatedNotification object:nil];
    
    [self setupSessions];

//    NIMUserDefaults *userDefaults = [NIMUserDefaults standardUserDefaults];
//    if (userDefaults.yinnihione.length > 0 && [userDefaults.yinnihione boolValue]){
//        BOOL un_first_install = [[NSUserDefaults standardUserDefaults] boolForKey:@"is_swed_firnstall"];
//        if (!un_first_install){
//            [self showalert];
//        }
//    }
}

- (void)tapGestureRecognizer:(id)sender {
    HMWebViewController *vc = [[HMWebViewController alloc] init];
    vc.webTitle = LangKey(@"activity_comment_setting_ys");
    vc.urlString = [NIMUserDefaults standardUserDefaults].yshref;
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    
    [[LEEAlert getAlertWindow].rootViewController presentViewController:nav animated:YES completion:nil];
}

- (void)showalert {
    
    [LEEAlert alert].config
        .LeeAddTitle(^(UILabel * _Nonnull label) {
            label.text = LangKey(@"UserAgreement_PrivacyPolicy");
            label.font = [UIFont boldSystemFontOfSize:17];
            label.textColor = [UIColor blackColor];
        })
    .LeeAddContent(^(UILabel *label) {
        
        NSString *markString = LangKey(@"UserAgreementProtocol");

        NSMutableParagraphStyle *paragraphStyle = [NSMutableParagraphStyle new];
        paragraphStyle.lineSpacing = 3;
        NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
        [attributes setObject:paragraphStyle forKey:NSParagraphStyleAttributeName];
        [attributes setObject:[UIColor darkGrayColor] forKey:NSForegroundColorAttributeName];
        [attributes setObject:[UIFont systemFontOfSize:13] forKey:NSFontAttributeName];

        NSMutableAttributedString *attrsString = [[NSMutableAttributedString alloc] initWithString:markString];
        [attrsString addAttributes:attributes range:NSMakeRange(0, markString.length)];


        [attrsString setAttributes:@{
            NSUnderlineStyleAttributeName : @(NSUnderlineStyleSingle),
            NSForegroundColorAttributeName: [UIColor colorWithRed:6/255.0f green:53/255.0f blue:253/255.0f alpha:1.0f],
        } range:[attrsString.string rangeOfString:LangKey(@"UserAgreement_PrivacyPolicy")]];

        label.attributedText = attrsString;
        label.textAlignment = NSTextAlignmentLeft;
        
        label.userInteractionEnabled = YES;
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestureRecognizer:)];
        [label addGestureRecognizer:tap];
    })
    .LeeAddAction(^(LEEAction *action) {
        
        action.title = LangKey(@"reject");

        action.titleColor = [UIColor darkGrayColor];
        
        action.backgroundColor = [UIColor colorWithRed:249/255.0f green:249/255.0f blue:249/255.0f alpha:1.0f];
        
        action.backgroundHighlightColor = [UIColor colorWithRed:239/255.0f green:239/255.0f blue:239/255.0f alpha:1.0f];
        
        action.clickBlock = ^{
            exit(0);
        };
    })
    .LeeAddAction(^(LEEAction *action) {
        
        action.type = LEEActionTypeCancel;
        
        action.title = LangKey(@"agree");
        
        action.titleColor = [UIColor whiteColor];
        
        action.backgroundColor = [UIColor colorWithRed:243/255.0f green:94/255.0f blue:83/255.0f alpha:1.0f];

        action.backgroundHighlightColor = [UIColor colorWithRed:219/255.0f green:100/255.0f blue:94/255.0f alpha:1.0f];
        
        action.clickBlock = ^{
            [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"is_swed_firnstall"];
            [[NSUserDefaults standardUserDefaults] synchronize];
        };

    })
    .LeeCornerRadius(15.0f)
    #ifdef __IPHONE_13_0
    .LeeUserInterfaceStyle(UIUserInterfaceStyleLight)
    #endif
    .LeeShow();
    
  
}


- (void)setupSessions {
    _recentSessions = [self getRecentSessions];
    if (!self.recentSessions.count)
    {
        _recentSessions = [NSMutableArray array];
    }
    else
    {
        _recentSessions = [self customSortRecents:_recentSessions];
    }
}

- (NSMutableArray *)getRecentSessions {
    return [[NIMSDK sharedSDK].conversationManager.allRecentSessions mutableCopy];
}

- (void)refresh{
    if (!self.recentSessions.count) {
        self.tableView.hidden = YES;
    }else{
        self.tableView.hidden = NO;
        [self customSortRecents:self.recentSessions];
    }
    [self.tableView reloadData];
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NIMRecentSession *recentSession = self.recentSessions[indexPath.row];
    [self onSelectedRecent:recentSession atIndexPath:indexPath];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70.f;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}



#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.recentSessions.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * cellId = @"cellId";
    BBBSessionListCell * cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[BBBSessionListCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        [cell.avatarImageView addTarget:self action:@selector(onTouchAvatar:) forControlEvents:UIControlEventTouchUpInside];
    }
    NIMRecentSession *recent = self.recentSessions[indexPath.row];
    cell.nameLabel.text = [self nameForRecentSession:recent];
    [cell.avatarImageView setAvatarBySession:recent.session];
    [cell.nameLabel sizeToFit];
    
    cell.messageLabel.attributedText  = [self contentForRecentSession:recent];
    [cell.messageLabel sizeToFit];
    cell.timeLabel.text = [self timestampDescriptionForRecentSession:recent];
    [cell.timeLabel sizeToFit];
    
    BOOL isTop = [self isTopWithNIMRecentSession:recent];
    if (isTop){
        cell.backgroundColor = [UIColor colorWithRed:244/255.0 green:252/255.0 blue:255/255.0 alpha:1];
    } else {
        cell.backgroundColor = [UIColor clearColor];
    }
    
    [cell refresh:recent];
    return cell;
}

///置顶会话的cell
- (BOOL)isTopWithNIMRecentSession:(NIMRecentSession *)recentSession; {
    return NO;
}

#pragma mark - NIMConversationManagerDelegate
- (void)didLoadAllRecentSessionCompletion {
    [self setupSessions];
    [self refresh];
}

- (void)didAddRecentSession:(NIMRecentSession *)recentSession
           totalUnreadCount:(NSInteger)totalUnreadCount{
    [self.recentSessions addObject:recentSession];
    [self sort];
    _recentSessions = [self customSortRecents:_recentSessions];
    [self refresh];
}

- (void)didUpdateRecentSession:(NIMRecentSession *)recentSession
              totalUnreadCount:(NSInteger)totalUnreadCount{
    for (NIMRecentSession *recent in self.recentSessions)
    {
        if ([recentSession.session.sessionId isEqualToString:recent.session.sessionId])
        {
            [self.recentSessions removeObject:recent];
            break;
        }
    }
    NSInteger insert = [self findInsertPlace:recentSession];
    [self.recentSessions insertObject:recentSession atIndex:insert];
    _recentSessions = [self customSortRecents:_recentSessions];
    [self refresh];
}

- (void)didRemoveRecentSession:(NIMRecentSession *)recentSession
              totalUnreadCount:(NSInteger)totalUnreadCount
{
    //清理本地数据
    [self.recentSessions removeObject:recentSession];
    
    //如果删除本地会话后就不允许漫游当前会话，则需要进行一次删除服务器会话的操作
    if (self.autoRemoveRemoteSession)
    {
        [[NIMSDK sharedSDK].conversationManager deleteRemoteSessions:@[recentSession.session]
                           completion:nil];
    }
    _recentSessions = [self customSortRecents:_recentSessions];
    [self refresh];
}

- (void)messagesDeletedInSession:(NIMSession *)session{
    _recentSessions = [[NIMSDK sharedSDK].conversationManager.allRecentSessions mutableCopy];
    _recentSessions = [self customSortRecents:_recentSessions];
    [self refresh];
}

- (void)allMessagesDeleted{
    _recentSessions = [[NIMSDK sharedSDK].conversationManager.allRecentSessions mutableCopy];
    _recentSessions = [self customSortRecents:_recentSessions];
    [self refresh];
}

- (void)allMessagesRead
{
    _recentSessions = [[NIMSDK sharedSDK].conversationManager.allRecentSessions mutableCopy];
    _recentSessions = [self customSortRecents:_recentSessions];
    [self refresh];
}

- (NSMutableArray *)customSortRecents:(NSMutableArray *)recentSessions
{
    return self.recentSessions;
}

#pragma mark - NIMLoginManagerDelegate
- (void)onLogin:(NIMLoginStep)step
{
    if (step == NIMLoginStepSyncOK) {
        [self refresh];
    }
}

#pragma mark - Override
- (void)onSelectedAvatar:(NSString *)userId
             atIndexPath:(NSIndexPath *)indexPath{};

- (void)onSelectedRecent:(NIMRecentSession *)recentSession atIndexPath:(NSIndexPath *)indexPath{
    CCCSessionViewController *vc = [[CCCSessionViewController alloc] initWithSession:recentSession.session];
    [self.navigationController pushViewController:vc animated:YES];
}



- (NSString *)nameForRecentSession:(NIMRecentSession *)recent {
    if (recent.session.sessionType == NIMSessionTypeP2P) {
        return [AAAKitUtil showNick:recent.session.sessionId inSession:recent.session];
    } else if (recent.session.sessionType == NIMSessionTypeTeam) {
        NIMTeam *team = [[NIMSDK sharedSDK].teamManager teamById:recent.session.sessionId];
        return team.teamName;
    } else if (recent.session.sessionType == NIMSessionTypeSuperTeam) {
        NIMTeam *superTeam = [[NIMSDK sharedSDK].superTeamManager teamById:recent.session.sessionId];
        return superTeam.teamName;
    } else {
        NSAssert(NO, @"");
        return nil;
    }
}

- (NSAttributedString *)contentForRecentSession:(NIMRecentSession *)recent{
    NSString *content = [self messageContent:recent.lastMessage];
    return [[NSAttributedString alloc] initWithString:content ?: @""];
}

- (NSString *)timestampDescriptionForRecentSession:(NIMRecentSession *)recent{
    if (recent.lastMessage) {
        return [AAAKitUtil showTime:recent.lastMessage.timestamp showDetail:NO];
    }
    // 服务端时间戳以毫秒为单位,需要转化
    NSTimeInterval timeSecond = recent.updateTime / 1000.0;
    return [AAAKitUtil showTime:timeSecond showDetail:NO];
}

#pragma mark - Misc

- (NSInteger)findInsertPlace:(NIMRecentSession *)recentSession{
    __block NSUInteger matchIdx = 0;
    __block BOOL find = NO;
    [self.recentSessions enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        NIMRecentSession *item = obj;
        if (item.lastMessage.timestamp <= recentSession.lastMessage.timestamp) {
            *stop = YES;
            find  = YES;
            matchIdx = idx;
        }
    }];
    if (find) {
        return matchIdx;
    }else{
        return self.recentSessions.count;
    }
}

- (void)sort{
    [self.recentSessions sortUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        NIMRecentSession *item1 = obj1;
        NIMRecentSession *item2 = obj2;
        if (item1.lastMessage.timestamp < item2.lastMessage.timestamp) {
            return NSOrderedDescending;
        }
        if (item1.lastMessage.timestamp > item2.lastMessage.timestamp) {
            return NSOrderedAscending;
        }
        return NSOrderedSame;
    }];
}

- (void)onTouchAvatar:(id)sender{
    UIView *view = [sender superview];
    while (![view isKindOfClass:[UITableViewCell class]]) {
        view = view.superview;
    }
    UITableViewCell *cell  = (UITableViewCell *)view;
    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
    NIMRecentSession *recent = self.recentSessions[indexPath.row];
    [self onSelectedAvatar:recent atIndexPath:indexPath];
}



#pragma mark - Private
- (NSString *)messageContent:(NIMMessage*)lastMessage{
    NSString *text = [AAAMessageUtil messageContent:lastMessage];
    if (lastMessage.session.sessionType == NIMSessionTypeP2P || lastMessage.messageType == NIMMessageTypeTip)
    {
        return text;
    }
    else
    {
        
        NIMMessage *msg = [self lastMessageWithNoNotificationMessage:lastMessage];
        text = [AAAMessageUtil messageContent:msg];
        
        NSString *from = msg.from;
        NSString *nickName = [AAAKitUtil showNick:from inSession:msg.session];
        return nickName.length ? [nickName stringByAppendingFormat:@" : %@",text] : @"";
    }
}

- (NIMMessage *)lastMessageWithNoNotificationMessage:(NIMMessage *)recentMsg {
    
    if (recentMsg.messageType != NIMMessageTypeNotification){
        return recentMsg;
    }

    NSArray<NIMMessage *> *messages = [NIMSDK.sharedSDK.conversationManager messagesInSession:recentMsg.session message:recentMsg limit:1];
    NIMMessage *msg = recentMsg;
    if (messages.count > 0) {
        msg = messages.firstObject;
        if (msg.messageType == NIMMessageTypeNotification){
            NIMNotificationObject *object = msg.messageObject;
             if (object && [object isKindOfClass:NIMNotificationObject.class] && object.notificationType == NIMNotificationTypeTeam)
             {
                 return [self lastMessageWithNoNotificationMessage:msg];
             }
        }
    }
    return msg;
}

#pragma mark - Notification
- (void)onUserInfoHasUpdatedNotification:(NSNotification *)notification{
    [self refresh];
}

- (void)onTeamInfoHasUpdatedNotification:(NSNotification *)notification{
    [self refresh];
}

- (void)onTeamMembersHasUpdatedNotification:(NSNotification *)notification{
    [self refresh];
}



@end
