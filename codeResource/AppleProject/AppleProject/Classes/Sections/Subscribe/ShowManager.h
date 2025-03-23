// __DEBUG__
// __CLOSE_PRINT__
//
//  ShowManager.h
//  NIM
//
//  Created by chris on 2017/4/5.
//  Copyright © 2017年 Netease. All rights reserved.
//

// __M_A_C_R_O__

//: @interface NTESSubscribeManager : NSObject
@interface ShowManager : NSObject

//: + (instancetype)sharedManager;
+ (instancetype)error;

//: - (void)start;
- (void)reply;

//: - (NSDictionary<NIMSubscribeEvent *, NSString *> *)eventsForType:(NSInteger)type;
- (NSDictionary<NIMSubscribeEvent *, NSString *> *)unwelcome:(NSInteger)type;

//: - (void)subscribeTempUserOnlineState:(NSString *)userId;
- (void)getToGrips:(NSString *)userId;

//: - (void)unsubscribeTempUserOnlineState:(NSString *)userId;
- (void)place:(NSString *)userId;

//: @end
@end