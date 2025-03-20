
#import <Foundation/Foundation.h>

NSString *StringFromFileParadeData(Byte *data);        


//: 未知消息
Byte str_sessionPorkName[] = {22, 12, 77, 10, 78, 9, 43, 96, 39, 169, 153, 79, 93, 154, 82, 88, 153, 105, 59, 153, 52, 98, 95};


//: head_default
Byte str_workingTitle[] = {39, 12, 79, 11, 189, 111, 100, 65, 53, 195, 107, 25, 22, 18, 21, 16, 21, 22, 23, 18, 38, 29, 37, 224};


//: %@: [自定义消息]
Byte str_helpDirtyName[] = {72, 21, 91, 11, 76, 62, 228, 15, 54, 229, 75, 202, 229, 223, 197, 0, 141, 44, 79, 138, 83, 63, 137, 94, 46, 139, 91, 45, 139, 38, 84, 2, 159};


//: invalid type
Byte str_accomplishTitle[] = {82, 12, 83, 11, 230, 169, 123, 48, 141, 28, 226, 22, 27, 35, 14, 25, 22, 17, 205, 33, 38, 29, 18, 141};


//: invalid mode
Byte str_signatureData[] = {68, 12, 1, 8, 112, 48, 97, 137, 104, 109, 117, 96, 107, 104, 99, 31, 108, 110, 99, 100, 245};

// __DEBUG__
// __CLOSE_PRINT__
//
//  MetadataImpl.m
// Indicator
//
//  Created by chris on 2016/10/31.
//  Copyright © 2016年 NetEase. All rights reserved.
//
//: #pragma mark - kit data request
#pragma mark - kit data request

// __M_A_C_R_O__
//: #import <UIKit/UIKit.h>
#import <UIKit/UIKit.h>
//: #import "AppleProjectKit.h"
#import "Indicator.h"
//: #import "CCCKitDataProviderImpl.h"
#import "MetadataImpl.h"
//: #import "BBBKitInfoFetchOption.h"
#import "TitleOption.h"
//: #import "UIImage+AppleProjectKit.h"
#import "UIImage+Indicator.h"
//: #import "NSString+AppleProjectKit.h"
#import "NSString+Indicator.h"

//: @interface NIMKitDataRequest : NSObject
@interface AddName : NSObject

//: @property (nonatomic,strong) NSMutableSet *failedUserIds;
@property (nonatomic,strong) NSMutableSet *failedUserIds;

//: @property (nonatomic,assign) NSInteger maxMergeCount; 
@property (nonatomic,assign) NSInteger maxMergeCount; //最大合并数

//: - (void)requestUserIds:(NSArray *)userIds;
- (void)showSave:(NSArray *)userIds;

//: @end
@end


//: @implementation NIMKitDataRequest{
@implementation AddName{
    //: NSMutableArray *_requstUserIdArray; 
    NSMutableArray *_requstUserIdArray; //待请求池
    //: BOOL _isRequesting;
    BOOL _isRequesting;
}

//: - (instancetype)init{
- (instancetype)init{
    //: self = [super init];
    self = [super init];
    //: if (self) {
    if (self) {
        //: _failedUserIds = [[NSMutableSet alloc] init];
        _failedUserIds = [[NSMutableSet alloc] init];
        //: _requstUserIdArray = [[NSMutableArray alloc] init];
        _requstUserIdArray = [[NSMutableArray alloc] init];
    }
    //: return self;
    return self;
}


//: - (void)requestUserIds:(NSArray *)userIds
- (void)showSave:(NSArray *)userIds
{
    //: for (NSString *userId in userIds)
    for (NSString *userId in userIds)
    {
        //: if (![_requstUserIdArray containsObject:userId] && ![_failedUserIds containsObject:userId])
        if (![_requstUserIdArray containsObject:userId] && ![_failedUserIds containsObject:userId])
        {
            //: [_requstUserIdArray addObject:userId];
            [_requstUserIdArray addObject:userId];
        }
    }
    //: [self request];
    [self forbidColor];
}


//: - (void)request
- (void)forbidColor
{
    //: static NSUInteger MaxBatchReuqestCount = 10;
    static NSUInteger MaxBatchReuqestCount = 10;
    //: if (_isRequesting || [_requstUserIdArray count] == 0) {
    if (_isRequesting || [_requstUserIdArray count] == 0) {
        //: return;
        return;
    }
    //: _isRequesting = YES;
    _isRequesting = YES;
    //: NSArray *userIds = [_requstUserIdArray count] > MaxBatchReuqestCount ?
    NSArray *userIds = [_requstUserIdArray count] > MaxBatchReuqestCount ?
    //: [_requstUserIdArray subarrayWithRange:NSMakeRange(0, MaxBatchReuqestCount)] : [_requstUserIdArray copy];
    [_requstUserIdArray subarrayWithRange:NSMakeRange(0, MaxBatchReuqestCount)] : [_requstUserIdArray copy];

    //: __weak typeof(self) weakSelf = self;
    __weak typeof(self) weakSelf = self;
    //: [[NIMSDK sharedSDK].userManager fetchUserInfos:userIds
    [[NIMSDK sharedSDK].userManager fetchUserInfos:userIds
                                        //: completion:^(NSArray *users, NSError *error) {
                                        completion:^(NSArray *users, NSError *error) {
                                            //: [weakSelf afterReuquest:userIds];
                                            [weakSelf date:userIds];
                                            //: if (!error && users.count)
                                            if (!error && users.count)
                                            {
                                                //: [[AppleProjectKit sharedKit] notfiyUserInfoChanged:userIds];
                                                [[Indicator reach] down:userIds];
                                            }
                                            //: else if ([weakSelf shouldAddToFailedUsers:error])
                                            else if ([weakSelf key:error])
                                            {
                                                //: [weakSelf.failedUserIds addObjectsFromArray:userIds];
                                                [weakSelf.failedUserIds addObjectsFromArray:userIds];
                                            }
                                        //: }];
                                        }];
}

//: - (void)afterReuquest:(NSArray *)userIds
- (void)date:(NSArray *)userIds
{
    //: _isRequesting = NO;
    _isRequesting = NO;
    //: [_requstUserIdArray removeObjectsInArray:userIds];
    [_requstUserIdArray removeObjectsInArray:userIds];
    //: [self request];
    [self forbidColor];

}

//: - (BOOL)shouldAddToFailedUsers:(NSError *)error
- (BOOL)key:(NSError *)error
{
    //没有错误这种异常情况走到这个路径里也不对，不再请求
    //: return error.code != NIMRemoteErrorCodeTimeoutError || !error;
    return error.code != NIMRemoteErrorCodeTimeoutError || !error;
}

//: @end
@end

//: #pragma mark - data provider impl
#pragma mark - data provider impl

//: @interface CCCKitDataProviderImpl()<NIMUserManagerDelegate,
@interface MetadataImpl()<NIMUserManagerDelegate,
                                    //: NIMTeamManagerDelegate,
                                    NIMTeamManagerDelegate,
                                    //: NIMLoginManagerDelegate,
                                    NIMLoginManagerDelegate,
                                    //: NIMTeamManagerDelegate>
                                    NIMTeamManagerDelegate>

//: @property (nonatomic,strong) UIImage *defaultUserAvatar;
@property (nonatomic,strong) UIImage *defaultUserAvatar;

//: @property (nonatomic,strong) UIImage *defaultTeamAvatar;
@property (nonatomic,strong) UIImage *defaultTeamAvatar;

//: @property (nonatomic,strong) NIMKitDataRequest *request;
@property (nonatomic,strong) AddName *request;

//: @end
@end


//: @implementation CCCKitDataProviderImpl
@implementation MetadataImpl

//: - (instancetype)init{
- (instancetype)init{
    //: self = [super init];
    self = [super init];
    //: if (self) {
    if (self) {
        //: _request = [[NIMKitDataRequest alloc] init];
        _request = [[AddName alloc] init];
        //: _request.maxMergeCount = 20;
        _request.maxMergeCount = 20;
        //: [[NIMSDK sharedSDK].userManager addDelegate:self];
        [[NIMSDK sharedSDK].userManager addDelegate:self];
        //: [[NIMSDK sharedSDK].teamManager addDelegate:self];
        [[NIMSDK sharedSDK].teamManager addDelegate:self];
        //: [[NIMSDK sharedSDK].loginManager addDelegate:self];
        [[NIMSDK sharedSDK].loginManager addDelegate:self];
        //: [[NIMSDK sharedSDK].superTeamManager addDelegate:self];
        [[NIMSDK sharedSDK].superTeamManager addDelegate:self];
    }
    //: return self;
    return self;
}

//: - (void)dealloc
- (void)dealloc
{
    //: [[NIMSDK sharedSDK].userManager removeDelegate:self];
    [[NIMSDK sharedSDK].userManager removeDelegate:self];
    //: [[NIMSDK sharedSDK].teamManager removeDelegate:self];
    [[NIMSDK sharedSDK].teamManager removeDelegate:self];
    //: [[NIMSDK sharedSDK].loginManager removeDelegate:self];
    [[NIMSDK sharedSDK].loginManager removeDelegate:self];
}


//: #pragma mark - public api
#pragma mark - public api
//: - (CCCKitInfo *)infoByUser:(NSString *)userId
- (TitleInfo *)indoors:(NSString *)userId
                    //: option:(BBBKitInfoFetchOption *)option
                    harvest:(TitleOption *)option
{
    //: NIMSession *session = option.message.session?:option.session;
    NIMSession *session = option.message.session?:option.session;
    //: CCCKitInfo *info = [self infoByUser:userId session:session option:option];
    TitleInfo *info = [self pressRange:userId key:session textStorage:option];
    //: return info;
    return info;
}

//: - (CCCKitInfo *)infoByTeam:(NSString *)teamId
- (TitleInfo *)text:(NSString *)teamId
                    //: option:(BBBKitInfoFetchOption *)option
                    byLabel:(TitleOption *)option
{
    //: NIMTeam *team = [[NIMSDK sharedSDK].teamManager teamById:teamId];
    NIMTeam *team = [[NIMSDK sharedSDK].teamManager teamById:teamId];
    //: CCCKitInfo *info = [[CCCKitInfo alloc] init];
    TitleInfo *info = [[TitleInfo alloc] init];
    //: info.showName = team.teamName;
    info.showName = team.teamName;
    //: info.infoId = teamId;
    info.infoId = teamId;
    //: info.avatarImage = self.defaultTeamAvatar;
    info.avatarImage = self.defaultTeamAvatar;
    //: info.avatarUrlString = team.thumbAvatarUrl;
    info.avatarUrlString = team.thumbAvatarUrl;
    //: return info;
    return info;
}

//: - (CCCKitInfo *)infoBySuperTeam:(NSString *)teamId
- (TitleInfo *)noneShowOption:(NSString *)teamId
                         //: option:(BBBKitInfoFetchOption *)option
                         viewMedia:(TitleOption *)option
{
    //: NIMTeam *team = [[NIMSDK sharedSDK].superTeamManager teamById:teamId];
    NIMTeam *team = [[NIMSDK sharedSDK].superTeamManager teamById:teamId];
    //: CCCKitInfo *info = [[CCCKitInfo alloc] init];
    TitleInfo *info = [[TitleInfo alloc] init];
    //: info.showName = team.teamName;
    info.showName = team.teamName;
    //: info.infoId = teamId;
    info.infoId = teamId;
    //: info.avatarImage = self.defaultTeamAvatar;
    info.avatarImage = self.defaultTeamAvatar;
    //: info.avatarUrlString = team.thumbAvatarUrl;
    info.avatarUrlString = team.thumbAvatarUrl;
    //: return info;
    return info;
}

//: - (NSString *)replyedContentWithMessage:(NIMMessage *)replyedMessage
- (NSString *)limitState:(NIMMessage *)replyedMessage
{
    //: NIMMessageType messageType = replyedMessage.messageType;
    NIMMessageType messageType = replyedMessage.messageType;
    //: NSString *content = @"未知消息".nim_localized;
    NSString *content = StringFromFileParadeData(str_sessionPorkName).trapLocalized;
    //: BBBKitInfoFetchOption *option = [[BBBKitInfoFetchOption alloc] init];
    TitleOption *option = [[TitleOption alloc] init];
    //: option.message = replyedMessage;
    option.message = replyedMessage;
    //: CCCKitInfo *info = [[AppleProjectKit sharedKit] infoByUser:replyedMessage.from option:option];
    TitleInfo *info = [[Indicator reach] indoors:replyedMessage.from harvest:option];
    //: NSString *from = info.showName;
    NSString *from = info.showName;
    //: switch (messageType) {
    switch (messageType) {
        //: case NIMMessageTypeText:
        case NIMMessageTypeText:
            //: content = [NSString stringWithFormat:@"%@: %@".nim_localized, from, replyedMessage.text];
            content = [NSString stringWithFormat:@"%@: %@".trapLocalized, from, replyedMessage.text];
            //: break;
            break;
        //: case NIMMessageTypeImage:
        case NIMMessageTypeImage:
            //: content = [NSString stringWithFormat:@"%@: [图片]".nim_localized, from];
            content = [NSString stringWithFormat:@"%@: [图片]".trapLocalized, from];
            //: break;
            break;
        //: case NIMMessageTypeVideo:
        case NIMMessageTypeVideo:
            //: content = [NSString stringWithFormat:@"%@: [视频]".nim_localized, from];
            content = [NSString stringWithFormat:@"%@: [视频]".trapLocalized, from];
            //: break;
            break;
        //: case NIMMessageTypeFile:
        case NIMMessageTypeFile:
            //: content = [NSString stringWithFormat:@"%@: [文件]".nim_localized, from];
            content = [NSString stringWithFormat:@"%@: [文件]".trapLocalized, from];
            //: break;
            break;
        //: case NIMMessageTypeLocation:
        case NIMMessageTypeLocation:
            //: content = [NSString stringWithFormat:@"%@: [位置]".nim_localized, from];
            content = [NSString stringWithFormat:@"%@: [位置]".trapLocalized, from];
            //: break;
            break;
        //: case NIMMessageTypeNotification:
        case NIMMessageTypeNotification:
            //: content = [NSString stringWithFormat:@"%@: [通知]".nim_localized, from];
            content = [NSString stringWithFormat:@"%@: [通知]".trapLocalized, from];
            //: break;
            break;
        //: case NIMMessageTypeTip:
        case NIMMessageTypeTip:
            //: content = [NSString stringWithFormat:@"%@: [提示]".nim_localized, from];
            content = [NSString stringWithFormat:@"%@: [提示]".trapLocalized, from];
            //: break;
            break;
        //: case NIMMessageTypeAudio:
        case NIMMessageTypeAudio:
            //: content = [NSString stringWithFormat:@"%@: [语音]".nim_localized, from];
            content = [NSString stringWithFormat:@"%@: [语音]".trapLocalized, from];
            //: break;
            break;
        //: case NIMMessageTypeCustom:
        case NIMMessageTypeCustom:
            //: content = [NSString stringWithFormat:@"%@: [自定义消息]".nim_localized, from];
            content = [NSString stringWithFormat:StringFromFileParadeData(str_helpDirtyName).trapLocalized, from];
            //: break;
            break;
        //: default:
        default:
            //: break;
            break;
    }

    //: if (content.length > 0)
    if (content.length > 0)
    {
        //: content = [NSString stringWithFormat:@"“%@”".nim_localized, content];
        content = [NSString stringWithFormat:@"“%@”".trapLocalized, content];
    }
    //: return content;
    return content;
}

//: #pragma mark - 用户信息拼装
#pragma mark - 用户信息拼装
//会话中用户信息
//: - (CCCKitInfo *)infoByUser:(NSString *)userId
- (TitleInfo *)pressRange:(NSString *)userId
                   //: session:(NIMSession *)session
                   key:(NIMSession *)session
                    //: option:(BBBKitInfoFetchOption *)option
                    textStorage:(TitleOption *)option
{
    //: NIMSessionType sessionType = session.sessionType;
    NIMSessionType sessionType = session.sessionType;
    //: CCCKitInfo *info;
    TitleInfo *info;

    //: switch (sessionType) {
    switch (sessionType) {
        //: case NIMSessionTypeP2P:
        case NIMSessionTypeP2P:
        {
            //: info = [self userInfoInP2P:userId option:option];
            info = [self child:userId rangeQuick:option];
        }
            //: break;
            break;
        //: case NIMSessionTypeTeam:
        case NIMSessionTypeTeam:
        {
            //: info = [self userInfo:userId inTeam:session.sessionId option:option];
            info = [self nakedOptionWith:userId isFile:session.sessionId view:option];
        }
            //: break;
            break;
        //: case NIMSessionTypeChatroom:
        case NIMSessionTypeChatroom:
        {
            //: info = [self userInfo:userId inChatroom:session.sessionId option:option];
            info = [self message:userId arcanum:session.sessionId location_strong:option];
        }
            //: break;
            break;
        //: case NIMSessionTypeSuperTeam:
        case NIMSessionTypeSuperTeam:
        {
            //: info = [self userInfo:userId inSuperTeam:session.sessionId option:option];
            info = [self inwards:userId totalRelation:session.sessionId sum:option];
            //: break;
            break;
        }
        //: default:
        default:
            //: NSAssert(0, @"invalid type");
            NSAssert(0, StringFromFileParadeData(str_accomplishTitle));
            //: break;
            break;
    }

    //: if (!info)
    if (!info)
    {
        //: if (!userId.length)
        if (!userId.length)
        {
            //: NSLog(@"warning: fetch user failed because userid is empty");
        }
        //: else
        else
        {
            //: [self.request requestUserIds:@[userId]];
            [self.request showSave:@[userId]];
        }

        //: info = [[CCCKitInfo alloc] init];
        info = [[TitleInfo alloc] init];
        //: info.infoId = userId;
        info.infoId = userId;
        //: info.showName = userId; 
        info.showName = userId; //默认值
        //: info.avatarImage = self.defaultUserAvatar;
        info.avatarImage = self.defaultUserAvatar;
    }
    //: return info;
    return info;
}



//: #pragma mark - P2P 用户信息
#pragma mark - P2P 用户信息
//: - (CCCKitInfo *)userInfoInP2P:(NSString *)userId
- (TitleInfo *)child:(NSString *)userId
                       //: option:(BBBKitInfoFetchOption *)option
                       rangeQuick:(TitleOption *)option
{
    //: NIMUser *user = [[NIMSDK sharedSDK].userManager userInfo:userId];
    NIMUser *user = [[NIMSDK sharedSDK].userManager userInfo:userId];
    //: NIMUserInfo *userInfo = user.userInfo;
    NIMUserInfo *userInfo = user.userInfo;
    //: CCCKitInfo *info;
    TitleInfo *info;
    //: if (userInfo)
    if (userInfo)
    {
        //: info = [[CCCKitInfo alloc] init];
        info = [[TitleInfo alloc] init];
        //: info.infoId = userId;
        info.infoId = userId;
        //: NSString *name = [self nicknameWithUser:user
        NSString *name = [self range:user
                                           //: nick:nil
                                           wearerAddWithNickOption:nil
                                         //: option:option];
                                         name:option];
        //: info.showName = name?:@"";
        info.showName = name?:@"";
        //: info.avatarUrlString = userInfo.thumbAvatarUrl;
        info.avatarUrlString = userInfo.thumbAvatarUrl;
        //: info.avatarImage = self.defaultUserAvatar;
        info.avatarImage = self.defaultUserAvatar;
    }
    //: return info;
    return info;
}


//: #pragma mark - 群组用户信息
#pragma mark - 群组用户信息
//: - (CCCKitInfo *)userInfo:(NSString *)userId
- (TitleInfo *)nakedOptionWith:(NSString *)userId
                  //: inTeam:(NSString *)teamId
                  isFile:(NSString *)teamId
                  //: option:(BBBKitInfoFetchOption *)option
                  view:(TitleOption *)option
{
    //: NIMUser *user = [[NIMSDK sharedSDK].userManager userInfo:userId];
    NIMUser *user = [[NIMSDK sharedSDK].userManager userInfo:userId];
    //: NIMUserInfo *userInfo = user.userInfo;
    NIMUserInfo *userInfo = user.userInfo;
    //: NIMTeamMember *member = [[NIMSDK sharedSDK].teamManager teamMember:userId
    NIMTeamMember *member = [[NIMSDK sharedSDK].teamManager teamMember:userId
                                                                 //: inTeam:teamId];
                                                                 inTeam:teamId];

    //: CCCKitInfo *info;
    TitleInfo *info;

    //: if (userInfo || member)
    if (userInfo || member)
    {
        //: info = [[CCCKitInfo alloc] init];
        info = [[TitleInfo alloc] init];
        //: info.infoId = userId;
        info.infoId = userId;

        //: NSString *name = [self nicknameWithUser:user
        NSString *name = [self range:user
                                           //: nick:member.nickname
                                           wearerAddWithNickOption:member.nickname
                                         //: option:option];
                                         name:option];
        //: info.showName = name?:@"";
        info.showName = name?:@"";
        //: info.avatarUrlString = userInfo.thumbAvatarUrl;
        info.avatarUrlString = userInfo.thumbAvatarUrl;
        //: info.avatarImage = self.defaultUserAvatar;
        info.avatarImage = self.defaultUserAvatar;
    }
    //: return info;
    return info;
}

//: #pragma mark - 超大群用户信息
#pragma mark - 超大群用户信息
//: - (CCCKitInfo *)userInfo:(NSString *)userId
- (TitleInfo *)inwards:(NSString *)userId
             //: inSuperTeam:(NSString *)teamId
             totalRelation:(NSString *)teamId
                  //: option:(BBBKitInfoFetchOption *)option
                  sum:(TitleOption *)option
{
    //: NIMUser *user = [[NIMSDK sharedSDK].userManager userInfo:userId];
    NIMUser *user = [[NIMSDK sharedSDK].userManager userInfo:userId];
    //: NIMUserInfo *userInfo = user.userInfo;
    NIMUserInfo *userInfo = user.userInfo;
    //: NIMTeamMember *member = [[NIMSDK sharedSDK].superTeamManager teamMember:userId
    NIMTeamMember *member = [[NIMSDK sharedSDK].superTeamManager teamMember:userId
                                                                      //: inTeam:teamId];
                                                                      inTeam:teamId];

    //: CCCKitInfo *info;
    TitleInfo *info;

    //: if (userInfo || member)
    if (userInfo || member)
    {
        //: info = [[CCCKitInfo alloc] init];
        info = [[TitleInfo alloc] init];
        //: info.infoId = userId;
        info.infoId = userId;

        //: NSString *name = [self nicknameWithUser:user
        NSString *name = [self range:user
                                           //: nick:member.nickname
                                           wearerAddWithNickOption:member.nickname
                                         //: option:option];
                                         name:option];
        //: info.showName = name?:@"";
        info.showName = name?:@"";
        //: info.avatarUrlString = userInfo.thumbAvatarUrl;
        info.avatarUrlString = userInfo.thumbAvatarUrl;
        //: info.avatarImage = self.defaultUserAvatar;
        info.avatarImage = self.defaultUserAvatar;
    }
    //: return info;
    return info;
}


//: #pragma mark - 聊天室用户信息
#pragma mark - 聊天室用户信息
//: - (CCCKitInfo *)userInfo:(NSString *)userId
- (TitleInfo *)message:(NSString *)userId
              //: inChatroom:(NSString *)roomId
              arcanum:(NSString *)roomId
                  //: option:(BBBKitInfoFetchOption *)option
                  location_strong:(TitleOption *)option
{
    //: CCCKitInfo *info = [[CCCKitInfo alloc] init];
    TitleInfo *info = [[TitleInfo alloc] init];
    //: info.infoId = userId;
    info.infoId = userId;
    //: NIMMessageChatroomExtension *ext = [option.message.messageExt isKindOfClass:[NIMMessageChatroomExtension class]] ?
    NIMMessageChatroomExtension *ext = [option.message.messageExt isKindOfClass:[NIMMessageChatroomExtension class]] ?
    //: (NIMMessageChatroomExtension *)option.message.messageExt : nil;
    (NIMMessageChatroomExtension *)option.message.messageExt : nil;
    //: if (ext)
    if (ext)
    {
        //: info.showName = ext.roomNickname;
        info.showName = ext.roomNickname;
        //: info.avatarUrlString = ext.roomAvatar;
        info.avatarUrlString = ext.roomAvatar;
    }
    //: else if ([userId isEqualToString:[NIMSDK sharedSDK].loginManager.currentAccount])
    else if ([userId isEqualToString:[NIMSDK sharedSDK].loginManager.currentAccount])
    {
        //: NIMSDKAuthMode mode = [[NIMSDK sharedSDK].chatroomManager chatroomAuthMode:roomId];
        NIMSDKAuthMode mode = [[NIMSDK sharedSDK].chatroomManager chatroomAuthMode:roomId];

        //: switch (mode) {
        switch (mode) {
            //: case NIMSDKAuthModeChatroom:
            case NIMSDKAuthModeChatroom:
            {
//                NSAssert([Indicator sharedKit].independentModeExtraInfo, @"in mode NIMSDKAuthModeChatroom , must has independentModeExtraInfo");
                //: info.showName = [AppleProjectKit sharedKit].independentModeExtraInfo.myChatroomNickname;
                info.showName = [Indicator reach].independentModeExtraInfo.myChatroomNickname;
                //: info.avatarUrlString = [AppleProjectKit sharedKit].independentModeExtraInfo.myChatroomAvatar;
                info.avatarUrlString = [Indicator reach].independentModeExtraInfo.myChatroomAvatar;
            }
                //: break;
                break;
            //: case NIMSDKAuthModeIM:
            case NIMSDKAuthModeIM:
            {
                //: NIMUser *user = [[NIMSDK sharedSDK].userManager userInfo:userId];
                NIMUser *user = [[NIMSDK sharedSDK].userManager userInfo:userId];
                //: info.showName = user.userInfo.nickName;
                info.showName = user.userInfo.nickName;
                //: info.avatarUrlString = user.userInfo.thumbAvatarUrl;
                info.avatarUrlString = user.userInfo.thumbAvatarUrl;
            }
                //: break;
                break;
            //: default:
            default:
            {
                //: NSAssert(0, @"invalid mode");
                NSAssert(0, StringFromFileParadeData(str_signatureData));
            }
                //: break;
                break;
        }
    }

    //: info.avatarImage = self.defaultUserAvatar;
    info.avatarImage = self.defaultUserAvatar;
    //: return info;
    return info;
}

//昵称优先级
//: - (NSString *)nicknameWithUser:(NIMUser *)user
- (NSString *)range:(NIMUser *)user
                          //: nick:(NSString *)nick
                          wearerAddWithNickOption:(NSString *)nick
                        //: option:(BBBKitInfoFetchOption *)option
                        name:(TitleOption *)option
{
    //: NSString *name = nil;
    NSString *name = nil;
    //: do{
    do{
        //: if (!option.forbidaAlias && [user.alias length])
        if (!option.forbidaAlias && [user.alias length])
        {
            //: name = user.alias;
            name = user.alias;
            //: break;
            break;
        }
        //: if (nick && [nick length])
        if (nick && [nick length])
        {
            //: name = nick;
            name = nick;
            //: break;
            break;
        }

        //: if ([user.userInfo.nickName length])
        if ([user.userInfo.nickName length])
        {
            //: name = user.userInfo.nickName;
            name = user.userInfo.nickName;
            //: break;
            break;
        }
    //: }while (0);
    }while (0);
    //: return name;
    return name;
}

//: #pragma mark - avatar
#pragma mark - avatar
//: - (UIImage *)defaultTeamAvatar
- (UIImage *)defaultTeamAvatar
{
    //: if (!_defaultTeamAvatar)
    if (!_defaultTeamAvatar)
    {
        //: _defaultTeamAvatar = [UIImage imageNamed:@"head_default"];
        _defaultTeamAvatar = [UIImage imageNamed:StringFromFileParadeData(str_workingTitle)];
    }
    //: return _defaultTeamAvatar;
    return _defaultTeamAvatar;
}

//: - (UIImage *)defaultUserAvatar
- (UIImage *)defaultUserAvatar
{
    //: if (!_defaultUserAvatar)
    if (!_defaultUserAvatar)
    {
        //: _defaultUserAvatar = [UIImage imageNamed:@"head_default"];
        _defaultUserAvatar = [UIImage imageNamed:StringFromFileParadeData(str_workingTitle)];
    }
    //: return _defaultUserAvatar;
    return _defaultUserAvatar;
}




//将个人信息和群组信息变化通知给 Indicator 。
//如果您的应用不托管个人信息给云信，则需要您自行在上层监听个人信息变动，并将变动通知给 NIMKit。

//: #pragma mark - NIMUserManagerDelegate
#pragma mark - NIMUserManagerDelegate

//: - (void)onFriendChanged:(NIMUser *)user
- (void)onFriendChanged:(NIMUser *)user
{
    //: [self notifyUser:user];
    [self quick:user];
}

//: - (void)onUserInfoChanged:(NIMUser *)user
- (void)onUserInfoChanged:(NIMUser *)user
{
    //: [self notifyUser:user];
    [self quick:user];
}

//: - (void)notifyUser:(NIMUser *)user
- (void)quick:(NIMUser *)user
{
    //: if (!user)
    if (!user)
    {
        //: NSLog(@"warning: notify user failed because user is empty");
    }
    //: else
    else
    {
        //: [[AppleProjectKit sharedKit] notfiyUserInfoChanged:@[user.userId]];
        [[Indicator reach] down:@[user.userId]];
    }

}

//: #pragma mark - NIMTeamManagerDelegate
#pragma mark - NIMTeamManagerDelegate
//: - (void)onTeamAdded:(NIMTeam *)team
- (void)onTeamAdded:(NIMTeam *)team
{
    //: [self notifyTeamInfo:team];
    [self bottom:team];
}

//: - (void)onTeamUpdated:(NIMTeam *)team
- (void)onTeamUpdated:(NIMTeam *)team
{
    //: [self notifyTeamInfo:team];
    [self bottom:team];
}

//: - (void)onTeamRemoved:(NIMTeam *)team
- (void)onTeamRemoved:(NIMTeam *)team
{
    //: [self notifyTeamInfo:team];
    [self bottom:team];
}

//: - (void)onTeamMemberChanged:(NIMTeam *)team
- (void)onTeamMemberChanged:(NIMTeam *)team
{
    //: [self notifyTeamMember:team];
    [self sub:team];
}

//: - (void)notifyTeamInfo:(NIMTeam *)team
- (void)bottom:(NIMTeam *)team
{
    //: if (!team.teamId.length)
    if (!team.teamId.length)
    {
        //: NSLog(@"warning: notify teamid failed because teamid is empty");
    }
    //: else
    else
    {
        //: switch (team.type) {
        switch (team.type) {
            //: case NIMTeamTypeNormal:
            case NIMTeamTypeNormal:
            //: case NIMTeamTypeAdvanced:
            case NIMTeamTypeAdvanced:
                //: [[AppleProjectKit sharedKit] notifyTeamInfoChanged:team.teamId type:NIMKitTeamTypeNomal];
                [[Indicator reach] notify:team.teamId anyIndependent:NIMKitTeamTypeNomal];
                //: break;
                break;
            //: case NIMTeamTypeSuper:
            case NIMTeamTypeSuper:
                //: [[AppleProjectKit sharedKit] notifyTeamInfoChanged:team.teamId type:NIMKitTeamTypeSuper];
                [[Indicator reach] notify:team.teamId anyIndependent:NIMKitTeamTypeSuper];
                //: break;
                break;
            //: default:
            default:
                //: break;
                break;
        }
    }
}

//: - (void)notifyTeamMember:(NIMTeam *)team
- (void)sub:(NIMTeam *)team
{
    //: if (!team.teamId.length)
    if (!team.teamId.length)
    {
        //: NSLog(@"warning: notify team member failed because teamid is empty");
    }
    //: else
    else
    {
        //: switch (team.type) {
        switch (team.type) {
            //: case NIMTeamTypeNormal:
            case NIMTeamTypeNormal:
            //: case NIMTeamTypeAdvanced:
            case NIMTeamTypeAdvanced:
                //: [[AppleProjectKit sharedKit] notifyTeamInfoChanged:team.teamId type:NIMKitTeamTypeNomal];
                [[Indicator reach] notify:team.teamId anyIndependent:NIMKitTeamTypeNomal];
                //: break;
                break;
            //: case NIMTeamTypeSuper:
            case NIMTeamTypeSuper:
                //: [[AppleProjectKit sharedKit] notifyTeamInfoChanged:team.teamId type:NIMKitTeamTypeSuper];
                [[Indicator reach] notify:team.teamId anyIndependent:NIMKitTeamTypeSuper];
                //: break;
                break;
            //: default:
            default:
                //: break;
                break;
        }
    }
}

//: #pragma mark - NIMLoginManagerDelegate
#pragma mark - NIMLoginManagerDelegate
//: - (void)onLogin:(NIMLoginStep)step
- (void)onLogin:(NIMLoginStep)step
{
    //: if (step == NIMLoginStepSyncOK) {
    if (step == NIMLoginStepSyncOK) {
        //: [[AppleProjectKit sharedKit] notifyTeamInfoChanged:nil type:NIMKitTeamTypeNomal];
        [[Indicator reach] notify:nil anyIndependent:NIMKitTeamTypeNomal];
        //: [[AppleProjectKit sharedKit] notifyTeamMemebersChanged:nil type:NIMKitTeamTypeNomal];
        [[Indicator reach] quantity:nil index:NIMKitTeamTypeNomal];
    }
}



//: @end
@end

Byte * FileParadeDataToCache(Byte *data) {
    int guardsman = data[0];
    int doingGoal = data[1];
    Byte developerTian = data[2];
    int coinsuranceView = data[3];
    if (!guardsman) return data + coinsuranceView;
    for (int i = coinsuranceView; i < coinsuranceView + doingGoal; i++) {
        int value = data[i] + developerTian;
        if (value > 255) {
            value -= 256;
        }
        data[i] = value;
    }
    data[0] = 0;
    data[coinsuranceView + doingGoal] = 0;
    return data + coinsuranceView;
}

NSString *StringFromFileParadeData(Byte *data) {
    return [NSString stringWithUTF8String:(char *)FileParadeDataToCache(data)];
}
