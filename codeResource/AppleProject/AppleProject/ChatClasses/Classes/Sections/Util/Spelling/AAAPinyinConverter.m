//
//  AAAPinyinConverter.m
//  NIM
//
//  Created by amao on 10/15/13.
//  Copyright (c) 2013 Netease. All rights reserved.
//

#import "AAAPinyinConverter.h"

@interface AAAPinyinConverter ()
{
    int     *_codeIndex;
    char    *_pinyin;
    BOOL    _inited;
}
@end

@implementation AAAPinyinConverter
+ (AAAPinyinConverter *)sharedInstance
{
    static AAAPinyinConverter *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[AAAPinyinConverter alloc] init];
    });
    return instance;
}

- (NSString *)toPinyin: (NSString *)source
{
    if ([source length] == 0)
    {
        return nil;
    }
    NSMutableString *mutableString = [NSMutableString stringWithString:source];
    CFStringTransform((CFMutableStringRef)mutableString, NULL, kCFStringTransformToLatin, false);
    mutableString = (NSMutableString *)[mutableString stringByFoldingWithOptions:NSDiacriticInsensitiveSearch locale:[NSLocale currentLocale]];
    return [mutableString stringByReplacingOccurrencesOfString:@"'" withString:@""];
}




@end
