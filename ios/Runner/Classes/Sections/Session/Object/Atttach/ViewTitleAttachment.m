
#import <Foundation/Foundation.h>

NSString *StringFromByData(Byte *data);        


//: content
Byte str_proofData[] = {77, 7, 41, 5, 66, 58, 70, 69, 75, 60, 69, 75, 75};


//: type
Byte str_fishingText[] = {15, 4, 28, 10, 197, 129, 121, 137, 12, 172, 88, 93, 84, 73, 156};


//: personCardId
Byte str_textViewData[] = {79, 12, 30, 10, 185, 144, 45, 54, 244, 102, 82, 71, 84, 85, 81, 80, 37, 67, 84, 70, 43, 70, 47};


//: data
Byte str_statusPoolData[] = {86, 4, 31, 6, 102, 28, 69, 66, 85, 66, 93};


//: title
Byte str_badlyValue[] = {40, 5, 17, 6, 39, 232, 99, 88, 99, 91, 84, 34};

// __DEBUG__
// __CLOSE_PRINT__
//
//  ViewTitleAttachment.m
//  NIM
//
//  Created by 田玉龙 on 2022/8/22.
//  Copyright © 2022 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import "NTESShareCardAttachment.h"
#import "ViewTitleAttachment.h"

//: @implementation NTESShareCardAttachment
@implementation ViewTitleAttachment

//: - (NSString *)encodeAttachment {
- (NSString *)encodeAttachment {
    //: NSDictionary *dictContent = @{
    NSDictionary *dictContent = @{
        //: @"title" : self.title?:@"",
        StringFromByData(str_badlyValue) : self.title?:@"",
        //: @"content" : self.content?:@"",
        StringFromByData(str_proofData) : self.content?:@"",
        //: @"personCardId" : self.personCardId?:@"",
        StringFromByData(str_textViewData) : self.personCardId?:@"",
        //: @"type" : self.type?:@"0",
        StringFromByData(str_fishingText) : self.type?:@"0",
    //: };
    };


    //: NSDictionary *dict = @{@"type": @(CustomMessageTypeCard), @"data": dictContent};
    NSDictionary *dict = @{StringFromByData(str_fishingText): @(CustomMessageTypeCard), StringFromByData(str_statusPoolData): dictContent};
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


//: - (CGSize)contentSize:(CGFloat)cellWidth message:(NIMMessage *)message
- (CGSize)markIn:(CGFloat)cellWidth magnitudeMessage:(NIMMessage *)message
{
//    NIMImageObject *imageObject = (NIMImageObject*)[message messageObject];

    //: CGSize contentSize = CGSizeMake(249, 85);
    CGSize contentSize = CGSizeMake(249, 85);
    //: return contentSize;
    return contentSize;
}


//: - (CGSize)contentSize:(NIMMessage *)message cellWidth:(CGFloat)width {
- (CGSize)linkOfPop:(NIMMessage *)message of:(CGFloat)width {
    //: return CGSizeMake(249, 85);
    return CGSizeMake(249, 85);
}

//: - (NSString *)cellContent:(NIMMessage *)message
- (NSString *)pin:(NIMMessage *)message
{
    //: return @"CCCSessionShareCardContentView";
    return @"WithTapView";
}

//: - (UIEdgeInsets)contentViewInsets:(NIMMessage *)message
- (UIEdgeInsets)keyPanoramicView:(NIMMessage *)message
{
    //: return [[AppleProjectKit sharedKit].config setting:message].contentInsets;
    return [[Indicator reach].config info:message].contentInsets;
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

Byte * ByDataToCache(Byte *data) {
    int evident = data[0];
    int refugee = data[1];
    Byte lyric = data[2];
    int valuePool = data[3];
    if (!evident) return data + valuePool;
    for (int i = valuePool; i < valuePool + refugee; i++) {
        int value = data[i] + lyric;
        if (value > 255) {
            value -= 256;
        }
        data[i] = value;
    }
    data[0] = 0;
    data[valuePool + refugee] = 0;
    return data + valuePool;
}

NSString *StringFromByData(Byte *data) {
    return [NSString stringWithUTF8String:(char *)ByDataToCache(data)];
}
