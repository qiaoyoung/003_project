
#import <Foundation/Foundation.h>

NSString *StringFromConsumeData(Byte *data);        


//: 选择联系人
Byte str_powderName[] = {56, 15, 28, 13, 187, 59, 117, 24, 17, 217, 78, 194, 41, 205, 100, 109, 202, 111, 141, 204, 101, 120, 203, 151, 159, 200, 158, 158, 19};


//: 选择超限
Byte str_ruleData[] = {38, 12, 70, 14, 32, 38, 51, 145, 156, 47, 233, 73, 244, 7, 163, 58, 67, 160, 69, 99, 162, 112, 63, 163, 83, 74, 171};


//: 选择群组
Byte str_entireValue[] = {21, 12, 51, 7, 234, 23, 121, 182, 77, 86, 179, 88, 118, 180, 139, 113, 180, 136, 81, 244};

// __DEBUG__
// __CLOSE_PRINT__
//
//  ShowHide.m
// Indicator
//
//  Created by chris on 15/9/14.
//  Copyright (c) 2015年 NetEase. All rights reserved.
//

// __M_A_C_R_O__
//: #import "AAAContactSelectConfig.h"
#import "ShowHide.h"
//: #import <NIMSDK/NIMSDK.h>
#import <NIMSDK/NIMSDK.h>
//: #import "CCCGlobalMacro.h"
#import "CCCGlobalMacro.h"
//: #import "AAAAppleProjectGroupedData.h"
#import "NameChecked.h"
//: #import "AppleProjectKit.h"
#import "Indicator.h"
//: #import "BBBKitInfoFetchOption.h"
#import "TitleOption.h"
//: #import "CCCKitInfo.h"
#import "TitleInfo.h"

//: @implementation NIMContactFriendSelectConfig : NSObject
@implementation ChildTeam : NSObject

//: - (BOOL)isMutiSelected{
- (BOOL)menu{
    //: return self.needMutiSelected;
    return self.needMutiSelected;
}

//: - (NSString *)title{
- (NSString *)media{
    //: return @"选择联系人".nim_localized;
    return StringFromConsumeData(str_powderName).trapLocalized;
}

//: - (NSInteger)maxSelectedNum{
- (NSInteger)centerHeight{
    //: if (self.needMutiSelected) {
    if (self.needMutiSelected) {
        //: return self.maxSelectMemberCount? self.maxSelectMemberCount : 9223372036854775807L;
        return self.maxSelectMemberCount? self.maxSelectMemberCount : 9223372036854775807L;
    //: }else{
    }else{
        //: return 1;
        return 1;
    }
}

//: - (NSString *)selectedOverFlowTip{
- (NSString *)oozeEliteOverTip{
    //: return @"选择超限".nim_localized;
    return StringFromConsumeData(str_ruleData).trapLocalized;
}

//: - (void)getContactData:(NIMContactDataProviderHandler)handler {
- (void)eyeglasses:(NIMContactDataProviderHandler)handler {
    //: AAAAppleProjectGroupedData *groupedData = [[AAAAppleProjectGroupedData alloc] init];
    NameChecked *groupedData = [[NameChecked alloc] init];
    //: NSMutableArray *myFriendArray = @[].mutableCopy;
    NSMutableArray *myFriendArray = @[].mutableCopy;
    //: NSMutableArray *data = [NIMSDK sharedSDK].userManager.myFriends.mutableCopy;
    NSMutableArray *data = [NIMSDK sharedSDK].userManager.myFriends.mutableCopy;
    //: NSMutableArray *members = @[].mutableCopy;
    NSMutableArray *members = @[].mutableCopy;

    //: for (NIMUser *user in data) {
    for (NIMUser *user in data) {
        //: [myFriendArray addObject:user.userId];
        [myFriendArray addObject:user.userId];
    }
    //: NSArray *friend_uids = [self filterData:myFriendArray];
    NSArray *friend_uids = [self component:myFriendArray];
    //: for (NSString *uid in friend_uids) {
    for (NSString *uid in friend_uids) {
        //: NIMGroupUser *user = [[NIMGroupUser alloc] initWithUserId:uid];
        NameUser *user = [[NameUser alloc] initWithAnLineId:uid];
        //: [members addObject:user];
        [members addObject:user];
    }
    //: groupedData.members = members;
    groupedData.members = members;
    //: if (members) {
    if (members) {
        //: [members removeAllObjects];
        [members removeAllObjects];
    }
    //: if (handler) {
    if (handler) {
        //: handler(groupedData.contentDic, groupedData.sectionTitles);
        handler(groupedData.contentDic, groupedData.sectionTitles);
    }
}

//: - (NSArray *)filterData:(NSMutableArray *)data{
- (NSArray *)component:(NSMutableArray *)data{
    //: if (data) {
    if (data) {
        //: if ([self respondsToSelector:@selector(filterIds)]) {
        if ([self respondsToSelector:@selector(valueTitle)]) {
            //: NSArray *ids = [self filterIds];
            NSArray *ids = [self filterIds];
            //: [data removeObjectsInArray:ids];
            [data removeObjectsInArray:ids];
        }
        //: return data;
        return data;
    }
    //: return nil;
    return nil;
}

//: - (CCCKitInfo *)getInfoById:(NSString *)selectedId {
- (TitleInfo *)bottom:(NSString *)selectedId {
    //: CCCKitInfo *info = nil;
    TitleInfo *info = nil;
    //: info = [[AppleProjectKit sharedKit] infoByUser:selectedId option:nil];
    info = [[Indicator reach] indoors:selectedId harvest:nil];
    //: return info;
    return info;
}

//: @end
@end

//: @implementation NIMContactTeamMemberSelectConfig : NSObject
@implementation MessageChild : NSObject

//: - (NSInteger)maxSelectedNum{
- (NSInteger)centerHeight{
    //: if (self.needMutiSelected) {
    if (self.needMutiSelected) {
        //: return self.maxSelectMemberCount? self.maxSelectMemberCount : 9223372036854775807L;
        return self.maxSelectMemberCount? self.maxSelectMemberCount : 9223372036854775807L;
    //: }else{
    }else{
        //: return 1;
        return 1;
    }
}

//: - (NSString *)title{
- (NSString *)media{
    //: return @"选择联系人".nim_localized;
    return StringFromConsumeData(str_powderName).trapLocalized;
}

//: - (NSString *)selectedOverFlowTip{
- (NSString *)oozeEliteOverTip{
    //: return @"选择超限".nim_localized;
    return StringFromConsumeData(str_ruleData).trapLocalized;
}

//: - (void)getTeamContactDataWithTeamId:(NSString *)teamID
- (void)shouldHandler:(NSString *)teamID
                            //: teamType:(NIMKitTeamType)teamType
                            typical:(NIMKitTeamType)teamType
                            //: handler:(NIMContactDataProviderHandler)handler {
                            isHandler:(NIMContactDataProviderHandler)handler {
    //: __weak __typeof(&*self) weakSelf = self;;
    __weak __typeof(&*self) weakSelf = self;;
    //: NSMutableArray <NSString *>*uids = [NSMutableArray array];
    NSMutableArray <NSString *>*uids = [NSMutableArray array];
    //: if (teamType == NIMKitTeamTypeNomal) { 
    if (teamType == NIMKitTeamTypeNomal) { //普通群组
        //: [[NIMSDK sharedSDK].teamManager fetchTeamMembers:teamID
        [[NIMSDK sharedSDK].teamManager fetchTeamMembers:teamID
                                              //: completion:^(NSError * _Nullable error, NSArray<NIMTeamMember *> * _Nullable members) {
                                              completion:^(NSError * _Nullable error, NSArray<NIMTeamMember *> * _Nullable members) {
            //: if (!error) {
            if (!error) {
                //: for (NIMTeamMember *member in members) {
                for (NIMTeamMember *member in members) {
                    //: if (member.userId) {
                    if (member.userId) {
                        //: [uids addObject:member.userId];
                        [uids addObject:member.userId];
                    }
                }
                //: [weakSelf didProcessTeamId:teamID
                [weakSelf tagTo:teamID
                                      //: uids:uids
                                      easing:uids
                                   //: handler:handler];
                                   circumferenceHandler:handler];
            }
        //: }];
        }];
    //: } else if (teamType == NIMKitTeamTypeSuper) { 
    } else if (teamType == NIMKitTeamTypeSuper) { //超大群组
        //: NIMTeamFetchMemberOption *option = [[NIMTeamFetchMemberOption alloc] init];
        NIMTeamFetchMemberOption *option = [[NIMTeamFetchMemberOption alloc] init];
        //: [[NIMSDK sharedSDK].superTeamManager fetchTeamMembers:teamID option:option completion:^(NSError * _Nullable error, NSArray<NIMTeamMember *> * _Nullable members) {
        [[NIMSDK sharedSDK].superTeamManager fetchTeamMembers:teamID option:option completion:^(NSError * _Nullable error, NSArray<NIMTeamMember *> * _Nullable members) {
            //: if (!error) {
            if (!error) {
                //: for (NIMTeamMember *member in members) {
                for (NIMTeamMember *member in members) {
                    //: if (member.userId) {
                    if (member.userId) {
                        //: [uids addObject:member.userId];
                        [uids addObject:member.userId];
                    }
                }
                //: [weakSelf didProcessTeamId:teamID
                [weakSelf tagTo:teamID
                                      //: uids:uids
                                      easing:uids
                                   //: handler:handler];
                                   circumferenceHandler:handler];
            }
        //: }];
        }];
    //: } else {
    } else {
        //: if (handler) {
        if (handler) {
            //: handler(nil, nil);
            handler(nil, nil);
        }
    }
}

//: - (void)didProcessTeamId:(NSString *)teamId
- (void)tagTo:(NSString *)teamId
                    //: uids:(NSMutableArray *)uids
                    easing:(NSMutableArray *)uids
                 //: handler:(NIMContactDataProviderHandler)handler {
                 circumferenceHandler:(NIMContactDataProviderHandler)handler {
    //: AAAAppleProjectGroupedData *groupedData = [[AAAAppleProjectGroupedData alloc] init];
    NameChecked *groupedData = [[NameChecked alloc] init];
    //: NSMutableArray *membersArr = @[].mutableCopy;
    NSMutableArray *membersArr = @[].mutableCopy;
    //: NSArray *member_uids = [self filterData:uids];
    NSArray *member_uids = [self needMode:uids];
    //: for (NSString *uid in member_uids) {
    for (NSString *uid in member_uids) {
        //: NIMGroupTeamMember *user = [[NIMGroupTeamMember alloc] initWithUserId:uid
        WithFlush *user = [[WithFlush alloc] initWithCover:uid
                                                                       //: session:_session];
                                                                       reply:_session];
        //: [membersArr addObject:user];
        [membersArr addObject:user];
    }
    //: groupedData.members = membersArr;
    groupedData.members = membersArr;
    //: if (membersArr) {
    if (membersArr) {
        //: [membersArr removeAllObjects];
        [membersArr removeAllObjects];
    }
    //: if (handler) {
    if (handler) {
        //: handler(groupedData.contentDic, groupedData.sectionTitles);
        handler(groupedData.contentDic, groupedData.sectionTitles);
    }
}

//: - (void)getContactData:(NIMContactDataProviderHandler)handler {
- (void)eyeglasses:(NIMContactDataProviderHandler)handler {
    //: [self getTeamContactDataWithTeamId:_teamId
    [self shouldHandler:_teamId
                              //: teamType:_teamType
                              typical:_teamType
                               //: handler:handler];
                               isHandler:handler];
}

//: - (NSArray *)filterData:(NSMutableArray *)data{
- (NSArray *)needMode:(NSMutableArray *)data{
    //: if (data) {
    if (data) {
        //: if ([self respondsToSelector:@selector(filterIds)]) {
        if ([self respondsToSelector:@selector(valueTitle)]) {
            //: NSArray *ids = [self filterIds];
            NSArray *ids = [self filterIds];
            //: [data removeObjectsInArray:ids];
            [data removeObjectsInArray:ids];
        }
        //: return data;
        return data;
    }
    //: return nil;
    return nil;
}

//: - (CCCKitInfo *)getInfoById:(NSString *)selectedId {
- (TitleInfo *)bottom:(NSString *)selectedId {
    //: CCCKitInfo *info = nil;
    TitleInfo *info = nil;
    //: BBBKitInfoFetchOption *option = [[BBBKitInfoFetchOption alloc] init];
    TitleOption *option = [[TitleOption alloc] init];
    //: option.session = _session;
    option.session = _session;
    //: info = [[AppleProjectKit sharedKit] infoByUser:selectedId option:option];
    info = [[Indicator reach] indoors:selectedId harvest:option];
    //: return info;
    return info;
}

//: @end
@end

//: @implementation NIMContactTeamSelectConfig : NSObject
@implementation AddHide : NSObject

//: - (NSString *)title{
- (NSString *)media{
    //: return @"选择群组".nim_localized;
    return StringFromConsumeData(str_entireValue).trapLocalized;
}

//: - (NSInteger)maxSelectedNum{
- (NSInteger)centerHeight{
    //: if (self.needMutiSelected) {
    if (self.needMutiSelected) {
        //: return self.maxSelectMemberCount? self.maxSelectMemberCount : 9223372036854775807L;
        return self.maxSelectMemberCount? self.maxSelectMemberCount : 9223372036854775807L;
    //: }else{
    }else{
        //: return 1;
        return 1;
    }
}

//: - (NSString *)selectedOverFlowTip{
- (NSString *)oozeEliteOverTip{
    //: return @"选择超限".nim_localized;
    return StringFromConsumeData(str_ruleData).trapLocalized;
}

//: - (NSArray *)getTeamIdsWithTeamType:(NIMKitTeamType)teamType {
- (NSArray *)titleOf:(NIMKitTeamType)teamType {
    //: NSMutableArray *uids = [NSMutableArray array];
    NSMutableArray *uids = [NSMutableArray array];
    //: NSMutableArray *team_data = nil;
    NSMutableArray *team_data = nil;
    //: if (teamType == NIMKitTeamTypeNomal) {
    if (teamType == NIMKitTeamTypeNomal) {
        //: team_data = [[NIMSDK sharedSDK].teamManager.allMyTeams mutableCopy];
        team_data = [[NIMSDK sharedSDK].teamManager.allMyTeams mutableCopy];
    //: } else if (teamType == NIMKitTeamTypeSuper) {
    } else if (teamType == NIMKitTeamTypeSuper) {
        //: team_data = [[NIMSDK sharedSDK].superTeamManager.allMyTeams mutableCopy];
        team_data = [[NIMSDK sharedSDK].superTeamManager.allMyTeams mutableCopy];
    }

    //: for (NIMTeam *team in team_data) {
    for (NIMTeam *team in team_data) {
        //: if (team.teamId) {
        if (team.teamId) {
            //: [uids addObject:team.teamId];
            [uids addObject:team.teamId];
        }
    }
    //: return [self filterData:uids];
    return [self scale:uids];
}

//: - (void)getContactData:(NIMContactDataProviderHandler)handler {
- (void)eyeglasses:(NIMContactDataProviderHandler)handler {
    //: NSArray *tids = [self getTeamIdsWithTeamType:_teamType];
    NSArray *tids = [self titleOf:_teamType];
    //: if (tids.count == 0) {
    if (tids.count == 0) {
        //: return;
        return;
    }

    //: AAAAppleProjectGroupedData *groupedData = [[AAAAppleProjectGroupedData alloc] init];
    NameChecked *groupedData = [[NameChecked alloc] init];
    //: NSMutableArray <id <NIMGroupMemberProtocol>>*members = @[].mutableCopy;
    NSMutableArray <id <UpProtocol>>*members = @[].mutableCopy;
    //: for (NSString *tid in tids) {
    for (NSString *tid in tids) {
        //: NIMGroupTeam *team = [[NIMGroupTeam alloc] initWithTeamId:tid teamType:_teamType];
        ShowTeam *team = [[ShowTeam alloc] initWithMessage:tid image:_teamType];
        //: [members addObject:team];
        [members addObject:team];
    }
    //: groupedData.members = members;
    groupedData.members = members;
    //: if (members) {
    if (members) {
        //: [members removeAllObjects];
        [members removeAllObjects];
    }
    //: if (handler) {
    if (handler) {
        //: handler(groupedData.contentDic, groupedData.sectionTitles);
        handler(groupedData.contentDic, groupedData.sectionTitles);
    }
}

//: - (NSArray *)filterData:(NSMutableArray *)data{
- (NSArray *)scale:(NSMutableArray *)data{
    //: if (data) {
    if (data) {
        //: if ([self respondsToSelector:@selector(filterIds)]) {
        if ([self respondsToSelector:@selector(valueTitle)]) {
            //: NSArray *ids = [self filterIds];
            NSArray *ids = [self filterIds];
            //: [data removeObjectsInArray:ids];
            [data removeObjectsInArray:ids];
        }
        //: return data;
        return data;
    }
    //: return nil;
    return nil;
}

//: - (CCCKitInfo *)getInfoById:(NSString *)selectedId {
- (TitleInfo *)bottom:(NSString *)selectedId {
    //: CCCKitInfo *info = nil;
    TitleInfo *info = nil;
    //: if (_teamType == NIMKitTeamTypeNomal) {
    if (_teamType == NIMKitTeamTypeNomal) {
        //: info = [[AppleProjectKit sharedKit] infoByTeam:selectedId option:nil];
        info = [[Indicator reach] text:selectedId byLabel:nil];
    //: } else if (_teamType == NIMKitTeamTypeSuper) {
    } else if (_teamType == NIMKitTeamTypeSuper) {
        //: info = [[AppleProjectKit sharedKit] infoBySuperTeam:selectedId option:nil];
        info = [[Indicator reach] noneShowOption:selectedId viewMedia:nil];
    }
    //: return info;
    return info;
}

//: @end
@end

Byte * ConsumeDataToCache(Byte *data) {
    int gin = data[0];
    int encumbrance = data[1];
    Byte eagerIcon = data[2];
    int showThree = data[3];
    if (!gin) return data + showThree;
    for (int i = showThree; i < showThree + encumbrance; i++) {
        int value = data[i] + eagerIcon;
        if (value > 255) {
            value -= 256;
        }
        data[i] = value;
    }
    data[0] = 0;
    data[showThree + encumbrance] = 0;
    return data + showThree;
}

NSString *StringFromConsumeData(Byte *data) {
    return [NSString stringWithUTF8String:(char *)ConsumeDataToCache(data)];
}
