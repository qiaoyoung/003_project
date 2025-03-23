//
//  KEKEProject
//  KEKEChat
//
//  Created by tyl.
//  Copyright © 2024 Ali. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "SGPermission.h"

@class SGPermissionCamera;

NS_ASSUME_NONNULL_BEGIN

typedef void(^SGPermissionCameraBlock)(SGPermissionCamera *camera, SGPermissionStatus status);

@interface SGPermissionCamera : NSObject
+ (void)camera:(SGPermissionCameraBlock)block;
+ (void)request:(void (^)(BOOL granted))handler;
@end

NS_ASSUME_NONNULL_END
