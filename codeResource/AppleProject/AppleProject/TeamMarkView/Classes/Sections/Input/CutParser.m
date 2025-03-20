
#import <Foundation/Foundation.h>
typedef struct {
    Byte valueCollection;
    Byte *nearOft;
    unsigned int hijab;
    bool workout;
} StatuteData;

NSString *StringFromStatuteData(StatuteData *data);


//: \\[[a-zA-Z0-9\\u4e00-\\u9fa5]+\\]
StatuteData str_radTitle = (StatuteData){12, (Byte []){80, 87, 87, 109, 33, 118, 77, 33, 86, 60, 33, 53, 80, 121, 56, 105, 60, 60, 33, 80, 121, 53, 106, 109, 57, 81, 39, 80, 81, 162}, 29, false};

// __DEBUG__
// __CLOSE_PRINT__
//
//  NIMEmoticonParser.m
// Indicator
//
//  Created by chris.
//  Copyright (c) 2015 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import "AAAInputEmoticonParser.h"
#import "CutParser.h"
//: #import "AAAInputEmoticonManager.h"
#import "DataOf.h"

//: @implementation NIMInputTextToken
@implementation NameToken
//: @end
@end

//: @interface AAAInputEmoticonParser ()
@interface CutParser ()
//: @property (nonatomic,strong) NSCache *tokens;
@property (nonatomic,strong) NSCache *tokens;
//: @end
@end


//: @implementation AAAInputEmoticonParser
@implementation CutParser
//: + (instancetype)currentParser
+ (instancetype)picture
{
    //: static AAAInputEmoticonParser *instance = nil;
    static CutParser *instance = nil;
    //: static dispatch_once_t onceToken;
    static dispatch_once_t onceToken;
    //: _dispatch_once(&onceToken, ^{
    _dispatch_once(&onceToken, ^{
        //: instance = [[AAAInputEmoticonParser alloc] init];
        instance = [[CutParser alloc] init];
    //: });
    });
    //: return instance;
    return instance;
}

//: - (instancetype)init
- (instancetype)init
{
    //: if (self = [super init])
    if (self = [super init])
    {
        //: _tokens = [[NSCache alloc] init];
        _tokens = [[NSCache alloc] init];
    }
    //: return self;
    return self;
}

//: - (NSArray *)tokens:(NSString *)text
- (NSArray *)cipher:(NSString *)text
{
    //: NSArray *tokens = nil;
    NSArray *tokens = nil;
    //: if ([text length])
    if ([text length])
    {
        //: tokens = [_tokens objectForKey:text];
        tokens = [_tokens objectForKey:text];
        //: if (tokens == nil)
        if (tokens == nil)
        {
            //: tokens = [self parseToken:text];
            tokens = [self requirement:text];
            //: [_tokens setObject:tokens
            [_tokens setObject:tokens
                        //: forKey:text];
                        forKey:text];
        }
    }
    //: return tokens;
    return tokens;
}

//: - (NSArray *)parseToken:(NSString *)text
- (NSArray *)requirement:(NSString *)text
{
    //: NSMutableArray *tokens = [NSMutableArray array];
    NSMutableArray *tokens = [NSMutableArray array];
    //: static NSRegularExpression *exp;
    static NSRegularExpression *exp;
    //: static dispatch_once_t onceToken;
    static dispatch_once_t onceToken;
    //: _dispatch_once(&onceToken, ^{
    _dispatch_once(&onceToken, ^{
        //: exp = [NSRegularExpression regularExpressionWithPattern:@"\\[[a-zA-Z0-9\\u4e00-\\u9fa5]+\\]"
        exp = [NSRegularExpression regularExpressionWithPattern:StringFromStatuteData(&str_radTitle)
                                                        //: options:NSRegularExpressionCaseInsensitive
                                                        options:NSRegularExpressionCaseInsensitive
                                                          //: error:nil];
                                                          error:nil];
    //: });
    });
    //: __block NSInteger index = 0;
    __block NSInteger index = 0;
    //: [exp enumerateMatchesInString:text
    [exp enumerateMatchesInString:text
                          //: options:0
                          options:0
                            //: range:NSMakeRange(0, [text length])
                            range:NSMakeRange(0, [text length])
                       //: usingBlock:^(NSTextCheckingResult *result, NSMatchingFlags flags, BOOL *stop) {
                       usingBlock:^(NSTextCheckingResult *result, NSMatchingFlags flags, BOOL *stop) {
                           //: NSString *rangeText = [text substringWithRange:result.range];
                           NSString *rangeText = [text substringWithRange:result.range];
                           //: if ([[AAAInputEmoticonManager sharedManager] emoticonByTag:rangeText])
                           if ([[DataOf telegram] popAt:rangeText])
                           {
                               //: if (result.range.location > index)
                               if (result.range.location > index)
                               {
                                   //: NSString *rawText = [text substringWithRange:NSMakeRange(index, result.range.location - index)];
                                   NSString *rawText = [text substringWithRange:NSMakeRange(index, result.range.location - index)];
                                   //: NIMInputTextToken *token = [[NIMInputTextToken alloc] init];
                                   NameToken *token = [[NameToken alloc] init];
                                   //: token.type = NIMInputTokenTypeText;
                                   token.type = NIMInputTokenTypeText;
                                   //: token.text = rawText;
                                   token.text = rawText;
                                   //: [tokens addObject:token];
                                   [tokens addObject:token];
                               }
                               //: NIMInputTextToken *token = [[NIMInputTextToken alloc] init];
                               NameToken *token = [[NameToken alloc] init];
                               //: token.type = NIMInputTokenTypeEmoticon;
                               token.type = NIMInputTokenTypeEmoticon;
                               //: token.text = rangeText;
                               token.text = rangeText;
                               //: [tokens addObject:token];
                               [tokens addObject:token];

                               //: index = result.range.location + result.range.length;
                               index = result.range.location + result.range.length;
                           }
                       //: }];
                       }];

    //: if (index < [text length])
    if (index < [text length])
    {
        //: NSString *rawText = [text substringWithRange:NSMakeRange(index, [text length] - index)];
        NSString *rawText = [text substringWithRange:NSMakeRange(index, [text length] - index)];
        //: NIMInputTextToken *token = [[NIMInputTextToken alloc] init];
        NameToken *token = [[NameToken alloc] init];
        //: token.type = NIMInputTokenTypeText;
        token.type = NIMInputTokenTypeText;
        //: token.text = rawText;
        token.text = rawText;
        //: [tokens addObject:token];
        [tokens addObject:token];
    }
    //: return tokens;
    return tokens;
}
//: @end
@end

Byte *StatuteDataToByte(StatuteData *data) {
    if (data->workout) return data->nearOft;
    for (int i = 0; i < data->hijab; i++) {
        data->nearOft[i] ^= data->valueCollection;
    }
    data->nearOft[data->hijab] = 0;
    data->workout = true;
    return data->nearOft;
}

NSString *StringFromStatuteData(StatuteData *data) {
    return [NSString stringWithUTF8String:(char *)StatuteDataToByte(data)];
}
