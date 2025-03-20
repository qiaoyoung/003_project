
#import <Foundation/Foundation.h>

NSString *StringFromAnotherData(Byte *data);


//: inputMessage
Byte str_ceremonyValue[] = {50, 12, 82, 10, 105, 155, 29, 192, 188, 214, 187, 192, 194, 199, 198, 159, 183, 197, 197, 179, 185, 183, 169};


//: inputCorrectionLevel
Byte str_breakfastName[] = {41, 20, 58, 9, 212, 28, 240, 161, 94, 163, 168, 170, 175, 174, 125, 169, 172, 172, 159, 157, 174, 163, 169, 168, 134, 159, 176, 159, 166, 68};

// __DEBUG__
// __CLOSE_PRINT__
//
//  LCQrcodeUtil.m
//  二维码测试
//
//  Created by 刘通超 on 16/5/5.
//  Copyright © 2016年 刘通超. All rights reserved.
//

// __M_A_C_R_O__
//: #import "LCQRCodeUtil.h"
#import "ColorShould.h"

//: @implementation LCQRCodeUtil
@implementation ColorShould

//: #pragma mark 读取图片二维码
#pragma mark 读取图片二维码
/**
 *  读取图片中二维码信息
 *
 *  @param image 图片
 *
 *  @return 二维码内容
 */
//: +(NSString *)readQRCodeFromImage:(UIImage *)image{
+(NSString *)auditoryImage:(UIImage *)image{
    //: NSData *data = UIImagePNGRepresentation(image);
    NSData *data = UIImagePNGRepresentation(image);
    //: CIImage *ciimage = [CIImage imageWithData:data];
    CIImage *ciimage = [CIImage imageWithData:data];
    //: if (ciimage) {
    if (ciimage) {
        //: CIDetector *qrDetector = [CIDetector detectorOfType:CIDetectorTypeQRCode context:[CIContext contextWithOptions:@{kCIContextUseSoftwareRenderer:@(YES)}] options:@{CIDetectorAccuracy : CIDetectorAccuracyHigh}];
        CIDetector *qrDetector = [CIDetector detectorOfType:CIDetectorTypeQRCode context:[CIContext contextWithOptions:@{kCIContextUseSoftwareRenderer:@(YES)}] options:@{CIDetectorAccuracy : CIDetectorAccuracyHigh}];
        //: NSArray *resultArr = [qrDetector featuresInImage:ciimage];
        NSArray *resultArr = [qrDetector featuresInImage:ciimage];
        //: if (resultArr.count >0) {
        if (resultArr.count >0) {
            //: CIFeature *feature = resultArr[0];
            CIFeature *feature = resultArr[0];
            //: CIQRCodeFeature *qrFeature = (CIQRCodeFeature *)feature;
            CIQRCodeFeature *qrFeature = (CIQRCodeFeature *)feature;
            //: NSString *result = qrFeature.messageString;
            NSString *result = qrFeature.messageString;

            //: return result;
            return result;
        //: }else{
        }else{
            //: return nil;
            return nil;
        }
    //: }else{
    }else{
        //: return nil;
        return nil;
    }
}

//: #pragma mark 生成二维码
#pragma mark 生成二维码
/**
 *  生成二维码图片
 *
 *  @param QRString  二维码内容
 *  @param sizeWidth 图片size（正方形）
 *  @param color     填充色
 *
 *  @return  二维码图片
 */
//: +(UIImage *)createQRimageString:(NSString *)QRString sizeWidth:(CGFloat)sizeWidth fillColor:(UIColor *)color{
+(UIImage *)light:(NSString *)QRString user:(CGFloat)sizeWidth highName:(UIColor *)color{
    //: CIImage *ciimage = [self createQRForString:QRString];
    CIImage *ciimage = [self redAcrossDisable:QRString];
    //: UIImage *qrcode = [self createNonInterpolatedUIImageFormCIImage:ciimage withSize:sizeWidth];
    UIImage *qrcode = [self markKey:ciimage file:sizeWidth];
    //: if (color) {
    if (color) {
        //: CGFloat R=0, G=0, B=0;
        CGFloat R=0, G=0, B=0;

        //: CGColorRef colorRef = [color CGColor];
        CGColorRef colorRef = [color CGColor];
        //: long numComponents = CGColorGetNumberOfComponents(colorRef);
        long numComponents = CGColorGetNumberOfComponents(colorRef);

        //: if (numComponents == 4)
        if (numComponents == 4)
        {
            //: const CGFloat *components = CGColorGetComponents(colorRef);
            const CGFloat *components = CGColorGetComponents(colorRef);
            //: R = components[0];
            R = components[0];
            //: G = components[1];
            G = components[1];
            //: B = components[2];
            B = components[2];
        }

        //: UIImage *customQrcode = [self imageBlackToTransparent:qrcode withRed:R andGreen:G andBlue:B];
        UIImage *customQrcode = [self needBlue:qrcode pressCrop:R fundamentalTotal:G natalDay:B];
        //: return customQrcode;
        return customQrcode;
    }

    //: return qrcode;
    return qrcode;

}
//: #pragma mark - QRCodeGenerator
#pragma mark - QRCodeGenerator
//: + (CIImage *)createQRForString:(NSString *)qrString {
+ (CIImage *)redAcrossDisable:(NSString *)qrString {
    // Need to convert the string to a UTF-8 encoded NSData object
    //: NSData *stringData = [qrString dataUsingEncoding:NSUTF8StringEncoding];
    NSData *stringData = [qrString dataUsingEncoding:NSUTF8StringEncoding];
    // Create the filter
    //: CIFilter *qrFilter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    CIFilter *qrFilter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    // Set the message content and error-correction level
    //: [qrFilter setValue:stringData forKey:@"inputMessage"];
    [qrFilter setValue:stringData forKey:StringFromAnotherData(str_ceremonyValue)];
    //: [qrFilter setValue:@"M" forKey:@"inputCorrectionLevel"];
    [qrFilter setValue:@"M" forKey:StringFromAnotherData(str_breakfastName)];
    // Send the image back
    //: return qrFilter.outputImage;
    return qrFilter.outputImage;
}


//: #pragma mark - InterpolatedUIImage
#pragma mark - InterpolatedUIImage
//: + (UIImage *)createNonInterpolatedUIImageFormCIImage:(CIImage *)image withSize:(CGFloat) size {
+ (UIImage *)markKey:(CIImage *)image file:(CGFloat) size {
    //: CGRect extent = CGRectIntegral(image.extent);
    CGRect extent = CGRectIntegral(image.extent);
    //: CGFloat scale = ((size/CGRectGetWidth(extent)) < (size/CGRectGetHeight(extent)) ? (size/CGRectGetWidth(extent)) : (size/CGRectGetHeight(extent)));
    CGFloat scale = ((size/CGRectGetWidth(extent)) < (size/CGRectGetHeight(extent)) ? (size/CGRectGetWidth(extent)) : (size/CGRectGetHeight(extent)));
    // create a bitmap image that we'll draw into a bitmap context at the desired size;
    //: size_t width = CGRectGetWidth(extent) * scale;
    size_t width = CGRectGetWidth(extent) * scale;
    //: size_t height = CGRectGetHeight(extent) * scale;
    size_t height = CGRectGetHeight(extent) * scale;
    //: CGColorSpaceRef cs = CGColorSpaceCreateDeviceGray();
    CGColorSpaceRef cs = CGColorSpaceCreateDeviceGray();
    //: CGContextRef bitmapRef = CGBitmapContextCreate(nil, width, height, 8, 0, cs, (CGBitmapInfo)kCGImageAlphaNone);
    CGContextRef bitmapRef = CGBitmapContextCreate(nil, width, height, 8, 0, cs, (CGBitmapInfo)kCGImageAlphaNone);
    //: CIContext *context = [CIContext contextWithOptions:nil];
    CIContext *context = [CIContext contextWithOptions:nil];
    //: CGImageRef bitmapImage = [context createCGImage:image fromRect:extent];
    CGImageRef bitmapImage = [context createCGImage:image fromRect:extent];
    //: CGContextSetInterpolationQuality(bitmapRef, kCGInterpolationNone);
    CGContextSetInterpolationQuality(bitmapRef, kCGInterpolationNone);
    //: CGContextScaleCTM(bitmapRef, scale, scale);
    CGContextScaleCTM(bitmapRef, scale, scale);
    //: CGContextDrawImage(bitmapRef, extent, bitmapImage);
    CGContextDrawImage(bitmapRef, extent, bitmapImage);
    // Create an image with the contents of our bitmap
    //: CGImageRef scaledImage = CGBitmapContextCreateImage(bitmapRef);
    CGImageRef scaledImage = CGBitmapContextCreateImage(bitmapRef);
    // Cleanup
    //: CGContextRelease(bitmapRef);
    CGContextRelease(bitmapRef);
    //: CGImageRelease(bitmapImage);
    CGImageRelease(bitmapImage);
    //: return [UIImage imageWithCGImage:scaledImage];
    return [UIImage imageWithCGImage:scaledImage];
}

//: #pragma mark - imageToTransparent
#pragma mark - imageToTransparent
//: void ProviderReleaseData (void *info, const void *data, size_t size){
void ProviderReleaseData (void *info, const void *data, size_t size){
    //: free((void*)data);
    free((void*)data);
}
//: + (UIImage*)imageBlackToTransparent:(UIImage*)image withRed:(CGFloat)red andGreen:(CGFloat)green andBlue:(CGFloat)blue{
+ (UIImage*)needBlue:(UIImage*)image pressCrop:(CGFloat)red fundamentalTotal:(CGFloat)green natalDay:(CGFloat)blue{
    //: const int imageWidth = image.size.width;
    const int imageWidth = image.size.width;
    //: const int imageHeight = image.size.height;
    const int imageHeight = image.size.height;
    //: size_t bytesPerRow = imageWidth * 4;
    size_t bytesPerRow = imageWidth * 4;
    //: uint32_t* rgbImageBuf = (uint32_t*)malloc(bytesPerRow * imageHeight);
    uint32_t* rgbImageBuf = (uint32_t*)malloc(bytesPerRow * imageHeight);
    // create context
    //: CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    //: CGContextRef context = CGBitmapContextCreate(rgbImageBuf, imageWidth, imageHeight, 8, bytesPerRow, colorSpace,
    CGContextRef context = CGBitmapContextCreate(rgbImageBuf, imageWidth, imageHeight, 8, bytesPerRow, colorSpace,
                                                 //: kCGBitmapByteOrder32Little | kCGImageAlphaNoneSkipLast);
                                                 kCGBitmapByteOrder32Little | kCGImageAlphaNoneSkipLast);
    //: CGContextDrawImage(context, CGRectMake(0, 0, imageWidth, imageHeight), image.CGImage);
    CGContextDrawImage(context, CGRectMake(0, 0, imageWidth, imageHeight), image.CGImage);
    // traverse pixe
    //: int pixelNum = imageWidth * imageHeight;
    int pixelNum = imageWidth * imageHeight;
    //: uint32_t* pCurPtr = rgbImageBuf;
    uint32_t* pCurPtr = rgbImageBuf;
    //: for (int i = 0; i < pixelNum; i++, pCurPtr++){
    for (int i = 0; i < pixelNum; i++, pCurPtr++){
        //: if ((*pCurPtr & 0xFFFFFF00) < 0x99999900){
        if ((*pCurPtr & 0xFFFFFF00) < 0x99999900){
            // change color
            //: uint8_t* ptr = (uint8_t*)pCurPtr;
            uint8_t* ptr = (uint8_t*)pCurPtr;
            //: ptr[3] = red; 
            ptr[3] = red; //0~255
            //: ptr[2] = green;
            ptr[2] = green;
            //: ptr[1] = blue;
            ptr[1] = blue;
        //: }else{
        }else{
            //: uint8_t* ptr = (uint8_t*)pCurPtr;
            uint8_t* ptr = (uint8_t*)pCurPtr;
            //: ptr[0] = 0;
            ptr[0] = 0;
        }
    }
    // context to image
    //: CGDataProviderRef dataProvider = CGDataProviderCreateWithData(NULL, rgbImageBuf, bytesPerRow * imageHeight, ProviderReleaseData);
    CGDataProviderRef dataProvider = CGDataProviderCreateWithData(NULL, rgbImageBuf, bytesPerRow * imageHeight, ProviderReleaseData);
    //: CGImageRef imageRef = CGImageCreate(imageWidth, imageHeight, 8, 32, bytesPerRow, colorSpace,
    CGImageRef imageRef = CGImageCreate(imageWidth, imageHeight, 8, 32, bytesPerRow, colorSpace,
                                        //: kCGImageAlphaLast | kCGBitmapByteOrder32Little, dataProvider,
                                        kCGImageAlphaLast | kCGBitmapByteOrder32Little, dataProvider,
                                        //: NULL, true, kCGRenderingIntentDefault);
                                        NULL, true, kCGRenderingIntentDefault);
    //: CGDataProviderRelease(dataProvider);
    CGDataProviderRelease(dataProvider);
    //: UIImage* resultUIImage = [UIImage imageWithCGImage:imageRef];
    UIImage* resultUIImage = [UIImage imageWithCGImage:imageRef];
    // release
    //: CGImageRelease(imageRef);
    CGImageRelease(imageRef);
    //: CGContextRelease(context);
    CGContextRelease(context);
    //: CGColorSpaceRelease(colorSpace);
    CGColorSpaceRelease(colorSpace);
    //: return resultUIImage;
    return resultUIImage;
}

//: @end
@end

Byte * AnotherDataToCache(Byte *data) {
    int numericalTotal = data[0];
    int onSize = data[1];
    Byte quit = data[2];
    int bakery = data[3];
    if (!numericalTotal) return data + bakery;
    for (int i = bakery; i < bakery + onSize; i++) {
        int value = data[i] - quit;
        if (value < 0) {
            value += 256;
        }
        data[i] = value;
    }
    data[0] = 0;
    data[bakery + onSize] = 0;
    return data + bakery;
}

NSString *StringFromAnotherData(Byte *data) {
    return [NSString stringWithUTF8String:(char *)AnotherDataToCache(data)];
}
