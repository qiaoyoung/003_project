// __DEBUG__
// __CLOSE_PRINT__
//
//  NSDictionary+Jv.h
//  NIM
//
//  Created by amao on 13-7-12.
//  Copyright (c) 2013年 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import <Foundation/Foundation.h>
#import <Foundation/Foundation.h>

//: @interface NSDictionary (NTESJson)
@interface NSDictionary (Jv)
//: - (NSString *)jsonString: (NSString *)key;
- (NSString *)twine: (NSString *)key;

//: - (NSDictionary *)jsonDict: (NSString *)key;
- (NSDictionary *)jsonLikeDict: (NSString *)key;
//: - (NSArray *)jsonArray: (NSString *)key;
- (NSArray *)jsonTool: (NSString *)key;
//: - (NSArray *)jsonStringArray: (NSString *)key;
- (NSArray *)target: (NSString *)key;


//: - (BOOL)jsonBool: (NSString *)key;
- (BOOL)green: (NSString *)key;
//: - (NSInteger)jsonInteger: (NSString *)key;
- (NSInteger)app: (NSString *)key;
//: - (long long)jsonLongLong: (NSString *)key;
- (long long)message: (NSString *)key;
//: - (unsigned long long)jsonUnsignedLongLong:(NSString *)key;
- (unsigned long long)showLongish:(NSString *)key;

//: - (double)jsonDouble: (NSString *)key;
- (double)analyse: (NSString *)key;
//: @end
@end