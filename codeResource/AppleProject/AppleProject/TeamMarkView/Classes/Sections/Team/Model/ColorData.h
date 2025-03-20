// __DEBUG__
// __CLOSE_PRINT__
//
//  TeamInfoData.h
//  NIM
//
//  Created by chris on 15/6/1.
//  Copyright (c) 2015年 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import <Foundation/Foundation.h>
#import <Foundation/Foundation.h>
//: #import <NIMSDK/NIMSDK.h>
#import <NIMSDK/NIMSDK.h>
//: #import "UserUsrInfoData.h"
#import "UserUsrInfoData.h"

//: @interface BBBTeamInfoData : NSObject<NIMGroupMemberProtocol>
@interface ColorData : NSObject<UpProtocol>

//: @property (nonatomic, copy) NSString *teamId;
@property (nonatomic, copy) NSString *teamId;
//: @property (nonatomic, copy) NSString *iconId;
@property (nonatomic, copy) NSString *iconId;
//: @property (nonatomic, copy) NSString *teamName;
@property (nonatomic, copy) NSString *teamName;


//: - (instancetype)initWithTeam:(NIMTeam *)team;
- (instancetype)initWithDomain:(NIMTeam *)team;

//: @end
@end
