//
//  RestUtil.m
//  hualiaoshi
//
//  Created by imim on 2017/12/22.
//  Copyright © 2017年 ali.com. All rights reserved.
//

#import "RestUtil.h"

#import "YLNetworkHelper.h"
#import "NSDictionaryAdditions.h"
#import <NSData+ImageContentType.h>
#import "AFHTTPSessionManager.h"

@implementation RestUtil

+ (NSURLSessionTask *)post:(NSString *)url params:(NSDictionary *)params success:(YLRestSuccess)success fail:(YLRestFail)fail
{
    // 在请求之前你可以统一配置你请求的相关参数 ,设置请求头, 请求参数的格式, 返回数据的格式....这样你就不需要每次请求都要设置一遍相关参数
    // 设置请求头
    //    [YLNetworkHelper setValue:@"9" forHTTPHeaderField:@"fromType"];
    
    if (![url containsString:@"http"]){
        fail(-1, @"连接失败,请检查网络连接");
        return nil;
    }
    
    // 发起请求
    return [YLNetworkHelper POST:url parameters:params success:^(id response) {
        
        // 在这里你可以根据项目自定义其他一些重复操作,比如加载页面时候的等待效果, 提醒弹窗....
        //        success(responseObject);
        
        NSDictionary *res;
        if ([response isKindOfClass:[NSData class]]){
            res = [NSJSONSerialization JSONObjectWithData:response options:0 error:0];
        } else {
            res = (NSDictionary *)response;
        }
        
        int code = [res getIntValueForKey:@"code" defaultValue:-1];
        if (0 == code) {
            id data = [res objectForKey:@"data"];
            success(data);
        } else {
            NSString * msg = [res getStringValueForKey:@"msg" defaultValue:@"系统错误～"];
            fail(code, [NSString stringWithFormat:@"%@",msg]);
        }
    } failure:^(NSError *error) {
        NSArray *array = [url componentsSeparatedByString:@"/"];
        if (array.count){
            fail(-1, [NSString stringWithFormat:@"%@",@"连接错误"]);
        } else {
            fail(-1, @"网络错误");
        }
    }];
}

+ (NSURLSessionTask *)get:(NSString *)url params:(NSDictionary *)params success:(YLRestSuccess)success fail:(YLRestFail)fail
{
    // 在请求之前你可以统一配置你请求的相关参数 ,设置请求头, 请求参数的格式, 返回数据的格式....这样你就不需要每次请求都要设置一遍相关参数
    // 设置请求头
    //    [YLNetworkHelper setValue:@"9" forHTTPHeaderField:@"fromType"];
    
    if (![url containsString:@"http"]){
        fail(-1, @"连接失败,请检查网络连接");
        return nil;
    }
    
    
    AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
    sessionManager.requestSerializer.timeoutInterval = 5.f;
    sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/html", @"text/json", @"text/plain", @"text/javascript", @"text/xml", @"image/*", nil];
    [sessionManager setResponseSerializer:[AFHTTPResponseSerializer serializer]];

 
    NSURLSessionTask *sessionTask = [sessionManager GET:url parameters:@{}  headers:nil  progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if ([responseObject isKindOfClass:[NSData class]]){
            NSString * str = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
            success ? success(str) : nil;
        } else if ([responseObject isKindOfClass:[NSString class]]){
            success ? success(responseObject) : nil;
        }
            
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        fail(-1, @"网络错误");

    }];

    return sessionTask;
    
    
//    // 发起请求
//    return [YLNetworkHelper GET:url parameters:params success:^(id response) {
//
//        // 在这里你可以根据项目自定义其他一些重复操作,比如加载页面时候的等待效果, 提醒弹窗....
//        //        success(responseObject);
//
//        NSString *dataStr = [[NSString alloc] initWithData:response encoding:NSUTF8StringEncoding];
//        if (dataStr.length > 0) {
//            success(dataStr);
//        } else {
//            fail(-1,@"OSS系统错误～");
//        }
//    } failure:^(NSError *error) {
//        NSArray *array = [url componentsSeparatedByString:@"/"];
//        if (array.count){
//            fail(-1, [NSString stringWithFormat:@"%@",@"连接错误"]);
//        } else {
//            fail(-1, @"网络错误");
//        }
//    }];
}

+ (NSURLSessionTask *)upload:(NSString *)url params:(NSDictionary *)params images:(NSArray *)images success:(YLRestSuccess)success fail:(YLRestFail)fail
{
//    NSString * fileName = [NSString stringWithFormat:@"img_%@.jpg", [[NSDate date] description]];
    return [YLNetworkHelper uploadImagesWithURL:url parameters:params name:@"image" images:images fileNames:nil imageScale:0.8f imageType:@"jpeg" progress:nil success:^(id responseObject) {
        
        // 在这里你可以根据项目自定义其他一些重复操作,比如加载页面时候的等待效果, 提醒弹窗....
        //        success(responseObject);
        
        NSDictionary *res = (NSDictionary *)responseObject;
        int code = [res getIntValueForKey:@"code" defaultValue:-1];
        if (0 == code) {
            id data = [res objectForKey:@"data"];
            success(data);
        } else {
            NSString * msg = [res getStringValueForKey:@"msg" defaultValue:@"系统错误～"];
            fail(code, [NSString stringWithFormat:@"upload错误：%@",msg]);
        }
    } failure:^(NSError *error) {
        fail(-1, @"网络错误");
    }];
}

+ (NSURLSessionTask *)upload:(NSString *)url params:(NSDictionary *)params data:(NSData *)data success:(YLRestSuccess)success fail:(YLRestFail)fail
{
    NSString * fileName = [NSString stringWithFormat:@"img_%@.jpg",[[NSDate date] description]];
    SDImageFormat imageFormat = [NSData sd_imageFormatForImageData:data];
    NSString *imageType = @"jpg";
    if (imageFormat == SDImageFormatGIF) {
        imageType = @"gif";
    } else if (imageFormat == SDImageFormatPNG) {
        imageType = @"png";
    }
    return [YLNetworkHelper uploadImageWithURL:url parameters:params name:@"image" data:data fileName:fileName imageType:imageType progress:nil success:^(id responseObject) {
        
        // 在这里你可以根据项目自定义其他一些重复操作,比如加载页面时候的等待效果, 提醒弹窗....
        //        success(responseObject);
        
        NSDictionary *res = (NSDictionary *)responseObject;
        int code = [res getIntValueForKey:@"code" defaultValue:-1];
        if (0 == code) {
            id data = [res objectForKey:@"data"];
            success(data);
        } else {
            NSString * msg = [res getStringValueForKey:@"msg" defaultValue:@"系统错误～"];
            fail(code, [NSString stringWithFormat:@"upload错误：%@",msg]);
        }
    } failure:^(NSError *error) {
        fail(-1, @"网络错误");
    }];
}

+ (NSURLSessionTask *)upload:(NSString *)url params:(NSDictionary *)params file:(NSString *)file success:(YLRestSuccess)success fail:(YLRestFail)fail
{
    return [YLNetworkHelper uploadFileWithURL:url parameters:params name:@"file" filePath:file progress:nil success:^(id responseObject) {
        
        // 在这里你可以根据项目自定义其他一些重复操作,比如加载页面时候的等待效果, 提醒弹窗....
        //        success(responseObject);
        
        NSDictionary *res = (NSDictionary *)responseObject;
        int code = [res getIntValueForKey:@"code" defaultValue:-1];
        if (0 == code) {
            id data = [res objectForKey:@"data"];
            success(data);
        } else {
            NSString * msg = [res getStringValueForKey:@"msg" defaultValue:@"系统错误～"];
            fail(code, [NSString stringWithFormat:@"upload错误：%@",msg]);
        }
    } failure:^(NSError *error) {
        fail(-1, @"网络错误");
    }];
}

+ (NSURLSessionTask *)upload:(NSString *)url params:(NSDictionary *)params files:(NSDictionary<NSString*, NSString*> *)files success:(YLRestSuccess)success fail:(YLRestFail)fail {
    return [YLNetworkHelper uploadFilesWithURL:url parameters:params files:files progress:nil success:^(id responseObject) {
        
        // 在这里你可以根据项目自定义其他一些重复操作,比如加载页面时候的等待效果, 提醒弹窗....
        //        success(responseObject);
        
        NSDictionary *res = (NSDictionary *)responseObject;
        int code = [res getIntValueForKey:@"code" defaultValue:-1];
        if (0 == code) {
            id data = [res objectForKey:@"data"];
            success(data);
        } else {
            NSString * msg = [res getStringValueForKey:@"msg" defaultValue:@"系统错误～"];
            fail(code, [NSString stringWithFormat:@"upload错误：%@",msg]);
        }
    } failure:^(NSError *error) {
        fail(-1, @"网络错误");
    }];
}

+ (NSURLSessionTask *)upload:(NSString *)url params:(NSDictionary *)params video:(NSString*)videoPath thumb:(UIImage*)thumb success:(YLRestSuccess)success fail:(YLRestFail)fail {
    return [YLNetworkHelper uploadVideoWithURL:url parameters:params video:videoPath thumb:thumb progress:nil success:^(id responseObject) {
        
        // 在这里你可以根据项目自定义其他一些重复操作,比如加载页面时候的等待效果, 提醒弹窗....
        //        success(responseObject);
        
        NSDictionary *res = (NSDictionary *)responseObject;
        int code = [res getIntValueForKey:@"code" defaultValue:-1];
        if (0 == code) {
            id data = [res objectForKey:@"data"];
            success(data);
        } else {
            NSString * msg = [res getStringValueForKey:@"msg" defaultValue:@"系统错误～"];
            fail(code, [NSString stringWithFormat:@"upload错误：%@",msg]);
        }
    } failure:^(NSError *error) {
        fail(-1, @"网络错误");
    }];
}

+ (NSString *)imageType:(NSData *)data
{
    if (!data) {
        return @"jpg";
    }
    uint8_t c;
    [data getBytes:&c length:1];
    switch (c) {
        case 0xFF:
            return @"jpg";
        case 0x89:
            return @"png";
        case 0x47:
            return @"gif";
        default:
            return @"jpg";
    }
}


@end
