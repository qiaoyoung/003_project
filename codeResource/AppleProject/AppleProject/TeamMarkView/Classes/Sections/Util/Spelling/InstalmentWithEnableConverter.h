// __DEBUG__
// __CLOSE_PRINT__
//
//  InstalmentWithEnableConverter.h
//  NIM
//
//  Created by amao on 10/15/13.
//  Copyright (c) 2013 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import <Foundation/Foundation.h>
#import <Foundation/Foundation.h>

//: @interface AAAPinyinConverter : NSObject
@interface InstalmentWithEnableConverter : NSObject

//: + (AAAPinyinConverter *)sharedInstance;
+ (InstalmentWithEnableConverter *)count;

//: - (NSString *)toPinyin: (NSString *)source;
- (NSString *)ticket: (NSString *)source;

//: @end
@end