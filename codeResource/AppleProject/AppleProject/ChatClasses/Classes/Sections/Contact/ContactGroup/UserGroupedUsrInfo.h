// __DEBUG__
// __CLOSE_PRINT__
//
//  UserGroupedUsrInfo.h
//  NIM
//
//  Created by Xuhui on 15/3/24.
//  Copyright (c) 2015年 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import "UserContactDefines.h"
#import "UserContactDefines.h"
//: #import "AppleProjectKit.h"
#import "Indicator.h"

//: @interface NIMGroupUser:NSObject<NIMGroupMemberProtocol>
@interface NameUser:NSObject<UpProtocol>

//: @property (nonatomic,readonly) CCCKitInfo *info;
@property (nonatomic,readonly) TitleInfo *info;

//: - (instancetype)initWithUserId:(NSString *)userId;
- (instancetype)initWithAnLineId:(NSString *)userId;

//: @end
@end

//: @interface NIMGroupTeamMember:NSObject<NIMGroupMemberProtocol>
@interface WithFlush:NSObject<UpProtocol>

//: @property (nonatomic,readonly) CCCKitInfo *info;
@property (nonatomic,readonly) TitleInfo *info;

//: - (instancetype)initWithUserId:(NSString *)userId
- (instancetype)initWithCover:(NSString *)userId
                       //: session:(NIMSession *)session;
                       reply:(NIMSession *)session;

//: @end
@end


//: @interface NIMGroupTeam:NSObject<NIMGroupMemberProtocol>
@interface ShowTeam:NSObject<UpProtocol>

//: @property (nonatomic,readonly) CCCKitInfo *info;
@property (nonatomic,readonly) TitleInfo *info;

//: - (instancetype)initWithTeamId:(NSString *)teamId
- (instancetype)initWithMessage:(NSString *)teamId
                      //: teamType:(NIMKitTeamType)teamType;
                      image:(NIMKitTeamType)teamType;

//: @end
@end
