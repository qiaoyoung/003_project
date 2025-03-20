
#import <Foundation/Foundation.h>
typedef struct {
    Byte recordMissing;
    Byte *definitionCenter;
    unsigned int load;
    bool tian;
	int setUp;
} PerhapsWeekendData;

NSString *StringFromPerhapsWeekendData(PerhapsWeekendData *data);


//: 未知类型消息
PerhapsWeekendData str_throatData = (PerhapsWeekendData){216, (Byte []){62, 68, 114, 63, 71, 125, 63, 105, 99, 61, 70, 83, 62, 110, 80, 62, 89, 119, 149}, 18, false, 78};

// __DEBUG__
// __CLOSE_PRINT__
//
//  TitleConfig.m
// Indicator
//
//  Created by amao on 9/15/15.
//  Copyright (c) 2015 NetEase. All rights reserved.
//

// __M_A_C_R_O__
//: #import "CCCUnsupportContentConfig.h"
#import "TitleConfig.h"
//: #import "AppleProjectKit.h"
#import "Indicator.h"

//: @interface CCCUnsupportContentConfig ()
@interface TitleConfig ()

//: @property (nonatomic,strong) UILabel *label;
@property (nonatomic,strong) UILabel *label;

//: @end
@end

//: @implementation CCCUnsupportContentConfig
@implementation TitleConfig

//: - (instancetype)init
- (instancetype)init
{
    //: self = [super init];
    self = [super init];
    //: if (self)
    if (self)
    {
        //: _label = [[UILabel alloc] initWithFrame:CGRectZero];
        _label = [[UILabel alloc] initWithFrame:CGRectZero];
        //: _label.text = @"未知类型消息".nim_localized;
        _label.text = StringFromPerhapsWeekendData(&str_throatData).trapLocalized;
    }
    //: return self;
    return self;
}

//: - (CGSize)contentSize:(CGFloat)cellWidth message:(NIMMessage *)message
- (CGSize)offMessage:(CGFloat)cellWidth view:(NIMMessage *)message
{
    //: CGSize size = [self.label sizeThatFits:CGSizeMake(1.7976931348623157e+308, 40.f)];
    CGSize size = [self.label sizeThatFits:CGSizeMake(1.7976931348623157e+308, 40.f)];
    //: return CGSizeMake(size.width, 40.f);
    return CGSizeMake(size.width, 40.f);
}

//: - (NSString *)cellContent:(NIMMessage *)message
- (NSString *)text:(NIMMessage *)message
{
    //: CCCKitSetting *setting = [[AppleProjectKit sharedKit].config setting:message];
    CenterShould *setting = [[Indicator reach].config info:message];
    //: self.label.textColor = setting.textColor;
    self.label.textColor = setting.textColor;
    //: self.label.font = setting.font;
    self.label.font = setting.font;

    //: return @"CCCSessionUnknowContentView";
    return @"TopControl";
}

//: - (UIEdgeInsets)contentViewInsets:(NIMMessage *)message
- (UIEdgeInsets)pressedView:(NIMMessage *)message
{
    //: CCCKitSettings *settings = message.isOutgoingMsg? [AppleProjectKit sharedKit].config.rightBubbleSettings : [AppleProjectKit sharedKit].config.leftBubbleSettings;
    MastheadSettings *settings = message.isOutgoingMsg? [Indicator reach].config.rightBubbleSettings : [Indicator reach].config.leftBubbleSettings;
    //: return settings.unsupportSetting.contentInsets;
    return settings.unsupportSetting.contentInsets;
}

//: @end
@end

Byte *PerhapsWeekendDataToByte(PerhapsWeekendData *data) {
    if (data->tian) return data->definitionCenter;
    for (int i = 0; i < data->load; i++) {
        data->definitionCenter[i] ^= data->recordMissing;
    }
    data->definitionCenter[data->load] = 0;
    data->tian = true;
	if (data->load >= 1) {
		data->setUp = data->definitionCenter[0];
	}
    return data->definitionCenter;
}

NSString *StringFromPerhapsWeekendData(PerhapsWeekendData *data) {
    return [NSString stringWithUTF8String:(char *)PerhapsWeekendDataToByte(data)];
}
