// __DEBUG__
// __CLOSE_PRINT__
//
//  NIMUtil.h
// Indicator
//
//  Created by chris on 15/8/10.
//  Copyright (c) 2015年 NetEase. All rights reserved.
//

// __M_A_C_R_O__
//: #import <Foundation/Foundation.h>
#import <Foundation/Foundation.h>
//: #import <NIMSDK/NIMSDK.h>
#import <NIMSDK/NIMSDK.h>
//: #import "UserGlobalMacro.h"
#import "UserGlobalMacro.h"

//: @interface AAAKitUtil : NSObject
@interface TypicalCenter : NSObject

//: + (NSString *)showNick:(NSString *)uid inMessage:(NIMMessage *)message;
+ (NSString *)name:(NSString *)uid dateKey:(NIMMessage *)message;

//: + (NSString *)showNick:(NSString *)uid inSession:(NIMSession *)session;
+ (NSString *)exhibit:(NSString *)uid withWill:(NIMSession *)session;

//: + (NSString *)showTime:(NSTimeInterval)msglastTime showDetail:(BOOL)showDetail;
+ (NSString *)max:(NSTimeInterval)msglastTime caseDetail:(BOOL)showDetail;

//: + (NSString *)messageTipContent:(NIMMessage *)message;
+ (NSString *)mode:(NIMMessage *)message;

//: + (NSString *)durationTextWithSeconds:(NSTimeInterval)seconds;
+ (NSString *)immaculate:(NSTimeInterval)seconds;

//: + (BOOL)canEditTeamInfo:(NIMTeamMember *)member;
+ (BOOL)at:(NIMTeamMember *)member;

//: + (BOOL)canInviteMemberToTeam:(NIMTeamMember *)member;
+ (BOOL)deviceTag:(NIMTeamMember *)member;

//: + (BOOL)canEditSuperTeamInfo:(NIMTeamMember *)member;
+ (BOOL)scale:(NIMTeamMember *)member;

//: + (BOOL)canInviteMemberToSuperTeam:(NIMTeamMember *)member;
+ (BOOL)timeTeam:(NIMTeamMember *)member;

//: @end
@end
