//
//  NSMutableAttributedString+M80.m
//  M80AttributedLabel
//
//  Created by amao on 13-8-31.
//  Copyright (c) 2013年 www.xiangwangfeng.com. All rights reserved.
//

#import "NSMutableAttributedString+M80.h"

@implementation NSMutableAttributedString (M80)

- (void)m80_setTextColor:(UIColor*)color
{
    [self m80_setTextColor:color range:NSMakeRange(0, [self length])];
}

- (void)m80_setTextColor:(UIColor*)color range:(NSRange)range
{
    [self addAttributes:@{NSForegroundColorAttributeName:color} range:range];
}


- (void)m80_setFont:(UIFont*)font
{
    [self m80_setFont:font range:NSMakeRange(0, [self length])];
}

- (void)m80_setFont:(UIFont*)font range:(NSRange)range
{
    if (font)
    {
        [self addAttributes:@{NSFontAttributeName:font} range:range];
    }
}

- (void)m80_setUnderlineStyle:(CTUnderlineStyle)style
                 modifier:(CTUnderlineStyleModifiers)modifier
{
    [self m80_setUnderlineStyle:style
                   modifier:modifier
                      range:NSMakeRange(0, self.length)];
}

- (void)m80_setUnderlineStyle:(CTUnderlineStyle)style
                 modifier:(CTUnderlineStyleModifiers)modifier
                    range:(NSRange)range
{
    [self addAttributes:@{NSUnderlineStyleAttributeName :[NSNumber numberWithInt:(style|modifier)]} range:range];
}

@end
