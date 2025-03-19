//
//  CCCKitConfig.h
// AppleProjectKit
//
//  Created by chris on 2017/10/25.
//  Copyright © 2017年 NetEase. All rights reserved.
//

#import "CCCKitSetting.h"

@class CCCKitSettings;
@class NIMMessage;

typedef NS_ENUM(NSInteger,NIMKitAvatarType) {
    /*矩形直角头像*/
    NIMKitAvatarTypeNone,
    /*圆形头像*/
    NIMKitAvatarTypeRounded,
    /*圆角头像*/
    NIMKitAvatarTypeRadiusCorner,
};

@interface CCCKitConfig : NSObject


/*全局设置*/

/**
 *  每隔多久显示一条消息
 */
@property (nonatomic, assign)  NSTimeInterval messageInterval;

/**
 *  每次抓取的消息个数
 */
@property (nonatomic, assign)  NSInteger messageLimit;


/**
 *  录音的最大时长
 */
@property (nonatomic, assign)  NSTimeInterval recordMaxDuration;


/**
 *  输入框的占位符
 */
@property (nonatomic, copy)  NSString *placeholder;


/**
 *  输入框能容纳的最大字符长度
 */
@property (nonatomic, assign) NSInteger inputMaxLength;


/**
 *  cell 的背景色
 */
@property (nonatomic, strong) UIColor *cellBackgroundColor;


/**
 *  头像类型
 */
@property (nonatomic, assign) NIMKitAvatarType avatarType;


/**
 *  昵称字体
 */
@property (nonatomic, strong) UIFont *nickFont;

/**
 *  已读回执字体
 */
@property (nonatomic, strong) UIFont *receiptFont;

/**
 *  昵称颜色
 */
@property (nonatomic, strong) UIColor *nickColor;


/**
 *  已读回执颜色
 */
@property (nonatomic, strong) UIColor *receiptColor;


/**
 *  左侧气泡设置
 */
@property (nonatomic, strong) CCCKitSettings *leftBubbleSettings;

/**
 *  右侧气泡设置
 */
@property (nonatomic, strong) CCCKitSettings *rightBubbleSettings;


/*默认内置配置*/

- (NSArray *)defaultMediaItems;

- (NSArray *)defaultMenuItemsWithMessage:(NIMMessage *)message;

- (CGFloat)maxNotificationTipPadding;


/*根据消息取到配置*/

- (CCCKitSetting *)setting:(NIMMessage *)message;


/*被回复消息取到配置*/

- (CCCKitSetting *)repliedSetting:(NIMMessage *)message;

@end




/**
 *  组件 UI 设置
 */
@interface CCCKitSettings : NSObject

/**
 *  文本类型消息设置
 */
@property (nonatomic, strong) CCCKitSetting *textSetting;

/**
 *  音频类型消息设置
 */
@property (nonatomic, strong) CCCKitSetting *audioSetting;

/**
 *  视频类型消息设置
 */
@property (nonatomic, strong) CCCKitSetting *videoSetting;

/**
 *  文件类型消息设置
 */
@property (nonatomic, strong) CCCKitSetting *fileSetting;

/**
 *  图片类型消息设置
 */
@property (nonatomic, strong) CCCKitSetting *imageSetting;

/**
 *  地理位置类型消息设置
 */
@property (nonatomic, strong) CCCKitSetting *locationSetting;

/**
 *  提示类型消息设置
 */
@property (nonatomic, strong) CCCKitSetting *tipSetting;

/**
 *  Rtc话单类型消息设置
 */
@property (nonatomic, strong) CCCKitSetting *rtcCallRecordSetting;

/**
 *  无法识别类型消息设置
 */
@property (nonatomic, strong) CCCKitSetting *unsupportSetting;

/**
 *  群组通知类型通知消息设置
 */
@property (nonatomic, strong) CCCKitSetting *teamNotificationSetting;

/**
 *  群组通知类型通知消息设置
 */
@property (nonatomic, strong) CCCKitSetting *superTeamNotificationSetting;

/**
 *  聊天室类型类型通知消息设置
 */
@property (nonatomic, strong) CCCKitSetting *chatroomNotificationSetting;

/**
 *  网络电话类型类型通知消息设置
 */
@property (nonatomic, strong) CCCKitSetting *netcallNotificationSetting;

/**
 *  被回复消息的设置
 */
@property (nonatomic, strong) CCCKitSetting *repliedSetting;


@end






