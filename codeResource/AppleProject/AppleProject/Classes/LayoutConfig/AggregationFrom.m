
#import <Foundation/Foundation.h>

NSString *StringFromSeventhScheduleData(Byte *data);


//: message must be custom
Byte str_vaccineFishName[] = {50, 22, 59, 7, 136, 58, 178, 168, 160, 174, 174, 156, 162, 160, 91, 168, 176, 174, 175, 91, 157, 160, 91, 158, 176, 174, 175, 170, 168, 235};

// __DEBUG__
// __CLOSE_PRINT__
//
//  AggregationFrom.m
//  NIM
//
//  Created by chris on 16/1/14.
//  Copyright © 2016年 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import "NTESSessionCustomContentConfig.h"
#import "AggregationFrom.h"
//: #import "NTESCustomAttachmentDefines.h"
#import "NTESCustomAttachmentDefines.h"

//: @interface NTESSessionCustomContentConfig()
@interface AggregationFrom()

//: @end
@end

//: @implementation NTESSessionCustomContentConfig
@implementation AggregationFrom

//: - (CGSize)contentSize:(CGFloat)cellWidth message:(NIMMessage *)message
- (CGSize)offMessage:(CGFloat)cellWidth view:(NIMMessage *)message
{
    //: NIMCustomObject *object = message.messageObject;
    NIMCustomObject *object = message.messageObject;
    //: NSAssert([object isKindOfClass:[NIMCustomObject class]], @"message must be custom");
    NSAssert([object isKindOfClass:[NIMCustomObject class]], StringFromSeventhScheduleData(str_vaccineFishName));
    //: id<NTESCustomAttachmentInfo> info = (id<NTESCustomAttachmentInfo>)object.attachment;
    id<TingChild> info = (id<TingChild>)object.attachment;
    //: return [info contentSize:message cellWidth:cellWidth];
    return [info linkOfPop:message of:cellWidth];
}

//: - (NSString *)cellContent:(NIMMessage *)message
- (NSString *)text:(NIMMessage *)message
{
    //: NIMCustomObject *object = message.messageObject;
    NIMCustomObject *object = message.messageObject;
    //: NSAssert([object isKindOfClass:[NIMCustomObject class]], @"message must be custom");
    NSAssert([object isKindOfClass:[NIMCustomObject class]], StringFromSeventhScheduleData(str_vaccineFishName));
    //: id<NTESCustomAttachmentInfo> info = (id<NTESCustomAttachmentInfo>)object.attachment;
    id<TingChild> info = (id<TingChild>)object.attachment;
    //: return [info cellContent:message];
    return [info pin:message];
}

//: - (UIEdgeInsets)contentViewInsets:(NIMMessage *)message
- (UIEdgeInsets)pressedView:(NIMMessage *)message
{
    //: NIMCustomObject *object = message.messageObject;
    NIMCustomObject *object = message.messageObject;
    //: NSAssert([object isKindOfClass:[NIMCustomObject class]], @"message must be custom");
    NSAssert([object isKindOfClass:[NIMCustomObject class]], StringFromSeventhScheduleData(str_vaccineFishName));
    //: id<NTESCustomAttachmentInfo> info = (id<NTESCustomAttachmentInfo>)object.attachment;
    id<TingChild> info = (id<TingChild>)object.attachment;
    //: return [info contentViewInsets:message];
    return [info keyPanoramicView:message];
}

//: - (BOOL)enableBackgroundBubbleView:(NIMMessage *)message
- (BOOL)backgrounded:(NIMMessage *)message
{
    //: NIMCustomObject *object = message.messageObject;
    NIMCustomObject *object = message.messageObject;
    //: NSAssert([object isKindOfClass:[NIMCustomObject class]], @"message must be custom");
    NSAssert([object isKindOfClass:[NIMCustomObject class]], StringFromSeventhScheduleData(str_vaccineFishName));
    //: id<NTESCustomAttachmentInfo> info = (id<NTESCustomAttachmentInfo>)object.attachment;
    id<TingChild> info = (id<TingChild>)object.attachment;
    //: if (![info respondsToSelector:@selector(canDisplayBubbleBackground:)])
    if (![info respondsToSelector:@selector(ofs:)])
    {
        //: return YES;
        return YES;
    }
    //: return [info canDisplayBubbleBackground:message];
    return [info ofs:message];
}


//: @end
@end

Byte * SeventhScheduleDataToCache(Byte *data) {
    int pigsFeet = data[0];
    int broadaxe = data[1];
    Byte natural = data[2];
    int steeringCommittee = data[3];
    if (!pigsFeet) return data + steeringCommittee;
    for (int i = steeringCommittee; i < steeringCommittee + broadaxe; i++) {
        int value = data[i] - natural;
        if (value < 0) {
            value += 256;
        }
        data[i] = value;
    }
    data[0] = 0;
    data[steeringCommittee + broadaxe] = 0;
    return data + steeringCommittee;
}

NSString *StringFromSeventhScheduleData(Byte *data) {
    return [NSString stringWithUTF8String:(char *)SeventhScheduleDataToCache(data)];
}
