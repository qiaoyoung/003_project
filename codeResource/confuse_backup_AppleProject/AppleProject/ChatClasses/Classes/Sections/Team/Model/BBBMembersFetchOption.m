//
//  BBBMembersFetchOption.m
// AppleProjectKit
//
//  Created by Netease on 2019/7/15.
//  Copyright © 2019 NetEase. All rights reserved.
//

#import "BBBMembersFetchOption.h"

@implementation BBBMembersFetchOption

- (instancetype)init {
    if (self = [super init]) {
        _offset = 0;
        _count = -1;
        _isRefresh = YES;
    }
    return self;
}

@end
