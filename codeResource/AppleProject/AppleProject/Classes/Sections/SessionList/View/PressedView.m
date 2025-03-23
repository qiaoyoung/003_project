
#import <Foundation/Foundation.h>
typedef struct {
    Byte collectionLength;
    Byte *valueImageView;
    unsigned int heritage;
    bool create;
} PointData;

NSString *StringFromPointData(PointData *data);


//: 同意成功
PointData str_insertText = (PointData){121, (Byte []){156, 233, 245, 159, 253, 246, 159, 241, 233, 156, 243, 230, 51}, 12, false};


//: successful_authentication
PointData str_pointDisableName = (PointData){179, (Byte []){192, 198, 208, 208, 214, 192, 192, 213, 198, 223, 236, 210, 198, 199, 219, 214, 221, 199, 218, 208, 210, 199, 218, 220, 221, 52}, 25, false};


//: group_info_activity_team_not_exist
PointData str_linkDisableData = (PointData){161, (Byte []){198, 211, 206, 212, 209, 254, 200, 207, 199, 206, 254, 192, 194, 213, 200, 215, 200, 213, 216, 254, 213, 196, 192, 204, 254, 207, 206, 213, 254, 196, 217, 200, 210, 213, 108}, 34, false};


//: message_helper_already_no
PointData str_fileInfoClientData = (PointData){73, (Byte []){36, 44, 58, 58, 40, 46, 44, 22, 33, 44, 37, 57, 44, 59, 22, 40, 37, 59, 44, 40, 45, 48, 22, 39, 38, 183}, 25, false};


//: friend_verify_avtivity_net_error
PointData str_iconText = (PointData){89, (Byte []){63, 43, 48, 60, 55, 61, 6, 47, 60, 43, 48, 63, 32, 6, 56, 47, 45, 48, 47, 48, 45, 32, 6, 55, 60, 45, 6, 60, 43, 43, 54, 43, 57}, 32, false};


//: fail_authentication
PointData str_byValueData = (PointData){77, (Byte []){43, 44, 36, 33, 18, 44, 56, 57, 37, 40, 35, 57, 36, 46, 44, 57, 36, 34, 35, 134}, 19, false};


//: 接受成功
PointData str_byWithTitle = (PointData){93, (Byte []){187, 211, 248, 184, 210, 202, 187, 213, 205, 184, 215, 194, 22}, 12, false};


//: 拒绝失败,请重试
PointData str_minText = (PointData){133, (Byte []){99, 14, 23, 98, 62, 24, 96, 33, 52, 109, 49, 32, 169, 109, 42, 50, 108, 2, 8, 109, 42, 16, 242}, 22, false};

// __DEBUG__
// __CLOSE_PRINT__
//
//  PressedView.m
//  NIM
//
//  Created by Yan Wang on 2024/6/27.
//  Copyright © 2024 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import "NTESNotificationView.h"
#import "PressedView.h"
//: #import "NTESSystemNotificationCell.h"
#import "StateViewCell.h"
//: #import "UIView+Toast.h"
#import "UIView+Toast.h"

//: @interface NTESNotificationView ()<NIMSystemNotificationManagerDelegate,NIMSystemNotificationCellDelegate,UITableViewDelegate,UITableViewDataSource>
@interface PressedView ()<NIMSystemNotificationManagerDelegate,TeamAddIndicator,UITableViewDelegate,UITableViewDataSource>

//: @property (nonatomic,assign) BOOL shouldMarkAsRead;
@property (nonatomic,assign) BOOL shouldMarkAsRead;

//: @end
@end

//: @implementation NTESNotificationView
@implementation PressedView

//: - (instancetype)initWithFrame:(CGRect)frame
- (instancetype)initWithFrame:(CGRect)frame
{
    //: self = [super initWithFrame:frame];
    self = [super initWithFrame:frame];
    //: if (self) {
    if (self) {
        //: self.backgroundColor = [UIColor colorWithRed:243/255.0 green:242/255.0 blue:252/255.0 alpha:1];
        self.backgroundColor = [UIColor colorWithRed:243/255.0 green:242/255.0 blue:252/255.0 alpha:1];

        //: self.tableView = [[UITableView alloc] initWithFrame:self.bounds style:UITableViewStylePlain];
        self.tableView = [[UITableView alloc] initWithFrame:self.bounds style:UITableViewStylePlain];
        //: [self addSubview:self.tableView];
        [self addSubview:self.tableView];
        //: self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        //: self.tableView.backgroundColor = [UIColor clearColor];
        self.tableView.backgroundColor = [UIColor clearColor];
        //: self.tableView.estimatedRowHeight = UITableViewAutomaticDimension;
        self.tableView.estimatedRowHeight = UITableViewAutomaticDimension;
        //: self.tableView.delegate = self;
        self.tableView.delegate = self;
        //: self.tableView.dataSource = self;
        self.tableView.dataSource = self;

        //: _notifications = [NSMutableArray array];
        _notifications = [NSMutableArray array];

        //: id<NIMSystemNotificationManager> systemNotificationManager = [[NIMSDK sharedSDK] systemNotificationManager];
        id<NIMSystemNotificationManager> systemNotificationManager = [[NIMSDK sharedSDK] systemNotificationManager];
        //: [systemNotificationManager addDelegate:self];
        [systemNotificationManager addDelegate:self];

        //: NIMSystemNotificationFilter *filter = [[NIMSystemNotificationFilter alloc] init];
        NIMSystemNotificationFilter *filter = [[NIMSystemNotificationFilter alloc] init];
        //: filter.notificationTypes = @[@(0),@(1),@(2),@(3),@(5),@(15),@(16),@(17),@(18)];
        filter.notificationTypes = @[@(0),@(1),@(2),@(3),@(5),@(15),@(16),@(17),@(18)];

        //: NSArray *notification = [systemNotificationManager fetchSystemNotifications:nil
        NSArray *notification = [systemNotificationManager fetchSystemNotifications:nil
                                                             //: limit:20 filter:filter];
                                                             limit:20 filter:filter];

        //: if ([notification count])
        if ([notification count])
        {
            //: [_notifications addObjectsFromArray:notification];
            [_notifications addObjectsFromArray:notification];
//                    if (![[notification firstObject] read])
//                    {
//                        _shouldMarkAsRead = YES;
//
//                    }
        }

        //: [self.tableView reloadData];
        [self.tableView reloadData];

    }
    //: return self;
    return self;
}


//: - (void)initUI{
- (void)initImageIn{

//        if (_shouldMarkAsRead)
//        {
//            [[[NIMSDK sharedSDK] systemNotificationManager] markAllNotificationsAsRead];
//        }
}

//: - (void)onReceiveSystemNotification:(NIMSystemNotification *)notification
- (void)onReceiveSystemNotification:(NIMSystemNotification *)notification
{
    //: [_notifications insertObject:notification atIndex:0];
    [_notifications insertObject:notification atIndex:0];
//    _shouldMarkAsRead = YES;
    //: [self.tableView reloadData];
    [self.tableView reloadData];
//    [[[NIMSDK sharedSDK] systemNotificationManager] markAllNotificationsAsRead];
}

//: #pragma mark - UITableViewDataSource
#pragma mark - UITableViewDataSource

//: - (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    //: return 1;
    return 1;
}

//: - (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //: return [_notifications count];
    return [_notifications count];
}


//: - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    //: NTESSystemNotificationCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NTESSystemNotificationCell"];
    StateViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"StateViewCell"];
    //: if (!cell) {
    if (!cell) {
        //: cell = [[NTESSystemNotificationCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"NTESSystemNotificationCell"];
        cell = [[StateViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"StateViewCell"];
    }
    //: cell.actionDelegate = self;
    cell.actionDelegate = self;

    //: NIMSystemNotification *notification = [_notifications objectAtIndex:[indexPath row]];
    NIMSystemNotification *notification = [_notifications objectAtIndex:[indexPath row]];
    //: [cell update:notification];
    [cell doingline:notification];

    //: return cell;
    return cell;
}
//: - (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    //: return 70;
    return 70;
}

//: - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    //: return YES;
    return YES;
}

//: - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    //: if (editingStyle == UITableViewCellEditingStyleDelete) {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        //: NSInteger index = [indexPath row];
        NSInteger index = [indexPath row];
        //: NIMSystemNotification *notification = [_notifications objectAtIndex:index];
        NIMSystemNotification *notification = [_notifications objectAtIndex:index];
        //: [_notifications removeObjectAtIndex:index];
        [_notifications removeObjectAtIndex:index];
        //: [[[NIMSDK sharedSDK] systemNotificationManager] deleteNotification:notification];
        [[[NIMSDK sharedSDK] systemNotificationManager] deleteNotification:notification];
        //: [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}


//: #pragma mark - SystemNotificationCell
#pragma mark - SystemNotificationCell
//: - (void)onAccept:(NIMSystemNotification *)notification
- (void)independentCollection:(NIMSystemNotification *)notification
{
    //: __weak typeof(self) wself = self;
    __weak typeof(self) wself = self;
    //: switch (notification.type) {
    switch (notification.type) {
        //: case NIMSystemNotificationTypeTeamApply:{
        case NIMSystemNotificationTypeTeamApply:{
            //: [[NIMSDK sharedSDK].teamManager passApplyToTeam:notification.targetID userId:notification.sourceID completion:^(NSError *error, NIMTeamApplyStatus applyStatus) {
            [[NIMSDK sharedSDK].teamManager passApplyToTeam:notification.targetID userId:notification.sourceID completion:^(NSError *error, NIMTeamApplyStatus applyStatus) {
                //: if (!error) {
                if (!error) {
                    //: [wself makeToast:@"同意成功".ntes_localized
                    [wself makeToast:StringFromPointData(&str_insertText).language
                                                      //: duration:2
                                                      duration:2
                                                      //: position:CSToastPositionCenter];
                                                      position:CSToastPositionCenter];
                    //: notification.handleStatus = NotificationHandleTypeOk;
                    notification.handleStatus = NotificationHandleTypeOk;
                    //: [wself.tableView reloadData];
                    [wself.tableView reloadData];
                //: }else {
                }else {
                    //: if(error.code == NIMRemoteErrorCodeTimeoutError) {
                    if(error.code == NIMRemoteErrorCodeTimeoutError) {
                        //: [wself makeToast:[NTESLanguageManager getTextWithKey:@"friend_verify_avtivity_net_error"]
                        [wself makeToast:[MaxInformation off:StringFromPointData(&str_iconText)]
                                                          //: duration:2
                                                          duration:2
                                                          //: position:CSToastPositionCenter];
                                                          position:CSToastPositionCenter];
                    //: } else {
                    } else {
                        //: notification.handleStatus = NotificationHandleTypeOutOfDate;
                        notification.handleStatus = NotificationHandleTypeOutOfDate;
                    }
                    //: [wself.tableView reloadData];
                    [wself.tableView reloadData];
                }
            //: }];
            }];
            //: break;
            break;
        }
        //: case NIMSystemNotificationTypeSuperTeamApply:{
        case NIMSystemNotificationTypeSuperTeamApply:{
            //: [[NIMSDK sharedSDK].superTeamManager passApplyToTeam:notification.targetID userId:notification.sourceID completion:^(NSError *error, NIMTeamApplyStatus applyStatus) {
            [[NIMSDK sharedSDK].superTeamManager passApplyToTeam:notification.targetID userId:notification.sourceID completion:^(NSError *error, NIMTeamApplyStatus applyStatus) {
                //: if (!error) {
                if (!error) {
                    //: [wself makeToast:@"同意成功".ntes_localized
                    [wself makeToast:StringFromPointData(&str_insertText).language
                                                      //: duration:2
                                                      duration:2
                                                      //: position:CSToastPositionCenter];
                                                      position:CSToastPositionCenter];
                    //: notification.handleStatus = NotificationHandleTypeOk;
                    notification.handleStatus = NotificationHandleTypeOk;
                    //: [_notifications removeObject:notification];
                    [_notifications removeObject:notification];
                    //: [[[NIMSDK sharedSDK] systemNotificationManager] deleteNotification:notification];
                    [[[NIMSDK sharedSDK] systemNotificationManager] deleteNotification:notification];
                    //: [wself.tableView reloadData];
                    [wself.tableView reloadData];
                //: }else {
                }else {
                    //: if(error.code == NIMRemoteErrorCodeTimeoutError) {
                    if(error.code == NIMRemoteErrorCodeTimeoutError) {
                        //: [wself makeToast:[NTESLanguageManager getTextWithKey:@"friend_verify_avtivity_net_error"]
                        [wself makeToast:[MaxInformation off:StringFromPointData(&str_iconText)]
                                                          //: duration:2
                                                          duration:2
                                                          //: position:CSToastPositionCenter];
                                                          position:CSToastPositionCenter];
                    //: } else {
                    } else {
                        //: notification.handleStatus = NotificationHandleTypeOutOfDate;
                        notification.handleStatus = NotificationHandleTypeOutOfDate;
                    }
                    //: [wself.tableView reloadData];
                    [wself.tableView reloadData];
                }
            //: }];
            }];
            //: break;
            break;
        }
        //: case NIMSystemNotificationTypeTeamInvite:{
        case NIMSystemNotificationTypeTeamInvite:{
            //: [[NIMSDK sharedSDK].teamManager acceptInviteWithTeam:notification.targetID invitorId:notification.sourceID completion:^(NSError *error) {
            [[NIMSDK sharedSDK].teamManager acceptInviteWithTeam:notification.targetID invitorId:notification.sourceID completion:^(NSError *error) {
                //: if (!error) {
                if (!error) {
                    //: [wself makeToast:@"接受成功".ntes_localized
                    [wself makeToast:StringFromPointData(&str_byWithTitle).language
                                                      //: duration:2
                                                      duration:2
                                                      //: position:CSToastPositionCenter];
                                                      position:CSToastPositionCenter];
                    //: notification.handleStatus = NotificationHandleTypeOk;
                    notification.handleStatus = NotificationHandleTypeOk;
                    //: [_notifications removeObject:notification];
                    [_notifications removeObject:notification];
                    //: [[[NIMSDK sharedSDK] systemNotificationManager] deleteNotification:notification];
                    [[[NIMSDK sharedSDK] systemNotificationManager] deleteNotification:notification];
                    //: [wself.tableView reloadData];
                    [wself.tableView reloadData];
                //: }else {
                }else {
                    //: if(error.code == NIMRemoteErrorCodeTimeoutError) {
                    if(error.code == NIMRemoteErrorCodeTimeoutError) {
                        //: [wself makeToast:[NTESLanguageManager getTextWithKey:@"friend_verify_avtivity_net_error"]
                        [wself makeToast:[MaxInformation off:StringFromPointData(&str_iconText)]
                                                          //: duration:2
                                                          duration:2
                                                          //: position:CSToastPositionCenter];
                                                          position:CSToastPositionCenter];
                    }
                    //: else if (error.code == NIMRemoteErrorCodeTeamNotExists) {
                    else if (error.code == NIMRemoteErrorCodeTeamNotExists) {
                        //: [wself makeToast:[NTESLanguageManager getTextWithKey:@"group_info_activity_team_not_exist"]
                        [wself makeToast:[MaxInformation off:StringFromPointData(&str_linkDisableData)]
                                                          //: duration:2
                                                          duration:2
                                                          //: position:CSToastPositionCenter];
                                                          position:CSToastPositionCenter];
                    }
                    //: else {
                    else {
                        //: notification.handleStatus = NotificationHandleTypeOutOfDate;
                        notification.handleStatus = NotificationHandleTypeOutOfDate;
                    }
                    //: [wself.tableView reloadData];
                    [wself.tableView reloadData];
                }
            //: }];
            }];
        }
            //: break;
            break;
        //: case NIMSystemNotificationTypeSuperTeamInvite:
        case NIMSystemNotificationTypeSuperTeamInvite:
        {
            //: [[NIMSDK sharedSDK].superTeamManager acceptInviteWithTeam:notification.targetID invitorId:notification.sourceID completion:^(NSError *error) {
            [[NIMSDK sharedSDK].superTeamManager acceptInviteWithTeam:notification.targetID invitorId:notification.sourceID completion:^(NSError *error) {
                //: if (!error) {
                if (!error) {
                    //: [wself makeToast:@"接受成功".ntes_localized
                    [wself makeToast:StringFromPointData(&str_byWithTitle).language
                                                      //: duration:2
                                                      duration:2
                                                      //: position:CSToastPositionCenter];
                                                      position:CSToastPositionCenter];
                    //: notification.handleStatus = NotificationHandleTypeOk;
                    notification.handleStatus = NotificationHandleTypeOk;
                    //: [_notifications removeObject:notification];
                    [_notifications removeObject:notification];
                    //: [[[NIMSDK sharedSDK] systemNotificationManager] deleteNotification:notification];
                    [[[NIMSDK sharedSDK] systemNotificationManager] deleteNotification:notification];
                    //: [wself.tableView reloadData];
                    [wself.tableView reloadData];
                //: }else {
                }else {
                    //: if(error.code == NIMRemoteErrorCodeTimeoutError) {
                    if(error.code == NIMRemoteErrorCodeTimeoutError) {
                        //: [wself makeToast:[NTESLanguageManager getTextWithKey:@"friend_verify_avtivity_net_error"]
                        [wself makeToast:[MaxInformation off:StringFromPointData(&str_iconText)]
                                                          //: duration:2
                                                          duration:2
                                                          //: position:CSToastPositionCenter];
                                                          position:CSToastPositionCenter];
                    }
                    //: else if (error.code == NIMRemoteErrorCodeTeamNotExists) {
                    else if (error.code == NIMRemoteErrorCodeTeamNotExists) {
                        //: [wself makeToast:[NTESLanguageManager getTextWithKey:@"group_info_activity_team_not_exist"]
                        [wself makeToast:[MaxInformation off:StringFromPointData(&str_linkDisableData)]
                                                          //: duration:2
                                                          duration:2
                                                          //: position:CSToastPositionCenter];
                                                          position:CSToastPositionCenter];
                    }
                    //: else {
                    else {
                        //: notification.handleStatus = NotificationHandleTypeOutOfDate;
                        notification.handleStatus = NotificationHandleTypeOutOfDate;
                    }
                    //: [wself.tableView reloadData];
                    [wself.tableView reloadData];
                }
            //: }];
            }];
            //: break;
            break;
        }
        //: case NIMSystemNotificationTypeFriendAdd:
        case NIMSystemNotificationTypeFriendAdd:
        {
            //: NIMUserRequest *request = [[NIMUserRequest alloc] init];
            NIMUserRequest *request = [[NIMUserRequest alloc] init];
            //: request.userId = notification.sourceID;
            request.userId = notification.sourceID;
            //: request.operation = NIMUserOperationVerify;
            request.operation = NIMUserOperationVerify;

            //: [[[NIMSDK sharedSDK] userManager] requestFriend:request
            [[[NIMSDK sharedSDK] userManager] requestFriend:request
                                                 //: completion:^(NSError *error) {
                                                 completion:^(NSError *error) {
                                                     //: if (!error) {
                                                     if (!error) {
                                                         //: [wself makeToast:[NTESLanguageManager getTextWithKey:@"successful_authentication"]//@"验证成功".ntes_localized
                                                         [wself makeToast:[MaxInformation off:StringFromPointData(&str_pointDisableName)]//@"验证成功".ntes_localized
                                                                                           //: duration:2
                                                                                           duration:2
                                                                                           //: position:CSToastPositionCenter];
                                                                                           position:CSToastPositionCenter];
                                                         //: notification.handleStatus = NotificationHandleTypeOk;
                                                         notification.handleStatus = NotificationHandleTypeOk;

                                                         //: [_notifications removeObject:notification];
                                                         [_notifications removeObject:notification];
                                                         //: [[[NIMSDK sharedSDK] systemNotificationManager] deleteNotification:notification];
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
                                                     //: else
                                                     else
                                                     {
                                                         //: [wself makeToast:[NTESLanguageManager getTextWithKey:@"fail_authentication"]//@"验证失败,请重试".ntes_localized
                                                         [wself makeToast:[MaxInformation off:StringFromPointData(&str_byValueData)]//@"验证失败,请重试".ntes_localized
                                                                                           //: duration:2
                                                                                           duration:2
                                                                                           //: position:CSToastPositionCenter];
                                                                                           position:CSToastPositionCenter];
                                                     }
                                                     //: [wself.tableView reloadData];
                                                     [wself.tableView reloadData];
                                                 //: }];
                                                 }];


//            [FromMessage postWithUrl:Server_user_addFriend params:@{@"fuid":notification.sourceID?:@""} isShow:NO success:^(id responseObject) {
//
//            } failed:^(id responseObject, NSError *error) {
//            }];


        }
            //: break;
            break;
        //: default:
        default:
            //: break;
            break;
    }
}

//: - (void)onRefuse:(NIMSystemNotification *)notification
- (void)viewwed:(NIMSystemNotification *)notification
{
    //: __weak typeof(self) wself = self;
    __weak typeof(self) wself = self;
    //: switch (notification.type) {
    switch (notification.type) {
        //: case NIMSystemNotificationTypeTeamApply:{
        case NIMSystemNotificationTypeTeamApply:{
            //: [[NIMSDK sharedSDK].teamManager rejectApplyToTeam:notification.targetID userId:notification.sourceID rejectReason:@"" completion:^(NSError *error) {
            [[NIMSDK sharedSDK].teamManager rejectApplyToTeam:notification.targetID userId:notification.sourceID rejectReason:@"" completion:^(NSError *error) {
                //: if (!error) {
                if (!error) {
                    //: [wself makeToast:[NTESLanguageManager getTextWithKey:@"message_helper_already_no"]
                    [wself makeToast:[MaxInformation off:StringFromPointData(&str_fileInfoClientData)]
                                                      //: duration:2
                                                      duration:2
                                                      //: position:CSToastPositionCenter];
                                                      position:CSToastPositionCenter];
                    //: notification.handleStatus = NotificationHandleTypeNo;
                    notification.handleStatus = NotificationHandleTypeNo;
                    //: [_notifications removeObject:notification];
                    [_notifications removeObject:notification];
                    //: [[[NIMSDK sharedSDK] systemNotificationManager] deleteNotification:notification];
                    [[[NIMSDK sharedSDK] systemNotificationManager] deleteNotification:notification];
                    //: [wself.tableView reloadData];
                    [wself.tableView reloadData];
                //: }else {
                }else {
                    //: if(error.code == NIMRemoteErrorCodeTimeoutError) {
                    if(error.code == NIMRemoteErrorCodeTimeoutError) {
                        //: [wself makeToast:[NTESLanguageManager getTextWithKey:@"friend_verify_avtivity_net_error"]
                        [wself makeToast:[MaxInformation off:StringFromPointData(&str_iconText)]
                                                          //: duration:2
                                                          duration:2
                                                          //: position:CSToastPositionCenter];
                                                          position:CSToastPositionCenter];
                    //: } else {
                    } else {
                        //: notification.handleStatus = NotificationHandleTypeOutOfDate;
                        notification.handleStatus = NotificationHandleTypeOutOfDate;
                    }
                    //: [wself.tableView reloadData];
                    [wself.tableView reloadData];
                }
            //: }];
            }];
        }
           //: break;
           break;
        //: case NIMSystemNotificationTypeSuperTeamApply:{
        case NIMSystemNotificationTypeSuperTeamApply:{
            //: [[NIMSDK sharedSDK].superTeamManager rejectApplyToTeam:notification.targetID userId:notification.sourceID rejectReason:@"" completion:^(NSError *error) {
            [[NIMSDK sharedSDK].superTeamManager rejectApplyToTeam:notification.targetID userId:notification.sourceID rejectReason:@"" completion:^(NSError *error) {
                //: if (!error) {
                if (!error) {
                    //: [wself makeToast:[NTESLanguageManager getTextWithKey:@"message_helper_already_no"]
                    [wself makeToast:[MaxInformation off:StringFromPointData(&str_fileInfoClientData)]
                                                      //: duration:2
                                                      duration:2
                                                      //: position:CSToastPositionCenter];
                                                      position:CSToastPositionCenter];
                    //: notification.handleStatus = NotificationHandleTypeNo;
                    notification.handleStatus = NotificationHandleTypeNo;
                    //: [_notifications removeObject:notification];
                    [_notifications removeObject:notification];
                    //: [[[NIMSDK sharedSDK] systemNotificationManager] deleteNotification:notification];
                    [[[NIMSDK sharedSDK] systemNotificationManager] deleteNotification:notification];
                    //: [wself.tableView reloadData];
                    [wself.tableView reloadData];
                //: }else {
                }else {
                    //: if(error.code == NIMRemoteErrorCodeTimeoutError) {
                    if(error.code == NIMRemoteErrorCodeTimeoutError) {
                        //: [wself makeToast:[NTESLanguageManager getTextWithKey:@"friend_verify_avtivity_net_error"]
                        [wself makeToast:[MaxInformation off:StringFromPointData(&str_iconText)]
                                                          //: duration:2
                                                          duration:2
                                                          //: position:CSToastPositionCenter];
                                                          position:CSToastPositionCenter];
                    //: } else {
                    } else {
                        //: notification.handleStatus = NotificationHandleTypeOutOfDate;
                        notification.handleStatus = NotificationHandleTypeOutOfDate;
                    }
                    //: [wself.tableView reloadData];
                    [wself.tableView reloadData];
                }
            //: }];
            }];
            //: break;
            break;
        }
        //: case NIMSystemNotificationTypeTeamInvite:{
        case NIMSystemNotificationTypeTeamInvite:{
            //: [[NIMSDK sharedSDK].teamManager rejectInviteWithTeam:notification.targetID invitorId:notification.sourceID rejectReason:@"" completion:^(NSError *error) {
            [[NIMSDK sharedSDK].teamManager rejectInviteWithTeam:notification.targetID invitorId:notification.sourceID rejectReason:@"" completion:^(NSError *error) {
                //: if (!error) {
                if (!error) {
                    //: [wself makeToast:[NTESLanguageManager getTextWithKey:@"message_helper_already_no"]
                    [wself makeToast:[MaxInformation off:StringFromPointData(&str_fileInfoClientData)]
                                                      //: duration:2
                                                      duration:2
                                                      //: position:CSToastPositionCenter];
                                                      position:CSToastPositionCenter];
                    //: notification.handleStatus = NotificationHandleTypeNo;
                    notification.handleStatus = NotificationHandleTypeNo;
                    //: [_notifications removeObject:notification];
                    [_notifications removeObject:notification];
                    //: [[[NIMSDK sharedSDK] systemNotificationManager] deleteNotification:notification];
                    [[[NIMSDK sharedSDK] systemNotificationManager] deleteNotification:notification];
                    //: [wself.tableView reloadData];
                    [wself.tableView reloadData];
                //: }else {
                }else {
                    //: if(error.code == NIMRemoteErrorCodeTimeoutError) {
                    if(error.code == NIMRemoteErrorCodeTimeoutError) {
                        //: [wself makeToast:[NTESLanguageManager getTextWithKey:@"friend_verify_avtivity_net_error"]
                        [wself makeToast:[MaxInformation off:StringFromPointData(&str_iconText)]
                                                          //: duration:2
                                                          duration:2
                                                          //: position:CSToastPositionCenter];
                                                          position:CSToastPositionCenter];
                    }
                    //: else if (error.code == NIMRemoteErrorCodeTeamNotExists) {
                    else if (error.code == NIMRemoteErrorCodeTeamNotExists) {
                        //: [wself makeToast:[NTESLanguageManager getTextWithKey:@"group_info_activity_team_not_exist"]
                        [wself makeToast:[MaxInformation off:StringFromPointData(&str_linkDisableData)]
                                                          //: duration:2
                                                          duration:2
                                                          //: position:CSToastPositionCenter];
                                                          position:CSToastPositionCenter];
                    }
                    //: else {
                    else {
                        //: notification.handleStatus = NotificationHandleTypeOutOfDate;
                        notification.handleStatus = NotificationHandleTypeOutOfDate;
                    }
                    //: [wself.tableView reloadData];
                    [wself.tableView reloadData];
                }
            //: }];
            }];
        }
            //: break;
            break;
        //: case NIMSystemNotificationTypeSuperTeamInvite:{
        case NIMSystemNotificationTypeSuperTeamInvite:{
            //: [[NIMSDK sharedSDK].superTeamManager rejectInviteWithTeam:notification.targetID invitorId:notification.sourceID rejectReason:@"" completion:^(NSError *error) {
            [[NIMSDK sharedSDK].superTeamManager rejectInviteWithTeam:notification.targetID invitorId:notification.sourceID rejectReason:@"" completion:^(NSError *error) {
                //: if (!error) {
                if (!error) {
                    //: [wself makeToast:[NTESLanguageManager getTextWithKey:@"message_helper_already_no"]
                    [wself makeToast:[MaxInformation off:StringFromPointData(&str_fileInfoClientData)]
                                                      //: duration:2
                                                      duration:2
                                                      //: position:CSToastPositionCenter];
                                                      position:CSToastPositionCenter];
                    //: notification.handleStatus = NotificationHandleTypeNo;
                    notification.handleStatus = NotificationHandleTypeNo;
                    //: [_notifications removeObject:notification];
                    [_notifications removeObject:notification];
                    //: [[[NIMSDK sharedSDK] systemNotificationManager] deleteNotification:notification];
                    [[[NIMSDK sharedSDK] systemNotificationManager] deleteNotification:notification];
                    //: [wself.tableView reloadData];
                    [wself.tableView reloadData];
                //: }else {
                }else {
                    //: if(error.code == NIMRemoteErrorCodeTimeoutError) {
                    if(error.code == NIMRemoteErrorCodeTimeoutError) {
                        //: [wself makeToast:[NTESLanguageManager getTextWithKey:@"friend_verify_avtivity_net_error"]
                        [wself makeToast:[MaxInformation off:StringFromPointData(&str_iconText)]
                                                          //: duration:2
                                                          duration:2
                                                          //: position:CSToastPositionCenter];
                                                          position:CSToastPositionCenter];
                    }
                    //: else if (error.code == NIMRemoteErrorCodeTeamNotExists) {
                    else if (error.code == NIMRemoteErrorCodeTeamNotExists) {
                        //: [wself makeToast:[NTESLanguageManager getTextWithKey:@"group_info_activity_team_not_exist"]
                        [wself makeToast:[MaxInformation off:StringFromPointData(&str_linkDisableData)]
                                                          //: duration:2
                                                          duration:2
                                                          //: position:CSToastPositionCenter];
                                                          position:CSToastPositionCenter];
                    }
                    //: else {
                    else {
                        //: notification.handleStatus = NotificationHandleTypeOutOfDate;
                        notification.handleStatus = NotificationHandleTypeOutOfDate;
                    }
                    //: [wself.tableView reloadData];
                    [wself.tableView reloadData];
                }
            //: }];
            }];
            //: break;
            break;
        }
        //: case NIMSystemNotificationTypeFriendAdd:
        case NIMSystemNotificationTypeFriendAdd:
        {
            //: NIMUserRequest *request = [[NIMUserRequest alloc] init];
            NIMUserRequest *request = [[NIMUserRequest alloc] init];
            //: request.userId = notification.sourceID;
            request.userId = notification.sourceID;
            //: request.operation = NIMUserOperationReject;
            request.operation = NIMUserOperationReject;

            //: [[[NIMSDK sharedSDK] userManager] requestFriend:request
            [[[NIMSDK sharedSDK] userManager] requestFriend:request
                                                 //: completion:^(NSError *error) {
                                                 completion:^(NSError *error) {
                                                     //: if (!error) {
                                                     if (!error) {
                                                         //: [wself makeToast:[NTESLanguageManager getTextWithKey:@"message_helper_already_no"]
                                                         [wself makeToast:[MaxInformation off:StringFromPointData(&str_fileInfoClientData)]
                                                                                           //: duration:2
                                                                                           duration:2
                                                                                           //: position:CSToastPositionCenter];
                                                                                           position:CSToastPositionCenter];
                                                         //: notification.handleStatus = NotificationHandleTypeNo;
                                                         notification.handleStatus = NotificationHandleTypeNo;

                                                         //: [_notifications removeObject:notification];
                                                         [_notifications removeObject:notification];
                                                         //: [[[NIMSDK sharedSDK] systemNotificationManager] deleteNotification:notification];
                                                         [[[NIMSDK sharedSDK] systemNotificationManager] deleteNotification:notification];

                                                     }
                                                     //: else
                                                     else
                                                     {
                                                         //: [wself makeToast:@"拒绝失败,请重试".ntes_localized
                                                         [wself makeToast:StringFromPointData(&str_minText).language
                                                                                           //: duration:2
                                                                                           duration:2
                                                                                           //: position:CSToastPositionCenter];
                                                                                           position:CSToastPositionCenter];
                                                     }
                                                     //: [wself.tableView reloadData];
                                                     [wself.tableView reloadData];
                                                 //: }];
                                                 }];
        }
            //: break;
            break;
        //: default:
        default:
            //: break;
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
//            [FromMessage postWithUrl:Server_user_addFriend params:@{@"fuid":notification.sourceID?:@""} isShow:NO success:^(id responseObject) {
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

//: @end
@end

Byte *PointDataToByte(PointData *data) {
    if (data->create) return data->valueImageView;
    for (int i = 0; i < data->heritage; i++) {
        data->valueImageView[i] ^= data->collectionLength;
    }
    data->valueImageView[data->heritage] = 0;
    data->create = true;
    return data->valueImageView;
}

NSString *StringFromPointData(PointData *data) {
    return [NSString stringWithUTF8String:(char *)PointDataToByte(data)];
}
