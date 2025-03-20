// __DEBUG__
// __CLOSE_PRINT__
//
//  MessageSource.h
// Indicator
//
//  Created by Netease on 2019/6/17.
//  Copyright © 2019 NetEase. All rights reserved.
//
//: #import <Foundation/Foundation.h>
#import <Foundation/Foundation.h>
//: #import "BBBTeamCardMemberItem.h"
#import "OnenceShould.h"
//: #import "BBBMembersFetchOption.h"
#import "TypicalOption.h"

// __M_A_C_R_O__

//: typedef void(^NIMTeamListDataBlock)(NSError * _Nullable error, NSString * _Nullable msg);
typedef void(^NIMTeamListDataBlock)(NSError * _Nullable error, NSString * _Nullable msg);
//: typedef void(^NIMTeamMuteListDataBlock)(NSError * _Nullable error, NSMutableArray<BBBTeamCardMemberItem *> * _Nullable members);
typedef void(^NIMTeamMuteListDataBlock)(NSError * _Nullable error, NSMutableArray<OnenceShould *> * _Nullable members);
//: NS_ASSUME_NONNULL_BEGIN
NS_ASSUME_NONNULL_BEGIN


//: @protocol NIMTeamOperation <NSObject>
@protocol AtWithInput <NSObject>

//加人
//: - (void)addUsers:(NSArray *)userIds
- (void)completion:(NSArray *)userIds
            //: info:(NSDictionary *)info
            beforeSearched:(NSDictionary *)info
      //: completion:(NIMTeamListDataBlock)completion;
      top:(NIMTeamListDataBlock)completion;

//踢人
//: - (void)kickUsers:(NSArray *)userIds
- (void)say:(NSArray *)userIds
       //: completion:(NIMTeamListDataBlock)completion;
       messageSearch:(NIMTeamListDataBlock)completion;

//更新群公告
//: - (void)updateTeamAnnouncement:(NSString *)content
- (void)nim:(NSString *)content
                    //: completion:(NIMTeamListDataBlock)completion;
                    color:(NIMTeamListDataBlock)completion;

//更新群头像
//: - (void)updateTeamAvatar:(NSString *)filePath
- (void)search:(NSString *)filePath
              //: completion:(NIMTeamListDataBlock)completion;
              max:(NIMTeamListDataBlock)completion;

//更新群名称
//: - (void)updateTeamName:(NSString *)name
- (void)frame:(NSString *)name
            //: completion:(NIMTeamListDataBlock)completion;
            streetSmartDataBlock:(NIMTeamListDataBlock)completion;

//更新群昵称
//: - (void)updateTeamNick:(NSString *)nick
- (void)option:(NSString *)nick
            //: completion:(NIMTeamListDataBlock)completion;
            barCompletion:(NIMTeamListDataBlock)completion;

//更新群简介
//: - (void)updateTeamIntro:(NSString *)intro
- (void)immobilize:(NSString *)intro
             //: completion:(NIMTeamListDataBlock)completion;
             refreshSharedTeamQuantityro:(NIMTeamListDataBlock)completion;

//更新群禁言
//: - (void)updateTeamMute:(BOOL)mute
- (void)readFlush:(BOOL)mute
            //: completion:(NIMTeamListDataBlock)completion;
            greenItem:(NIMTeamListDataBlock)completion;

//权限更改
//: - (void)updateTeamJoinMode:(NIMTeamJoinMode)mode
- (void)date:(NIMTeamJoinMode)mode
                //: completion:(NIMTeamListDataBlock)completion;
                image:(NIMTeamListDataBlock)completion;

//邀请模式更改
//: - (void)updateTeamInviteMode:(NIMTeamInviteMode)mode
- (void)commentSize:(NIMTeamInviteMode)mode
                  //: completion:(NIMTeamListDataBlock)completion;
                  session:(NIMTeamListDataBlock)completion;

//群信息修改权限更改
//: - (void)updateTeamInfoMode:(NIMTeamUpdateInfoMode)mode
- (void)mode:(NIMTeamUpdateInfoMode)mode
                //: completion:(NIMTeamListDataBlock)completion;
                info:(NIMTeamListDataBlock)completion;

//群通知状态修改
//: - (void)updateTeamNotifyState:(NIMTeamNotifyState)state
- (void)alongBy:(NIMTeamNotifyState)state
                   //: completion:(NIMTeamListDataBlock)completion;
                   empty:(NIMTeamListDataBlock)completion;

//被邀请模式更改
//: - (void)updateTeamBeInviteMode:(NIMTeamBeInviteMode)mode
- (void)version:(NIMTeamBeInviteMode)mode
                    //: completion:(NIMTeamListDataBlock)completion;
                    buttonWeShould:(NIMTeamListDataBlock)completion;

//增加管理员
//: - (void)addManagers:(NSArray *)userIds
- (void)file:(NSArray *)userIds
         //: completion:(NIMTeamListDataBlock)completion;
         milk:(NIMTeamListDataBlock)completion;

//移除管理员
//: - (void)removeManagers:(NSArray *)userIds
- (void)showDecarburise:(NSArray *)userIds
            //: completion:(NIMTeamListDataBlock)completion;
            convert:(NIMTeamListDataBlock)completion;

//群主转移
//: - (void)transferOwnerWithUserId:(NSString *)newOwnerId
- (void)team:(NSString *)newOwnerId
                           //: leave:(BOOL)leave
                           handleCompletion:(BOOL)leave
                      //: completion:(NIMTeamListDataBlock)completion;
                      image:(NIMTeamListDataBlock)completion;

//修改用户昵称
//: - (void)updateUserNick:(NSString *)userId
- (void)layerNickCompletion:(NSString *)userId
                  //: nick:(NSString *)nick
                  speckless:(NSString *)nick
            //: completion:(NIMTeamListDataBlock)completion;
            call:(NIMTeamListDataBlock)completion;

//修改用户禁言状态
//: - (void)updateUserMuteState:(NSString *)userId
- (void)title:(NSString *)userId
                       //: mute:(BOOL)mute
                       requisite:(BOOL)mute
                 //: completion:(NIMTeamListDataBlock)completion;
                 info:(NIMTeamListDataBlock)completion;

//查询群成员
//: - (void)fetchTeamMembersWithOption:(BBBMembersFetchOption * _Nullable )option
- (void)mark:(TypicalOption * _Nullable )option
                        //: completion:(NIMTeamListDataBlock)completion;
                        schemeOf:(NIMTeamListDataBlock)completion;

//查询群禁言列表
//: - (void)fetchTeamMutedMembersCompletion:(NIMTeamMuteListDataBlock)completion;
- (void)tableCompletion:(NIMTeamMuteListDataBlock)completion;

//退群
//: - (void)quitTeamCompletion:(NIMTeamListDataBlock)completion;
- (void)input:(NIMTeamListDataBlock)completion;

//解散群
//: - (void)dismissTeamCompletion:(NIMTeamListDataBlock)completion;
- (void)center:(NIMTeamListDataBlock)completion;

//: @end
@end



//: @protocol CCCTeamMemberListDataSource <NIMTeamOperation>
@protocol MessageSource <AtWithInput>

//: - (NIMTeam *)team;
- (NIMTeam *)image;

//: - (NIMSession *)session;
- (NIMSession *)to;

//: - (NSInteger)memberNumber;
- (NSInteger)high;

//: - (NSMutableArray <BBBTeamCardMemberItem *> *)members;
- (NSMutableArray <OnenceShould *> *)showExamineed;

//: - (BBBTeamCardMemberItem *)myCard;
- (OnenceShould *)visible;

//: - (BBBTeamCardMemberItem *)memberWithUserId:(NSString *)userId;
- (OnenceShould *)lyric:(NSString *)userId;

//: @end
@end

//: NS_ASSUME_NONNULL_END
NS_ASSUME_NONNULL_END