//
//  CCCAutoLoginManager.h
//  NIM
//
//  Created by 田玉龙 on 2023/6/24.
//  Copyright © 2023 Netease. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CCCAutoLoginManager : NSObject

+ (instancetype)sharedManager;

@property (nonatomic ,assign) BOOL isloading;
@property (nonatomic ,assign) BOOL isRequestAutoLoginFinish;

@end

NS_ASSUME_NONNULL_END
