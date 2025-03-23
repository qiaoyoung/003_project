//
//  KEKEProject
//  KEKEChat
//
//  Created by tyl.
//  Copyright © 2024 Ali. All rights reserved.
//
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (graytool)

+ (UIImage *)grayImage:(UIImage *)image;
+ (UIImage *)grayImageWithName:(NSString *)imageName;
+ (UIImage *)grayImageWithName:(NSString *)imageName color:(UIColor *)color;

@end

NS_ASSUME_NONNULL_END
