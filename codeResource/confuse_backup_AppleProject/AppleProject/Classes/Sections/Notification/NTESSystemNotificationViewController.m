//
//  SystemNotificationViewController.m
//  NIM
//
//  Created by amao on 3/17/15.
//  Copyright (c) 2015 Netease. All rights reserved.
//

#import "NTESSystemNotificationViewController.h"
#import "NTESSystemNotificationCell.h"
#import "UIView+Toast.h"
#import "NTESSessionMsgConverter.h"


static const NSInteger MaxNotificationCount = 20;
static NSString *reuseIdentifier = @"reuseIdentifier";

@interface NTESSystemNotificationViewController ()<NIMSystemNotificationManagerDelegate,NIMSystemNotificationCellDelegate,NIMTeamManagerDelegate,UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)    NSMutableArray  *notifications;
@property (nonatomic,assign)    BOOL shouldMarkAsRead;
@end

@implementation NTESSystemNotificationViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.edgesForExtendedLayout = UIRectEdgeAll;
    }
    return self;
}

- (void)dealloc
{
    if (_shouldMarkAsRead)
    {
        [[[NIMSDK sharedSDK] systemNotificationManager] markAllNotificationsAsRead];
    }
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;

}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden = NO;
}

- (void)backAction{
    [self.navigationController popViewControllerAnimated:NO];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIImageView *bg = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 375)];
    bg.image = [UIImage imageNamed:@"chat_top_bg"];
    [self.view addSubview:bg];
    
    UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_TOP_HEIGHT)];
    [self.view addSubview:bgView];
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(5, SCREEN_STATUS_HEIGHT+4, 40, 40);
    [backButton setImage:[UIImage imageNamed:@"back_arrow_bl"] forState:(UIControlStateNormal)];
    [backButton addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    [bgView addSubview:backButton];
    
    UILabel *labtitle = [[UILabel alloc] initWithFrame:CGRectMake((SCREEN_WIDTH-200)/2, SCREEN_STATUS_HEIGHT+4, 200, 40)];
    labtitle.font = [UIFont boldSystemFontOfSize:16.f];
    labtitle.textColor = [UIColor blackColor];
    labtitle.textAlignment = NSTextAlignmentCenter;
    labtitle.text = LangKey(@"validation_messages");
    [bgView addSubview:labtitle];
    
    UIButton *submitButton = [UIButton buttonWithType:UIButtonTypeCustom];
    submitButton.frame = CGRectMake(SCREEN_WIDTH-15-40, SCREEN_STATUS_HEIGHT+4, 40, 40);
    [submitButton setImage:[UIImage imageNamed:@"ic_del"] forState:(UIControlStateNormal)];
    [submitButton addTarget:self action:@selector(clearAll:) forControlEvents:UIControlEventTouchUpInside];
    [bgView addSubview:submitButton];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, SCREEN_TOP_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT-SCREEN_TOP_HEIGHT) style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    self.tableView.separatorStyle  = UITableViewCellSeparatorStyleNone;
    self.tableView.delegate   = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = [UIColor clearColor];
    
    _notifications = [NSMutableArray array];
    
    id<NIMSystemNotificationManager> systemNotificationManager = [[NIMSDK sharedSDK] systemNotificationManager];
    [systemNotificationManager addDelegate:self];
    
    NIMSystemNotificationFilter *filter = [[NIMSystemNotificationFilter alloc] init];
    if ([self.filterType isEqualToString:kConstant_1]) {
        filter.notificationTypes = @[@(5)];
    }else if ([self.filterType isEqualToString:kConstant_2]){
        filter.notificationTypes = @[@(0),@(1),@(2),@(3),@(15),@(16),@(17),@(18)];
    }else{
        filter.notificationTypes = @[@(0),@(1),@(2),@(3),@(5),@(15),@(16),@(17),@(18)];
    }
    
    NSArray *notifications = [systemNotificationManager fetchSystemNotifications:nil
                                                         limit:MaxNotificationCount filter:filter];
    
    if ([notifications count])
    {
        [_notifications addObjectsFromArray:notifications];
        if (![[notifications firstObject] read])
        {
            _shouldMarkAsRead = YES;

        }
    }
    if (notifications.count >= MaxNotificationCount) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        [button setFrame:CGRectMake(0, 0, 320, 40)];
        [button addTarget:self
                   action:@selector(loadMore:)
         forControlEvents:UIControlEventTouchUpInside];
        [button setTitle:@"载入更多".ntes_localized forState:UIControlStateNormal];
        self.tableView.tableFooterView = button;
    }else{
        self.tableView.tableFooterView = [[UIView alloc] init];
    }
    
//    UIBarButtonItem *cleanItem = [[UIBarButtonItem alloc] initWithTitle:LangKey(@"empty_message")//@"清空".ntes_localized
//                                                                              style:UIBarButtonItemStylePlain
//                                                                             target:self
//                                                                             action:@selector(clearAll:)];
//    cleanItem.tintColor = [UIColor whiteColor];
//    self.navigationItem.rightBarButtonItem = cleanItem;
}




- (void)loadMore:(id)sender
{
    NSArray *notifications = [[[NIMSDK sharedSDK] systemNotificationManager] fetchSystemNotifications:[_notifications lastObject]
                                                                                                limit:MaxNotificationCount];
    if ([notifications count])
    {
        [_notifications addObjectsFromArray:notifications];
        [self.tableView reloadData];
    }
}

- (void)clearAll:(id)sender
{
    [[[NIMSDK sharedSDK] systemNotificationManager] deleteAllNotifications];
    [_notifications removeAllObjects];
    [self.tableView reloadData];
    
}

- (void)onReceiveSystemNotification:(NIMSystemNotification *)notification
{
    [_notifications insertObject:notification atIndex:0];
    _shouldMarkAsRead = YES;
    [self.tableView reloadData];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_notifications count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    NTESSystemNotificationCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
//    NIMSystemNotification *notification = [_notifications objectAtIndex:[indexPath row]];
//    [cell update:notification];
//    cell.actionDelegate = self;
//    return cell;
    NTESSystemNotificationCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NTESSystemNotificationCell"];
    if (!cell) {
        cell = [[NTESSystemNotificationCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"NTESSystemNotificationCell"];
    }
    cell.actionDelegate = self;
    
    NIMSystemNotification *notification = [_notifications objectAtIndex:[indexPath row]];
    [cell update:notification];
  
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 70;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        NSInteger index = [indexPath row];
        NIMSystemNotification *notification = [_notifications objectAtIndex:index];
        [_notifications removeObjectAtIndex:index];
        [[[NIMSDK sharedSDK] systemNotificationManager] deleteNotification:notification];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}


#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

#pragma mark - SystemNotificationCell
- (void)onAccept:(NIMSystemNotification *)notification
{
    __weak typeof(self) wself = self;
    switch (notification.type) {
        case NIMSystemNotificationTypeTeamApply:{
            [[NIMSDK sharedSDK].teamManager passApplyToTeam:notification.targetID userId:notification.sourceID completion:^(NSError *error, NIMTeamApplyStatus applyStatus) {
                if (!error) {
                    [wself.navigationController.view makeToast:@"同意成功".ntes_localized
                                                      duration:2
                                                      position:CSToastPositionCenter];
                    notification.handleStatus = NotificationHandleTypeOk;
                    [wself.tableView reloadData];
                }else {
                    if(error.code == NIMRemoteErrorCodeTimeoutError) {
                        [wself.navigationController.view makeToast:LangKey(@"friend_verify_avtivity_net_error")
                                                          duration:2
                                                          position:CSToastPositionCenter];
                    } else {
                        notification.handleStatus = NotificationHandleTypeOutOfDate;
                    }
                    [wself.tableView reloadData];
                }
            }];
            break;
        }
        case NIMSystemNotificationTypeSuperTeamApply:{
            [[NIMSDK sharedSDK].superTeamManager passApplyToTeam:notification.targetID userId:notification.sourceID completion:^(NSError *error, NIMTeamApplyStatus applyStatus) {
                if (!error) {
                    [wself.navigationController.view makeToast:@"同意成功".ntes_localized
                                                      duration:2
                                                      position:CSToastPositionCenter];
                    notification.handleStatus = NotificationHandleTypeOk;
                    [wself.tableView reloadData];
                }else {
                    if(error.code == NIMRemoteErrorCodeTimeoutError) {
                        [wself.navigationController.view makeToast:LangKey(@"friend_verify_avtivity_net_error")
                                                          duration:2
                                                          position:CSToastPositionCenter];
                    } else {
                        notification.handleStatus = NotificationHandleTypeOutOfDate;
                    }
                    [wself.tableView reloadData];
                }
            }];
            break;
        }
        case NIMSystemNotificationTypeTeamInvite:{
            [[NIMSDK sharedSDK].teamManager acceptInviteWithTeam:notification.targetID invitorId:notification.sourceID completion:^(NSError *error) {
                if (!error) {
                    [wself.navigationController.view makeToast:@"接受成功".ntes_localized
                                                      duration:2
                                                      position:CSToastPositionCenter];
                    notification.handleStatus = NotificationHandleTypeOk;
                    [wself.tableView reloadData];
                }else {
                    if(error.code == NIMRemoteErrorCodeTimeoutError) {
                        [wself.navigationController.view makeToast:LangKey(@"friend_verify_avtivity_net_error")
                                                          duration:2
                                                          position:CSToastPositionCenter];
                    }
                    else if (error.code == NIMRemoteErrorCodeTeamNotExists) {
                        [wself.navigationController.view makeToast:LangKey(@"group_info_activity_team_not_exist")
                                                          duration:2
                                                          position:CSToastPositionCenter];
                    }
                    else {
                        notification.handleStatus = NotificationHandleTypeOutOfDate;
                    }
                    [wself.tableView reloadData];
                }
            }];
        }
            break;
        case NIMSystemNotificationTypeSuperTeamInvite:
        {
            [[NIMSDK sharedSDK].superTeamManager acceptInviteWithTeam:notification.targetID invitorId:notification.sourceID completion:^(NSError *error) {
                if (!error) {
                    [wself.navigationController.view makeToast:@"接受成功".ntes_localized
                                                      duration:2
                                                      position:CSToastPositionCenter];
                    notification.handleStatus = NotificationHandleTypeOk;
                    [wself.tableView reloadData];
                }else {
                    if(error.code == NIMRemoteErrorCodeTimeoutError) {
                        [wself.navigationController.view makeToast:LangKey(@"friend_verify_avtivity_net_error")
                                                          duration:2
                                                          position:CSToastPositionCenter];
                    }
                    else if (error.code == NIMRemoteErrorCodeTeamNotExists) {
                        [wself.navigationController.view makeToast:LangKey(@"group_info_activity_team_not_exist")
                                                          duration:2
                                                          position:CSToastPositionCenter];
                    }
                    else {
                        notification.handleStatus = NotificationHandleTypeOutOfDate;
                    }
                    [wself.tableView reloadData];
                }
            }];
            break;
        }
        case NIMSystemNotificationTypeFriendAdd:
        {
            NIMUserRequest *request = [[NIMUserRequest alloc] init];
            request.userId = notification.sourceID;
            request.operation = NIMUserOperationVerify;
            
            [[[NIMSDK sharedSDK] userManager] requestFriend:request
                                                 completion:^(NSError *error) {
                                                     if (!error) {
                                                         [wself.navigationController.view makeToast:LangKey(@"successful_authentication")//@"验证成功".ntes_localized
                                                                                           duration:2
                                                                                           position:CSToastPositionCenter];
                                                         notification.handleStatus = NotificationHandleTypeOk;
                                                         //拿到对方用户信息
                                                         NIMUser *user = [[NIMSDK sharedSDK].userManager userInfo:notification.sourceID];
                                                         //NIMUser *me = [[NIMSDK sharedSDK].userManager userInfo:[[NIMSDK sharedSDK].loginManager currentAccount]];

                                                         // 构造出具体会话：P2P单聊，对方账号为user
                                                         NIMSession *session = [NIMSession session:notification.sourceID type:NIMSessionTypeP2P];
                                                         // 构造出具体消息
//                                                         NIMMessage *message = [NTESSessionMsgConverter msgWithTip:[NSString stringWithFormat:@"%@%@，%@",LangKey(@"you_have_added"),user.userInfo.nickName,LangKey(@"now_time_chat")]];
                                                         NIMMessage *message = [[NIMMessage alloc] init];
                                                         message.text        = [NSString stringWithFormat:@"%@%@，%@",LangKey(@"you_have_added"),user.userInfo.nickName,LangKey(@"now_time_chat")];
                                                         // 错误反馈对象
                                                         NSError *error = nil;
                                                         // 发送消息
                                                         [[NIMSDK sharedSDK].chatManager sendMessage:message toSession:session error:&error];
                                                     }
                                                     else
                                                     {
                                                         [wself.navigationController.view makeToast:LangKey(@"fail_authentication")//@"验证失败,请重试".ntes_localized
                                                                                           duration:2
                                                                                           position:CSToastPositionCenter];
                                                     }
                                                     [wself.tableView reloadData];
                                                 }];
            

//            [ZCHttpManager postWithUrl:Server_user_addFriend params:@{@"fuid":notification.sourceID?:@""} isShow:NO success:^(id responseObject) {
//
//            } failed:^(id responseObject, NSError *error) {
//            }];
            
            
        }
            break;
        default:
            break;
    }
}

- (void)onRefuse:(NIMSystemNotification *)notification
{
    __weak typeof(self) wself = self;
    switch (notification.type) {
        case NIMSystemNotificationTypeTeamApply:{
            [[NIMSDK sharedSDK].teamManager rejectApplyToTeam:notification.targetID userId:notification.sourceID rejectReason:@"" completion:^(NSError *error) {
                if (!error) {
                    [wself.navigationController.view makeToast:LangKey(@"message_helper_already_no")
                                                      duration:2
                                                      position:CSToastPositionCenter];
                    notification.handleStatus = NotificationHandleTypeNo;
                    [wself.tableView reloadData];
                }else {
                    if(error.code == NIMRemoteErrorCodeTimeoutError) {
                        [wself.navigationController.view makeToast:LangKey(@"friend_verify_avtivity_net_error")
                                                          duration:2
                                                          position:CSToastPositionCenter];
                    } else {
                        notification.handleStatus = NotificationHandleTypeOutOfDate;
                    }
                    [wself.tableView reloadData];
                }
            }];
        }
           break;
        case NIMSystemNotificationTypeSuperTeamApply:{
            [[NIMSDK sharedSDK].superTeamManager rejectApplyToTeam:notification.targetID userId:notification.sourceID rejectReason:@"" completion:^(NSError *error) {
                if (!error) {
                    [wself.navigationController.view makeToast:LangKey(@"message_helper_already_no")
                                                      duration:2
                                                      position:CSToastPositionCenter];
                    notification.handleStatus = NotificationHandleTypeNo;
                    [wself.tableView reloadData];
                }else {
                    if(error.code == NIMRemoteErrorCodeTimeoutError) {
                        [wself.navigationController.view makeToast:LangKey(@"friend_verify_avtivity_net_error")
                                                          duration:2
                                                          position:CSToastPositionCenter];
                    } else {
                        notification.handleStatus = NotificationHandleTypeOutOfDate;
                    }
                    [wself.tableView reloadData];
                }
            }];
            break;
        }
        case NIMSystemNotificationTypeTeamInvite:{
            [[NIMSDK sharedSDK].teamManager rejectInviteWithTeam:notification.targetID invitorId:notification.sourceID rejectReason:@"" completion:^(NSError *error) {
                if (!error) {
                    [wself.navigationController.view makeToast:LangKey(@"message_helper_already_no")
                                                      duration:2
                                                      position:CSToastPositionCenter];
                    notification.handleStatus = NotificationHandleTypeNo;
                    [wself.tableView reloadData];
                }else {
                    if(error.code == NIMRemoteErrorCodeTimeoutError) {
                        [wself.navigationController.view makeToast:LangKey(@"friend_verify_avtivity_net_error")
                                                          duration:2
                                                          position:CSToastPositionCenter];
                    }
                    else if (error.code == NIMRemoteErrorCodeTeamNotExists) {
                        [wself.navigationController.view makeToast:LangKey(@"group_info_activity_team_not_exist")
                                                          duration:2
                                                          position:CSToastPositionCenter];
                    }
                    else {
                        notification.handleStatus = NotificationHandleTypeOutOfDate;
                    }
                    [wself.tableView reloadData];
                }
            }];
        }
            break;
        case NIMSystemNotificationTypeSuperTeamInvite:{
            [[NIMSDK sharedSDK].superTeamManager rejectInviteWithTeam:notification.targetID invitorId:notification.sourceID rejectReason:@"" completion:^(NSError *error) {
                if (!error) {
                    [wself.navigationController.view makeToast:LangKey(@"message_helper_already_no")
                                                      duration:2
                                                      position:CSToastPositionCenter];
                    notification.handleStatus = NotificationHandleTypeNo;
                    [wself.tableView reloadData];
                }else {
                    if(error.code == NIMRemoteErrorCodeTimeoutError) {
                        [wself.navigationController.view makeToast:LangKey(@"friend_verify_avtivity_net_error")
                                                          duration:2
                                                          position:CSToastPositionCenter];
                    }
                    else if (error.code == NIMRemoteErrorCodeTeamNotExists) {
                        [wself.navigationController.view makeToast:LangKey(@"group_info_activity_team_not_exist")
                                                          duration:2
                                                          position:CSToastPositionCenter];
                    }
                    else {
                        notification.handleStatus = NotificationHandleTypeOutOfDate;
                    }
                    [wself.tableView reloadData];
                }
            }];
            break;
        }
        case NIMSystemNotificationTypeFriendAdd:
        {
            NIMUserRequest *request = [[NIMUserRequest alloc] init];
            request.userId = notification.sourceID;
            request.operation = NIMUserOperationReject;
            
            [[[NIMSDK sharedSDK] userManager] requestFriend:request
                                                 completion:^(NSError *error) {
                                                     if (!error) {
                                                         [wself.navigationController.view makeToast:LangKey(@"message_helper_already_no")
                                                                                           duration:2
                                                                                           position:CSToastPositionCenter];
                                                         notification.handleStatus = NotificationHandleTypeNo;
                                                     }
                                                     else
                                                     {
                                                         [wself.navigationController.view makeToast:@"拒绝失败,请重试".ntes_localized
                                                                                           duration:2
                                                                                           position:CSToastPositionCenter];
                                                     }
                                                     [wself.tableView reloadData];
                                                 }];
        }
            break;
        default:
            break;
    }
}


@end
