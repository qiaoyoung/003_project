//
//  UIImage+SNCompress.h
//  sohunews
//
//  Created by tianyulong on 2018/10/23.
//  Copyright © 2018 Sohu.com. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (SNCompress)


/**
 最大长度限制

 @param maxLength max
 @return back data
 */
- (NSData *)compressQualityWithMaxLength:(NSInteger)maxLength ;


- (NSData *)compressWithMaxLength:(NSUInteger)maxLength;

- (NSData *)compressionQualityCompress;
@end

NS_ASSUME_NONNULL_END
