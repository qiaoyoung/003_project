// __DEBUG__
// __CLOSE_PRINT__
//
//  UIImage+Status.h
//  NIM
//
//  Created by chris on 15/7/13.
//  Copyright (c) 2015年 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import <UIKit/UIKit.h>
#import <UIKit/UIKit.h>

//: @interface UIImage (NTES)
@interface UIImage (Status)

//: + (UIImage *)fetchImage:(NSString *)imageNameOrPath;
+ (UIImage *)fetchColorRepresentation:(NSString *)imageNameOrPath;

//: - (UIImage *)imageForAvatarUpload;
- (UIImage *)colouration;

//: @end
@end