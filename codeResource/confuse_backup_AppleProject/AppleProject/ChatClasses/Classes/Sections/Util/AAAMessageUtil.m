//
//  AAAMessageUtil.m
// AppleProjectKit
//
//  Created by Netease on 2019/10/17.
//  Copyright © 2019 NetEase. All rights reserved.
//

#import "AAAMessageUtil.h"
#import <NIMSDK/NIMSDK.h>
#import "CCCGlobalMacro.h"
#import "AAAKitUtil.h"
#import "AppleProjectKit.h"
#import "NSDictionary+AppleProjectKit.h"

@implementation AAAMessageUtil

+ (NSString *)messageContent:(NIMMessage*)message {
    NSString *text = @"";
    switch (message.messageType) {
        case NIMMessageTypeText:
            text = message.text;
            break;
        case NIMMessageTypeAudio:
            text = LangKey(@"Audio"); //@"[语音]".nim_localized;
            break;
        case NIMMessageTypeImage:
            text = LangKey(@"Image");//@"[图片]".nim_localized;
            break;
        case NIMMessageTypeVideo:
            text = LangKey(@"Video");//@"[视频]".nim_localized;
            break;
        case NIMMessageTypeLocation:
            text = LangKey(@"Location");//@"[位置]".nim_localized;
            break;
        case NIMMessageTypeNotification:{
            return [self notificationMessageContent:message];
        }
        case NIMMessageTypeFile:
            text = LangKey(@"File");//@"[文件]".nim_localized;
            break;
        case NIMMessageTypeTip:
            text = message.text;
            break;
        case NIMMessageTypeRtcCallRecord: {
            NIMRtcCallRecordObject *record = message.messageObject;
            return (record.callType == NIMRtcCallTypeAudio ? LangKey(@"Internet_call") : LangKey(@"Video_chat"));
//            return (record.callType == NIMRtcCallTypeAudio ? @"[网络通话]" : @"[视频聊天]").nim_localized;
        }
        default:
            text = @"";//@"[未知消息]".nim_localized;
    }
    return text;
}

+ (NSString *)notificationMessageContent:(NIMMessage *)message{
    NIMNotificationObject *object = message.messageObject;
    if (object.notificationType == NIMNotificationTypeNetCall) {
        NIMNetCallNotificationContent *content = (NIMNetCallNotificationContent *)object.content;
        if (content.callType == NIMNetCallTypeAudio) {
            return LangKey(@"Internet_call");//@"[网络通话]".nim_localized;
        }
        return LangKey(@"Video_chat");//@"[视频聊天]".nim_localized;
    }
    if (object.notificationType == NIMNotificationTypeTeam) {
        NIMTeam *team = [[NIMSDK sharedSDK].teamManager teamById:message.session.sessionId];
        if (team.type == NIMTeamTypeNormal) {
            return LangKey(@"Group_chat_information_update");//@"[讨论组信息更新]".nim_localized;
        }else{
            
            NSString * flag=nil;
            NSString * title=nil;
            NIMTeamNotificationContent *content = (NIMTeamNotificationContent*)object.content;
            switch (content.operationType) {
                    case NIMTeamOperationTypeUpdate:
                        
                        if ([[content attachment] isKindOfClass:[NIMUpdateTeamInfoAttachment class]]) {
                            NIMUpdateTeamInfoAttachment *teamAttachment = (NIMUpdateTeamInfoAttachment *)[content attachment];
                            if ([teamAttachment.values count] == 1) {
                                NIMTeamUpdateTag tag = [[[teamAttachment.values allKeys] firstObject] integerValue];
                                switch (tag) {
                                    case NIMTeamUpdateTagAnouncement:
                                    {
                                        title=[[[teamAttachment.values allValues] firstObject] lowercaseString];
                                        NSData* data = [title dataUsingEncoding:NSUTF8StringEncoding];
                                        NSArray *datas = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                                        if([datas count]==0){
                                            break;
                                        }
                                        title=[datas lastObject][@"title"];
                                        content=[datas lastObject][@"content"];
                                
                                       //记录群公告标志
                                        //记录messageid
                                        flag = [[NSUserDefaults standardUserDefaults] valueForKey:[[NSString alloc]initWithFormat:@"%@%@",@"teamgonggao_record_",message.messageId]];
                                        if(flag.length==0){
                                            [[NSUserDefaults standardUserDefaults] setValue:kConstant_1 forKey:[[NSString alloc]initWithFormat:@"%@%@",@"teamgonggao_record_",message.messageId]];
                                            [[NSUserDefaults standardUserDefaults] setValue:kConstant_1 forKey:[[NSString alloc]initWithFormat:@"%@%@",@"teamgonggao_",message.session.sessionId]];
                                            //记录标题和内容
                                            [[NSUserDefaults standardUserDefaults] setValue:title forKey:[[NSString alloc] initWithFormat:@"%@%@",@"teamgonggao_title_",message.session.sessionId]];
                                            [[NSUserDefaults standardUserDefaults] setValue:content forKey:[[NSString alloc] initWithFormat:@"%@%@",@"teamgonggao_content_",message.session.sessionId]];
                                        }
             
                                    }
                                        break;
                                        
                                    default:
                                        break;
                                }
                            }
                        }
                        
                        break;
                    default:
                        break;
            }
            
            return LangKey(@"Group_information_update");//@"[群信息更新]".nim_localized;
        }
    }
    
    if (object.notificationType == NIMNotificationTypeSuperTeam) {
        return LangKey(@"Super_Group_Information_Update");//@"[超大群信息更新]".nim_localized;
    }
    return @"";//@"[未知消息]".nim_localized;LangKey(@"Unknown_message")
}

@end



