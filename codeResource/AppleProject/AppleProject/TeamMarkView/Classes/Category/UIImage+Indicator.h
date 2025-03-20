// __DEBUG__
// __CLOSE_PRINT__
//
//  UIImage+Indicator.h
// Indicator
//
//  Created by chris.
//  Copyright (c) 2015年 NetEase. All rights reserved.
//

// __M_A_C_R_O__
//: #import <UIKit/UIKit.h>
#import <UIKit/UIKit.h>

//: @interface UIImage (AppleProjectKit)
@interface UIImage (Indicator)

//: + (UIImage *)nim_fetchChartlet:(NSString *)imageName chartletId:(NSString *)chartletId;
+ (UIImage *)shadow:(NSString *)imageName quantityerval:(NSString *)chartletId;

//: + (CGSize)nim_sizeWithImageOriginSize:(CGSize)originSize
+ (CGSize)with:(CGSize)originSize
                              //: minSize:(CGSize)imageMinSize
                              barBubbleSize:(CGSize)imageMinSize
                              //: maxSize:(CGSize)imageMaxSiz;
                              viewFrame:(CGSize)imageMaxSiz;


//: + (UIImage *)nim_emoticonInKit:(NSString *)imageName;
+ (UIImage *)pickings:(NSString *)imageName;

//: - (UIImage *)nim_imageForAvatarUpload;
- (UIImage *)at;

//: - (UIImage *)nim_fixOrientation;
- (UIImage *)session;

//: - (UIImage *)nim_cropedImageWithSize:(CGSize)size;
- (UIImage *)to:(CGSize)size;

//: @end
@end