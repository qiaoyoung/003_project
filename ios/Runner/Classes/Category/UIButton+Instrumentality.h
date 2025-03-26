// __DEBUG__
// __CLOSE_PRINT__
//
//  UIButton+Instrumentality.h
//  SystemPreferenceDemo
//
//  Created by moyekong on 12/28/15.
//  Copyright © 2015 wiwide. All rights reserved.
//

// __M_A_C_R_O__
//: #import <UIKit/UIKit.h>
#import <UIKit/UIKit.h>

//: typedef NS_ENUM(NSUInteger, MKButtonEdgeInsetsStyle) {
typedef NS_ENUM(NSUInteger, MKButtonEdgeInsetsStyle) {
    //: MKButtonEdgeInsetsStyleTop, 
    MKButtonEdgeInsetsStyleTop, // image在上，label在下
    //: MKButtonEdgeInsetsStyleLeft, 
    MKButtonEdgeInsetsStyleLeft, // image在左，label在右
    //: MKButtonEdgeInsetsStyleBottom, 
    MKButtonEdgeInsetsStyleBottom, // image在下，label在上
    //: MKButtonEdgeInsetsStyleRight 
    MKButtonEdgeInsetsStyleRight // image在右，label在左
//: };
};

//: @interface UIButton (ImageTitleSpacing)
@interface UIButton (Instrumentality)

/**
 *  设置button的titleLabel和imageView的布局样式，及间距
 *
 *  @param style titleLabel和imageView的布局样式
 *  @param space titleLabel和imageView的间距
 */
//: - (void)layoutButtonWithEdgeInsetsStyle:(MKButtonEdgeInsetsStyle)style
- (void)image:(MKButtonEdgeInsetsStyle)style
                        //: imageTitleSpace:(CGFloat)space;
                        keep:(CGFloat)space;

//: @end
@end