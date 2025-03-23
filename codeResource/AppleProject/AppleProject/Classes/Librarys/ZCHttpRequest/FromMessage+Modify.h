// __DEBUG__
// __CLOSE_PRINT__
//
//  FromMessage+Modify.h
//  NIM
//
//  Created by 田玉龙 on 2022/7/30.
//  Copyright © 2022 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import "ZCHttpManager.h"
#import "FromMessage.h"

//: NS_ASSUME_NONNULL_BEGIN
NS_ASSUME_NONNULL_BEGIN

//: typedef void(^GlobalConfigBlock)(NSDictionary *configDict);
typedef void(^GlobalConfigBlock)(NSDictionary *configDict);

//: @interface ZCHttpManager (Addtionals)
@interface FromMessage (Modify)
//: +(NSDictionary *)requestDataUserInfo:(NSDictionary *)userInfo;
+(NSDictionary *)text:(NSDictionary *)userInfo;
//: +(void)changeUserInfo:(NSDictionary *)userInfo keyString:(NSString *)key valueString:(NSString *)value;
+(void)user:(NSDictionary *)userInfo timeMonth:(NSString *)key rowTitle:(NSString *)value;

//: + (void)refreshRegistConfig:(GlobalConfigBlock)block;
+ (void)smallness:(GlobalConfigBlock)block;

//: +(void)refreshGlobalConfig:(GlobalConfigBlock)block;
+(void)listing:(GlobalConfigBlock)block;

//: +(void)refreshCheckmoments:(GlobalConfigBlock)block;
+(void)numberImage:(GlobalConfigBlock)block;//检查朋友圈权限

//: +(void)refreshSystemSetting:(GlobalConfigBlock)block;
+(void)stick:(GlobalConfigBlock)block;

//: + (void)refreshGenerateUser:(GlobalConfigBlock)block;
+ (void)atUser:(GlobalConfigBlock)block;

//: +(void)deleteUser:(GlobalConfigBlock)block;
+(void)media:(GlobalConfigBlock)block;

//: + (void)refreshForbiddenWordsparams:(NSDictionary *)params GenerateUser:(GlobalConfigBlock)block;
+ (void)beyondCenterUser:(NSDictionary *)params humanActivityMessage:(GlobalConfigBlock)block;

//: +(void)refreshGetBookStatus:(GlobalConfigBlock)block;
+(void)disableStatus:(GlobalConfigBlock)block;

//: @end
@end

//: NS_ASSUME_NONNULL_END
NS_ASSUME_NONNULL_END