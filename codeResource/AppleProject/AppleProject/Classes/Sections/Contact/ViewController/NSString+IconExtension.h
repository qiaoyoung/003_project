// __DEBUG__
// __CLOSE_PRINT__
//
//  NSString+IconExtension.h
//  Demo
//
//  Created by LeeJay on 2018/7/5.
//  Copyright © 2018年 LeeJay. All rights reserved.
//

// __M_A_C_R_O__
//: #import <Foundation/Foundation.h>
#import <Foundation/Foundation.h>

//: @interface NSString (LJExtension)
@interface NSString (IconExtension)

/**
 去除手机号的特殊字段

 @param string 手机号
 @return 处理过的手机号
 */
//: + (NSString *)lj_filterSpecialString:(NSString *)string;
+ (NSString *)strain:(NSString *)string;

/**
 字符串转拼音

 @param string 字符串
 @return 拼音
 */
//: + (NSString *)lj_pinyinForString:(NSString *)string;
+ (NSString *)name:(NSString *)string;

//: @end
@end