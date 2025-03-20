
#import <Foundation/Foundation.h>

NSString *StringFromRelaxData(Byte *data);


//: class should be subclass of NIMLayoutConfig
Byte str_contestInsectData[] = {43, 43, 4, 127, 103, 105, 102, 110, 111, 67, 116, 117, 111, 121, 97, 76, 77, 73, 78, 32, 102, 111, 32, 115, 115, 97, 108, 99, 98, 117, 115, 32, 101, 98, 32, 100, 108, 117, 111, 104, 115, 32, 115, 115, 97, 108, 99, 78};


//: \"未知消息\"
Byte str_foreheadStatuteData[] = {67, 14, 10, 185, 87, 180, 122, 56, 200, 20, 34, 175, 129, 230, 136, 182, 230, 165, 159, 231, 170, 156, 230, 34, 47};

// __DEBUG__
// __CLOSE_PRINT__
//
// Indicator.m
// Indicator
//
//  Created by amao on 8/14/15.
//  Copyright (c) 2015 NetEase. All rights reserved.
//

// __M_A_C_R_O__
//: #import "AppleProjectKit.h"
#import "Indicator.h"
//: #import "AAAKitTimerHolder.h"
#import "ToiletKitHolder.h"
//: #import "BBBKitNotificationFirer.h"
#import "ContainerName.h"
//: #import "CCCKitDataProviderImpl.h"
#import "MetadataImpl.h"
//: #import "CCCCellLayoutConfig.h"
#import "OffConfig.h"
//: #import "BBBKitInfoFetchOption.h"
#import "TitleOption.h"
//: #import "NSBundle+AppleProjectKit.h"
#import "NSBundle+Indicator.h"
//: #import "NSString+AppleProjectKit.h"
#import "NSString+Indicator.h"
//: #import "CCCChatUIManager.h"
#import "ColorEnable.h"

//: extern NSString *const NIMKitUserInfoHasUpdatedNotification;
extern NSString *const k_pointName;
//: extern NSString *const NIMKitTeamInfoHasUpdatedNotification;
extern NSString *const k_keyFlexibleText;


//: @interface AppleProjectKit(){
@interface Indicator(){
    //: NSRegularExpression *_urlRegex;
    NSRegularExpression *_urlRegex;
}
//: @property (nonatomic,strong) BBBKitNotificationFirer *firer;
@property (nonatomic,strong) ContainerName *firer;
//: @property (nonatomic,strong) id<CCCCellLayoutConfig> layoutConfig;
@property (nonatomic,strong) id<OffConfig> layoutConfig;
//: @end
@end


//: @implementation AppleProjectKit
@implementation Indicator
//: - (instancetype)init
- (instancetype)init
{
    //: if (self = [super init]) {
    if (self = [super init]) {
        //: _firer = [[BBBKitNotificationFirer alloc] init];
        _firer = [[ContainerName alloc] init];
        //: _provider = [[CCCKitDataProviderImpl alloc] init]; 
        _provider = [[MetadataImpl alloc] init]; //默认使用 Indicator 的实现
        //: _layoutConfig = [[CCCCellLayoutConfig alloc] init];
        _layoutConfig = [[OffConfig alloc] init];
        //: [self preloadNIMKitBundleResource];
        [self color];
    }
    //: return self;
    return self;
}

//: + (instancetype)sharedKit
+ (instancetype)reach
{
    //: static AppleProjectKit *instance = nil;
    static Indicator *instance = nil;
    //: static dispatch_once_t onceToken;
    static dispatch_once_t onceToken;
    //: _dispatch_once(&onceToken, ^{
    _dispatch_once(&onceToken, ^{
        //: instance = [[AppleProjectKit alloc] init];
        instance = [[Indicator alloc] init];
    //: });
    });
    //: return instance;
    return instance;
}

//: - (void)registerLayoutConfig:(CCCCellLayoutConfig *)layoutConfig
- (void)value:(OffConfig *)layoutConfig
{
    //: if ([layoutConfig isKindOfClass:[CCCCellLayoutConfig class]])
    if ([layoutConfig isKindOfClass:[OffConfig class]])
    {
        //: self.layoutConfig = layoutConfig;
        self.layoutConfig = layoutConfig;
    }
    //: else
    else
    {
        //: NSAssert(0, @"class should be subclass of NIMLayoutConfig");
        NSAssert(0, StringFromRelaxData(str_contestInsectData));
    }
}

//: - (NSBundle *)emoticonBundle {
- (NSBundle *)emoticonBundle {
    //: if (!_emoticonBundle) {
    if (!_emoticonBundle) {
        //: _emoticonBundle = [NSBundle nim_defaultEmojiBundle];
        _emoticonBundle = [NSBundle show];
    }
    //: return _emoticonBundle;
    return _emoticonBundle;
}

//: - (NSBundle *)languageBundle {
- (NSBundle *)languageBundle {
    //: if (!_languageBundle) {
    if (!_languageBundle) {
        //: _languageBundle = [NSBundle nim_defaultLanguageBundle];
        _languageBundle = [NSBundle by];
    }
    //: return _languageBundle;
    return _languageBundle;
}

//: - (id<CCCChatUIManager>)chatUIManager
- (id<ColorEnable>)chatUIManager
{
    //: return CCCChatUIManager.sharedManager;
    return ColorEnable.labelEnable;
}

//: - (id<CCCCellLayoutConfig>)layoutConfig
- (id<OffConfig>)layoutConfig
{
    //: return _layoutConfig;
    return _layoutConfig;
}

//: - (CCCKitConfig *)config
- (KitConfig *)config
{
    //不要放在 Indicator 初始化里面，因为 UIConfig 初始化会使用 NIMKit, 防止死循环
    //: if (!_config)
    if (!_config)
    {
        //: _config = [[CCCKitConfig alloc] init];
        _config = [[KitConfig alloc] init];
    }
    //: return _config;
    return _config;
}

//: - (void)notfiyUserInfoChanged:(NSArray *)userIds{
- (void)down:(NSArray *)userIds{
    //: if (!userIds.count) {
    if (!userIds.count) {
        //: return;
        return;
    }
    //: for (NSString *userId in userIds) {
    for (NSString *userId in userIds) {
        //: NIMSession *session = [NIMSession session:userId type:NIMSessionTypeP2P];
        NIMSession *session = [NIMSession session:userId type:NIMSessionTypeP2P];
        //: NIMKitFirerInfo *info = [[NIMKitFirerInfo alloc] init];
        TotalernationalityText *info = [[TotalernationalityText alloc] init];
        //: info.session = session;
        info.session = session;
        //: info.notificationName = NIMKitUserInfoHasUpdatedNotification;
        info.notificationName = k_pointName;
        //: [self.firer addFireInfo:info];
        [self.firer info:info];
    }
}

//: - (void)notifyTeamInfoChanged:(NSString *)teamId type:(NIMKitTeamType)type
- (void)notify:(NSString *)teamId anyIndependent:(NIMKitTeamType)type
{
    //: NIMKitFirerInfo *info = [[NIMKitFirerInfo alloc] init];
    TotalernationalityText *info = [[TotalernationalityText alloc] init];
    //: if (teamId.length) {
    if (teamId.length) {
        //: NIMSession *session = nil;
        NIMSession *session = nil;
        //: if (type == NIMKitTeamTypeNomal) {
        if (type == NIMKitTeamTypeNomal) {
            //: session = [NIMSession session:teamId type:NIMSessionTypeTeam];
            session = [NIMSession session:teamId type:NIMSessionTypeTeam];
        //: } else if (type == NIMKitTeamTypeSuper) {
        } else if (type == NIMKitTeamTypeSuper) {
            //: session = [NIMSession session:teamId type:NIMSessionTypeSuperTeam];
            session = [NIMSession session:teamId type:NIMSessionTypeSuperTeam];
        }
        //: info.session = session;
        info.session = session;
    }
    //: info.notificationName = NIMKitTeamInfoHasUpdatedNotification;
    info.notificationName = k_keyFlexibleText;
    //: [self.firer addFireInfo:info];
    [self.firer info:info];
}

//: - (void)notifyTeamMemebersChanged:(NSString *)teamId type:(NIMKitTeamType)type
- (void)quantity:(NSString *)teamId index:(NIMKitTeamType)type
{
    //: NIMKitFirerInfo *info = [[NIMKitFirerInfo alloc] init];
    TotalernationalityText *info = [[TotalernationalityText alloc] init];
    //: if (teamId.length) {
    if (teamId.length) {
        //: NIMSession *session = nil;
        NIMSession *session = nil;
        //: if (type == NIMKitTeamTypeNomal) {
        if (type == NIMKitTeamTypeNomal) {
            //: session = [NIMSession session:teamId type:NIMSessionTypeTeam];
            session = [NIMSession session:teamId type:NIMSessionTypeTeam];
        //: } else if (type == NIMKitTeamTypeSuper) {
        } else if (type == NIMKitTeamTypeSuper) {
            //: session = [NIMSession session:teamId type:NIMSessionTypeSuperTeam];
            session = [NIMSession session:teamId type:NIMSessionTypeSuperTeam];
        }
        //: info.session = session;
        info.session = session;
    }
    //: extern NSString *NIMKitTeamMembersHasUpdatedNotification;
    extern NSString *NIMKitTeamMembersHasUpdatedNotification;
    //: info.notificationName = NIMKitTeamMembersHasUpdatedNotification;
    info.notificationName = NIMKitTeamMembersHasUpdatedNotification;
    //: [self.firer addFireInfo:info];
    [self.firer info:info];
}

//: - (CCCKitInfo *)infoByUser:(NSString *)userId option:(BBBKitInfoFetchOption *)option
- (TitleInfo *)indoors:(NSString *)userId harvest:(TitleOption *)option
{
    //: CCCKitInfo *info = nil;
    TitleInfo *info = nil;
    //: if (self.provider && [self.provider respondsToSelector:@selector(infoByUser:option:)]) {
    if (self.provider && [self.provider respondsToSelector:@selector(indoors:harvest:)]) {
        //: info = [self.provider infoByUser:userId option:option];
        info = [self.provider indoors:userId harvest:option];
    }
    //: return info;
    return info;
}

//: - (CCCKitInfo *)infoByTeam:(NSString *)teamId option:(BBBKitInfoFetchOption *)option
- (TitleInfo *)text:(NSString *)teamId byLabel:(TitleOption *)option
{
    //: CCCKitInfo *info = nil;
    TitleInfo *info = nil;
    //: if (self.provider && [self.provider respondsToSelector:@selector(infoByTeam:option:)]) {
    if (self.provider && [self.provider respondsToSelector:@selector(text:byLabel:)]) {
        //: info = [self.provider infoByTeam:teamId option:option];
        info = [self.provider text:teamId byLabel:option];
    }
    //: return info;
    return info;

}

//: - (CCCKitInfo *)infoBySuperTeam:(NSString *)teamId option:(BBBKitInfoFetchOption *)option
- (TitleInfo *)noneShowOption:(NSString *)teamId viewMedia:(TitleOption *)option
{
    //: CCCKitInfo *info = nil;
    TitleInfo *info = nil;
    //: if (self.provider && [self.provider respondsToSelector:@selector(infoBySuperTeam:option:)]) {
    if (self.provider && [self.provider respondsToSelector:@selector(noneShowOption:viewMedia:)]) {
        //: info = [self.provider infoBySuperTeam:teamId option:option];
        info = [self.provider noneShowOption:teamId viewMedia:option];
    }
    //: return info;
    return info;

}

//: - (void)preloadNIMKitBundleResource {
- (void)color {
    //: dispatch_async(dispatch_get_main_queue(), ^{
    dispatch_async(dispatch_get_main_queue(), ^{
        //: [[AAAInputEmoticonManager sharedManager] start];
        [[DataOf telegram] tip];
    //: });
    });
}

//: - (NSString *)replyedContentWithMessage:(NIMMessage *)message
- (NSString *)limitState:(NIMMessage *)message
{
    //: NSString *info = nil;
    NSString *info = nil;

    //: if (!message)
    if (!message)
    {
        //: return @"\"未知消息\"".nim_localized;
        return StringFromRelaxData(str_foreheadStatuteData).trapLocalized;
    }

    //: if (self.provider && [self.provider respondsToSelector:@selector(replyedContentWithMessage:)]) {
    if (self.provider && [self.provider respondsToSelector:@selector(limitState:)]) {
        //: info = [self.provider replyedContentWithMessage:message];
        info = [self.provider limitState:message];
    }
    //: return info;
    return info;
}

//: @end
@end

Byte * RelaxDataToCache(Byte *data) {
    int calendar = data[0];
    int cellThat = data[1];
    int backgroundRitual = data[2];
    if (!calendar) return data + backgroundRitual;
    for (int i = 0; i < cellThat / 2; i++) {
        int begin = backgroundRitual + i;
        int end = backgroundRitual + cellThat - i - 1;
        Byte temp = data[begin];
        data[begin] = data[end];
        data[end] = temp;
    }
    data[0] = 0;
    data[backgroundRitual + cellThat] = 0;
    return data + backgroundRitual;
}

NSString *StringFromRelaxData(Byte *data) {
    return [NSString stringWithUTF8String:(char *)RelaxDataToCache(data)];
}  
