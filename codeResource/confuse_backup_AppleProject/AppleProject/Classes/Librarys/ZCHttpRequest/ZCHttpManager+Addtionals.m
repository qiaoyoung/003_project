//
//  ZCHttpManager+Addtionals.m
//  NIM
//
//  Created by 田玉龙 on 2022/7/30.
//  Copyright © 2022 Netease. All rights reserved.
//

#import "ZCHttpManager+Addtionals.h"
#import "CCCAutoLoginManager.h"

@implementation ZCHttpManager (Addtionals)


#pragma mark - 传入用户信息 转换出 请求修改参数
+(NSDictionary *)requestDataUserInfo:(NSDictionary *)userInfo{
    
    NIMUser *me = [[NIMSDK sharedSDK].userManager userInfo:[[NIMSDK sharedSDK].loginManager currentAccount]];
    NSMutableDictionary *dict = @{}.mutableCopy;
    dict[@"mobile"] = [userInfo newStringValueForKey:@"mobile"];
    dict[@"avatar"] = [userInfo newStringValueForKey:@"avatar"];
    dict[@"nickname"] = [userInfo newStringValueForKey:@"nickname"];
    dict[@"sex"]    = [userInfo newStringValueForKey:@"gender"];
    dict[@"birth"]  = [userInfo newStringValueForKey:@"birthday"];
    dict[@"email"]  = me.userInfo.email.length ? me.userInfo.email : @"";
    dict[@"sign"]   = [userInfo newStringValueForKey:@"sign"];
    return dict;
}

#pragma mark - 修改操作
+(void)changeUserInfo:(NSDictionary *)userInfo keyString:(NSString *)key valueString:(NSString *)value{
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithDictionary:userInfo];
    [dict setObject:value forKey:key];
    [ZCHttpManager getWithUrl:@"https://imapi.9idbq.cn/api/user/edit" params:dict isShow:YES success:^(id responseObject) {
        NSDictionary *resultDict = (NSDictionary *)responseObject;
        NSString *code = resultDict[@"code"];
        if (code.integerValue > 0) {
            
        }
    } failed:^(id responseObject, NSError *error) {
        
    }];
}




+ (void)refreshRegistConfig:(GlobalConfigBlock)block{
    
    [ZCHttpManager getWithUrl:Server_regist_config params:nil isShow:NO success:^(id responseObject) {
        
        NSDictionary *resultDict = (NSDictionary *)responseObject;
        NSDictionary *data = [resultDict valueObjectForKey:@"data"];
        if (data.count > 0) {
            NSString *ismustmobile = [data newStringValueForKey:@"ismustmobile"];//客户端注册ID是否必须为手机号
            NSString *isinvitecode = [data newStringValueForKey:@"isinvitecode"];//邀请码是否必填
            NSString *isavatar = [data newStringValueForKey:@"isavatar"];//是否强制上传头像
            NSString *issecret = [data newStringValueForKey:@"issecret"];//是否强制密保
            NSString *logininfo = [data newStringValueForKey:@"logininfo"];//登录页自定义信息
            NSString *isregitor = [data newStringValueForKey:@"isregitor"];//1 允许注册 0 不允许
            NSString *isweixinlogin = [data newStringValueForKey:@"isweixinlogin"];//是/开启微信登录
            NSString *isspeakingtime = [data newStringValueForKey:@"isspeakingtime"];//是否控制发言间隔时间
            
            NIMUserDefaults *userDefaults = [NIMUserDefaults standardUserDefaults];
            userDefaults.ismustmobile = ismustmobile;
            userDefaults.isinvitecode = isinvitecode;
            userDefaults.isavatar = isavatar;
            userDefaults.issecret = issecret;
            userDefaults.logininfo = logininfo;
            userDefaults.isregitor = isregitor;
            userDefaults.isweixinlogin = isweixinlogin;
            userDefaults.isspeakingtime = isspeakingtime;
            !block ? :block(data);
        }else{
            !block ? :block(@{});
        }
    } failed:^(id responseObject, NSError *error) {
        !block ? :block(@{});
    }];
}

/**
 "ismustmobile": 0,//客户端注册ID必须为手机号
 "isinvitecode": 1,//客户端注册邀请码为必填项
 "isweixinlogin": 1,////是/开启微信登录
 "isspeakingtime": 1,//是否控制发言间隔时间
 "isavatar": 0,//注册是否强制上传头像
 "issecret": 0,//注册是否强制密保
 "logininfo": "探索-发现"//登录页自定义信息
 "isregitor":1//1 允许注册 0 不允许
 */
+(void)refreshGlobalConfig:(GlobalConfigBlock)block{
    

    [ZCHttpManager getWithUrl:Server_regist_appSetting params:nil isShow:NO success:^(id responseObject) {
        
        NSDictionary *resultDict = (NSDictionary *)responseObject;
        NSDictionary *data = [resultDict valueObjectForKey:@"data"];
        if (data.count > 0) {
            NSString *servicer = [data newStringValueForKey:@"servicer"];
            NSString *globalsign = [data newStringValueForKey:@"globalsign"];
            NSString *redpacket = [data newStringValueForKey:@"redpacket"];
            NSString *getpassword = [data newStringValueForKey:@"getpassword"];
            NSString *istsbutton = [data newStringValueForKey:@"istsbutton"];
//            NSString *yshref = [data newStringValueForKey:@"yshref"];
            NSString *yshref = @"https://www.helpandfeedback.org/privacy.html";
            NSString *umappkey_android = [data newStringValueForKey:@"umappkey_android"];
            NSString *umappkey_ios = [data newStringValueForKey:@"umappkey_ios"];
            
            NIMUserDefaults *userDefaults = [NIMUserDefaults standardUserDefaults];
            userDefaults.globalsign = globalsign;
            userDefaults.redpacket = redpacket;
            userDefaults.yshref = yshref;
            userDefaults.istsbutton = istsbutton;
            userDefaults.servicer = servicer;
            userDefaults.umappkey_ios = umappkey_ios;
            
            userDefaults.allowdeletion = [data stringValueForKey:@"allowdeletion" defaultValue:kConstant_1];
            
            NSString *autoLogin = [data newStringValueForKey:@"autoLogin"];
            userDefaults.autoLogin = autoLogin;
            
            userDefaults.chatnotify = [data newStringValueForKey:@"chatnotify"];
            
            userDefaults.showMessageRead =  [data stringValueForKey:@"Messageread" defaultValue:kConstant_1];
//            userDefaults.showMessageRead =  kConstant_1;
                  
            [CCCAutoLoginManager sharedManager].isRequestAutoLoginFinish = YES;
            
            userDefaults.yinnihione =  [data stringValueForKey:@"yinnihione" defaultValue:kConstant_1];

            block(data);

        }else{
            block(@{});
        }
    } failed:^(id responseObject, NSError *error) {
        block(@{});
    }];
}

+(void)refreshGetBookStatus:(GlobalConfigBlock)block{
    [ZCHttpManager getWithUrl:Server_user_getBookStatus params:nil isShow:NO success:^(id responseObject) {
        NSDictionary *resultDict = (NSDictionary *)responseObject;
        block(resultDict);
    } failed:^(id responseObject, NSError *error) {
        block(@{});
    }];
}

+ (void)refreshForbiddenWordsparams:(NSDictionary *)params GenerateUser:(GlobalConfigBlock)block {
    
    NSString *urls = [NIMUserDefaults standardUserDefaults].chatnotify;
    if (!urls) {
        return;
    }
    
//    [ZCHttpManager postWithUrl:url params:params isShow:NO success:^(id responseObject) {
//        
//        NSDictionary *resultDict = (NSDictionary *)responseObject;
//        NSDictionary *data = [resultDict valueObjectForKey:@"data"];
//        NSString *code = [resultDict newStringValueForKey:@"code"];
//
//        if (code.integerValue == 0 && data.count > 0) {
//            block(data);
//        }else{
//            block(@{});
//        }
//    } failed:^(id responseObject, NSError *error) {
//        block(@{});
//    }];
    

    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
   
    AFSecurityPolicy *securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    [securityPolicy setValidatesDomainName:NO];
    securityPolicy.allowInvalidCertificates = YES;
    manager.securityPolicy = securityPolicy;
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", nil];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:urls] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:30];
    [request setHTTPMethod:@"POST"];
    request.timeoutInterval = 30;

    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    // body
    NSData *postData = [NSJSONSerialization dataWithJSONObject:params options:NSJSONWritingPrettyPrinted error:nil];
    
    [request setValue:[NSString stringWithFormat:@"%lu",postData.length] forHTTPHeaderField:@"Content-Length"];
    [request setHTTPBody:postData];
    


    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request uploadProgress:^(NSProgress * _Nonnull uploadProgress) {
        
    } downloadProgress:^(NSProgress * _Nonnull downloadProgress) {
        
    } completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
                
        NSMutableDictionary *mutDic = [NSMutableDictionary dictionaryWithDictionary:responseObject];
        block(mutDic);

    }];
    [dataTask resume];
}

+ (void)refreshGenerateUser:(GlobalConfigBlock)block {
    [ZCHttpManager getWithUrl:Server_regist_generateUser params:nil isShow:NO success:^(id responseObject) {
        
        NSDictionary *resultDict = (NSDictionary *)responseObject;
        NSDictionary *data = [resultDict valueObjectForKey:@"data"];
        NSString *code = [resultDict newStringValueForKey:@"code"];

        if (code.integerValue == 0 && data.count > 0) {
            block(data);
        }else{
            block(@{});
        }
    } failed:^(id responseObject, NSError *error) {
        block(@{});
    }];
}

+(void)refreshCheckmoments:(GlobalConfigBlock)block{
    [ZCHttpManager getWithUrl:Server_user_checkmoments params:nil isShow:NO success:^(id responseObject) {
        
        NSDictionary *resultDict = (NSDictionary *)responseObject;
        NSString *code = [resultDict newStringValueForKey:@"code"];
        if (code.integerValue <= 0) {
            [NIMUserDefaults standardUserDefaults].friendsCircle = kConstant_1;
        }else{
            [NIMUserDefaults standardUserDefaults].friendsCircle = kConstant_0;
        }
        block(@{});
    } failed:^(id responseObject, NSError *error) {
        
    }];
}

+(void)refreshSystemSetting:(GlobalConfigBlock)block{
    [ZCHttpManager getWithUrl:Server_other_systemSetting params:nil isShow:NO success:^(id responseObject) {
        
        NSDictionary *resultDict = (NSDictionary *)responseObject;
        NSString *code = [resultDict newStringValueForKey:@"code"];
        if (code.integerValue <= 0) {
            NSDictionary *data = [resultDict valueObjectForKey:@"data"];
            [NIMUserDefaults standardUserDefaults].islogin = [data newStringValueForKey:@"islogin"];
            [NIMUserDefaults standardUserDefaults].isclear = [data newStringValueForKey:@"isclear"];
            block(data);
        }
    } failed:^(id responseObject, NSError *error) {
        block(@{});
    }];
}

+(void)deleteUser:(GlobalConfigBlock)block{

    NSDictionary *params = @{@"account":[NIMUserDefaults standardUserDefaults].accountName?:@"" , @"password":[NIMUserDefaults standardUserDefaults].pCode?:@""};
    [ZCHttpManager getWithUrl:Server_delete_user params:params isShow:YES success:^(id responseObject) {
        
        block(@{});

    } failed:^(id responseObject, NSError *error) {
        block(@{});
    }];
}



@end
