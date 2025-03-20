//
//  UserManager.h
//  fanxingxue
//
//  Created by 曹宇 on 2018/3/28.
//  Copyright © 2018年 caoyu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserManager : NSObject
+(BOOL)isLogin;
+ (void)refrushNewData;
+ (NSString *)getUserId;

+ (NSString *)getHeaderImageUrl;
+ (NSString *)getNickName;


+ (void)callSevicePhoneNumber;
+ (NSString *)getMobileNumber;

+ (void)saveUserInfo:(id)responseObject;
+ (void)logout;


+ (NSString *)getLocaleString;

@end
