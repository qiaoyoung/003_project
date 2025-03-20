// __DEBUG__
// __CLOSE_PRINT__
//
//  NSMutableAttributedString+M80.m
//  MessageEnableTextView
//
//  Created by amao on 13-8-31.
//  Copyright (c) 2013年 www.xiangwangfeng.com. All rights reserved.
//

// __M_A_C_R_O__
//: #import "NSMutableAttributedString+M80.h"
#import "NSMutableAttributedString+M80.h"

//: @implementation NSMutableAttributedString (M80)
@implementation NSMutableAttributedString (M80)

//: - (void)m80_setTextColor:(UIColor*)color
- (void)titleColor:(UIColor*)color
{
    //: [self m80_setTextColor:color range:NSMakeRange(0, [self length])];
    [self chromaticAt:color prevalence:NSMakeRange(0, [self length])];
}

//: - (void)m80_setTextColor:(UIColor*)color range:(NSRange)range
- (void)chromaticAt:(UIColor*)color prevalence:(NSRange)range
{
    //: [self addAttributes:@{NSForegroundColorAttributeName:color} range:range];
    [self addAttributes:@{NSForegroundColorAttributeName:color} range:range];
}


//: - (void)m80_setFont:(UIFont*)font
- (void)sub:(UIFont*)font
{
    //: [self m80_setFont:font range:NSMakeRange(0, [self length])];
    [self range:font item:NSMakeRange(0, [self length])];
}

//: - (void)m80_setFont:(UIFont*)font range:(NSRange)range
- (void)range:(UIFont*)font item:(NSRange)range
{
    //: if (font)
    if (font)
    {
        //: [self addAttributes:@{NSFontAttributeName:font} range:range];
        [self addAttributes:@{NSFontAttributeName:font} range:range];
    }
}

//: - (void)m80_setUnderlineStyle:(CTUnderlineStyle)style
- (void)middleComment:(CTUnderlineStyle)style
                 //: modifier:(CTUnderlineStyleModifiers)modifier
                 jarFlip:(CTUnderlineStyleModifiers)modifier
{
    //: [self m80_setUnderlineStyle:style
    [self with:style
                   //: modifier:modifier
                   my:modifier
                      //: range:NSMakeRange(0, self.length)];
                      cookieRange:NSMakeRange(0, self.length)];
}

//: - (void)m80_setUnderlineStyle:(CTUnderlineStyle)style
- (void)with:(CTUnderlineStyle)style
                 //: modifier:(CTUnderlineStyleModifiers)modifier
                 my:(CTUnderlineStyleModifiers)modifier
                    //: range:(NSRange)range
                    cookieRange:(NSRange)range
{
    //: [self addAttributes:@{NSUnderlineStyleAttributeName :[NSNumber numberWithInt:(style|modifier)]} range:range];
    [self addAttributes:@{NSUnderlineStyleAttributeName :[NSNumber numberWithInt:(style|modifier)]} range:range];
}

//: @end
@end