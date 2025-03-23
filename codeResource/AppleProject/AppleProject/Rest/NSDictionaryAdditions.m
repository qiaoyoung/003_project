
#import <Foundation/Foundation.h>

NSString *StringFromPollData(Byte *data);


//: name
Byte str_compriseText[] = {57, 4, 5, 34, 209, 101, 109, 97, 110, 151};


//: code
Byte str_questionBareTitle[] = {35, 4, 3, 101, 100, 111, 99, 29};

// __DEBUG__
// __CLOSE_PRINT__
//
//  NSDictionaryAdditions.m
//  WeiboPad
//
//  Created by junmin liu on 10-10-6.
//  Copyright 2010 Openlab. All rights reserved.
//

// __M_A_C_R_O__
//: #import "NSDictionaryAdditions.h"
#import "NSDictionaryAdditions.h"

//: @implementation NSDictionary (Additions)
@implementation NSDictionary (OffAdditions)

//: - (BOOL)getBoolValueForKey:(NSString *)key defaultValue:(BOOL)defaultValue {
- (BOOL)anyDevice:(NSString *)key value:(BOOL)defaultValue {
    //: id tmpValue = [self objectForKey:key];
    id tmpValue = [self objectForKey:key];

    //: if (tmpValue == nil || tmpValue == [NSNull null]) {
    if (tmpValue == nil || tmpValue == [NSNull null]) {
        //: return defaultValue;
        return defaultValue;
    }

    //: if ([tmpValue isKindOfClass:[NSNumber class]]) {
    if ([tmpValue isKindOfClass:[NSNumber class]]) {
        //: return [tmpValue boolValue];
        return [tmpValue boolValue];
    //: } else {
    } else {
        //: @try {
        @try {
            //: return [tmpValue boolValue];
            return [tmpValue boolValue];
        }
        //: @catch (NSException *exception) {
        @catch (NSException *exception) {
//            DLog(@"getBoolValueForKey : %@",key);
//            DLog(@"tmpValue : %@",tmpValue);
            //: return defaultValue;
            return defaultValue;
        }
    }
}

//: - (int)getIntValueForKey:(NSString *)key defaultValue:(int)defaultValue {
- (int)unwelcome:(NSString *)key viewSize:(int)defaultValue {
    //: id tmpValue = [self objectForKey:key];
    id tmpValue = [self objectForKey:key];

    //: if (tmpValue == nil || tmpValue == [NSNull null]) {
    if (tmpValue == nil || tmpValue == [NSNull null]) {
        //: return defaultValue;
        return defaultValue;
    }

    //: if ([tmpValue isKindOfClass:[NSNumber class]]) {
    if ([tmpValue isKindOfClass:[NSNumber class]]) {
        //: return [tmpValue intValue];
        return [tmpValue intValue];
    //: } else {
    } else {
        //: @try {
        @try {
            //: return [tmpValue intValue];
            return [tmpValue intValue];
        }
        //: @catch (NSException *exception) {
        @catch (NSException *exception) {
//            DLog(@"getIntValueForKey : %@",key);
//            DLog(@"tmpValue : %@",tmpValue);
            //: return defaultValue;
            return defaultValue;
        }
    }
}

//: - (float)getFloatValueForKey:(NSString *)key defaultValue:(float)defaultValue {
- (float)screenKey:(NSString *)key data:(float)defaultValue {
    //: id tmpValue = [self objectForKey:key];
    id tmpValue = [self objectForKey:key];

    //: if (tmpValue == nil || tmpValue == [NSNull null]) {
    if (tmpValue == nil || tmpValue == [NSNull null]) {
        //: return defaultValue;
        return defaultValue;
    }

    //: if ([tmpValue isKindOfClass:[NSNumber class]]) {
    if ([tmpValue isKindOfClass:[NSNumber class]]) {
        //: return [tmpValue floatValue];
        return [tmpValue floatValue];
    //: } else {
    } else {
        //: @try {
        @try {
            //: return [tmpValue floatValue];
            return [tmpValue floatValue];
        }
        //: @catch (NSException *exception) {
        @catch (NSException *exception) {
//            DLog(@"getFloatValueForKey : %@",key);
//            DLog(@"tmpValue : %@",tmpValue);
            //: return defaultValue;
            return defaultValue;
        }
    }
}

//: - (double)getDoubleValueForKey:(NSString*)key defaultValue:(double)defaultValue {
- (double)name:(NSString*)key red:(double)defaultValue {
    //: id tmpValue = [self objectForKey:key];
    id tmpValue = [self objectForKey:key];

    //: if (tmpValue == nil || tmpValue == [NSNull null]) {
    if (tmpValue == nil || tmpValue == [NSNull null]) {
        //: return defaultValue;
        return defaultValue;
    }

    //: if ([tmpValue isKindOfClass:[NSNumber class]]) {
    if ([tmpValue isKindOfClass:[NSNumber class]]) {
        //: return [tmpValue doubleValue];
        return [tmpValue doubleValue];
    //: } else {
    } else {
        //: @try {
        @try {
            //: return [tmpValue doubleValue];
            return [tmpValue doubleValue];
        }
        //: @catch (NSException *exception) {
        @catch (NSException *exception) {
//            DLog(@"getDoubleValueForKey : %@",key);
//            DLog(@"tmpValue : %@",tmpValue);
            //: return defaultValue;
            return defaultValue;
        }
    }
}

//: - (long long)getLongLongValueValueForKey:(NSString *)key defaultValue:(long long)defaultValue {
- (long long)parameterValue:(NSString *)key keyTag:(long long)defaultValue {
    //: id tmpValue = [self objectForKey:key];
    id tmpValue = [self objectForKey:key];

    //: if (tmpValue == nil || tmpValue == [NSNull null]) {
    if (tmpValue == nil || tmpValue == [NSNull null]) {
        //: return defaultValue;
        return defaultValue;
    }

    //: if ([tmpValue isKindOfClass:[NSNumber class]]) {
    if ([tmpValue isKindOfClass:[NSNumber class]]) {
        //: return [tmpValue longLongValue];
        return [tmpValue longLongValue];
    //: } else {
    } else {
        //: @try {
        @try {
            //: return [tmpValue longLongValue];
            return [tmpValue longLongValue];
        }
        //: @catch (NSException *exception) {
        @catch (NSException *exception) {
//            DLog(@"getLongLongValueValueForKey : %@",key);
//            DLog(@"tmpValue : %@",tmpValue);
            //: return defaultValue;
            return defaultValue;
        }
    }
}

//: - (NSString *)getStringValueForKey:(NSString *)key defaultValue:(NSString *)defaultValue {
- (NSString *)customByEmpty:(NSString *)key button:(NSString *)defaultValue {
    //: id tmpValue = [self objectForKey:key];
    id tmpValue = [self objectForKey:key];

    //: if (tmpValue == nil || tmpValue == [NSNull null]) {
    if (tmpValue == nil || tmpValue == [NSNull null]) {
        //: return defaultValue;
        return defaultValue;
    }

    //: if ([tmpValue isKindOfClass:[NSString class]]) {
    if ([tmpValue isKindOfClass:[NSString class]]) {
        //: return [NSString stringWithString:tmpValue];
        return [NSString stringWithString:tmpValue];
    //: } else {
    } else {
        //: @try {
        @try {
            //: return [NSString stringWithFormat:@"%@",tmpValue];
            return [NSString stringWithFormat:@"%@",tmpValue];
        }
        //: @catch (NSException *exception) {
        @catch (NSException *exception) {
//            DLog(@"getStringValueForKey : %@",key);
//            DLog(@"tmpValue : %@",tmpValue);
            //: return defaultValue;
            return defaultValue;
        }
    }
}

//: - (NSDictionary*)getDictionaryForKey:(NSString*)key {
- (NSDictionary*)text:(NSString*)key {
    //: id tmpValue = [self objectForKey:key];
    id tmpValue = [self objectForKey:key];
    //: if ([tmpValue isKindOfClass:[NSDictionary class]]) {
    if ([tmpValue isKindOfClass:[NSDictionary class]]) {
        //: return tmpValue;
        return tmpValue;
    //: } else {
    } else {
        //: return nil;
        return nil;
    }
}

//: - (NSArray*)getArrayForKey:(NSString*)key {
- (NSArray*)recording:(NSString*)key {
    //: id tmpValue = [self objectForKey:key];
    id tmpValue = [self objectForKey:key];
    //: if ([tmpValue isKindOfClass:[NSArray class]]) {
    if ([tmpValue isKindOfClass:[NSArray class]]) {
        //: return tmpValue;
        return tmpValue;
    //: } else {
    } else {
        //: return nil;
        return nil;
    }
}

//: @end
@end


//: @implementation NSDictionary (CollationAdditions)
@implementation NSDictionary (HideFrom)
//: - (NSString*)getNameValue {
- (NSString*)change {
    //: return [self getStringValueForKey:@"name" defaultValue:@""];
    return [self customByEmpty:StringFromPollData(str_compriseText) button:@""];
}
//: - (NSString*)getCodeValue {
- (NSString*)dateContent {
    //: return [self getStringValueForKey:@"code" defaultValue:@""];
    return [self customByEmpty:StringFromPollData(str_questionBareTitle) button:@""];
}
//: @end
@end

Byte * PollDataToCache(Byte *data) {
    int mattPersonality = data[0];
    int accretionary = data[1];
    int well = data[2];
    if (!mattPersonality) return data + well;
    for (int i = 0; i < accretionary / 2; i++) {
        int begin = well + i;
        int end = well + accretionary - i - 1;
        Byte temp = data[begin];
        data[begin] = data[end];
        data[end] = temp;
    }
    data[0] = 0;
    data[well + accretionary] = 0;
    return data + well;
}

NSString *StringFromPollData(Byte *data) {
    return [NSString stringWithUTF8String:(char *)PollDataToCache(data)];
}  
