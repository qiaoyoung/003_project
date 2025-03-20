//
//  NTESNotificationView.m
//  NIM
//
//  Created by Yan Wang on 2024/6/27.
//  Copyright © 2024 Netease. All rights reserved.
//

#import "NTESNotificationView.h"
#import "NTESSystemNotificationCell.h"
#import "UIView+Toast.h"

@interface NTESNotificationView ()<NIMSystemNotificationManagerDelegate,NIMSystemNotificationCellDelegate,UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,assign)    BOOL shouldMarkAsRead;

@end

@implementation NTESNotificationView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:243/255.0 green:242/255.0 blue:252/255.0 alpha:1];

        self.tableView = [[UITableView alloc] initWithFrame:self.bounds style:UITableViewStylePlain];
        [self addSubview:self.tableView];
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.tableView.backgroundColor = [UIColor clearColor];
        self.tableView.estimatedRowHeight = UITableViewAutomaticDimension;
        self.tableView.delegate   = self;
        self.tableView.dataSource = self;
        
        _notifications = [NSMutableArray array];
        
        id<NIMSystemNotificationManager> systemNotificationManager = [[NIMSDK sharedSDK] systemNotificationManager];
        [systemNotificationManager addDelegate:self];
    
        NIMSystemNotificationFilter *filter = [[NIMSystemNotificationFilter alloc] init];
        filter.notificationTypes = @[@(0),@(1),@(2),@(3),@(5),@(15),@(16),@(17),@(18)];
       
        NSArray *notification = [systemNotificationManager fetchSystemNotifications:nil
                                                             limit:20 filter:filter];
        
        if ([notification count])
        {
            [_notifications addObjectsFromArray:notification];
//                    if (![[notification firstObject] read])
//                    {
//                        _shouldMarkAsRead = YES;
//
//                    }
        }
        
        [self.tableView reloadData];
        
    }
    return self;
}


- (void)initUI{
    
//        if (_shouldMarkAsRead)
//        {
//            [[[NIMSDK sharedSDK] systemNotificationManager] markAllNotificationsAsRead];
//        }
}

- (void)onReceiveSystemNotification:(NIMSystemNotification *)notification
{
    [_notifications insertObject:notification atIndex:0];
//    _shouldMarkAsRead = YES;
    [self.tableView reloadData];
//    [[[NIMSDK sharedSDK] systemNotificationManager] markAllNotificationsAsRead];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_notifications count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

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


#pragma mark - SystemNotificationCell
- (void)onAccept:(NIMSystemNotification *)notification
{
    __weak typeof(self) wself = self;
    switch (notification.type) {
        case NIMSystemNotificationTypeTeamApply:{
            [[NIMSDK sharedSDK].teamManager passApplyToTeam:notification.targetID userId:notification.sourceID completion:^(NSError *error, NIMTeamApplyStatus applyStatus) {
                if (!error) {
                    [wself makeToast:@"同意成功".ntes_localized
                                                      duration:2
                                                      position:CSToastPositionCenter];
                    notification.handleStatus = NotificationHandleTypeOk;
                    [wself.tableView reloadData];
                }else {
                    if(error.code == NIMRemoteErrorCodeTimeoutError) {
                        [wself makeToast:LangKey(@"friend_verify_avtivity_net_error")
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
                    [wself makeToast:@"同意成功".ntes_localized
                                                      duration:2
                                                      position:CSToastPositionCenter];
                    notification.handleStatus = NotificationHandleTypeOk;
                    [_notifications removeObject:notification];
                    [[[NIMSDK sharedSDK] systemNotificationManager] deleteNotification:notification];
                    [wself.tableView reloadData];
                }else {
                    if(error.code == NIMRemoteErrorCodeTimeoutError) {
                        [wself makeToast:LangKey(@"friend_verify_avtivity_net_error")
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
                    [wself makeToast:@"接受成功".ntes_localized
                                                      duration:2
                                                      position:CSToastPositionCenter];
                    notification.handleStatus = NotificationHandleTypeOk;
                    [_notifications removeObject:notification];
                    [[[NIMSDK sharedSDK] systemNotificationManager] deleteNotification:notification];
                    [wself.tableView reloadData];
                }else {
                    if(error.code == NIMRemoteErrorCodeTimeoutError) {
                        [wself makeToast:LangKey(@"friend_verify_avtivity_net_error")
                                                          duration:2
                                                          position:CSToastPositionCenter];
                    }
                    else if (error.code == NIMRemoteErrorCodeTeamNotExists) {
                        [wself makeToast:LangKey(@"group_info_activity_team_not_exist")
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
                    [wself makeToast:@"接受成功".ntes_localized
                                                      duration:2
                                                      position:CSToastPositionCenter];
                    notification.handleStatus = NotificationHandleTypeOk;
                    [_notifications removeObject:notification];
                    [[[NIMSDK sharedSDK] systemNotificationManager] deleteNotification:notification];
                    [wself.tableView reloadData];
                }else {
                    if(error.code == NIMRemoteErrorCodeTimeoutError) {
                        [wself makeToast:LangKey(@"friend_verify_avtivity_net_error")
                                                          duration:2
                                                          position:CSToastPositionCenter];
                    }
                    else if (error.code == NIMRemoteErrorCodeTeamNotExists) {
                        [wself makeToast:LangKey(@"group_info_activity_team_not_exist")
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
                                                         [wself makeToast:LangKey(@"successful_authentication")//@"验证成功".ntes_localized
                                                                                           duration:2
                                                                                           position:CSToastPositionCenter];
                                                         notification.handleStatus = NotificationHandleTypeOk;
                                                         
                                                         [_notifications removeObject:notification];
                                                         [[[NIMSDK sharedSDK] systemNotificationManager] deleteNotification:notification];
                                                     
                                                         
                                                         //拿到对方用户信息
//                                                         NIMUser *user = [[NIMSDK sharedSDK].userManager userInfo:notification.sourceID];
//                                                         //NIMUser *me = [[NIMSDK sharedSDK].userManager userInfo:[[NIMSDK sharedSDK].loginManager currentAccount]];
//
//                                                         // 构造出具体会话：P2P单聊，对方账号为user
//                                                         NIMSession *session = [NIMSession session:notification.sourceID type:NIMSessionTypeP2P];
//                                                         // 构造出具体消息
//                                                         NIMMessage *message = [[NIMMessage alloc] init];
//                                                         message.text        = [NSString stringWithFormat:@"%@%@，%@",LangKey(@"you_have_added"),user.userInfo.nickName,LangKey(@"now_time_chat")];
//                                                         // 错误反馈对象
//                                                         NSError *error = nil;
//                                                         // 发送消息
//                                                         [[NIMSDK sharedSDK].chatManager sendMessage:message toSession:session error:&error];
                                                     }
                                                     else
                                                     {
                                                         [wself makeToast:LangKey(@"fail_authentication")//@"验证失败,请重试".ntes_localized
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
                    [wself makeToast:LangKey(@"message_helper_already_no")
                                                      duration:2
                                                      position:CSToastPositionCenter];
                    notification.handleStatus = NotificationHandleTypeNo;
                    [_notifications removeObject:notification];
                    [[[NIMSDK sharedSDK] systemNotificationManager] deleteNotification:notification];
                    [wself.tableView reloadData];
                }else {
                    if(error.code == NIMRemoteErrorCodeTimeoutError) {
                        [wself makeToast:LangKey(@"friend_verify_avtivity_net_error")
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
                    [wself makeToast:LangKey(@"message_helper_already_no")
                                                      duration:2
                                                      position:CSToastPositionCenter];
                    notification.handleStatus = NotificationHandleTypeNo;
                    [_notifications removeObject:notification];
                    [[[NIMSDK sharedSDK] systemNotificationManager] deleteNotification:notification];
                    [wself.tableView reloadData];
                }else {
                    if(error.code == NIMRemoteErrorCodeTimeoutError) {
                        [wself makeToast:LangKey(@"friend_verify_avtivity_net_error")
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
                    [wself makeToast:LangKey(@"message_helper_already_no")
                                                      duration:2
                                                      position:CSToastPositionCenter];
                    notification.handleStatus = NotificationHandleTypeNo;
                    [_notifications removeObject:notification];
                    [[[NIMSDK sharedSDK] systemNotificationManager] deleteNotification:notification];
                    [wself.tableView reloadData];
                }else {
                    if(error.code == NIMRemoteErrorCodeTimeoutError) {
                        [wself makeToast:LangKey(@"friend_verify_avtivity_net_error")
                                                          duration:2
                                                          position:CSToastPositionCenter];
                    }
                    else if (error.code == NIMRemoteErrorCodeTeamNotExists) {
                        [wself makeToast:LangKey(@"group_info_activity_team_not_exist")
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
                    [wself makeToast:LangKey(@"message_helper_already_no")
                                                      duration:2
                                                      position:CSToastPositionCenter];
                    notification.handleStatus = NotificationHandleTypeNo;
                    [_notifications removeObject:notification];
                    [[[NIMSDK sharedSDK] systemNotificationManager] deleteNotification:notification];
                    [wself.tableView reloadData];
                }else {
                    if(error.code == NIMRemoteErrorCodeTimeoutError) {
                        [wself makeToast:LangKey(@"friend_verify_avtivity_net_error")
                                                          duration:2
                                                          position:CSToastPositionCenter];
                    }
                    else if (error.code == NIMRemoteErrorCodeTeamNotExists) {
                        [wself makeToast:LangKey(@"group_info_activity_team_not_exist")
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
                                                         [wself makeToast:LangKey(@"message_helper_already_no")
                                                                                           duration:2
                                                                                           position:CSToastPositionCenter];
                                                         notification.handleStatus = NotificationHandleTypeNo;
                                                         
                                                         [_notifications removeObject:notification];
                                                         [[[NIMSDK sharedSDK] systemNotificationManager] deleteNotification:notification];
                                                         
                                                     }
                                                     else
                                                     {
                                                         [wself makeToast:@"拒绝失败,请重试".ntes_localized
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


//#pragma mark - SystemNotificationCell
//- (void)onAccept:(NIMSystemNotification *)notification
//{
//    __weak typeof(self) wself = self;
//    switch (notification.type) {
//
//
//        case NIMSystemNotificationTypeFriendAdd:
//        {
//            NIMUserRequest *request = [[NIMUserRequest alloc] init];
//            request.userId = notification.sourceID;
//            request.operation = NIMUserOperationVerify;
//
//            [[[NIMSDK sharedSDK] userManager] requestFriend:request
//                                                 completion:^(NSError *error) {
//
//                NSLog(@"NIMUserOperationVerify-%@",error);
//                if (!error) {
//                    [wself makeToast:LangKey(@"successful_authentication")//@"验证成功".ntes_localized
//                                                      duration:2
//                                                      position:CSToastPositionCenter];
//                    notification.handleStatus = NotificationHandleTypeOk;
//                    //拿到对方用户信息
////                                                         NIMUser *user = [[NIMSDK sharedSDK].userManager userInfo:notification.sourceID];
////                                                         //NIMUser *me = [[NIMSDK sharedSDK].userManager userInfo:[[NIMSDK sharedSDK].loginManager currentAccount]];
////
////                                                         // 构造出具体会话：P2P单聊，对方账号为user
////                                                         NIMSession *session = [NIMSession session:notification.sourceID type:NIMSessionTypeP2P];
////                                                         // 构造出具体消息
////                                                         NIMMessage *message = [[NIMMessage alloc] init];
////                                                         message.text        = [NSString stringWithFormat:@"%@%@，%@",LangKey(@"you_have_added"),user.userInfo.nickName,LangKey(@"now_time_chat")];
////                                                         // 错误反馈对象
////                                                         NSError *error = nil;
////                                                         // 发送消息
////                                                         [[NIMSDK sharedSDK].chatManager sendMessage:message toSession:session error:&error];
//                }
//                else
//                {
//                    [wself makeToast:LangKey(@"fail_authentication")//@"验证失败,请重试".ntes_localized
//                                                      duration:2
//                                                      position:CSToastPositionCenter];
//                }
//
//                                                     [wself.tableView reloadData];
//                                                 }];
//
//
//            [ZCHttpManager postWithUrl:Server_user_addFriend params:@{@"fuid":notification.sourceID?:@""} isShow:NO success:^(id responseObject) {
//
//            } failed:^(id responseObject, NSError *error) {
//            }];
//
//
//        }
//            break;
//        default:
//            break;
//    }
//}
//
//- (void)onRefuse:(NIMSystemNotification *)notification
//{
//    __weak typeof(self) wself = self;
//    switch (notification.type) {
//
//        case NIMSystemNotificationTypeFriendAdd:
//        {
//            NIMUserRequest *request = [[NIMUserRequest alloc] init];
//            request.userId = notification.sourceID;
//            request.operation = NIMUserOperationReject;
//
//            [[[NIMSDK sharedSDK] userManager] requestFriend:request
//                                                 completion:^(NSError *error) {
//                NSLog(@"NIMUserOperationReject-%@",error);
//                                                     if (!error) {
//                                                         [wself makeToast:@"拒绝成功".ntes_localized
//                                                                                           duration:2
//                                                                                           position:CSToastPositionCenter];
//                                                         notification.handleStatus = NotificationHandleTypeNo;
//                                                     }
//                                                     else
//                                                     {
//                                                         [wself makeToast:@"拒绝失败,请重试".ntes_localized
//                                                                                           duration:2
//                                                                                           position:CSToastPositionCenter];
//                                                     }
//                                                     [wself.tableView reloadData];
//                                                 }];
//
//        }
//            break;
//        default:
//            break;
//    }
//}

@end
