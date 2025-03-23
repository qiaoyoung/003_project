//
//  NSDictionary+KIAdditions.m
//  Kitalker
//
//  Created by chen on 12-11-28.
//  Copyright (c) 2012年 ibm. All rights reserved.
//

#import "NSDictionary+KIAdditions.h"

@implementation NSDictionary (KIAdditions)

- (NSString *)jsonString{
    if (!self || self.count<=0) {
        return @"";
    }
    
    NSError* error = nil;
    NSData* jsonData = [NSJSONSerialization dataWithJSONObject:self
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:&error];
    
    if (error != nil) {
        //NSLog(@"NSDictionary JSONString error: %@", [error localizedDescription]);
        return @"";
    } else {
        return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
}

- (BOOL)boolValueForKey:(id)key {
    return [[self objectForKey:key] boolValue];
}

- (int)intValueForKey:(id)key {
    return [[self objectForKey:key] intValue];
}

- (NSInteger)integerValueForKey:(id)key {
    return [[self objectForKey:key] integerValue];
}

- (float)floatValueForKey:(id)key {
    return [[self objectForKey:key] floatValue];
}

- (double)doubleValueForKey:(id)key {
    return [[self objectForKey:key] doubleValue];
}

- (NSString *)newStringValueForKey:(id)key {
    if (!self || !key) {
        return @"";
    }
    
    id value = [self objectForKey:key];
    
    if (value == nil || [[value class] isSubclassOfClass:[NSNull class]]) {
        return value = @"";
    }
    
    if ([value isKindOfClass:[NSNumber class]]) {
        return [value stringValue];
    }
    
    return value;
}

- (id)valueObjectForKey:(id)aKey{
    if (!self || !aKey) {
        return nil;
    }
    
    if ([[self objectForKey:aKey] isKindOfClass:[NSNumber class]]) {
        return [[self objectForKey:aKey] stringValue];
    }else if ([[self objectForKey:aKey] isKindOfClass:[NSNull class]] || ![self objectForKey:aKey]){
        return nil;
    }
    
    return [self objectForKey:aKey];
}

- (NSArray *)arrayValueForKey:(id)aKey{
    if (!self || !aKey) {
        return @[];
    }
    id value = [self objectForKey:aKey];
    if (value == [NSNull null] || value == nil) {
        value = @[];
    }
    if ([[self objectForKey:aKey] isKindOfClass:[NSArray class]]) {
        value = [[NSArray alloc] initWithArray:value];
    }
    return value;
}
@end
