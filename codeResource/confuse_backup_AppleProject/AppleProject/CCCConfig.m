//
//  CCCConfig.m
//  NIM
//
//  Created by amao on 4/21/15.
//  Copyright (c) 2015 Netease. All rights reserved.
//

#import "CCCConfig.h"
#import "RestUtil.h"


@interface CCCConfig ()

@property (nonatomic,copy)    NSString    *hostFrom;
@property (nonatomic,copy)    NSString    *hostFrom2;

@end

@implementation CCCConfig
+ (instancetype)sharedConfig
{
    static CCCConfig *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[CCCConfig alloc] init];
    });
    return instance;
}

- (instancetype)init
{
    if (self = [super init])
    {
        _appKey = @"bb423e522c32002210fe5623f81a89ea";//本项目使用
        
        _apiURL = @"https://app.netease.im/api";
#ifdef DEBUG
        //        _apnsCername = @"DEVELOPER";
        _apnsCername = @"voice_ip_push_cers_test";
        _pkCername = @"pushkit_voice_test";

#else
        _apnsCername = @"voice_ip_push_cers";
        _pkCername = @"pushkit_voice";

#endif
        
        _redPacketConfig = [[NTESRedPacketConfig alloc] init];
        
        
        _allowAutoLogin = YES; //如果网上的host和本地的一致，允许自动登录
        
        _Gdic = [NSMutableDictionary dictionary];
        
        // 打包OSS-1
        self.hostFrom = @"https://japan-oss.s3.ap-east-1.amazonaws.com/appleriben26.txt";
        
        // 打包OSS-2
        self.hostFrom2 = @"https://storage.googleapis.com/app-down/appleriben26.txt";
        
        //保底域名
        NSString *PreSetHost = @"https://apple.akunjapan0206chat.com";//⚠️警告：最后面不能有斜杠/

        //如果包含了api则不处理了，否则就要加上api
        if ([PreSetHost containsString:@"/api"])
        {} else {
            if ([PreSetHost hasSuffix:@"/"]) {
                PreSetHost = [PreSetHost stringByAppendingString:@"api"];
            } else {
                PreSetHost = [PreSetHost stringByAppendingString:@"/api"];
            }
        }
        self.domainURL = PreSetHost;
        
        
        NSString *defaultHost = [[NSUserDefaults standardUserDefaults] stringForKey:@"HOST_KEY"] ? :@"";//本地存储的host
        if (defaultHost.length > 0){
            //如果包含了api则不处理了，否则就要加上api
            if ([defaultHost containsString:@"/api"])
            {} else {
                if ([defaultHost hasSuffix:@"/"]) {
                    defaultHost = [defaultHost stringByAppendingString:@"api"];
                } else {
                    defaultHost = [defaultHost stringByAppendingString:@"/api"];
                }
            }
            self.domainURL = defaultHost;
        }
        
        
        if ([self.domainURL containsString:@"/api"]){
            NSString *short_domainURL = [self.domainURL stringByReplacingOccurrencesOfString:@"/api" withString:@""];
            short_domainURL = [short_domainURL stringByReplacingOccurrencesOfString:@"https://" withString:@""];
            self.short_domainURL = short_domainURL;
        }
 
        void (^hostBlock)(NSString *HOST) = ^(NSString *HOST){
           
            if (!HOST || HOST.length < 5) {
                HOST = [[NSString alloc] initWithString:PreSetHost];
                NSLog(@"========>警告⚠️读不到网上的host");
            }
            
            if ([HOST containsString:defaultHost]) {
                _allowAutoLogin = YES; //如果网上的host和本地的一致，允许自动登录
            }
            else
            {
                _allowAutoLogin = NO; //如果网上的host和本地的不一致，则禁止🈲️自动登录
                [[NSUserDefaults standardUserDefaults] setObject:HOST forKey:@"HOST_KEY"];
            }
            
            
            //如果包含了api则不处理了，否则就要加上api
            if ([HOST containsString:@"/api"])
            {} else {
                if ([HOST hasSuffix:@"/"]) {
                    HOST = [HOST stringByAppendingString:@"api"];
                } else {
                    HOST = [HOST stringByAppendingString:@"/api"];
                }
            }
                    
//            self.domainURL = [[NSString alloc] initWithString:HOST];//设置host主域名
//            
//            if ([self.domainURL containsString:@"/api"]){
//                NSString *short_domainURL = [self.domainURL stringByReplacingOccurrencesOfString:@"/api" withString:@""];
//                short_domainURL = [short_domainURL stringByReplacingOccurrencesOfString:@"https://" withString:@""];
//                self.short_domainURL = short_domainURL;
//            }
        };
        
        
    
        @weakify(self);
        __block NSString *HOST = @"";
        [RestUtil get:self.hostFrom
               params:nil
              success:^(NSString *oss) {
            
            @strongify(self);
            if ([oss hasPrefix:@"http"]) {
                HOST = [[NSString alloc] initWithString:oss];//设置host主域名
                hostBlock(HOST);
                
            } else {
                [RestUtil get:self.hostFrom2
                       params:nil
                      success:^(NSString *oss) {
                    if ([oss hasPrefix:@"http"]) {
                        HOST = [[NSString alloc] initWithString:oss];//设置host主域名
                    }
                    hostBlock(HOST);
                } fail:^(int code, NSString *msg) {
                    hostBlock(HOST);
                }];
            }
            
        } fail:^(int code, NSString *msg) {
            
            [RestUtil get:self.hostFrom2
                   params:nil
                  success:^(NSString *oss) {
                if ([oss hasPrefix:@"http"]) {
                    HOST = [[NSString alloc] initWithString:oss];//设置host主域名
                }
                hostBlock(HOST);

            } fail:^(int code, NSString *msg) {
                hostBlock(HOST);

            }];
        }];
        
    }
    return self;
}

- (NSString *)apiURL
{
    return _apiURL;
}

- (void)registerConfig:(NSDictionary *)config
{
    if (config[@"red_packet_online"])
    {
        _redPacketConfig.useOnlineEnv = [config[@"red_packet_online"] boolValue];
    }
}


@end



@implementation NTESRedPacketConfig

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        _useOnlineEnv = YES;
        _aliPaySchemeUrl = @"alipay052969";
        _weChatSchemeUrl = @"wx2a5538052969956e";
    }
    return self;
}

@end
