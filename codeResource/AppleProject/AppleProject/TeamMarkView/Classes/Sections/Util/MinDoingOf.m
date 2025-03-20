
#import <Foundation/Foundation.h>

NSString *StringFromOndSessionData(Byte *data);


//: Image
Byte str_intervalData[] = {57, 5, 38, 14, 152, 164, 108, 198, 53, 37, 118, 34, 205, 198, 111, 147, 135, 141, 139, 180};


//: Audio
Byte str_auraText[] = {89, 5, 16, 7, 254, 116, 174, 81, 133, 116, 121, 127, 80};


//: teamgonggao_record_
Byte str_egretAchingTitle[] = {42, 19, 48, 11, 133, 197, 86, 250, 202, 71, 109, 164, 149, 145, 157, 151, 159, 158, 151, 151, 145, 159, 143, 162, 149, 147, 159, 162, 148, 143, 167};


//: teamgonggao_
Byte str_jazzQuitName[] = {56, 12, 85, 9, 160, 44, 194, 122, 242, 201, 186, 182, 194, 188, 196, 195, 188, 188, 182, 196, 180, 67};


//: Group_chat_information_update
Byte str_consumeValue[] = {2, 29, 4, 4, 75, 118, 115, 121, 116, 99, 103, 108, 101, 120, 99, 109, 114, 106, 115, 118, 113, 101, 120, 109, 115, 114, 99, 121, 116, 104, 101, 120, 105, 76};


//: Group_information_update
Byte str_ourValue[] = {26, 24, 63, 14, 111, 160, 246, 46, 25, 86, 32, 164, 209, 129, 134, 177, 174, 180, 175, 158, 168, 173, 165, 174, 177, 172, 160, 179, 168, 174, 173, 158, 180, 175, 163, 160, 179, 164, 181};


//: File
Byte str_theaterEgretName[] = {88, 4, 69, 9, 53, 82, 166, 11, 6, 139, 174, 177, 170, 77};


//: Video_chat
Byte str_tanValue[] = {44, 10, 80, 6, 8, 91, 166, 185, 180, 181, 191, 175, 179, 184, 177, 196, 236};


//: teamgonggao_title_
Byte str_convictionValue[] = {47, 18, 92, 10, 246, 86, 101, 253, 33, 56, 208, 193, 189, 201, 195, 203, 202, 195, 195, 189, 203, 187, 208, 197, 208, 200, 193, 187, 30};


//: teamgonggao_content_
Byte str_conservationValue[] = {84, 20, 27, 12, 248, 215, 151, 112, 98, 48, 48, 21, 143, 128, 124, 136, 130, 138, 137, 130, 130, 124, 138, 122, 126, 138, 137, 143, 128, 137, 143, 122, 92};


//: Super_Group_Information_Update
Byte str_seaFileKeyTitle[] = {10, 30, 6, 9, 160, 112, 204, 12, 150, 89, 123, 118, 107, 120, 101, 77, 120, 117, 123, 118, 101, 79, 116, 108, 117, 120, 115, 103, 122, 111, 117, 116, 101, 91, 118, 106, 103, 122, 107, 76};


//: Video
Byte str_nearMmValue[] = {89, 5, 6, 4, 92, 111, 106, 107, 117, 131};


//: content
Byte str_accomplishValue[] = {81, 7, 16, 4, 115, 127, 126, 132, 117, 126, 132, 72};


//: title
Byte str_closeName[] = {51, 5, 24, 13, 58, 56, 96, 222, 214, 115, 159, 166, 135, 140, 129, 140, 132, 125, 47};


//: Internet_call
Byte str_holdScapeSurgeonData[] = {98, 13, 68, 8, 10, 175, 69, 77, 141, 178, 184, 169, 182, 178, 169, 184, 163, 167, 165, 176, 176, 32};


//: Location
Byte str_yerData[] = {5, 8, 12, 14, 90, 173, 93, 104, 221, 242, 4, 189, 98, 5, 88, 123, 111, 109, 128, 117, 123, 122, 93};

// __DEBUG__
// __CLOSE_PRINT__
//
//  MinDoingOf.m
// Indicator
//
//  Created by Netease on 2019/10/17.
//  Copyright © 2019 NetEase. All rights reserved.
//

// __M_A_C_R_O__
//: #import "AAAMessageUtil.h"
#import "MinDoingOf.h"
//: #import <NIMSDK/NIMSDK.h>
#import <NIMSDK/NIMSDK.h>
//: #import "UserGlobalMacro.h"
#import "UserGlobalMacro.h"
//: #import "AAAKitUtil.h"
#import "TypicalCenter.h"
//: #import "AppleProjectKit.h"
#import "Indicator.h"
//: #import "NSDictionary+AppleProjectKit.h"
#import "NSDictionary+Indicator.h"

//: @implementation AAAMessageUtil
@implementation MinDoingOf

//: + (NSString *)messageContent:(NIMMessage*)message {
+ (NSString *)lineText:(NIMMessage*)message {
    //: NSString *text = @"";
    NSString *text = @"";
    //: switch (message.messageType) {
    switch (message.messageType) {
        //: case NIMMessageTypeText:
        case NIMMessageTypeText:
            //: text = message.text;
            text = message.text;
            //: break;
            break;
        //: case NIMMessageTypeAudio:
        case NIMMessageTypeAudio:
            //: text = [NTESLanguageManager getTextWithKey:@"Audio"]; 
            text = [MaxInformation off:StringFromOndSessionData(str_auraText)]; //@"[语音]".nim_localized;
            //: break;
            break;
        //: case NIMMessageTypeImage:
        case NIMMessageTypeImage:
            //: text = [NTESLanguageManager getTextWithKey:@"Image"];
            text = [MaxInformation off:StringFromOndSessionData(str_intervalData)];//@"[图片]".nim_localized;
            //: break;
            break;
        //: case NIMMessageTypeVideo:
        case NIMMessageTypeVideo:
            //: text = [NTESLanguageManager getTextWithKey:@"Video"];
            text = [MaxInformation off:StringFromOndSessionData(str_nearMmValue)];//@"[视频]".nim_localized;
            //: break;
            break;
        //: case NIMMessageTypeLocation:
        case NIMMessageTypeLocation:
            //: text = [NTESLanguageManager getTextWithKey:@"Location"];
            text = [MaxInformation off:StringFromOndSessionData(str_yerData)];//@"[位置]".nim_localized;
            //: break;
            break;
        //: case NIMMessageTypeNotification:{
        case NIMMessageTypeNotification:{
            //: return [self notificationMessageContent:message];
            return [self originText:message];
        }
        //: case NIMMessageTypeFile:
        case NIMMessageTypeFile:
            //: text = [NTESLanguageManager getTextWithKey:@"File"];
            text = [MaxInformation off:StringFromOndSessionData(str_theaterEgretName)];//@"[文件]".nim_localized;
            //: break;
            break;
        //: case NIMMessageTypeTip:
        case NIMMessageTypeTip:
            //: text = message.text;
            text = message.text;
            //: break;
            break;
        //: case NIMMessageTypeRtcCallRecord: {
        case NIMMessageTypeRtcCallRecord: {
            //: NIMRtcCallRecordObject *record = message.messageObject;
            NIMRtcCallRecordObject *record = message.messageObject;
            //: return (record.callType == NIMRtcCallTypeAudio ? [NTESLanguageManager getTextWithKey:@"Internet_call"] : [NTESLanguageManager getTextWithKey:@"Video_chat"]);
            return (record.callType == NIMRtcCallTypeAudio ? [MaxInformation off:StringFromOndSessionData(str_holdScapeSurgeonData)] : [MaxInformation off:StringFromOndSessionData(str_tanValue)]);
//            return (record.callType == NIMRtcCallTypeAudio ? @"[网络通话]" : @"[视频聊天]").nim_localized;
        }
        //: default:
        default:
            //: text = @"";
            text = @"";//@"[未知消息]".nim_localized;
    }
    //: return text;
    return text;
}

//: + (NSString *)notificationMessageContent:(NIMMessage *)message{
+ (NSString *)originText:(NIMMessage *)message{
    //: NIMNotificationObject *object = message.messageObject;
    NIMNotificationObject *object = message.messageObject;
    //: if (object.notificationType == NIMNotificationTypeNetCall) {
    if (object.notificationType == NIMNotificationTypeNetCall) {
        //: NIMNetCallNotificationContent *content = (NIMNetCallNotificationContent *)object.content;
        NIMNetCallNotificationContent *content = (NIMNetCallNotificationContent *)object.content;
        //: if (content.callType == NIMNetCallTypeAudio) {
        if (content.callType == NIMNetCallTypeAudio) {
            //: return [NTESLanguageManager getTextWithKey:@"Internet_call"];
            return [MaxInformation off:StringFromOndSessionData(str_holdScapeSurgeonData)];//@"[网络通话]".nim_localized;
        }
        //: return [NTESLanguageManager getTextWithKey:@"Video_chat"];
        return [MaxInformation off:StringFromOndSessionData(str_tanValue)];//@"[视频聊天]".nim_localized;
    }
    //: if (object.notificationType == NIMNotificationTypeTeam) {
    if (object.notificationType == NIMNotificationTypeTeam) {
        //: NIMTeam *team = [[NIMSDK sharedSDK].teamManager teamById:message.session.sessionId];
        NIMTeam *team = [[NIMSDK sharedSDK].teamManager teamById:message.session.sessionId];
        //: if (team.type == NIMTeamTypeNormal) {
        if (team.type == NIMTeamTypeNormal) {
            //: return [NTESLanguageManager getTextWithKey:@"Group_chat_information_update"];
            return [MaxInformation off:StringFromOndSessionData(str_consumeValue)];//@"[讨论组信息更新]".nim_localized;
        //: }else{
        }else{

            //: NSString * flag=nil;
            NSString * flag=nil;
            //: NSString * title=nil;
            NSString * title=nil;
            //: NIMTeamNotificationContent *content = (NIMTeamNotificationContent*)object.content;
            NIMTeamNotificationContent *content = (NIMTeamNotificationContent*)object.content;
            //: switch (content.operationType) {
            switch (content.operationType) {
                    //: case NIMTeamOperationTypeUpdate:
                    case NIMTeamOperationTypeUpdate:

                        //: if ([[content attachment] isKindOfClass:[NIMUpdateTeamInfoAttachment class]]) {
                        if ([[content attachment] isKindOfClass:[NIMUpdateTeamInfoAttachment class]]) {
                            //: NIMUpdateTeamInfoAttachment *teamAttachment = (NIMUpdateTeamInfoAttachment *)[content attachment];
                            NIMUpdateTeamInfoAttachment *teamAttachment = (NIMUpdateTeamInfoAttachment *)[content attachment];
                            //: if ([teamAttachment.values count] == 1) {
                            if ([teamAttachment.values count] == 1) {
                                //: NIMTeamUpdateTag tag = [[[teamAttachment.values allKeys] firstObject] integerValue];
                                NIMTeamUpdateTag tag = [[[teamAttachment.values allKeys] firstObject] integerValue];
                                //: switch (tag) {
                                switch (tag) {
                                    //: case NIMTeamUpdateTagAnouncement:
                                    case NIMTeamUpdateTagAnouncement:
                                    {
                                        //: title=[[[teamAttachment.values allValues] firstObject] lowercaseString];
                                        title=[[[teamAttachment.values allValues] firstObject] lowercaseString];
                                        //: NSData* data = [title dataUsingEncoding:NSUTF8StringEncoding];
                                        NSData* data = [title dataUsingEncoding:NSUTF8StringEncoding];
                                        //: NSArray *datas = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                                        NSArray *datas = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                                        //: if([datas count]==0){
                                        if([datas count]==0){
                                            //: break;
                                            break;
                                        }
                                        //: title=[datas lastObject][@"title"];
                                        title=[datas lastObject][StringFromOndSessionData(str_closeName)];
                                        //: content=[datas lastObject][@"content"];
                                        content=[datas lastObject][StringFromOndSessionData(str_accomplishValue)];

                                       //记录群公告标志
                                        //记录messageid
                                        //: flag = [[NSUserDefaults standardUserDefaults] valueForKey:[[NSString alloc]initWithFormat:@"%@%@",@"teamgonggao_record_",message.messageId]];
                                        flag = [[NSUserDefaults standardUserDefaults] valueForKey:[[NSString alloc]initWithFormat:@"%@%@",StringFromOndSessionData(str_egretAchingTitle),message.messageId]];
                                        //: if(flag.length==0){
                                        if(flag.length==0){
                                            //: [[NSUserDefaults standardUserDefaults] setValue:@"1" forKey:[[NSString alloc]initWithFormat:@"%@%@",@"teamgonggao_record_",message.messageId]];
                                            [[NSUserDefaults standardUserDefaults] setValue:@"1" forKey:[[NSString alloc]initWithFormat:@"%@%@",StringFromOndSessionData(str_egretAchingTitle),message.messageId]];
                                            //: [[NSUserDefaults standardUserDefaults] setValue:@"1" forKey:[[NSString alloc]initWithFormat:@"%@%@",@"teamgonggao_",message.session.sessionId]];
                                            [[NSUserDefaults standardUserDefaults] setValue:@"1" forKey:[[NSString alloc]initWithFormat:@"%@%@",StringFromOndSessionData(str_jazzQuitName),message.session.sessionId]];
                                            //记录标题和内容
                                            //: [[NSUserDefaults standardUserDefaults] setValue:title forKey:[[NSString alloc] initWithFormat:@"%@%@",@"teamgonggao_title_",message.session.sessionId]];
                                            [[NSUserDefaults standardUserDefaults] setValue:title forKey:[[NSString alloc] initWithFormat:@"%@%@",StringFromOndSessionData(str_convictionValue),message.session.sessionId]];
                                            //: [[NSUserDefaults standardUserDefaults] setValue:content forKey:[[NSString alloc] initWithFormat:@"%@%@",@"teamgonggao_content_",message.session.sessionId]];
                                            [[NSUserDefaults standardUserDefaults] setValue:content forKey:[[NSString alloc] initWithFormat:@"%@%@",StringFromOndSessionData(str_conservationValue),message.session.sessionId]];
                                        }

                                    }
                                        //: break;
                                        break;

                                    //: default:
                                    default:
                                        //: break;
                                        break;
                                }
                            }
                        }

                        //: break;
                        break;
                    //: default:
                    default:
                        //: break;
                        break;
            }

            //: return [NTESLanguageManager getTextWithKey:@"Group_information_update"];
            return [MaxInformation off:StringFromOndSessionData(str_ourValue)];//@"[群信息更新]".nim_localized;
        }
    }

    //: if (object.notificationType == NIMNotificationTypeSuperTeam) {
    if (object.notificationType == NIMNotificationTypeSuperTeam) {
        //: return [NTESLanguageManager getTextWithKey:@"Super_Group_Information_Update"];
        return [MaxInformation off:StringFromOndSessionData(str_seaFileKeyTitle)];//@"[超大群信息更新]".nim_localized;
    }
    //: return @"";
    return @"";//@"[未知消息]".nim_localized;LangKey(@"Unknown_message")
}

//: @end
@end

Byte * OndSessionDataToCache(Byte *data) {
    int king = data[0];
    int earthHare = data[1];
    Byte correlation = data[2];
    int forehead = data[3];
    if (!king) return data + forehead;
    for (int i = forehead; i < forehead + earthHare; i++) {
        int value = data[i] - correlation;
        if (value < 0) {
            value += 256;
        }
        data[i] = value;
    }
    data[0] = 0;
    data[forehead + earthHare] = 0;
    return data + forehead;
}

NSString *StringFromOndSessionData(Byte *data) {
    return [NSString stringWithUTF8String:(char *)OndSessionDataToCache(data)];
}
