// __DEBUG__
// __CLOSE_PRINT__
//
//  NSDictionaryAdditions.h
//  WeiboPad
//
//  Created by junmin liu on 10-10-6.
//  Copyright 2010 Openlab. All rights reserved.
//

// __M_A_C_R_O__
//: #import <Foundation/Foundation.h>
#import <Foundation/Foundation.h>

//: @interface NSDictionary (Additions)
@interface NSDictionary (OffAdditions)

//: - (BOOL)getBoolValueForKey:(NSString *)key defaultValue:(BOOL)defaultValue;
- (BOOL)anyDevice:(NSString *)key value:(BOOL)defaultValue;
//: - (int)getIntValueForKey:(NSString *)key defaultValue:(int)defaultValue;
- (int)unwelcome:(NSString *)key viewSize:(int)defaultValue;
//: - (float)getFloatValueForKey:(NSString*)key defaultValue:(float)defaultValue;
- (float)screenKey:(NSString*)key data:(float)defaultValue;
//: - (double)getDoubleValueForKey:(NSString*)key defaultValue:(double)defaultValue;
- (double)name:(NSString*)key red:(double)defaultValue;
//: - (long long)getLongLongValueValueForKey:(NSString *)key defaultValue:(long long)defaultValue;
- (long long)parameterValue:(NSString *)key keyTag:(long long)defaultValue;
//: - (NSString *)getStringValueForKey:(NSString *)key defaultValue:(NSString *)defaultValue;
- (NSString *)customByEmpty:(NSString *)key button:(NSString *)defaultValue;

//: - (NSDictionary*)getDictionaryForKey:(NSString*)key;
- (NSDictionary*)text:(NSString*)key;
//: - (NSArray*)getArrayForKey:(NSString*)key;
- (NSArray*)recording:(NSString*)key;
//: @end
@end

//: @interface NSDictionary (CollationAdditions)
@interface NSDictionary (HideFrom)
//: - (NSString*)getNameValue;
- (NSString*)change;
//: - (NSString*)getCodeValue;
- (NSString*)dateContent;
//: @end
@end