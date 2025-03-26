// __DEBUG__
// __CLOSE_PRINT__
//
//  UserCardDataSourceProtocol.h
//  NIM
//
//  Created by chris on 15/3/5.
//  Copyright (c) 2015年 Netease. All rights reserved.
//
//: #import <Foundation/Foundation.h>
#import <Foundation/Foundation.h>
//: #import <UIKit/UIKit.h>
#import <UIKit/UIKit.h>
//: #import <NIMSDK/NIMSDK.h>
#import <NIMSDK/NIMSDK.h>

// __M_A_C_R_O__

//: @protocol NIMKitSelectCardData;
@protocol StateLanguage;

//: typedef void(^NIMTeamCardRowSelectedBlock)(id <NIMKitSelectCardData> item);
typedef void(^NIMTeamCardRowSelectedBlock)(id <StateLanguage> item);

//: typedef NS_ENUM(NSInteger, NIMKitCardHeaderOpeator){
typedef NS_ENUM(NSInteger, NIMKitCardHeaderOpeator){
    //: CardHeaderOpeatorNone = 0,
    CardHeaderOpeatorNone = 0,
    //: CardHeaderOpeatorAdd = (1UL << 0),
    CardHeaderOpeatorAdd = (1UL << 0),
    //: CardHeaderOpeatorRemove = (1UL << 1),
    CardHeaderOpeatorRemove = (1UL << 1),
//: };
};

//: typedef NS_ENUM(NSInteger, NIMKitTeamCardRowItemType) {
typedef NS_ENUM(NSInteger, NIMKitTeamCardRowItemType) {
    //: TeamCardRowItemTypeCommon,
    TeamCardRowItemTypeCommon,
    //: TeamCardRowItemTypeTeamMember,
    TeamCardRowItemTypeTeamMember,
    //: TeamCardRowItemTypeRedButton,
    TeamCardRowItemTypeRedButton,
    //: TeamCardRowItemTypeBlueButton,
    TeamCardRowItemTypeBlueButton,
    //: TeamCardRowItemTypeSwitch,
    TeamCardRowItemTypeSwitch,
    //: TeamCardRowItemTypeSelected,
    TeamCardRowItemTypeSelected,
//: };
};

//: @protocol NIMKitCardHeaderData <NSObject>
@protocol WithChild <NSObject>

- (NSString*)teamId;

- (NSString*)userId;

- (NIMTeamMemberType)userType;

- (void)setUserType:(NIMTeamMemberType)userType;

- (NIMTeamType)teamType;

- (UIImage*)imageNormal;

- (NSString*)title;

- (NSString*)imageUrl;

- (NSString*)inviterAccid;

- (BOOL)isMuted;

- (BOOL)isMyUserId;

//: @end
@end

//: @protocol NIMKitSelectCardData <NSObject>
@protocol StateLanguage <NSObject>

- (id)value;

- (NSString*)title;

- (NSString*)img;

- (BOOL)selected;

- (void)setSelected:(BOOL)selected;

//: @end
@end

//: @protocol NTESCardBodyData <NSObject>
@protocol DisableData <NSObject>

- (NSString*)title;

- (id)value;

- (NIMKitTeamCardRowItemType)type;

- (CGFloat)rowHeight;

- (NIMTeamCardRowSelectedBlock)selectedBlock;

- (NSMutableArray <id <StateLanguage>> *)optionItems;

//: @optional
@optional
- (NSString*)subTitle;

- (UIImage*)img;

- (SEL)action;

- (BOOL)actionDisabled;

- (BOOL)switchOn;

- (NSInteger)identify;

- (BOOL)disableUserInteraction;

//: @end
@end
