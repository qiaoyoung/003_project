
#import <Foundation/Foundation.h>

NSString *StringFromOffTheJobData(Byte *data);


//: 发来了一段语音
Byte str_egoValue[] = {15, 21, 12, 131, 108, 188, 67, 215, 62, 53, 43, 15, 179, 159, 233, 173, 175, 232, 181, 174, 230, 128, 184, 228, 134, 186, 228, 165, 157, 230, 145, 143, 229, 150};


//: init_manager_nim_status_bar_image_message
Byte str_organizeTitle[] = {4, 41, 5, 185, 242, 101, 103, 97, 115, 115, 101, 109, 95, 101, 103, 97, 109, 105, 95, 114, 97, 98, 95, 115, 117, 116, 97, 116, 115, 95, 109, 105, 110, 95, 114, 101, 103, 97, 110, 97, 109, 95, 116, 105, 110, 105, 137};


//: apns-collapse-id
Byte str_scriptName[] = {28, 16, 4, 229, 100, 105, 45, 101, 115, 112, 97, 108, 108, 111, 99, 45, 115, 110, 112, 97, 76};


//: 你收到了一条快捷评论
Byte str_sculptText[] = {97, 30, 6, 165, 147, 216, 186, 174, 232, 132, 175, 232, 183, 141, 230, 171, 191, 229, 161, 157, 230, 128, 184, 228, 134, 186, 228, 176, 136, 229, 182, 148, 230, 160, 189, 228, 137};


//: value
Byte str_specializeName[] = {21, 5, 4, 235, 101, 117, 108, 97, 118, 146};


//: key
Byte str_fedRitualEhValue[] = {39, 3, 3, 121, 101, 107, 252};


//: nim_test_msg_env
Byte str_mmContent[] = {78, 16, 4, 96, 118, 110, 101, 95, 103, 115, 109, 95, 116, 115, 101, 116, 95, 109, 105, 110, 115};


//: 发来了一段视频
Byte str_ministrationData[] = {36, 21, 9, 83, 167, 64, 187, 83, 118, 145, 162, 233, 134, 167, 232, 181, 174, 230, 128, 184, 228, 134, 186, 228, 165, 157, 230, 145, 143, 229, 244};

// __DEBUG__
// __CLOSE_PRINT__
//
//  CCCMessageMaker.m
// Indicator
//
//  Created by chris.
//  Copyright (c) 2015年 NetEase. All rights reserved.
//

// __M_A_C_R_O__
//: #import "CCCMessageMaker.h"
#import "Maker.h"
//: #import "NSString+AppleProjectKit.h"
#import "NSString+Indicator.h"
//: #import "AppleProjectKit.h"
#import "Indicator.h"
//: #import "AAAInputAtCache.h"
#import "ColorCache.h"

//: NSString * generateUUID(void) {
NSString * generateUUID(void) {
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

//: @implementation CCCMessageMaker
@implementation Maker

//: + (NIMMessage*)msgWithText:(NSString*)text
+ (NIMMessage*)streetwiseTitle:(NSString*)text
{
    //: NIMMessage *textMessage = [[NIMMessage alloc] init];
    NIMMessage *textMessage = [[NIMMessage alloc] init];
    //: textMessage.text = text;
    textMessage.text = text;
    //: [self setupMessage:textMessage];
    [self bottom:textMessage];
    //: return textMessage;
    return textMessage;
}

//: + (NIMMessage*)msgWithAudio:(NSString*)filePath
+ (NIMMessage*)image:(NSString*)filePath
{
    //: NIMAudioObject *audioObject = [[NIMAudioObject alloc] initWithSourcePath:filePath];
    NIMAudioObject *audioObject = [[NIMAudioObject alloc] initWithSourcePath:filePath];
    //: NIMMessage *message = [[NIMMessage alloc] init];
    NIMMessage *message = [[NIMMessage alloc] init];
    //: message.messageObject = audioObject;
    message.messageObject = audioObject;
    //: message.text = @"发来了一段语音".nim_localized;
    message.text = StringFromOffTheJobData(str_egoValue).trapLocalized;
    //: [self setupMessage:message];
    [self bottom:message];
    //: return message;
    return message;
}

//: + (NIMMessage*)msgWithVideo:(NSString*)filePath
+ (NIMMessage*)high:(NSString*)filePath
{
//    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
//    NSString *dateString = [dateFormatter stringFromDate:[NSDate date]];
    //: NIMVideoObject *videoObject = [[NIMVideoObject alloc] initWithSourcePath:filePath];
    NIMVideoObject *videoObject = [[NIMVideoObject alloc] initWithSourcePath:filePath];
    //: videoObject.displayName = generateUUID();
    videoObject.displayName = generateUUID();
    //: NIMMessage *message = [[NIMMessage alloc] init];
    NIMMessage *message = [[NIMMessage alloc] init];
    //: message.messageObject = videoObject;
    message.messageObject = videoObject;
    //: message.apnsContent = @"发来了一段视频".nim_localized;
    message.apnsContent = StringFromOffTheJobData(str_ministrationData).trapLocalized;
    //: [self setupMessage:message];
    [self bottom:message];
    //: return message;
    return message;
}

//: + (NIMMessage*)msgWithImage:(UIImage*)image
+ (NIMMessage*)searched:(UIImage*)image
{
    //: NIMImageObject *imageObject = [[NIMImageObject alloc] initWithImage:image];
    NIMImageObject *imageObject = [[NIMImageObject alloc] initWithImage:image];
    //: NIMImageOption *option = [[NIMImageOption alloc] init];
    NIMImageOption *option = [[NIMImageOption alloc] init];
    //: option.compressQuality = 0.7;
    option.compressQuality = 0.7;
    //: imageObject.option = option;
    imageObject.option = option;
    //: return [CCCMessageMaker generateImageMessage:imageObject];
    return [Maker sightMessage:imageObject];
}

//: + (NIMMessage *)msgWithImagePath:(NSString*)path
+ (NIMMessage *)streetSmart:(NSString*)path
{
    //: NIMImageObject * imageObject = [[NIMImageObject alloc] initWithFilepath:path];
    NIMImageObject * imageObject = [[NIMImageObject alloc] initWithFilepath:path];
    //: return [CCCMessageMaker generateImageMessage:imageObject];
    return [Maker sightMessage:imageObject];
}

//: + (NIMMessage *)msgWithImageData:(NSData *)data extension:(NSString *)extension
+ (NIMMessage *)pressedText:(NSData *)data imaginationImageFrame:(NSString *)extension
{
    //: NIMImageObject *imageObject = [[NIMImageObject alloc] initWithData:data extension:extension];
    NIMImageObject *imageObject = [[NIMImageObject alloc] initWithData:data extension:extension];
    //: return [CCCMessageMaker generateImageMessage:imageObject];
    return [Maker sightMessage:imageObject];
}

//: + (NIMMessage *)generateImageMessage:(NIMImageObject *)imageObject
+ (NIMMessage *)sightMessage:(NIMImageObject *)imageObject
{
//    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
//    NSString *dateString = [dateFormatter stringFromDate:[NSDate date]];
    //: imageObject.displayName = generateUUID();
    imageObject.displayName = generateUUID();
    //: NIMMessage *message = [[NIMMessage alloc] init];
    NIMMessage *message = [[NIMMessage alloc] init];
    //: message.messageObject = imageObject;
    message.messageObject = imageObject;
    //: message.apnsContent = [NTESLanguageManager getTextWithKey:@"init_manager_nim_status_bar_image_message"];
    message.apnsContent = [MaxInformation off:StringFromOffTheJobData(str_organizeTitle)];
    //: [self setupMessage:message];
    [self bottom:message];
    //: return message;
    return message;
}



//: + (void)setupMessage:(NIMMessage *)message
+ (void)bottom:(NIMMessage *)message
{
    //: message.apnsPayload = @{
    message.apnsPayload = @{
        //: @"apns-collapse-id": message.messageId,
        StringFromOffTheJobData(str_scriptName): message.messageId,
    //: };
    };

    //: NIMMessageSetting *setting = [[NIMMessageSetting alloc] init];
    NIMMessageSetting *setting = [[NIMMessageSetting alloc] init];
    //: setting.teamReceiptEnabled = YES;
    setting.teamReceiptEnabled = YES;

    //: message.setting = setting;
    message.setting = setting;
    //: message.env = [[NSUserDefaults standardUserDefaults] objectForKey:@"nim_test_msg_env"];
    message.env = [[NSUserDefaults standardUserDefaults] objectForKey:StringFromOffTheJobData(str_mmContent)];
}


//: @end
@end


//: @implementation NIMCommentMaker
@implementation NameMaker

//: + (NIMQuickComment *)commentWithType:(int64_t)type
+ (NIMQuickComment *)thread:(int64_t)type
                             //: content:(NSString *)content
                             item:(NSString *)content
                                 //: ext:(NSString *)ext
                                 enableMy:(NSString *)ext
{
    //: NIMQuickComment *comment = [[NIMQuickComment alloc] init];
    NIMQuickComment *comment = [[NIMQuickComment alloc] init];
    //: comment.ext = ext;
    comment.ext = ext;
    //: NIMQuickCommentSetting *setting = [[NIMQuickCommentSetting alloc] init];
    NIMQuickCommentSetting *setting = [[NIMQuickCommentSetting alloc] init];
    //: setting.needPush = YES;
    setting.needPush = YES;
    //: setting.needBadge = YES;
    setting.needBadge = YES;
    //: setting.pushTitle = @"你收到了一条快捷评论";
    setting.pushTitle = StringFromOffTheJobData(str_sculptText);
    //: setting.pushContent = content;
    setting.pushContent = content;
    //: setting.pushPayload = @{
    setting.pushPayload = @{
        //: @"key" : @"value"
        StringFromOffTheJobData(str_fedRitualEhValue) : StringFromOffTheJobData(str_specializeName)
    //: };
    };
    //: comment.setting = setting;
    comment.setting = setting;
    //: comment.replyType = type;
    comment.replyType = type;
    //: return comment;
    return comment;
}

//: @end
@end

Byte * OffTheJobDataToCache(Byte *data) {
    int beginning = data[0];
    int chantInsist = data[1];
    int hesitatePower = data[2];
    if (!beginning) return data + hesitatePower;
    for (int i = 0; i < chantInsist / 2; i++) {
        int begin = hesitatePower + i;
        int end = hesitatePower + chantInsist - i - 1;
        Byte temp = data[begin];
        data[begin] = data[end];
        data[end] = temp;
    }
    data[0] = 0;
    data[hesitatePower + chantInsist] = 0;
    return data + hesitatePower;
}

NSString *StringFromOffTheJobData(Byte *data) {
    return [NSString stringWithUTF8String:(char *)OffTheJobDataToCache(data)];
}  
