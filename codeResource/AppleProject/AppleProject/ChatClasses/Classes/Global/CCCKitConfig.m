//
//  CCCKitConfig.m
// AppleProjectKit
//
//  Created by chris on 2017/10/25.
//  Copyright © 2017年 NetEase. All rights reserved.
//

#import "CCCKitConfig.h"
#import "CCCGlobalMacro.h"
#import "BBBMediaItem.h"
#import "UIImage+AppleProjectKit.h"
#import <NIMSDK/NIMSDK.h>
#import "AppleProjectKit.h"

@interface CCCKitSettings()
{
    BOOL _isRight;
}

- (instancetype)init:(BOOL)isRight;

@end


@implementation CCCKitConfig

- (instancetype) init
{
    self = [super init];
    if (self)
    {
        [self applyDefaultSettings];
    }
    return self;
}

- (NSArray *)defaultMediaItems
{
    return @[[BBBMediaItem item:@"onTapMediaItemPicture:"
           normalImage:[UIImage imageNamed:@"bk_media_picture_normal"]
         selectedImage:[UIImage imageNamed:@"bk_media_picture_normal"]
                 title:LangKey(@"message_send_album")],//@"相册".nim_localized
    
    [BBBMediaItem item:@"onTapMediaItemShoot:"
           normalImage:[UIImage imageNamed:@"bk_media_shoot_normal"]
         selectedImage:[UIImage imageNamed:@"bk_media_shoot_normal"]
                 title:LangKey(@"message_send_camera")],//@"拍摄".nim_localized
    
    [BBBMediaItem item:@"onTapMediaItemLocation:"
           normalImage:[UIImage imageNamed:@"bk_media_position_normal"]
         selectedImage:[UIImage imageNamed:@"bk_media_position_normal"]
                 title:LangKey(@"Audios")],//@"位置".nim_localized
             
    ];
}

- (NSArray *)defaultMenuItemsWithMessage:(NIMMessage *)message
{
    NSMutableArray *menuItems = [NSMutableArray array];
    if (message.messageType == NIMMessageTypeText)
    {
        [menuItems addObject:[BBBMediaItem item:@"onTapMenuItemCopy:"
                                    normalImage:[UIImage imageNamed:@"bk_media_picture_normal"]
                                  selectedImage:[UIImage imageNamed:@"bk_media_picture_pressed"]
                                          title:LangKey(@"复制")]];
    }
    
    BBBMediaItem *delItem = [BBBMediaItem item:@"onTapMenuItemDelete:"
                                normalImage:[UIImage imageNamed:@"bk_media_shoot_normal"]
                              selectedImage:[UIImage imageNamed:@"bk_media_shoot_pressed"]
                                      title:@"删除".nim_localized];
        
    [menuItems addObject:delItem];
    return menuItems;
}

- (CGFloat)maxNotificationTipPadding{
    return 20.f;
}


- (void)applyDefaultSettings
{
    _messageInterval = 300;
    _messageLimit    = 20;
    _recordMaxDuration = 60.f;
    _placeholder = @"";//@"请输入消息".nim_localized;
    _inputMaxLength = 1000;
    _nickFont  = [UIFont boldSystemFontOfSize:15];
    _nickColor = RGB_COLOR_String(@"#333333");
    _receiptFont  = [UIFont systemFontOfSize:13.0]; 
    _receiptColor = [UIColor darkGrayColor];
    _avatarType = NIMKitAvatarTypeRounded;
    _cellBackgroundColor = NEEKIT_UIColorFromRGB(0xE4E7EC);
    _leftBubbleSettings  = [[CCCKitSettings alloc] init:NO];
    _rightBubbleSettings = [[CCCKitSettings alloc] init:YES];
}

- (CCCKitSetting *)setting:(NIMMessage *)message
{
    CCCKitSettings *settings = message.isOutgoingMsg? self.rightBubbleSettings : self.leftBubbleSettings;
    switch (message.messageType) {
        case NIMMessageTypeText:
            return settings.textSetting;
        case NIMMessageTypeImage:
            return settings.imageSetting;
        case NIMMessageTypeLocation:
            return settings.locationSetting;
        case NIMMessageTypeAudio:
            return settings.audioSetting;
        case NIMMessageTypeVideo:
            return settings.videoSetting;
        case NIMMessageTypeFile:
            return settings.fileSetting;
        case NIMMessageTypeTip:
            return settings.tipSetting;
        case NIMMessageTypeRtcCallRecord:
            return settings.rtcCallRecordSetting;
        case NIMMessageTypeNotification:
        {
            NIMNotificationObject *object = (NIMNotificationObject *)message.messageObject;
            switch (object.notificationType)
            {
                case NIMNotificationTypeTeam:
                    return settings.teamNotificationSetting;
                case NIMNotificationTypeSuperTeam:
                    return settings.superTeamNotificationSetting;
                case NIMNotificationTypeChatroom:
                    return settings.chatroomNotificationSetting;
                case NIMNotificationTypeNetCall:
                    return settings.netcallNotificationSetting;
                default:
                    break;
            }
            break;
        }
        default:
            break;
    }
    return settings.unsupportSetting;
}

- (CCCKitSetting *)repliedSetting:(NIMMessage *)message
{
    CCCKitSettings *settings = message.isOutgoingMsg? self.rightBubbleSettings : self.leftBubbleSettings;
    return settings.repliedSetting;
}

@end


@implementation CCCKitSettings

- (instancetype)init:(BOOL)isRight
{
    self = [super init];
    if (self)
    {
        _isRight = isRight;
        [self applyDefaultSettings];
    }
    return self;
}

- (void)applyDefaultSettings
{
    [self applyDefaultTextSettings];
    [self applyDefaultAudioSettings];
    [self applyDefaultVideoSettings];
    [self applyDefaultFileSettings];
    [self applyDefaultImageSettings];
    [self applyDefaultLocationSettings];
    [self applyDefaultTipSettings];
    [self applyDefaultUnsupportSettings];
    [self applyDefaultTeamNotificationSettings];
    [self applyDefaultSuperTeamNotificationSettings];
    [self applyDefaultChatroomNotificationSettings];
    [self applyDefaultNetcallNotificationSettings];
    [self applyDefaultRepliedSettings];
    [self applyDefaultRtcCallRecordSettings];
}

- (void)applyDefaultRepliedSettings
{
    _repliedSetting = [[CCCKitSetting alloc] init];
    _repliedSetting.contentInsets = _isRight? UIEdgeInsetsFromString(@"{9,11,0,15}") : UIEdgeInsetsFromString(@"{9,15,0,9}");
    _repliedSetting.replyedTextColor = _isRight? NEEKIT_UIColorFromRGB(0x333333) : NEEKIT_UIColorFromRGB(0x333333);;
    _repliedSetting.replyedFont      = [UIFont systemFontOfSize:14];
    _repliedSetting.showAvatar = YES;
}

- (void)applyDefaultTextSettings
{
    _textSetting = [[CCCKitSetting alloc] init:_isRight];
    _textSetting.contentInsets = _isRight? UIEdgeInsetsFromString(@"{5,11,5,15}") : UIEdgeInsetsFromString(@"{5,15,5,9}");
    _textSetting.textColor = _isRight? NEEKIT_UIColorFromRGB(0x333333) : NEEKIT_UIColorFromRGB(0x333333);
    _textSetting.font      = [UIFont systemFontOfSize:16];
    _textSetting.showAvatar = YES;
}

- (void)applyDefaultAudioSettings
{
    _audioSetting = [[CCCKitSetting alloc] init:_isRight];
    _audioSetting.contentInsets = _isRight? UIEdgeInsetsFromString(@"{8,12,9,14}") : UIEdgeInsetsFromString(@"{8,13,9,12}");
    _audioSetting.textColor = _isRight? NEEKIT_UIColorFromRGB(0x333333) : NEEKIT_UIColorFromRGB(0x333333);
    _audioSetting.font      = [UIFont systemFontOfSize:14];
    _audioSetting.showAvatar = YES;
}

- (void)applyDefaultVideoSettings
{
    _videoSetting = [[CCCKitSetting alloc] init:_isRight];
    _videoSetting.contentInsets = _isRight? UIEdgeInsetsFromString(@"{3,3,3,8}") : UIEdgeInsetsFromString(@"{3,8,3,3}");
    _videoSetting.font      = [UIFont systemFontOfSize:14];
    _videoSetting.showAvatar = YES;
}

- (void)applyDefaultFileSettings
{
    _fileSetting = [[CCCKitSetting alloc] init:_isRight];
    _fileSetting.contentInsets = _isRight? UIEdgeInsetsFromString(@"{3,3,3,8}") : UIEdgeInsetsFromString(@"{3,8,3,3}");
    _fileSetting.font      = [UIFont systemFontOfSize:14];
    _fileSetting.showAvatar = YES;
}

- (void)applyDefaultImageSettings
{
    _imageSetting = [[CCCKitSetting alloc] init:_isRight];
    _imageSetting.contentInsets = _isRight? UIEdgeInsetsFromString(@"{3,3,3,8}") : UIEdgeInsetsFromString(@"{3,8,3,3}");
    _imageSetting.showAvatar = YES;
}

- (void)applyDefaultLocationSettings
{
    _locationSetting = [[CCCKitSetting alloc] init:_isRight];
    _locationSetting.contentInsets = _isRight? UIEdgeInsetsFromString(@"{3,3,3,8}") : UIEdgeInsetsFromString(@"{3,8,3,3}");
    _locationSetting.textColor = NEEKIT_UIColorFromRGB(0x333333);
    _locationSetting.font      = [UIFont systemFontOfSize:12];
    _locationSetting.showAvatar = YES;
}

- (void)applyDefaultTipSettings
{
    _tipSetting = [[CCCKitSetting alloc] init:_isRight];
    _tipSetting.contentInsets = UIEdgeInsetsZero;
    _tipSetting.textColor = NEEKIT_UIColorFromRGB(0x333333);
    _tipSetting.font  = [UIFont systemFontOfSize:10.f];
    _tipSetting.showAvatar = NO;
    UIImage *backgroundImage = [[UIImage imageNamed:@"icon_session_time_bg"] resizableImageWithCapInsets:UIEdgeInsetsFromString(@"{8,20,8,20}") resizingMode:UIImageResizingModeStretch];;
    _tipSetting.normalBackgroundImage    = backgroundImage;
    _tipSetting.highLightBackgroundImage = backgroundImage;
}

- (void)applyDefaultRtcCallRecordSettings
{
    _rtcCallRecordSetting = [[CCCKitSetting alloc] init:_isRight];
    _rtcCallRecordSetting.contentInsets = _isRight? UIEdgeInsetsFromString(@"{9,11,9,15}") : UIEdgeInsetsFromString(@"{9,15,9,9}");
    _rtcCallRecordSetting.textColor = _isRight? NEEKIT_UIColorFromRGB(0x333333) : NEEKIT_UIColorFromRGB(0x333333);
    _rtcCallRecordSetting.font      = [UIFont systemFontOfSize:16];
    _rtcCallRecordSetting.showAvatar = YES;
}


- (void)applyDefaultUnsupportSettings
{
    _unsupportSetting = [[CCCKitSetting alloc] init:_isRight];
    _unsupportSetting.contentInsets = _isRight? UIEdgeInsetsFromString(@"{11,11,9,15}") : UIEdgeInsetsFromString(@"{11,15,9,9}");
    _unsupportSetting.textColor = _isRight? NEEKIT_UIColorFromRGB(0x333333) : NEEKIT_UIColorFromRGB(0x333333);
    _unsupportSetting.font      = [UIFont systemFontOfSize:14];
    _unsupportSetting.showAvatar = YES;
}


- (void)applyDefaultTeamNotificationSettings
{
    _teamNotificationSetting = [[CCCKitSetting alloc] init:_isRight];
    _teamNotificationSetting.contentInsets = UIEdgeInsetsZero;
    _teamNotificationSetting.textColor = NEEKIT_UIColorFromRGB(0x333333);
    _teamNotificationSetting.font      = [UIFont systemFontOfSize:10];
    _teamNotificationSetting.showAvatar = NO;
    UIImage *backgroundImage = [[UIImage imageNamed:@"icon_session_time_bg"] resizableImageWithCapInsets:UIEdgeInsetsFromString(@"{8,20,8,20}") resizingMode:UIImageResizingModeStretch];
    _teamNotificationSetting.normalBackgroundImage    = backgroundImage;
    _teamNotificationSetting.highLightBackgroundImage = backgroundImage;
}

- (void)applyDefaultSuperTeamNotificationSettings
{
    _superTeamNotificationSetting = [[CCCKitSetting alloc] init:_isRight];
    _superTeamNotificationSetting.contentInsets = UIEdgeInsetsZero;
    _superTeamNotificationSetting.textColor = NEEKIT_UIColorFromRGB(0x333333);
    _superTeamNotificationSetting.font      = [UIFont systemFontOfSize:10];
    _superTeamNotificationSetting.showAvatar = NO;
    UIImage *backgroundImage = [[UIImage imageNamed:@"icon_session_time_bg"] resizableImageWithCapInsets:UIEdgeInsetsFromString(@"{8,20,8,20}") resizingMode:UIImageResizingModeStretch];
    _superTeamNotificationSetting.normalBackgroundImage    = backgroundImage;
    _superTeamNotificationSetting.highLightBackgroundImage = backgroundImage;
}

- (void)applyDefaultChatroomNotificationSettings
{
    _chatroomNotificationSetting = [[CCCKitSetting alloc] init:_isRight];
    _chatroomNotificationSetting.contentInsets = UIEdgeInsetsZero;
    _chatroomNotificationSetting.textColor = NEEKIT_UIColorFromRGB(0x333333);
    _chatroomNotificationSetting.font      = [UIFont systemFontOfSize:10];
    _chatroomNotificationSetting.showAvatar = NO;
    UIImage *backgroundImage = [[UIImage imageNamed:@"icon_session_time_bg"] resizableImageWithCapInsets:UIEdgeInsetsFromString(@"{8,20,8,20}") resizingMode:UIImageResizingModeStretch];
    _chatroomNotificationSetting.normalBackgroundImage    = backgroundImage;
    _chatroomNotificationSetting.highLightBackgroundImage = backgroundImage;
}

- (void)applyDefaultNetcallNotificationSettings
{
    _netcallNotificationSetting = [[CCCKitSetting alloc] init:_isRight];
    _netcallNotificationSetting.contentInsets = _isRight? UIEdgeInsetsFromString(@"{11,11,9,15}") : UIEdgeInsetsFromString(@"{11,15,9,9}");
    _netcallNotificationSetting.textColor = _isRight? NEEKIT_UIColorFromRGB(0x333333) : NEEKIT_UIColorFromRGB(0x333333);
    _netcallNotificationSetting.font      = [UIFont systemFontOfSize:14];
    _netcallNotificationSetting.showAvatar = YES;
}


@end





