//
//  NSDictionaryExtend.m
//  sohunews
//
//  Created by yanchen wang on 12-5-28.
//  Copyright (c) 2012年 Sohu.com Inc. All rights reserved.
//

#import "NSDictionaryExtend.h"

@interface __NSStack : NSObject {
    NSMutableArray  *_stackArray;
}
/**
 * @desc judge whether the stack is empty
 *
 * @return TRUE if stack is empty, otherwise FALASE is returned
 */
- (BOOL) empty;
/**
 * @desc get top object in the stack
 *
 * @return nil if no object in the stack, otherwise an object
 * is returned, user should judge the return by this method
 */
- (id) top;
/**
 * @desc pop stack top object
 */
- (void) pop;
/**
 * @desc push an object to the stack
 */
- (void) push:(id)value;
@end

@implementation __NSStack
- (id) init {
    self = [super init];
    if (self) {
        _stackArray = [[NSMutableArray alloc] init];
    }
    return self;
}
/**
 * @desc judge whether the stack is empty
 *
 * @return TRUE if stack is empty, otherwise FALASE is returned
 */
- (BOOL) empty {
    return ((_stackArray == nil)||([_stackArray count] == 0));
}
/**
 * @desc get top object in the stack
 *
 * @return nil if no object in the stack, otherwise an object
 * is returned, user should judge the return by this method
 */
- (id) top {
    id value = nil;
    if (_stackArray&&[_stackArray count]) {
        value = [_stackArray lastObject];
    }
    return value;
}
/**
 * @desc pop stack top object
 */
- (void) pop {
    if (_stackArray&&[_stackArray count]) {
        [_stackArray removeLastObject];
    }
}
/**
 * @desc push an object to the stack
 */
- (void) push:(id)value {
    [_stackArray addObject:value];
}

@end

@implementation NSDictionary(Sort)

- (NSComparisonResult)sortLocalChannelWithLetter:(NSDictionary *)element
{
    NSString *letter = [self objectForKey:@"initial"];
    NSString *comparLetter = [element objectForKey:@"initial"];
    
    if (letter && comparLetter) {
        NSComparisonResult result = [letter caseInsensitiveCompare:comparLetter];
        return result;
    }else {
        return NSOrderedDescending;
    }
}

@end


@implementation NSDictionary(Extend)

- (id)objectForKey:(NSString *)key defaultObj:(id)defaultObj {
    id obj = [self objectForKey:key];
    return obj ? obj : defaultObj;
}

- (id)objectForKey:(id)aKey ofClass:(Class)aClass defaultObj:(id)defaultObj {
    id obj = [self objectForKey:aKey];
    return (obj && [obj isKindOfClass:aClass]) ? obj : defaultObj;
}

- (int)intValueForKey:(NSString *)key defaultValue:(int)defaultValue {
    id value = [self objectForKey:key];
    if (value && [value isKindOfClass:[NSString class]]) {
        return [(NSString *)value intValue];
    }else if ([[value class] isSubclassOfClass:[NSNull class]]) {
        return defaultValue;
    }
    return (value && [value isKindOfClass:[NSNumber class]]) ? [value intValue] : defaultValue;
}

- (double)doubleValueForKey:(NSString *)key defaultValue:(double)defaultValue
{
    id value = [self objectForKey:key];
    if (value && [value isKindOfClass:[NSString class]]) {
        return [(NSString *)value doubleValue];
    }else if ([[value class] isSubclassOfClass:[NSNull class]]) {
        return defaultValue;
    }
    return (value && [value isKindOfClass:[NSNumber class]]) ? [value doubleValue] : defaultValue;
}

- (float)floatValueForKey:(NSString *)key defaultValue:(float)defaultValue {
    id value = [self objectForKey:key];
    if (value && [value isKindOfClass:[NSString class]]) {
        return [(NSString *)value floatValue];
    }else if ([[value class] isSubclassOfClass:[NSNull class]]) {
        return defaultValue;
    }
    return (value && [value isKindOfClass:[NSNumber class]]) ? [value floatValue] : defaultValue;
}
- (long)longValueForKey:(NSString *)key defaultValue:(long)defaultValue {
    id value = [self objectForKey:key];
    if (value && [value isKindOfClass:[NSString class]]) {
        return [(NSString *)value longLongValue];
    }else if ([[value class] isSubclassOfClass:[NSNull class]]) {
        return defaultValue;
    }
    return (value && [value isKindOfClass:[NSNumber class]]) ? [value longValue] : defaultValue;
}

- (long long)longlongValueForKey:(NSString *)key defaultValue:(long long)defaultValue {
    id value = [self objectForKey:key];
    if (value && [value isKindOfClass:[NSString class]]) {
        return [(NSString *)value longLongValue];
    }else if ([[value class] isSubclassOfClass:[NSNull class]]) {
        return defaultValue;
    }
    return (value && [value isKindOfClass:[NSNumber class]]) ? [value longLongValue] : defaultValue;
}

- (NSString *)stringValueForKey:(NSString *)key defaultValue:(NSString *)defaultValue {
    id value = [self objectForKey:key];
    if (value && [value isKindOfClass:[NSString class]]) {
        return value;
    }else if(value && [value isKindOfClass:[NSNumber class]]){
        return [value stringValue];
    }else if ([[value class] isSubclassOfClass:[NSNull class]]) {
        return defaultValue;
    }else{
        return defaultValue;
    }
}

- (NSArray *)arrayValueForKey:(NSString *)key defaultValue:(NSArray *)defaultValue {
    id value = [self objectForKey:key];
    return (value && [value isKindOfClass:[NSArray class]]) ? value : defaultValue;
}

- (NSDictionary *)dictionaryValueForKey:(NSString *)key defalutValue:(NSDictionary *)defaultValue {
    id value = [self objectForKey:key];
    return (value && [value isKindOfClass:[NSDictionary class]]) ? value : defaultValue;
}


- (NSArray*) toArray {
    NSMutableArray *entities = [[NSMutableArray alloc] initWithCapacity:[self count]];
    NSEnumerator *enumerator = [self objectEnumerator];
    id value;
    while ((value = [enumerator nextObject])) {
        /* code that acts on the dictionary‚Äôs values */
        [entities addObject:value];
    }
    return entities;
}
- (NSString*) toXMLString {
    NSMutableString *xmlString = [[NSMutableString alloc] initWithString:@"<?xml version=\"1.0\" encoding=\"utf-8\"?>"];
    __NSStack *stack = [[__NSStack alloc] init];
    NSArray  *keys = nil;
    NSString *key  = nil;
    NSObject *value    = nil;
    NSObject *subvalue = nil;
    [stack push:self];
    while (![stack empty]) {
        value = [stack top];
        [stack pop];
        if (value) {
            if ([value isKindOfClass:[NSString class]]) {
                [xmlString appendFormat:@"</%@>", value];
            }
            else if([value isKindOfClass:[NSDictionary class]]) {
                keys = [(NSDictionary*)value allKeys];
                for (key in keys) {
                    subvalue = [(NSDictionary*)value objectForKey:key];
                    if ([subvalue isKindOfClass:[NSDictionary class]]) {
                        [xmlString appendFormat:@"<%@>", key];
                        [stack push:key];
                        [stack push:subvalue];
                    }
                    else if([subvalue isKindOfClass:[NSString class]]) {
                        [xmlString appendFormat:@"<%@>%@</%@>", key, subvalue, key];
                    }
                }
            }
        }
    }
    return xmlString;
}

- (NSString *)toUrlString {
    return [self mutableUrlString];
}

- (NSMutableString *)mutableUrlString {
    NSMutableString *str = [NSMutableString stringWithCapacity:32];
    
    for (id key in self.allKeys) {
        if ([key isKindOfClass:[NSString class]]) {
            continue;
        }
        [str appendFormat:@"&%@=%@", key, [self objectForKey:key]];
    }
    
    return str;
}

- (NSString *)toQueryString {
    NSMutableArray *pairs = [NSMutableArray array];
    for (NSString *key in [self keyEnumerator]) {
      NSString *value = [self objectForKey:key];
      NSString *pair = [NSString stringWithFormat:@"%@=%@", key, value];
      [pairs addObject:pair];
    }
    NSString *params = [pairs componentsJoinedByString:@"&"];
    return params;
}

- (NSString *)translateDictionaryToJsonString {
    NSError *parseError = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:&parseError];
    
    if (nil == parseError && jsonData && jsonData.length > 0 && ![jsonData isKindOfClass:[NSNull class]]) {
        return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding] ;
    } else {
        return nil;
    }
}


@end
