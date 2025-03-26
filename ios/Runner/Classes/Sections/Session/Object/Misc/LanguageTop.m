
#import <Foundation/Foundation.h>

NSString *StringFromVisualImageData(Byte *data);


//: 发来了一个红包
Byte str_yardValue[] = {3, 21, 13, 40, 200, 104, 48, 49, 66, 125, 225, 27, 190, 133, 140, 229, 162, 186, 231, 170, 184, 228, 128, 184, 228, 134, 186, 228, 165, 157, 230, 145, 143, 229, 176};


//: init_manager_nim_status_bar_video_message
Byte str_showInsistLengthName[] = {26, 41, 5, 62, 187, 101, 103, 97, 115, 115, 101, 109, 95, 111, 101, 100, 105, 118, 95, 114, 97, 98, 95, 115, 117, 116, 97, 116, 115, 95, 109, 105, 110, 95, 114, 101, 103, 97, 110, 97, 109, 95, 116, 105, 110, 105, 106};


//: 发来一段聊天记录
Byte str_combineText[] = {34, 24, 5, 115, 85, 149, 189, 229, 176, 174, 232, 169, 164, 229, 138, 129, 232, 181, 174, 230, 128, 184, 228, 165, 157, 230, 145, 143, 229, 226};


//: retracted_message
Byte str_ownIconValue[] = {18, 17, 6, 135, 138, 39, 101, 103, 97, 115, 115, 101, 109, 95, 100, 101, 116, 99, 97, 114, 116, 101, 114, 112};


//: 发来了一个文件
Byte str_inputSessionContent[] = {74, 21, 4, 197, 182, 187, 228, 135, 150, 230, 170, 184, 228, 128, 184, 228, 134, 186, 228, 165, 157, 230, 145, 143, 229, 165};


//: init_manager_nim_status_bar_audio_message
Byte str_curiousSizeData[] = {63, 41, 13, 34, 38, 246, 73, 231, 25, 183, 95, 146, 196, 101, 103, 97, 115, 115, 101, 109, 95, 111, 105, 100, 117, 97, 95, 114, 97, 98, 95, 115, 117, 116, 97, 116, 115, 95, 109, 105, 110, 95, 114, 101, 103, 97, 110, 97, 109, 95, 116, 105, 110, 105, 140};


//: 发来了阅后即焚
Byte str_scanData[] = {80, 21, 5, 206, 244, 154, 132, 231, 179, 141, 229, 142, 144, 229, 133, 152, 233, 134, 186, 228, 165, 157, 230, 145, 143, 229, 35};


//: 发来了猜拳信息
Byte str_minimumThatName[] = {44, 21, 10, 192, 241, 176, 127, 136, 129, 166, 175, 129, 230, 161, 191, 228, 179, 139, 230, 156, 140, 231, 134, 186, 228, 165, 157, 230, 145, 143, 229, 175};


//: init_manager_nim_status_bar_image_message
Byte str_numberMarbleValue[] = {20, 41, 6, 58, 201, 85, 101, 103, 97, 115, 115, 101, 109, 95, 101, 103, 97, 109, 105, 95, 114, 97, 98, 95, 115, 117, 116, 97, 116, 115, 95, 109, 105, 110, 95, 114, 101, 103, 97, 110, 97, 109, 95, 116, 105, 110, 105, 67};

// __DEBUG__
// __CLOSE_PRINT__
//
//  NTESSessionMsgHelper.m
//  NIMDemo
//
//  Created by ght on 15-1-28.
//  Copyright (c) 2015年 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import "NTESSessionMsgConverter.h"
#import "LanguageTop.h"
//: #import "NSString+NTES.h"
#import "NSString+Status.h"
//: #import "NTESJanKenPonAttachment.h"
#import "MaxOnStatusAttachment.h"
//: #import "NTESSnapchatAttachment.h"
#import "TopOfTap.h"
//: #import "NTESWhiteboardAttachment.h"
#import "ToContainer.h"
//: #import "NTESRedPacketAttachment.h"
#import "MarkTing.h"
//: #import "NTESRedPacketTipAttachment.h"
#import "LightNameAttachment.h"
//: #import "NTESMultiRetweetAttachment.h"
#import "AttachmentHide.h"
//: #import "NTESBundleSetting.h"
#import "NameLine.h"

//: @implementation NTESSessionMsgConverter
@implementation LanguageTop


//: + (NIMMessage*)msgWithText:(NSString*)text
+ (NIMMessage*)text:(NSString*)text
{
    //: NIMMessage *textMessage = [[NIMMessage alloc] init];
    NIMMessage *textMessage = [[NIMMessage alloc] init];
    //: textMessage.text = text;
    textMessage.text = text;
    //: textMessage.setting = [[NIMMessageSetting alloc] init];
    textMessage.setting = [[NIMMessageSetting alloc] init];
    //: textMessage.setting.teamReceiptEnabled = YES;
    textMessage.setting.teamReceiptEnabled = YES;

    //: textMessage.setting.apnsWithPrefix = [[NTESBundleSetting sharedConfig] enableAPNsPrefix];
    textMessage.setting.apnsWithPrefix = [[NameLine restoreTing] label];
    //: textMessage.apnsMemberOption = [[NIMMessageApnsMemberOption alloc] init];
    textMessage.apnsMemberOption = [[NIMMessageApnsMemberOption alloc] init];
    //: textMessage.apnsMemberOption.forcePush = [[NTESBundleSetting sharedConfig] enableTeamAPNsForce];
    textMessage.apnsMemberOption.forcePush = [[NameLine restoreTing] alter];
    //: textMessage.env = [[NTESBundleSetting sharedConfig] messageEnv];
    textMessage.env = [[NameLine restoreTing] threadEnv];
    //: return textMessage;
    return textMessage;
}

//: + (NIMMessage*)msgWithImage:(UIImage*)image
+ (NIMMessage*)input:(UIImage*)image
{
    //: NIMImageObject * imageObject = [[NIMImageObject alloc] initWithImage:image];
    NIMImageObject * imageObject = [[NIMImageObject alloc] initWithImage:image];
   //: return [NTESSessionMsgConverter generateImageMessage:imageObject];
   return [LanguageTop show:imageObject];
}

//: + (NIMMessage *)msgWithImagePath:(NSString*)path
+ (NIMMessage *)state:(NSString*)path
{
    //: NIMImageObject * imageObject = [[NIMImageObject alloc] initWithFilepath:path];
    NIMImageObject * imageObject = [[NIMImageObject alloc] initWithFilepath:path];
    //: return [NTESSessionMsgConverter generateImageMessage:imageObject];
    return [LanguageTop show:imageObject];
}

//: + (NIMMessage *)generateImageMessage:(NIMImageObject *)imageObject
+ (NIMMessage *)show:(NIMImageObject *)imageObject
{
//    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
//    NSString *dateString = [dateFormatter stringFromDate:[NSDate date]];
    //: imageObject.displayName = [NTESSessionMsgConverter generateUUID];
    imageObject.displayName = [LanguageTop uuid];
    //: NIMImageOption *option = [[NIMImageOption alloc] init];
    NIMImageOption *option = [[NIMImageOption alloc] init];
    //: option.compressQuality = 0.8;
    option.compressQuality = 0.8;
    //: imageObject.option = option;
    imageObject.option = option;
    //: NIMMessage *message = [[NIMMessage alloc] init];
    NIMMessage *message = [[NIMMessage alloc] init];
    //: message.messageObject = imageObject;
    message.messageObject = imageObject;
    //: message.apnsContent = [NTESLanguageManager getTextWithKey:@"init_manager_nim_status_bar_image_message"];
    message.apnsContent = [MaxInformation off:StringFromVisualImageData(str_numberMarbleValue)];
    //: NIMMessageSetting *setting = [[NIMMessageSetting alloc] init];
    NIMMessageSetting *setting = [[NIMMessageSetting alloc] init];
    //: setting.teamReceiptEnabled = YES;
    setting.teamReceiptEnabled = YES;

    //: message.setting = setting;
    message.setting = setting;
    //: setting.apnsWithPrefix = [[NTESBundleSetting sharedConfig] enableAPNsPrefix];
    setting.apnsWithPrefix = [[NameLine restoreTing] label];
    //: message.apnsMemberOption = [[NIMMessageApnsMemberOption alloc] init];
    message.apnsMemberOption = [[NIMMessageApnsMemberOption alloc] init];
    //: message.apnsMemberOption.forcePush = [[NTESBundleSetting sharedConfig] enableTeamAPNsForce];
    message.apnsMemberOption.forcePush = [[NameLine restoreTing] alter];
    //: message.env = [[NTESBundleSetting sharedConfig] messageEnv];
    message.env = [[NameLine restoreTing] threadEnv];
    //: return message;
    return message;
}

//: + (NIMMessage*)msgWithAudio:(NSString*)filePath
+ (NIMMessage*)ting:(NSString*)filePath
{
    //: NIMAudioObject *audioObject = [[NIMAudioObject alloc] initWithSourcePath:filePath];
    NIMAudioObject *audioObject = [[NIMAudioObject alloc] initWithSourcePath:filePath];
    //: NIMMessage *message = [[NIMMessage alloc] init];
    NIMMessage *message = [[NIMMessage alloc] init];
    //: message.messageObject = audioObject;
    message.messageObject = audioObject;
    //: message.apnsContent = [NTESLanguageManager getTextWithKey:@"init_manager_nim_status_bar_audio_message"];
    message.apnsContent = [MaxInformation off:StringFromVisualImageData(str_curiousSizeData)];
    //: NIMMessageSetting *setting = [[NIMMessageSetting alloc] init];
    NIMMessageSetting *setting = [[NIMMessageSetting alloc] init];
    //: setting.teamReceiptEnabled = YES;
    setting.teamReceiptEnabled = YES;

    //: message.setting = setting;
    message.setting = setting;
    //: message.env = [[NTESBundleSetting sharedConfig] messageEnv];
    message.env = [[NameLine restoreTing] threadEnv];
    //: return message;
    return message;
}

//: + (NIMMessage*)msgWithVideo:(NSString*)filePath
+ (NIMMessage*)statusSave:(NSString*)filePath
{
//    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
//    NSString *dateString = [dateFormatter stringFromDate:[NSDate date]];
    //: NIMVideoObject *videoObject = [[NIMVideoObject alloc] initWithSourcePath:filePath];
    NIMVideoObject *videoObject = [[NIMVideoObject alloc] initWithSourcePath:filePath];
    //: videoObject.displayName = [NTESSessionMsgConverter generateUUID];
    videoObject.displayName = [LanguageTop uuid];
    //: NIMMessage *message = [[NIMMessage alloc] init];
    NIMMessage *message = [[NIMMessage alloc] init];
    //: message.messageObject = videoObject;
    message.messageObject = videoObject;
    //: message.apnsContent = [NTESLanguageManager getTextWithKey:@"init_manager_nim_status_bar_video_message"];
    message.apnsContent = [MaxInformation off:StringFromVisualImageData(str_showInsistLengthName)];
    //: NIMMessageSetting *setting = [[NIMMessageSetting alloc] init];
    NIMMessageSetting *setting = [[NIMMessageSetting alloc] init];
    //: setting.teamReceiptEnabled = YES;
    setting.teamReceiptEnabled = YES;

    //: message.setting = setting;
    message.setting = setting;
    //: message.env = [[NTESBundleSetting sharedConfig] messageEnv];
    message.env = [[NameLine restoreTing] threadEnv];
    //: return message;
    return message;
}


//: + (NIMMessage*)msgWithJenKenPon:(NTESJanKenPonAttachment *)attachment
+ (NIMMessage*)link:(MaxOnStatusAttachment *)attachment
{
    //: NIMMessage *message = [[NIMMessage alloc] init];
    NIMMessage *message = [[NIMMessage alloc] init];
    //: NIMCustomObject *customObject = [[NIMCustomObject alloc] init];
    NIMCustomObject *customObject = [[NIMCustomObject alloc] init];
    //: customObject.attachment = attachment;
    customObject.attachment = attachment;
    //: message.messageObject = customObject;
    message.messageObject = customObject;
    //: message.apnsContent = @"发来了猜拳信息".ntes_localized;
    message.apnsContent = StringFromVisualImageData(str_minimumThatName).language;
    //: message.setting = [[NIMMessageSetting alloc] init];
    message.setting = [[NIMMessageSetting alloc] init];
    //: message.setting.teamReceiptEnabled = YES;
    message.setting.teamReceiptEnabled = YES;

    //: message.setting.apnsWithPrefix = [[NTESBundleSetting sharedConfig] enableAPNsPrefix];
    message.setting.apnsWithPrefix = [[NameLine restoreTing] label];
    //: message.apnsMemberOption = [[NIMMessageApnsMemberOption alloc] init];
    message.apnsMemberOption = [[NIMMessageApnsMemberOption alloc] init];
    //: message.apnsMemberOption.forcePush = [[NTESBundleSetting sharedConfig] enableTeamAPNsForce];
    message.apnsMemberOption.forcePush = [[NameLine restoreTing] alter];
    //: message.env = [[NTESBundleSetting sharedConfig] messageEnv];
    message.env = [[NameLine restoreTing] threadEnv];
    //: return message;
    return message;
}

//: + (NIMMessage*)msgWithSnapchatAttachment:(NTESSnapchatAttachment *)attachment
+ (NIMMessage*)library:(TopOfTap *)attachment
{
    //: NIMMessage *message = [[NIMMessage alloc] init];
    NIMMessage *message = [[NIMMessage alloc] init];
    //: NIMCustomObject *customObject = [[NIMCustomObject alloc] init];
    NIMCustomObject *customObject = [[NIMCustomObject alloc] init];
    //: customObject.attachment = attachment;
    customObject.attachment = attachment;
    //: message.messageObject = customObject;
    message.messageObject = customObject;
    //: message.apnsContent = @"发来了阅后即焚".ntes_localized;
    message.apnsContent = StringFromVisualImageData(str_scanData).language;

    //: NIMMessageSetting *setting = [[NIMMessageSetting alloc] init];
    NIMMessageSetting *setting = [[NIMMessageSetting alloc] init];
    //: setting.historyEnabled = NO;
    setting.historyEnabled = NO;
    //: setting.roamingEnabled = NO;
    setting.roamingEnabled = NO;
    //: setting.syncEnabled = NO;
    setting.syncEnabled = NO;
    //: setting.teamReceiptEnabled = YES;
    setting.teamReceiptEnabled = YES;

    //: message.setting = setting;
    message.setting = setting;

    //: message.env = [[NTESBundleSetting sharedConfig] messageEnv];
    message.env = [[NameLine restoreTing] threadEnv];

    //: return message;
    return message;
}


//: + (NIMMessage*)msgWithFilePath:(NSString*)path{
+ (NIMMessage*)trademark:(NSString*)path{
    //: NIMFileObject *fileObject = [[NIMFileObject alloc] initWithSourcePath:path];
    NIMFileObject *fileObject = [[NIMFileObject alloc] initWithSourcePath:path];
    //: NSString *displayName = path.lastPathComponent;
    NSString *displayName = path.lastPathComponent;
    //: fileObject.displayName = displayName;
    fileObject.displayName = displayName;
    //: NIMMessage *message = [[NIMMessage alloc] init];
    NIMMessage *message = [[NIMMessage alloc] init];
    //: message.messageObject = fileObject;
    message.messageObject = fileObject;
    //: message.apnsContent = @"发来了一个文件".ntes_localized;
    message.apnsContent = StringFromVisualImageData(str_inputSessionContent).language;
    //: NIMMessageSetting *setting = [[NIMMessageSetting alloc] init];
    NIMMessageSetting *setting = [[NIMMessageSetting alloc] init];
    //: setting.teamReceiptEnabled = YES;
    setting.teamReceiptEnabled = YES;

    //: message.setting = setting;
    message.setting = setting;
    //: message.setting.apnsWithPrefix = [[NTESBundleSetting sharedConfig] enableAPNsPrefix];
    message.setting.apnsWithPrefix = [[NameLine restoreTing] label];
    //: message.apnsMemberOption = [[NIMMessageApnsMemberOption alloc] init];
    message.apnsMemberOption = [[NIMMessageApnsMemberOption alloc] init];
    //: message.apnsMemberOption.forcePush = [[NTESBundleSetting sharedConfig] enableTeamAPNsForce];
    message.apnsMemberOption.forcePush = [[NameLine restoreTing] alter];
    //: message.env = [[NTESBundleSetting sharedConfig] messageEnv];
    message.env = [[NameLine restoreTing] threadEnv];
    //: return message;
    return message;
}

//: + (NIMMessage*)msgWithFileData:(NSData*)data extension:(NSString*)extension{
+ (NIMMessage*)can:(NSData*)data key:(NSString*)extension{
    //: NIMFileObject *fileObject = [[NIMFileObject alloc] initWithData:data extension:extension];
    NIMFileObject *fileObject = [[NIMFileObject alloc] initWithData:data extension:extension];
    //: NSString *displayName;
    NSString *displayName;
    //: if (extension.length) {
    if (extension.length) {
        //: displayName = [NSString stringWithFormat:@"%@.%@",[NSUUID UUID].UUIDString.MD5String,extension];
        displayName = [NSString stringWithFormat:@"%@.%@",[NSUUID UUID].UUIDString.nameWith,extension];
    //: }else{
    }else{
        //: displayName = [NSString stringWithFormat:@"%@",[NSUUID UUID].UUIDString.MD5String];
        displayName = [NSString stringWithFormat:@"%@",[NSUUID UUID].UUIDString.nameWith];
    }
    //: fileObject.displayName = displayName;
    fileObject.displayName = displayName;
    //: NIMMessage *message = [[NIMMessage alloc] init];
    NIMMessage *message = [[NIMMessage alloc] init];
    //: message.messageObject = fileObject;
    message.messageObject = fileObject;
    //: message.apnsContent = @"发来了一个文件".ntes_localized;
    message.apnsContent = StringFromVisualImageData(str_inputSessionContent).language;
    //: NIMMessageSetting *setting = [[NIMMessageSetting alloc] init];
    NIMMessageSetting *setting = [[NIMMessageSetting alloc] init];
    //: setting.teamReceiptEnabled = YES;
    setting.teamReceiptEnabled = YES;

    //: message.setting = setting;
    message.setting = setting;
    //: message.env = [[NTESBundleSetting sharedConfig] messageEnv];
    message.env = [[NameLine restoreTing] threadEnv];
    //: return message;
    return message;
}

//: + (NIMMessage*)msgWithWhiteboardAttachment:(NTESWhiteboardAttachment *)attachment
+ (NIMMessage*)item:(ToContainer *)attachment
{
    //: NIMMessage *message = [[NIMMessage alloc] init];
    NIMMessage *message = [[NIMMessage alloc] init];
    //: NIMCustomObject *customObject = [[NIMCustomObject alloc] init];
    NIMCustomObject *customObject = [[NIMCustomObject alloc] init];
    //: customObject.attachment = attachment;
    customObject.attachment = attachment;
    //: message.messageObject = customObject;
    message.messageObject = customObject;

    //: NIMMessageSetting *setting = [[NIMMessageSetting alloc] init];
    NIMMessageSetting *setting = [[NIMMessageSetting alloc] init];
    //: setting.apnsEnabled = NO;
    setting.apnsEnabled = NO;
    //: setting.teamReceiptEnabled = YES;
    setting.teamReceiptEnabled = YES;

    //: message.setting = setting;
    message.setting = setting;

    //: message.env = [[NTESBundleSetting sharedConfig] messageEnv];
    message.env = [[NameLine restoreTing] threadEnv];
    //: return message;
    return message;
}


//: + (NIMMessage *)msgWithTip:(NSString *)tip
+ (NIMMessage *)message:(NSString *)tip
{
    //: NIMMessage *message = [[NIMMessage alloc] init];
    NIMMessage *message = [[NIMMessage alloc] init];
    //: NIMTipObject *tipObject = [[NIMTipObject alloc] init];
    NIMTipObject *tipObject = [[NIMTipObject alloc] init];
    //: message.messageObject = tipObject;
    message.messageObject = tipObject;
    //: message.text = tip;
    message.text = tip;
    //: NIMMessageSetting *setting = [[NIMMessageSetting alloc] init];
    NIMMessageSetting *setting = [[NIMMessageSetting alloc] init];
    //: setting.apnsEnabled = NO;
    setting.apnsEnabled = NO;
    //: setting.shouldBeCounted = NO;
    setting.shouldBeCounted = NO;
    //: setting.teamReceiptEnabled = YES;
    setting.teamReceiptEnabled = YES;

    //: message.setting = setting;
    message.setting = setting;
    //: message.env = [[NTESBundleSetting sharedConfig] messageEnv];
    message.env = [[NameLine restoreTing] threadEnv];
    //: return message;
    return message;
}

//: + (NIMMessage *)msgWithTip:(NSString *)tip
+ (NIMMessage *)with:(NSString *)tip
              //: revokeAttach:(NSString *)revokeAttach
              view:(NSString *)revokeAttach
         //: revokeCallbackExt:(NSString *)revokeCallbackExt {
         fundamentalCount:(NSString *)revokeCallbackExt {
    //: NIMMessage *message = [[NIMMessage alloc] init];
    NIMMessage *message = [[NIMMessage alloc] init];
    //: NIMTipObject *tipObject = [[NIMTipObject alloc] initWithAttach:revokeAttach
    NIMTipObject *tipObject = [[NIMTipObject alloc] initWithAttach:revokeAttach
                                                          //: callbackExt:revokeCallbackExt];
                                                          callbackExt:revokeCallbackExt];
    //: message.messageObject = tipObject;
    message.messageObject = tipObject;
    //: message.text = tip;
    message.text = tip;
    //: NIMMessageSetting *setting = [[NIMMessageSetting alloc] init];
    NIMMessageSetting *setting = [[NIMMessageSetting alloc] init];
    //: setting.apnsEnabled = NO;
    setting.apnsEnabled = NO;
    //: setting.shouldBeCounted = NO;
    setting.shouldBeCounted = NO;
    //: setting.teamReceiptEnabled = YES;
    setting.teamReceiptEnabled = YES;

    //: message.setting = setting;
    message.setting = setting;
    //: message.env = [[NTESBundleSetting sharedConfig] messageEnv];
    message.env = [[NameLine restoreTing] threadEnv];
    //: return message;
    return message;
}


//: + (NIMMessage *)msgWithRedPacket:(NTESRedPacketAttachment *)attachment
+ (NIMMessage *)nameEnable:(MarkTing *)attachment
{
    //: NIMMessage *message = [[NIMMessage alloc] init];
    NIMMessage *message = [[NIMMessage alloc] init];
    //: NIMCustomObject *customObject = [[NIMCustomObject alloc] init];
    NIMCustomObject *customObject = [[NIMCustomObject alloc] init];
    //: customObject.attachment = attachment;
    customObject.attachment = attachment;
    //: message.messageObject = customObject;
    message.messageObject = customObject;

    //: message.apnsContent = @"发来了一个红包".ntes_localized;
    message.apnsContent = StringFromVisualImageData(str_yardValue).language;

    //: NIMMessageSetting *setting = [[NIMMessageSetting alloc] init];
    NIMMessageSetting *setting = [[NIMMessageSetting alloc] init];
    //: setting.historyEnabled = NO;
    setting.historyEnabled = NO;
    //: setting.teamReceiptEnabled = YES;
    setting.teamReceiptEnabled = YES;

    //: message.setting = setting;
    message.setting = setting;
    //: message.env = [[NTESBundleSetting sharedConfig] messageEnv];
    message.env = [[NameLine restoreTing] threadEnv];
    //: return message;
    return message;
}

//: + (NIMMessage *)msgWithRedPacketTip:(NTESRedPacketTipAttachment *)attachment
+ (NIMMessage *)team:(LightNameAttachment *)attachment
{
    //: NIMMessage *message = [[NIMMessage alloc] init];
    NIMMessage *message = [[NIMMessage alloc] init];
    //: NIMCustomObject *customObject = [[NIMCustomObject alloc] init];
    NIMCustomObject *customObject = [[NIMCustomObject alloc] init];
    //: customObject.attachment = attachment;
    customObject.attachment = attachment;
    //: message.messageObject = customObject;
    message.messageObject = customObject;

    //: NIMMessageSetting *setting = [[NIMMessageSetting alloc] init];
    NIMMessageSetting *setting = [[NIMMessageSetting alloc] init];
    //: setting.apnsEnabled = NO;
    setting.apnsEnabled = NO;
    //: setting.shouldBeCounted = NO;
    setting.shouldBeCounted = NO;
    //: setting.historyEnabled = NO;
    setting.historyEnabled = NO;
    //: setting.teamReceiptEnabled = YES;
    setting.teamReceiptEnabled = YES;

    //: message.setting = setting;
    message.setting = setting;
    //: message.env = [[NTESBundleSetting sharedConfig] messageEnv];
    message.env = [[NameLine restoreTing] threadEnv];

    //: return message;
    return message;
}

//: + (NIMMessage *)msgWithMultiRetweetAttachment:(NTESMultiRetweetAttachment *)attachment {
+ (NIMMessage *)reply:(AttachmentHide *)attachment {
    //: NIMMessage *message = [[NIMMessage alloc] init];
    NIMMessage *message = [[NIMMessage alloc] init];
    //: NIMCustomObject *customObject = [[NIMCustomObject alloc] init];
    NIMCustomObject *customObject = [[NIMCustomObject alloc] init];
    //: customObject.attachment = attachment;
    customObject.attachment = attachment;
    //: message.messageObject = customObject;
    message.messageObject = customObject;
    //: message.apnsContent = @"发来一段聊天记录".ntes_localized;
    message.apnsContent = StringFromVisualImageData(str_combineText).language;
    //: message.setting = [[NIMMessageSetting alloc] init];
    message.setting = [[NIMMessageSetting alloc] init];
    //: message.setting.teamReceiptEnabled = YES;
    message.setting.teamReceiptEnabled = YES;

    //: message.setting.apnsWithPrefix = [[NTESBundleSetting sharedConfig] enableAPNsPrefix];
    message.setting.apnsWithPrefix = [[NameLine restoreTing] label];
    //: message.apnsMemberOption = [[NIMMessageApnsMemberOption alloc] init];
    message.apnsMemberOption = [[NIMMessageApnsMemberOption alloc] init];
    //: message.apnsMemberOption.forcePush = [[NTESBundleSetting sharedConfig] enableTeamAPNsForce];
    message.apnsMemberOption.forcePush = [[NameLine restoreTing] alter];
    //: message.env = [[NTESBundleSetting sharedConfig] messageEnv];
    message.env = [[NameLine restoreTing] threadEnv];
    //: return message;
    return message;
}

//: + (NIMMessage *)msgWithRevocationMessage:(NIMMessage *)revocationMessage
+ (NIMMessage *)statusText:(NIMMessage *)revocationMessage
{
    //: NIMMessage *message = [[NIMMessage alloc] init];
    NIMMessage *message = [[NIMMessage alloc] init];
    //: NIMCustomObject *customObject = [[NIMCustomObject alloc] init];
    NIMCustomObject *customObject = [[NIMCustomObject alloc] init];
    //: message.messageObject = customObject;
    message.messageObject = customObject;
    //: message.messageSubType = 20;
    message.messageSubType = 20;

    //: NSString *msg = [NSString stringWithFormat:@"%@%@", revocationMessage.senderName,[NTESLanguageManager getTextWithKey:@"retracted_message"]];
    NSString *msg = [NSString stringWithFormat:@"%@%@", revocationMessage.senderName,[MaxInformation off:StringFromVisualImageData(str_ownIconValue)]];

    //: NIMCustomObject *object = revocationMessage.messageObject;
    NIMCustomObject *object = revocationMessage.messageObject;
    //: if (object)
    if (object)
    {
        //: if ([object isKindOfClass:[NIMVideoObject class]]) {
        if ([object isKindOfClass:[NIMVideoObject class]]) {
            //: NIMVideoObject *obj = (NIMVideoObject *)object;
            NIMVideoObject *obj = (NIMVideoObject *)object;
            //: msg = [NSString stringWithFormat:@"%@:%@->%@",msg,@"[视频]".nim_localized, obj.coverUrl];
            msg = [NSString stringWithFormat:@"%@:%@->%@",msg,@"[视频]".trapLocalized, obj.coverUrl];
        //: } else if ([object isKindOfClass:[NIMImageObject class]]){
        } else if ([object isKindOfClass:[NIMImageObject class]]){
            //: NIMImageObject *obj = (NIMImageObject *)object;
            NIMImageObject *obj = (NIMImageObject *)object;
            //: msg = [NSString stringWithFormat:@"%@:%@->%@",msg,@"[图片]".nim_localized, obj.url];
            msg = [NSString stringWithFormat:@"%@:%@->%@",msg,@"[图片]".trapLocalized, obj.url];
        //: } else if ([object isKindOfClass:[NIMAudioObject class]]){
        } else if ([object isKindOfClass:[NIMAudioObject class]]){
            //: NIMAudioObject *obj = (NIMAudioObject *)object;
            NIMAudioObject *obj = (NIMAudioObject *)object;
            //: msg = [NSString stringWithFormat:@"%@:%@->%@",msg,@"[语音]".nim_localized, obj.url];
            msg = [NSString stringWithFormat:@"%@:%@->%@",msg,@"[语音]".trapLocalized, obj.url];
        }

    //: } else {
    } else {
        //: msg = [NSString stringWithFormat:@"%@:%@",msg,revocationMessage.text?:@""];
        msg = [NSString stringWithFormat:@"%@:%@",msg,revocationMessage.text?:@""];
    }

    //: message.text = msg;
    message.text = msg;

    //: NIMMessageSetting *setting = [[NIMMessageSetting alloc] init];
    NIMMessageSetting *setting = [[NIMMessageSetting alloc] init];
    //: setting.historyEnabled = YES;
    setting.historyEnabled = YES;
    //: setting.apnsEnabled = NO;
    setting.apnsEnabled = NO;
    //: setting.shouldBeCounted = NO;
    setting.shouldBeCounted = NO;
    //: setting.teamReceiptEnabled = YES;
    setting.teamReceiptEnabled = YES;

    //: message.setting = setting;
    message.setting = setting;
    //: return message;
    return message;
}

//: + (NSString *)generateUUID {
+ (NSString *)uuid {

    // 创建一个UUID
    //: CFUUIDRef uuidObject = CFUUIDCreate(kCFAllocatorDefault);
    CFUUIDRef uuidObject = CFUUIDCreate(kCFAllocatorDefault);
    // 转换为字符串
    //: NSString *uuidString = (__bridge_transfer NSString *)CFUUIDCreateString(kCFAllocatorDefault, uuidObject);
    NSString *uuidString = (__bridge_transfer NSString *)CFUUIDCreateString(kCFAllocatorDefault, uuidObject);
    // 释放UUID对象
    //: CFRelease(uuidObject);
    CFRelease(uuidObject);
    //: return uuidString;
    return uuidString;
}

//: @end
@end

Byte * VisualImageDataToCache(Byte *data) {
    int quoWarranto = data[0];
    int imageClient = data[1];
    int cede = data[2];
    if (!quoWarranto) return data + cede;
    for (int i = 0; i < imageClient / 2; i++) {
        int begin = cede + i;
        int end = cede + imageClient - i - 1;
        Byte temp = data[begin];
        data[begin] = data[end];
        data[end] = temp;
    }
    data[0] = 0;
    data[cede + imageClient] = 0;
    return data + cede;
}

NSString *StringFromVisualImageData(Byte *data) {
    return [NSString stringWithUTF8String:(char *)VisualImageDataToCache(data)];
}  
