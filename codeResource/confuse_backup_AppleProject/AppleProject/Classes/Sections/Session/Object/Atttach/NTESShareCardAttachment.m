//
//  NTESShareCardAttachment.m
//  NIM
//
//  Created by 田玉龙 on 2022/8/22.
//  Copyright © 2022 Netease. All rights reserved.
//

#import "NTESShareCardAttachment.h"

@implementation NTESShareCardAttachment

- (NSString *)encodeAttachment {
    NSDictionary *dictContent = @{
        @"title"   :  self.title?:@"",
        @"content" :  self.content?:@"",
        @"personCardId" : self.personCardId?:@"",
        @"type" : self.type?:kConstant_0,
    };
    
    
    NSDictionary *dict = @{CMType: @(CustomMessageTypeCard), CMData: dictContent};
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict
                                                       options:0
                                                         error:nil];
    return [[NSString alloc] initWithData:jsonData
                                 encoding:NSUTF8StringEncoding];
}


- (CGSize)contentSize:(CGFloat)cellWidth message:(NIMMessage *)message
{
//    NIMImageObject *imageObject = (NIMImageObject*)[message messageObject];
    
    CGSize contentSize = CGSizeMake(249, 85);
    return contentSize;
}


- (CGSize)contentSize:(NIMMessage *)message cellWidth:(CGFloat)width {
    return CGSizeMake(249, 85);
}

- (NSString *)cellContent:(NIMMessage *)message
{
    return @"CCCSessionShareCardContentView";
}

- (UIEdgeInsets)contentViewInsets:(NIMMessage *)message
{
    return [[AppleProjectKit sharedKit].config setting:message].contentInsets;
}

- (BOOL)canBeForwarded
{
    return NO;
}

- (BOOL)canBeRevoked
{
    return NO;
}


@end
