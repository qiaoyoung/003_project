//
//  CCCConfig.h
//  NIM
//
//  Created by amao on 4/21/15.
//  Copyright (c) 2015 Netease. All rights reserved.
//

#import <Foundation/Foundation.h>

//此处 apiURL 为网易云信 Demo 应用服务器地址，更换 appkey 后，请更新为应用自己的服务器接口地址，并提供相关接口服
@class NTESRedPacketConfig;

@interface CCCConfig : NSObject
+ (instancetype)sharedConfig;

@property (nonatomic,copy)    NSString    *appKey;
@property (nonatomic,copy)    NSString    *chatroomAppKey;
@property (nonatomic,copy)    NSString    *apiURL;
@property (nonatomic,copy)    NSString    *apnsCername;
@property (nonatomic,copy)    NSString    *pkCername;
@property (nonatomic,strong)  NTESRedPacketConfig *redPacketConfig;
@property (nonatomic,copy)    NSString    *chatroomListURL;
@property (nonatomic,copy)   NSString     *domainURL;//主域名url
@property (assign) BOOL allowAutoLogin; //允许自动登录

@property (nonatomic,copy)   NSString     *short_domainURL;//主域名url

@property (nonatomic,strong)  NSMutableDictionary *Gdic;

- (void)registerConfig:(NSDictionary *)config;
@end



@interface NTESRedPacketConfig : NSObject

@property (nonatomic,assign)  BOOL  useOnlineEnv;

@property (nonatomic,strong)  NSString *aliPaySchemeUrl;

@property (nonatomic,strong)  NSString *weChatSchemeUrl;

@end
