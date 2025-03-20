//
//  CCCMessageMaker.m
// AppleProjectKit
//
//  Created by chris.
//  Copyright (c) 2015年 NetEase. All rights reserved.
//

#import "CCCMessageMaker.h"
#import "NSString+AppleProjectKit.h"
#import "AppleProjectKit.h"
#import "AAAInputAtCache.h"

NSString * generateUUID(void) {
    // 创建一个UUID
    CFUUIDRef uuidObject = CFUUIDCreate(kCFAllocatorDefault);
    // 转换为字符串
    NSString *uuidString = (__bridge_transfer NSString *)CFUUIDCreateString(kCFAllocatorDefault, uuidObject);
    // 释放UUID对象
    CFRelease(uuidObject);
    return uuidString;
}

@implementation CCCMessageMaker

+ (NIMMessage*)msgWithText:(NSString*)text
{
    NIMMessage *textMessage = [[NIMMessage alloc] init];
    textMessage.text        = text;
    [self setupMessage:textMessage];
    return textMessage;
}

+ (NIMMessage*)msgWithAudio:(NSString*)filePath
{
    NIMAudioObject *audioObject = [[NIMAudioObject alloc] initWithSourcePath:filePath];
    NIMMessage *message = [[NIMMessage alloc] init];
    message.messageObject = audioObject;
    message.text = @"发来了一段语音".nim_localized;
    [self setupMessage:message];
    return message;
}

+ (NIMMessage*)msgWithVideo:(NSString*)filePath
{
//    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
//    NSString *dateString = [dateFormatter stringFromDate:[NSDate date]];
    NIMVideoObject *videoObject = [[NIMVideoObject alloc] initWithSourcePath:filePath];
    videoObject.displayName = generateUUID();
    NIMMessage *message = [[NIMMessage alloc] init];
    message.messageObject = videoObject;
    message.apnsContent = @"发来了一段视频".nim_localized;
    [self setupMessage:message];
    return message;
}

+ (NIMMessage*)msgWithImage:(UIImage*)image
{
    NIMImageObject *imageObject = [[NIMImageObject alloc] initWithImage:image];
    NIMImageOption *option  = [[NIMImageOption alloc] init];
    option.compressQuality  = 0.7;
    imageObject.option      = option;
    return [CCCMessageMaker generateImageMessage:imageObject];
}

+ (NIMMessage *)msgWithImagePath:(NSString*)path
{
    NIMImageObject * imageObject = [[NIMImageObject alloc] initWithFilepath:path];
    return [CCCMessageMaker generateImageMessage:imageObject];
}

+ (NIMMessage *)msgWithImageData:(NSData *)data extension:(NSString *)extension
{
    NIMImageObject *imageObject = [[NIMImageObject alloc] initWithData:data extension:extension];
    return [CCCMessageMaker generateImageMessage:imageObject];
}

+ (NIMMessage *)generateImageMessage:(NIMImageObject *)imageObject
{
//    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
//    NSString *dateString = [dateFormatter stringFromDate:[NSDate date]];
    imageObject.displayName = generateUUID();
    NIMMessage *message     = [[NIMMessage alloc] init];
    message.messageObject   = imageObject;
    message.apnsContent = LangKey(@"init_manager_nim_status_bar_image_message");
    [self setupMessage:message];
    return message;
}



+ (void)setupMessage:(NIMMessage *)message
{
    message.apnsPayload = @{
        @"apns-collapse-id": message.messageId,
    };
    
    NIMMessageSetting *setting = [[NIMMessageSetting alloc] init];
    setting.teamReceiptEnabled = YES;

    message.setting = setting;
    message.env = [[NSUserDefaults standardUserDefaults] objectForKey:@"nim_test_msg_env"];
}


@end


@implementation NIMCommentMaker

+ (NIMQuickComment *)commentWithType:(int64_t)type
                             content:(NSString *)content
                                 ext:(NSString *)ext
{
    NIMQuickComment *comment = [[NIMQuickComment alloc] init];
    comment.ext = ext;
    NIMQuickCommentSetting *setting = [[NIMQuickCommentSetting alloc] init];
    setting.needPush = YES;
    setting.needBadge = YES;
    setting.pushTitle = @"你收到了一条快捷评论";
    setting.pushContent = content;
    setting.pushPayload = @{
        @"key" : @"value"
    };
    comment.setting = setting;
    comment.replyType = type;
    return comment;
}

@end
