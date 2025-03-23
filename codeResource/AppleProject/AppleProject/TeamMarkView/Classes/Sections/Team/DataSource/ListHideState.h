// __DEBUG__
// __CLOSE_PRINT__
//
//  ListHideState.h
// Indicator
//
//  Created by Netease on 2019/6/17.
//  Copyright © 2019 NetEase. All rights reserved.
//

// __M_A_C_R_O__
//: #import <Foundation/Foundation.h>
#import <Foundation/Foundation.h>
//: #import <NIMSDK/NIMSDK.h>
#import <NIMSDK/NIMSDK.h>
//: #import "CCCTeamMemberListDataSource.h"
#import "MessageSource.h"

//: extern NSString * _Nonnull const kNIMTeamListDataTeamInfoUpdate;
extern NSString * _Nonnull const k_styleText;
//: extern NSString * _Nonnull const kNIMTeamListDataTeamMembersChanged;
extern NSString * _Nonnull const k_showName;

//: NS_ASSUME_NONNULL_BEGIN
NS_ASSUME_NONNULL_BEGIN

//: @interface BBBTeamListDataManager : NSObject<CCCTeamMemberListDataSource>
@interface ListHideState : NSObject<MessageSource>

//当前群
//: @property (nonatomic, readonly) NIMTeam *team;
@property (nonatomic, readonly) NIMTeam *team;

//自己的帐号
//: @property (nonatomic, readonly) NSString *myAccount;
@property (nonatomic, readonly) NSString *myAccount;

//自己的群成员信息
//: @property (nonatomic, readonly) NIMTeamMember *myTeamInfo;
@property (nonatomic, readonly) NIMTeamMember *myTeamInfo;

//所有群成员的id
//: @property (nonatomic, readonly) NSMutableArray <NSString *>*memberIds;
@property (nonatomic, readonly) NSMutableArray <NSString *>*memberIds;

//初始化
//: - (instancetype)initWithTeam:(NIMTeam *)team session:(NIMSession *)session;
- (instancetype)initWithSecret:(NIMTeam *)team iconInfo_strong:(NIMSession *)session;

//更新个人群组信息
//: - (void)reloadMyTeamInfo;
- (void)text;

//: @end
@end

//: NS_ASSUME_NONNULL_END
NS_ASSUME_NONNULL_END