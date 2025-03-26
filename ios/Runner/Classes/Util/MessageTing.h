// __DEBUG__
// __CLOSE_PRINT__
//
//  MessageTing.h
//  NIM
//
//  Created by amao on 2017/5/4.
//  Copyright © 2017年 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import <Foundation/Foundation.h>
#import <Foundation/Foundation.h>

//: @interface NTESAVNotifier : NSObject
@interface MessageTing : NSObject
//: - (void)start:(NSString *)text;
- (void)addSuccess:(NSString *)text;
//: - (void)stop;
- (void)text;
//: @end
@end