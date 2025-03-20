//
//  BBBMembersFetchOption.h
// AppleProjectKit
//
//  Created by Netease on 2019/7/15.
//  Copyright © 2019 NetEase. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BBBMembersFetchOption : NSObject

@property (nonatomic, assign) NSInteger offset;

@property (nonatomic, assign) NSInteger count;

@property (nonatomic, assign) BOOL isRefresh;

@end

NS_ASSUME_NONNULL_END
