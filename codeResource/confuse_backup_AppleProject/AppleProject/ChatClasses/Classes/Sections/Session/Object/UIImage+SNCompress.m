//
//  UIImage+SNCompress.m
//  sohunews
//
//  Created by tianyulong on 2018/10/23.
//  Copyright © 2018 Sohu.com. All rights reserved.
//

#import "UIImage+SNCompress.h"

@implementation UIImage (SNCompress)

- (NSData *)compressQualityWithMaxLength:(NSInteger)maxLength {
    CGFloat compression = 1;
    NSData *data = UIImageJPEGRepresentation(self, compression);
    if (data.length < maxLength) return data;
    CGFloat max = 1;
    CGFloat min = 0;
    for (int i = 0; i < 6; ++i) {
        compression = (max + min) / 2;
        data = UIImageJPEGRepresentation(self, compression);
        if (data.length < maxLength * 0.9) {
            min = compression;
        } else if (data.length > maxLength) {
            max = compression;
        } else {
            break;
        }
    }
    return data;
}

-(NSData *)compressWithMaxLength:(NSUInteger)maxLength{
    // Compress by quality
    CGFloat compression = 1;
    NSData *data = UIImageJPEGRepresentation(self, compression);
    
    if (data.length < maxLength) return data;
    
    CGFloat max = 1;
    CGFloat min = 0;
    for (int i = 0; i < 6; ++i) {
        compression = (max + min) / 2;
        data = UIImageJPEGRepresentation(self, compression);
        if (data.length < maxLength * 0.9) {
            min = compression;
        } else if (data.length > maxLength) {
            max = compression;
        } else {
            break;
        }
    }
    
    if (data.length < maxLength) return data;
    UIImage *resultImage = [UIImage imageWithData:data];
    // Compress by size
    NSUInteger lastDataLength = 0;
    while (data.length > maxLength && data.length != lastDataLength) {
        lastDataLength = data.length;
        CGFloat ratio = (CGFloat)maxLength / data.length;
        //SNDebugLog(@"Ratio = %.1f", ratio);
        CGSize size = CGSizeMake((NSUInteger)(resultImage.size.width * sqrtf(ratio)),
                                 (NSUInteger)(resultImage.size.height * sqrtf(ratio))); // Use NSUInteger to prevent white blank
        UIGraphicsBeginImageContext(size);
        [resultImage drawInRect:CGRectMake(0, 0, size.width, size.height)];
        resultImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        data = UIImageJPEGRepresentation(resultImage, compression);
    }
    
    return data;
}

- (NSData *)compressionQualityCompress {
    //进行图像的画面质量压缩
    NSData *data=UIImageJPEGRepresentation(self, 1.0);
//    if (data.length>100*1024) {
//        if (data.length>1024*1024) {//1M以及以上
//            data=UIImageJPEGRepresentation(self, 0.9);
//        } else if (data.length>512*1024) {//0.5M-1M
//            data=UIImageJPEGRepresentation(self, 0.7);
//        } else if (data.length>200*1024) {
//            //0.25M-0.5M
//            data=UIImageJPEGRepresentation(self, 1);
//        }
//    }
    CGFloat compression    = 1.0f;
    CGFloat minCompression = 0.001f;
    CGFloat maxSize = 1024*1024;
    //每次减少的比例
    float scale = 0.1;
    //循环条件：没到最小压缩比例，且没压缩到目标大小
    while ((compression > minCompression) && (data.length>maxSize)) {
        compression -= scale;
        data = UIImageJPEGRepresentation(self,compression);
    }
    
    return data;
}

@end
