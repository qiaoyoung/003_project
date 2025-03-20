//
//  NIMUtil.m
// AppleProjectKit
//
//  Created by chris on 15/8/10.
//  Copyright (c) 2015年 NetEase. All rights reserved.
//

#import "AAAKitUtil.h"
#import "AppleProjectKit.h"
#import "BBBKitInfoFetchOption.h"
#import "AAAInputEmoticonManager.h"
#import "NSDictionary+AppleProjectKit.h"

static NSDateComponentsFormatter *_dateComponentsFormatter;

@implementation AAAKitUtil

+ (NSString *)genFilenameWithExt:(NSString *)ext
{
    CFUUIDRef uuid = CFUUIDCreate(nil);
    NSString *uuidString = (__bridge_transfer NSString*)CFUUIDCreateString(nil, uuid);
    CFRelease(uuid);
    NSString *uuidStr = [[uuidString stringByReplacingOccurrencesOfString:@"-" withString:@""] lowercaseString];
    NSString *name = [NSString stringWithFormat:@"%@",uuidStr];
    return [ext length] ? [NSString stringWithFormat:@"%@.%@",name,ext]:name;
}

+ (NSString *)showNick:(NSString*)uid inMessage:(NIMMessage*)message
{
    if (!uid.length) {
        return nil;
    }
    BBBKitInfoFetchOption *option = [[BBBKitInfoFetchOption alloc] init];
    option.message = message;
    return [[AppleProjectKit sharedKit] infoByUser:uid option:option].showName;
}

+ (NSString *)showNick:(NSString*)uid inSession:(NIMSession*)session{
    if (!uid.length) {
        return nil;
    }
    BBBKitInfoFetchOption *option = [[BBBKitInfoFetchOption alloc] init];
    option.session = session;
    return [[AppleProjectKit sharedKit] infoByUser:uid option:option].showName;
}


+ (NSString*)showTime:(NSTimeInterval) msglastTime showDetail:(BOOL)showDetail
{
    //今天的时间
    NSDate * nowDate = [NSDate date];
    NSDate * msgDate = [NSDate dateWithTimeIntervalSince1970:msglastTime];
    NSString *result = nil;
    NSCalendarUnit components = (NSCalendarUnit)(NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitWeekday|NSCalendarUnitHour | NSCalendarUnitMinute);
    NSDateComponents *nowDateComponents = [[NSCalendar currentCalendar] components:components fromDate:nowDate];
    NSDateComponents *msgDateComponents = [[NSCalendar currentCalendar] components:components fromDate:msgDate];
    
    NSInteger hour = msgDateComponents.hour;
    double OnedayTimeIntervalValue = 24*60*60;  //一天的秒数

    result = [AAAKitUtil getPeriodOfTime:hour withMinute:msgDateComponents.minute];
    if (hour > 12)
    {
        hour = hour - 12;
    }
    
    BOOL isSameMonth = (nowDateComponents.year == msgDateComponents.year) && (nowDateComponents.month == msgDateComponents.month);
    
    if(isSameMonth && (nowDateComponents.day == msgDateComponents.day)) //同一天,显示时间
    {
        result = [[NSString alloc] initWithFormat:@"%@ %zd:%02d",result,hour,(int)msgDateComponents.minute];
    }
    else if(isSameMonth && (nowDateComponents.day == (msgDateComponents.day+1)))//昨天
    {
        result = showDetail?  [[NSString alloc] initWithFormat:@"%@%@ %zd:%02d".nim_localized,LangKey(@"yesterday"),result,hour,(int)msgDateComponents.minute] : LangKey(@"yesterday");//@"昨天".nim_localized;
    }
    else if(isSameMonth && (nowDateComponents.day == (msgDateComponents.day+2))) //前天
    {
        result = showDetail? [[NSString alloc] initWithFormat:@"%@%@ %zd:%02d".nim_localized,LangKey(@"before_yesterday"),result,hour,(int)msgDateComponents.minute] : LangKey(@"before_yesterday");//@"前天".nim_localized;
    }
    else if([nowDate timeIntervalSinceDate:msgDate] < 7 * OnedayTimeIntervalValue)//一周内
    {
        NSString *weekDay = [AAAKitUtil weekdayStr:msgDateComponents.weekday];
        result = showDetail? [weekDay stringByAppendingFormat:@"%@ %zd:%02d",result,hour,(int)msgDateComponents.minute] : weekDay;
    }
    else//显示日期
    {
        NSString *day = [NSString stringWithFormat:@"%zd-%zd-%zd", msgDateComponents.year, msgDateComponents.month, msgDateComponents.day];
        result = showDetail? [day stringByAppendingFormat:@"%@ %zd:%02d",result,hour,(int)msgDateComponents.minute]:day;
    }
    return result;
}

#pragma mark - Private

+ (NSString *)getPeriodOfTime:(NSInteger)time withMinute:(NSInteger)minute
{
    NSInteger totalMin = time *60 + minute;
    NSString *showPeriodOfTime = @"";
    if (totalMin > 0 && totalMin <= 5 * 60)
    {
        showPeriodOfTime = LangKey(@"wee_hours");//@"凌晨".nim_localized;
    }
    else if (totalMin > 5 * 60 && totalMin < 12 * 60)
    {
        showPeriodOfTime = LangKey(@"day_am");//@"上午".nim_localized;
    }
    else if (totalMin >= 12 * 60 && totalMin <= 18 * 60)
    {
        showPeriodOfTime =  LangKey(@"day_pm");//@"下午".nim_localized;
    }
    else if ((totalMin > 18 * 60 && totalMin <= (23 * 60 + 59)) || totalMin == 0)
    {
        showPeriodOfTime = LangKey(@"day_night");//@"晚上".nim_localized;
    }
    return showPeriodOfTime;
}

+(NSString*)weekdayStr:(NSInteger)dayOfWeek
{
    static NSDictionary *daysOfWeekDict = nil;
    daysOfWeekDict = @{@(1):LangKey(@"Sunday"),//@"星期日".nim_localized,
                       @(2):LangKey(@"Monday"),//@"星期一".nim_localized,
                       @(3):LangKey(@"Tuesday"),//@"星期二".nim_localized,
                       @(4):LangKey(@"Wednesday"),//@"星期三".nim_localized,
                       @(5):LangKey(@"Thursday"),//@"星期四".nim_localized,
                       @(6):LangKey(@"Friday"),//@"星期五".nim_localized,
                       @(7):LangKey(@"Saturday")};//@"星期六".nim_localized,};
    return [daysOfWeekDict objectForKey:@(dayOfWeek)];
}

+ (NSString *)messageTipContent:(NIMMessage *)message{
    
    NSString *text = nil;
    
    if (text == nil) {
        switch (message.messageType) {
            case NIMMessageTypeNotification:
                text = [AAAKitUtil notificationMessage:message];
                break;
            case NIMMessageTypeTip:
                text = message.text;
                break;
            case NIMMessageTypeRtcCallRecord:
                text = [self rtcCallRecordFormatedMessage:message];
            default:
                break;
        }
    }
    return text;
}

+ (NSString *)durationTextWithSeconds:(NSTimeInterval)seconds
{
    NSString *text = [[self dateComponentsFormatter] stringFromTimeInterval:seconds];
    return text;
}

+ (NSDateComponentsFormatter *)dateComponentsFormatter {
    if (!_dateComponentsFormatter) {
        @synchronized (self) {
            if (!_dateComponentsFormatter) {
                _dateComponentsFormatter = [[NSDateComponentsFormatter alloc] init];
                _dateComponentsFormatter.unitsStyle = NSDateComponentsFormatterUnitsStylePositional;
                _dateComponentsFormatter.allowedUnits = NSCalendarUnitHour|NSCalendarUnitMinute|NSCalendarUnitSecond;
                _dateComponentsFormatter.zeroFormattingBehavior = NSDateComponentsFormatterZeroFormattingBehaviorPad;
            }
        }
    }
    return _dateComponentsFormatter;
}

+ (NSString *)notificationMessage:(NIMMessage *)message{
    NIMNotificationObject *object = message.messageObject;
    switch (object.notificationType) {
        case NIMNotificationTypeTeam:{
            return [AAAKitUtil teamNotificationFormatedMessage:message];
        }
        case NIMNotificationTypeSuperTeam:{
            return [AAAKitUtil superTeamNotificationFormatedMessage:message];
        }
        case NIMNotificationTypeNetCall:{
            return [AAAKitUtil netcallNotificationFormatedMessage:message];
        }
        case NIMNotificationTypeChatroom:{
            return [AAAKitUtil chatroomNotificationFormatedMessage:message];
        }
        default:
            return @"";
    }
}


+ (NSString*)teamNotificationFormatedMessage:(NIMMessage *)message{
    NSString *formatedMessage = @"";
    NIMNotificationObject *object = message.messageObject;
    if (object.notificationType == NIMNotificationTypeTeam)
    {
        NIMTeamNotificationContent *content = (NIMTeamNotificationContent*)object.content;
        NSString *source = [AAAKitUtil teamNotificationSourceName:message];
        NSArray *targets = [AAAKitUtil teamNotificationTargetNames:message];
        NSString *targetText = [targets count] > 1 ? [targets componentsJoinedByString:@","] : [targets firstObject];
        NSString *teamName = [AAAKitUtil teamNotificationTeamShowName:message];
        
        switch (content.operationType) {
            case NIMTeamOperationTypeInvite:{
                NSString *str = [NSString stringWithFormat:@"%@%@%@".nim_localized,source,LangKey(@"message_helper_invite"),targets.firstObject];
                if (targets.count>1) {
                    str = [str stringByAppendingFormat:@"%zd%@".nim_localized,targets.count,LangKey(@"message_people")];
                }
                str = [str stringByAppendingFormat:@"%@%@".nim_localized,LangKey(@"message_enter"),teamName];
                formatedMessage = str;
            }
                break;
            case NIMTeamOperationTypeDismiss:
                formatedMessage = [NSString stringWithFormat:@"%@%@%@".nim_localized,source,LangKey(@"message_dismissed"),teamName];
                break;
            case NIMTeamOperationTypeKick:{
                NSString *str = [NSString stringWithFormat:@"%@将%@".nim_localized,source,targets.firstObject];
                if (targets.count>1) {
                    str = [str stringByAppendingFormat:@"%zd%@".nim_localized,targets.count,LangKey(@"message_people")];
                }
                str = [str stringByAppendingFormat:@"%@%@".nim_localized,LangKey(@"message_move_out"),teamName];
                formatedMessage = str;
            }
                break;
            case NIMTeamOperationTypeUpdate:
            {
                
                NSString *update = LangKey(@"message_have_update");
                id attachment = [content attachment];
                if ([attachment isKindOfClass:[NIMUpdateTeamInfoAttachment class]]) {
                    NIMUpdateTeamInfoAttachment *teamAttachment = (NIMUpdateTeamInfoAttachment *)attachment;
                    formatedMessage = [NSString stringWithFormat:@"%@%@%@%@".nim_localized,source,update,teamName,LangKey(@"message_information")];
                    //如果只是单个项目项被修改则显示具体的修改项
                    if ([teamAttachment.values count] == 1) {
                        NIMTeamUpdateTag tag = [[[teamAttachment.values allKeys] firstObject] integerValue];
                        switch (tag) {
                            case NIMTeamUpdateTagName:
                                formatedMessage = [NSString stringWithFormat:@"%@%@%@%@".nim_localized,source,update,teamName,LangKey(@"message_name")];
                                break;
                            case NIMTeamUpdateTagIntro:
                                formatedMessage = [NSString stringWithFormat:@"%@%@%@%@".nim_localized,source,update,teamName,LangKey(@"message_introduce")];
                                break;
                            case NIMTeamUpdateTagAnouncement:
                                formatedMessage = [NSString stringWithFormat:@"%@%@%@%@".nim_localized,source,update,teamName,LangKey(@"message_proclamation")];
                                break;
                            case NIMTeamUpdateTagJoinMode:
                                formatedMessage = [NSString stringWithFormat:@"%@%@%@%@".nim_localized,source,update,teamName,LangKey(@"message_verification_mode")];
                                break;
                            case NIMTeamUpdateTagAvatar:
                                formatedMessage = [NSString stringWithFormat:@"%@%@%@%@".nim_localized,source,update,teamName,LangKey(@"message_head_portrait")];
                                break;
                            case NIMTeamUpdateTagInviteMode:
                                formatedMessage = [NSString stringWithFormat:@"%@%@".nim_localized,source,LangKey(@"message_invite_permission")];
                                break;
                            case NIMTeamUpdateTagBeInviteMode:
                                formatedMessage = [NSString stringWithFormat:@"%@%@".nim_localized,source,LangKey(@"message_permissions_updated")];
                                break;
                            case NIMTeamUpdateTagUpdateInfoMode:
                                formatedMessage = [NSString stringWithFormat:@"%@%@".nim_localized,source,LangKey(@"message_modification_permissions")];
                                break;
                            case NIMTeamUpdateTagMuteMode:{
                                NSString *muteState = teamAttachment.values.allValues.firstObject;
                                BOOL muted = [muteState isEqualToString:kConstant_0] ? NO : YES;
                                formatedMessage = muted? [NSString stringWithFormat:@"%@%@".nim_localized,source,LangKey(@"message_forbidden_speech")]: [NSString stringWithFormat:@"%@%@".nim_localized,source,LangKey(@"message_been_lifted")];
                                break;
                            }
                            default:
                                break;
                                
                        }
                    }
                }
                if (formatedMessage == nil){
                    formatedMessage = [NSString stringWithFormat:@"%@%@%@%@".nim_localized,source,update,teamName,LangKey(@"message_information")];
                }
            }
                break;
            case NIMTeamOperationTypeLeave:
                formatedMessage = [NSString stringWithFormat:@"%@%@%@".nim_localized,source,LangKey(@"message_leave"),teamName];
                break;
            case NIMTeamOperationTypeApplyPass:{
                if ([source isEqualToString:targetText]) {
                    //说明是以不需要验证的方式进入
                    formatedMessage = [NSString stringWithFormat:@"%@%@%@".nim_localized,source,LangKey(@"message_enter"),teamName];
                }else{
                    formatedMessage = [NSString stringWithFormat:@"%@%@%@%@".nim_localized,source,LangKey(@"message_passed"),targetText,LangKey(@"message_apply_for")];
                }
            }
                break;
            case NIMTeamOperationTypeTransferOwner:
                formatedMessage = [NSString stringWithFormat:@"%@%@%@".nim_localized,source,LangKey(@"message_transferred_group_master"),targetText];
                break;
            case NIMTeamOperationTypeAddManager:
                formatedMessage = [NSString stringWithFormat:@"%@%@".nim_localized,targetText,LangKey(@"message_group_administrator")];
                break;
            case NIMTeamOperationTypeRemoveManager:
                formatedMessage = [NSString stringWithFormat:@"%@%@".nim_localized,targetText,LangKey(@"message_group_revoked")];
                break;
            case NIMTeamOperationTypeAcceptInvitation:
                formatedMessage = [NSString stringWithFormat:@"%@%@%@%@".nim_localized,source,LangKey(@"message_accept"),targetText,LangKey(@"message_invited_into")];
                break;
            case NIMTeamOperationTypeMute:{
                id attachment = [content attachment];
                if ([attachment isKindOfClass:[NIMMuteTeamMemberAttachment class]])
                {
                    BOOL mute = [(NIMMuteTeamMemberAttachment *)attachment flag];
                    NSString *muteStr = mute? LangKey(@"message_banned_post") : LangKey(@"message_remove_banned");
                    NSString *str = [targets componentsJoinedByString:@","];
                    formatedMessage = [NSString stringWithFormat:@"%@%@%@%@".nim_localized,str,LangKey(@"message_remove_by"),source,muteStr];
                }
            }
                break;
            default:
                break;
        }
    }
    if (!formatedMessage.length) {
        formatedMessage = LangKey(@"message_unknown_system_message");//@"未知系统消息".nim_localized;
    }
    return formatedMessage;
}

+ (NSString*)superTeamNotificationFormatedMessage:(NIMMessage *)message{
    NSString *formatedMessage = @"";
    NIMNotificationObject *object = message.messageObject;
    if (object.notificationType == NIMNotificationTypeSuperTeam)
    {
        NIMSuperTeamNotificationContent *content = (NIMSuperTeamNotificationContent*)object.content;
        NSString *source = [AAAKitUtil superTeamNotificationSourceName:message];
        NSArray *targets = [AAAKitUtil superTeamNotificationTargetNames:message];
        NSString *targetText = [targets count] > 1 ? [targets componentsJoinedByString:@","] : [targets firstObject];
        NSString *teamName = [AAAKitUtil superTeamNotificationTeamShowName:message];
        
        switch (content.operationType) {
            case NIMSuperTeamOperationTypeInvite:{
                NSString *str = [NSString stringWithFormat:@"%@%@%@".nim_localized,source,LangKey(@"message_helper_invite"),targets.firstObject];
                if (targets.count>1) {
                    str = [str stringByAppendingFormat:@"%zd%@".nim_localized,targets.count,LangKey(@"message_people")];
                }
                str = [str stringByAppendingFormat:@"%@%@".nim_localized,LangKey(@"message_enter"),teamName];
                formatedMessage = str;
            }
                break;
            case NIMSuperTeamOperationTypeDismiss:
                formatedMessage = [NSString stringWithFormat:@"%@%@%@".nim_localized,source,LangKey(@"message_dismissed"),teamName];
                break;
            case NIMSuperTeamOperationTypeKick:{
                NSString *str = [NSString stringWithFormat:@"%@%@%@".nim_localized,source,LangKey(@"message_remove_by"),targets.firstObject];
                if (targets.count>1) {
                    str = [str stringByAppendingFormat:@"%zd%@".nim_localized,targets.count,LangKey(@"message_people")];
                }
                str = [str stringByAppendingFormat:@"%@%@".nim_localized,LangKey(@"message_move_out"),teamName];
                formatedMessage = str;
            }
                break;
            case NIMSuperTeamOperationTypeUpdate:
            {
                NSString *update = LangKey(@"message_have_update");
                id attachment = [content attachment];
                if ([attachment isKindOfClass:[NIMUpdateSuperTeamInfoAttachment class]]) {
                    NIMUpdateSuperTeamInfoAttachment *teamAttachment = (NIMUpdateSuperTeamInfoAttachment *)attachment;
                    formatedMessage = [NSString stringWithFormat:@"%@%@%@%@".nim_localized,source,update,teamName,LangKey(@"message_information")];
                    //如果只是单个项目项被修改则显示具体的修改项
                    if ([teamAttachment.values count] == 1) {
                        NIMSuperTeamUpdateTag tag = [[[teamAttachment.values allKeys] firstObject] integerValue];
                        switch (tag) {
                            case NIMSuperTeamUpdateTagName:
                                formatedMessage = [NSString stringWithFormat:@"%@%@%@%@".nim_localized,source,update,teamName,LangKey(@"message_name")];
                                break;
                            case NIMSuperTeamUpdateTagIntro:
                                formatedMessage = [NSString stringWithFormat:@"%@%@%@%@".nim_localized,source,update,teamName,LangKey(@"message_introduce")];
                                break;
                            case NIMSuperTeamUpdateTagAnouncement:
                                formatedMessage = [NSString stringWithFormat:@"%@%@%@%@".nim_localized,source,update,teamName,LangKey(@"message_proclamation")];
                                break;
                            case NIMSuperTeamUpdateTagAvatar:
                                formatedMessage = [NSString stringWithFormat:@"%@%@%@%@".nim_localized,source,update,teamName,LangKey(@"message_verification_mode")];
                                break;
                            case NIMSuperTeamUpdateTagJoinMode:
                                formatedMessage = [NSString stringWithFormat:@"%@%@%@%@",source,update,teamName,LangKey(@"message_head_portrait")];
                                break;
                            case NIMSuperTeamUpdateTagBeInviteMode:
                                formatedMessage = [NSString stringWithFormat:@"%@%@",source,LangKey(@"message_invite_permission")];
                                break;
                            case NIMSuperTeamUpdateTagClientCustom:
                                formatedMessage = [NSString stringWithFormat:@"%@%@".nim_localized,source,LangKey(@"message_custom_extension")];
                                break;
                            case NIMSuperTeamUpdateTagMuteMode: {
                                NSString *muteState = teamAttachment.values.allValues.firstObject;
                                BOOL muted = [muteState isEqualToString:kConstant_0] ? NO : YES;
                                formatedMessage = muted? [NSString stringWithFormat:@"%@%@".nim_localized,source,LangKey(@"message_forbidden_speech")]: [NSString stringWithFormat:@"%@%@".nim_localized,source,LangKey(@"message_been_lifted")];
                                break;
                            }
                            default:
                                break;
                                
                        }
                    }
                }
                if (formatedMessage.length == 0){
                    formatedMessage = [NSString stringWithFormat:@"%@%@%@%@".nim_localized,source,update,teamName,LangKey(@"message_information")];
                }
            }
                break;
            case NIMSuperTeamOperationTypeLeave:
                formatedMessage = [NSString stringWithFormat:@"%@%@%@".nim_localized,source,LangKey(@"message_leave"),teamName];
                break;
            case NIMSuperTeamOperationTypeApplyPass:{
                if ([source isEqualToString:targetText]) {
                    //说明是以不需要验证的方式进入
                    formatedMessage = [NSString stringWithFormat:@"%@%@%@",source,LangKey(@"message_enter"),teamName];
                }else{
                    formatedMessage = [NSString stringWithFormat:@"%@%@%@%@",source,LangKey(@"message_passed"),targetText,LangKey(@"message_apply_for")];
                }
            }
                break;
            case NIMSuperTeamOperationTypeTransferOwner:
                formatedMessage = [NSString stringWithFormat:@"%@%@%@".nim_localized,source,LangKey(@"message_transferred_group_master"),targets.firstObject];
                break;
            case NIMSuperTeamOperationTypeAddManager:
                formatedMessage = [NSString stringWithFormat:@"%@%@".nim_localized,targets.firstObject,LangKey(@"message_group_administrator")];
                break;
            case NIMSuperTeamOperationTypeRemoveManager:
                formatedMessage = [NSString stringWithFormat:@"%@%@".nim_localized,targets.firstObject,LangKey(@"message_group_revoked")];
                break;
            case NIMSuperTeamOperationTypeAcceptInvitation:
                formatedMessage = [NSString stringWithFormat:@"%@%@%@%@",source,LangKey(@"message_accept"),targetText,LangKey(@"message_invited_into")];
                break;
            case NIMSuperTeamOperationTypeMute:{
                id attachment = [content attachment];
                if ([attachment isKindOfClass:[NIMMuteSuperTeamMemberAttachment class]])
                {
                    BOOL mute = [(NIMMuteSuperTeamMemberAttachment *)attachment flag];
                    NSString *muteStr = mute? LangKey(@"message_banned_post") : LangKey(@"message_remove_banned");
                    NSString *str = [targets componentsJoinedByString:@","];
                    formatedMessage = [NSString stringWithFormat:@"%@%@%@%@".nim_localized,str,LangKey(@"message_remove_by"),source,muteStr];
                }
            }
            default:
                break;
        }
        
    }
    if (!formatedMessage.length) {
        formatedMessage = LangKey(@"message_unknown_system_message");//@"未知系统消息".nim_localized;
    }
    return formatedMessage;
}

+ (NSString *)rtcCallRecordFormatedMessage:(NIMMessage *)message {
    NIMRtcCallRecordObject *record = message.messageObject;
    switch (record.callStatus) {
        case NIMRtcCallStatusCanceled:
            return LangKey(@"app_avchat_cancel");//@"已取消".nim_localized;
        case NIMRtcCallStatusTimeout:
            return LangKey(@"app_avchat_no_pick_up");//@"未接听".nim_localized;
        case NIMRtcCallStatusRejected:
            return LangKey(@"app_avchat_has_reject");//@"已拒绝".nim_localized;
        case NIMRtcCallStatusBusy:
            if ([message.from isEqualToString:NIMSDK.sharedSDK.loginManager.currentAccount]) {
                return LangKey(@"app_avchat_has_reject");//@"已拒绝".nim_localized;
            }
            return LangKey(@"app_avchat_is_busy_opposite");//@"对方正忙".nim_localized;
        case NIMRtcCallStatusComplete: {
            NSTimeInterval duration = [record.durations nimkit_jsonInteger:NIMSDK.sharedSDK.loginManager.currentAccount?:@""];
            return [NSString stringWithFormat:@"%@ %@",LangKey(@"message_call_duration"),[AAAKitUtil durationTextWithSeconds:duration]];
        }
        default:
            return LangKey(@"online_state_event_manager_unknown");//@"未知".nim_localized;
    }
}

+ (NSString *)netcallNotificationFormatedMessage:(NIMMessage *)message{
    NIMNotificationObject *object = message.messageObject;
    NIMNetCallNotificationContent *content = (NIMNetCallNotificationContent *)object.content;
    NSString *text = @"";
    NSString *currentAccount = [[NIMSDK sharedSDK].loginManager currentAccount];
    switch (content.eventType) {
        case NIMNetCallEventTypeMiss:{
            text = LangKey(@"app_avchat_no_pick_up");//@"未接听".nim_localized;
            break;
        }
        case NIMNetCallEventTypeBill:{
            text =  ([object.message.from isEqualToString:currentAccount])? LangKey(@"message_call_duration") : LangKey(@"message_call_receiving");
            NSTimeInterval duration = content.duration;
            NSString *durationDesc = [NSString stringWithFormat:@"%02d:%02d",(int)duration/60,(int)duration%60];
            text = [text stringByAppendingString:durationDesc];
            break;
        }
        case NIMNetCallEventTypeReject:{
            text = ([object.message.from isEqualToString:currentAccount])? LangKey(@"app_avchat_is_busy_opposite") : LangKey(@"message_helper_already_no");
            break;
        }
        case NIMNetCallEventTypeNoResponse:{
            text = LangKey(@"message_access_failure");//@"未接通，已取消".nim_localized;
            break;
        }
        default:
            break;
    }
    return text;
}


+ (NSString *)chatroomNotificationFormatedMessage:(NIMMessage *)message{
    NIMNotificationObject *object = message.messageObject;
    NIMChatroomNotificationContent *content = (NIMChatroomNotificationContent *)object.content;
    NSMutableArray *targetNicks = [[NSMutableArray alloc] init];
    for (NIMChatroomNotificationMember *memebr in content.targets) {
        if ([memebr.userId isEqualToString:[[NIMSDK sharedSDK].loginManager currentAccount]]) {
           [targetNicks addObject:LangKey(@"message_helper_you")];// @"你".nim_localized
        }else{
           [targetNicks addObject:memebr.nick];
        }

    }
    NSString *opeText    = content.source.nick;
    NSString *targetText = [targetNicks componentsJoinedByString:@","];
    switch (content.eventType) {
        case NIMChatroomEventTypeEnter:
        {
            return [NSString stringWithFormat:@"%@%@%@".nim_localized,LangKey(@"message_welcome"),targetText,LangKey(@"")];
        }
        case NIMChatroomEventTypeAddBlack:
        {
            return [NSString stringWithFormat:@"%@ %@", targetText,LangKey(@"message_blacklisted_administrator")];
        }
        case NIMChatroomEventTypeRemoveBlack:
        {
            return [NSString stringWithFormat:@"%@ %@",targetText,LangKey(@"message_removed_blacklist_administrator")];
        }
        case NIMChatroomEventTypeAddMute:
        {
            if (content.targets.count == 1 && [[content.targets.firstObject userId] isEqualToString:[[NIMSDK sharedSDK].loginManager currentAccount]])
            {
                return LangKey(@"message_temporarily_muted");//@"你已被禁言".nim_localized;
            }
            else
            {
                return [NSString stringWithFormat:@"%@ %@".nim_localized,targetText,LangKey(@"message_muted_administrator")];
            }
        }
        case NIMChatroomEventTypeRemoveMute:
        {
            return [NSString stringWithFormat:@"%@ %@".nim_localized,targetText,LangKey(@"message_unmuted_administrator")];
        }
        case NIMChatroomEventTypeAddManager:
        {
            return [NSString stringWithFormat:@"%@ %@".nim_localized,targetText,LangKey(@"message_appointed_admin")];
        }
        case NIMChatroomEventTypeRemoveManager:
        {
            return [NSString stringWithFormat:@"%@ %@".nim_localized,targetText,LangKey(@"message_dismissed_admin")];
        }
        case NIMChatroomEventTypeRemoveCommon:
        {
            return [NSString stringWithFormat:@"%@ %@".nim_localized,targetText,LangKey(@"message_dismissed_member_identity")];
        }
        case NIMChatroomEventTypeAddCommon:
        {
            return [NSString stringWithFormat:@"%@%@".nim_localized,targetText,LangKey(@"message_added_member")];
        }
        case NIMChatroomEventTypeInfoUpdated:
        {
            return LangKey(@"message_announcement_updated");//@"直播间公告已更新".nim_localized;
        }
        case NIMChatroomEventTypeKicked:
        {
            return [NSString stringWithFormat:@"%@%@".nim_localized,targetText,LangKey(@"message_removed_room")];
        }
        case NIMChatroomEventTypeExit:
        {
            return [NSString stringWithFormat:@"%@%@".nim_localized,targetText,LangKey(@"message_left_room")];
        }
        case NIMChatroomEventTypeClosed:
        {
            return LangKey(@"message_room_closed");//@"直播间已关闭".nim_localized;
        }
        case NIMChatroomEventTypeAddMuteTemporarily:
        {
            if (content.targets.count == 1 && [[content.targets.firstObject userId] isEqualToString:[[NIMSDK sharedSDK].loginManager currentAccount]])
            {
                return LangKey(@"message_temporarily_muted");//@"你已被临时禁言".nim_localized;
            }
            else
            {
                return [NSString stringWithFormat:@"%@%@".nim_localized,targetText,LangKey(@"message_muted_administrator")];
            }
        }
        case NIMChatroomEventTypeRemoveMuteTemporarily:
        {
            return [NSString stringWithFormat:@"%@%@".nim_localized,targetText,LangKey(@"message_dismiss_temporary")];
        }
        case NIMChatroomEventTypeMemberUpdateInfo:
        {
            return [NSString stringWithFormat:@"%@%@".nim_localized,targetText,LangKey(@"message_updated_information")];
        }
        case NIMChatroomEventTypeRoomMuted:
        {
            return LangKey(@"message_administrator_speak");//@"全体禁言，管理员可发言".nim_localized;
        }
        case NIMChatroomEventTypeRoomUnMuted:
        {
            return LangKey(@"message_dismiss_whole_mute");//@"解除全体禁言".nim_localized;
        }
        case NIMChatroomEventTypeQueueChange:
        case NIMChatroomEventTypeQueueBatchChange:
            return [NSString stringWithFormat:@"%@%@".nim_localized,opeText,LangKey(@"message_changed_room_queue")];
        default:
            break;
    }
    return @"";
}


#pragma mark - Private
+ (NSString *)teamNotificationSourceName:(NIMMessage *)message{
    NSString *source;
    NIMNotificationObject *object = message.messageObject;
    NIMTeamNotificationContent *content = (NIMTeamNotificationContent*)object.content;
    NSString *currentAccount = [[NIMSDK sharedSDK].loginManager currentAccount];
    if ([content.sourceID isEqualToString:currentAccount]) {
        source = LangKey(@"message_helper_you");//@"你".nim_localized;
    }else{
        source = [AAAKitUtil showNick:content.sourceID inSession:message.session];
    }
    return source;
}

+ (NSArray *)teamNotificationTargetNames:(NIMMessage *)message{
    NSMutableArray *targets = [[NSMutableArray alloc] init];
    NIMNotificationObject *object = message.messageObject;
    NIMTeamNotificationContent *content = (NIMTeamNotificationContent*)object.content;
    NSString *currentAccount = [[NIMSDK sharedSDK].loginManager currentAccount];
    for (NSString *item in content.targetIDs) {
        if ([item isEqualToString:currentAccount]) {
            [targets addObject:LangKey(@"message_helper_you")];
        }else{
            NSString *targetShowName = [AAAKitUtil showNick:item inSession:message.session];
            [targets addObject:targetShowName];
        }
    }
    return targets;
}


+ (NSString *)teamNotificationTeamShowName:(NIMMessage *)message{
    NIMTeam *team = [[NIMSDK sharedSDK].teamManager teamById:message.session.sessionId];
    NSString *teamName = team.type == NIMTeamTypeNormal ? LangKey(@"team_create_helper_discuss_name"):LangKey(@"contact_my_group_activity_title");//@"讨论组".nim_localized : @"群".nim_localized;
    return teamName;
}

+ (NSString *)superTeamNotificationSourceName:(NIMMessage *)message{
    NSString *source;
    NIMNotificationObject *object = message.messageObject;
    NIMSuperTeamNotificationContent *content = (NIMSuperTeamNotificationContent*)object.content;
    NSString *currentAccount = [[NIMSDK sharedSDK].loginManager currentAccount];
    if ([content.sourceID isEqualToString:currentAccount]) {
        source = LangKey(@"message_helper_you");//@"你".nim_localized;
    }else{
        source = [AAAKitUtil showNick:content.sourceID inSession:message.session];
    }
    return source;
}

+ (NSArray *)superTeamNotificationTargetNames:(NIMMessage *)message{
    NSMutableArray *targets = [[NSMutableArray alloc] init];
    NIMNotificationObject *object = message.messageObject;
    NIMSuperTeamNotificationContent *content = (NIMSuperTeamNotificationContent*)object.content;
    NSString *currentAccount = [[NIMSDK sharedSDK].loginManager currentAccount];
    for (NSString *item in content.targetIDs) {
        if ([item isEqualToString:currentAccount]) {
            [targets addObject:LangKey(@"message_helper_you")];
        }else{
            NSString *targetShowName = [AAAKitUtil showNick:item inSession:message.session];
            [targets addObject:targetShowName];
        }
    }
    return targets;
}


+ (NSString *)superTeamNotificationTeamShowName:(NIMMessage *)message{
    NSString *teamName = LangKey(@"message_super_team");//@"超大群".nim_localized;
    return teamName;
}

+ (BOOL)canEditSuperTeamInfo:(NIMTeamMember *)member {
    return (member.type == NIMTeamMemberTypeOwner || member.type == NIMTeamMemberTypeManager);
}

+ (BOOL)canInviteMemberToSuperTeam:(NIMTeamMember *)member {
    return (member.type == NIMTeamMemberTypeOwner || member.type == NIMTeamMemberTypeManager);
}

+ (BOOL)canEditTeamInfo:(NIMTeamMember *)member
{
    NIMTeam *team = [[NIMSDK sharedSDK].teamManager teamById:member.teamId];
    if (team.updateInfoMode == NIMTeamUpdateInfoModeManager)
    {
        return member.type == NIMTeamMemberTypeOwner || member.type == NIMTeamMemberTypeManager;
    }
    else
    {
        return member.type == NIMTeamMemberTypeOwner || member.type == NIMTeamMemberTypeManager || member.type == NIMTeamMemberTypeNormal;
    }
}

+ (BOOL)canInviteMemberToTeam:(NIMTeamMember *)member
{
    NIMTeam *team = [[NIMSDK sharedSDK].teamManager teamById:member.teamId];
    if (team.inviteMode == NIMTeamInviteModeManager)
    {
        return member.type == NIMTeamMemberTypeOwner || member.type == NIMTeamMemberTypeManager;
    }
    else
    {
        return member.type == NIMTeamMemberTypeOwner || member.type == NIMTeamMemberTypeManager || member.type == NIMTeamMemberTypeNormal;
    }

}

+ (NSString *)quickCommentContent:(NIMQuickComment *)comment
{
    NSString *ID = [NSString stringWithFormat:NIMKitQuickCommentFormat, comment.replyType];
    NIMInputEmoticon *emoticon = [[AAAInputEmoticonManager sharedManager] emoticonByID:ID];
    NSString *content = nil;
    if (emoticon)
    {
        if (emoticon.type == NIMEmoticonTypeUnicode) {
            content = emoticon.unicode;
        } else {
            content = emoticon.tag;
        }
    }
    content = [NSString stringWithFormat:@"%@|%@", content, comment.from];
    return content;
}

@end
