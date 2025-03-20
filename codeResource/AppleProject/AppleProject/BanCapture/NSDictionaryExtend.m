
#import <Foundation/Foundation.h>
typedef struct {
    Byte cellInstall;
    Byte *cellThough;
    unsigned int scanPowder;
    bool rod;
	int gestureTan;
} PillData;

NSString *StringFromPillData(PillData *data);


//: <?xml version=\"1.0\" encoding=\"utf-8\"?>
PillData str_revValue = (PillData){101, (Byte []){89, 90, 29, 8, 9, 69, 19, 0, 23, 22, 12, 10, 11, 88, 71, 84, 75, 85, 71, 69, 0, 11, 6, 10, 1, 12, 11, 2, 88, 71, 16, 17, 3, 72, 93, 71, 90, 91, 228}, 38, false, 18};


//: initial
PillData str_organizeLeyName = (PillData){47, (Byte []){70, 65, 70, 91, 70, 78, 67, 32}, 7, false, 115};

// __DEBUG__
// __CLOSE_PRINT__
//
//  NSDictionaryExtend.m
//  sohunews
//
//  Created by yanchen wang on 12-5-28.
//  Copyright (c) 2012年 Sohu.com Inc. All rights reserved.
//

// __M_A_C_R_O__
//: #import "NSDictionaryExtend.h"
#import "NSDictionaryExtend.h"

//: @interface __NSStack : NSObject {
@interface DisableShow : NSObject {
    //: NSMutableArray *_stackArray;
    NSMutableArray *_stackArray;
}
/**
 * @desc judge whether the stack is empty
 *
 * @return TRUE if stack is empty, otherwise FALASE is returned
 */
//: - (BOOL) empty;
- (BOOL) view;
/**
 * @desc get top object in the stack
 *
 * @return nil if no object in the stack, otherwise an object
 * is returned, user should judge the return by this method
 */
//: - (id) top;
- (id) message;
/**
 * @desc pop stack top object
 */
//: - (void) pop;
- (void) buttonPop;
/**
 * @desc push an object to the stack
 */
//: - (void) push:(id)value;
- (void) view:(id)value;
//: @end
@end

//: @implementation __NSStack
@implementation DisableShow
//: - (id) init {
- (id) init {
    //: self = [super init];
    self = [super init];
    //: if (self) {
    if (self) {
        //: _stackArray = [[NSMutableArray alloc] init];
        _stackArray = [[NSMutableArray alloc] init];
    }
    //: return self;
    return self;
}
/**
 * @desc judge whether the stack is empty
 *
 * @return TRUE if stack is empty, otherwise FALASE is returned
 */
//: - (BOOL) empty {
- (BOOL) view {
    //: return ((_stackArray == nil)||([_stackArray count] == 0));
    return ((_stackArray == nil)||([_stackArray count] == 0));
}
/**
 * @desc get top object in the stack
 *
 * @return nil if no object in the stack, otherwise an object
 * is returned, user should judge the return by this method
 */
//: - (id) top {
- (id) message {
    //: id value = nil;
    id value = nil;
    //: if (_stackArray&&[_stackArray count]) {
    if (_stackArray&&[_stackArray count]) {
        //: value = [_stackArray lastObject];
        value = [_stackArray lastObject];
    }
    //: return value;
    return value;
}
/**
 * @desc pop stack top object
 */
//: - (void) pop {
- (void) buttonPop {
    //: if (_stackArray&&[_stackArray count]) {
    if (_stackArray&&[_stackArray count]) {
        //: [_stackArray removeLastObject];
        [_stackArray removeLastObject];
    }
}
/**
 * @desc push an object to the stack
 */
//: - (void) push:(id)value {
- (void) view:(id)value {
    //: [_stackArray addObject:value];
    [_stackArray addObject:value];
}

//: @end
@end

//: @implementation NSDictionary(Sort)
@implementation NSDictionary(Sort)

//: - (NSComparisonResult)sortLocalChannelWithLetter:(NSDictionary *)element
- (NSComparisonResult)tapLocal:(NSDictionary *)element
{
    //: NSString *letter = [self objectForKey:@"initial"];
    NSString *letter = [self objectForKey:StringFromPillData(&str_organizeLeyName)];
    //: NSString *comparLetter = [element objectForKey:@"initial"];
    NSString *comparLetter = [element objectForKey:StringFromPillData(&str_organizeLeyName)];

    //: if (letter && comparLetter) {
    if (letter && comparLetter) {
        //: NSComparisonResult result = [letter caseInsensitiveCompare:comparLetter];
        NSComparisonResult result = [letter caseInsensitiveCompare:comparLetter];
        //: return result;
        return result;
    //: }else {
    }else {
        //: return NSOrderedDescending;
        return NSOrderedDescending;
    }
}

//: @end
@end


//: @implementation NSDictionary(Extend)
@implementation NSDictionary(Extend)

//: - (id)objectForKey:(NSString *)key defaultObj:(id)defaultObj {
- (id)back:(NSString *)key ammunition:(id)defaultObj {
    //: id obj = [self objectForKey:key];
    id obj = [self objectForKey:key];
    //: return obj ? obj : defaultObj;
    return obj ? obj : defaultObj;
}

//: - (id)objectForKey:(id)aKey ofClass:(Class)aClass defaultObj:(id)defaultObj {
- (id)barCenterLength:(id)aKey name:(Class)aClass searchBy:(id)defaultObj {
    //: id obj = [self objectForKey:aKey];
    id obj = [self objectForKey:aKey];
    //: return (obj && [obj isKindOfClass:aClass]) ? obj : defaultObj;
    return (obj && [obj isKindOfClass:aClass]) ? obj : defaultObj;
}

//: - (int)intValueForKey:(NSString *)key defaultValue:(int)defaultValue {
- (int)insideValue:(NSString *)key dipTotalo:(int)defaultValue {
    //: id value = [self objectForKey:key];
    id value = [self objectForKey:key];
    //: if (value && [value isKindOfClass:[NSString class]]) {
    if (value && [value isKindOfClass:[NSString class]]) {
        //: return [(NSString *)value intValue];
        return [(NSString *)value intValue];
    //: }else if ([[value class] isSubclassOfClass:[NSNull class]]) {
    }else if ([[value class] isSubclassOfClass:[NSNull class]]) {
        //: return defaultValue;
        return defaultValue;
    }
    //: return (value && [value isKindOfClass:[NSNumber class]]) ? [value intValue] : defaultValue;
    return (value && [value isKindOfClass:[NSNumber class]]) ? [value intValue] : defaultValue;
}

//: - (double)doubleValueForKey:(NSString *)key defaultValue:(double)defaultValue
- (double)on:(NSString *)key nearLoad:(double)defaultValue
{
    //: id value = [self objectForKey:key];
    id value = [self objectForKey:key];
    //: if (value && [value isKindOfClass:[NSString class]]) {
    if (value && [value isKindOfClass:[NSString class]]) {
        //: return [(NSString *)value doubleValue];
        return [(NSString *)value doubleValue];
    //: }else if ([[value class] isSubclassOfClass:[NSNull class]]) {
    }else if ([[value class] isSubclassOfClass:[NSNull class]]) {
        //: return defaultValue;
        return defaultValue;
    }
    //: return (value && [value isKindOfClass:[NSNumber class]]) ? [value doubleValue] : defaultValue;
    return (value && [value isKindOfClass:[NSNumber class]]) ? [value doubleValue] : defaultValue;
}

//: - (float)floatValueForKey:(NSString *)key defaultValue:(float)defaultValue {
- (float)completeCrop:(NSString *)key with:(float)defaultValue {
    //: id value = [self objectForKey:key];
    id value = [self objectForKey:key];
    //: if (value && [value isKindOfClass:[NSString class]]) {
    if (value && [value isKindOfClass:[NSString class]]) {
        //: return [(NSString *)value floatValue];
        return [(NSString *)value floatValue];
    //: }else if ([[value class] isSubclassOfClass:[NSNull class]]) {
    }else if ([[value class] isSubclassOfClass:[NSNull class]]) {
        //: return defaultValue;
        return defaultValue;
    }
    //: return (value && [value isKindOfClass:[NSNumber class]]) ? [value floatValue] : defaultValue;
    return (value && [value isKindOfClass:[NSNumber class]]) ? [value floatValue] : defaultValue;
}
//: - (long)longValueForKey:(NSString *)key defaultValue:(long)defaultValue {
- (long)account:(NSString *)key preserveValue:(long)defaultValue {
    //: id value = [self objectForKey:key];
    id value = [self objectForKey:key];
    //: if (value && [value isKindOfClass:[NSString class]]) {
    if (value && [value isKindOfClass:[NSString class]]) {
        //: return [(NSString *)value longLongValue];
        return [(NSString *)value longLongValue];
    //: }else if ([[value class] isSubclassOfClass:[NSNull class]]) {
    }else if ([[value class] isSubclassOfClass:[NSNull class]]) {
        //: return defaultValue;
        return defaultValue;
    }
    //: return (value && [value isKindOfClass:[NSNumber class]]) ? [value longValue] : defaultValue;
    return (value && [value isKindOfClass:[NSNumber class]]) ? [value longValue] : defaultValue;
}

//: - (long long)longlongValueForKey:(NSString *)key defaultValue:(long long)defaultValue {
- (long long)remove:(NSString *)key tip:(long long)defaultValue {
    //: id value = [self objectForKey:key];
    id value = [self objectForKey:key];
    //: if (value && [value isKindOfClass:[NSString class]]) {
    if (value && [value isKindOfClass:[NSString class]]) {
        //: return [(NSString *)value longLongValue];
        return [(NSString *)value longLongValue];
    //: }else if ([[value class] isSubclassOfClass:[NSNull class]]) {
    }else if ([[value class] isSubclassOfClass:[NSNull class]]) {
        //: return defaultValue;
        return defaultValue;
    }
    //: return (value && [value isKindOfClass:[NSNumber class]]) ? [value longLongValue] : defaultValue;
    return (value && [value isKindOfClass:[NSNumber class]]) ? [value longLongValue] : defaultValue;
}

//: - (NSString *)stringValueForKey:(NSString *)key defaultValue:(NSString *)defaultValue {
- (NSString *)value:(NSString *)key withTing:(NSString *)defaultValue {
    //: id value = [self objectForKey:key];
    id value = [self objectForKey:key];
    //: if (value && [value isKindOfClass:[NSString class]]) {
    if (value && [value isKindOfClass:[NSString class]]) {
        //: return value;
        return value;
    //: }else if(value && [value isKindOfClass:[NSNumber class]]){
    }else if(value && [value isKindOfClass:[NSNumber class]]){
        //: return [value stringValue];
        return [value stringValue];
    //: }else if ([[value class] isSubclassOfClass:[NSNull class]]) {
    }else if ([[value class] isSubclassOfClass:[NSNull class]]) {
        //: return defaultValue;
        return defaultValue;
    //: }else{
    }else{
        //: return defaultValue;
        return defaultValue;
    }
}

//: - (NSArray *)arrayValueForKey:(NSString *)key defaultValue:(NSArray *)defaultValue {
- (NSArray *)spectrum:(NSString *)key can:(NSArray *)defaultValue {
    //: id value = [self objectForKey:key];
    id value = [self objectForKey:key];
    //: return (value && [value isKindOfClass:[NSArray class]]) ? value : defaultValue;
    return (value && [value isKindOfClass:[NSArray class]]) ? value : defaultValue;
}

//: - (NSDictionary *)dictionaryValueForKey:(NSString *)key defalutValue:(NSDictionary *)defaultValue {
- (NSDictionary *)dateValue:(NSString *)key ting:(NSDictionary *)defaultValue {
    //: id value = [self objectForKey:key];
    id value = [self objectForKey:key];
    //: return (value && [value isKindOfClass:[NSDictionary class]]) ? value : defaultValue;
    return (value && [value isKindOfClass:[NSDictionary class]]) ? value : defaultValue;
}


//: - (NSArray*) toArray {
- (NSArray*) scarletArray {
    //: NSMutableArray *entities = [[NSMutableArray alloc] initWithCapacity:[self count]];
    NSMutableArray *entities = [[NSMutableArray alloc] initWithCapacity:[self count]];
    //: NSEnumerator *enumerator = [self objectEnumerator];
    NSEnumerator *enumerator = [self objectEnumerator];
    //: id value;
    id value;
    //: while ((value = [enumerator nextObject])) {
    while ((value = [enumerator nextObject])) {
        /* code that acts on the dictionary‚Äôs values */
        //: [entities addObject:value];
        [entities addObject:value];
    }
    //: return entities;
    return entities;
}
//: - (NSString*) toXMLString {
- (NSString*) encounterName {
    //: NSMutableString *xmlString = [[NSMutableString alloc] initWithString:@"<?xml version=\"1.0\" encoding=\"utf-8\"?>"];
    NSMutableString *xmlString = [[NSMutableString alloc] initWithString:StringFromPillData(&str_revValue)];
    //: __NSStack *stack = [[__NSStack alloc] init];
    DisableShow *stack = [[DisableShow alloc] init];
    //: NSArray *keys = nil;
    NSArray *keys = nil;
    //: NSString *key = nil;
    NSString *key = nil;
    //: NSObject *value = nil;
    NSObject *value = nil;
    //: NSObject *subvalue = nil;
    NSObject *subvalue = nil;
    //: [stack push:self];
    [stack view:self];
    //: while (![stack empty]) {
    while (![stack view]) {
        //: value = [stack top];
        value = [stack message];
        //: [stack pop];
        [stack buttonPop];
        //: if (value) {
        if (value) {
            //: if ([value isKindOfClass:[NSString class]]) {
            if ([value isKindOfClass:[NSString class]]) {
                //: [xmlString appendFormat:@"</%@>", value];
                [xmlString appendFormat:@"</%@>", value];
            }
            //: else if([value isKindOfClass:[NSDictionary class]]) {
            else if([value isKindOfClass:[NSDictionary class]]) {
                //: keys = [(NSDictionary*)value allKeys];
                keys = [(NSDictionary*)value allKeys];
                //: for (key in keys) {
                for (key in keys) {
                    //: subvalue = [(NSDictionary*)value objectForKey:key];
                    subvalue = [(NSDictionary*)value objectForKey:key];
                    //: if ([subvalue isKindOfClass:[NSDictionary class]]) {
                    if ([subvalue isKindOfClass:[NSDictionary class]]) {
                        //: [xmlString appendFormat:@"<%@>", key];
                        [xmlString appendFormat:@"<%@>", key];
                        //: [stack push:key];
                        [stack view:key];
                        //: [stack push:subvalue];
                        [stack view:subvalue];
                    }
                    //: else if([subvalue isKindOfClass:[NSString class]]) {
                    else if([subvalue isKindOfClass:[NSString class]]) {
                        //: [xmlString appendFormat:@"<%@>%@</%@>", key, subvalue, key];
                        [xmlString appendFormat:@"<%@>%@</%@>", key, subvalue, key];
                    }
                }
            }
        }
    }
    //: return xmlString;
    return xmlString;
}

//: - (NSString *)toUrlString {
- (NSString *)on {
    //: return [self mutableUrlString];
    return [self mutableUrlString];
}

//: - (NSMutableString *)mutableUrlString {
- (NSMutableString *)mutableUrlString {
    //: NSMutableString *str = [NSMutableString stringWithCapacity:32];
    NSMutableString *str = [NSMutableString stringWithCapacity:32];

    //: for (id key in self.allKeys) {
    for (id key in self.allKeys) {
        //: if ([key isKindOfClass:[NSString class]]) {
        if ([key isKindOfClass:[NSString class]]) {
            //: continue;
            continue;
        }
        //: [str appendFormat:@"&%@=%@", key, [self objectForKey:key]];
        [str appendFormat:@"&%@=%@", key, [self objectForKey:key]];
    }

    //: return str;
    return str;
}

//: - (NSString *)toQueryString {
- (NSString *)overToName {
    //: NSMutableArray *pairs = [NSMutableArray array];
    NSMutableArray *pairs = [NSMutableArray array];
    //: for (NSString *key in [self keyEnumerator]) {
    for (NSString *key in [self keyEnumerator]) {
      //: NSString *value = [self objectForKey:key];
      NSString *value = [self objectForKey:key];
      //: NSString *pair = [NSString stringWithFormat:@"%@=%@", key, value];
      NSString *pair = [NSString stringWithFormat:@"%@=%@", key, value];
      //: [pairs addObject:pair];
      [pairs addObject:pair];
    }
    //: NSString *params = [pairs componentsJoinedByString:@"&"];
    NSString *params = [pairs componentsJoinedByString:@"&"];
    //: return params;
    return params;
}

//: - (NSString *)translateDictionaryToJsonString {
- (NSString *)digitizer {
    //: NSError *parseError = nil;
    NSError *parseError = nil;
    //: NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:&parseError];
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:&parseError];

    //: if (nil == parseError && jsonData && jsonData.length > 0 && ![jsonData isKindOfClass:[NSNull class]]) {
    if (nil == parseError && jsonData && jsonData.length > 0 && ![jsonData isKindOfClass:[NSNull class]]) {
        //: return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding] ;
        return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding] ;
    //: } else {
    } else {
        //: return nil;
        return nil;
    }
}


//: @end
@end

Byte *PillDataToByte(PillData *data) {
    if (data->rod) return data->cellThough;
    for (int i = 0; i < data->scanPowder; i++) {
        data->cellThough[i] ^= data->cellInstall;
    }
    data->cellThough[data->scanPowder] = 0;
    data->rod = true;
	if (data->scanPowder >= 1) {
		data->gestureTan = data->cellThough[0];
	}
    return data->cellThough;
}

NSString *StringFromPillData(PillData *data) {
    return [NSString stringWithUTF8String:(char *)PillDataToByte(data)];
}
