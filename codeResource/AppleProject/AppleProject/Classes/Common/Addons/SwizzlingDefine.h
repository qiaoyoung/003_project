// __DEBUG__
// __CLOSE_PRINT__
//
//  SwizzlingDefine.h
//  NIM
//
//  Created by chris on 15/6/23.
//  Copyright (c) 2015年 Netease. All rights reserved.
//
//: #import <objc/runtime.h>
#import <objc/runtime.h>

// __M_A_C_R_O__

//: static inline void swizzling_exchangeMethod(Class clazz ,SEL originalSelector, SEL swizzledSelector){
static inline void swizzling_exchangeMethod(Class clazz ,SEL originalSelector, SEL swizzledSelector){
    //: Method originalMethod = class_getInstanceMethod(clazz, originalSelector);
    Method originalMethod = class_getInstanceMethod(clazz, originalSelector);
    //: Method swizzledMethod = class_getInstanceMethod(clazz, swizzledSelector);
    Method swizzledMethod = class_getInstanceMethod(clazz, swizzledSelector);

    //: BOOL success = class_addMethod(clazz, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
    BOOL success = class_addMethod(clazz, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
    //: if (success) {
    if (success) {
        //: class_replaceMethod(clazz, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
        class_replaceMethod(clazz, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    //: } else {
    } else {
        //: method_exchangeImplementations(originalMethod, swizzledMethod);
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}