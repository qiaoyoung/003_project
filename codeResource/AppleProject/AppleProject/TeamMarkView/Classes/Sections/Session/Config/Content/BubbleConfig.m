
#import <Foundation/Foundation.h>

NSString *StringFromEgretData(Byte *data);        


//: message should be image
Byte str_viceData[] = {5, 23, 8, 8, 202, 63, 111, 82, 101, 93, 107, 107, 89, 95, 93, 24, 107, 96, 103, 109, 100, 92, 24, 90, 93, 24, 97, 101, 89, 95, 93, 107};

// __DEBUG__
// __CLOSE_PRINT__
//
//  BubbleConfig.m
// Indicator
//
//  Created by amao on 9/15/15.
//  Copyright (c) 2015 NetEase. All rights reserved.
//

// __M_A_C_R_O__
//: #import "CCCImageContentConfig.h"
#import "BubbleConfig.h"
//: #import "UIImage+AppleProjectKit.h"
#import "UIImage+Indicator.h"
//: #import "AppleProjectKit.h"
#import "Indicator.h"

//: @implementation CCCImageContentConfig
@implementation BubbleConfig
//: - (CGSize)contentSize:(CGFloat)cellWidth message:(NIMMessage *)message
- (CGSize)offMessage:(CGFloat)cellWidth view:(NIMMessage *)message
{
    //: NIMImageObject *imageObject = (NIMImageObject*)[message messageObject];
    NIMImageObject *imageObject = (NIMImageObject*)[message messageObject];
    //: NSAssert([imageObject isKindOfClass:[NIMImageObject class]], @"message should be image");
    NSAssert([imageObject isKindOfClass:[NIMImageObject class]], StringFromEgretData(str_viceData));

    //: CGFloat attachmentImageMinWidth = (cellWidth / 4.0);
    CGFloat attachmentImageMinWidth = (cellWidth / 4.0);
    //: CGFloat attachmentImageMinHeight = (cellWidth / 4.0);
    CGFloat attachmentImageMinHeight = (cellWidth / 4.0);
    //: CGFloat attachmemtImageMaxWidth = (cellWidth - 184);
    CGFloat attachmemtImageMaxWidth = (cellWidth - 184);
    //: CGFloat attachmentImageMaxHeight = (cellWidth - 184);
    CGFloat attachmentImageMaxHeight = (cellWidth - 184);


    //: CGSize imageSize;
    CGSize imageSize;
    //: if (!__CGSizeEqualToSize(imageObject.size, CGSizeZero)) {
    if (!__CGSizeEqualToSize(imageObject.size, CGSizeZero)) {
        //: imageSize = imageObject.size;
        imageSize = imageObject.size;
        //: if(__CGSizeEqualToSize(imageSize, CGSizeMake(200, 200)) || __CGSizeEqualToSize(imageSize, CGSizeMake(300, 300))){
        if(__CGSizeEqualToSize(imageSize, CGSizeMake(200, 200)) || __CGSizeEqualToSize(imageSize, CGSizeMake(300, 300))){
            //: imageSize = CGSizeMake(80, 80);
            imageSize = CGSizeMake(80, 80);
        }
    }
    //: else
    else
    {
        //: UIImage *image = [UIImage imageWithContentsOfFile:imageObject.thumbPath];
        UIImage *image = [UIImage imageWithContentsOfFile:imageObject.thumbPath];
        //: imageSize = image ? image.size : CGSizeZero;
        imageSize = image ? image.size : CGSizeZero;
    }
    //: CGSize contentSize = [UIImage nim_sizeWithImageOriginSize:imageSize
    CGSize contentSize = [UIImage with:imageSize
                                                   //: minSize:CGSizeMake(attachmentImageMinWidth, attachmentImageMinHeight)
                                                   barBubbleSize:CGSizeMake(attachmentImageMinWidth, attachmentImageMinHeight)
                                                   //: maxSize:CGSizeMake(attachmemtImageMaxWidth, attachmentImageMaxHeight )];
                                                   viewFrame:CGSizeMake(attachmemtImageMaxWidth, attachmentImageMaxHeight )];
    //: return contentSize;
    return contentSize;
}

//: - (NSString *)cellContent:(NIMMessage *)message
- (NSString *)text:(NIMMessage *)message
{
    //: return @"CCCSessionImageContentView";
    return @"UpTitleView";
}

//: - (UIEdgeInsets)contentViewInsets:(NIMMessage *)message
- (UIEdgeInsets)pressedView:(NIMMessage *)message
{
    //: return [[AppleProjectKit sharedKit].config setting:message].contentInsets;
    return [[Indicator reach].config info:message].contentInsets;
}



//: @end
@end

Byte * EgretDataToCache(Byte *data) {
    int insectPork = data[0];
    int guessInfo = data[1];
    Byte customPlain = data[2];
    int spatchcockWeapon = data[3];
    if (!insectPork) return data + spatchcockWeapon;
    for (int i = spatchcockWeapon; i < spatchcockWeapon + guessInfo; i++) {
        int value = data[i] + customPlain;
        if (value > 255) {
            value -= 256;
        }
        data[i] = value;
    }
    data[0] = 0;
    data[spatchcockWeapon + guessInfo] = 0;
    return data + spatchcockWeapon;
}

NSString *StringFromEgretData(Byte *data) {
    return [NSString stringWithUTF8String:(char *)EgretDataToCache(data)];
}
