
#import <Foundation/Foundation.h>

NSString *StringFromDuringSoilData(Byte *data);        


//: custom_msg_ken
Byte str_activityData[] = {55, 14, 37, 9, 162, 180, 117, 52, 34, 62, 80, 78, 79, 74, 72, 58, 72, 78, 66, 58, 70, 64, 73, 16};


//: type
Byte str_combineDateValue[] = {20, 4, 36, 14, 193, 67, 116, 47, 253, 148, 238, 92, 42, 212, 80, 85, 76, 65, 35};


//: value
Byte str_jurorValue[] = {38, 5, 28, 5, 102, 90, 69, 80, 89, 73, 40};


//: custom_msg_jan
Byte str_insuranceTitle[] = {66, 14, 93, 6, 20, 117, 6, 24, 22, 23, 18, 16, 2, 16, 22, 10, 2, 13, 4, 17, 45};


//: data
Byte str_linkOrationValue[] = {73, 4, 96, 13, 44, 124, 200, 230, 204, 181, 206, 75, 73, 4, 1, 20, 1, 110};


//: custom_msg_pon
Byte str_poolOwnData[] = {32, 14, 39, 9, 165, 12, 104, 70, 205, 60, 78, 76, 77, 72, 70, 56, 70, 76, 64, 56, 73, 72, 71, 103};

// __DEBUG__
// __CLOSE_PRINT__
//
//  MaxOnStatusAttachment.m
//  NIM
//
//  Created by amao on 7/2/15.
//  Copyright (c) 2015 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import "NTESJanKenPonAttachment.h"
#import "MaxOnStatusAttachment.h"
//: #import "NTESSessionUtil.h"
#import "ChildMark.h"

//: @implementation NTESJanKenPonAttachment
@implementation MaxOnStatusAttachment

//: - (NSString *)encodeAttachment
- (NSString *)encodeAttachment
{
    //: NSDictionary *dict = @{@"type" : @(CustomMessageTypeJanKenPon),
    NSDictionary *dict = @{StringFromDuringSoilData(str_combineDateValue) : @(CustomMessageTypeJanKenPon),
                           //: @"data" : @{@"value":@(self.value)}};
                           StringFromDuringSoilData(str_linkOrationValue) : @{StringFromDuringSoilData(str_jurorValue):@(self.value)}};
    //: NSData *data = [NSJSONSerialization dataWithJSONObject:dict
    NSData *data = [NSJSONSerialization dataWithJSONObject:dict
                                                   //: options:0
                                                   options:0
                                                     //: error:nil];
                                                     error:nil];
    //: NSString *content = @"";
    NSString *content = @"";
    //: if (data) {
    if (data) {
        //: content = [[NSString alloc] initWithData:data
        content = [[NSString alloc] initWithData:data
                                        //: encoding:NSUTF8StringEncoding];
                                        encoding:NSUTF8StringEncoding];
    }
    //: return content;
    return content;
}


//: - (NSString *)cellContent:(NIMMessage *)message{
- (NSString *)pin:(NIMMessage *)message{
    //: return @"NTESSessionJankenponContentView";
    return @"TelephoneMessageView";
}

//: - (CGSize)contentSize:(NIMMessage *)message cellWidth:(CGFloat)width{
- (CGSize)linkOfPop:(NIMMessage *)message of:(CGFloat)width{

    //: return self.showCoverImage.size;
    return self.showCoverImage.size;
}

//: - (UIEdgeInsets)contentViewInsets:(NIMMessage *)message
- (UIEdgeInsets)keyPanoramicView:(NIMMessage *)message
{
    //: if (message.session.sessionType == NIMSessionTypeChatroom)
    if (message.session.sessionType == NIMSessionTypeChatroom)
    {
        //: CGFloat bubbleMarginTopForImage = 15.f;
        CGFloat bubbleMarginTopForImage = 15.f;
        //: CGFloat bubbleMarginLeftForImage = 12.f;
        CGFloat bubbleMarginLeftForImage = 12.f;
        //: return UIEdgeInsetsMake(bubbleMarginTopForImage,bubbleMarginLeftForImage,0,0);
        return UIEdgeInsetsMake(bubbleMarginTopForImage,bubbleMarginLeftForImage,0,0);
    }
    //: else
    else
    {
        //: CGFloat bubbleMarginForImage = 3.f;
        CGFloat bubbleMarginForImage = 3.f;
        //: CGFloat bubbleArrowWidthForImage = 5.f;
        CGFloat bubbleArrowWidthForImage = 5.f;
        //: if (message.isOutgoingMsg) {
        if (message.isOutgoingMsg) {
            //: return UIEdgeInsetsMake(bubbleMarginForImage,bubbleMarginForImage,bubbleMarginForImage,bubbleMarginForImage + bubbleArrowWidthForImage);
            return UIEdgeInsetsMake(bubbleMarginForImage,bubbleMarginForImage,bubbleMarginForImage,bubbleMarginForImage + bubbleArrowWidthForImage);
        //: }else{
        }else{
            //: return UIEdgeInsetsMake(bubbleMarginForImage,bubbleMarginForImage + bubbleArrowWidthForImage, bubbleMarginForImage,bubbleMarginForImage);
            return UIEdgeInsetsMake(bubbleMarginForImage,bubbleMarginForImage + bubbleArrowWidthForImage, bubbleMarginForImage,bubbleMarginForImage);
        }
    }
}

//: - (UIImage *)showCoverImage
- (UIImage *)showCoverImage
{
    //: if (_showCoverImage == nil)
    if (_showCoverImage == nil)
    {
        //: UIImage *image;
        UIImage *image;
        //: switch (self.value) {
        switch (self.value) {
            //: case CustomJanKenPonValueJan:
            case CustomJanKenPonValueJan:
                //: image = [UIImage imageNamed:@"custom_msg_jan"];
                image = [UIImage imageNamed:StringFromDuringSoilData(str_insuranceTitle)];
                //: break;
                break;
            //: case CustomJanKenPonValueKen:
            case CustomJanKenPonValueKen:
                //: image = [UIImage imageNamed:@"custom_msg_ken"];
                image = [UIImage imageNamed:StringFromDuringSoilData(str_activityData)];
                //: break;
                break;
            //: case CustomJanKenPonValuePon:
            case CustomJanKenPonValuePon:
                //: image = [UIImage imageNamed:@"custom_msg_pon"];
                image = [UIImage imageNamed:StringFromDuringSoilData(str_poolOwnData)];
                //: break;
                break;
            //: default:
            default:
                //: break;
                break;
        }
        //: _showCoverImage = image;
        _showCoverImage = image;
    }
    //: return _showCoverImage;
    return _showCoverImage;
}

//: - (BOOL)canBeRevoked
- (BOOL)recent
{
    //: return YES;
    return YES;
}

//: - (BOOL)canBeForwarded
- (BOOL)container
{
    //: return YES;
    return YES;
}

//: - (BOOL)canDisplayBubbleBackground:(NIMMessage *)message
- (BOOL)ofs:(NIMMessage *)message
{
    //: NIMSession *session = message.session;
    NIMSession *session = message.session;
    //: if (session.sessionType == NIMSessionTypeChatroom)
    if (session.sessionType == NIMSessionTypeChatroom)
    {
        //: return NO;
        return NO;
    }
    //: return YES;
    return YES;
}

//: @end
@end

Byte * DuringSoilDataToCache(Byte *data) {
    int changeSize = data[0];
    int cedeInsist = data[1];
    Byte three = data[2];
    int minLucky = data[3];
    if (!changeSize) return data + minLucky;
    for (int i = minLucky; i < minLucky + cedeInsist; i++) {
        int value = data[i] + three;
        if (value > 255) {
            value -= 256;
        }
        data[i] = value;
    }
    data[0] = 0;
    data[minLucky + cedeInsist] = 0;
    return data + minLucky;
}

NSString *StringFromDuringSoilData(Byte *data) {
    return [NSString stringWithUTF8String:(char *)DuringSoilDataToCache(data)];
}
