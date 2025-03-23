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
//: #import "SGPermissionCamera.h"
#import "CameraDismissalBubble.h"
//: #import <AVFoundation/AVFoundation.h>
#import <AVFoundation/AVFoundation.h>

//: @implementation SGPermissionCamera
@implementation CameraDismissalBubble

//: + (void)camera:(SGPermissionCameraBlock)block {
+ (void)info:(SGPermissionCameraBlock)block {
    //: SGPermissionCamera *camera = [[SGPermissionCamera alloc] init];
    CameraDismissalBubble *camera = [[CameraDismissalBubble alloc] init];

    //: AVAuthorizationStatus status = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    AVAuthorizationStatus status = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    //: if (status == AVAuthorizationStatusNotDetermined) {
    if (status == AVAuthorizationStatusNotDetermined) {
        //: if (block) {
        if (block) {
            //: block(camera, SGPermissionStatusNotDetermined);
            block(camera, SGPermissionStatusNotDetermined);
        }
    //: } else if (status == AVAuthorizationStatusAuthorized) {
    } else if (status == AVAuthorizationStatusAuthorized) {
        //: if (block) {
        if (block) {
            //: block(camera, SGPermissionStatusAuthorized);
            block(camera, SGPermissionStatusAuthorized);
        }
    //: } else if (status == AVAuthorizationStatusDenied) {
    } else if (status == AVAuthorizationStatusDenied) {
        //: if (block) {
        if (block) {
            //: block(camera, SGPermissionStatusDenied);
            block(camera, SGPermissionStatusDenied);
        }
    //: } else if (status == AVAuthorizationStatusRestricted) {
    } else if (status == AVAuthorizationStatusRestricted) {
        //: if (block) {
        if (block) {
            //: block(camera, SGPermissionStatusRestricted);
            block(camera, SGPermissionStatusRestricted);
        }
    }
}

//: + (void)request:(void (^)(BOOL granted))handler {
+ (void)content:(void (^)(BOOL granted))handler {
    //: [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
    [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
        //: if (granted) {
        if (granted) {
            //: dispatch_async(dispatch_get_main_queue(), ^{
            dispatch_async(dispatch_get_main_queue(), ^{
                //: handler(YES);
                handler(YES);
            //: });
            });
        //: } else {
        } else {
            //: dispatch_async(dispatch_get_main_queue(), ^{
            dispatch_async(dispatch_get_main_queue(), ^{
                //: handler(NO);
                handler(NO);
            //: });
            });
        }
    //: }];
    }];
}

//: @end
@end