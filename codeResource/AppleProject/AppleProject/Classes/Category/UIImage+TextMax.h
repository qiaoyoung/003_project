// __DEBUG__
// __CLOSE_PRINT__
//
//  UIImage+KIImage.h
//  Kitalker
//
//  Created by 杨 烽 on 12-8-3.
//
//

// __M_A_C_R_O__
//: #import <UIKit/UIKit.h>
#import <UIKit/UIKit.h>

//: @interface UIImage (KIAdditions)
@interface UIImage (TextMax)

/*垂直翻转*/
//: - (UIImage *)flipVertical;
- (UIImage *)viewBy;

/*水平翻转*/
//: - (UIImage *)flipHorizontal;
- (UIImage *)item;

/*改变size*/
//: - (UIImage *)resizeTo:(CGSize)size;
- (UIImage *)max:(CGSize)size;

//: - (UIImage *)resizeToWidth:(CGFloat)width height:(CGFloat)height;
- (UIImage *)dismissMessage:(CGFloat)width selection:(CGFloat)height;

/*等比例缩小图片至该宽度*/
//: - (UIImage *)scaleWithWidth:(CGFloat)width;
- (UIImage *)rangeWidth:(CGFloat)width;

/*等比例缩小图片至该高度*/
//: - (UIImage *)scaleWithHeight:(CGFloat)heigh;
- (UIImage *)viewDoing:(CGFloat)heigh;

/*裁切*/
//: - (UIImage *)cropImageWithX:(CGFloat)x y:(CGFloat)y width:(CGFloat)width height:(CGFloat)height;
- (UIImage *)archipelagoPlace:(CGFloat)x show:(CGFloat)y bar:(CGFloat)width beggarMyNeighbourPolicy:(CGFloat)height;

/*修正拍照图片方向*/
//: - (UIImage *)fixOrientation;
- (UIImage *)person;

//: - (UIImage *)decoded;
- (UIImage *)data;

//: - (UIImage *)addMark:(NSString *)mark textColor:(UIColor *)textColor font:(UIFont *)font point:(CGPoint)point;
- (UIImage *)recordPoint:(NSString *)mark titleManagerSize:(UIColor *)textColor show:(UIFont *)font datePoint:(CGPoint)point;

//: - (UIImage *)addCreateTime;
- (UIImage *)success;

//: - (UIImage *)imageRotatedByDegrees:(CGFloat)degrees;
- (UIImage *)shouldRequestStart:(CGFloat)degrees;





//: + (NSString *) contentTypeExtensionForImageData:(NSData *)data;
+ (NSString *) camera:(NSData *)data;

//: - (UIImage*)convertImageToScale:(double)scale;
- (UIImage*)iconScale:(double)scale;

//referWidth：压缩后的宽带，高等比压缩
//: + (UIImage *)scaleToSize:(UIImage *)img referWidth:(CGFloat)referWidth;
+ (UIImage *)start:(UIImage *)img mail:(CGFloat)referWidth;

//图片压缩到指定大小
//: - (UIImage*)imageByScalingAndCroppingForSize:(CGSize)targetSize;
- (UIImage*)scaling:(CGSize)targetSize;


//referSize：压缩后图片大小
//: + (UIImage *)scaleToSize:(UIImage *)img referSize:(CGFloat)referSize;
+ (UIImage *)tap:(UIImage *)img cellTitle:(CGFloat)referSize;

//: + (UIImage *)scaleToNormalSize:(UIImage *)originImage;
+ (UIImage *)background:(UIImage *)originImage;

//: + (UIImage *)checkImage:(UIImage *)originImage;
+ (UIImage *)auditoryImage:(UIImage *)originImage;
//: + (UIImage *)compressionImage:(UIImage *)originImage;
+ (UIImage *)can:(UIImage *)originImage;

//: - (UIImage *)compressImageWithMaxLength:(NSUInteger)maxLength;
- (UIImage *)dogEar:(NSUInteger)maxLength;

//: + (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;
+ (UIImage *)infoSpace:(UIColor *)color color:(CGSize)size;

//: @end
@end