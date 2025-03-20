//
//  AAAInputEmoticonParser.h
// AppleProjectKit
//
//  Created by chris.
//  Copyright (c) 2015 Netease. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger
{
    NIMInputTokenTypeText,
    NIMInputTokenTypeEmoticon,
    NIMInputTokenTypeLink,
    
} NIMInputTokenType;

@interface NIMInputTextToken : NSObject
@property (nonatomic,copy)      NSString    *text;
@property (nonatomic,assign)    NIMInputTokenType   type;
@end


@interface AAAInputEmoticonParser : NSObject
+ (instancetype)currentParser;
- (NSArray *)tokens:(NSString *)text;
@end
