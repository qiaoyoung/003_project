// __DEBUG__
// __CLOSE_PRINT__
//
//  NSString+Status.h
//  NIMDemo
//
//  Created by chris on 15/2/12.
//  Copyright (c) 2015年 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import <UIKit/UIKit.h>
#import <UIKit/UIKit.h>

//: NSString * emptyString(NSString *anMaybeEmptyString);
NSString * emptyString(NSString *anMaybeEmptyString);

//: @interface NSString (NTES)
@interface NSString (Status)

//: - (CGSize)stringSizeWithFont:(UIFont *)font;
- (CGSize)image:(UIFont *)font;

//: - (NSString *)MD5String;
- (NSString *)nameWith;

//: - (NSUInteger)getBytesLength;
- (NSUInteger)back;

//: - (NSString *)stringByDeletingPictureResolution;
- (NSString *)nameImageResolution;

//: - (NSString *)tokenByPassword;
- (NSString *)equal;

//: - (NSString *)ntes_localized;
- (NSString *)language;

//: + (NSString *)randomStringWithLength:(NSUInteger)length;
+ (NSString *)hideHitOrMiss:(NSUInteger)length;

//: @end
@end