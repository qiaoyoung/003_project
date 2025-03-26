// __DEBUG__
// __CLOSE_PRINT__
//
//  NSObject+Ting.m
//  NIM
//
//  Created by 田玉龙 on 2023/12/5.
//  Copyright © 2023 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import "NSObject+tyl_internalIdentifier.h"
#import "NSObject+Ting.h"
//: #import <objc/runtime.h>
#import <objc/runtime.h>

static const void *kTingKey = &kTingKey;

//: @implementation NSObject (tyl_internalIdentifier)
@implementation NSObject (Ting)

//: - (void)setTyl_internalIdentifier:(NSString *)tyl_internalIdentifier{
- (void)setTing:(NSString *)ting{
    //: objc_setAssociatedObject(self, @selector(tyl_internalIdentifier), tyl_internalIdentifier, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    objc_setAssociatedObject(self, kTingKey, ting, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

//: - (NSString *)tyl_internalIdentifier{
- (NSString *)ting{
    //: return objc_getAssociatedObject(self, _cmd);
    return objc_getAssociatedObject(self, kTingKey);
}

//: @end
@end
