//
//  CCCChatUIManager.m
// AppleProjectKit
//
//  Created by 丁文超 on 2020/3/19.
//  Copyright © 2020 NetEase. All rights reserved.
//

#import "CCCChatUIManager.h"
#import "AAAContactSelectConfig.h"
#import "AAAContactSelectViewController.h"
#import "BBBKitInfoFetchOption.h"
#import "UIView+NIMToast.h"

@implementation CCCChatUIManager

+ (instancetype)sharedManager
{
    static dispatch_once_t onceToken;
    static CCCChatUIManager *instance;
    dispatch_once(&onceToken, ^{
        instance = [self.alloc init];
    });
    return instance;
}

- (void)forwardMessage:(NIMMessage *)message fromViewController:(UIViewController *)fromVC
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:LangKey(@"选择会话类型") message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    [alertController addAction:[UIAlertAction actionWithTitle:LangKey(@"watch_multiretweet_activity_person") style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NIMContactFriendSelectConfig *config = [[NIMContactFriendSelectConfig alloc] init];
        config.needMutiSelected = NO;
        AAAContactSelectViewController *vc = [[AAAContactSelectViewController alloc] initWithConfig:config];
        vc.finshBlock = ^(NSArray *array, NSString *name, UIImage *avater){
            NSString *userId = array.firstObject;
            NIMSession *session = [NIMSession session:userId type:NIMSessionTypeP2P];
            [self forwardMessage:message toSession:session fromViewController:fromVC];
        };
        [vc show];
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:LangKey(@"contact_fragment_group") style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NIMContactTeamSelectConfig *config = [[NIMContactTeamSelectConfig alloc] init];
        config.teamType = NIMKitTeamTypeNomal;
        AAAContactSelectViewController *vc = [[AAAContactSelectViewController alloc] initWithConfig:config];
        vc.finshBlock = ^(NSArray *array, NSString *name, UIImage *avater){
            NSString *teamId = array.firstObject;
            NIMSession *session = [NIMSession session:teamId type:NIMSessionTypeTeam];
            [self forwardMessage:message toSession:session fromViewController:fromVC];
        };
        [vc show];
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:LangKey(@"message_super_team") style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NIMContactTeamSelectConfig *config = [[NIMContactTeamSelectConfig alloc] init];
        config.teamType = NIMKitTeamTypeSuper;
        AAAContactSelectViewController *vc = [[AAAContactSelectViewController alloc] initWithConfig:config];
        vc.finshBlock = ^(NSArray *array, NSString *name, UIImage *avater){
            NSString *teamId = array.firstObject;
            NIMSession *session = [NIMSession session:teamId type:NIMSessionTypeSuperTeam];
            [self forwardMessage:message toSession:session fromViewController:fromVC];
        };
        [vc show];
    }]];
    [alertController addAction:[UIAlertAction actionWithTitle:LangKey(@"friend_circle_adapter_cancel") style:UIAlertActionStyleCancel handler:nil]];
    [fromVC presentViewController:alertController animated:YES completion:nil];
}

- (void)forwardMessage:(NIMMessage *)message toSession:(NIMSession *)session fromViewController:(UIViewController *)fromVC
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
    NSString *tip = [NSString stringWithFormat:@"%@ %@ ?", NSLocalizedString(@"确认转发给", nil), name];
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:NSLocalizedString(@"确认转发", nil) message:tip preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction actionWithTitle:NSLocalizedString(@"取消", nil) style:UIAlertActionStyleCancel handler:nil]];
    [alertController addAction:[UIAlertAction actionWithTitle:NSLocalizedString(@"确认", nil) style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSError *error = nil;
        if (message.session) {
            [[NIMSDK sharedSDK].chatManager forwardMessage:message toSession:session error:&error];
        } else {
            [[NIMSDK sharedSDK].chatManager sendMessage:message toSession:session error:&error];
        }
        if (error) {
            NSString *errorMessage = [NSString stringWithFormat:@"%@.code:%zd", NSLocalizedString(@"转发失败", nil), error.code];
            [fromVC.view nim_showToast:errorMessage duration:2.0];
        } else {
            [fromVC.view nim_showToast:NSLocalizedString(@"已发送", nil) duration:2.0];
        }
    }]];
    [fromVC presentViewController:alertController animated:YES completion:nil];
}

@end
