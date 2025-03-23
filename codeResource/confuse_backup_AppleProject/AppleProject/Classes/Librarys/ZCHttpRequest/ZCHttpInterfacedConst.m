//
//  ZCHttpInterfacedConst.m
//  NIM
//
//  Created by 田玉龙 on 2022/7/30.
//  Copyright © 2022 Netease. All rights reserved.
//

#import "ZCHttpInterfacedConst.h"

NSString * RestApi(NSString *api) {
    NSString* resultApi;
    resultApi = [[CCCConfig sharedConfig].domainURL stringByAppendingString:api];
    return resultApi;
}

#if DevelopSever
/** 接口前缀-开发服务器*/
NSString *const kToken            = @"";
NSString *const iphone_md5_key    = @"";
NSString *const wss_msg_prefix    = @"wss://open.ihccs.com/wstest/myHandler/open?token=";

#elif ProductSever
/** 接口前缀-生产服务器*/
NSString *const kToken            = @"";
NSString *const iphone_md5_key    = @"";
NSString *const wss_msg_prefix    = @"wss://open.ihccs.com/ws/myHandler/open?token=";


#endif
