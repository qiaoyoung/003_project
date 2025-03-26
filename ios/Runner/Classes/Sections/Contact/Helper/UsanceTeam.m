
#import <Foundation/Foundation.h>

NSString *StringFromDefenseLaboratoryData(Byte *data);


//: teamName
Byte str_questionText[] = {52, 8, 64, 14, 193, 194, 42, 221, 1, 127, 232, 131, 111, 223, 180, 165, 161, 173, 142, 161, 173, 165, 118};


//: content
Byte str_textClientValue[] = {34, 7, 48, 6, 75, 17, 147, 159, 158, 164, 149, 158, 164, 96};


//: 正在呼叫您
Byte str_shouldInfoValue[] = {87, 15, 1, 14, 217, 95, 236, 174, 9, 143, 202, 113, 223, 245, 231, 174, 164, 230, 157, 169, 230, 146, 189, 230, 144, 172, 231, 131, 169, 78};


//: room
Byte str_needChangeValue[] = {63, 4, 8, 10, 53, 52, 26, 87, 193, 38, 122, 119, 119, 117, 120};


//: teamId
Byte str_schemeKeyValue[] = {29, 6, 86, 11, 97, 4, 157, 44, 156, 33, 246, 202, 187, 183, 195, 159, 186, 197};


//: members
Byte str_clientTitleValue[] = {30, 7, 53, 4, 162, 154, 162, 151, 154, 167, 168, 205};


//: teamType
Byte str_viewCellValue[] = {48, 8, 96, 4, 212, 197, 193, 205, 180, 217, 208, 197, 249};

// __DEBUG__
// __CLOSE_PRINT__
//
//  NTESCustomSysNotiSender.m
//  NIM
//
//  Created by chris on 15/5/26.
//  Copyright (c) 2015年 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import "NTESCustomSysNotificationSender.h"
#import "UsanceTeam.h"
//: #import "BBBKitInfoFetchOption.h"
#import "TitleOption.h"
//: #import "NTESBundleSetting.h"
#import "NameLine.h"

//: @interface NTESCustomSysNotificationSender ()
@interface UsanceTeam ()
//: @property (nonatomic,strong) NSDate *lastTime;
@property (nonatomic,strong) NSDate *lastTime;
//: @end
@end

//: @implementation NTESCustomSysNotificationSender
@implementation UsanceTeam

//: - (void)sendCustomContent:(NSString *)content toSession:(NIMSession *)session{
- (void)recent:(NSString *)content session:(NIMSession *)session{
    //: if (!content) {
    if (!content) {
        //: return;
        return;
    }
    //: NSDictionary *dict = @{
    NSDictionary *dict = @{
                           //: @"id" : @((2)),
                           @"id" : @((2)),
                           //: @"content" : content,
                           StringFromDefenseLaboratoryData(str_textClientValue) : content,
                           //: };
                           };
    //: NSData *data = [NSJSONSerialization dataWithJSONObject:dict
    NSData *data = [NSJSONSerialization dataWithJSONObject:dict
                                                   //: options:0
                                                   options:0
                                                     //: error:nil];
                                                     error:nil];
    //: NSString *json = [[NSString alloc] initWithData:data
    NSString *json = [[NSString alloc] initWithData:data
                                              //: encoding:NSUTF8StringEncoding];
                                              encoding:NSUTF8StringEncoding];

    //: NIMCustomSystemNotification *notification = [[NIMCustomSystemNotification alloc] initWithContent:json];
    NIMCustomSystemNotification *notification = [[NIMCustomSystemNotification alloc] initWithContent:json];
    //: notification.apnsContent = content;
    notification.apnsContent = content;
    //: notification.sendToOnlineUsersOnly = NO;
    notification.sendToOnlineUsersOnly = NO;
    //: notification.env = [[NTESBundleSetting sharedConfig] messageEnv];
    notification.env = [[NameLine restoreTing] threadEnv];
    //: NIMCustomSystemNotificationSetting *setting = [[NIMCustomSystemNotificationSetting alloc] init];
    NIMCustomSystemNotificationSetting *setting = [[NIMCustomSystemNotificationSetting alloc] init];
    //: setting.apnsEnabled = NO;
    setting.apnsEnabled = NO;
    //: notification.setting = setting;
    notification.setting = setting;
    //: [[[NIMSDK sharedSDK] systemNotificationManager] sendCustomNotification:notification
    [[[NIMSDK sharedSDK] systemNotificationManager] sendCustomNotification:notification
                                                                 //: toSession:session
                                                                 toSession:session
                                                                //: completion:nil];
                                                                completion:nil];
}


//: - (void)sendTypingState:(NIMSession *)session
- (void)withTitle:(NIMSession *)session
{
    //: NSString *currentAccount = [[[NIMSDK sharedSDK] loginManager] currentAccount];
    NSString *currentAccount = [[[NIMSDK sharedSDK] loginManager] currentAccount];
    //: if (session.sessionType != NIMSessionTypeP2P ||
    if (session.sessionType != NIMSessionTypeP2P ||
        //: [session.sessionId isEqualToString:currentAccount])
        [session.sessionId isEqualToString:currentAccount])
    {
        //: return;
        return;
    }

    //: NSDate *now = [NSDate date];
    NSDate *now = [NSDate date];
    //: if (_lastTime == nil ||
    if (_lastTime == nil ||
        //: [now timeIntervalSinceDate:_lastTime] > 3)
        [now timeIntervalSinceDate:_lastTime] > 3)
    {
        //: _lastTime = now;
        _lastTime = now;

        //: NSDictionary *dict = @{@"id" : @((1))};
        NSDictionary *dict = @{@"id" : @((1))};
        //: NSData *data = [NSJSONSerialization dataWithJSONObject:dict
        NSData *data = [NSJSONSerialization dataWithJSONObject:dict
                                                       //: options:0
                                                       options:0
                                                         //: error:nil];
                                                         error:nil];
        //: NSString *content = [[NSString alloc] initWithData:data
        NSString *content = [[NSString alloc] initWithData:data
                                                  //: encoding:NSUTF8StringEncoding];
                                                  encoding:NSUTF8StringEncoding];

        //: NIMCustomSystemNotification *notification = [[NIMCustomSystemNotification alloc] initWithContent:content];
        NIMCustomSystemNotification *notification = [[NIMCustomSystemNotification alloc] initWithContent:content];
        //: notification.sendToOnlineUsersOnly = YES;
        notification.sendToOnlineUsersOnly = YES;
        //: notification.env = [[NTESBundleSetting sharedConfig] messageEnv];
        notification.env = [[NameLine restoreTing] threadEnv];
        //: NIMCustomSystemNotificationSetting *setting = [[NIMCustomSystemNotificationSetting alloc] init];
        NIMCustomSystemNotificationSetting *setting = [[NIMCustomSystemNotificationSetting alloc] init];
        //: setting.apnsEnabled = NO;
        setting.apnsEnabled = NO;
        //: notification.setting = setting;
        notification.setting = setting;
        //: [[[NIMSDK sharedSDK] systemNotificationManager] sendCustomNotification:notification
        [[[NIMSDK sharedSDK] systemNotificationManager] sendCustomNotification:notification
                                                                     //: toSession:session
                                                                     toSession:session
                                                                    //: completion:nil];
                                                                    completion:nil];
    }

}


//: - (void)sendCallNotification:(NIMTeam *)team
- (void)exhibitMembers:(NIMTeam *)team
                    //: roomName:(NSString *)roomName
                    textNickname:(NSString *)roomName
                     //: members:(NSArray *)members
                     displace:(NSArray *)members
{
    //: if (!team || !team.teamId || !members) {
    if (!team || !team.teamId || !members) {
        //: return;
        return;
    }

    //: NSString *teamId = team.teamId;
    NSString *teamId = team.teamId;
    //: NIMKitTeamType teamType = NIMKitTeamTypeNomal;
    NIMKitTeamType teamType = NIMKitTeamTypeNomal;
    //: if (team.type == NIMTeamTypeSuper) {
    if (team.type == NIMTeamTypeSuper) {
        //: teamType = NIMKitTeamTypeSuper;
        teamType = NIMKitTeamTypeSuper;
    }
    //: NSDictionary *dict = @{
    NSDictionary *dict = @{
                           //: @"id" : @((3)),
                           @"id" : @((3)),
                           //: @"members" : members,
                           StringFromDefenseLaboratoryData(str_clientTitleValue) : members,
                           //: @"teamId" : teamId,
                           StringFromDefenseLaboratoryData(str_schemeKeyValue) : teamId,
                           //: @"teamName" : team.teamName? team.teamName : @"群组".ntes_localized,
                           StringFromDefenseLaboratoryData(str_questionText) : team.teamName? team.teamName : @"群组".language,
                           //: @"room" : roomName,
                           StringFromDefenseLaboratoryData(str_needChangeValue) : roomName,
                           //: @"teamType" : @(teamType)
                           StringFromDefenseLaboratoryData(str_viewCellValue) : @(teamType)
                          //: };
                          };
    //: NSData *data = [NSJSONSerialization dataWithJSONObject:dict
    NSData *data = [NSJSONSerialization dataWithJSONObject:dict
                                                   //: options:0
                                                   options:0
                                                     //: error:nil];
                                                     error:nil];
    //: NSString *content = [[NSString alloc] initWithData:data
    NSString *content = [[NSString alloc] initWithData:data
                                           //: encoding:NSUTF8StringEncoding];
                                           encoding:NSUTF8StringEncoding];
    //: NIMCustomSystemNotification *notification = [[NIMCustomSystemNotification alloc] initWithContent:content];
    NIMCustomSystemNotification *notification = [[NIMCustomSystemNotification alloc] initWithContent:content];
    //: notification.sendToOnlineUsersOnly = NO;
    notification.sendToOnlineUsersOnly = NO;
    //: notification.env = [[NTESBundleSetting sharedConfig] messageEnv];
    notification.env = [[NameLine restoreTing] threadEnv];
    //: BBBKitInfoFetchOption *option = [[BBBKitInfoFetchOption alloc] init];
    TitleOption *option = [[TitleOption alloc] init];
    //: option.session = [NIMSession session:teamId type:NIMSessionTypeTeam];
    option.session = [NIMSession session:teamId type:NIMSessionTypeTeam];
    //: CCCKitInfo *me = [[AppleProjectKit sharedKit] infoByUser:[NIMSDK sharedSDK].loginManager.currentAccount option:option];
    TitleInfo *me = [[Indicator reach] indoors:[NIMSDK sharedSDK].loginManager.currentAccount harvest:option];

    //: notification.apnsContent = [NSString stringWithFormat:@"%@%@",me.showName,@"正在呼叫您".ntes_localized];
    notification.apnsContent = [NSString stringWithFormat:@"%@%@",me.showName,StringFromDefenseLaboratoryData(str_shouldInfoValue).language];
    //: NIMCustomSystemNotificationSetting *setting = [[NIMCustomSystemNotificationSetting alloc] init];
    NIMCustomSystemNotificationSetting *setting = [[NIMCustomSystemNotificationSetting alloc] init];
    //: setting.apnsEnabled = NO;
    setting.apnsEnabled = NO;
    //: notification.setting = setting;
    notification.setting = setting;


    //: for (NSString *userId in members) {
    for (NSString *userId in members) {
        //: if ([userId isEqualToString:[NIMSDK sharedSDK].loginManager.currentAccount])
        if ([userId isEqualToString:[NIMSDK sharedSDK].loginManager.currentAccount])
        {
            //: continue;
            continue;
        }
        //: NIMSession *session = [NIMSession session:userId type:NIMSessionTypeP2P];
        NIMSession *session = [NIMSession session:userId type:NIMSessionTypeP2P];
        //: [[NIMSDK sharedSDK].systemNotificationManager sendCustomNotification:notification toSession:session completion:nil];
        [[NIMSDK sharedSDK].systemNotificationManager sendCustomNotification:notification toSession:session completion:nil];
    }

}




//: @end
@end

Byte * DefenseLaboratoryDataToCache(Byte *data) {
    int pointBy = data[0];
    int progressWith = data[1];
    Byte iconQuestion = data[2];
    int lengthImage = data[3];
    if (!pointBy) return data + lengthImage;
    for (int i = lengthImage; i < lengthImage + progressWith; i++) {
        int value = data[i] - iconQuestion;
        if (value < 0) {
            value += 256;
        }
        data[i] = value;
    }
    data[0] = 0;
    data[lengthImage + progressWith] = 0;
    return data + lengthImage;
}

NSString *StringFromDefenseLaboratoryData(Byte *data) {
    return [NSString stringWithUTF8String:(char *)DefenseLaboratoryDataToCache(data)];
}
