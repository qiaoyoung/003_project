// __DEBUG__
// __CLOSE_PRINT__
//
//  LanguageChild.h
// Indicator
//
//  Created by Genning-Work on 2019/12/11.
//  Copyright © 2019 NetEase. All rights reserved.
//

// __M_A_C_R_O__
//: #import <Foundation/Foundation.h>
#import <Foundation/Foundation.h>
//: #import <NIMSDK/NIMSDK.h>
#import <NIMSDK/NIMSDK.h>
//: #import "AppleProjectKit.h"
#import "Indicator.h"

//: NS_ASSUME_NONNULL_BEGIN
NS_ASSUME_NONNULL_BEGIN

//: @protocol NIMKitSelectCardData;
@protocol StateLanguage;

//: @interface BBBTeamHelper : NSObject
@interface LanguageChild : NSObject

//验证方式
//: + (NSString *)jonModeText:(NIMTeamJoinMode)mode;
+ (NSString *)locationStyle:(NIMTeamJoinMode)mode;

//: + (NSMutableArray<id <NIMKitSelectCardData>> *)joinModeItemsWithSeleced:(NIMTeamJoinMode)mode;
+ (NSMutableArray<id <StateLanguage>> *)selected:(NIMTeamJoinMode)mode;

//邀请模式
//: + (NSString *)InviteModeText:(NIMTeamInviteMode)mode;
+ (NSString *)line:(NIMTeamInviteMode)mode;

//: + (NSMutableArray<id <NIMKitSelectCardData>> *)InviteModeItemsWithSeleced:(NIMTeamInviteMode)mode;
+ (NSMutableArray<id <StateLanguage>> *)mode:(NIMTeamInviteMode)mode;

//被邀请模式
//: + (NSArray<NSDictionary *> *)allBeInviteModes;
+ (NSArray<NSDictionary *> *)counteract;

//: + (NSString *)beInviteModeText:(NIMTeamBeInviteMode)mode;
+ (NSString *)light:(NIMTeamBeInviteMode)mode;

//: + (NSMutableArray<id <NIMKitSelectCardData>> *)beInviteModeItemsWithSeleced:(NIMTeamBeInviteMode)mode;
+ (NSMutableArray<id <StateLanguage>> *)limit:(NIMTeamBeInviteMode)mode;

//信息修改权限
//: + (NSString *)updateInfoModeText:(NIMTeamUpdateInfoMode)mode;
+ (NSString *)language:(NIMTeamUpdateInfoMode)mode;

//: + (NSMutableArray<id <NIMKitSelectCardData>> *)updateInfoModeItemsWithSeleced:(NIMTeamUpdateInfoMode)mode;
+ (NSMutableArray<id <StateLanguage>> *)sessionBackSeleced:(NIMTeamUpdateInfoMode)mode;

//消息接受状态
//: + (NSString *)notifyStateText:(NIMTeamNotifyState)state;
+ (NSString *)findName:(NIMTeamNotifyState)state;

//: + (NSMutableArray<id <NIMKitSelectCardData>> *)notifyStateItemsWithSeleced:(NIMTeamNotifyState)state;
+ (NSMutableArray<id <StateLanguage>> *)little:(NIMTeamNotifyState)state;

//: + (NSMutableArray<id <NIMKitSelectCardData>> *)superNotifyStateItemsWithSeleced:(NIMTeamNotifyState)state;
+ (NSMutableArray<id <StateLanguage>> *)shared:(NIMTeamNotifyState)state;

//成员类型
//: + (NSString *)memberTypeText:(NIMTeamMemberType)type;
+ (NSString *)futurism:(NIMTeamMemberType)type;

//: + (nullable UIImage *)imageWithMemberType:(NIMTeamMemberType)type;
+ (nullable UIImage *)beVoice:(NIMTeamMemberType)type;

//群禁言
//: + (NSString *)teamMuteText:(BOOL)isMute;
+ (NSString *)table:(BOOL)isMute;

//: + (NSMutableArray<id <NIMKitSelectCardData>> *)teamMuteItemsWithSeleced:(BOOL)isMute;
+ (NSMutableArray<id <StateLanguage>> *)model:(BOOL)isMute;

//: @end
@end

//: NS_ASSUME_NONNULL_END
NS_ASSUME_NONNULL_END