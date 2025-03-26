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
//: #import "SGPermissionPhoto.h"
#import "MessagePhoto.h"
//: #import <Photos/Photos.h>
#import <Photos/Photos.h>

//: @implementation SGPermissionPhoto
@implementation MessagePhoto

//: + (void)photo:(SGPermissionPhotoBlock)block {
+ (void)trademarkTemp:(SGPermissionPhotoBlock)block {
    //: SGPermissionPhoto *photo = [[SGPermissionPhoto alloc] init];
    MessagePhoto *photo = [[MessagePhoto alloc] init];

    //: PHAuthorizationStatus status = [PHPhotoLibrary authorizationStatus];
    PHAuthorizationStatus status = [PHPhotoLibrary authorizationStatus];
    //: if (status == PHAuthorizationStatusNotDetermined) {
    if (status == PHAuthorizationStatusNotDetermined) {
        //: dispatch_async(dispatch_get_main_queue(), ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            //: if (block) {
            if (block) {
                //: block(photo, SGPermissionStatusNotDetermined);
                block(photo, SGPermissionStatusNotDetermined);
            }
        //: });
        });
    //: } else if (status == PHAuthorizationStatusAuthorized) {
    } else if (status == PHAuthorizationStatusAuthorized) {
        //: if (block) {
        if (block) {
            //: block(photo, SGPermissionStatusAuthorized);
            block(photo, SGPermissionStatusAuthorized);
        }
    //: } else if (status == PHAuthorizationStatusDenied) {
    } else if (status == PHAuthorizationStatusDenied) {
        //: if (block) {
        if (block) {
            //: block(photo, SGPermissionStatusDenied);
            block(photo, SGPermissionStatusDenied);
        }
    //: } else if (status == PHAuthorizationStatusRestricted) {
    } else if (status == PHAuthorizationStatusRestricted) {
        //: if (block) {
        if (block) {
            //: block(photo, SGPermissionStatusRestricted);
            block(photo, SGPermissionStatusRestricted);
        }
    }
}

//: + (void)request:(void (^)(BOOL granted))handler {
+ (void)frank:(void (^)(BOOL granted))handler {
    //: [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
    [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
        //: if (status == PHAuthorizationStatusAuthorized) {
        if (status == PHAuthorizationStatusAuthorized) {
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