
#import <Foundation/Foundation.h>
typedef struct {
    Byte attractive;
    Byte *quantityroduce;
    unsigned int cameraMedia;
    bool burden;
	int park;
	int textInputMagnitude;
	int curiousShowCount;
} JointData;

NSString *StringFromJointData(JointData *data);


//: 你领取了
JointData str_schemeGelName = (JointData){188, (Byte []){88, 1, 28, 85, 30, 58, 89, 51, 42, 88, 6, 58, 249}, 12, false, 183, 199, 207};


//: isGetDone
JointData str_withProofValue = (JointData){16, (Byte []){121, 99, 87, 117, 100, 84, 127, 126, 117, 18}, 9, false, 8, 101, 41};


//: openPacketId
JointData str_immuneTitle = (JointData){159, (Byte []){240, 239, 250, 241, 207, 254, 252, 244, 250, 235, 214, 251, 59}, 12, false, 183, 22, 141};


//: 你领取了自己的红包
JointData str_leaderContent = (JointData){86, (Byte []){178, 235, 246, 191, 244, 208, 179, 217, 192, 178, 236, 208, 190, 209, 252, 179, 225, 231, 177, 204, 210, 177, 236, 244, 179, 218, 211, 86}, 27, false, 174, 58, 236};


//: 你领取了自己的红包，你的红包已被领完
JointData str_schemeText = (JointData){221, (Byte []){57, 96, 125, 52, 127, 91, 56, 82, 75, 57, 103, 91, 53, 90, 119, 56, 106, 108, 58, 71, 89, 58, 103, 127, 56, 81, 88, 50, 97, 81, 57, 96, 125, 58, 71, 89, 58, 103, 127, 56, 81, 88, 56, 106, 111, 53, 127, 118, 52, 127, 91, 56, 115, 81, 234}, 54, false, 75, 43, 230};


//: 领取了你的红包
JointData str_worthValue = (JointData){171, (Byte []){66, 9, 45, 78, 36, 61, 79, 17, 45, 79, 22, 11, 76, 49, 47, 76, 17, 9, 78, 39, 46, 82}, 21, false, 187, 204, 22};


//: redPacketId
JointData str_fishingName = (JointData){150, (Byte []){228, 243, 242, 198, 247, 245, 253, 243, 226, 223, 242, 186}, 11, false, 209, 188, 165};


//: sendPacketId
JointData str_minimumImposeData = (JointData){62, (Byte []){77, 91, 80, 90, 110, 95, 93, 85, 91, 74, 119, 90, 92}, 12, false, 47, 244, 191};


//: type
JointData str_depressedText = (JointData){144, (Byte []){228, 233, 224, 245, 49}, 4, false, 122, 158, 56};


//: 领取了你的红包，你的红包已被领完
JointData str_customWolfValue = (JointData){29, (Byte []){244, 191, 155, 248, 146, 139, 249, 167, 155, 249, 160, 189, 250, 135, 153, 250, 167, 191, 248, 145, 152, 242, 161, 145, 249, 160, 189, 250, 135, 153, 250, 167, 191, 248, 145, 152, 248, 170, 175, 245, 191, 182, 244, 191, 155, 248, 179, 145, 48}, 48, false, 155, 106, 151};


//: data
JointData str_minimumValue = (JointData){19, (Byte []){119, 114, 103, 114, 57}, 4, false, 228, 178, 209};

// __DEBUG__
// __CLOSE_PRINT__
//
//  LightNameAttachment.m
//  NIM
//
//  Created by chris on 2017/7/17.
//  Copyright © 2017年 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import "NTESRedPacketTipAttachment.h"
#import "LightNameAttachment.h"
//: #import "NTESSessionUtil.h"
#import "ChildMark.h"
//: #import "M80AttributedLabel.h"
#import "MessageEnableTextView.h"
//: #import "BBBKitInfoFetchOption.h"
#import "TitleOption.h"

//: @interface NTESRedPacketTipAttachment()
@interface LightNameAttachment()

//: @property (nonatomic,weak) NIMMessage *message;
@property (nonatomic,weak) NIMMessage *message;

//: @end
@end

//: @implementation NTESRedPacketTipAttachment
@implementation LightNameAttachment

//: - (NSString *)encodeAttachment {
- (NSString *)encodeAttachment {

    //: NSDictionary *dictContent = @{
    NSDictionary *dictContent = @{
                                  //: @"sendPacketId" : self.sendPacketId,
                                  StringFromJointData(&str_minimumImposeData) : self.sendPacketId,
                                  //: @"openPacketId" : self.openPacketId,
                                  StringFromJointData(&str_immuneTitle) : self.openPacketId,
                                  //: @"redPacketId" : self.packetId,
                                  StringFromJointData(&str_fishingName) : self.packetId,
                                  //: @"isGetDone" : self.isGetDone,
                                  StringFromJointData(&str_withProofValue) : self.isGetDone,
                                  //: };
                                  };
    //: NSDictionary *dict = @{@"type": @(CustomMessageTypeRedPacketTip), @"data": dictContent};
    NSDictionary *dict = @{StringFromJointData(&str_depressedText): @(CustomMessageTypeRedPacketTip), StringFromJointData(&str_minimumValue): dictContent};

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


//: - (CGSize)contentSize:(NIMMessage *)message cellWidth:(CGFloat)width{
- (CGSize)linkOfPop:(NIMMessage *)message of:(CGFloat)width{
    //: self.message = message;
    self.message = message;

    //: M80AttributedLabel *label = [[M80AttributedLabel alloc] initWithFrame:CGRectZero];
    MessageEnableTextView *label = [[MessageEnableTextView alloc] initWithFrame:CGRectZero];
    //: label.font = [UIFont systemFontOfSize:10];
    label.font = [UIFont systemFontOfSize:10];

    //: CGFloat messageWidth = width;
    CGFloat messageWidth = width;

    //: [label appendText:self.formatedMessage];
    [label mixInText:self.orientationBubble];
    //: label.autoDetectLinks = NO;
    label.autoDetectLinks = NO;
    //: label.numberOfLines = 0;
    label.numberOfLines = 0;

    //: CGFloat padding = [AppleProjectKit sharedKit].config.maxNotificationTipPadding;
    CGFloat padding = [Indicator reach].config.sumRangeWindow;
    //: CGSize size = [label sizeThatFits:CGSizeMake(width - 2 * padding, 1.7976931348623157e+308)];
    CGSize size = [label sizeThatFits:CGSizeMake(width - 2 * padding, 1.7976931348623157e+308)];
    //: CGFloat cellPadding = 11.f;
    CGFloat cellPadding = 11.f;
    //: CGSize contentSize = CGSizeMake(messageWidth, size.height + 2 * cellPadding);;
    CGSize contentSize = CGSizeMake(messageWidth, size.height + 2 * cellPadding);;
    //: return contentSize;
    return contentSize;
}


//: - (NSString *)formatedMessage{
- (NSString *)orientationBubble{
    //: NSString * showContent;
    NSString * showContent;
    //: NSString * currentUserId = [[NIMSDK sharedSDK].loginManager currentAccount];
    NSString * currentUserId = [[NIMSDK sharedSDK].loginManager currentAccount];
    // 领取别人的红包
    //: BBBKitInfoFetchOption *option = [[BBBKitInfoFetchOption alloc] init];
    TitleOption *option = [[TitleOption alloc] init];
    //: option.message = self.message;
    option.message = self.message;

    //: if ([currentUserId isEqualToString:self.sendPacketId] && [currentUserId isEqualToString:self.openPacketId])
    if ([currentUserId isEqualToString:self.sendPacketId] && [currentUserId isEqualToString:self.openPacketId])
    {
        //: if ([self.isGetDone boolValue])
        if ([self.isGetDone boolValue])
        {
            //: showContent = @"你领取了自己的红包，你的红包已被领完".ntes_localized;
            showContent = StringFromJointData(&str_schemeText).language;
        }
        //: else
        else
        {
            //: showContent = @"你领取了自己的红包".ntes_localized;
            showContent = StringFromJointData(&str_leaderContent).language;
        }
    }
    //: else if ([currentUserId isEqualToString:self.openPacketId])
    else if ([currentUserId isEqualToString:self.openPacketId])
    {
        //: CCCKitInfo * sendUserInfo = [[AppleProjectKit sharedKit] infoByUser:self.sendPacketId option:option];
        TitleInfo * sendUserInfo = [[Indicator reach] indoors:self.sendPacketId harvest:option];
        //: NSString * name = sendUserInfo.showName;
        NSString * name = sendUserInfo.showName;
        //: showContent = [NSString stringWithFormat:@"%@%@%@",
        showContent = [NSString stringWithFormat:@"%@%@%@",
                       //: @"你领取了".ntes_localized,
                       StringFromJointData(&str_schemeGelName).language,
                       //: name,
                       name,
                       //: @"红包".ntes_localized];
                       @"红包".language];
    }

    // 他人领取你的红包
    //: else if ([currentUserId isEqualToString:self.sendPacketId])
    else if ([currentUserId isEqualToString:self.sendPacketId])
    {
        //: CCCKitInfo * openUserInfo = [[AppleProjectKit sharedKit] infoByUser:self.openPacketId option:option];
        TitleInfo * openUserInfo = [[Indicator reach] indoors:self.openPacketId harvest:option];
        //: NSString * name = openUserInfo.showName;
        NSString * name = openUserInfo.showName;

        //: if ([self.isGetDone boolValue])
        if ([self.isGetDone boolValue])
        {
            //: showContent = [NSString stringWithFormat:@"%@%@",
            showContent = [NSString stringWithFormat:@"%@%@",
                           //: name,
                           name,
                           //: @"领取了你的红包，你的红包已被领完".ntes_localized];
                           StringFromJointData(&str_customWolfValue).language];
        }
        //: else
        else
        {
            //: showContent = [NSString stringWithFormat:@"%@%@",
            showContent = [NSString stringWithFormat:@"%@%@",
                           //: name,
                           name,
                           //: @"领取了你的红包".ntes_localized];
                           StringFromJointData(&str_worthValue).language];
        }
    }

    //: return [NSString stringWithFormat:@"  %@",showContent];
    return [NSString stringWithFormat:@"  %@",showContent];
}

//: - (UIEdgeInsets)contentViewInsets:(NIMMessage *)message
- (UIEdgeInsets)keyPanoramicView:(NIMMessage *)message
{
    //: return UIEdgeInsetsZero;
    return UIEdgeInsetsZero;
}

//: - (NSString *)cellContent:(NIMMessage *)message
- (NSString *)pin:(NIMMessage *)message
{
    //: return @"NTESSessionRedPacketTipContentView";
    return @"TingTextView";
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

Byte *JointDataToByte(JointData *data) {
    if (data->burden) return data->quantityroduce;
    for (int i = 0; i < data->cameraMedia; i++) {
        data->quantityroduce[i] ^= data->attractive;
    }
    data->quantityroduce[data->cameraMedia] = 0;
    data->burden = true;
	if (data->cameraMedia >= 3) {
		data->park = data->quantityroduce[0];
		data->textInputMagnitude = data->quantityroduce[1];
		data->curiousShowCount = data->quantityroduce[2];
	}
    return data->quantityroduce;
}

NSString *StringFromJointData(JointData *data) {
    return [NSString stringWithUTF8String:(char *)JointDataToByte(data)];
}
