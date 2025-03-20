//
//  RestUtil.h
//  hualiaoshi
//
//  Created by imim on 2017/12/22.
//  Copyright © 2017年 ali.com. All rights reserved.
//

#import <Foundation/Foundation.h>

//#import "TYLSercetChatConfig.h"

//#define RestApi(api) [[AppleProjectKit sharedKit].webHost stringByAppendingString:api]
UIKIT_EXTERN NSString * RestApi(NSString *api);


@interface RestUtil : NSObject

/**
 请求成功的block
 
 @param info     返回信息
 @param response 响应体数据
 */
typedef void(^YLRestSuccess)(id data);
/**
 请求失败的block
 
 @param extInfo 扩展信息
 */
typedef void(^YLRestFail)(int code, NSString *msg);

+ (NSURLSessionTask *)post:(NSString *)url params:(NSDictionary *)params success:(YLRestSuccess)success fail:(YLRestFail)fail;

+ (NSURLSessionTask *)get:(NSString *)url params:(NSDictionary *)params success:(YLRestSuccess)success fail:(YLRestFail)fail;

+ (NSURLSessionTask *)upload:(NSString *)url params:(NSDictionary *)params images:(NSArray *)images success:(YLRestSuccess)success fail:(YLRestFail)fail;

+ (NSURLSessionTask *)upload:(NSString *)url params:(NSDictionary *)params data:(NSData *)data success:(YLRestSuccess)success fail:(YLRestFail)fail;

+ (NSURLSessionTask *)upload:(NSString *)url params:(NSDictionary *)params file:(NSString *)file success:(YLRestSuccess)success fail:(YLRestFail)fail;

+ (NSURLSessionTask *)upload:(NSString *)url params:(NSDictionary *)params files:(NSDictionary<NSString*, NSString*> *)files success:(YLRestSuccess)success fail:(YLRestFail)fail;

//+ (NSURLSessionTask *)upload:(NSString *)url params:(NSDictionary *)params video:(NSString*)videoPath thumb:(UIImage*)thumb success:(YLRestSuccess)success fail:(YLRestFail)fail;

@end
