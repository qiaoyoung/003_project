// __DEBUG__
// __CLOSE_PRINT__
//
//  NSMutableAttributedString+M80.h
//  MessageEnableTextView
//
//  Created by amao on 13-8-31.
//  Copyright (c) 2013年 www.xiangwangfeng.com. All rights reserved.
//

// __M_A_C_R_O__
//: #import "M80AttributedLabelDefines.h"
#import "M80AttributedLabelDefines.h"

//: NS_ASSUME_NONNULL_BEGIN
NS_ASSUME_NONNULL_BEGIN

//: @interface NSMutableAttributedString (M80)
@interface NSMutableAttributedString (M80)

//: - (void)m80_setTextColor:(UIColor*)color;
- (void)titleColor:(UIColor*)color;
//: - (void)m80_setTextColor:(UIColor*)color range:(NSRange)range;
- (void)chromaticAt:(UIColor*)color prevalence:(NSRange)range;

//: - (void)m80_setFont:(UIFont*)font;
- (void)sub:(UIFont*)font;
//: - (void)m80_setFont:(UIFont*)font range:(NSRange)range;
- (void)range:(UIFont*)font item:(NSRange)range;

//: - (void)m80_setUnderlineStyle:(CTUnderlineStyle)style
- (void)middleComment:(CTUnderlineStyle)style
                 //: modifier:(CTUnderlineStyleModifiers)modifier;
                 jarFlip:(CTUnderlineStyleModifiers)modifier;
//: - (void)m80_setUnderlineStyle:(CTUnderlineStyle)style
- (void)with:(CTUnderlineStyle)style
                 //: modifier:(CTUnderlineStyleModifiers)modifier
                 my:(CTUnderlineStyleModifiers)modifier
                    //: range:(NSRange)range;
                    cookieRange:(NSRange)range;

//: @end
@end

//: NS_ASSUME_NONNULL_END
NS_ASSUME_NONNULL_END