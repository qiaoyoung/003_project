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
//: #import <UIKit/UIKit.h>
#import <UIKit/UIKit.h>

//: typedef enum : NSUInteger {
typedef enum : NSUInteger {
    /// 默认与边框线同中心点
    //: SGCornerLoactionDefault,
    SGCornerLoactionDefault,
    /// 在边框线内部
    //: SGCornerLoactionInside,
    SGCornerLoactionInside,
    /// 在边框线外部
    //: SGCornerLoactionOutside
    SGCornerLoactionOutside
//: } SGCornerLoaction;
} SGCornerLoaction;

//: NS_ASSUME_NONNULL_BEGIN
NS_ASSUME_NONNULL_BEGIN

//: @interface SGScanViewConfigure : NSObject
@interface ToContainerConfigure : NSObject
/// 类方法创建
//: + (instancetype)configure;
+ (instancetype)misapply;

/// 扫描线
//: @property (nonatomic, copy) NSString *scanline;
@property (nonatomic, copy) NSString *scanline;

/// 扫描线每次移动的步长，默认为：3.5f
//: @property (nonatomic, assign) CGFloat scanlineStep;
@property (nonatomic, assign) CGFloat scanlineStep;

/// 扫描线是否执行逆动画，默认为：NO
//: @property (nonatomic, assign) BOOL autoreverses;
@property (nonatomic, assign) BOOL autoreverses;

/// 扫描线是否从扫描框顶部开始扫描，默认为：NO
//: @property (nonatomic, assign) BOOL isFromTop;
@property (nonatomic, assign) BOOL isFromTop;

/// ToTitleView 背景色，默认为：[[UIColor blackColor] colorWithAlphaComponent:0.5]
//: @property (nonatomic, strong) UIColor *color;
@property (nonatomic, strong) UIColor *color;

/// 是否需要辅助扫描框，默认为：NO
//: @property (nonatomic, assign) BOOL isShowBorder;
@property (nonatomic, assign) BOOL isShowBorder;

/// 辅助扫描框的颜色，默认为：[UIColor whiteColor]
//: @property (nonatomic, strong) UIColor *borderColor;
@property (nonatomic, strong) UIColor *borderColor;

/// 辅助扫描框的宽度，默认为：0.2f
//: @property (nonatomic, assign) CGFloat borderWidth;
@property (nonatomic, assign) CGFloat borderWidth;

/// 辅助扫描边角位置，默认为：SGCornerLoactionDefault
//: @property (nonatomic, assign) SGCornerLoaction cornerLocation;
@property (nonatomic, assign) SGCornerLoaction cornerLocation;

/// 辅助扫描边角颜色，默认为：[UIColor greenColor]
//: @property (nonatomic, strong) UIColor *cornerColor;
@property (nonatomic, strong) UIColor *cornerColor;

/// 辅助扫描边角宽度，默认为：2.0f
//: @property (nonatomic, assign) CGFloat cornerWidth;
@property (nonatomic, assign) CGFloat cornerWidth;

/// 辅助扫描边角长度，默认为：20.0f
//: @property (nonatomic, assign) CGFloat cornerLength;
@property (nonatomic, assign) CGFloat cornerLength;

//: @end
@end

//: NS_ASSUME_NONNULL_END
NS_ASSUME_NONNULL_END