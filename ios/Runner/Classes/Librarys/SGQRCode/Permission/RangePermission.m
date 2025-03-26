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
//: #import "SGPermission.h"
#import "RangePermission.h"
//: #import "SGPermissionCamera.h"
#import "CameraDismissalBubble.h"
//: #import "SGPermissionPhoto.h"
#import "MessagePhoto.h"

//: @interface SGPermission ()
@interface RangePermission ()
//: @property (nonatomic, assign) SGPermissionType type;
@property (nonatomic, assign) SGPermissionType type;
//: @end
@end

//: @implementation SGPermission
@implementation RangePermission

//: - (void)initWithType:(SGPermissionType)type completion:(SGPermissionBlock)block {
- (void)initWithShare:(SGPermissionType)type plunk:(SGPermissionBlock)block {
    //: [SGPermission permissionWithType:type completion:block];
    [RangePermission dismissalBetweenCompletionMessage:type path:block];
}

//: + (void)permissionWithType:(SGPermissionType)type completion:(SGPermissionBlock)block {
+ (void)dismissalBetweenCompletionMessage:(SGPermissionType)type path:(SGPermissionBlock)block {
    //: SGPermission *permission = [[SGPermission alloc] init];
    RangePermission *permission = [[RangePermission alloc] init];
    //: permission.type = type;
    permission.type = type;

    //: if (type == SGPermissionTypeCamera) {
    if (type == SGPermissionTypeCamera) {
        //: [SGPermissionCamera camera:^(SGPermissionCamera * _Nonnull camera, SGPermissionStatus status) {
        [CameraDismissalBubble info:^(CameraDismissalBubble * _Nonnull camera, SGPermissionStatus status) {
            //: if (block) {
            if (block) {
                //: block(permission, status);
                block(permission, status);
            }
        //: }];
        }];
    //: } else if (type == SGPermissionTypePhoto) {
    } else if (type == SGPermissionTypePhoto) {
        //: [SGPermissionPhoto photo:^(SGPermissionPhoto * _Nonnull photos, SGPermissionStatus status) {
        [MessagePhoto trademarkTemp:^(MessagePhoto * _Nonnull photos, SGPermissionStatus status) {
            //: if (block) {
            if (block) {
                //: block(permission, status);
                block(permission, status);
            }
        //: }];
        }];
    }
}

//: - (void)request:(void (^)(BOOL))handler {
- (void)content:(void (^)(BOOL))handler {
    //: if (self.type == SGPermissionTypeCamera) {
    if (self.type == SGPermissionTypeCamera) {
        //: [SGPermissionCamera request:handler];
        [CameraDismissalBubble content:handler];
    //: } else if (self.type == SGPermissionTypePhoto) {
    } else if (self.type == SGPermissionTypePhoto) {
        //: [SGPermissionPhoto request:handler];
        [MessagePhoto frank:handler];
    }
}

//: @end
@end