// __DEBUG__
// __CLOSE_PRINT__
//
//  ImageGestureRecognizer.m
//  DynamicClipImage
//
//  Created by yasic on 2017/11/29.
//  Copyright © 2017年 yasic. All rights reserved.
//

// __M_A_C_R_O__
//: #import "YasicPanGestureRecognizer.h"
#import "ImageGestureRecognizer.h"
//: #import <UIKit/UIGestureRecognizerSubclass.h>
#import <UIKit/UIGestureRecognizerSubclass.h>

//: @interface YasicPanGestureRecognizer()
@interface ImageGestureRecognizer()

//: @property(strong, nonatomic) UIView *targetView;
@property(strong, nonatomic) UIView *targetView;

//: @end
@end

//: @implementation YasicPanGestureRecognizer
@implementation ImageGestureRecognizer

//: -(instancetype)initWithTarget:(id)target action:(SEL)action inview:(UIView*)view{
-(instancetype)initWithComeUp:(id)target secretDoing:(SEL)action smartTeamShareActionBull:(UIView*)view{

    //: self = [super initWithTarget:target action:action];
    self = [super initWithTarget:target action:action];
    //: if(self) {
    if(self) {
        //: self.targetView = view;
        self.targetView = view;
    }
    //: return self;
    return self;
}

//: - (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent*)event{
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent*)event{

    //: [super touchesBegan:touches withEvent:event];
    [super touchesBegan:touches withEvent:event];
    //: UITouch *touch = [touches anyObject];
    UITouch *touch = [touches anyObject];
    //: self.beginPoint = [touch locationInView:self.targetView];
    self.beginPoint = [touch locationInView:self.targetView];
}

//: - (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //: [super touchesMoved:touches withEvent:event];
    [super touchesMoved:touches withEvent:event];
    //: UITouch *touch = [touches anyObject];
    UITouch *touch = [touches anyObject];
    //: self.movePoint = [touch locationInView:self.targetView];
    self.movePoint = [touch locationInView:self.targetView];
}

//: @end
@end