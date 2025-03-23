// __DEBUG__
// __CLOSE_PRINT__
//
//  Indicator.h
// Indicator
//
//  Created by amao on 8/14/15.
//  Copyright (c) 2015 NetEase. All rights reserved.
//
//! Project version number for NIMKit.

// __M_A_C_R_O__
//: #import <Foundation/Foundation.h>
#import <Foundation/Foundation.h>
//: #import "NTESLanguageManager.h"
#import "MaxInformation.h"
//: #import <NIMSDK/NIMSDK.h>
#import <NIMSDK/NIMSDK.h>
//: #import "CCCKitInfo.h"
#import "TitleInfo.h"
//: #import "BBBMediaItem.h"            //多媒体面板对象
#import "WithMin.h"            //多媒体面板对象
//: #import "BBBMessageModel.h"         //message Wrapper
#import "AccumulationCenter.h"         //message Wrapper
//: #import "CCCKitMessageProvider.h"
#import "ShowFlush.h"
//: #import "UserCellConfig.h"           //message cell配置协议
#import "UserCellConfig.h"           //message cell配置协议
//: #import "UserInputProtocol.h"        //输入框回调
#import "UserInputProtocol.h"        //输入框回调
//: #import "CCCKitDataProvider.h"      //APP内容提供器
#import "IronedMode.h"      //APP内容提供器
//: #import "UserMessageCellProtocol.h"  //message cell事件回调
#import "UserMessageCellProtocol.h"  //message cell事件回调
//: #import "CCCSessionConfig.h"        //会话页面配置
#import "FromConfig.h"        //会话页面配置
//: #import "BBBKitEvent.h"             //点击事件封装类
#import "MightHaveBeenAdd.h"             //点击事件封装类
//: #import "CCCCellLayoutConfig.h"
#import "OffConfig.h"
//: #import "CCCSessionMessageContentView.h"
#import "ViewAggregationHeliogramSittingControl.h"
//: #import "CCCKitConfig.h"
#import "KitConfig.h"
//: #import "CCCSessionViewController.h"
#import "TutorialViewController.h"
//: #import "BBBSessionListViewController.h"
#import "ShouldViewController.h"
//: #import "CCCKitIndependentModeExtraInfo.h"
#import "FromInfo.h"
//: #import "UserChatUIManagerProtocol.h"
#import "UserChatUIManagerProtocol.h"
//: #import "CCCCollectionViewLeftAlignedLayout.h"
#import "MinFlowLayout.h"
//: #import "AAAKitQuickCommentUtil.h"
#import "CaseOfMaxTeam.h"

//: extern double NIMKitVersionNumber;
extern double k_redCallName;

//! Project version string for NIMKit.
//: extern const unsigned char NIMKitVersionString[];
extern const unsigned char k_sizeTitle[];

// In this header, you should import all the public headers of your framework using statements like #import <NIMKit/PublicHeader.h>



/**
 *  基础Model
 */




/**
 *  协议
 */
/**
 *  消息cell的视觉模板
 */


/**
 *  UI 配置器
 */


/**
 *  会话页
 */


/**
 *  会话列表页
 */


/*
 *  独立聊天室模式下需注入的信息
 */



/**
 * 聊天常用UI方法
 */


/**
 * 快捷评论
 */



//: @interface AppleProjectKit : NSObject
@interface Indicator : NSObject

//: + (instancetype)sharedKit;
+ (instancetype)reach;

/**
 *  注册自定义的排版配置，通过注册自定义排版配置来实现自定义消息的定制化排版
 */
//: - (void)registerLayoutConfig:(CCCCellLayoutConfig *)layoutConfig;
- (void)value:(OffConfig *)layoutConfig;

/**
 *  返回当前的排版配置
 */
//: - (id<CCCCellLayoutConfig>)layoutConfig;
- (id<OffConfig>)layoutConfig;

/**
 *  UI 配置器
 */
//: @property (nonatomic,strong) CCCKitConfig *config;
@property (nonatomic,strong) KitConfig *config;

/**
 *  内容提供者，由上层开发者注入。如果没有则使用默认 provider
 */
//: @property (nonatomic,strong) id<CCCKitDataProvider> provider;
@property (nonatomic,strong) id<IronedMode> provider;

/**
 *  由于在独立聊天室模式下, IM 部分服务不可用，需要上层注入一些额外信息供组件显示使用。 默认为 nil，上层在独立聊天室模式下注入，注入时需要创建此对象并注入对象相关字段信息。
 *
 *  此字段需要配合默认的 IronedMode ( MetadataImpl ) 使用，如果上层自己定义了 provider ， 则忽略此字段。
 */
//: @property (nonatomic,strong) CCCKitIndependentModeExtraInfo *independentModeExtraInfo;
@property (nonatomic,strong) FromInfo *independentModeExtraInfo;

/**
 * 聊天模块常用UI方法
 */
//: @property (nonatomic, readonly) id<CCCChatUIManager> chatUIManager;
@property (nonatomic, readonly) id<ColorEnable> chatUIManager;

/**
 *  NIMKit表情资源所在的 bundle 名称。
 */
//: @property (nonatomic, copy) NSBundle *emoticonBundle;
@property (nonatomic, copy) NSBundle *emoticonBundle;

/**
 *  NIMKit语言所在Bundle, 启动的时候根据系统语言会选择对应的语言包，后面用户可替换
 */
//: @property (nonatomic, strong) NSBundle * languageBundle;
@property (nonatomic, strong) NSBundle * languageBundle;

/**
 *  NIMKit语言所在Table，默认 language
 */
//: @property (nonatomic, copy) NSString * languageTable;
@property (nonatomic, copy) NSString * languageTable;

/**
 *  NIMKit语言所在Table，默认 获取系统语言
 */
//: @property (nonatomic, copy) NSString * defaultLanguage;
@property (nonatomic, copy) NSString * defaultLanguage;

/**
 *  用户信息变更通知接口
 *
 *  @param userIds 用户 id 集合
 */
//: - (void)notfiyUserInfoChanged:(NSArray *)userIds;
- (void)down:(NSArray *)userIds;

/**
 *  群信息变更通知接口
 *
 *  @param teamIds 群 id 集合
 */
//: - (void)notifyTeamInfoChanged:(NSString *)teamId type:(NIMKitTeamType)type;
- (void)notify:(NSString *)teamId anyIndependent:(NIMKitTeamType)type;


/**
 *  群成员变更通知接口
 *
 *  @param teamIds 群id
 */
//: - (void)notifyTeamMemebersChanged:(NSString *)teamId type:(NIMKitTeamType)type;
- (void)quantity:(NSString *)teamId index:(NIMKitTeamType)type;

/**
 *  返回用户信息
 */
//: - (CCCKitInfo *)infoByUser:(NSString *)userId
- (TitleInfo *)indoors:(NSString *)userId
                    //: option:(BBBKitInfoFetchOption *)option;
                    harvest:(TitleOption *)option;

/**
 *  返回群信息
 */
//: - (CCCKitInfo *)infoByTeam:(NSString *)teamId
- (TitleInfo *)text:(NSString *)teamId
                    //: option:(BBBKitInfoFetchOption *)option;
                    byLabel:(TitleOption *)option;

/**
 *  返回群信息
 */
//: - (CCCKitInfo *)infoBySuperTeam:(NSString *)teamId
- (TitleInfo *)noneShowOption:(NSString *)teamId
                         //: option:(BBBKitInfoFetchOption *)option;
                         viewMedia:(TitleOption *)option;

/**
 *  @param message 被回复的消息
 *
 *  @return 格式化的内容
 */
//: - (NSString *)replyedContentWithMessage:(NIMMessage *)message;
- (NSString *)limitState:(NIMMessage *)message;

//: @end
@end
