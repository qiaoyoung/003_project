
#import <Foundation/Foundation.h>
typedef struct {
    Byte indexInsert;
    Byte *workplace;
    unsigned int wolfWeapon;
    bool echogram;
	int combine;
	int magnitudery;
} InsectThatData;

NSString *StringFromInsectThatData(InsectThatData *data);


//: redPacketSendID
InsectThatData str_cedeImposeTitle = (InsectThatData){32, (Byte []){82, 69, 68, 112, 65, 67, 75, 69, 84, 115, 69, 78, 68, 105, 100, 14}, 15, false, 106, 119};


//: type
InsectThatData str_sharedBottomTitle = (InsectThatData){48, (Byte []){68, 73, 64, 85, 243}, 4, false, 91, 25};


//: data
InsectThatData str_mansionName = (InsectThatData){213, (Byte []){177, 180, 161, 180, 16}, 4, false, 110, 209};


//: redPacketId
InsectThatData str_sculptVendData = (InsectThatData){1, (Byte []){115, 100, 101, 81, 96, 98, 106, 100, 117, 72, 101, 127}, 11, false, 237, 180};


//: title
InsectThatData str_orationSpeciallyContent = (InsectThatData){233, (Byte []){157, 128, 157, 133, 140, 92}, 5, false, 247, 223};


//: content
InsectThatData str_fishingFlavorData = (InsectThatData){91, (Byte []){56, 52, 53, 47, 62, 53, 47, 81}, 7, false, 131, 212};

// __DEBUG__
// __CLOSE_PRINT__
//
//  MarkTing.m
//  NIM
//
//  Created by chris on 2017/7/14.
//  Copyright © 2017年 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import "NTESRedPacketAttachment.h"
#import "MarkTing.h"

//: @implementation NTESRedPacketAttachment
@implementation MarkTing

//: - (NSString *)encodeAttachment {
- (NSString *)encodeAttachment {
    //: NSDictionary *dictContent = @{
    NSDictionary *dictContent = @{
                                  //: @"title" : self.title,
                                  StringFromInsectThatData(&str_orationSpeciallyContent) : self.title,
                                  //: @"content" : self.content,
                                  StringFromInsectThatData(&str_fishingFlavorData) : self.content,
                                  //: @"redPacketId" : self.redPacketId,
                                  StringFromInsectThatData(&str_sculptVendData) : self.redPacketId,
                                  //: @"redPacketSendID" : self.sendID
                                  StringFromInsectThatData(&str_cedeImposeTitle) : self.sendID
                                 //: };
                                 };


    //: NSDictionary *dict = @{@"type": @(CustomMessageTypeRedPacket), @"data": dictContent};
    NSDictionary *dict = @{StringFromInsectThatData(&str_sharedBottomTitle): @(CustomMessageTypeRedPacket), StringFromInsectThatData(&str_mansionName): dictContent};
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


//: - (CGSize)contentSize:(NIMMessage *)message cellWidth:(CGFloat)width {
- (CGSize)linkOfPop:(NIMMessage *)message of:(CGFloat)width {
    //: return CGSizeMake(150, 165);
    return CGSizeMake(150, 165);
}


//: - (UIEdgeInsets)contentViewInsets:(NIMMessage *)message {
- (UIEdgeInsets)keyPanoramicView:(NIMMessage *)message {
    //: CGFloat bubblePaddingForImage = 3.f;
    CGFloat bubblePaddingForImage = 3.f;
    //: CGFloat bubbleArrowWidthForImage = 5.f;
    CGFloat bubbleArrowWidthForImage = 5.f;
    //: if (message.isOutgoingMsg) {
    if (message.isOutgoingMsg) {
        //: return UIEdgeInsetsMake(bubblePaddingForImage,bubblePaddingForImage,bubblePaddingForImage,bubblePaddingForImage + bubbleArrowWidthForImage);
        return UIEdgeInsetsMake(bubblePaddingForImage,bubblePaddingForImage,bubblePaddingForImage,bubblePaddingForImage + bubbleArrowWidthForImage);
    //: }else{
    }else{
        //: return UIEdgeInsetsMake(bubblePaddingForImage,bubblePaddingForImage + bubbleArrowWidthForImage, bubblePaddingForImage,bubblePaddingForImage);
        return UIEdgeInsetsMake(bubblePaddingForImage,bubblePaddingForImage + bubbleArrowWidthForImage, bubblePaddingForImage,bubblePaddingForImage);
    }
}

//: - (NSString *)cellContent:(NIMMessage *)message{
- (NSString *)pin:(NIMMessage *)message{
   //: return @"NTESSessionRedPacketContentView";
   return @"WithImageNameView";
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
    //: return NO;
    return NO;
}


//: @end
@end

Byte *InsectThatDataToByte(InsectThatData *data) {
    if (data->echogram) return data->workplace;
    for (int i = 0; i < data->wolfWeapon; i++) {
        data->workplace[i] ^= data->indexInsert;
    }
    data->workplace[data->wolfWeapon] = 0;
    data->echogram = true;
	if (data->wolfWeapon >= 2) {
		data->combine = data->workplace[0];
		data->magnitudery = data->workplace[1];
	}
    return data->workplace;
}

NSString *StringFromInsectThatData(InsectThatData *data) {
    return [NSString stringWithUTF8String:(char *)InsectThatDataToByte(data)];
}
