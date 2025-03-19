//
//  NTESSessionMsgHelper.m
//  NIMDemo
//
//  Created by ght on 15-1-28.
//  Copyright (c) 2015年 Netease. All rights reserved.
//

#import "NTESSessionMsgConverter.h"
#import "NSString+NTES.h"
#import "NTESJanKenPonAttachment.h"
#import "NTESSnapchatAttachment.h"
#import "NTESWhiteboardAttachment.h"
#import "NTESRedPacketAttachment.h"
#import "NTESRedPacketTipAttachment.h"
#import "NTESMultiRetweetAttachment.h"
#import "NTESBundleSetting.h"

@implementation NTESSessionMsgConverter


+ (NIMMessage*)msgWithText:(NSString*)text
{
    NIMMessage *textMessage = [[NIMMessage alloc] init];
    textMessage.text        = text;
    textMessage.setting = [[NIMMessageSetting alloc] init];
    textMessage.setting.teamReceiptEnabled = YES;

    textMessage.setting.apnsWithPrefix = [[NTESBundleSetting sharedConfig] enableAPNsPrefix];
    textMessage.apnsMemberOption = [[NIMMessageApnsMemberOption alloc] init];
    textMessage.apnsMemberOption.forcePush = [[NTESBundleSetting sharedConfig] enableTeamAPNsForce];
    textMessage.env = [[NTESBundleSetting sharedConfig] messageEnv];
    return textMessage;
}

+ (NIMMessage*)msgWithImage:(UIImage*)image
{
    NIMImageObject * imageObject = [[NIMImageObject alloc] initWithImage:image];
   return [NTESSessionMsgConverter generateImageMessage:imageObject];
}

+ (NIMMessage *)msgWithImagePath:(NSString*)path
{
    NIMImageObject * imageObject = [[NIMImageObject alloc] initWithFilepath:path];
    return [NTESSessionMsgConverter generateImageMessage:imageObject];
}

+ (NIMMessage *)generateImageMessage:(NIMImageObject *)imageObject
{
//    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
//    NSString *dateString = [dateFormatter stringFromDate:[NSDate date]];
    imageObject.displayName = [NTESSessionMsgConverter generateUUID];
    NIMImageOption *option  = [[NIMImageOption alloc] init];
    option.compressQuality  = 0.8;
    imageObject.option = option;
    NIMMessage *message     = [[NIMMessage alloc] init];
    message.messageObject   = imageObject;
    message.apnsContent = LangKey(@"init_manager_nim_status_bar_image_message");
    NIMMessageSetting *setting = [[NIMMessageSetting alloc] init];
    setting.teamReceiptEnabled = YES;

    message.setting = setting;
    setting.apnsWithPrefix = [[NTESBundleSetting sharedConfig] enableAPNsPrefix];
    message.apnsMemberOption = [[NIMMessageApnsMemberOption alloc] init];
    message.apnsMemberOption.forcePush = [[NTESBundleSetting sharedConfig] enableTeamAPNsForce];
    message.env = [[NTESBundleSetting sharedConfig] messageEnv];
    return message;
}

+ (NIMMessage*)msgWithAudio:(NSString*)filePath
{
    NIMAudioObject *audioObject = [[NIMAudioObject alloc] initWithSourcePath:filePath];
    NIMMessage *message = [[NIMMessage alloc] init];
    message.messageObject = audioObject;
    message.apnsContent = LangKey(@"init_manager_nim_status_bar_audio_message");
    NIMMessageSetting *setting = [[NIMMessageSetting alloc] init];
    setting.teamReceiptEnabled = YES;

    message.setting = setting;
    message.env = [[NTESBundleSetting sharedConfig] messageEnv];
    return message;
}

+ (NIMMessage*)msgWithVideo:(NSString*)filePath
{
//    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
//    NSString *dateString = [dateFormatter stringFromDate:[NSDate date]];
    NIMVideoObject *videoObject = [[NIMVideoObject alloc] initWithSourcePath:filePath];
    videoObject.displayName = [NTESSessionMsgConverter generateUUID];
    NIMMessage *message = [[NIMMessage alloc] init];
    message.messageObject = videoObject;
    message.apnsContent = LangKey(@"init_manager_nim_status_bar_video_message");
    NIMMessageSetting *setting = [[NIMMessageSetting alloc] init];
    setting.teamReceiptEnabled = YES;

    message.setting = setting;
    message.env = [[NTESBundleSetting sharedConfig] messageEnv];
    return message;
}


+ (NIMMessage*)msgWithJenKenPon:(NTESJanKenPonAttachment *)attachment
{
    NIMMessage *message               = [[NIMMessage alloc] init];
    NIMCustomObject *customObject     = [[NIMCustomObject alloc] init];
    customObject.attachment           = attachment;
    message.messageObject             = customObject;
    message.apnsContent = @"发来了猜拳信息".ntes_localized;
    message.setting = [[NIMMessageSetting alloc] init];
    message.setting.teamReceiptEnabled = YES;

    message.setting.apnsWithPrefix = [[NTESBundleSetting sharedConfig] enableAPNsPrefix];
    message.apnsMemberOption = [[NIMMessageApnsMemberOption alloc] init];
    message.apnsMemberOption.forcePush = [[NTESBundleSetting sharedConfig] enableTeamAPNsForce];
    message.env = [[NTESBundleSetting sharedConfig] messageEnv];
    return message;
}

+ (NIMMessage*)msgWithSnapchatAttachment:(NTESSnapchatAttachment *)attachment
{
    NIMMessage *message               = [[NIMMessage alloc] init];
    NIMCustomObject *customObject     = [[NIMCustomObject alloc] init];
    customObject.attachment           = attachment;
    message.messageObject             = customObject;
    message.apnsContent = @"发来了阅后即焚".ntes_localized;
    
    NIMMessageSetting *setting = [[NIMMessageSetting alloc] init];
    setting.historyEnabled = NO;
    setting.roamingEnabled = NO;
    setting.syncEnabled    = NO;
    setting.teamReceiptEnabled = YES;

    message.setting = setting;
    
    message.env = [[NTESBundleSetting sharedConfig] messageEnv];
    
    return message;
}


+ (NIMMessage*)msgWithFilePath:(NSString*)path{
    NIMFileObject *fileObject = [[NIMFileObject alloc] initWithSourcePath:path];
    NSString *displayName     = path.lastPathComponent;
    fileObject.displayName    = displayName;
    NIMMessage *message       = [[NIMMessage alloc] init];
    message.messageObject     = fileObject;
    message.apnsContent = @"发来了一个文件".ntes_localized;
    NIMMessageSetting *setting = [[NIMMessageSetting alloc] init];
    setting.teamReceiptEnabled = YES;

    message.setting = setting;
    message.setting.apnsWithPrefix = [[NTESBundleSetting sharedConfig] enableAPNsPrefix];
    message.apnsMemberOption = [[NIMMessageApnsMemberOption alloc] init];
    message.apnsMemberOption.forcePush = [[NTESBundleSetting sharedConfig] enableTeamAPNsForce];
    message.env = [[NTESBundleSetting sharedConfig] messageEnv];
    return message;
}

+ (NIMMessage*)msgWithFileData:(NSData*)data extension:(NSString*)extension{
    NIMFileObject *fileObject = [[NIMFileObject alloc] initWithData:data extension:extension];
    NSString *displayName;
    if (extension.length) {
        displayName     = [NSString stringWithFormat:@"%@.%@",[NSUUID UUID].UUIDString.MD5String,extension];
    }else{
        displayName     = [NSString stringWithFormat:@"%@",[NSUUID UUID].UUIDString.MD5String];
    }
    fileObject.displayName    = displayName;
    NIMMessage *message       = [[NIMMessage alloc] init];
    message.messageObject     = fileObject;
    message.apnsContent = @"发来了一个文件".ntes_localized;
    NIMMessageSetting *setting = [[NIMMessageSetting alloc] init];
    setting.teamReceiptEnabled = YES;

    message.setting = setting;
    message.env = [[NTESBundleSetting sharedConfig] messageEnv];
    return message;
}

+ (NIMMessage*)msgWithWhiteboardAttachment:(NTESWhiteboardAttachment *)attachment
{
    NIMMessage *message               = [[NIMMessage alloc] init];
    NIMCustomObject *customObject     = [[NIMCustomObject alloc] init];
    customObject.attachment           = attachment;
    message.messageObject             = customObject;
    
    NIMMessageSetting *setting = [[NIMMessageSetting alloc] init];
    setting.apnsEnabled        = NO;
    setting.teamReceiptEnabled = YES;

    message.setting            = setting;
    
    message.env = [[NTESBundleSetting sharedConfig] messageEnv];
    return message;
}


+ (NIMMessage *)msgWithTip:(NSString *)tip
{
    NIMMessage *message        = [[NIMMessage alloc] init];
    NIMTipObject *tipObject    = [[NIMTipObject alloc] init];
    message.messageObject      = tipObject;
    message.text               = tip;
    NIMMessageSetting *setting = [[NIMMessageSetting alloc] init];
    setting.apnsEnabled        = NO;
    setting.shouldBeCounted    = NO;
    setting.teamReceiptEnabled = YES;

    message.setting            = setting;
    message.env = [[NTESBundleSetting sharedConfig] messageEnv];
    return message;
}

+ (NIMMessage *)msgWithTip:(NSString *)tip
              revokeAttach:(NSString *)revokeAttach
         revokeCallbackExt:(NSString *)revokeCallbackExt {
    NIMMessage *message        = [[NIMMessage alloc] init];
    NIMTipObject *tipObject    = [[NIMTipObject alloc] initWithAttach:revokeAttach
                                                          callbackExt:revokeCallbackExt];
    message.messageObject      = tipObject;
    message.text               = tip;
    NIMMessageSetting *setting = [[NIMMessageSetting alloc] init];
    setting.apnsEnabled        = NO;
    setting.shouldBeCounted    = NO;
    setting.teamReceiptEnabled = YES;

    message.setting            = setting;
    message.env = [[NTESBundleSetting sharedConfig] messageEnv];
    return message;
}


+ (NIMMessage *)msgWithRedPacket:(NTESRedPacketAttachment *)attachment
{
    NIMMessage *message               = [[NIMMessage alloc] init];
    NIMCustomObject *customObject     = [[NIMCustomObject alloc] init];
    customObject.attachment           = attachment;
    message.messageObject             = customObject;
    
    message.apnsContent = @"发来了一个红包".ntes_localized;
    
    NIMMessageSetting *setting = [[NIMMessageSetting alloc] init];
    setting.historyEnabled     = NO;
    setting.teamReceiptEnabled = YES;

    message.setting            = setting;
    message.env = [[NTESBundleSetting sharedConfig] messageEnv];
    return message;
}

+ (NIMMessage *)msgWithRedPacketTip:(NTESRedPacketTipAttachment *)attachment
{
    NIMMessage *message               = [[NIMMessage alloc] init];
    NIMCustomObject *customObject     = [[NIMCustomObject alloc] init];
    customObject.attachment           = attachment;
    message.messageObject             = customObject;

    NIMMessageSetting *setting = [[NIMMessageSetting alloc] init];
    setting.apnsEnabled        = NO;
    setting.shouldBeCounted    = NO;
    setting.historyEnabled     = NO;
    setting.teamReceiptEnabled = YES;

    message.setting            = setting;
    message.env = [[NTESBundleSetting sharedConfig] messageEnv];
    
    return message;
}

+ (NIMMessage *)msgWithMultiRetweetAttachment:(NTESMultiRetweetAttachment *)attachment {
    NIMMessage *message               = [[NIMMessage alloc] init];
    NIMCustomObject *customObject     = [[NIMCustomObject alloc] init];
    customObject.attachment           = attachment;
    message.messageObject             = customObject;
    message.apnsContent = @"发来一段聊天记录".ntes_localized;
    message.setting = [[NIMMessageSetting alloc] init];
    message.setting.teamReceiptEnabled = YES;

    message.setting.apnsWithPrefix = [[NTESBundleSetting sharedConfig] enableAPNsPrefix];
    message.apnsMemberOption = [[NIMMessageApnsMemberOption alloc] init];
    message.apnsMemberOption.forcePush = [[NTESBundleSetting sharedConfig] enableTeamAPNsForce];
    message.env = [[NTESBundleSetting sharedConfig] messageEnv];
    return message;
}

+ (NIMMessage *)msgWithRevocationMessage:(NIMMessage *)revocationMessage
{
    NIMMessage *message               = [[NIMMessage alloc] init];
    NIMCustomObject *customObject     = [[NIMCustomObject alloc] init];
    message.messageObject             = customObject;
    message.messageSubType = 20;

    NSString *msg = [NSString stringWithFormat:@"%@%@", revocationMessage.senderName,LangKey(@"retracted_message")];

    NIMCustomObject *object = revocationMessage.messageObject;
    if (object)
    {
        if ([object isKindOfClass:[NIMVideoObject class]]) {
            NIMVideoObject *obj = (NIMVideoObject *)object;
            msg = [NSString stringWithFormat:@"%@:%@->%@",msg,@"[视频]".nim_localized, obj.coverUrl];
        } else if ([object isKindOfClass:[NIMImageObject class]]){
            NIMImageObject *obj = (NIMImageObject *)object;
            msg = [NSString stringWithFormat:@"%@:%@->%@",msg,@"[图片]".nim_localized, obj.url];
        } else if ([object isKindOfClass:[NIMAudioObject class]]){
            NIMAudioObject *obj = (NIMAudioObject *)object;
            msg = [NSString stringWithFormat:@"%@:%@->%@",msg,@"[语音]".nim_localized, obj.url];
        }
        
    } else {
        msg = [NSString stringWithFormat:@"%@:%@",msg,revocationMessage.text?:@""];
    }

    message.text = msg;
    
    NIMMessageSetting *setting = [[NIMMessageSetting alloc] init];
    setting.historyEnabled = YES;
    setting.apnsEnabled        = NO;
    setting.shouldBeCounted    = NO;
    setting.teamReceiptEnabled = YES;
    
    message.setting = setting;
    return message;
}

+ (NSString *)generateUUID {
    
    // 创建一个UUID
    CFUUIDRef uuidObject = CFUUIDCreate(kCFAllocatorDefault);
    // 转换为字符串
    NSString *uuidString = (__bridge_transfer NSString *)CFUUIDCreateString(kCFAllocatorDefault, uuidObject);
    // 释放UUID对象
    CFRelease(uuidObject);
    return uuidString;
}

@end
