
#import <Foundation/Foundation.h>

NSString *StringFromBetData(Byte *data);


//: info must be fired in main thread
Byte str_signatureText[] = {19, 33, 7, 79, 58, 45, 120, 100, 97, 101, 114, 104, 116, 32, 110, 105, 97, 109, 32, 110, 105, 32, 100, 101, 114, 105, 102, 32, 101, 98, 32, 116, 115, 117, 109, 32, 111, 102, 110, 105, 249};

// __DEBUG__
// __CLOSE_PRINT__
//
//  ContainerName.m
// Indicator
//
//  Created by chris on 16/6/13.
//  Copyright © 2016年 NetEase. All rights reserved.
//

// __M_A_C_R_O__
//: #import "BBBKitNotificationFirer.h"
#import "ContainerName.h"

//: NSString *const NIMKitUserInfoHasUpdatedNotification = @"NIMKitUserInfoHasUpdatedNotification";
NSString *const k_pointName = @"NIMKitUserInfoHasUpdatedNotification";
//: NSString *const NIMKitTeamInfoHasUpdatedNotification = @"NIMKitTeamInfoHasUpdatedNotification";
NSString *const k_keyFlexibleText = @"NIMKitTeamInfoHasUpdatedNotification";

//: NSString *const NIMKitUserBlackListHasUpdatedNotification = @"NIMKitUserBlackListHasUpdatedNotification";
NSString *const k_errorName = @"NIMKitUserBlackListHasUpdatedNotification";
//: NSString *const NIMKitUserMuteListHasUpdatedNotification = @"NIMKitUserMuteListHasUpdatedNotification";
NSString *const k_bubbleText = @"NIMKitUserMuteListHasUpdatedNotification";

//: NSString *const NIMKitTeamMembersHasUpdatedNotification = @"NIMKitTeamMembersHasUpdatedNotification";
NSString *const k_quickName = @"NIMKitTeamMembersHasUpdatedNotification";

//: NSString *const CCCKitInfoKey = @"InfoId";
NSString *const k_mainData = @"InfoId";

//: @implementation BBBKitNotificationFirer
@implementation ContainerName

//: - (instancetype)init{
- (instancetype)init{
    //: self = [super init];
    self = [super init];
    //: if (self) {
    if (self) {
        //: _timer = [[AAAKitTimerHolder alloc] init];
        _timer = [[ToiletKitHolder alloc] init];
        //: _timeInterval = 1.0f;
        _timeInterval = 1.0f;
        //: _cachedInfo = [[NSMutableDictionary alloc] init];
        _cachedInfo = [[NSMutableDictionary alloc] init];
    }
    //: return self;
    return self;
}

//: - (void)addFireInfo:(NIMKitFirerInfo *)info{
- (void)info:(TotalernationalityText *)info{
    //: NSAssert([NSThread currentThread].isMainThread, @"info must be fired in main thread");
    NSAssert([NSThread currentThread].isMainThread, StringFromBetData(str_signatureText));
    //: if (!self.cachedInfo.count) {
    if (!self.cachedInfo.count) {
        //: [self.timer startTimer:self.timeInterval delegate:self repeats:NO];
        [self.timer at:self.timeInterval streetSmart:self prompt:NO];
    }
    //: [self.cachedInfo setObject:info forKey:info.saveIdentity];
    [self.cachedInfo setObject:info forKey:info.identityLoad];
}

//: #pragma mark - AAAKitTimerHolderDelegate
#pragma mark - HolderAddDelegate

//: - (void)onNIMKitTimerFired:(AAAKitTimerHolder *)holder{
- (void)ranged:(ToiletKitHolder *)holder{
    //: NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    //: for (NIMKitFirerInfo *info in self.cachedInfo.allValues) {
    for (TotalernationalityText *info in self.cachedInfo.allValues) {
        //: NSMutableArray *fireInfos = dict[info.notificationName];
        NSMutableArray *fireInfos = dict[info.notificationName];
        //: if (!fireInfos) {
        if (!fireInfos) {
            //: fireInfos = [[NSMutableArray alloc] init];
            fireInfos = [[NSMutableArray alloc] init];
            //: dict[info.notificationName] = fireInfos;
            dict[info.notificationName] = fireInfos;
        }
        //: if (info.fireObject) {
        if (info.replySuccess) {
            //: [fireInfos addObject:info.fireObject];
            [fireInfos addObject:info.replySuccess];
        }
    }

    //: for (NSString *notificationName in dict) {
    for (NSString *notificationName in dict) {
        //: NSDictionary *userInfo = dict[notificationName]? @{ CCCKitInfoKey:dict[notificationName] } : nil;
        NSDictionary *userInfo = dict[notificationName]? @{ k_mainData:dict[notificationName] } : nil;
        //: [[NSNotificationCenter defaultCenter] postNotificationName:notificationName object:nil userInfo:userInfo];
        [[NSNotificationCenter defaultCenter] postNotificationName:notificationName object:nil userInfo:userInfo];
    }

    //: [self.cachedInfo removeAllObjects];
    [self.cachedInfo removeAllObjects];
}


//: @end
@end


//: @implementation NIMKitFirerInfo
@implementation TotalernationalityText

//: - (NSObject *)fireObject
- (NSObject *)replySuccess
{
    //: if (self.session) {
    if (self.session) {
        //: return self.session.sessionId;
        return self.session.sessionId;
    }
    //: return [NSNull null];
    return [NSNull null];
}

//: - (NSString *)saveIdentity
- (NSString *)identityLoad
{
    //: if (self.session) {
    if (self.session) {
        //: return [NSString stringWithFormat:@"%@-%zd",self.session.sessionId,self.session.sessionType];;
        return [NSString stringWithFormat:@"%@-%zd",self.session.sessionId,self.session.sessionType];;
    }
    //: return self.notificationName;
    return self.notificationName;
}

//: @end
@end

Byte * BetDataToCache(Byte *data) {
    int pile = data[0];
    int day = data[1];
    int enterpriseImpose = data[2];
    if (!pile) return data + enterpriseImpose;
    for (int i = 0; i < day / 2; i++) {
        int begin = enterpriseImpose + i;
        int end = enterpriseImpose + day - i - 1;
        Byte temp = data[begin];
        data[begin] = data[end];
        data[end] = temp;
    }
    data[0] = 0;
    data[enterpriseImpose + day] = 0;
    return data + enterpriseImpose;
}

NSString *StringFromBetData(Byte *data) {
    return [NSString stringWithUTF8String:(char *)BetDataToCache(data)];
}  
