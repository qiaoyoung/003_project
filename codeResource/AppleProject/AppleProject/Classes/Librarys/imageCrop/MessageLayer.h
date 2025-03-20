// __DEBUG__
// __CLOSE_PRINT__
//
//  MessageLayer.h
//  DynamicClipImage
//
//  Created by yasic on 2017/11/29.
//  Copyright © 2017年 yasic. All rights reserved.
//

// __M_A_C_R_O__
//: #import <QuartzCore/QuartzCore.h>
#import <QuartzCore/QuartzCore.h>

//: @interface YasicClipAreaLayer : CAShapeLayer
@interface MessageLayer : CAShapeLayer

//: @property(assign, nonatomic) NSInteger cropAreaLeft;
@property(assign, nonatomic) NSInteger cropAreaLeft;
//: @property(assign, nonatomic) NSInteger cropAreaTop;
@property(assign, nonatomic) NSInteger cropAreaTop;
//: @property(assign, nonatomic) NSInteger cropAreaRight;
@property(assign, nonatomic) NSInteger cropAreaRight;
//: @property(assign, nonatomic) NSInteger cropAreaBottom;
@property(assign, nonatomic) NSInteger cropAreaBottom;

//: - (void)setCropAreaLeft:(NSInteger)cropAreaLeft CropAreaTop:(NSInteger)cropAreaTop CropAreaRight:(NSInteger)cropAreaRight CropAreaBottom:(NSInteger)cropAreaBottom;
- (void)reply:(NSInteger)cropAreaLeft standardTingBottom:(NSInteger)cropAreaTop fruitageBottom:(NSInteger)cropAreaRight index:(NSInteger)cropAreaBottom;


//: @end
@end