//
//  BBBUsrInfoData.h
//  NIM
//
//  Created by Xuhui on 15/3/19.
//  Copyright (c) 2015年 Netease. All rights reserved.
//

#import "AAAContactDefines.h"
@class CCCKitInfo;

@interface AppleProjectUsrInfo : NSObject <NIMGroupMemberProtocol>

@property (nonatomic,strong) CCCKitInfo *info;

- (BOOL)isFriend;

@end
