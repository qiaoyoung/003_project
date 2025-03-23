// __DEBUG__
// __CLOSE_PRINT__
//
//  NSDictionary+Indicator.h
// Indicator
//
//  Created by chris on 2017/6/27.
//  Copyright © 2017年 NetEase. All rights reserved.
//

// __M_A_C_R_O__
//: #import <Foundation/Foundation.h>
#import <Foundation/Foundation.h>

//: @interface NSDictionary (AppleProjectKit)
@interface NSDictionary (Indicator)

//: - (NSString *)nimkit_jsonString: (NSString *)key;
- (NSString *)name: (NSString *)key;

//: - (NSDictionary *)nimkit_jsonDict: (NSString *)key;
- (NSDictionary *)textInputInsert: (NSString *)key;
//: - (NSArray *)nimkit_jsonArray: (NSString *)key;
- (NSArray *)honkyTonkArray: (NSString *)key;
//: - (NSArray *)nimkit_jsonStringArray: (NSString *)key;
- (NSArray *)video: (NSString *)key;


//: - (BOOL)nimkit_jsonBool: (NSString *)key;
- (BOOL)tabIndependent: (NSString *)key;
//: - (NSInteger)nimkit_jsonInteger: (NSString *)key;
- (NSInteger)step: (NSString *)key;
//: - (long long)nimkit_jsonLongLong: (NSString *)key;
- (long long)select: (NSString *)key;
//: - (unsigned long long)nimkit_jsonUnsignedLongLong:(NSString *)key;
- (unsigned long long)longSub:(NSString *)key;

//: - (double)nimkit_jsonDouble: (NSString *)key;
- (double)content: (NSString *)key;

//: @end
@end