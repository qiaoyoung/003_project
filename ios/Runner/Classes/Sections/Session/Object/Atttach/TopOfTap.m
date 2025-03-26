
#import <Foundation/Foundation.h>

NSString *StringFromPoolData(Byte *data);


//: session_snapchat_self_readed
Byte str_speciallyContent[] = {60, 28, 28, 10, 64, 149, 239, 15, 151, 37, 143, 129, 143, 143, 133, 139, 138, 123, 143, 138, 125, 140, 127, 132, 125, 144, 123, 143, 129, 136, 130, 123, 142, 129, 125, 128, 129, 128, 201};


//: fired
Byte str_maxOnTitle[] = {15, 5, 30, 6, 104, 126, 132, 135, 144, 131, 130, 21};


//: md5
Byte str_seventhName[] = {54, 3, 83, 7, 170, 122, 164, 192, 183, 136, 145};


//: session_snapchat_other_readed
Byte str_rideDepressedData[] = {10, 29, 85, 6, 179, 122, 200, 186, 200, 200, 190, 196, 195, 180, 200, 195, 182, 197, 184, 189, 182, 201, 180, 196, 201, 189, 186, 199, 180, 199, 186, 182, 185, 186, 185, 22};


//: data
Byte str_pastaFessData[] = {22, 4, 9, 9, 116, 23, 7, 77, 69, 109, 106, 125, 106, 42};


//: url
Byte str_thatBottomTitle[] = {28, 3, 40, 5, 74, 157, 154, 148, 24};


//: session_snapchat_self_unread
Byte str_showOrationData[] = {53, 28, 97, 14, 177, 232, 245, 137, 236, 249, 251, 77, 148, 89, 212, 198, 212, 212, 202, 208, 207, 192, 212, 207, 194, 209, 196, 201, 194, 213, 192, 212, 198, 205, 199, 192, 214, 207, 211, 198, 194, 197, 66};


//: HEIC
Byte str_immuneWithText[] = {53, 4, 78, 11, 141, 105, 243, 98, 13, 188, 210, 150, 147, 151, 145, 6};


//: type
Byte str_clientBottomLowData[] = {1, 4, 38, 6, 108, 240, 154, 159, 150, 139, 68};


//: jpg
Byte str_marbleSchemeName[] = {15, 3, 63, 10, 75, 193, 242, 137, 41, 171, 169, 175, 166, 219};


//: session_snapchat_other_unread
Byte str_insistKeyText[] = {13, 29, 43, 11, 223, 222, 209, 156, 203, 249, 186, 158, 144, 158, 158, 148, 154, 153, 138, 158, 153, 140, 155, 142, 147, 140, 159, 138, 154, 159, 147, 144, 157, 138, 160, 153, 157, 144, 140, 143, 100};

// __DEBUG__
// __CLOSE_PRINT__
//
//  SnapchatAttachment.m
//  NIM
//
//  Created by amao on 7/2/15.
//  Copyright (c) 2015 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import "NTESSnapchatAttachment.h"
#import "TopOfTap.h"
//: #import "NTESFileLocationHelper.h"
#import "BubbleMaxContainer.h"
//: #import "NSData+NTES.h"
#import "NSData+Status.h"
//: #import "NTESSessionUtil.h"
#import "ChildMark.h"

//: @interface NTESSnapchatAttachment()
@interface TopOfTap()

//: @property (nonatomic,assign) BOOL isFromMe;
@property (nonatomic,assign) BOOL isFromMe;

//: @end
@end

//: @implementation NTESSnapchatAttachment
@implementation TopOfTap

//: - (void)setImage:(UIImage *)image
- (void)setOption:(UIImage *)image
{
    //: NSData *data = UIImageJPEGRepresentation(image, 0.3);
    NSData *data = UIImageJPEGRepresentation(image, 0.3);
    //: NSString *md5= [data MD5String];
    NSString *md5= [data view];
    //: self.md5 = md5;
    self.md5 = md5;

    //: [data writeToFile:[self filepath]
    [data writeToFile:[self eventFilepath]
           //: atomically:YES];
           atomically:YES];
}

//: - (void)setImageFilePath:(NSString *)path
- (void)setBelowMonth:(NSString *)path
{
    //: if ([[NSFileManager defaultManager] fileExistsAtPath:path]){
    if ([[NSFileManager defaultManager] fileExistsAtPath:path]){
        //: NSData *jpgData = nil;
        NSData *jpgData = nil;
        //: if ([path.pathExtension.uppercaseString isEqualToString:@"HEIC"]) {
        if ([path.pathExtension.uppercaseString isEqualToString:StringFromPoolData(str_immuneWithText)]) {
            //: CIImage *ciImage = [CIImage imageWithContentsOfURL:[NSURL fileURLWithPath:path]];
            CIImage *ciImage = [CIImage imageWithContentsOfURL:[NSURL fileURLWithPath:path]];
                                //: CIContext *context = [CIContext context];
                                CIContext *context = [CIContext context];
            //: jpgData = [context JPEGRepresentationOfImage:ciImage colorSpace:ciImage.colorSpace options:@{}];
            jpgData = [context JPEGRepresentationOfImage:ciImage colorSpace:ciImage.colorSpace options:@{}];
        //: } else {
        } else {
            //: jpgData = [NSData dataWithContentsOfFile:path];
            jpgData = [NSData dataWithContentsOfFile:path];
        }

        //: self.md5 = [jpgData MD5String];
        self.md5 = [jpgData view];

        //: [jpgData writeToFile:[self filepath]
        [jpgData writeToFile:[self eventFilepath]
               //: atomically:YES];
               atomically:YES];
     }
}

//: - (void)setIsFired:(BOOL)isFired{
- (void)setIsFired:(BOOL)isFired{
    //: if (_isFired != isFired) {
    if (_isFired != isFired) {
        //: _isFired = isFired;
        _isFired = isFired;
        //: [self updateCover];
        [self title];
    }
}


//: - (NSString *)filepath
- (NSString *)eventFilepath
{
    //: NSString *filename = [_md5 stringByAppendingFormat:@".%@",(@"jpg")];
    NSString *filename = [_md5 stringByAppendingFormat:@".%@",(StringFromPoolData(str_marbleSchemeName))];
    //: return [NTESFileLocationHelper filepathForImage:filename];
    return [BubbleMaxContainer enableRange:filename];
}


//: - (NSString *)cellContent:(NIMMessage *)message{
- (NSString *)pin:(NIMMessage *)message{
    //: self.isFromMe = message.isOutgoingMsg;
    self.isFromMe = message.isOutgoingMsg;
    //: return @"NTESSessionSnapchatContentView";
    return @"TutorialDisableView";
}

//: - (CGSize)contentSize:(NIMMessage *)message cellWidth:(CGFloat)width{
- (CGSize)linkOfPop:(NIMMessage *)message of:(CGFloat)width{
    //: self.isFromMe = message.isOutgoingMsg;
    self.isFromMe = message.isOutgoingMsg;
    //: CGSize size = self.showCoverImage.size;
    CGSize size = self.showCoverImage.size;
    //: CGFloat customSnapMessageImageRightToText = 5;
    CGFloat customSnapMessageImageRightToText = 5;
    //: return CGSizeMake(size.width + customSnapMessageImageRightToText, size.height);
    return CGSizeMake(size.width + customSnapMessageImageRightToText, size.height);
}

//: - (UIEdgeInsets)contentViewInsets:(NIMMessage *)message
- (UIEdgeInsets)keyPanoramicView:(NIMMessage *)message
{
    //: CGFloat bubblePaddingForImage = 3.f;
    CGFloat bubblePaddingForImage = 3.f;
    //: CGFloat bubbleArrowWidthForImage = -4.f;
    CGFloat bubbleArrowWidthForImage = -4.f;
    //: if (message.isOutgoingMsg) {
    if (message.isOutgoingMsg) {
        //: return UIEdgeInsetsMake(bubblePaddingForImage,bubblePaddingForImage,bubblePaddingForImage,bubblePaddingForImage + bubbleArrowWidthForImage);
        return UIEdgeInsetsMake(bubblePaddingForImage,bubblePaddingForImage,bubblePaddingForImage,bubblePaddingForImage + bubbleArrowWidthForImage);
    //: } else {
    } else {
        //: return UIEdgeInsetsMake(bubblePaddingForImage,bubblePaddingForImage + bubbleArrowWidthForImage + 4, bubblePaddingForImage,bubblePaddingForImage);
        return UIEdgeInsetsMake(bubblePaddingForImage,bubblePaddingForImage + bubbleArrowWidthForImage + 4, bubblePaddingForImage,bubblePaddingForImage);
    }
}

//: - (void)setIsFromMe:(BOOL)isFromMe{
- (void)setIsFromMe:(BOOL)isFromMe{
    //: if (_isFromMe != isFromMe) {
    if (_isFromMe != isFromMe) {
        //: _isFromMe = isFromMe;
        _isFromMe = isFromMe;
        //: [self updateCover];
        [self title];
    }
}

//: - (BOOL)canBeForwarded
- (BOOL)container
{
    //: return NO;
    return NO;
}

//: - (BOOL)canBeRevoked
- (BOOL)recent
{
    //: return YES;
    return YES;
}



//: #pragma NIMCustomAttachment
#pragma NIMCustomAttachment
//: - (NSString *)encodeAttachment
- (NSString *)encodeAttachment
{
    //: NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    //: NSMutableDictionary *data = [NSMutableDictionary dictionary];
    NSMutableDictionary *data = [NSMutableDictionary dictionary];
    //: [dict setObject:@(CustomMessageTypeSnapchat) forKey:@"type"];
    [dict setObject:@(CustomMessageTypeSnapchat) forKey:StringFromPoolData(str_clientBottomLowData)];
    //: [data setObject:_md5?_md5:@"" forKey:@"md5"];
    [data setObject:_md5?_md5:@"" forKey:StringFromPoolData(str_seventhName)];
    //: [data setObject:@(_isFired) forKey:@"fired"];
    [data setObject:@(_isFired) forKey:StringFromPoolData(str_maxOnTitle)];
    //: if ([_url length])
    if ([_url length])
    {
        //: [data setObject:_url forKey:@"url"];
        [data setObject:_url forKey:StringFromPoolData(str_thatBottomTitle)];
    }
    //: [dict setObject:data forKey:@"data"];
    [dict setObject:data forKey:StringFromPoolData(str_pastaFessData)];

    //: NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict
                                                   //: options:0
                                                   options:0
                                                     //: error:nil];
                                                     error:nil];

    //: return [[NSString alloc] initWithData:jsonData
    return [[NSString alloc] initWithData:jsonData
                                 //: encoding:NSUTF8StringEncoding];
                                 encoding:NSUTF8StringEncoding];
}


//: #pragma mark - 实现文件上传需要接口
#pragma mark - 实现文件上传需要接口
//: - (BOOL)attachmentNeedsUpload
- (BOOL)attachmentNeedsUpload
{
    //: return [_url length] == 0;
    return [_url length] == 0;
}

//: - (NSString *)attachmentPathForUploading
- (NSString *)attachmentPathForUploading
{
    //: return [self filepath];
    return [self eventFilepath];
}

//: - (void)updateAttachmentURL:(NSString *)urlString
- (void)updateAttachmentURL:(NSString *)urlString
{
    //: self.url = urlString;
    self.url = urlString;
}


//: #pragma mark - Private
#pragma mark - Private
//: - (void)updateCover{
- (void)title{
    //: UIImage *image;
    UIImage *image;
    //: if (!self.isFromMe) {
    if (!self.isFromMe) {
        //: if (self.isFired) {
        if (self.isFired) {
            //: image = [UIImage imageNamed:@"session_snapchat_other_readed"];
            image = [UIImage imageNamed:StringFromPoolData(str_rideDepressedData)];
        //: }else{
        }else{
            //: image = [UIImage imageNamed:@"session_snapchat_other_unread"];
            image = [UIImage imageNamed:StringFromPoolData(str_insistKeyText)];
        }
    //: }else{
    }else{
        //: if (self.isFired) {
        if (self.isFired) {
            //: image = [UIImage imageNamed:@"session_snapchat_self_readed"];
            image = [UIImage imageNamed:StringFromPoolData(str_speciallyContent)];
        //: }else{
        }else{
            //: image = [UIImage imageNamed:@"session_snapchat_self_unread"];
            image = [UIImage imageNamed:StringFromPoolData(str_showOrationData)];
        }
    }
    //: self.showCoverImage = image;
    self.showCoverImage = image;
}

//: - (UIImage *)showCoverImage
- (UIImage *)showCoverImage
{
    //: if (_showCoverImage == nil)
    if (_showCoverImage == nil)
    {
        //: [self updateCover];
        [self title];
    }
    //: return _showCoverImage;
    return _showCoverImage;
}

//: #pragma mark - https
#pragma mark - https
//: - (NSString *)url
- (NSString *)url
{
    //: return [_url length] ?
    return [_url length] ?
    //: [[[NIMSDK sharedSDK] resourceManager] normalizeURLString:_url] : nil;
    [[[NIMSDK sharedSDK] resourceManager] normalizeURLString:_url] : nil;
}

//: @end
@end

Byte * PoolDataToCache(Byte *data) {
    int especially = data[0];
    int personalitySorry = data[1];
    Byte imagePlainSend = data[2];
    int tableKey = data[3];
    if (!especially) return data + tableKey;
    for (int i = tableKey; i < tableKey + personalitySorry; i++) {
        int value = data[i] - imagePlainSend;
        if (value < 0) {
            value += 256;
        }
        data[i] = value;
    }
    data[0] = 0;
    data[tableKey + personalitySorry] = 0;
    return data + tableKey;
}

NSString *StringFromPoolData(Byte *data) {
    return [NSString stringWithUTF8String:(char *)PoolDataToCache(data)];
}
