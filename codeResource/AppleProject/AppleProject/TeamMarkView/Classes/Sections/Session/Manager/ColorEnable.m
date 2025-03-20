
#import <Foundation/Foundation.h>

NSString *StringFromOriginData(Byte *data);        


//: watch_multiretweet_activity_person
Byte str_chemicalText[] = {1, 34, 91, 12, 14, 147, 7, 6, 152, 30, 115, 137, 28, 6, 25, 8, 13, 4, 18, 26, 17, 25, 14, 23, 10, 25, 28, 10, 10, 25, 4, 6, 8, 25, 14, 27, 14, 25, 30, 4, 21, 10, 23, 24, 20, 19, 195};


//: 确认转发给
Byte str_manipulateName[] = {87, 15, 62, 10, 227, 154, 217, 127, 249, 107, 169, 99, 112, 170, 112, 102, 170, 127, 110, 167, 81, 83, 169, 125, 91, 187};


//: 已发送
Byte str_closelyTitle[] = {86, 9, 21, 12, 248, 122, 209, 8, 50, 80, 152, 208, 208, 162, 157, 208, 122, 124, 212, 107, 108, 166};


//: friend_circle_adapter_cancel
Byte str_scanSignerRideContent[] = {31, 28, 94, 13, 245, 144, 72, 37, 146, 37, 76, 140, 177, 8, 20, 11, 7, 16, 6, 1, 5, 11, 20, 5, 14, 7, 1, 3, 6, 3, 18, 22, 7, 20, 1, 5, 3, 16, 5, 7, 14, 172};


//: %@.code:%zd
Byte str_textSecondaryValue[] = {38, 11, 71, 8, 205, 171, 239, 203, 222, 249, 231, 28, 40, 29, 30, 243, 222, 51, 29, 114};


//: 选择会话类型
Byte str_fillTitleName[] = {15, 18, 69, 13, 194, 36, 87, 90, 242, 177, 164, 146, 181, 164, 59, 68, 161, 70, 100, 159, 119, 85, 163, 106, 88, 162, 108, 118, 160, 89, 70, 154};


//: 确认转发
Byte str_gestureConcerningValue[] = {65, 12, 61, 9, 109, 224, 210, 109, 52, 170, 100, 113, 171, 113, 103, 171, 128, 111, 168, 82, 84, 194};


//: 转发失败
Byte str_refugeData[] = {53, 12, 1, 11, 1, 222, 27, 220, 204, 228, 8, 231, 188, 171, 228, 142, 144, 228, 163, 176, 231, 179, 164, 158};


//: message_super_team
Byte str_correlationData[] = {7, 18, 37, 12, 94, 52, 25, 229, 179, 155, 229, 171, 72, 64, 78, 78, 60, 66, 64, 58, 78, 80, 75, 64, 77, 58, 79, 64, 60, 72, 8};


//: contact_fragment_group
Byte str_inputRecordName[] = {16, 22, 84, 5, 225, 15, 27, 26, 32, 13, 15, 32, 11, 18, 30, 13, 19, 25, 17, 26, 32, 11, 19, 30, 27, 33, 28, 126};

// __DEBUG__
// __CLOSE_PRINT__
//
//  ColorEnable.m
// Indicator
//
//  Created by 丁文超 on 2020/3/19.
//  Copyright © 2020 NetEase. All rights reserved.
//

// __M_A_C_R_O__
//: #import "CCCChatUIManager.h"
#import "ColorEnable.h"
//: #import "AAAContactSelectConfig.h"
#import "ShowHide.h"
//: #import "AAAContactSelectViewController.h"
#import "SelectDisableViewController.h"
//: #import "BBBKitInfoFetchOption.h"
#import "TitleOption.h"
//: #import "UIView+NIMToast.h"
#import "UIView+CenterToast.h"

//: @implementation CCCChatUIManager
@implementation ColorEnable

//: + (instancetype)sharedManager
+ (instancetype)labelEnable
{
    //: static dispatch_once_t onceToken;
    static dispatch_once_t onceToken;
    //: static CCCChatUIManager *instance;
    static ColorEnable *instance;
    //: _dispatch_once(&onceToken, ^{
    _dispatch_once(&onceToken, ^{
        //: instance = [self.alloc init];
        instance = [self.alloc init];
    //: });
    });
    //: return instance;
    return instance;
}

//: - (void)forwardMessage:(NIMMessage *)message fromViewController:(UIViewController *)fromVC
- (void)top:(NIMMessage *)message image:(UIViewController *)fromVC
{
    //: UIAlertController *alertController = [UIAlertController alertControllerWithTitle:[NTESLanguageManager getTextWithKey:@"选择会话类型"] message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:[MaxInformation off:StringFromOriginData(str_fillTitleName)] message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    //: [alertController addAction:[UIAlertAction actionWithTitle:[NTESLanguageManager getTextWithKey:@"watch_multiretweet_activity_person"] style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
    [alertController addAction:[UIAlertAction actionWithTitle:[MaxInformation off:StringFromOriginData(str_chemicalText)] style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //: NIMContactFriendSelectConfig *config = [[NIMContactFriendSelectConfig alloc] init];
        ChildTeam *config = [[ChildTeam alloc] init];
        //: config.needMutiSelected = NO;
        config.needMutiSelected = NO;
        //: AAAContactSelectViewController *vc = [[AAAContactSelectViewController alloc] initWithConfig:config];
        SelectDisableViewController *vc = [[SelectDisableViewController alloc] initWithTextConfig:config];
        //: vc.finshBlock = ^(NSArray *array, NSString *name, UIImage *avater){
        vc.finshBlock = ^(NSArray *array, NSString *name, UIImage *avater){
            //: NSString *userId = array.firstObject;
            NSString *userId = array.firstObject;
            //: NIMSession *session = [NIMSession session:userId type:NIMSessionTypeP2P];
            NIMSession *session = [NIMSession session:userId type:NIMSessionTypeP2P];
            //: [self forwardMessage:message toSession:session fromViewController:fromVC];
            [self input:message chromatogram:session disable:fromVC];
        //: };
        };
        //: [vc show];
        [vc fromOn];
    //: }]];
    }]];
    //: [alertController addAction:[UIAlertAction actionWithTitle:[NTESLanguageManager getTextWithKey:@"contact_fragment_group"] style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
    [alertController addAction:[UIAlertAction actionWithTitle:[MaxInformation off:StringFromOriginData(str_inputRecordName)] style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //: NIMContactTeamSelectConfig *config = [[NIMContactTeamSelectConfig alloc] init];
        AddHide *config = [[AddHide alloc] init];
        //: config.teamType = NIMKitTeamTypeNomal;
        config.teamType = NIMKitTeamTypeNomal;
        //: AAAContactSelectViewController *vc = [[AAAContactSelectViewController alloc] initWithConfig:config];
        SelectDisableViewController *vc = [[SelectDisableViewController alloc] initWithTextConfig:config];
        //: vc.finshBlock = ^(NSArray *array, NSString *name, UIImage *avater){
        vc.finshBlock = ^(NSArray *array, NSString *name, UIImage *avater){
            //: NSString *teamId = array.firstObject;
            NSString *teamId = array.firstObject;
            //: NIMSession *session = [NIMSession session:teamId type:NIMSessionTypeTeam];
            NIMSession *session = [NIMSession session:teamId type:NIMSessionTypeTeam];
            //: [self forwardMessage:message toSession:session fromViewController:fromVC];
            [self input:message chromatogram:session disable:fromVC];
        //: };
        };
        //: [vc show];
        [vc fromOn];
    //: }]];
    }]];
    //: [alertController addAction:[UIAlertAction actionWithTitle:[NTESLanguageManager getTextWithKey:@"message_super_team"] style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
    [alertController addAction:[UIAlertAction actionWithTitle:[MaxInformation off:StringFromOriginData(str_correlationData)] style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //: NIMContactTeamSelectConfig *config = [[NIMContactTeamSelectConfig alloc] init];
        AddHide *config = [[AddHide alloc] init];
        //: config.teamType = NIMKitTeamTypeSuper;
        config.teamType = NIMKitTeamTypeSuper;
        //: AAAContactSelectViewController *vc = [[AAAContactSelectViewController alloc] initWithConfig:config];
        SelectDisableViewController *vc = [[SelectDisableViewController alloc] initWithTextConfig:config];
        //: vc.finshBlock = ^(NSArray *array, NSString *name, UIImage *avater){
        vc.finshBlock = ^(NSArray *array, NSString *name, UIImage *avater){
            //: NSString *teamId = array.firstObject;
            NSString *teamId = array.firstObject;
            //: NIMSession *session = [NIMSession session:teamId type:NIMSessionTypeSuperTeam];
            NIMSession *session = [NIMSession session:teamId type:NIMSessionTypeSuperTeam];
            //: [self forwardMessage:message toSession:session fromViewController:fromVC];
            [self input:message chromatogram:session disable:fromVC];
        //: };
        };
        //: [vc show];
        [vc fromOn];
    //: }]];
    }]];
    //: [alertController addAction:[UIAlertAction actionWithTitle:[NTESLanguageManager getTextWithKey:@"friend_circle_adapter_cancel"] style:UIAlertActionStyleCancel handler:nil]];
    [alertController addAction:[UIAlertAction actionWithTitle:[MaxInformation off:StringFromOriginData(str_scanSignerRideContent)] style:UIAlertActionStyleCancel handler:nil]];
    //: [fromVC presentViewController:alertController animated:YES completion:nil];
    [fromVC presentViewController:alertController animated:YES completion:nil];
}

//: - (void)forwardMessage:(NIMMessage *)message toSession:(NIMSession *)session fromViewController:(UIViewController *)fromVC
- (void)input:(NIMMessage *)message chromatogram:(NIMSession *)session disable:(UIViewController *)fromVC
{
    //: NSString *name;
    NSString *name;
    //: if (session.sessionType == NIMSessionTypeP2P) {
    if (session.sessionType == NIMSessionTypeP2P) {
        //: BBBKitInfoFetchOption *option = [[BBBKitInfoFetchOption alloc] init];
        TitleOption *option = [[TitleOption alloc] init];
        //: option.session = session;
        option.session = session;
        //: name = [[AppleProjectKit sharedKit] infoByUser:session.sessionId option:option].showName;
        name = [[Indicator reach] indoors:session.sessionId harvest:option].showName;
    }
    //: else if (session.sessionType == NIMSessionTypeTeam) {
    else if (session.sessionType == NIMSessionTypeTeam) {
        //: name = [[AppleProjectKit sharedKit] infoByTeam:session.sessionId option:nil].showName;
        name = [[Indicator reach] text:session.sessionId byLabel:nil].showName;
    }
    //: else if (session.sessionType == NIMSessionTypeSuperTeam) {
    else if (session.sessionType == NIMSessionTypeSuperTeam) {
        //: name = [[AppleProjectKit sharedKit] infoBySuperTeam:session.sessionId option:nil].showName;
        name = [[Indicator reach] noneShowOption:session.sessionId viewMedia:nil].showName;
    }
    //: NSString *tip = [NSString stringWithFormat:@"%@ %@ ?", NSLocalizedString(@"确认转发给", nil), name];
    NSString *tip = [NSString stringWithFormat:@"%@ %@ ?", NSLocalizedString(StringFromOriginData(str_manipulateName), nil), name];
    //: UIAlertController *alertController = [UIAlertController alertControllerWithTitle:NSLocalizedString(@"确认转发", nil) message:tip preferredStyle:UIAlertControllerStyleAlert];
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:NSLocalizedString(StringFromOriginData(str_gestureConcerningValue), nil) message:tip preferredStyle:UIAlertControllerStyleAlert];
    //: [alertController addAction:[UIAlertAction actionWithTitle:NSLocalizedString(@"取消", nil) style:UIAlertActionStyleCancel handler:nil]];
    [alertController addAction:[UIAlertAction actionWithTitle:NSLocalizedString(@"取消", nil) style:UIAlertActionStyleCancel handler:nil]];
    //: [alertController addAction:[UIAlertAction actionWithTitle:NSLocalizedString(@"确认", nil) style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
    [alertController addAction:[UIAlertAction actionWithTitle:NSLocalizedString(@"确认", nil) style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //: NSError *error = nil;
        NSError *error = nil;
        //: if (message.session) {
        if (message.session) {
            //: [[NIMSDK sharedSDK].chatManager forwardMessage:message toSession:session error:&error];
            [[NIMSDK sharedSDK].chatManager forwardMessage:message toSession:session error:&error];
        //: } else {
        } else {
            //: [[NIMSDK sharedSDK].chatManager sendMessage:message toSession:session error:&error];
            [[NIMSDK sharedSDK].chatManager sendMessage:message toSession:session error:&error];
        }
        //: if (error) {
        if (error) {
            //: NSString *errorMessage = [NSString stringWithFormat:@"%@.code:%zd", NSLocalizedString(@"转发失败", nil), error.code];
            NSString *errorMessage = [NSString stringWithFormat:StringFromOriginData(str_textSecondaryValue), NSLocalizedString(StringFromOriginData(str_refugeData), nil), error.code];
            //: [fromVC.view nim_showToast:errorMessage duration:2.0];
            [fromVC.view origin:errorMessage imageMessageDuration:2.0];
        //: } else {
        } else {
            //: [fromVC.view nim_showToast:NSLocalizedString(@"已发送", nil) duration:2.0];
            [fromVC.view origin:NSLocalizedString(StringFromOriginData(str_closelyTitle), nil) imageMessageDuration:2.0];
        }
    //: }]];
    }]];
    //: [fromVC presentViewController:alertController animated:YES completion:nil];
    [fromVC presentViewController:alertController animated:YES completion:nil];
}

//: @end
@end

Byte * OriginDataToCache(Byte *data) {
    int safetyRail = data[0];
    int cameraAnal = data[1];
    Byte variety = data[2];
    int acquaintConstrain = data[3];
    if (!safetyRail) return data + acquaintConstrain;
    for (int i = acquaintConstrain; i < acquaintConstrain + cameraAnal; i++) {
        int value = data[i] + variety;
        if (value > 255) {
            value -= 256;
        }
        data[i] = value;
    }
    data[0] = 0;
    data[acquaintConstrain + cameraAnal] = 0;
    return data + acquaintConstrain;
}

NSString *StringFromOriginData(Byte *data) {
    return [NSString stringWithUTF8String:(char *)OriginDataToCache(data)];
}
