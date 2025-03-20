// __DEBUG__
// __CLOSE_PRINT__
//
//  MessageEnableTextView+NIMKit
//  NIM
//
//  Created by chris.
//  Copyright (c) 2015 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import "M80AttributedLabel+AppleProjectKit.h"
#import "MessageEnableTextView+Indicator.h"
//: #import "AAAInputEmoticonParser.h"
#import "CutParser.h"
//: #import "AAAInputEmoticonManager.h"
#import "DataOf.h"
//: #import "UIImage+AppleProjectKit.h"
#import "UIImage+Indicator.h"
//: #import "NSString+AppleProjectKit.h"
#import "NSString+Indicator.h"
//: #import <objc/runtime.h>
#import <objc/runtime.h>

//: @implementation M80AttributedLabel (AppleProjectKit)
@implementation MessageEnableTextView (Indicator)
//: - (void)nim_setText:(NSString *)text
- (void)showName:(NSString *)text
{
    //: [self setText:@""];
    [self setText:@""];

    //: text = [text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    text = [text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    //: text = [text stringByReplacingOccurrencesOfString:@"\r\n" withString:@"\n"];
    text = [text stringByReplacingOccurrencesOfString:@"\r\n" withString:@"\n"];
    //: if (text.length) {
    if (text.length) {
        //: [self setText:text];
        [self setText:text];
    }

}

//: - (void)setOriLineBreakMode:(NSLineBreakMode)lineBreakModel{
- (void)setKeyWindow:(NSLineBreakMode)lineBreakModel{
    //: objc_setAssociatedObject(self, @selector(oriLineBreakMode), @(lineBreakModel), OBJC_ASSOCIATION_ASSIGN);
    objc_setAssociatedObject(self, @selector(keyWindow), @(lineBreakModel), OBJC_ASSOCIATION_ASSIGN);
}

//: - (CTLineBreakMode)oriLineBreakMode{
- (CTLineBreakMode)keyWindow{
    //: return (NSLineBreakMode)[objc_getAssociatedObject(self, @selector(oriLineBreakMode))integerValue];
    return (NSLineBreakMode)[objc_getAssociatedObject(self, @selector(keyWindow))integerValue];
}



//: @end
@end