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

//: - (NSString*)teamId;
- (NSString*)pullMessage;

//: - (NSString*)userId;
- (NSString*)queryedMessage;

//: - (NIMTeamMemberType)userType;
- (NIMTeamMemberType)at;

//: - (void)setUserType:(NIMTeamMemberType)userType;
- (void)setAt:(NIMTeamMemberType)userType;

//: - (NIMTeamType)teamType;
- (NIMTeamType)greenOf;

//: - (UIImage*)imageNormal;
- (UIImage*)standard;

//: - (NSString*)title;
- (NSString*)close;

//: - (NSString*)imageUrl;
- (NSString*)red;

//: - (NSString*)inviterAccid;
- (NSString*)arrayAccid;

//: - (BOOL)isMuted;
- (BOOL)mediaSize;

//: - (BOOL)isMyUserId;
- (BOOL)showBecome;

//: @end
@end

//: @protocol NIMKitSelectCardData <NSObject>
@protocol StateLanguage <NSObject>

//: - (id)value;
- (id)view;

//: - (NSString*)title;
- (NSString*)will;

//: - (NSString*)img;
- (NSString*)shared;

//: - (BOOL)selected;
- (BOOL)schemeSearched;

//: - (void)setSelected:(BOOL)selected;
- (void)setSchemeSearched:(BOOL)selected;

//: @end
@end

//: @protocol NTESCardBodyData <NSObject>
@protocol DisableData <NSObject>

//: - (NSString*)title;
- (NSString*)house;

//: - (id)value;
- (id)icon;

//: - (NIMKitTeamCardRowItemType)type;
- (NIMKitTeamCardRowItemType)old;

//: - (CGFloat)rowHeight;
- (CGFloat)noneSession;

//: - (NIMTeamCardRowSelectedBlock)selectedBlock;
- (NIMTeamCardRowSelectedBlock)tillBubble;

//: - (NSMutableArray <id <NIMKitSelectCardData>> *)optionItems;
- (NSMutableArray <id <StateLanguage>> *)complete;

//: @optional
@optional
//: - (NSString*)subTitle;
- (NSString*)sumSuccess;

//: - (UIImage*)img;
- (UIImage*)show;

//: - (SEL)action;
- (SEL)godspeedThan;

//: - (BOOL)actionDisabled;
- (BOOL)masterKeyWill;

//: - (BOOL)switchOn;
- (BOOL)session;

//: - (NSInteger)identify;
- (NSInteger)visualImage;

//: - (BOOL)disableUserInteraction;
- (BOOL)manageress;

//: @end
@end
