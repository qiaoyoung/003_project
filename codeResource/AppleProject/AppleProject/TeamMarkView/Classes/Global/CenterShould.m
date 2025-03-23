
#import <Foundation/Foundation.h>

NSString *StringFromBlocData(Byte *data);        


//: icon_receiver_node_normal
Byte str_crediblyName[] = {9, 25, 48, 13, 200, 19, 198, 165, 17, 233, 140, 66, 211, 57, 51, 63, 62, 47, 66, 53, 51, 53, 57, 70, 53, 66, 47, 62, 63, 52, 53, 47, 62, 63, 66, 61, 49, 60, 43};


//: {18,25,17,25}
Byte str_scriptFallValue[] = {28, 13, 61, 10, 181, 74, 246, 87, 142, 168, 62, 244, 251, 239, 245, 248, 239, 244, 250, 239, 245, 248, 64, 30};


//: icon_receiver_node_pressed
Byte str_workingValue[] = {52, 26, 34, 12, 26, 104, 72, 38, 153, 55, 68, 2, 71, 65, 77, 76, 61, 80, 67, 65, 67, 71, 84, 67, 80, 61, 76, 77, 66, 67, 61, 78, 80, 67, 81, 81, 67, 66, 152};


//: icon_sender_text_node_normal
Byte str_conRawName[] = {21, 28, 50, 10, 210, 182, 83, 54, 219, 226, 55, 49, 61, 60, 45, 65, 51, 60, 50, 51, 64, 45, 66, 51, 70, 66, 45, 60, 61, 50, 51, 45, 60, 61, 64, 59, 47, 58, 248};


//: icon_sender_text_node_pressed
Byte str_overtListenName[] = {61, 29, 3, 14, 143, 171, 60, 177, 195, 118, 162, 129, 161, 208, 102, 96, 108, 107, 92, 112, 98, 107, 97, 98, 111, 92, 113, 98, 117, 113, 92, 107, 108, 97, 98, 92, 109, 111, 98, 112, 112, 98, 97, 58};

// __DEBUG__
// __CLOSE_PRINT__
//
//  CenterShould.m
// Indicator
//
//  Created by chris on 2017/10/30.
//  Copyright © 2017年 NetEase. All rights reserved.
//

// __M_A_C_R_O__
//: #import "CCCKitSetting.h"
#import "CenterShould.h"
//: #import "UIImage+AppleProjectKit.h"
#import "UIImage+Indicator.h"

//: @implementation CCCKitSetting
@implementation CenterShould

//: - (instancetype)init:(BOOL)isRight
- (instancetype)initValue:(BOOL)isRight
{
    //: self = [super init];
    self = [super init];
    //: if (self)
    if (self)
    {
        //: if (isRight)
        if (isRight)
        {
            //: _normalBackgroundImage = [[UIImage grayImageWithName:@"icon_sender_text_node_normal"] resizableImageWithCapInsets:UIEdgeInsetsFromString(@"{18,25,17,25}") resizingMode:UIImageResizingModeStretch];
            _normalBackgroundImage = [[UIImage redView:StringFromBlocData(str_conRawName)] resizableImageWithCapInsets:UIEdgeInsetsFromString(StringFromBlocData(str_scriptFallValue)) resizingMode:UIImageResizingModeStretch];
            //: _highLightBackgroundImage = [[UIImage grayImageWithName:@"icon_sender_text_node_pressed"] resizableImageWithCapInsets:UIEdgeInsetsFromString(@"{18,25,17,25}") resizingMode:UIImageResizingModeStretch];
            _highLightBackgroundImage = [[UIImage redView:StringFromBlocData(str_overtListenName)] resizableImageWithCapInsets:UIEdgeInsetsFromString(StringFromBlocData(str_scriptFallValue)) resizingMode:UIImageResizingModeStretch];

        }
        //: else
        else
        {
            //: _normalBackgroundImage = [[UIImage imageNamed:@"icon_receiver_node_normal"] resizableImageWithCapInsets:UIEdgeInsetsFromString(@"{18,25,17,25}") resizingMode:UIImageResizingModeStretch];
            _normalBackgroundImage = [[UIImage imageNamed:StringFromBlocData(str_crediblyName)] resizableImageWithCapInsets:UIEdgeInsetsFromString(StringFromBlocData(str_scriptFallValue)) resizingMode:UIImageResizingModeStretch];
            //: _highLightBackgroundImage = [[UIImage imageNamed:@"icon_receiver_node_pressed"] resizableImageWithCapInsets:UIEdgeInsetsFromString(@"{18,25,17,25}") resizingMode:UIImageResizingModeStretch];
            _highLightBackgroundImage = [[UIImage imageNamed:StringFromBlocData(str_workingValue)] resizableImageWithCapInsets:UIEdgeInsetsFromString(StringFromBlocData(str_scriptFallValue)) resizingMode:UIImageResizingModeStretch];
        }
    }
    //: return self;
    return self;
}

//: @end
@end

Byte * BlocDataToCache(Byte *data) {
    int investigatorDefinition = data[0];
    int visualDefect = data[1];
    Byte priseTake = data[2];
    int wager = data[3];
    if (!investigatorDefinition) return data + wager;
    for (int i = wager; i < wager + visualDefect; i++) {
        int value = data[i] + priseTake;
        if (value > 255) {
            value -= 256;
        }
        data[i] = value;
    }
    data[0] = 0;
    data[wager + visualDefect] = 0;
    return data + wager;
}

NSString *StringFromBlocData(Byte *data) {
    return [NSString stringWithUTF8String:(char *)BlocDataToCache(data)];
}
