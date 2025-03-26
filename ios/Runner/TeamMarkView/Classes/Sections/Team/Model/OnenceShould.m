// __DEBUG__
// __CLOSE_PRINT__
//
//  NTESCardMemberItem.m
//  NIM
//
//  Created by chris on 15/3/5.
//  Copyright (c) 2015年 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import "BBBTeamCardMemberItem.h"
#import "OnenceShould.h"
//: #import "AAAKitUtil.h"
#import "TypicalCenter.h"
//: #import "AppleProjectKit.h"
#import "Indicator.h"

//: @interface NIMCardMemberItem ()
@interface MessageItem ()

//: @end
@end

//: @implementation NIMCardMemberItem
@implementation MessageItem

- (NSString *)teamId {
    //: return nil;
    return nil;
}

- (NSString *)userId {
    //: return _userId;
    return _userId;
}

- (NIMTeamMemberType)userType {
    //: return NIMTeamMemberTypeNormal;
    return NIMTeamMemberTypeNormal;
}

- (void)setUserType:(NIMTeamMemberType)userType {}

- (NIMTeamType)teamType {
    //: return NIMTeamTypeNormal;
    return NIMTeamTypeNormal;
}

- (UIImage *)imageNormal{
    //: CCCKitInfo *info = [[AppleProjectKit sharedKit] infoByUser:self.userId option:nil];
    TitleInfo *info = [[Indicator reach] indoors:self.userId harvest:nil];
    //: return info.avatarImage;
    return info.avatarImage;
}

- (NSString *)title {
    //: NIMSession *session = [NIMSession session:self.userId type:NIMSessionTypeP2P];
    NIMSession *session = [NIMSession session:self.userId type:NIMSessionTypeP2P];
    //: return [AAAKitUtil showNick:self.userId inSession:session];
    return [TypicalCenter exhibit:self.userId withWill:session];
}

- (NSString *)imageUrl{
    //: return [[AppleProjectKit sharedKit] infoByUser:self.userId option:nil].avatarUrlString;
    return [[Indicator reach] indoors:self.userId harvest:nil].avatarUrlString;
}

- (NSString *)inviterAccid {
    //: return nil;
    return nil;
}

- (BOOL)isMuted {
    //: return NO;
    return NO;
}

- (BOOL)isMyUserId {
    //: return [self.userId isEqualToString:[NIMSDK sharedSDK].loginManager.currentAccount];
    return [self.userId isEqualToString:[NIMSDK sharedSDK].loginManager.currentAccount];
}

//: @end
@end

//: @interface BBBTeamCardMemberItem ()
@interface OnenceShould ()

//: @property (nonatomic, strong) NIMTeamMember *member;
@property (nonatomic, strong) NIMTeamMember *member;

//: @property (nonatomic, assign) NIMTeamType teamType;
@property (nonatomic, assign) NIMTeamType teamType;

//: @end
@end

//: @implementation BBBTeamCardMemberItem
@implementation OnenceShould

//: - (instancetype)init {
- (instancetype)init {
    //: if (self = [super init]) {
    if (self = [super init]) {
        //: _opeator = CardHeaderOpeatorNone;
        _opeator = CardHeaderOpeatorNone;
    }
    //: return self;
    return self;
}

//: - (instancetype)initWithMember:(NIMTeamMember *)member
- (instancetype)initWithAppearTing:(NIMTeamMember *)member
                      //: teamType:(NIMTeamType)teamType {
                      voiceClickSelect:(NIMTeamType)teamType {
    //: if (self = [super init]) {
    if (self = [super init]) {
        //: _member = member;
        _member = member;
        //: _teamType = teamType;
        _teamType = teamType;
        //: _userId = member.userId;
        _userId = member.userId;
        //: _opeator = CardHeaderOpeatorNone;
        _opeator = CardHeaderOpeatorNone;
    }
    //: return self;
    return self;
}

//: - (NSUInteger)hash {
- (NSUInteger)hash {
    //: return [self.userId hash];
    return [self.userId hash];
}

//: - (BOOL)isEqual:(id)object{
- (BOOL)isEqual:(id)object{
    //: if (![object isKindOfClass:[BBBTeamCardMemberItem class]]) {
    if (![object isKindOfClass:[OnenceShould class]]) {
        //: return NO;
        return NO;
    }
    //: BBBTeamCardMemberItem *obj = (BBBTeamCardMemberItem*)object;
    OnenceShould *obj = (OnenceShould*)object;
    //: return [obj.userId isEqual:self.userId];
    return [obj.userId isEqual:self.userId];
}

//: #pragma mark - <NIMKitCardHeaderData>
#pragma mark - <WithChild>
- (NSString *)teamId {
    //: return _member.teamId;
    return _member.teamId;
}

- (NSString *)userId {
    //: if (_member) {
    if (_member) {
        //: return _member.userId;
        return _member.userId;
    //: } else {
    } else {
        //: return _userId;
        return _userId;
    }
}

- (NIMTeamMemberType)userType {
    //: return _member.type;
    return _member.type;
}

- (void)setUserType:(NIMTeamMemberType)userType {
    //: _member.type = userType;
    _member.type = userType;
}

- (NIMTeamType)teamType {
    //: return _teamType;
    return _teamType;
}

- (UIImage *)imageNormal{
    //: CCCKitInfo *info = [[AppleProjectKit sharedKit] infoByUser:self.userId option:nil];
    TitleInfo *info = [[Indicator reach] indoors:self.userId harvest:nil];
    //: return info.avatarImage;
    return info.avatarImage;
}

- (NSString *)title {
    //: NIMSession *session = nil;
    NIMSession *session = nil;
    //: if (!self.member) {
    if (!self.member) {
        //: session = [NIMSession session:self.userId type:NIMSessionTypeP2P];
        session = [NIMSession session:self.userId type:NIMSessionTypeP2P];
    //: } else {
    } else {
        //: if (self.teamType == NIMTeamTypeSuper) {
        if (self.teamType == NIMTeamTypeSuper) {
            //: session = [NIMSession session:self.teamId type:NIMSessionTypeSuperTeam];
            session = [NIMSession session:self.teamId type:NIMSessionTypeSuperTeam];
        //: } else {
        } else {
            //: session = [NIMSession session:self.teamId type:NIMSessionTypeTeam];
            session = [NIMSession session:self.teamId type:NIMSessionTypeTeam];
        }
    }
    //: return [AAAKitUtil showNick:self.userId inSession:session];
    return [TypicalCenter exhibit:self.userId withWill:session];
}

- (NSString *)imageUrl{
    //: return [[AppleProjectKit sharedKit] infoByUser:self.userId option:nil].avatarUrlString;
    return [[Indicator reach] indoors:self.userId harvest:nil].avatarUrlString;
}

- (NSString *)inviterAccid {
    //: return _member.inviterAccid;
    return _member.inviterAccid;
}

- (BOOL)isMuted {
    //: return _member.isMuted;
    return _member.isMuted;
}

- (BOOL)isMyUserId {
    //: return [self.userId isEqualToString:[NIMSDK sharedSDK].loginManager.currentAccount];
    return [self.userId isEqualToString:[NIMSDK sharedSDK].loginManager.currentAccount];
}

//: @end
@end
