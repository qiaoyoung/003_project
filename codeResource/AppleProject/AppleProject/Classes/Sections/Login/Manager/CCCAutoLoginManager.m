//
//  CCCAutoLoginManager.m
//  NIM
//
//  Created by 田玉龙 on 2023/6/24.
//  Copyright © 2023 Netease. All rights reserved.
//

#import "CCCAutoLoginManager.h"

@implementation CCCAutoLoginManager

+ (instancetype)sharedManager
{
    static CCCAutoLoginManager *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[CCCAutoLoginManager alloc] init];
    });
    return instance;
}


@end
