// __DEBUG__
// __CLOSE_PRINT__
//
//  ContainerName.h
// Indicator
//
//  Created by chris on 16/6/13.
//  Copyright © 2016年 NetEase. All rights reserved.
//

// __M_A_C_R_O__
//: #import <Foundation/Foundation.h>
#import <Foundation/Foundation.h>
//: #import <NIMSDK/NIMSDK.h>
#import <NIMSDK/NIMSDK.h>
//: #import "AAAKitTimerHolder.h"
#import "ToiletKitHolder.h"

//: @class NIMKitFirerInfo;
@class TotalernationalityText;

//: @interface BBBKitNotificationFirer : NSObject<AAAKitTimerHolderDelegate>
@interface ContainerName : NSObject<HolderAddDelegate>

//: @property (nonatomic,strong) NSMutableDictionary *cachedInfo;
@property (nonatomic,strong) NSMutableDictionary *cachedInfo;

//: @property (nonatomic,strong) AAAKitTimerHolder *timer;
@property (nonatomic,strong) ToiletKitHolder *timer;

//: @property (nonatomic,assign) NSTimeInterval timeInterval;
@property (nonatomic,assign) NSTimeInterval timeInterval;

//: - (void)addFireInfo:(NIMKitFirerInfo *)info;
- (void)info:(TotalernationalityText *)info;

//: @end
@end


//: @interface NIMKitFirerInfo : NSObject
@interface TotalernationalityText : NSObject

//: @property (nonatomic,strong) NIMSession *session;
@property (nonatomic,strong) NIMSession *session;

//: @property (nonatomic,copy) NSString *notificationName;
@property (nonatomic,copy) NSString *notificationName;

//: - (NSObject *)fireObject;
- (NSObject *)replySuccess;

//: - (NSString *)saveIdentity;
- (NSString *)identityLoad;

//: @end
@end