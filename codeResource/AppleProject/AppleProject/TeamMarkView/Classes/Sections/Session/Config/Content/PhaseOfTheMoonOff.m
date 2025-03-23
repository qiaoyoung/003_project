
#import <Foundation/Foundation.h>
typedef struct {
    Byte fashion;
    Byte *sendManipulate;
    unsigned int switchly;
    bool electric;
	int conservationScheme;
	int porchAnal;
	int invisible;
} CornerData;

NSString *StringFromCornerData(CornerData *data);


//: message should be audio
CornerData str_constrainText = (CornerData){17, (Byte []){124, 116, 98, 98, 112, 118, 116, 49, 98, 121, 126, 100, 125, 117, 49, 115, 116, 49, 112, 100, 117, 120, 126, 65}, 23, false, 165, 138, 25};

// __DEBUG__
// __CLOSE_PRINT__
//
//  PhaseOfTheMoonOff.m
// Indicator
//
//  Created by amao on 9/15/15.
//  Copyright (c) 2015 NetEase. All rights reserved.
//

// __M_A_C_R_O__
//: #import "CCCAudioContentConfig.h"
#import "PhaseOfTheMoonOff.h"
//: #import "AppleProjectKit.h"
#import "Indicator.h"

//: @implementation CCCAudioContentConfig
@implementation PhaseOfTheMoonOff

//: - (CGSize)contentSize:(CGFloat)cellWidth message:(NIMMessage *)message
- (CGSize)offMessage:(CGFloat)cellWidth view:(NIMMessage *)message
{
        //使用公式 长度 = (最长－最小)*(2/pi)*artan(时间/10)+最小，在10秒时变化逐渐变缓，随着时间增加 无限趋向于最大值
    //: NIMAudioObject *audioContent = (NIMAudioObject*)[message messageObject];
    NIMAudioObject *audioContent = (NIMAudioObject*)[message messageObject];
    //: NSAssert([audioContent isKindOfClass:[NIMAudioObject class]], @"message should be audio");
    NSAssert([audioContent isKindOfClass:[NIMAudioObject class]], StringFromCornerData(&str_constrainText));


    //: CGFloat value = 2*atan((audioContent.duration/1000.0-1)/10.0)/3.14159265358979323846264338327950288;
    CGFloat value = 2*atan((audioContent.duration/1000.0-1)/10.0)/3.14159265358979323846264338327950288;
    //: NSInteger audioContentMinWidth = 50;
    NSInteger audioContentMinWidth = 50;
    //: NSInteger audioContentMaxWidth = (cellWidth - 170);
    NSInteger audioContentMaxWidth = (cellWidth - 170);
    //: NSInteger audioContentHeight = 30;
    NSInteger audioContentHeight = 30;
    //: return CGSizeMake((audioContentMaxWidth - audioContentMinWidth)* value + audioContentMinWidth, audioContentHeight);
    return CGSizeMake((audioContentMaxWidth - audioContentMinWidth)* value + audioContentMinWidth, audioContentHeight);
}

//: - (NSString *)cellContent:(NIMMessage *)message
- (NSString *)text:(NIMMessage *)message
{
    //: return @"CCCSessionAudioContentView";
    return @"LanguageView";
}

//: - (UIEdgeInsets)contentViewInsets:(NIMMessage *)message
- (UIEdgeInsets)pressedView:(NIMMessage *)message
{
    //: return [[AppleProjectKit sharedKit].config setting:message].contentInsets;
    return [[Indicator reach].config info:message].contentInsets;
}

//: @end
@end

Byte *CornerDataToByte(CornerData *data) {
    if (data->electric) return data->sendManipulate;
    for (int i = 0; i < data->switchly; i++) {
        data->sendManipulate[i] ^= data->fashion;
    }
    data->sendManipulate[data->switchly] = 0;
    data->electric = true;
	if (data->switchly >= 3) {
		data->conservationScheme = data->sendManipulate[0];
		data->porchAnal = data->sendManipulate[1];
		data->invisible = data->sendManipulate[2];
	}
    return data->sendManipulate;
}

NSString *StringFromCornerData(CornerData *data) {
    return [NSString stringWithUTF8String:(char *)CornerDataToByte(data)];
}
