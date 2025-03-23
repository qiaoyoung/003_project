// __DEBUG__
// __CLOSE_PRINT__
//
//  UIView+NIM.m
// Indicator
//
//  Created by chris.
//  Copyright (c) 2015年 NetEase. All rights reserved.
//

// __M_A_C_R_O__
//: #import "UIViewNimKit.h"
#import "UIViewNimKit.h"

//: @implementation UIView (AppleProjectKit)
@implementation UIView (Indicator)

//: - (CGFloat)nim_left {
- (CGFloat)nim_left {
    //: return self.frame.origin.x;
    return self.frame.origin.x;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
//: - (void)setNim_left:(CGFloat)x {
- (void)setNim_left:(CGFloat)x {
    //: CGRect frame = self.frame;
    CGRect frame = self.frame;
    //: frame.origin.x = x;
    frame.origin.x = x;
    //: self.frame = frame;
    self.frame = frame;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
//: - (CGFloat)nim_top {
- (CGFloat)nim_top {
    //: return self.frame.origin.y;
    return self.frame.origin.y;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
//: - (void)setNim_top:(CGFloat)y {
- (void)setNim_top:(CGFloat)y {
    //: CGRect frame = self.frame;
    CGRect frame = self.frame;
    //: frame.origin.y = y;
    frame.origin.y = y;
    //: self.frame = frame;
    self.frame = frame;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
//: - (CGFloat)nim_right {
- (CGFloat)nim_right {
    //: return self.frame.origin.x + self.frame.size.width;
    return self.frame.origin.x + self.frame.size.width;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
//: - (void)setNim_right:(CGFloat)right {
- (void)setNim_right:(CGFloat)right {
    //: CGRect frame = self.frame;
    CGRect frame = self.frame;
    //: frame.origin.x = right - frame.size.width;
    frame.origin.x = right - frame.size.width;
    //: self.frame = frame;
    self.frame = frame;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
//: - (CGFloat)nim_bottom {
- (CGFloat)nim_bottom {
    //: return self.frame.origin.y + self.frame.size.height;
    return self.frame.origin.y + self.frame.size.height;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
//: - (void)setNim_bottom:(CGFloat)bottom {
- (void)setNim_bottom:(CGFloat)bottom {
    //: CGRect frame = self.frame;
    CGRect frame = self.frame;
    //: frame.origin.y = bottom - frame.size.height;
    frame.origin.y = bottom - frame.size.height;
    //: self.frame = frame;
    self.frame = frame;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
//: - (CGFloat)nim_centerX {
- (CGFloat)nim_centerX {
    //: return self.center.x;
    return self.center.x;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
//: - (void)setNim_centerX:(CGFloat)centerX {
- (void)setNim_centerX:(CGFloat)centerX {
    //: self.center = CGPointMake(centerX, self.center.y);
    self.center = CGPointMake(centerX, self.center.y);
}


///////////////////////////////////////////////////////////////////////////////////////////////////
//: - (CGFloat)nim_centerY {
- (CGFloat)nim_centerY {
    //: return self.center.y;
    return self.center.y;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
//: - (void)setNim_centerY:(CGFloat)centerY {
- (void)setNim_centerY:(CGFloat)centerY {
    //: self.center = CGPointMake(self.center.x, centerY);
    self.center = CGPointMake(self.center.x, centerY);
}


///////////////////////////////////////////////////////////////////////////////////////////////////
//: - (CGFloat)nim_width {
- (CGFloat)nim_width {
    //: return self.frame.size.width;
    return self.frame.size.width;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
//: - (void)setNim_width:(CGFloat)width {
- (void)setNim_width:(CGFloat)width {
    //: CGRect frame = self.frame;
    CGRect frame = self.frame;
    //: frame.size.width = width;
    frame.size.width = width;
    //: self.frame = frame;
    self.frame = frame;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
//: - (CGFloat)nim_height {
- (CGFloat)nim_height {
    //: return self.frame.size.height;
    return self.frame.size.height;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
//: - (void)setNim_height:(CGFloat)height {
- (void)setNim_height:(CGFloat)height {
    //: CGRect frame = self.frame;
    CGRect frame = self.frame;
    //: frame.size.height = height;
    frame.size.height = height;
    //: self.frame = frame;
    self.frame = frame;
}
///////////////////////////////////////////////////////////////////////////////////////////////////
//: - (CGPoint)nim_origin {
- (CGPoint)nim_origin {
    //: return self.frame.origin;
    return self.frame.origin;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
//: - (void)setNim_origin:(CGPoint)origin {
- (void)setNim_origin:(CGPoint)origin {
    //: CGRect frame = self.frame;
    CGRect frame = self.frame;
    //: frame.origin = origin;
    frame.origin = origin;
    //: self.frame = frame;
    self.frame = frame;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
//: - (CGSize)nim_size {
- (CGSize)nim_size {
    //: return self.frame.size;
    return self.frame.size;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
//: - (void)setNim_size:(CGSize)size {
- (void)setNim_size:(CGSize)size {
    //: CGRect frame = self.frame;
    CGRect frame = self.frame;
    //: frame.size = size;
    frame.size = size;
    //: self.frame = frame;
    self.frame = frame;
}


//: - (UIViewController *)nim_viewController{
- (UIViewController *)atWith{
    //: for (UIView* next = self; next; next = next.superview) {
    for (UIView* next = self; next; next = next.superview) {
        //: UIResponder* nextResponder = [next nextResponder];
        UIResponder* nextResponder = [next nextResponder];
        //: if ([nextResponder isKindOfClass:[UIViewController class]]) {
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            //: return (UIViewController*)nextResponder;
            return (UIViewController*)nextResponder;
        }
    }
    //: return nil;
    return nil;
}

//: @end
@end