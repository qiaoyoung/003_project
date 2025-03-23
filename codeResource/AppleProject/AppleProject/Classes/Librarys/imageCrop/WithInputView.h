// __DEBUG__
// __CLOSE_PRINT__
//
//  WithInputView.h
//  TKImageDemo
//
//  Created by yinyu on 16/7/10.
//  Copyright © 2016年 yinyu. All rights reserved.
//

// __M_A_C_R_O__
//: #import <UIKit/UIKit.h>
#import <UIKit/UIKit.h>

//: typedef NS_ENUM(NSInteger, TKCropAreaCornerStyle) {
typedef NS_ENUM(NSInteger, TKCropAreaCornerStyle) {
    //: TKCropAreaCornerStyleRightAngle,
    TKCropAreaCornerStyleRightAngle,
    //: TKCropAreaCornerStyleCircle
    TKCropAreaCornerStyleCircle
//: };
};
//: @interface TKImageView : UIView
@interface WithInputView : UIView
//: @property (strong, nonatomic) UIImage *toCropImage;
@property (strong, nonatomic) UIImage *toCropImage;
//: @property (assign, nonatomic) BOOL needScaleCrop;
@property (assign, nonatomic) BOOL needScaleCrop;
//: @property (assign, nonatomic) BOOL showMidLines;
@property (assign, nonatomic) BOOL showMidLines;
//: @property (assign, nonatomic) BOOL showCrossLines;
@property (assign, nonatomic) BOOL showCrossLines;
//: @property (assign, nonatomic) CGFloat cropAspectRatio;
@property (assign, nonatomic) CGFloat cropAspectRatio;
//: @property (strong, nonatomic) UIColor *cropAreaBorderLineColor;
@property (strong, nonatomic) UIColor *cropAreaBorderLineColor;
//: @property (assign, nonatomic) CGFloat cropAreaBorderLineWidth;
@property (assign, nonatomic) CGFloat cropAreaBorderLineWidth;
//: @property (strong, nonatomic) UIColor *cropAreaCornerLineColor;
@property (strong, nonatomic) UIColor *cropAreaCornerLineColor;
//: @property (assign, nonatomic) CGFloat cropAreaCornerLineWidth;
@property (assign, nonatomic) CGFloat cropAreaCornerLineWidth;
//: @property (assign, nonatomic) CGFloat cropAreaCornerWidth;
@property (assign, nonatomic) CGFloat cropAreaCornerWidth;
//: @property (assign, nonatomic) CGFloat cropAreaCornerHeight;
@property (assign, nonatomic) CGFloat cropAreaCornerHeight;
//: @property (assign, nonatomic) CGFloat minSpace;
@property (assign, nonatomic) CGFloat minSpace;
//: @property (assign, nonatomic) CGFloat cropAreaCrossLineWidth;
@property (assign, nonatomic) CGFloat cropAreaCrossLineWidth;
//: @property (strong, nonatomic) UIColor *cropAreaCrossLineColor;
@property (strong, nonatomic) UIColor *cropAreaCrossLineColor;
//: @property (assign, nonatomic) CGFloat cropAreaMidLineWidth;
@property (assign, nonatomic) CGFloat cropAreaMidLineWidth;
//: @property (assign, nonatomic) CGFloat cropAreaMidLineHeight;
@property (assign, nonatomic) CGFloat cropAreaMidLineHeight;
//: @property (strong, nonatomic) UIColor *cropAreaMidLineColor;
@property (strong, nonatomic) UIColor *cropAreaMidLineColor;
//: @property (strong, nonatomic) UIColor *maskColor;
@property (strong, nonatomic) UIColor *maskColor;
//: @property (assign, nonatomic) BOOL cornerBorderInImage;
@property (assign, nonatomic) BOOL cornerBorderInImage;
//: @property (assign, nonatomic) CGFloat initialScaleFactor;
@property (assign, nonatomic) CGFloat initialScaleFactor;
//: - (UIImage *)currentCroppedImage;
- (UIImage *)greenOffInterval;
//: @end
@end