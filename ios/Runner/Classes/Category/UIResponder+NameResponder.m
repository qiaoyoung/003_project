// __DEBUG__
// __CLOSE_PRINT__
//
//  UIResponder+NameResponder.m
//  NIM
//
//  Created by chris on 15/9/26.
//  Copyright © 2015年 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import "UIResponder+NTESFirstResponder.h"
#import "UIResponder+NameResponder.h"

//: static __weak id currentFirstResponder;
static __weak id k_maxValue;
//: static __weak id currentSecodResponder;
static __weak id k_commentUpTitle;

//: @implementation UIResponder (NTESFirstResponder)
@implementation UIResponder (NameResponder)

//: + (instancetype)currentFirstResponder {
+ (instancetype)size {
    //: currentFirstResponder = nil;
    k_maxValue = nil;
    //: currentSecodResponder = nil;
    k_commentUpTitle = nil;
    //: [[UIApplication sharedApplication] sendAction:@selector(findFirstResponder:) to:nil from:nil forEvent:nil];
    [[UIApplication sharedApplication] sendAction:@selector(firstses:) to:nil from:nil forEvent:nil];
    //: return currentFirstResponder;
    return k_maxValue;
}

//: + (instancetype)currentSecondResponder{
+ (instancetype)view{
    //: currentFirstResponder = nil;
    k_maxValue = nil;
    //: currentSecodResponder = nil;
    k_commentUpTitle = nil;
    //: [[UIApplication sharedApplication] sendAction:@selector(findFirstResponder:) to:nil from:nil forEvent:nil];
    [[UIApplication sharedApplication] sendAction:@selector(firstses:) to:nil from:nil forEvent:nil];
    //: return currentSecodResponder;
    return k_commentUpTitle;
}

//: - (void)findFirstResponder:(id)sender {
- (void)firstses:(id)sender {
    //: currentFirstResponder = self;
    k_maxValue = self;
    //: [self.nextResponder findSecondResponder:sender];
    [self.nextResponder atMax:sender];
}


//: - (void)findSecondResponder:(id)sender{
- (void)atMax:(id)sender{
    //: currentSecodResponder = self;
    k_commentUpTitle = self;
}

//: @end
@end