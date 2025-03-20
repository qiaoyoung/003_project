// __DEBUG__
// __CLOSE_PRINT__
//
//  WithMin.h
// Indicator
//
//  Created by amao on 8/11/15.
//  Copyright (c) 2015 NetEase. All rights reserved.
//

// __M_A_C_R_O__
//: #import <UIKit/UIKit.h>
#import <UIKit/UIKit.h>

//: @interface BBBMediaItem : NSObject
@interface WithMin : NSObject

//: @property (nonatomic,assign) SEL selctor;
@property (nonatomic,assign) SEL selctor;

//: @property (nonatomic,strong) UIImage *normalImage;
@property (nonatomic,strong) UIImage *normalImage;

//: @property (nonatomic,strong) UIImage *selectedImage;
@property (nonatomic,strong) UIImage *selectedImage;

//: @property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *title;

//: + (BBBMediaItem *)item:(NSString *)selector
+ (WithMin *)more:(NSString *)selector
           //: normalImage:(UIImage *)normalImage
           title:(UIImage *)normalImage
         //: selectedImage:(UIImage *)selectedImage
         back:(UIImage *)selectedImage
                 //: title:(NSString *)title;
                 scheme:(NSString *)title;
//: @end
@end