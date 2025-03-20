// __DEBUG__
// __CLOSE_PRINT__
//
//  UIImage+TingCompress.h
//  sohunews
//
//  Created by tianyulong on 2018/10/23.
//  Copyright © 2018 Sohu.com. All rights reserved.
//

// __M_A_C_R_O__
//: #import <UIKit/UIKit.h>
#import <UIKit/UIKit.h>

//: NS_ASSUME_NONNULL_BEGIN
NS_ASSUME_NONNULL_BEGIN

//: @interface UIImage (SNCompress)
@interface UIImage (TingCompress)


/**
 最大长度限制

 @param maxLength max
 @return back data
 */
//: - (NSData *)compressQualityWithMaxLength:(NSInteger)maxLength ;
- (NSData *)text:(NSInteger)maxLength ;


//: - (NSData *)compressWithMaxLength:(NSUInteger)maxLength;
- (NSData *)progress:(NSUInteger)maxLength;

//: - (NSData *)compressionQualityCompress;
- (NSData *)quality;
//: @end
@end

//: NS_ASSUME_NONNULL_END
NS_ASSUME_NONNULL_END