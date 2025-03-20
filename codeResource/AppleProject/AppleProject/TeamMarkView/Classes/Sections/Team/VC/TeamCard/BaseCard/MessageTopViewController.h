// __DEBUG__
// __CLOSE_PRINT__
//
//  MessageTopViewController.h
// Indicator
//
//  Created by Genning-Work on 2019/12/12.
//  Copyright © 2019 NetEase. All rights reserved.
//  群组操作

// __M_A_C_R_O__
//: #import "BBBTeamCardViewController.h"
#import "DoingViewController.h"

//: NS_ASSUME_NONNULL_BEGIN
NS_ASSUME_NONNULL_BEGIN

//: #pragma mark - 外部配置项
#pragma mark - 外部配置项
//: @interface BBBTeamCardViewControllerOption : NSObject
@interface ViewOption : NSObject

//: @property (nonatomic, assign) BOOL isTop;
@property (nonatomic, assign) BOOL isTop;

//: @end
@end

//: @interface BBBTeamCardOperationViewController : BBBTeamCardViewController
@interface MessageTopViewController : DoingViewController

//外部配置
//: @property (nonatomic,strong) BBBTeamCardViewControllerOption *option;
@property (nonatomic,strong) ViewOption *option;

//群组管理
//: @property (nonatomic,strong) BBBTeamListDataManager *teamListManager;
@property (nonatomic,strong) ListHideState *teamListManager;


//初始化
//: - (instancetype)initWithTeam:(NIMTeam *)team
- (instancetype)initWithMax:(NIMTeam *)team
                     //: session:(NIMSession *)session
                     length:(NIMSession *)session
                      //: option:(BBBTeamCardViewControllerOption * _Nullable)option;
                      teamRecording:(ViewOption * _Nullable)option;
//查询全部群成员
//: - (void)didFetchTeamMember:(nullable BBBMembersFetchOption *)option;
- (void)clean:(nullable TypicalOption *)option;

//加人
//: - (void)didInviteUsers:(NSArray<NSString *> *)userIds
- (void)toTapWith:(NSArray<NSString *> *)userIds
            //: completion:(nullable dispatch_block_t)completion;
            link:(nullable dispatch_block_t)completion;

//踢人
//: - (void)didKickUser:(NSString *)userId;
- (void)device:(NSString *)userId;

//更新群名称
//: - (void)didUpdateTeamName:(NSString *)name;
- (void)title:(NSString *)name;

//更新群昵称
//: - (void)didUpdateTeamNick:(NSString *)nick;
- (void)restoreQueryNick:(NSString *)nick;

//更新群公告
//: - (void)didUpdateTeamIntro:(NSString *)intro;
- (void)month:(NSString *)intro;

//更新群禁言
//: - (void)didUpdateTeamMute:(BOOL)mute;
- (void)label:(BOOL)mute;

//更新群头像
//: - (void)didUpdateTeamAvatarWithType:(UIImagePickerControllerSourceType)type;
- (void)modify:(UIImagePickerControllerSourceType)type;

//更新群组验证方式
//: - (void)didupdateTeamJoinMode:(NIMTeamJoinMode)mode;
- (void)descriptionCustom:(NIMTeamJoinMode)mode;

//更新邀请模式
//: - (void)didUpdateTeamInviteMode:(NIMTeamInviteMode)mode;
- (void)pin:(NIMTeamInviteMode)mode;

//更新被邀请模式
//: - (void)didUpdateTeamBeInviteMode:(NIMTeamBeInviteMode)mode;
- (void)empty:(NIMTeamBeInviteMode)mode;

//更新群信息修改权限
//: - (void)didUpdateTeamInfoMode:(NIMTeamUpdateInfoMode)mode;
- (void)doShould:(NIMTeamUpdateInfoMode)mode;

//更新群消息接受状态
//: - (void)didUpdateNotifiyState:(NIMTeamNotifyState)state;
- (void)myState:(NIMTeamNotifyState)state;

//转移群组
//: - (void)didOntransferToUser:(NSString *)userId leave:(BOOL)leave;
- (void)session:(NSString *)userId crush:(BOOL)leave;

//退出群组
//: - (void)didQuitTeam;
- (void)show;

//解散群组
//: - (void)didDismissTeam;
- (void)success;

//: - (void)reloadData;
- (void)timeText;


//: @end
@end

//: NS_ASSUME_NONNULL_END
NS_ASSUME_NONNULL_END