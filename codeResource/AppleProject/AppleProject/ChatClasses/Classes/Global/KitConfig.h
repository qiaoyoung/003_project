// __DEBUG__
// __CLOSE_PRINT__
//
//  KitConfig.h
// Indicator
//
//  Created by chris on 2017/10/25.
//  Copyright © 2017年 NetEase. All rights reserved.
//

// __M_A_C_R_O__
//: #import "CCCKitSetting.h"
#import "CenterShould.h"

//: @class CCCKitSettings;
@class MastheadSettings;
//: @class NIMMessage;
@class NIMMessage;

//: typedef NS_ENUM(NSInteger,NIMKitAvatarType) {
typedef NS_ENUM(NSInteger,NIMKitAvatarType) {
    /*矩形直角头像*/
    //: NIMKitAvatarTypeNone,
    NIMKitAvatarTypeNone,
    /*圆形头像*/
    //: NIMKitAvatarTypeRounded,
    NIMKitAvatarTypeRounded,
    /*圆角头像*/
    //: NIMKitAvatarTypeRadiusCorner,
    NIMKitAvatarTypeRadiusCorner,
//: };
};

//: @interface CCCKitConfig : NSObject
@interface KitConfig : NSObject


/*全局设置*/

/**
 *  每隔多久显示一条消息
 */
//: @property (nonatomic, assign) NSTimeInterval messageInterval;
@property (nonatomic, assign) NSTimeInterval messageInterval;

/**
 *  每次抓取的消息个数
 */
//: @property (nonatomic, assign) NSInteger messageLimit;
@property (nonatomic, assign) NSInteger messageLimit;


/**
 *  录音的最大时长
 */
//: @property (nonatomic, assign) NSTimeInterval recordMaxDuration;
@property (nonatomic, assign) NSTimeInterval recordMaxDuration;


/**
 *  输入框的占位符
 */
//: @property (nonatomic, copy) NSString *placeholder;
@property (nonatomic, copy) NSString *placeholder;


/**
 *  输入框能容纳的最大字符长度
 */
//: @property (nonatomic, assign) NSInteger inputMaxLength;
@property (nonatomic, assign) NSInteger inputMaxLength;


/**
 *  cell 的背景色
 */
//: @property (nonatomic, strong) UIColor *cellBackgroundColor;
@property (nonatomic, strong) UIColor *cellBackgroundColor;


/**
 *  头像类型
 */
//: @property (nonatomic, assign) NIMKitAvatarType avatarType;
@property (nonatomic, assign) NIMKitAvatarType avatarType;


/**
 *  昵称字体
 */
//: @property (nonatomic, strong) UIFont *nickFont;
@property (nonatomic, strong) UIFont *nickFont;

/**
 *  已读回执字体
 */
//: @property (nonatomic, strong) UIFont *receiptFont;
@property (nonatomic, strong) UIFont *receiptFont;

/**
 *  昵称颜色
 */
//: @property (nonatomic, strong) UIColor *nickColor;
@property (nonatomic, strong) UIColor *nickColor;


/**
 *  已读回执颜色
 */
//: @property (nonatomic, strong) UIColor *receiptColor;
@property (nonatomic, strong) UIColor *receiptColor;


/**
 *  左侧气泡设置
 */
//: @property (nonatomic, strong) CCCKitSettings *leftBubbleSettings;
@property (nonatomic, strong) MastheadSettings *leftBubbleSettings;

/**
 *  右侧气泡设置
 */
//: @property (nonatomic, strong) CCCKitSettings *rightBubbleSettings;
@property (nonatomic, strong) MastheadSettings *rightBubbleSettings;


/*默认内置配置*/

//: - (NSArray *)defaultMediaItems;
- (NSArray *)cellItems;

//: - (NSArray *)defaultMenuItemsWithMessage:(NIMMessage *)message;
- (NSArray *)keySize:(NIMMessage *)message;

//: - (CGFloat)maxNotificationTipPadding;
- (CGFloat)sumRangeWindow;


/*根据消息取到配置*/

//: - (CCCKitSetting *)setting:(NIMMessage *)message;
- (CenterShould *)info:(NIMMessage *)message;


/*被回复消息取到配置*/

//: - (CCCKitSetting *)repliedSetting:(NIMMessage *)message;
- (CenterShould *)maxDown:(NIMMessage *)message;

//: @end
@end




/**
 *  组件 UI 设置
 */
//: @interface CCCKitSettings : NSObject
@interface MastheadSettings : NSObject

/**
 *  文本类型消息设置
 */
//: @property (nonatomic, strong) CCCKitSetting *textSetting;
@property (nonatomic, strong) CenterShould *textSetting;

/**
 *  音频类型消息设置
 */
//: @property (nonatomic, strong) CCCKitSetting *audioSetting;
@property (nonatomic, strong) CenterShould *audioSetting;

/**
 *  视频类型消息设置
 */
//: @property (nonatomic, strong) CCCKitSetting *videoSetting;
@property (nonatomic, strong) CenterShould *videoSetting;

/**
 *  文件类型消息设置
 */
//: @property (nonatomic, strong) CCCKitSetting *fileSetting;
@property (nonatomic, strong) CenterShould *fileSetting;

/**
 *  图片类型消息设置
 */
//: @property (nonatomic, strong) CCCKitSetting *imageSetting;
@property (nonatomic, strong) CenterShould *imageSetting;

/**
 *  地理位置类型消息设置
 */
//: @property (nonatomic, strong) CCCKitSetting *locationSetting;
@property (nonatomic, strong) CenterShould *locationSetting;

/**
 *  提示类型消息设置
 */
//: @property (nonatomic, strong) CCCKitSetting *tipSetting;
@property (nonatomic, strong) CenterShould *tipSetting;

/**
 *  Rtc话单类型消息设置
 */
//: @property (nonatomic, strong) CCCKitSetting *rtcCallRecordSetting;
@property (nonatomic, strong) CenterShould *rtcCallRecordSetting;

/**
 *  无法识别类型消息设置
 */
//: @property (nonatomic, strong) CCCKitSetting *unsupportSetting;
@property (nonatomic, strong) CenterShould *unsupportSetting;

/**
 *  群组通知类型通知消息设置
 */
//: @property (nonatomic, strong) CCCKitSetting *teamNotificationSetting;
@property (nonatomic, strong) CenterShould *teamNotificationSetting;

/**
 *  群组通知类型通知消息设置
 */
//: @property (nonatomic, strong) CCCKitSetting *superTeamNotificationSetting;
@property (nonatomic, strong) CenterShould *superTeamNotificationSetting;

/**
 *  聊天室类型类型通知消息设置
 */
//: @property (nonatomic, strong) CCCKitSetting *chatroomNotificationSetting;
@property (nonatomic, strong) CenterShould *chatroomNotificationSetting;

/**
 *  网络电话类型类型通知消息设置
 */
//: @property (nonatomic, strong) CCCKitSetting *netcallNotificationSetting;
@property (nonatomic, strong) CenterShould *netcallNotificationSetting;

/**
 *  被回复消息的设置
 */
//: @property (nonatomic, strong) CCCKitSetting *repliedSetting;
@property (nonatomic, strong) CenterShould *repliedSetting;


//: @end
@end