// __DEBUG__
// __CLOSE_PRINT__
//
//  UserUsrInfoData.h
//  NIM
//
//  Created by Xuhui on 15/3/19.
//  Copyright (c) 2015年 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import "UserContactDefines.h"
#import "UserContactDefines.h"

//: @class CCCKitInfo;
@class TitleInfo;

//: @interface AppleProjectUsrInfo : NSObject <NIMGroupMemberProtocol>
@interface IconInfo : NSObject <UpProtocol>

//: @property (nonatomic,strong) CCCKitInfo *info;
@property (nonatomic,strong) TitleInfo *info;

//: - (BOOL)isFriend;
- (BOOL)showFriend;

//: @end
@end
