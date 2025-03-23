//
//  CCCFileContentConfig.m
// AppleProjectKit
//
//  Created by amao on 9/15/15.
//  Copyright (c) 2015 NetEase. All rights reserved.
//

#import "CCCFileContentConfig.h"
#import "AppleProjectKit.h"

@implementation CCCFileContentConfig

- (CGSize)contentSize:(CGFloat)cellWidth message:(NIMMessage *)message
{
    return CGSizeMake(110, 110);
}

- (NSString *)cellContent:(NIMMessage *)message
{
    return @"CCCSessionFileTransContentView";
}

- (UIEdgeInsets)contentViewInsets:(NIMMessage *)message
{
    return [[AppleProjectKit sharedKit].config setting:message].contentInsets;
}



@end
