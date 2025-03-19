//
//  NTESMessageUtil.m
//  NIM
//
//  Created by Netease on 2019/10/17.
//  Copyright © 2019 Netease. All rights reserved.
//

#import "NTESMessageUtil.h"
#import "AAAMessageUtil.h"
#import "NTESShareCardAttachment.h"

@implementation NTESMessageUtil

+ (NSString *)messageContent:(NIMMessage *)message {
    NSString *text = nil;
    if (message.messageType == NIMMessageTypeCustom) {
        text = [self customMessageContent:message];
    } else {
        text = [AAAMessageUtil messageContent:message];
    }
    return text;
}

+ (NSString *)customMessageContent:(NIMMessage *)message {
    NSString *text = nil;
    NIMCustomObject *object = message.messageObject;
    if ([object.attachment isKindOfClass:[NTESSnapchatAttachment class]])
    {
        text = LangKey(@"home_fragment_yue");//@"[阅后即焚]".ntes_localized;
    }
    else if ([object.attachment isKindOfClass:[NTESJanKenPonAttachment class]])
    {
        text = LangKey(@"message_guess");//@"[猜拳]".ntes_localized;
    }
    else if ([object.attachment isKindOfClass:[NTESWhiteboardAttachment class]])
    {
        text = LangKey(@"home_fragment_bai");//@"[白板]".ntes_localized;
    }
    else if ([object.attachment isKindOfClass:[NTESRedPacketAttachment class]])
    {
        text = LangKey(@"message_red_packet");//@"[红包消息]".ntes_localized;
    }
    else if ([object.attachment isKindOfClass:[NTESRedPacketTipAttachment class]])
    {
        NTESRedPacketTipAttachment *attach = (NTESRedPacketTipAttachment *)object.attachment;
        text = attach.formatedMessage;
    }
    else if ([object.attachment isKindOfClass:[NTESMultiRetweetAttachment class]])
    {
        text = LangKey(@"home_fragment_liao");//@"[聊天记录]".ntes_localized;
    }
    else if ([object.attachment isKindOfClass:[NTESShareCardAttachment class]])
    {
        NTESShareCardAttachment *cardAtt = (NTESShareCardAttachment *)object.attachment;
        if ([cardAtt.type boolValue]) {
            text = [NSString stringWithFormat:@"[%@]",@"群名片".nim_localized];//@"[聊天记录]".ntes_localized;
        } else {
            text = [NSString stringWithFormat:@"[%@]",@"个人名片".nim_localized];//@"[聊天记录]".ntes_localized;
        }
    }
    else if (message.messageSubType == 20)
    {
        text = LangKey(@"retracted_message");//撤回
    }
    else
    {
        text = @"";//@"[未知消息]".ntes_localized;LangKey(@"message_unknow_message")
    }
    return text;
}
@end
