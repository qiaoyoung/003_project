// __DEBUG__
// __CLOSE_PRINT__
//
//  NTESCustomSysNotiSender.h
//  NIM
//
//  Created by chris on 15/5/26.
//  Copyright (c) 2015年 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import <Foundation/Foundation.h>
#import <Foundation/Foundation.h>

//: @interface NTESCustomSysNotificationSender : NSObject
@interface UsanceTeam : NSObject

//: - (void)sendCustomContent:(NSString *)content toSession:(NIMSession *)session;
- (void)recent:(NSString *)content session:(NIMSession *)session;

//: - (void)sendTypingState:(NIMSession *)session;
- (void)withTitle:(NIMSession *)session;

//: - (void)sendCallNotification:(NIMTeam *)team
- (void)exhibitMembers:(NIMTeam *)team
                    //: roomName:(NSString *)roomName
                    textNickname:(NSString *)roomName
                     //: members:(NSArray *)members;
                     displace:(NSArray *)members;

//: @end
@end