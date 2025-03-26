// __DEBUG__
// __CLOSE_PRINT__
//
//  KEKEProject
//  KEKEChat
//
//  Created by tyl.
//  Copyright © 2024 Ali. All rights reserved.
//

// __M_A_C_R_O__
//: #import <Foundation/Foundation.h>
#import <Foundation/Foundation.h>
//: #import "SGPermission.h"
#import "RangePermission.h"

//: @class SGPermissionCamera;
@class CameraDismissalBubble;

//: NS_ASSUME_NONNULL_BEGIN
NS_ASSUME_NONNULL_BEGIN

//: typedef void(^SGPermissionCameraBlock)(SGPermissionCamera *camera, SGPermissionStatus status);
typedef void(^SGPermissionCameraBlock)(CameraDismissalBubble *camera, SGPermissionStatus status);

//: @interface SGPermissionCamera : NSObject
@interface CameraDismissalBubble : NSObject
//: + (void)camera:(SGPermissionCameraBlock)block;
+ (void)info:(SGPermissionCameraBlock)block;
//: + (void)request:(void (^)(BOOL granted))handler;
+ (void)content:(void (^)(BOOL granted))handler;
//: @end
@end

//: NS_ASSUME_NONNULL_END
NS_ASSUME_NONNULL_END