// __DEBUG__
// __CLOSE_PRINT__
//
//  YYAnimatedImageView+DayOfTheMonth.m
// Indicator
//
//  Created by Genning on 2020/9/25.
//  Copyright © 2020 NetEase. All rights reserved.
//  

// __M_A_C_R_O__
//: #import "YYAnimatedImageView+iOS14.h"
#import "YYAnimatedImageView+DayOfTheMonth.h"
//: #import <objc/runtime.h>
#import <objc/runtime.h>

//: @implementation YYAnimatedImageView (iOS14)
@implementation YYAnimatedImageView (DayOfTheMonth)

//: + (void)load {
+ (void)load {

    //: static dispatch_once_t onceToken;
    static dispatch_once_t onceToken;

    //: _dispatch_once(&onceToken, ^{
    _dispatch_once(&onceToken, ^{

        //: Method method1;
        Method method1;

        //: Method method2;
        Method method2;

        //: method1 = class_getInstanceMethod([self class], @selector(lz_displayLayer:));
        method1 = class_getInstanceMethod([self class], @selector(displayInfoEdit:));

        //: method2 = class_getInstanceMethod([self class], @selector(displayLayer:));
        method2 = class_getInstanceMethod([self class], @selector(displayLayer:));

        //: method_exchangeImplementations(method1, method2);
        method_exchangeImplementations(method1, method2);

    //: });
    });

}

//: - (void)lz_displayLayer:(CALayer *)layer {
- (void)displayInfoEdit:(CALayer *)layer {

    //: Ivar ivar = class_getInstanceVariable(self.class, "_curFrame");
    Ivar ivar = class_getInstanceVariable(self.class, "_curFrame");

    //: UIImage *_curFrame = object_getIvar(self, ivar);
    UIImage *_curFrame = object_getIvar(self, ivar);

    //: if (_curFrame) {
    if (_curFrame) {

        //: layer.contents = (__bridge id)_curFrame.CGImage;
        layer.contents = (__bridge id)_curFrame.CGImage;

    //: }else{
    }else{

        //: if (@available(iOS 14.0, *)) {
        if (@available(iOS 14.0, *)) {

            //: [super displayLayer:layer];
            [super displayLayer:layer];

        }

    }

}

//: @end
@end