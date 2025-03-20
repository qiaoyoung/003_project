// __DEBUG__
// __CLOSE_PRINT__
//
//  ShowHide.h
// Indicator
//
//  Created by chris on 15/9/14.
//  Copyright (c) 2015年 NetEase. All rights reserved.
//

// __M_A_C_R_O__
//: #import <Foundation/Foundation.h>
#import <Foundation/Foundation.h>
//: #import "CCCKitInfo.h"
#import "TitleInfo.h"
//: #import "AAAGroupedUsrInfo.h"
#import "AAAGroupedUsrInfo.h"

/**
 *  联系人选择器数据回调
 */
//: typedef void(^NIMContactDataProviderHandler)(NSDictionary *contentDic, NSArray *titles);
typedef void(^NIMContactDataProviderHandler)(NSDictionary *contentDic, NSArray *titles);

//: @protocol AAAContactSelectConfig <NSObject>
@protocol ShowHide <NSObject>

//: @optional
@optional

/**
 *  联系人选择器标题
 */
//: - (NSString *)title;
- (NSString *)media;

/**
 *  最多选择的人数
 */
//: - (NSInteger)maxSelectedNum;
- (NSInteger)centerHeight;

/**
 *  超过最多选择人数时的提示
 */
//: - (NSString *)selectedOverFlowTip;
- (NSString *)oozeEliteOverTip;

/**
 *  默认已经勾选的人或群组
 */
//: - (NSArray *)alreadySelectedMemberId;
- (NSArray *)eliteBy;

/**
 *  需要过滤的人或群组id
 */
//: - (NSArray *)filterIds;
- (NSArray *)valueTitle;

/**
 *  当数据源类型为群组时，需要设置的群id
 *
 *  @return 群id
 */
//: - (NSString *)teamId;
- (NSString *)ignitionKey;

/**
 *  显示具体选择人数
 */
//: - (BOOL)showSelectDetail;
- (BOOL)read;

/**
 *  提供联系人选择期的昵称，title信息
 */
//: - (void)getContactData:(NIMContactDataProviderHandler)handler;
- (void)eyeglasses:(NIMContactDataProviderHandler)handler;

/**
 *  提供联系人id、显示名、头像等信息
 */
//: - (CCCKitInfo *)getInfoById:(NSString *)selectedId;
- (TitleInfo *)bottom:(NSString *)selectedId;

/// 是否显示头部的群头像 群名字headerview
//: - (BOOL)showSelectHeaderview;
- (BOOL)showSelectHeaderview;

//: @end
@end

/**
 *  内置配置-选择好友
 */
//: @interface NIMContactFriendSelectConfig : NSObject<AAAContactSelectConfig>
@interface ChildTeam : NSObject<ShowHide>

//: @property (nonatomic,assign) BOOL needMutiSelected;
@property (nonatomic,assign) BOOL needMutiSelected;

//: @property (nonatomic,assign) NSInteger maxSelectMemberCount;
@property (nonatomic,assign) NSInteger maxSelectMemberCount;

//: @property (nonatomic,copy) NSArray *alreadySelectedMemberId;
@property (nonatomic,copy) NSArray *alreadySelectedMemberId;

//: @property (nonatomic,copy) NSArray *filterIds;
@property (nonatomic,copy) NSArray *filterIds;

//: @property (nonatomic,assign) BOOL showSelectDetail;
@property (nonatomic,assign) BOOL showSelectDetail;

//: @property (nonatomic,assign) BOOL showSelectHeaderview;
@property (nonatomic,assign) BOOL showSelectHeaderview;

//: @end
@end

/**
 *  内置配置-选择群成员
 */
//: @interface NIMContactTeamMemberSelectConfig : NSObject<AAAContactSelectConfig>
@interface MessageChild : NSObject<ShowHide>

//: @property (nonatomic,copy) NSString *teamId;
@property (nonatomic,copy) NSString *teamId;

//: @property (nonatomic,strong) NIMSession *session;
@property (nonatomic,strong) NIMSession *session;

//: @property (nonatomic,assign) NIMKitTeamType teamType;
@property (nonatomic,assign) NIMKitTeamType teamType;

//: @property (nonatomic,assign) BOOL needMutiSelected;
@property (nonatomic,assign) BOOL needMutiSelected;

//: @property (nonatomic,assign) NSInteger maxSelectMemberCount;
@property (nonatomic,assign) NSInteger maxSelectMemberCount;

//: @property (nonatomic,copy) NSArray *alreadySelectedMemberId;
@property (nonatomic,copy) NSArray *alreadySelectedMemberId;

//: @property (nonatomic,copy) NSArray *filterIds;
@property (nonatomic,copy) NSArray *filterIds;

//: @property (nonatomic,assign) BOOL showSelectDetail;
@property (nonatomic,assign) BOOL showSelectDetail;

//: @property (nonatomic,assign) BOOL showSelectHeaderview;
@property (nonatomic,assign) BOOL showSelectHeaderview;

//: @end
@end


/**
 *  内置配置-选择群
 */
//: @interface NIMContactTeamSelectConfig : NSObject<AAAContactSelectConfig>
@interface AddHide : NSObject<ShowHide>

//: @property (nonatomic,assign) NIMKitTeamType teamType;
@property (nonatomic,assign) NIMKitTeamType teamType;

//: @property (nonatomic,assign) BOOL needMutiSelected;
@property (nonatomic,assign) BOOL needMutiSelected;

//: @property (nonatomic,assign) NSInteger maxSelectMemberCount;
@property (nonatomic,assign) NSInteger maxSelectMemberCount;

//: @property (nonatomic,copy) NSArray *alreadySelectedMemberId;
@property (nonatomic,copy) NSArray *alreadySelectedMemberId;

//: @property (nonatomic,copy) NSArray *filterIds;
@property (nonatomic,copy) NSArray *filterIds;

//: @property (nonatomic,assign) BOOL showSelectDetail;
@property (nonatomic,assign) BOOL showSelectDetail;

//: @property (nonatomic,assign) BOOL showSelectHeaderview;
@property (nonatomic,assign) BOOL showSelectHeaderview;

//: @end
@end
