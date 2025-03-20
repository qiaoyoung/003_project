
#import <Foundation/Foundation.h>

NSString *StringFromSoilData(Byte *data);        


//: message should be video
Byte str_scriptHoldConfidenceContent[] = {2, 23, 81, 11, 22, 251, 3, 209, 113, 190, 22, 28, 20, 34, 34, 16, 22, 20, 207, 34, 23, 30, 36, 27, 19, 207, 17, 20, 207, 37, 24, 19, 20, 30, 184};

// __DEBUG__
// __CLOSE_PRINT__
//
//  ImageConfig.m
// Indicator
//
//  Created by amao on 9/15/15.
//  Copyright (c) 2015 NetEase. All rights reserved.
//

// __M_A_C_R_O__
//: #import "CCCVideoContentConfig.h"
#import "ImageConfig.h"
//: #import "UIImage+AppleProjectKit.h"
#import "UIImage+Indicator.h"
//: #import "AppleProjectKit.h"
#import "Indicator.h"

//: @implementation CCCVideoContentConfig
@implementation ImageConfig
//: - (CGSize)contentSize:(CGFloat)cellWidth message:(NIMMessage *)message
- (CGSize)offMessage:(CGFloat)cellWidth view:(NIMMessage *)message
{
    //: NIMVideoObject *videoObject = (NIMVideoObject*)[message messageObject];
    NIMVideoObject *videoObject = (NIMVideoObject*)[message messageObject];
    //: NSAssert([videoObject isKindOfClass:[NIMVideoObject class]], @"message should be video");
    NSAssert([videoObject isKindOfClass:[NIMVideoObject class]], StringFromSoilData(str_scriptHoldConfidenceContent));

    //: CGFloat attachmentImageMinWidth = (cellWidth / 4.0);
    CGFloat attachmentImageMinWidth = (cellWidth / 4.0);
    //: CGFloat attachmentImageMinHeight = (cellWidth / 4.0);
    CGFloat attachmentImageMinHeight = (cellWidth / 4.0);
    //: CGFloat attachmemtImageMaxWidth = (cellWidth - 184);
    CGFloat attachmemtImageMaxWidth = (cellWidth - 184);
    //: CGFloat attachmentImageMaxHeight = (cellWidth - 184);
    CGFloat attachmentImageMaxHeight = (cellWidth - 184);
    //: CGSize contentSize = CGSizeMake(attachmentImageMinWidth, attachmentImageMinHeight);
    CGSize contentSize = CGSizeMake(attachmentImageMinWidth, attachmentImageMinHeight);


    //: if (!__CGSizeEqualToSize(videoObject.coverSize, CGSizeZero)) {
    if (!__CGSizeEqualToSize(videoObject.coverSize, CGSizeZero)) {
        //有封面就直接拿封面大小
        //: contentSize = [UIImage nim_sizeWithImageOriginSize:videoObject.coverSize
        contentSize = [UIImage with:videoObject.coverSize
                                                   //: minSize:CGSizeMake(attachmentImageMinWidth, attachmentImageMinHeight)
                                                   barBubbleSize:CGSizeMake(attachmentImageMinWidth, attachmentImageMinHeight)
                                                   //: maxSize:CGSizeMake(attachmemtImageMaxWidth, attachmentImageMaxHeight)];
                                                   viewFrame:CGSizeMake(attachmemtImageMaxWidth, attachmentImageMaxHeight)];
    }
    //: return contentSize;
    return contentSize;
}


//: - (NSString *)cellContent:(NIMMessage *)message
- (NSString *)text:(NIMMessage *)message
{
    //: return @"CCCSessionVideoContentView";
    return @"StatuteTitleControl";
}

//: - (UIEdgeInsets)contentViewInsets:(NIMMessage *)message
- (UIEdgeInsets)pressedView:(NIMMessage *)message
{
    //: return [[AppleProjectKit sharedKit].config setting:message].contentInsets;
    return [[Indicator reach].config info:message].contentInsets;
}

//: @end
@end

Byte * SoilDataToCache(Byte *data) {
    int bestQualify = data[0];
    int heave = data[1];
    Byte thousandPrise = data[2];
    int withValue = data[3];
    if (!bestQualify) return data + withValue;
    for (int i = withValue; i < withValue + heave; i++) {
        int value = data[i] + thousandPrise;
        if (value > 255) {
            value -= 256;
        }
        data[i] = value;
    }
    data[0] = 0;
    data[withValue + heave] = 0;
    return data + withValue;
}

NSString *StringFromSoilData(Byte *data) {
    return [NSString stringWithUTF8String:(char *)SoilDataToCache(data)];
}
