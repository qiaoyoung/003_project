//
//  ZCHttpManager+Addtionals.h
//  NIM
//
//  Created by 田玉龙 on 2022/7/30.
//  Copyright © 2022 Netease. All rights reserved.
//

#import "ZCHttpManager.h"

NS_ASSUME_NONNULL_BEGIN

typedef void(^GlobalConfigBlock)(NSDictionary *configDict);

@interface ZCHttpManager (Addtionals)
+(NSDictionary *)requestDataUserInfo:(NSDictionary *)userInfo;
+(void)changeUserInfo:(NSDictionary *)userInfo keyString:(NSString *)key valueString:(NSString *)value;

+ (void)refreshRegistConfig:(GlobalConfigBlock)block;

+(void)refreshGlobalConfig:(GlobalConfigBlock)block;

+(void)refreshCheckmoments:(GlobalConfigBlock)block;//检查朋友圈权限

+(void)refreshSystemSetting:(GlobalConfigBlock)block;

+ (void)refreshGenerateUser:(GlobalConfigBlock)block;

+(void)deleteUser:(GlobalConfigBlock)block;

+ (void)refreshForbiddenWordsparams:(NSDictionary *)params GenerateUser:(GlobalConfigBlock)block;

+(void)refreshGetBookStatus:(GlobalConfigBlock)block;

@end

NS_ASSUME_NONNULL_END
