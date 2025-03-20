
#import <Foundation/Foundation.h>
typedef struct {
    Byte hareProd;
    Byte *signer;
    unsigned int noGoArea;
    bool groupDiscussion;
	int countubate;
	int surgeon;
	int sea;
} EntireSessionData;

NSString *StringFromEntireSessionData(EntireSessionData *data);


//: 群名片
EntireSessionData str_ovenTableData = (EntireSessionData){113, (Byte []){150, 207, 213, 148, 225, 252, 150, 248, 246, 228}, 9, false, 245, 73, 21};


//: 个人名片
EntireSessionData str_breakfastValue = (EntireSessionData){157, (Byte []){121, 37, 55, 121, 39, 39, 120, 13, 16, 122, 20, 26, 148}, 12, false, 205, 150, 81};


//: home_fragment_yue
EntireSessionData str_quitName = (EntireSessionData){239, (Byte []){135, 128, 130, 138, 176, 137, 157, 142, 136, 130, 138, 129, 155, 176, 150, 154, 138, 1}, 17, false, 157, 45, 244};


//: message_red_packet
EntireSessionData str_closeValue = (EntireSessionData){160, (Byte []){205, 197, 211, 211, 193, 199, 197, 255, 210, 197, 196, 255, 208, 193, 195, 203, 197, 212, 125}, 18, false, 84, 144, 166};


//: retracted_message
EntireSessionData str_appreciateContent = (EntireSessionData){161, (Byte []){211, 196, 213, 211, 192, 194, 213, 196, 197, 254, 204, 196, 210, 210, 192, 198, 196, 193}, 17, false, 77, 2, 10};


//: home_fragment_bai
EntireSessionData str_thoughtLimbData = (EntireSessionData){99, (Byte []){11, 12, 14, 6, 60, 5, 17, 2, 4, 14, 6, 13, 23, 60, 1, 2, 10, 192}, 17, false, 201, 46, 91};


//: message_guess
EntireSessionData str_awarenessName = (EntireSessionData){125, (Byte []){16, 24, 14, 14, 28, 26, 24, 34, 26, 8, 24, 14, 14, 145}, 13, false, 1, 246, 125};


//: home_fragment_liao
EntireSessionData str_widowContent = (EntireSessionData){193, (Byte []){169, 174, 172, 164, 158, 167, 179, 160, 166, 172, 164, 175, 181, 158, 173, 168, 160, 174, 6}, 18, false, 38, 15, 207};

// __DEBUG__
// __CLOSE_PRINT__
//
//  MessageStatus.m
//  NIM
//
//  Created by Netease on 2019/10/17.
//  Copyright © 2019 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import "NTESMessageUtil.h"
#import "MessageStatus.h"
//: #import "AAAMessageUtil.h"
#import "MinDoingOf.h"
//: #import "NTESShareCardAttachment.h"
#import "ViewTitleAttachment.h"

//: @implementation NTESMessageUtil
@implementation MessageStatus

//: + (NSString *)messageContent:(NIMMessage *)message {
+ (NSString *)textCipher:(NIMMessage *)message {
    //: NSString *text = nil;
    NSString *text = nil;
    //: if (message.messageType == NIMMessageTypeCustom) {
    if (message.messageType == NIMMessageTypeCustom) {
        //: text = [self customMessageContent:message];
        text = [self table:message];
    //: } else {
    } else {
        //: text = [AAAMessageUtil messageContent:message];
        text = [MinDoingOf lineText:message];
    }
    //: return text;
    return text;
}

//: + (NSString *)customMessageContent:(NIMMessage *)message {
+ (NSString *)table:(NIMMessage *)message {
    //: NSString *text = nil;
    NSString *text = nil;
    //: NIMCustomObject *object = message.messageObject;
    NIMCustomObject *object = message.messageObject;
    //: if ([object.attachment isKindOfClass:[NTESSnapchatAttachment class]])
    if ([object.attachment isKindOfClass:[TopOfTap class]])
    {
        //: text = [NTESLanguageManager getTextWithKey:@"home_fragment_yue"];
        text = [MaxInformation off:StringFromEntireSessionData(&str_quitName)];//@"[阅后即焚]".ntes_localized;
    }
    //: else if ([object.attachment isKindOfClass:[NTESJanKenPonAttachment class]])
    else if ([object.attachment isKindOfClass:[MaxOnStatusAttachment class]])
    {
        //: text = [NTESLanguageManager getTextWithKey:@"message_guess"];
        text = [MaxInformation off:StringFromEntireSessionData(&str_awarenessName)];//@"[猜拳]".ntes_localized;
    }
    //: else if ([object.attachment isKindOfClass:[NTESWhiteboardAttachment class]])
    else if ([object.attachment isKindOfClass:[ToContainer class]])
    {
        //: text = [NTESLanguageManager getTextWithKey:@"home_fragment_bai"];
        text = [MaxInformation off:StringFromEntireSessionData(&str_thoughtLimbData)];//@"[白板]".ntes_localized;
    }
    //: else if ([object.attachment isKindOfClass:[NTESRedPacketAttachment class]])
    else if ([object.attachment isKindOfClass:[MarkTing class]])
    {
        //: text = [NTESLanguageManager getTextWithKey:@"message_red_packet"];
        text = [MaxInformation off:StringFromEntireSessionData(&str_closeValue)];//@"[红包消息]".ntes_localized;
    }
    //: else if ([object.attachment isKindOfClass:[NTESRedPacketTipAttachment class]])
    else if ([object.attachment isKindOfClass:[LightNameAttachment class]])
    {
        //: NTESRedPacketTipAttachment *attach = (NTESRedPacketTipAttachment *)object.attachment;
        LightNameAttachment *attach = (LightNameAttachment *)object.attachment;
        //: text = attach.formatedMessage;
        text = attach.orientationBubble;
    }
    //: else if ([object.attachment isKindOfClass:[NTESMultiRetweetAttachment class]])
    else if ([object.attachment isKindOfClass:[AttachmentHide class]])
    {
        //: text = [NTESLanguageManager getTextWithKey:@"home_fragment_liao"];
        text = [MaxInformation off:StringFromEntireSessionData(&str_widowContent)];//@"[聊天记录]".ntes_localized;
    }
    //: else if ([object.attachment isKindOfClass:[NTESShareCardAttachment class]])
    else if ([object.attachment isKindOfClass:[ViewTitleAttachment class]])
    {
        //: NTESShareCardAttachment *cardAtt = (NTESShareCardAttachment *)object.attachment;
        ViewTitleAttachment *cardAtt = (ViewTitleAttachment *)object.attachment;
        //: if ([cardAtt.type boolValue]) {
        if ([cardAtt.type boolValue]) {
            //: text = [NSString stringWithFormat:@"[%@]",@"群名片".nim_localized];
            text = [NSString stringWithFormat:@"[%@]",StringFromEntireSessionData(&str_ovenTableData).trapLocalized];//@"[聊天记录]".ntes_localized;
        //: } else {
        } else {
            //: text = [NSString stringWithFormat:@"[%@]",@"个人名片".nim_localized];
            text = [NSString stringWithFormat:@"[%@]",StringFromEntireSessionData(&str_breakfastValue).trapLocalized];//@"[聊天记录]".ntes_localized;
        }
    }
    //: else if (message.messageSubType == 20)
    else if (message.messageSubType == 20)
    {
        //: text = [NTESLanguageManager getTextWithKey:@"retracted_message"];
        text = [MaxInformation off:StringFromEntireSessionData(&str_appreciateContent)];//撤回
    }
    //: else
    else
    {
        //: text = @"";
        text = @"";//@"[未知消息]".ntes_localized;LangKey(@"message_unknow_message")
    }
    //: return text;
    return text;
}
//: @end
@end

Byte *EntireSessionDataToByte(EntireSessionData *data) {
    if (data->groupDiscussion) return data->signer;
    for (int i = 0; i < data->noGoArea; i++) {
        data->signer[i] ^= data->hareProd;
    }
    data->signer[data->noGoArea] = 0;
    data->groupDiscussion = true;
	if (data->noGoArea >= 3) {
		data->countubate = data->signer[0];
		data->surgeon = data->signer[1];
		data->sea = data->signer[2];
	}
    return data->signer;
}

NSString *StringFromEntireSessionData(EntireSessionData *data) {
    return [NSString stringWithUTF8String:(char *)EntireSessionDataToByte(data)];
}
