
#import <Foundation/Foundation.h>

NSString *StringFromSpecialSessionData(Byte *data);


//: tiff
Byte str_joinAnimalName[] = {14, 4, 13, 183, 216, 145, 107, 150, 66, 71, 158, 124, 122, 102, 102, 105, 116, 162};


//: jpeg
Byte str_pointAccordingData[] = {13, 4, 9, 57, 208, 2, 183, 195, 232, 103, 101, 112, 106, 5};


//: png
Byte str_leasedData[] = {69, 3, 13, 104, 207, 106, 48, 47, 68, 240, 48, 114, 204, 103, 110, 112, 44};


//: gif
Byte str_administrativeImposePersonalityValue[] = {90, 3, 9, 246, 109, 129, 46, 246, 248, 102, 105, 103, 148};


//: yyyy-MM-dd HH:mm:ss
Byte str_heavyPoolValue[] = {31, 19, 4, 42, 115, 115, 58, 109, 109, 58, 72, 72, 32, 100, 100, 45, 77, 77, 45, 121, 121, 121, 121, 227};

// __DEBUG__
// __CLOSE_PRINT__
//
//  UIImage+KIImage.m
//  Kitalker
//
//  Created by 杨 烽 on 12-8-3.
//
//

// __M_A_C_R_O__
//: #import "UIImage+KIAdditions.h"
#import "UIImage+TextMax.h"

//: @implementation UIImage (KIAdditions)
@implementation UIImage (TextMax)

//: - (UIImage *)flip:(BOOL)isHorizontal {
- (UIImage *)theUser:(BOOL)isHorizontal {
    //: CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    //: if (&UIGraphicsBeginImageContextWithOptions != NULL) {
    if (&UIGraphicsBeginImageContextWithOptions != NULL) {
        //: UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
        UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    }
    //    else {
    //        UIGraphicsBeginImageContext(rect.size);
    //    }
    //: CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    //: CGContextClipToRect(ctx, rect);
    CGContextClipToRect(ctx, rect);
    //: if (isHorizontal) {
    if (isHorizontal) {
        //: CGContextRotateCTM(ctx, 3.14159265358979323846264338327950288);
        CGContextRotateCTM(ctx, 3.14159265358979323846264338327950288);
        //: CGContextTranslateCTM(ctx, -rect.size.width, -rect.size.height);
        CGContextTranslateCTM(ctx, -rect.size.width, -rect.size.height);
    }
    //: CGContextDrawImage(ctx, rect, self.CGImage);
    CGContextDrawImage(ctx, rect, self.CGImage);
    //: UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    //: UIGraphicsEndImageContext();
    UIGraphicsEndImageContext();
    //: return image;
    return image;
}

//: - (UIImage *)flipVertical {
- (UIImage *)viewBy {
    //: return [self flip:NO];
    return [self theUser:NO];
}

//: - (UIImage *)flipHorizontal {
- (UIImage *)item {
    //: return [self flip:YES];
    return [self theUser:YES];
}

//: - (UIImage *)resizeTo:(CGSize)size {
- (UIImage *)max:(CGSize)size {
    //: return [self resizeToWidth:size.width height:size.height];
    return [self dismissMessage:size.width selection:size.height];
}

//: - (UIImage *)resizeToWidth:(CGFloat)width height:(CGFloat)height {
- (UIImage *)dismissMessage:(CGFloat)width selection:(CGFloat)height {
    //: CGSize size = CGSizeMake(width, height);
    CGSize size = CGSizeMake(width, height);
    //: if (&UIGraphicsBeginImageContextWithOptions != NULL) {
    if (&UIGraphicsBeginImageContextWithOptions != NULL) {
        //: UIGraphicsBeginImageContextWithOptions(size, NO, 0);
        UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    }

    //: [self drawInRect:CGRectMake(0, 0, width, height)];
    [self drawInRect:CGRectMake(0, 0, width, height)];
    //: UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    //: UIGraphicsEndImageContext();
    UIGraphicsEndImageContext();
    //: return image;
    return image;
}

//: - (UIImage *)scaleWithWidth:(CGFloat)width {
- (UIImage *)rangeWidth:(CGFloat)width {
    //: CGSize imageSize = [self size];
    CGSize imageSize = [self size];
    //: CGFloat scale = imageSize.width / width;
    CGFloat scale = imageSize.width / width;
    //: CGFloat height = imageSize.height / scale;
    CGFloat height = imageSize.height / scale;
    //: return [self resizeToWidth:width height:height];
    return [self dismissMessage:width selection:height];
}

//: - (UIImage *)scaleWithHeight:(CGFloat)heigh {
- (UIImage *)viewDoing:(CGFloat)heigh {
    //: CGSize imageSize = [self size];
    CGSize imageSize = [self size];
    //: CGFloat scale = imageSize.height / heigh;
    CGFloat scale = imageSize.height / heigh;
    //: CGFloat width = imageSize.width / scale;
    CGFloat width = imageSize.width / scale;
    //: return [self resizeToWidth:width height:heigh];
    return [self dismissMessage:width selection:heigh];
}

//: - (UIImage *)cropImageWithX:(CGFloat)x y:(CGFloat)y width:(CGFloat)width height:(CGFloat)height {
- (UIImage *)archipelagoPlace:(CGFloat)x show:(CGFloat)y bar:(CGFloat)width beggarMyNeighbourPolicy:(CGFloat)height {
    //: CGRect rect = CGRectMake(x, y, width, height);
    CGRect rect = CGRectMake(x, y, width, height);
    //: CGImageRef imageRef = CGImageCreateWithImageInRect(self.CGImage, rect);
    CGImageRef imageRef = CGImageCreateWithImageInRect(self.CGImage, rect);
    //: UIImage *image = [UIImage imageWithCGImage:imageRef];
    UIImage *image = [UIImage imageWithCGImage:imageRef];
    //: CGImageRelease(imageRef);
    CGImageRelease(imageRef);
    //: return image;
    return image;
}

//: - (UIImage *)decodedImage {
- (UIImage *)messageImage {
    //: CGImageRef imageRef = self.CGImage;
    CGImageRef imageRef = self.CGImage;
    //: CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    //: CGContextRef context = CGBitmapContextCreate(NULL,
    CGContextRef context = CGBitmapContextCreate(NULL,
                                                 //: CGImageGetWidth(imageRef),
                                                 CGImageGetWidth(imageRef),
                                                 //: CGImageGetHeight(imageRef),
                                                 CGImageGetHeight(imageRef),
                                                 //: 8,
                                                 8,
                                                 // Just always return width * 4 will be enough
                                                 //: CGImageGetWidth(imageRef) * 4,
                                                 CGImageGetWidth(imageRef) * 4,
                                                 // System only supports RGB, set explicitly
                                                 //: colorSpace,
                                                 colorSpace,
                                                 // Makes system don't need to do extra conversion when displayed.
                                                 // NOTE: here we remove the alpha channel for performance. Most of the time, images loaded
                                                 //       from the network are jpeg with no alpha channel. As a TODO, finding a way to detect
                                                 //       if alpha channel is necessary would be nice.
                                                 //: kCGImageAlphaNoneSkipLast | kCGBitmapByteOrder32Little);
                                                 kCGImageAlphaNoneSkipLast | kCGBitmapByteOrder32Little);
    //: CGColorSpaceRelease(colorSpace);
    CGColorSpaceRelease(colorSpace);
    //: if (!context) return nil;
    if (!context) return nil;

    //: CGRect rect = (CGRect){CGPointZero,{CGImageGetWidth(imageRef), CGImageGetHeight(imageRef)}};
    CGRect rect = (CGRect){CGPointZero,{CGImageGetWidth(imageRef), CGImageGetHeight(imageRef)}};
    //: CGContextDrawImage(context, rect, imageRef);
    CGContextDrawImage(context, rect, imageRef);
    //: CGImageRef decompressedImageRef = CGBitmapContextCreateImage(context);
    CGImageRef decompressedImageRef = CGBitmapContextCreateImage(context);
    //: CGContextRelease(context);
    CGContextRelease(context);

    //: UIImage *decompressedImage = [[UIImage alloc] initWithCGImage:decompressedImageRef scale:self.scale orientation:self.imageOrientation];
    UIImage *decompressedImage = [[UIImage alloc] initWithCGImage:decompressedImageRef scale:self.scale orientation:self.imageOrientation];
    //: CGImageRelease(decompressedImageRef);
    CGImageRelease(decompressedImageRef);
    //: return decompressedImage;
    return decompressedImage;
}

//: - (UIImage *)fixOrientation {
- (UIImage *)person {
    //: if (self.imageOrientation == UIImageOrientationUp) return self;
    if (self.imageOrientation == UIImageOrientationUp) return self;

    //: CGAffineTransform transform = CGAffineTransformIdentity;
    CGAffineTransform transform = CGAffineTransformIdentity;

    //: switch (self.imageOrientation) {
    switch (self.imageOrientation) {
        //: case UIImageOrientationDown:
        case UIImageOrientationDown:
        //: case UIImageOrientationDownMirrored:
        case UIImageOrientationDownMirrored:
            //: transform = CGAffineTransformTranslate(transform, self.size.width, self.size.height);
            transform = CGAffineTransformTranslate(transform, self.size.width, self.size.height);
            //: transform = CGAffineTransformRotate(transform, 3.14159265358979323846264338327950288);
            transform = CGAffineTransformRotate(transform, 3.14159265358979323846264338327950288);
            //: break;
            break;

        //: case UIImageOrientationLeft:
        case UIImageOrientationLeft:
        //: case UIImageOrientationLeftMirrored:
        case UIImageOrientationLeftMirrored:
            //: transform = CGAffineTransformTranslate(transform, self.size.width, 0);
            transform = CGAffineTransformTranslate(transform, self.size.width, 0);
            //: transform = CGAffineTransformRotate(transform, 1.57079632679489661923132169163975144);
            transform = CGAffineTransformRotate(transform, 1.57079632679489661923132169163975144);
            //: break;
            break;

        //: case UIImageOrientationRight:
        case UIImageOrientationRight:
        //: case UIImageOrientationRightMirrored:
        case UIImageOrientationRightMirrored:
            //: transform = CGAffineTransformTranslate(transform, 0, self.size.height);
            transform = CGAffineTransformTranslate(transform, 0, self.size.height);
            //: transform = CGAffineTransformRotate(transform, -1.57079632679489661923132169163975144);
            transform = CGAffineTransformRotate(transform, -1.57079632679489661923132169163975144);
            //: break;
            break;
        //: case UIImageOrientationUp:
        case UIImageOrientationUp:
        //: case UIImageOrientationUpMirrored:
        case UIImageOrientationUpMirrored:
            //: break;
            break;
    }

    //: switch (self.imageOrientation) {
    switch (self.imageOrientation) {
        //: case UIImageOrientationUpMirrored:
        case UIImageOrientationUpMirrored:
        //: case UIImageOrientationDownMirrored:
        case UIImageOrientationDownMirrored:
            //: transform = CGAffineTransformTranslate(transform, self.size.width, 0);
            transform = CGAffineTransformTranslate(transform, self.size.width, 0);
            //: transform = CGAffineTransformScale(transform, -1, 1);
            transform = CGAffineTransformScale(transform, -1, 1);
            //: break;
            break;

        //: case UIImageOrientationLeftMirrored:
        case UIImageOrientationLeftMirrored:
        //: case UIImageOrientationRightMirrored:
        case UIImageOrientationRightMirrored:
            //: transform = CGAffineTransformTranslate(transform, self.size.height, 0);
            transform = CGAffineTransformTranslate(transform, self.size.height, 0);
            //: transform = CGAffineTransformScale(transform, -1, 1);
            transform = CGAffineTransformScale(transform, -1, 1);
            //: break;
            break;
        //: case UIImageOrientationUp:
        case UIImageOrientationUp:
        //: case UIImageOrientationDown:
        case UIImageOrientationDown:
        //: case UIImageOrientationLeft:
        case UIImageOrientationLeft:
        //: case UIImageOrientationRight:
        case UIImageOrientationRight:
            //: break;
            break;
    }
    //: CGContextRef ctx = CGBitmapContextCreate(NULL, self.size.width, self.size.height,
    CGContextRef ctx = CGBitmapContextCreate(NULL, self.size.width, self.size.height,
                                             //: CGImageGetBitsPerComponent(self.CGImage), 0,
                                             CGImageGetBitsPerComponent(self.CGImage), 0,
                                             //: CGImageGetColorSpace(self.CGImage),
                                             CGImageGetColorSpace(self.CGImage),
                                             //: CGImageGetBitmapInfo(self.CGImage));
                                             CGImageGetBitmapInfo(self.CGImage));
    //: CGContextConcatCTM(ctx, transform);
    CGContextConcatCTM(ctx, transform);
    //: switch (self.imageOrientation) {
    switch (self.imageOrientation) {
        //: case UIImageOrientationLeft:
        case UIImageOrientationLeft:
        //: case UIImageOrientationLeftMirrored:
        case UIImageOrientationLeftMirrored:
        //: case UIImageOrientationRight:
        case UIImageOrientationRight:
        //: case UIImageOrientationRightMirrored:
        case UIImageOrientationRightMirrored:
            //: CGContextDrawImage(ctx, CGRectMake(0,0,self.size.height,self.size.width), self.CGImage);
            CGContextDrawImage(ctx, CGRectMake(0,0,self.size.height,self.size.width), self.CGImage);
            //: break;
            break;
        //: default:
        default:
            //: CGContextDrawImage(ctx, CGRectMake(0,0,self.size.width,self.size.height), self.CGImage);
            CGContextDrawImage(ctx, CGRectMake(0,0,self.size.width,self.size.height), self.CGImage);
            //: break;
            break;
    }

    //: CGImageRef cgimg = CGBitmapContextCreateImage(ctx);
    CGImageRef cgimg = CGBitmapContextCreateImage(ctx);
    //: UIImage *img = [UIImage imageWithCGImage:cgimg];
    UIImage *img = [UIImage imageWithCGImage:cgimg];
    //: CGContextRelease(ctx);
    CGContextRelease(ctx);
    //: CGImageRelease(cgimg);
    CGImageRelease(cgimg);
    //: return img;
    return img;
}

//: - (UIImage *)decoded;
- (UIImage *)data;
{
    //: CGImageRef imageRef = self.CGImage;
    CGImageRef imageRef = self.CGImage;
    //: CGSize imageSize = CGSizeMake(CGImageGetWidth(imageRef), CGImageGetHeight(imageRef));
    CGSize imageSize = CGSizeMake(CGImageGetWidth(imageRef), CGImageGetHeight(imageRef));
    //: CGRect imageRect = (CGRect){.origin = CGPointZero, .size = imageSize};
    CGRect imageRect = (CGRect){.origin = CGPointZero, .size = imageSize};

    //: CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    //: CGBitmapInfo bitmapInfo = CGImageGetBitmapInfo(imageRef);
    CGBitmapInfo bitmapInfo = CGImageGetBitmapInfo(imageRef);

    //: int infoMask = (bitmapInfo & kCGBitmapAlphaInfoMask);
    int infoMask = (bitmapInfo & kCGBitmapAlphaInfoMask);
    //: BOOL anyNonAlpha = (infoMask == kCGImageAlphaNone ||
    BOOL anyNonAlpha = (infoMask == kCGImageAlphaNone ||
                        //: infoMask == kCGImageAlphaNoneSkipFirst ||
                        infoMask == kCGImageAlphaNoneSkipFirst ||
                        //: infoMask == kCGImageAlphaNoneSkipLast);
                        infoMask == kCGImageAlphaNoneSkipLast);
    //: if (infoMask == kCGImageAlphaNone && CGColorSpaceGetNumberOfComponents(colorSpace) > 1) {
    if (infoMask == kCGImageAlphaNone && CGColorSpaceGetNumberOfComponents(colorSpace) > 1) {
        //: bitmapInfo &= ~kCGBitmapAlphaInfoMask;
        bitmapInfo &= ~kCGBitmapAlphaInfoMask;
        //: bitmapInfo |= kCGImageAlphaNoneSkipFirst;
        bitmapInfo |= kCGImageAlphaNoneSkipFirst;
    //: } else if (!anyNonAlpha && CGColorSpaceGetNumberOfComponents(colorSpace) == 3) {
    } else if (!anyNonAlpha && CGColorSpaceGetNumberOfComponents(colorSpace) == 3) {
        //: bitmapInfo &= ~kCGBitmapAlphaInfoMask;
        bitmapInfo &= ~kCGBitmapAlphaInfoMask;
        //: bitmapInfo |= kCGImageAlphaPremultipliedFirst;
        bitmapInfo |= kCGImageAlphaPremultipliedFirst;
    }

    //: CGContextRef context = CGBitmapContextCreate(NULL,
    CGContextRef context = CGBitmapContextCreate(NULL,
                                                 //: imageSize.width,
                                                 imageSize.width,
                                                 //: imageSize.height,
                                                 imageSize.height,
                                                 //: CGImageGetBitsPerComponent(imageRef),
                                                 CGImageGetBitsPerComponent(imageRef),
                                                 //: 0,
                                                 0,
                                                 //: colorSpace,
                                                 colorSpace,
                                                 //: bitmapInfo);
                                                 bitmapInfo);
    //: CGColorSpaceRelease(colorSpace);
    CGColorSpaceRelease(colorSpace);

    //: if (!context) return self;
    if (!context) return self;

    //: CGContextDrawImage(context, imageRect, imageRef);
    CGContextDrawImage(context, imageRect, imageRef);
    //: CGImageRef decompressedImageRef = CGBitmapContextCreateImage(context);
    CGImageRef decompressedImageRef = CGBitmapContextCreateImage(context);

    //: CGContextRelease(context);
    CGContextRelease(context);

    //: UIImage *decompressedImage = [UIImage imageWithCGImage:decompressedImageRef
    UIImage *decompressedImage = [UIImage imageWithCGImage:decompressedImageRef
                                                     //: scale:self.scale
                                                     scale:self.scale
                                               //: orientation:self.imageOrientation];
                                               orientation:self.imageOrientation];
    //: CGImageRelease(decompressedImageRef);
    CGImageRelease(decompressedImageRef);
    //: return decompressedImage;
    return decompressedImage;
}

//: - (UIImage *)addMark:(NSString *)mark textColor:(UIColor *)textColor font:(UIFont *)font point:(CGPoint)point {
- (UIImage *)recordPoint:(NSString *)mark titleManagerSize:(UIColor *)textColor show:(UIFont *)font datePoint:(CGPoint)point {
    //: CGSize size = self.size;
    CGSize size = self.size;
    //: if (&UIGraphicsBeginImageContextWithOptions != NULL) {
    if (&UIGraphicsBeginImageContextWithOptions != NULL) {
        //: UIGraphicsBeginImageContextWithOptions(size, NO, 0);
        UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    }
    //    else {
    //        UIGraphicsBeginImageContext(size);
    //    }

    //: [self drawInRect:CGRectMake(0, 0, size.width, size.height)];
    [self drawInRect:CGRectMake(0, 0, size.width, size.height)];

    //: if (textColor == nil) {
    if (textColor == nil) {
        //: textColor = [UIColor whiteColor];
        textColor = [UIColor whiteColor];
    }

    //: [textColor setFill];
    [textColor setFill];

    //: if (font == nil) {
    if (font == nil) {
        //: font = [UIFont systemFontOfSize:14.0f];
        font = [UIFont systemFontOfSize:14.0f];
    }


    //: CGRect rect = CGRectMake(point.x, point.y, size.width, size.height);
    CGRect rect = CGRectMake(point.x, point.y, size.width, size.height);
    //: NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    //: paragraphStyle.lineBreakMode = NSLineBreakByCharWrapping;
    paragraphStyle.lineBreakMode = NSLineBreakByCharWrapping;
    //: NSDictionary *attributes = @{NSFontAttributeName: font, NSParagraphStyleAttributeName: paragraphStyle};
    NSDictionary *attributes = @{NSFontAttributeName: font, NSParagraphStyleAttributeName: paragraphStyle};
    //: [mark drawInRect:rect withAttributes:attributes];
    [mark drawInRect:rect withAttributes:attributes];

    //    [mark drawAtPoint:point
    //             forWidth:self.size.width
    //             withFont:font
    //        lineBreakMode:NSLineBreakByCharWrapping];




    //: UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    //: UIGraphicsEndImageContext();
    UIGraphicsEndImageContext();
    //: return image;
    return image;
}

//: - (UIImage *)addCreateTime {
- (UIImage *)success {
    //: NSDate *date = [NSDate date];
    NSDate *date = [NSDate date];
    //: NSDateFormatter *df = [[NSDateFormatter alloc] init];
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    //: [df setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    [df setDateFormat:StringFromSpecialSessionData(str_heavyPoolValue)];
    //: NSString *dateString = [df stringFromDate:date];
    NSString *dateString = [df stringFromDate:date];

    //: CGSize size = [dateString boundingRectWithSize:CGSizeMake(self.size.width, 1.7976931348623157e+308) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:16.0f]}context:nil].size;
    CGSize size = [dateString boundingRectWithSize:CGSizeMake(self.size.width, 1.7976931348623157e+308) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:16.0f]}context:nil].size;
    //    [dateString sizeWithFont:[UIFont boldSystemFontOfSize:16.0f]
    //                         constrainedToSize:CGSizeMake(self.size.width, CGFLOAT_MAX)
    //                             lineBreakMode:NSLineBreakByCharWrapping];

    //: return [self addMark:dateString
    return [self recordPoint:dateString
               //: textColor:[UIColor blackColor]
               titleManagerSize:[UIColor blackColor]
                    //: font:[UIFont boldSystemFontOfSize:16.0f]
                    show:[UIFont boldSystemFontOfSize:16.0f]
                   //: point:CGPointMake(self.size.width-size.width-10, self.size.height-size.height-10)];
                   datePoint:CGPointMake(self.size.width-size.width-10, self.size.height-size.height-10)];

}

//: + (NSString *) contentTypeExtensionForImageData:(NSData *)data{
+ (NSString *) camera:(NSData *)data{
    //: uint8_t c;
    uint8_t c;
    //: [data getBytes:&c length:1];
    [data getBytes:&c length:1];

    //: switch (c) {
    switch (c) {
        //: case 0xFF:
        case 0xFF:
            //: return @"jpeg";
            return StringFromSpecialSessionData(str_pointAccordingData);
        //: case 0x89:
        case 0x89:
            //: return @"png";
            return StringFromSpecialSessionData(str_leasedData);
        //: case 0x47:
        case 0x47:
            //: return @"gif";
            return StringFromSpecialSessionData(str_administrativeImposePersonalityValue);
        //: case 0x49:
        case 0x49:
        //: case 0x4D:
        case 0x4D:
            //: return @"tiff";
            return StringFromSpecialSessionData(str_joinAnimalName);
    }
    //: return @"";
    return @"";
}

//: CGFloat KKDegreesToRadians(CGFloat degrees) {return degrees * 3.14159265358979323846264338327950288 / 180;};
CGFloat KKDegreesToRadians(CGFloat degrees) {return degrees * 3.14159265358979323846264338327950288 / 180;};
//: CGFloat KKRadiansToDegrees(CGFloat radians) {return radians * 180/3.14159265358979323846264338327950288;};
CGFloat KKRadiansToDegrees(CGFloat radians) {return radians * 180/3.14159265358979323846264338327950288;};
//: - (UIImage *)imageRotatedByDegrees:(CGFloat)degrees{
- (UIImage *)shouldRequestStart:(CGFloat)degrees{
    // calculate the size of the rotated view's containing box for our drawing space
    //: UIView *rotatedViewBox = [[UIView alloc] initWithFrame:CGRectMake(0,0,self.size.width, self.size.height)];
    UIView *rotatedViewBox = [[UIView alloc] initWithFrame:CGRectMake(0,0,self.size.width, self.size.height)];
    //: CGAffineTransform t = CGAffineTransformMakeRotation(KKDegreesToRadians(degrees));
    CGAffineTransform t = CGAffineTransformMakeRotation(KKDegreesToRadians(degrees));
    //: rotatedViewBox.transform = t;
    rotatedViewBox.transform = t;
    //: CGSize rotatedSize = rotatedViewBox.frame.size;
    CGSize rotatedSize = rotatedViewBox.frame.size;

    // Create the bitmap context
    //: UIGraphicsBeginImageContext(rotatedSize);
    UIGraphicsBeginImageContext(rotatedSize);
    //: CGContextRef bitmap = UIGraphicsGetCurrentContext();
    CGContextRef bitmap = UIGraphicsGetCurrentContext();

    // Move the origin to the middle of the image so we will rotate and scale around the center.
    //: CGContextTranslateCTM(bitmap, rotatedSize.width/2, rotatedSize.height/2);
    CGContextTranslateCTM(bitmap, rotatedSize.width/2, rotatedSize.height/2);

    //   // Rotate the image context
    //: CGContextRotateCTM(bitmap, KKDegreesToRadians(degrees));
    CGContextRotateCTM(bitmap, KKDegreesToRadians(degrees));

    // Now, draw the rotated/scaled image into the context
    //: CGContextScaleCTM(bitmap, 1.0, -1.0);
    CGContextScaleCTM(bitmap, 1.0, -1.0);
    //: CGContextDrawImage(bitmap, CGRectMake(-self.size.width / 2, -self.size.height / 2, self.size.width, self.size.height), [self CGImage]);
    CGContextDrawImage(bitmap, CGRectMake(-self.size.width / 2, -self.size.height / 2, self.size.width, self.size.height), [self CGImage]);

    //: UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    //: UIGraphicsEndImageContext();
    UIGraphicsEndImageContext();
    //: return newImage;
    return newImage;
}

//: - (UIImage*)convertImageToScale:(double)scale{
- (UIImage*)iconScale:(double)scale{


    //: CGSize newImageSize = CGSizeMake(self.size.width * scale, self.size.height * scale);
    CGSize newImageSize = CGSizeMake(self.size.width * scale, self.size.height * scale);
    //: UIGraphicsBeginImageContext(newImageSize);
    UIGraphicsBeginImageContext(newImageSize);
    //: [self drawInRect:CGRectMake(0, 0, newImageSize.width, newImageSize.height)];
    [self drawInRect:CGRectMake(0, 0, newImageSize.width, newImageSize.height)];
    //: UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    //: UIGraphicsEndImageContext();
    UIGraphicsEndImageContext();
    //: return newImage;
    return newImage;
}

//referWidth：压缩后的宽带，高等比压缩
//: + (UIImage *)scaleToSize:(UIImage *)img referWidth:(CGFloat)referWidth{
+ (UIImage *)start:(UIImage *)img mail:(CGFloat)referWidth{
    //NSLog(@"\n originImage-------width:%f,height:%f,big:%f", img.size.width,img.size.height,  UIImageJPEGRepresentation(img, 1).length / 1024.0/1024);

    //: CGFloat width = referWidth;
    CGFloat width = referWidth;
    //: CGFloat height = (referWidth / img.size.width) * img.size.height;
    CGFloat height = (referWidth / img.size.width) * img.size.height;

    // 创建一个bitmap的context
    // 并把它设置成为当前正在使用的context
    //: UIGraphicsBeginImageContext(CGSizeMake(width, height));
    UIGraphicsBeginImageContext(CGSizeMake(width, height));
    // 绘制改变大小的图片
    //: [img drawInRect:CGRectMake(0,0, width, height)];
    [img drawInRect:CGRectMake(0,0, width, height)];
    // 从当前context中创建一个改变大小后的图片
    //: UIImage* scaledImage =UIGraphicsGetImageFromCurrentImageContext();
    UIImage* scaledImage =UIGraphicsGetImageFromCurrentImageContext();
    // 使当前的context出堆栈
    //: UIGraphicsEndImageContext();
    UIGraphicsEndImageContext();
    //返回新的改变大小后的图片

    //NSLog(@"\n scaledImage-------width:%f,height:%f,big:%f", scaledImage.size.width,scaledImage.size.height,  UIImageJPEGRepresentation(scaledImage, 1).length / 1024.0/1024);
    //: return scaledImage;
    return scaledImage;
}

//referSize：压缩后图片大小
//: + (UIImage *)scaleToSize:(UIImage *)img referSize:(CGFloat)referSize{
+ (UIImage *)tap:(UIImage *)img cellTitle:(CGFloat)referSize{
    //: CGFloat size = UIImageJPEGRepresentation(img, 1.0).length / 1024.0;
    CGFloat size = UIImageJPEGRepresentation(img, 1.0).length / 1024.0;
    //: if (size <= referSize) {
    if (size <= referSize) {
        //: return img;
        return img;
    }

    //: CGFloat scale = referSize / size;
    CGFloat scale = referSize / size;
    //: scale = sqrt(scale);
    scale = sqrt(scale);
    //: CGFloat width = img.size.width * scale;
    CGFloat width = img.size.width * scale;
    //: CGFloat height = img.size.height * scale;
    CGFloat height = img.size.height * scale;

    // 创建一个bitmap的context
    // 并把它设置成为当前正在使用的context
    //: UIGraphicsBeginImageContext(CGSizeMake(width, height));
    UIGraphicsBeginImageContext(CGSizeMake(width, height));
    // 绘制改变大小的图片
    //: [img drawInRect:CGRectMake(0,0, width, height)];
    [img drawInRect:CGRectMake(0,0, width, height)];
    // 从当前context中创建一个改变大小后的图片
    //: UIImage* scaledImage =UIGraphicsGetImageFromCurrentImageContext();
    UIImage* scaledImage =UIGraphicsGetImageFromCurrentImageContext();
    // 使当前的context出堆栈
    //: UIGraphicsEndImageContext();
    UIGraphicsEndImageContext();
    //返回新的改变大小后的图片
    //: return scaledImage;
    return scaledImage;
}

//: + (UIImage *)scaleToNormalSize:(UIImage *)originImage{
+ (UIImage *)background:(UIImage *)originImage{
    //: NSData *originData = UIImageJPEGRepresentation(originImage, 1);
    NSData *originData = UIImageJPEGRepresentation(originImage, 1);
    //CGFloat size = originData.length / 1024.0/1024;

    //: CGFloat rota = 1 / (originData.length/1024/1024.0f / 0.2);
    CGFloat rota = 1 / (originData.length/1024/1024.0f / 0.2);

    //: NSData *newData = UIImageJPEGRepresentation(originImage, sqrtf(rota));
    NSData *newData = UIImageJPEGRepresentation(originImage, sqrtf(rota));

    //NSLog(@"\n ---------originData:%f, newData:%f", size, newData.length / 1024.0/1024);
    //: UIImage *newImage = [UIImage imageWithData:newData];
    UIImage *newImage = [UIImage imageWithData:newData];

    //: return newImage;
    return newImage;
}


//+ (UIImage *)checkImage:(UIImage *)originImage{
//    
//    UIImage *scaleImage = originImage;
//    
//    CGFloat screenScale = [[UIScreen mainScreen] scale];
//    CGFloat scaleWidth = SCREEN_WIDTH * screenScale * 1.0;
//    CGFloat scaleheight = SCREEN_HEIGHT * screenScale * 1.0;
//    
//    if (originImage.size.width*originImage.scale > scaleWidth || originImage.size.height*originImage.scale > scaleheight) {
//        scaleImage = [originImage imageByScalingAndCroppingForSize:CGSizeMake(scaleWidth, scaleheight)];
//    }
//    
//    CGFloat totalFileMB = [UIImagePNGRepresentation(originImage) length];
//    if (totalFileMB > KIImageMaxSize) {
//        scaleImage = [UIImage compressionImage:originImage];
//    }
//    
//    
//    //NSLog(@"-------%f--%f", scaleImage.size.width, scaleImage.size.height);
//    return scaleImage;
//}
//
//+ (UIImage *)compressionImage:(UIImage *)originImage{
//    if (!originImage) {
//        return nil;
//    }
//    
//    CGFloat totalFileSize = [UIImageJPEGRepresentation(originImage,1) length];
//    //NSLog(@"-1------%.3f",  totalFileSize/1000.0f/1000.0f);
//    
//    if (totalFileSize > KIImageMaxSize) {
//        
//        CGFloat scale = sqrtf(KIImageMaxSize / totalFileSize);
//        CGFloat width = originImage.size.width * scale;
//        CGFloat height = originImage.size.height  * scale;
//        
//        // 创建一个bitmap的context
//        // 并把它设置成为当前正在使用的context
//        UIGraphicsBeginImageContext(CGSizeMake(width, height));
//        // 绘制改变大小的图片
//        [originImage drawInRect:CGRectMake(0,0, width, height)];
//        // 从当前context中创建一个改变大小后的图片
//        UIImage* scaledImage =UIGraphicsGetImageFromCurrentImageContext();
//        // 使当前的context出堆栈
//        UIGraphicsEndImageContext();
//        
//        //CGFloat totalFileMB = [UIImageJPEGRepresentation(scaledImage,1) length]/1000.0f/1000.0f;
//        //NSLog(@"-2------%.3f",  totalFileMB);
//        
//        //返回新的改变大小后的图片
//        return scaledImage;
//        
//    }
//    
//    return originImage;
//    
//}




//图片压缩到指定大小
//: - (UIImage*)imageByScalingAndCroppingForSize:(CGSize)targetSize
- (UIImage*)scaling:(CGSize)targetSize
{

    //: if (self.size.width*self.scale <= targetSize.width && self.size.height*self.scale <= targetSize.height) {
    if (self.size.width*self.scale <= targetSize.width && self.size.height*self.scale <= targetSize.height) {

        //: return self;
        return self;
    }



    //: UIImage *sourceImage = self;
    UIImage *sourceImage = self;
    //: UIImage *newImage = nil;
    UIImage *newImage = nil;
    //: CGSize imageSize = sourceImage.size;
    CGSize imageSize = sourceImage.size;
    //: CGFloat width = imageSize.width;
    CGFloat width = imageSize.width;
    //: CGFloat height = imageSize.height;
    CGFloat height = imageSize.height;
    //: CGFloat targetWidth = targetSize.width;
    CGFloat targetWidth = targetSize.width;
    //: CGFloat targetHeight = targetSize.height;
    CGFloat targetHeight = targetSize.height;
    //: CGFloat scaleFactor = 0.0;
    CGFloat scaleFactor = 0.0;
    //: CGFloat scaledWidth = targetWidth;
    CGFloat scaledWidth = targetWidth;
    //: CGFloat scaledHeight = targetHeight;
    CGFloat scaledHeight = targetHeight;
    //: CGPoint thumbnailPoint = CGPointMake(0.0,0.0);
    CGPoint thumbnailPoint = CGPointMake(0.0,0.0);

    //: if (__CGSizeEqualToSize(imageSize, targetSize) == NO)
    if (__CGSizeEqualToSize(imageSize, targetSize) == NO)
    {
        //: CGFloat widthFactor = targetWidth / width;
        CGFloat widthFactor = targetWidth / width;
        //: CGFloat heightFactor = targetHeight / height;
        CGFloat heightFactor = targetHeight / height;

        //: if (widthFactor > heightFactor)
        if (widthFactor > heightFactor)
            //: scaleFactor = heightFactor; 
            scaleFactor = heightFactor; // scale to fit height
        //: else
        else
            //: scaleFactor = widthFactor; 
            scaleFactor = widthFactor; // scale to fit width
        //: scaledWidth= width * scaleFactor;
        scaledWidth= width * scaleFactor;
        //: scaledHeight = height * scaleFactor;
        scaledHeight = height * scaleFactor;

    }

    //: UIGraphicsBeginImageContext(CGSizeMake(scaledWidth, scaledHeight)); 
    UIGraphicsBeginImageContext(CGSizeMake(scaledWidth, scaledHeight)); // this will crop

    //: CGRect thumbnailRect = CGRectZero;
    CGRect thumbnailRect = CGRectZero;
    //: thumbnailRect.origin = thumbnailPoint;
    thumbnailRect.origin = thumbnailPoint;
    //: thumbnailRect.size.width= scaledWidth;
    thumbnailRect.size.width= scaledWidth;
    //: thumbnailRect.size.height = scaledHeight;
    thumbnailRect.size.height = scaledHeight;

    //: [sourceImage drawInRect:thumbnailRect];
    [sourceImage drawInRect:thumbnailRect];

    //: newImage = UIGraphicsGetImageFromCurrentImageContext();
    newImage = UIGraphicsGetImageFromCurrentImageContext();
    //: if(newImage == nil)
    if(newImage == nil)
        //: NSLog(@"could not scale image");

    //pop the context to get back to the default
    //: UIGraphicsEndImageContext();
    UIGraphicsEndImageContext();
    //: return newImage;
    return newImage;
}


//图片压缩到指定大小
//: - (UIImage*)imageCroppingForSize:(CGSize)targetSize
- (UIImage*)view:(CGSize)targetSize
{
    //: UIImage *sourceImage = self;
    UIImage *sourceImage = self;
    //: UIImage *newImage = nil;
    UIImage *newImage = nil;
    //: CGSize imageSize = sourceImage.size;
    CGSize imageSize = sourceImage.size;
    //: CGFloat width = imageSize.width;
    CGFloat width = imageSize.width;
    //: CGFloat height = imageSize.height;
    CGFloat height = imageSize.height;
    //: CGFloat targetWidth = targetSize.width;
    CGFloat targetWidth = targetSize.width;
    //: CGFloat targetHeight = targetSize.height;
    CGFloat targetHeight = targetSize.height;
    //: CGFloat scaleFactor = 0.0;
    CGFloat scaleFactor = 0.0;
    //: CGFloat scaledWidth = targetWidth;
    CGFloat scaledWidth = targetWidth;
    //: CGFloat scaledHeight = targetHeight;
    CGFloat scaledHeight = targetHeight;
    //: CGPoint thumbnailPoint = CGPointMake(0.0,0.0);
    CGPoint thumbnailPoint = CGPointMake(0.0,0.0);

    //: if (__CGSizeEqualToSize(imageSize, targetSize) == NO)
    if (__CGSizeEqualToSize(imageSize, targetSize) == NO)
    {
        //: CGFloat widthFactor = targetWidth / width;
        CGFloat widthFactor = targetWidth / width;
        //: CGFloat heightFactor = targetHeight / height;
        CGFloat heightFactor = targetHeight / height;

        //: if (widthFactor > heightFactor)
        if (widthFactor > heightFactor)
            //: scaleFactor = widthFactor; 
            scaleFactor = widthFactor; // scale to fit height
        //: else
        else
            //: scaleFactor = heightFactor; 
            scaleFactor = heightFactor; // scale to fit width
        //: scaledWidth= width * scaleFactor;
        scaledWidth= width * scaleFactor;
        //: scaledHeight = height * scaleFactor;
        scaledHeight = height * scaleFactor;

        // center the image
        //: if (widthFactor > heightFactor)
        if (widthFactor > heightFactor)
        {
            //: thumbnailPoint.y = (targetHeight - scaledHeight) * 0.5;
            thumbnailPoint.y = (targetHeight - scaledHeight) * 0.5;
        }
        //: else if (widthFactor < heightFactor)
        else if (widthFactor < heightFactor)
        {
            //: thumbnailPoint.x = (targetWidth - scaledWidth) * 0.5;
            thumbnailPoint.x = (targetWidth - scaledWidth) * 0.5;
        }
    }

    //: UIGraphicsBeginImageContext(targetSize); 
    UIGraphicsBeginImageContext(targetSize); // this will crop

    //: CGRect thumbnailRect = CGRectZero;
    CGRect thumbnailRect = CGRectZero;
    //: thumbnailRect.origin = thumbnailPoint;
    thumbnailRect.origin = thumbnailPoint;
    //: thumbnailRect.size.width= scaledWidth;
    thumbnailRect.size.width= scaledWidth;
    //: thumbnailRect.size.height = scaledHeight;
    thumbnailRect.size.height = scaledHeight;

    //: [sourceImage drawInRect:thumbnailRect];
    [sourceImage drawInRect:thumbnailRect];

    //: newImage = UIGraphicsGetImageFromCurrentImageContext();
    newImage = UIGraphicsGetImageFromCurrentImageContext();
    //: if(newImage == nil)
    if(newImage == nil)
        //: NSLog(@"could not scale image");

    //pop the context to get back to the default
    //: UIGraphicsEndImageContext();
    UIGraphicsEndImageContext();
    //: return newImage;
    return newImage;
}


//: - (UIImage *)compressImageWithMaxLength:(NSUInteger)maxLength{
- (UIImage *)dogEar:(NSUInteger)maxLength{

    //: NSData *compressData = [self compressWithMaxLength:maxLength*1024];
    NSData *compressData = [self progress:maxLength*1024];

    //: UIImage *newImage = [[UIImage alloc]initWithData:compressData];
    UIImage *newImage = [[UIImage alloc]initWithData:compressData];

    //: return newImage;
    return newImage;
}

//: -(NSData *)compressWithMaxLength:(double)maxLength{
-(NSData *)progress:(double)maxLength{
    // Compress by quality
    //: CGFloat compression = 1;
    CGFloat compression = 1;
    //: NSData *data = UIImageJPEGRepresentation(self, compression);
    NSData *data = UIImageJPEGRepresentation(self, compression);
    //NSLog(@"Before compressing quality, image size = %ld KB",data.length/1024);
    //: if (data.length < maxLength) return data;
    if (data.length < maxLength) return data;

    //: CGFloat max = 1;
    CGFloat max = 1;
    //: CGFloat min = 0;
    CGFloat min = 0;
    //: for (int i = 0; i < 6; ++i) {
    for (int i = 0; i < 6; ++i) {
        //: compression = (max + min) / 2;
        compression = (max + min) / 2;
        //: data = UIImageJPEGRepresentation(self, compression);
        data = UIImageJPEGRepresentation(self, compression);
        //NSLog(@"Compression = %.1f", compression);
        //NSLog(@"In compressing quality loop, image size = %ld KB", data.length / 1024);
        //: if (data.length < maxLength * 0.9) {
        if (data.length < maxLength * 0.9) {
            //: min = compression;
            min = compression;
        //: } else if (data.length > maxLength) {
        } else if (data.length > maxLength) {
            //: max = compression;
            max = compression;
        //: } else {
        } else {
            //: break;
            break;
        }
    }
    //NSLog(@"After compressing quality, image size = %ld KB", data.length / 1024);
    //: if (data.length < maxLength) return data;
    if (data.length < maxLength) return data;
    //: UIImage *resultImage = [UIImage imageWithData:data];
    UIImage *resultImage = [UIImage imageWithData:data];
    // Compress by size
    //: NSUInteger lastDataLength = 0;
    NSUInteger lastDataLength = 0;
    //: while (data.length > maxLength && data.length != lastDataLength) {
    while (data.length > maxLength && data.length != lastDataLength) {
        //: lastDataLength = data.length;
        lastDataLength = data.length;
        //: CGFloat ratio = (CGFloat)maxLength / data.length;
        CGFloat ratio = (CGFloat)maxLength / data.length;
        //NSLog(@"Ratio = %.1f", ratio);
        //: CGSize size = CGSizeMake((NSUInteger)(resultImage.size.width * sqrtf(ratio)),
        CGSize size = CGSizeMake((NSUInteger)(resultImage.size.width * sqrtf(ratio)),
                                 //: (NSUInteger)(resultImage.size.height * sqrtf(ratio))); 
                                 (NSUInteger)(resultImage.size.height * sqrtf(ratio))); // Use NSUInteger to prevent white blank
        //: UIGraphicsBeginImageContext(size);
        UIGraphicsBeginImageContext(size);
        //: [resultImage drawInRect:CGRectMake(0, 0, size.width, size.height)];
        [resultImage drawInRect:CGRectMake(0, 0, size.width, size.height)];
        //: resultImage = UIGraphicsGetImageFromCurrentImageContext();
        resultImage = UIGraphicsGetImageFromCurrentImageContext();
        //: UIGraphicsEndImageContext();
        UIGraphicsEndImageContext();
        //: data = UIImageJPEGRepresentation(resultImage, compression);
        data = UIImageJPEGRepresentation(resultImage, compression);
        //NSLog(@"In compressing size loop, image size = %ld KB", data.length / 1024);
    }
    //NSLog(@"After compressing size loop, image size = %ld KB", data.length / 1024);
    //: return data;
    return data;
}

//: + (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size {
+ (UIImage *)infoSpace:(UIColor *)color color:(CGSize)size {
    //: if (!color || size.width <=0 || size.height <=0)
    if (!color || size.width <=0 || size.height <=0)
        //: return nil;
        return nil;
    //: CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
    //: UIGraphicsBeginImageContextWithOptions(rect.size,NO, 0);
    UIGraphicsBeginImageContextWithOptions(rect.size,NO, 0);
    //: CGContextRef context =UIGraphicsGetCurrentContext();
    CGContextRef context =UIGraphicsGetCurrentContext();
    //: CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextSetFillColorWithColor(context, color.CGColor);
    //: CGContextFillRect(context, rect);
    CGContextFillRect(context, rect);
    //: UIImage *image =UIGraphicsGetImageFromCurrentImageContext();
    UIImage *image =UIGraphicsGetImageFromCurrentImageContext();
    //: UIGraphicsEndImageContext();
    UIGraphicsEndImageContext();
    //: return image;
    return image;
}


//: @end
@end

Byte * SpecialSessionDataToCache(Byte *data) {
    int only = data[0];
    int how = data[1];
    int sad = data[2];
    if (!only) return data + sad;
    for (int i = 0; i < how / 2; i++) {
        int begin = sad + i;
        int end = sad + how - i - 1;
        Byte temp = data[begin];
        data[begin] = data[end];
        data[end] = temp;
    }
    data[0] = 0;
    data[sad + how] = 0;
    return data + sad;
}

NSString *StringFromSpecialSessionData(Byte *data) {
    return [NSString stringWithUTF8String:(char *)SpecialSessionDataToCache(data)];
}  
