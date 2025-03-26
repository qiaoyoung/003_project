
#import <Foundation/Foundation.h>
typedef struct {
    Byte klick;
    Byte *gently;
    unsigned int centerCart;
    bool uS;
} CarbamideData;

NSString *StringFromCarbamideData(CarbamideData *data);


//: WIFI
CarbamideData str_scapeSizeData = (CarbamideData){209, (Byte []){134, 152, 151, 152, 92}, 4, false};


//: responseObject = %@
CarbamideData str_accordingText = (CarbamideData){123, (Byte []){9, 30, 8, 11, 20, 21, 8, 30, 52, 25, 17, 30, 24, 15, 91, 70, 91, 94, 59, 226}, 19, false};


//: 手机自带网络
CarbamideData str_honorThroatText = (CarbamideData){186, (Byte []){92, 51, 49, 92, 38, 0, 82, 61, 16, 95, 2, 28, 93, 7, 43, 93, 1, 38, 117}, 18, false};


//: 无网络
CarbamideData str_adviseBottomTitle = (CarbamideData){251, (Byte []){29, 108, 91, 28, 70, 106, 28, 64, 103, 168}, 9, false};


//: text/html
CarbamideData str_helloSoilData = (CarbamideData){237, (Byte []){153, 136, 149, 153, 194, 133, 153, 128, 129, 64}, 9, false};


//: image/*
CarbamideData str_electricalValue = (CarbamideData){188, (Byte []){213, 209, 221, 219, 217, 147, 150, 65}, 7, false};


//: thumb.jpg
CarbamideData str_advanceOurData = (CarbamideData){75, (Byte []){63, 35, 62, 38, 41, 101, 33, 59, 44, 76}, 9, false};


//: thumb
CarbamideData str_leySurroundingData = (CarbamideData){229, (Byte []){145, 141, 144, 136, 135, 242}, 5, false};


//: text/javascript
CarbamideData str_reekTitle = (CarbamideData){77, (Byte []){57, 40, 53, 57, 98, 39, 44, 59, 44, 62, 46, 63, 36, 61, 57, 13}, 15, false};


//: image/%@
CarbamideData str_priorityData = (CarbamideData){208, (Byte []){185, 189, 177, 183, 181, 255, 245, 144, 105}, 8, false};


//: Download
CarbamideData str_butteValue = (CarbamideData){99, (Byte []){39, 12, 20, 13, 15, 12, 2, 7, 1}, 8, false};


//: yyyyMMddHHmmss
CarbamideData str_attractSizeDefinitionTitle = (CarbamideData){238, (Byte []){151, 151, 151, 151, 163, 163, 138, 138, 166, 166, 131, 131, 157, 157, 241}, 14, false};


//: jpg
CarbamideData str_ureaName = (CarbamideData){197, (Byte []){175, 181, 162, 26}, 3, false};


//: text/plain
CarbamideData str_priorityName = (CarbamideData){87, (Byte []){35, 50, 47, 35, 120, 39, 59, 54, 62, 57, 40}, 10, false};


//: image/jpg
CarbamideData str_eyeDistributeText = (CarbamideData){213, (Byte []){188, 184, 180, 178, 176, 250, 191, 165, 178, 89}, 9, false};


//: text/json
CarbamideData str_elanName = (CarbamideData){84, (Byte []){32, 49, 44, 32, 123, 62, 39, 59, 58, 135}, 9, false};


//: application/json
CarbamideData str_rawPositData = (CarbamideData){60, (Byte []){93, 76, 76, 80, 85, 95, 93, 72, 85, 83, 82, 19, 86, 79, 83, 82, 121}, 16, false};


//: text/xml
CarbamideData str_eveningElegantData = (CarbamideData){171, (Byte []){223, 206, 211, 223, 132, 211, 198, 199, 99}, 8, false};


//: 未知网络
CarbamideData str_soldierEagerName = (CarbamideData){187, (Byte []){93, 39, 17, 92, 36, 30, 92, 6, 42, 92, 0, 39, 130}, 12, false};


//: error = %@
CarbamideData str_viceContent = (CarbamideData){69, (Byte []){32, 55, 55, 42, 55, 101, 120, 101, 96, 5, 51}, 10, false};


//: video
CarbamideData str_textModeTitle = (CarbamideData){70, (Byte []){48, 47, 34, 35, 41, 172}, 5, false};

// __DEBUG__
// __CLOSE_PRINT__
//
//  MaxHelper.m
//  MaxHelper
//
//  Created by AndyPang on 16/8/12.
//  Copyright © 2016年 AndyPang. All rights reserved.
//

// __M_A_C_R_O__
//: #import "YLNetworkHelper.h"
#import "MaxHelper.h"
//: #import "AFNetworking.h"
#import "AFNetworking.h"
//: #import "AFNetworkActivityIndicatorManager.h"
#import "AFNetworkActivityIndicatorManager.h"

//: @implementation YLNetworkHelper
@implementation MaxHelper

//: static BOOL _isOpenLog; 
static BOOL k_formText; // 是否已开启日志打印
//: static NSMutableArray *_allSessionTask;
static NSMutableArray *k_playTitle;
//: static AFHTTPSessionManager *_sessionManager;
static AFHTTPSessionManager *k_releaseValue;

//: #pragma mark - 开始监听网络
#pragma mark - 开始监听网络
//: + (void)networkStatusWithBlock:(YLNetworkStatus)networkStatus {
+ (void)equal:(YLNetworkStatus)networkStatus {

    //: [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        //: switch (status) {
        switch (status) {
            //: case AFNetworkReachabilityStatusUnknown:
            case AFNetworkReachabilityStatusUnknown:
                //: networkStatus ? networkStatus(YLNetworkStatusUnknown) : nil;
                networkStatus ? networkStatus(YLNetworkStatusUnknown) : nil;
                //: if (_isOpenLog) printf("[%s] %s [第%d行]: %s\n", "15:46:43" ,__PRETTY_FUNCTION__ ,__LINE__, [[NSString stringWithFormat:@"未知网络"] UTF8String]);
                if (k_formText) printf("[%s] %s [第%d行]: %s\n", "15:46:43" ,__PRETTY_FUNCTION__ ,__LINE__, [[NSString stringWithFormat:StringFromCarbamideData(&str_soldierEagerName)] UTF8String]);
                //: break;
                break;
            //: case AFNetworkReachabilityStatusNotReachable:
            case AFNetworkReachabilityStatusNotReachable:
                //: networkStatus ? networkStatus(YLNetworkStatusNotReachable) : nil;
                networkStatus ? networkStatus(YLNetworkStatusNotReachable) : nil;
                //: if (_isOpenLog) printf("[%s] %s [第%d行]: %s\n", "15:46:43" ,__PRETTY_FUNCTION__ ,__LINE__, [[NSString stringWithFormat:@"无网络"] UTF8String]);
                if (k_formText) printf("[%s] %s [第%d行]: %s\n", "15:46:43" ,__PRETTY_FUNCTION__ ,__LINE__, [[NSString stringWithFormat:StringFromCarbamideData(&str_adviseBottomTitle)] UTF8String]);
                //: break;
                break;
            //: case AFNetworkReachabilityStatusReachableViaWWAN:
            case AFNetworkReachabilityStatusReachableViaWWAN:
                //: networkStatus ? networkStatus(YLNetworkStatusReachableViaWWAN) : nil;
                networkStatus ? networkStatus(YLNetworkStatusReachableViaWWAN) : nil;
                //: if (_isOpenLog) printf("[%s] %s [第%d行]: %s\n", "15:46:43" ,__PRETTY_FUNCTION__ ,__LINE__, [[NSString stringWithFormat:@"手机自带网络"] UTF8String]);
                if (k_formText) printf("[%s] %s [第%d行]: %s\n", "15:46:43" ,__PRETTY_FUNCTION__ ,__LINE__, [[NSString stringWithFormat:StringFromCarbamideData(&str_honorThroatText)] UTF8String]);
                //: break;
                break;
            //: case AFNetworkReachabilityStatusReachableViaWiFi:
            case AFNetworkReachabilityStatusReachableViaWiFi:
                //: networkStatus ? networkStatus(YLNetworkStatusReachableViaWiFi) : nil;
                networkStatus ? networkStatus(YLNetworkStatusReachableViaWiFi) : nil;
                //: if (_isOpenLog) printf("[%s] %s [第%d行]: %s\n", "15:46:43" ,__PRETTY_FUNCTION__ ,__LINE__, [[NSString stringWithFormat:@"WIFI"] UTF8String]);
                if (k_formText) printf("[%s] %s [第%d行]: %s\n", "15:46:43" ,__PRETTY_FUNCTION__ ,__LINE__, [[NSString stringWithFormat:StringFromCarbamideData(&str_scapeSizeData)] UTF8String]);
                //: break;
                break;
        }
    //: }];
    }];

}

//: + (BOOL)isNetwork {
+ (BOOL)contentText {
    //: return [AFNetworkReachabilityManager sharedManager].reachable;
    return [AFNetworkReachabilityManager sharedManager].reachable;
}

//: + (BOOL)isWWANNetwork {
+ (BOOL)spaceNetwork {
    //: return [AFNetworkReachabilityManager sharedManager].reachableViaWWAN;
    return [AFNetworkReachabilityManager sharedManager].reachableViaWWAN;
}

//: + (BOOL)isWiFiNetwork {
+ (BOOL)remote {
    //: return [AFNetworkReachabilityManager sharedManager].reachableViaWiFi;
    return [AFNetworkReachabilityManager sharedManager].reachableViaWiFi;
}

//: + (void)openLog {
+ (void)doing {
    //: _isOpenLog = YES;
    k_formText = YES;
}

//: + (void)closeLog {
+ (void)mediaFile {
    //: _isOpenLog = NO;
    k_formText = NO;
}

//: + (void)cancelAllRequest {
+ (void)listInfo {
    // 锁操作
    //: @synchronized(self) {
    @synchronized(self) {
        //: [[self allSessionTask] enumerateObjectsUsingBlock:^(NSURLSessionTask *_Nonnull task, NSUInteger idx, BOOL * _Nonnull stop) {
        [[self sizeSend] enumerateObjectsUsingBlock:^(NSURLSessionTask *_Nonnull task, NSUInteger idx, BOOL * _Nonnull stop) {
            //: [task cancel];
            [task cancel];
        //: }];
        }];
        //: [[self allSessionTask] removeAllObjects];
        [[self sizeSend] removeAllObjects];
    }
}

//: + (void)cancelRequestWithURL:(NSString *)URL {
+ (void)belowWith:(NSString *)URL {
    //: if (!URL) { return; }
    if (!URL) { return; }
    //: @synchronized (self) {
    @synchronized (self) {
        //: [[self allSessionTask] enumerateObjectsUsingBlock:^(NSURLSessionTask *_Nonnull task, NSUInteger idx, BOOL * _Nonnull stop) {
        [[self sizeSend] enumerateObjectsUsingBlock:^(NSURLSessionTask *_Nonnull task, NSUInteger idx, BOOL * _Nonnull stop) {
            //: if ([task.currentRequest.URL.absoluteString hasPrefix:URL]) {
            if ([task.currentRequest.URL.absoluteString hasPrefix:URL]) {
                //: [task cancel];
                [task cancel];
                //: [[self allSessionTask] removeObject:task];
                [[self sizeSend] removeObject:task];
                //: *stop = YES;
                *stop = YES;
            }
        //: }];
        }];
    }
}

//: #pragma mark - GET请求无缓存
#pragma mark - GET请求无缓存
//: + (NSURLSessionTask *)GET:(NSString *)URL
+ (NSURLSessionTask *)user:(NSString *)URL
               //: parameters:(id)parameters
               almsBox:(id)parameters
                  //: success:(YLHttpRequestSuccess)success
                  bluishRequestSuccess:(YLHttpRequestSuccess)success
                  //: failure:(YLHttpRequestFailed)failure {
                  teamAt:(YLHttpRequestFailed)failure {
    //: return [self GET:URL parameters:parameters responseCache:nil success:success failure:failure];
    return [self message:URL dataConverter:parameters success:nil checked:success halogenRequestFailed:failure];
}

//: #pragma mark - POST请求无缓存
#pragma mark - POST请求无缓存
//: + (NSURLSessionTask *)POST:(NSString *)URL
+ (NSURLSessionTask *)down:(NSString *)URL
                //: parameters:(id)parameters
                honkyTonkId:(id)parameters
                   //: success:(YLHttpRequestSuccess)success
                   ting:(YLHttpRequestSuccess)success
                   //: failure:(YLHttpRequestFailed)failure {
                   remote:(YLHttpRequestFailed)failure {
    //: return [self POST:URL parameters:parameters responseCache:nil success:success failure:failure];
    return [self disable:URL pathFailure:parameters tingOption:nil callWith:success nameContainer:failure];
}

//: #pragma mark - GET请求自动缓存
#pragma mark - GET请求自动缓存
//: + (NSURLSessionTask *)GET:(NSString *)URL
+ (NSURLSessionTask *)message:(NSString *)URL
               //: parameters:(id)parameters
               dataConverter:(id)parameters
            //: responseCache:(YLHttpRequestCache)responseCache
            success:(YLHttpRequestCache)responseCache
                  //: success:(YLHttpRequestSuccess)success
                  checked:(YLHttpRequestSuccess)success
                  //: failure:(YLHttpRequestFailed)failure {
                  halogenRequestFailed:(YLHttpRequestFailed)failure {

    //: [self setResponseSerializer:(YLResponseSerializerHTTP)];
    [self setText:(YLResponseSerializerHTTP)];

    //: NSURLSessionTask *sessionTask = [_sessionManager GET:URL parameters:parameters headers:nil progress:^(NSProgress * _Nonnull uploadProgress) {
    NSURLSessionTask *sessionTask = [k_releaseValue GET:URL parameters:parameters headers:nil progress:^(NSProgress * _Nonnull uploadProgress) {

    //: } success:^(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject) {

        //: if (_isOpenLog) {printf("[%s] %s [第%d行]: %s\n", "15:46:43" ,__PRETTY_FUNCTION__ ,__LINE__, [[NSString stringWithFormat:@"responseObject = %@",responseObject] UTF8String]);}
        if (k_formText) {printf("[%s] %s [第%d行]: %s\n", "15:46:43" ,__PRETTY_FUNCTION__ ,__LINE__, [[NSString stringWithFormat:StringFromCarbamideData(&str_accordingText),responseObject] UTF8String]);}
        //: [[self allSessionTask] removeObject:task];
        [[self sizeSend] removeObject:task];
        //: success ? success(responseObject) : nil;
        success ? success(responseObject) : nil;

    //: } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {

        //: if (_isOpenLog) {printf("[%s] %s [第%d行]: %s\n", "15:46:43" ,__PRETTY_FUNCTION__ ,__LINE__, [[NSString stringWithFormat:@"error = %@",error] UTF8String]);}
        if (k_formText) {printf("[%s] %s [第%d行]: %s\n", "15:46:43" ,__PRETTY_FUNCTION__ ,__LINE__, [[NSString stringWithFormat:StringFromCarbamideData(&str_viceContent),error] UTF8String]);}
        //: [[self allSessionTask] removeObject:task];
        [[self sizeSend] removeObject:task];
        //: failure ? failure(error) : nil;
        failure ? failure(error) : nil;

    //: }];
    }];
    // 添加sessionTask到数组
    //: sessionTask ? [[self allSessionTask] addObject:sessionTask] : nil ;
    sessionTask ? [[self sizeSend] addObject:sessionTask] : nil ;

    //: return sessionTask;
    return sessionTask;
}

//: #pragma mark - POST请求自动缓存
#pragma mark - POST请求自动缓存
//: + (NSURLSessionTask *)POST:(NSString *)URL
+ (NSURLSessionTask *)disable:(NSString *)URL
                //: parameters:(id)parameters
                pathFailure:(id)parameters
             //: responseCache:(YLHttpRequestCache)responseCache
             tingOption:(YLHttpRequestCache)responseCache
                   //: success:(YLHttpRequestSuccess)success
                   callWith:(YLHttpRequestSuccess)success
                   //: failure:(YLHttpRequestFailed)failure {
                   nameContainer:(YLHttpRequestFailed)failure {

    //: [self setResponseSerializer:(YLResponseSerializerJSON)];
    [self setText:(YLResponseSerializerJSON)];

    //: NSURLSessionTask *sessionTask = [_sessionManager POST:URL parameters:parameters headers:nil progress:^(NSProgress * _Nonnull uploadProgress) {
    NSURLSessionTask *sessionTask = [k_releaseValue POST:URL parameters:parameters headers:nil progress:^(NSProgress * _Nonnull uploadProgress) {

    //: } success:^(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject) {

        //: if (_isOpenLog) {printf("[%s] %s [第%d行]: %s\n", "15:46:43" ,__PRETTY_FUNCTION__ ,__LINE__, [[NSString stringWithFormat:@"responseObject = %@",responseObject] UTF8String]);}
        if (k_formText) {printf("[%s] %s [第%d行]: %s\n", "15:46:43" ,__PRETTY_FUNCTION__ ,__LINE__, [[NSString stringWithFormat:StringFromCarbamideData(&str_accordingText),responseObject] UTF8String]);}
        //: [[self allSessionTask] removeObject:task];
        [[self sizeSend] removeObject:task];
        //: success ? success(responseObject) : nil;
        success ? success(responseObject) : nil;

    //: } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {

        //: if (_isOpenLog) {printf("[%s] %s [第%d行]: %s\n", "15:46:43" ,__PRETTY_FUNCTION__ ,__LINE__, [[NSString stringWithFormat:@"error = %@",error] UTF8String]);}
        if (k_formText) {printf("[%s] %s [第%d行]: %s\n", "15:46:43" ,__PRETTY_FUNCTION__ ,__LINE__, [[NSString stringWithFormat:StringFromCarbamideData(&str_viceContent),error] UTF8String]);}
        //: [[self allSessionTask] removeObject:task];
        [[self sizeSend] removeObject:task];
        //: failure ? failure(error) : nil;
        failure ? failure(error) : nil;

    //: }];
    }];

    // 添加最新的sessionTask到数组
    //: sessionTask ? [[self allSessionTask] addObject:sessionTask] : nil ;
    sessionTask ? [[self sizeSend] addObject:sessionTask] : nil ;
    //: return sessionTask;
    return sessionTask;
}

//: #pragma mark - 上传文件
#pragma mark - 上传文件
//: + (NSURLSessionTask *)uploadFileWithURL:(NSString *)URL
+ (NSURLSessionTask *)holder:(NSString *)URL
                             //: parameters:(id)parameters
                             ting:(id)parameters
                                   //: name:(NSString *)name
                                   data_strong:(NSString *)name
                               //: filePath:(NSString *)filePath
                               small:(NSString *)filePath
                               //: progress:(YLHttpProgress)progress
                               streetSmart:(YLHttpProgress)progress
                                //: success:(YLHttpRequestSuccess)success
                                failure:(YLHttpRequestSuccess)success
                                //: failure:(YLHttpRequestFailed)failure {
                                userItem:(YLHttpRequestFailed)failure {

    //: NSURLSessionTask *sessionTask = [_sessionManager POST:URL parameters:parameters headers:nil constructingBodyWithBlock:^(id<AFMultipartFormData> _Nonnull formData) {
    NSURLSessionTask *sessionTask = [k_releaseValue POST:URL parameters:parameters headers:nil constructingBodyWithBlock:^(id<AFMultipartFormData> _Nonnull formData) {
        //: NSError *error = nil;
        NSError *error = nil;
        //: [formData appendPartWithFileURL:[NSURL URLWithString:filePath] name:name error:&error];
        [formData appendPartWithFileURL:[NSURL URLWithString:filePath] name:name error:&error];
        //: (failure && error) ? failure(error) : nil;
        (failure && error) ? failure(error) : nil;
    //: } progress:^(NSProgress * _Nonnull uploadProgress) {
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        //上传进度
        //: dispatch_sync(dispatch_get_main_queue(), ^{
        dispatch_sync(dispatch_get_main_queue(), ^{
            //: progress ? progress(uploadProgress) : nil;
            progress ? progress(uploadProgress) : nil;
        //: });
        });
    //: } success:^(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject) {

        //: if (_isOpenLog) {printf("[%s] %s [第%d行]: %s\n", "15:46:43" ,__PRETTY_FUNCTION__ ,__LINE__, [[NSString stringWithFormat:@"responseObject = %@",responseObject] UTF8String]);}
        if (k_formText) {printf("[%s] %s [第%d行]: %s\n", "15:46:43" ,__PRETTY_FUNCTION__ ,__LINE__, [[NSString stringWithFormat:StringFromCarbamideData(&str_accordingText),responseObject] UTF8String]);}
        //: [[self allSessionTask] removeObject:task];
        [[self sizeSend] removeObject:task];
        //: success ? success(responseObject) : nil;
        success ? success(responseObject) : nil;

    //: } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {

        //: if (_isOpenLog) {printf("[%s] %s [第%d行]: %s\n", "15:46:43" ,__PRETTY_FUNCTION__ ,__LINE__, [[NSString stringWithFormat:@"error = %@",error] UTF8String]);}
        if (k_formText) {printf("[%s] %s [第%d行]: %s\n", "15:46:43" ,__PRETTY_FUNCTION__ ,__LINE__, [[NSString stringWithFormat:StringFromCarbamideData(&str_viceContent),error] UTF8String]);}
        //: [[self allSessionTask] removeObject:task];
        [[self sizeSend] removeObject:task];
        //: failure ? failure(error) : nil;
        failure ? failure(error) : nil;
    //: }];
    }];

    // 添加sessionTask到数组
    //: sessionTask ? [[self allSessionTask] addObject:sessionTask] : nil ;
    sessionTask ? [[self sizeSend] addObject:sessionTask] : nil ;

    //: return sessionTask;
    return sessionTask;
}

//: + (__kindof NSURLSessionTask *)uploadVideoWithURL:(NSString *)URL
+ (__kindof NSURLSessionTask *)afterShow:(NSString *)URL
                                      //: parameters:(id)parameters
                                      colour:(id)parameters
                                           //: video:(NSString *)videoPath
                                           button:(NSString *)videoPath
                                           //: thumb:(UIImage *)thumb
                                           replacement:(UIImage *)thumb
                                        //: progress:(YLHttpProgress)progress
                                        message:(YLHttpProgress)progress
                                         //: success:(YLHttpRequestSuccess)success
                                         icon:(YLHttpRequestSuccess)success
                                         //: failure:(YLHttpRequestFailed)failure {
                                         intervalerlude:(YLHttpRequestFailed)failure {
    //: NSURLSessionTask *sessionTask = [_sessionManager POST:URL parameters:parameters headers:nil constructingBodyWithBlock:^(id<AFMultipartFormData> _Nonnull formData) {
    NSURLSessionTask *sessionTask = [k_releaseValue POST:URL parameters:parameters headers:nil constructingBodyWithBlock:^(id<AFMultipartFormData> _Nonnull formData) {

        //: NSError *error = nil;
        NSError *error = nil;
        //: [formData appendPartWithFileURL:[NSURL fileURLWithPath:videoPath isDirectory:NO] name:@"video" error:&error];
        [formData appendPartWithFileURL:[NSURL fileURLWithPath:videoPath isDirectory:NO] name:StringFromCarbamideData(&str_textModeTitle) error:&error];
        //: (failure && error) ? failure(error) : nil;
        (failure && error) ? failure(error) : nil;

        //: NSData *thumbData = UIImageJPEGRepresentation(thumb, 1.f);
        NSData *thumbData = UIImageJPEGRepresentation(thumb, 1.f);
        //: [formData appendPartWithFileData:thumbData
        [formData appendPartWithFileData:thumbData
                                    //: name:@"thumb"
                                    name:StringFromCarbamideData(&str_leySurroundingData)
                                //: fileName:@"thumb.jpg"
                                fileName:StringFromCarbamideData(&str_advanceOurData)
                                //: mimeType:[NSString stringWithFormat:@"image/jpg"]];
                                mimeType:[NSString stringWithFormat:StringFromCarbamideData(&str_eyeDistributeText)]];

    //: } progress:^(NSProgress * _Nonnull uploadProgress) {
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        //上传进度
        //: dispatch_sync(dispatch_get_main_queue(), ^{
        dispatch_sync(dispatch_get_main_queue(), ^{
            //: progress ? progress(uploadProgress) : nil;
            progress ? progress(uploadProgress) : nil;
        //: });
        });
    //: } success:^(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject) {

        //: if (_isOpenLog) {printf("[%s] %s [第%d行]: %s\n", "15:46:43" ,__PRETTY_FUNCTION__ ,__LINE__, [[NSString stringWithFormat:@"responseObject = %@",responseObject] UTF8String]);}
        if (k_formText) {printf("[%s] %s [第%d行]: %s\n", "15:46:43" ,__PRETTY_FUNCTION__ ,__LINE__, [[NSString stringWithFormat:StringFromCarbamideData(&str_accordingText),responseObject] UTF8String]);}
        //: [[self allSessionTask] removeObject:task];
        [[self sizeSend] removeObject:task];
        //: success ? success(responseObject) : nil;
        success ? success(responseObject) : nil;

    //: } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {

        //: if (_isOpenLog) {printf("[%s] %s [第%d行]: %s\n", "15:46:43" ,__PRETTY_FUNCTION__ ,__LINE__, [[NSString stringWithFormat:@"error = %@",error] UTF8String]);}
        if (k_formText) {printf("[%s] %s [第%d行]: %s\n", "15:46:43" ,__PRETTY_FUNCTION__ ,__LINE__, [[NSString stringWithFormat:StringFromCarbamideData(&str_viceContent),error] UTF8String]);}
        //: [[self allSessionTask] removeObject:task];
        [[self sizeSend] removeObject:task];
        //: failure ? failure(error) : nil;
        failure ? failure(error) : nil;
    //: }];
    }];

    // 添加sessionTask到数组
    //: sessionTask ? [[self allSessionTask] addObject:sessionTask] : nil ;
    sessionTask ? [[self sizeSend] addObject:sessionTask] : nil ;

    //: return sessionTask;
    return sessionTask;
}

/**
 *  上传多个文件
 *
 *  @param URL        请求地址
 *  @param parameters 请求参数
 *  @param files      文件 <文件对应服务器上的字段, 文件本地的沙盒路径>
 *  @param progress   上传进度信息
 *  @param success    请求成功的回调
 *  @param failure    请求失败的回调
 *
 *  @return 返回的对象可取消请求,调用cancel方法
 */
//: + (__kindof NSURLSessionTask *)uploadFilesWithURL:(NSString *)URL
+ (__kindof NSURLSessionTask *)canOf:(NSString *)URL
                                       //: parameters:(id)parameters
                                       tableGame:(id)parameters
                                            //: files:(NSDictionary<NSString*, NSString*> *)files
                                            showFile:(NSDictionary<NSString*, NSString*> *)files
                                         //: progress:(YLHttpProgress)progress
                                         view:(YLHttpProgress)progress
                                          //: success:(YLHttpRequestSuccess)success
                                          location:(YLHttpRequestSuccess)success
                                          //: failure:(YLHttpRequestFailed)failure {
                                          image:(YLHttpRequestFailed)failure {
    //: NSURLSessionTask *sessionTask = [_sessionManager POST:URL parameters:parameters headers:nil constructingBodyWithBlock:^(id<AFMultipartFormData> _Nonnull formData) {
    NSURLSessionTask *sessionTask = [k_releaseValue POST:URL parameters:parameters headers:nil constructingBodyWithBlock:^(id<AFMultipartFormData> _Nonnull formData) {
        //: NSError *error = nil;
        NSError *error = nil;

        //: for (NSString * key in files) {
        for (NSString * key in files) {
            //: NSString * value = [files objectForKey:key];
            NSString * value = [files objectForKey:key];
            //: [formData appendPartWithFileURL:[NSURL URLWithString:value] name:key error:&error];
            [formData appendPartWithFileURL:[NSURL URLWithString:value] name:key error:&error];

            //: if (error) {
            if (error) {
                //: break;
                break;
            }
        }

        //: (failure && error) ? failure(error) : nil;
        (failure && error) ? failure(error) : nil;
    //: } progress:^(NSProgress * _Nonnull uploadProgress) {
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        //上传进度
        //: dispatch_sync(dispatch_get_main_queue(), ^{
        dispatch_sync(dispatch_get_main_queue(), ^{
            //: progress ? progress(uploadProgress) : nil;
            progress ? progress(uploadProgress) : nil;
        //: });
        });
    //: } success:^(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject) {

        //: if (_isOpenLog) {printf("[%s] %s [第%d行]: %s\n", "15:46:43" ,__PRETTY_FUNCTION__ ,__LINE__, [[NSString stringWithFormat:@"responseObject = %@",responseObject] UTF8String]);}
        if (k_formText) {printf("[%s] %s [第%d行]: %s\n", "15:46:43" ,__PRETTY_FUNCTION__ ,__LINE__, [[NSString stringWithFormat:StringFromCarbamideData(&str_accordingText),responseObject] UTF8String]);}
        //: [[self allSessionTask] removeObject:task];
        [[self sizeSend] removeObject:task];
        //: success ? success(responseObject) : nil;
        success ? success(responseObject) : nil;

    //: } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {

        //: if (_isOpenLog) {printf("[%s] %s [第%d行]: %s\n", "15:46:43" ,__PRETTY_FUNCTION__ ,__LINE__, [[NSString stringWithFormat:@"error = %@",error] UTF8String]);}
        if (k_formText) {printf("[%s] %s [第%d行]: %s\n", "15:46:43" ,__PRETTY_FUNCTION__ ,__LINE__, [[NSString stringWithFormat:StringFromCarbamideData(&str_viceContent),error] UTF8String]);}
        //: [[self allSessionTask] removeObject:task];
        [[self sizeSend] removeObject:task];
        //: failure ? failure(error) : nil;
        failure ? failure(error) : nil;
    //: }];
    }];

    // 添加sessionTask到数组
    //: sessionTask ? [[self allSessionTask] addObject:sessionTask] : nil ;
    sessionTask ? [[self sizeSend] addObject:sessionTask] : nil ;

    //: return sessionTask;
    return sessionTask;
}



//: #pragma mark - 上传单张图片
#pragma mark - 上传单张图片
//: + (NSURLSessionTask *)uploadImageWithURL:(NSString *)URL parameters:(id)parameters name:(NSString *)name data:(NSData *)data fileName:(NSString *)fileName imageType:(NSString *)imageType progress:(YLHttpProgress)progress success:(YLHttpRequestSuccess)success failure:(YLHttpRequestFailed)failure
+ (NSURLSessionTask *)account:(NSString *)URL space:(id)parameters app_strong:(NSString *)name fastening:(NSData *)data view:(NSString *)fileName withSession:(NSString *)imageType past:(YLHttpProgress)progress alongType:(YLHttpRequestSuccess)success max:(YLHttpRequestFailed)failure
{
    //: NSURLSessionTask *sessionTask = [_sessionManager POST:URL parameters:parameters headers:nil constructingBodyWithBlock:^(id<AFMultipartFormData> _Nonnull formData) {
    NSURLSessionTask *sessionTask = [k_releaseValue POST:URL parameters:parameters headers:nil constructingBodyWithBlock:^(id<AFMultipartFormData> _Nonnull formData) {

        // 默认图片的文件名, 若fileNames为nil就使用

        //: NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        //: formatter.dateFormat = @"yyyyMMddHHmmss";
        formatter.dateFormat = StringFromCarbamideData(&str_attractSizeDefinitionTitle);
        //: NSString *str = [formatter stringFromDate:[NSDate date]];
        NSString *str = [formatter stringFromDate:[NSDate date]];
        //: NSString *imageFileName = [NSString stringWithFormat:@"%@.%@",str,imageType?:@"jpg"];
        NSString *imageFileName = [NSString stringWithFormat:@"%@.%@",str,imageType?:StringFromCarbamideData(&str_ureaName)];

        //: [formData appendPartWithFileData:data
        [formData appendPartWithFileData:data
                                    //: name:name
                                    name:name
                                //: fileName:fileName ? [NSString stringWithFormat:@"%@.%@",fileName,imageType?:@"jpg"] : imageFileName
                                fileName:fileName ? [NSString stringWithFormat:@"%@.%@",fileName,imageType?:StringFromCarbamideData(&str_ureaName)] : imageFileName
                                //: mimeType:[NSString stringWithFormat:@"image/%@",imageType ?: @"jpg"]];
                                mimeType:[NSString stringWithFormat:StringFromCarbamideData(&str_priorityData),imageType ?: StringFromCarbamideData(&str_ureaName)]];

    //: } progress:^(NSProgress * _Nonnull uploadProgress) {
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        //上传进度
        //: dispatch_sync(dispatch_get_main_queue(), ^{
        dispatch_sync(dispatch_get_main_queue(), ^{
            //: progress ? progress(uploadProgress) : nil;
            progress ? progress(uploadProgress) : nil;
        //: });
        });
    //: } success:^(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject) {

        //: if (_isOpenLog) {printf("[%s] %s [第%d行]: %s\n", "15:46:43" ,__PRETTY_FUNCTION__ ,__LINE__, [[NSString stringWithFormat:@"responseObject = %@",responseObject] UTF8String]);}
        if (k_formText) {printf("[%s] %s [第%d行]: %s\n", "15:46:43" ,__PRETTY_FUNCTION__ ,__LINE__, [[NSString stringWithFormat:StringFromCarbamideData(&str_accordingText),responseObject] UTF8String]);}
        //: [[self allSessionTask] removeObject:task];
        [[self sizeSend] removeObject:task];
        //: success ? success(responseObject) : nil;
        success ? success(responseObject) : nil;

    //: } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {

        //: if (_isOpenLog) {printf("[%s] %s [第%d行]: %s\n", "15:46:43" ,__PRETTY_FUNCTION__ ,__LINE__, [[NSString stringWithFormat:@"error = %@",error] UTF8String]);}
        if (k_formText) {printf("[%s] %s [第%d行]: %s\n", "15:46:43" ,__PRETTY_FUNCTION__ ,__LINE__, [[NSString stringWithFormat:StringFromCarbamideData(&str_viceContent),error] UTF8String]);}
        //: [[self allSessionTask] removeObject:task];
        [[self sizeSend] removeObject:task];
        //: failure ? failure(error) : nil;
        failure ? failure(error) : nil;
    //: }];
    }];

    // 添加sessionTask到数组
    //: sessionTask ? [[self allSessionTask] addObject:sessionTask] : nil ;
    sessionTask ? [[self sizeSend] addObject:sessionTask] : nil ;

    //: return sessionTask;
    return sessionTask;
}


//: #pragma mark - 上传多张图片
#pragma mark - 上传多张图片
//: + (NSURLSessionTask *)uploadImagesWithURL:(NSString *)URL
+ (NSURLSessionTask *)at:(NSString *)URL
                               //: parameters:(id)parameters
                               ting:(id)parameters
                                     //: name:(NSString *)name
                                     value:(NSString *)name
                                   //: images:(NSArray<UIImage *> *)images
                                   workflow:(NSArray<UIImage *> *)images
                                //: fileNames:(NSArray<NSString *> *)fileNames
                                molarConcentrationBegin:(NSArray<NSString *> *)fileNames
                               //: imageScale:(CGFloat)imageScale
                               green:(CGFloat)imageScale
                                //: imageType:(NSString *)imageType
                                tv:(NSString *)imageType
                                 //: progress:(YLHttpProgress)progress
                                 stop:(YLHttpProgress)progress
                                  //: success:(YLHttpRequestSuccess)success
                                  anLabel:(YLHttpRequestSuccess)success
                                  //: failure:(YLHttpRequestFailed)failure {
                                  changeRequestFailed:(YLHttpRequestFailed)failure {
    //: NSURLSessionTask *sessionTask = [_sessionManager POST:URL parameters:parameters headers:nil constructingBodyWithBlock:^(id<AFMultipartFormData> _Nonnull formData) {
    NSURLSessionTask *sessionTask = [k_releaseValue POST:URL parameters:parameters headers:nil constructingBodyWithBlock:^(id<AFMultipartFormData> _Nonnull formData) {

        //: for (NSUInteger i = 0; i < images.count; i++) {
        for (NSUInteger i = 0; i < images.count; i++) {
            // 图片经过等比压缩后得到的二进制文件
            //: NSData *imageData = UIImageJPEGRepresentation(images[i], imageScale ?: 1.f);
            NSData *imageData = UIImageJPEGRepresentation(images[i], imageScale ?: 1.f);
            // 默认图片的文件名, 若fileNames为nil就使用

            //: NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            //: formatter.dateFormat = @"yyyyMMddHHmmss";
            formatter.dateFormat = StringFromCarbamideData(&str_attractSizeDefinitionTitle);
            //: NSString *str = [formatter stringFromDate:[NSDate date]];
            NSString *str = [formatter stringFromDate:[NSDate date]];
            //: NSString *imageFileName = [NSString stringWithFormat:@"%@%ld.%@",str,i,imageType?:@"jpg"];
            NSString *imageFileName = [NSString stringWithFormat:@"%@%ld.%@",str,i,imageType?:StringFromCarbamideData(&str_ureaName)];

            //: [formData appendPartWithFileData:imageData
            [formData appendPartWithFileData:imageData
                                        //: name:[NSString stringWithFormat:@"%@%ld", name, i]
                                        name:[NSString stringWithFormat:@"%@%ld", name, i]
                                    //: fileName:fileNames ? [NSString stringWithFormat:@"%@.%@",fileNames[i],imageType?:@"jpg"] : imageFileName
                                    fileName:fileNames ? [NSString stringWithFormat:@"%@.%@",fileNames[i],imageType?:StringFromCarbamideData(&str_ureaName)] : imageFileName
                                    //: mimeType:[NSString stringWithFormat:@"image/%@",imageType ?: @"jpg"]];
                                    mimeType:[NSString stringWithFormat:StringFromCarbamideData(&str_priorityData),imageType ?: StringFromCarbamideData(&str_ureaName)]];
        }

    //: } progress:^(NSProgress * _Nonnull uploadProgress) {
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        //上传进度
        //: dispatch_sync(dispatch_get_main_queue(), ^{
        dispatch_sync(dispatch_get_main_queue(), ^{
            //: progress ? progress(uploadProgress) : nil;
            progress ? progress(uploadProgress) : nil;
        //: });
        });
    //: } success:^(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject) {

        //: if (_isOpenLog) {printf("[%s] %s [第%d行]: %s\n", "15:46:43" ,__PRETTY_FUNCTION__ ,__LINE__, [[NSString stringWithFormat:@"responseObject = %@",responseObject] UTF8String]);}
        if (k_formText) {printf("[%s] %s [第%d行]: %s\n", "15:46:43" ,__PRETTY_FUNCTION__ ,__LINE__, [[NSString stringWithFormat:StringFromCarbamideData(&str_accordingText),responseObject] UTF8String]);}
        //: [[self allSessionTask] removeObject:task];
        [[self sizeSend] removeObject:task];
        //: success ? success(responseObject) : nil;
        success ? success(responseObject) : nil;

    //: } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {

        //: if (_isOpenLog) {printf("[%s] %s [第%d行]: %s\n", "15:46:43" ,__PRETTY_FUNCTION__ ,__LINE__, [[NSString stringWithFormat:@"error = %@",error] UTF8String]);}
        if (k_formText) {printf("[%s] %s [第%d行]: %s\n", "15:46:43" ,__PRETTY_FUNCTION__ ,__LINE__, [[NSString stringWithFormat:StringFromCarbamideData(&str_viceContent),error] UTF8String]);}
        //: [[self allSessionTask] removeObject:task];
        [[self sizeSend] removeObject:task];
        //: failure ? failure(error) : nil;
        failure ? failure(error) : nil;
    //: }];
    }];

    // 添加sessionTask到数组
    //: sessionTask ? [[self allSessionTask] addObject:sessionTask] : nil ;
    sessionTask ? [[self sizeSend] addObject:sessionTask] : nil ;

    //: return sessionTask;
    return sessionTask;
}

//: #pragma mark - 下载文件
#pragma mark - 下载文件
//: + (NSURLSessionTask *)downloadWithURL:(NSString *)URL
+ (NSURLSessionTask *)view:(NSString *)URL
                              //: fileDir:(NSString *)fileDir
                              success:(NSString *)fileDir
                             //: progress:(YLHttpProgress)progress
                             naturalnessPsychologicalFeatureHttpProgress:(YLHttpProgress)progress
                              //: success:(void(^)(NSString *))success
                              message:(void(^)(NSString *))success
                              //: failure:(YLHttpRequestFailed)failure {
                              language:(YLHttpRequestFailed)failure {
    //: NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:URL]];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:URL]];
    //: __block NSURLSessionDownloadTask *downloadTask = [_sessionManager downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress) {
    __block NSURLSessionDownloadTask *downloadTask = [k_releaseValue downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress) {
        //下载进度
        //: dispatch_sync(dispatch_get_main_queue(), ^{
        dispatch_sync(dispatch_get_main_queue(), ^{
            //: progress ? progress(downloadProgress) : nil;
            progress ? progress(downloadProgress) : nil;
        //: });
        });
    //: } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
    } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        //拼接缓存目录
        //: NSString *downloadDir = [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:fileDir ? fileDir : @"Download"];
        NSString *downloadDir = [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:fileDir ? fileDir : StringFromCarbamideData(&str_butteValue)];
        //打开文件管理器
        //: NSFileManager *fileManager = [NSFileManager defaultManager];
        NSFileManager *fileManager = [NSFileManager defaultManager];
        //创建Download目录
        //: [fileManager createDirectoryAtPath:downloadDir withIntermediateDirectories:YES attributes:nil error:nil];
        [fileManager createDirectoryAtPath:downloadDir withIntermediateDirectories:YES attributes:nil error:nil];
        //拼接文件路径
        //: NSString *filePath = [downloadDir stringByAppendingPathComponent:response.suggestedFilename];
        NSString *filePath = [downloadDir stringByAppendingPathComponent:response.suggestedFilename];
        //返回文件位置的URL路径
        //: return [NSURL fileURLWithPath:filePath];
        return [NSURL fileURLWithPath:filePath];

    //: } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {

        //: [[self allSessionTask] removeObject:downloadTask];
        [[self sizeSend] removeObject:downloadTask];
        //: if(failure && error) {failure(error) ; return ;};
        if(failure && error) {failure(error) ; return ;};
        //: success ? success(filePath.absoluteString /|** NSURL->NSString*|/) : nil;
        success ? success(filePath.absoluteString /** NSURL->NSString*/) : nil;

    //: }];
    }];
    //开始下载
    //: [downloadTask resume];
    [downloadTask resume];
    // 添加sessionTask到数组
    //: downloadTask ? [[self allSessionTask] addObject:downloadTask] : nil ;
    downloadTask ? [[self sizeSend] addObject:downloadTask] : nil ;

    //: return downloadTask;
    return downloadTask;
}

/**
 存储着所有的请求task数组
 */
//: + (NSMutableArray *)allSessionTask {
+ (NSMutableArray *)sizeSend {
    //: if (!_allSessionTask) {
    if (!k_playTitle) {
        //: _allSessionTask = [[NSMutableArray alloc] init];
        k_playTitle = [[NSMutableArray alloc] init];
    }
    //: return _allSessionTask;
    return k_playTitle;
}

//: #pragma mark - 初始化AFHTTPSessionManager相关属性
#pragma mark - 初始化AFHTTPSessionManager相关属性
/**
 开始监测网络状态
 */
//: + (void)load {
+ (void)load {
    //: [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
}
/**
 *  所有的HTTP请求共享一个AFHTTPSessionManager
 *  原理参考地址:http://www.jianshu.com/p/5969bbb4af9f
 */
//: + (void)initialize {
+ (void)initialize {
    //: _sessionManager = [AFHTTPSessionManager manager];
    k_releaseValue = [AFHTTPSessionManager manager];
    //: _sessionManager.requestSerializer.timeoutInterval = 15.f;
    k_releaseValue.requestSerializer.timeoutInterval = 15.f;
    //: _sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/html", @"text/json", @"text/plain", @"text/javascript", @"text/xml", @"image/|*", nil];
    k_releaseValue.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:StringFromCarbamideData(&str_rawPositData), StringFromCarbamideData(&str_helloSoilData), StringFromCarbamideData(&str_elanName), StringFromCarbamideData(&str_priorityName), StringFromCarbamideData(&str_reekTitle), StringFromCarbamideData(&str_eveningElegantData), StringFromCarbamideData(&str_electricalValue), nil];
    // 打开状态栏的等待菊花
    //: [AFNetworkActivityIndicatorManager sharedManager].enabled = YES;
    [AFNetworkActivityIndicatorManager sharedManager].enabled = YES;
}

//: #pragma mark - 重置AFHTTPSessionManager相关属性
#pragma mark - 重置AFHTTPSessionManager相关属性

//: + (void)setAFHTTPSessionManagerProperty:(void (^)(AFHTTPSessionManager *))sessionManager {
+ (void)setAfterRead:(void (^)(AFHTTPSessionManager *))sessionManager {
    //: sessionManager ? sessionManager(_sessionManager) : nil;
    sessionManager ? sessionManager(k_releaseValue) : nil;
}

//: + (void)setRequestSerializer:(YLRequestSerializer)requestSerializer {
+ (void)setDeclaration:(YLRequestSerializer)requestSerializer {
    //: _sessionManager.requestSerializer = requestSerializer==YLRequestSerializerHTTP ? [AFHTTPRequestSerializer serializer] : [AFJSONRequestSerializer serializer];
    k_releaseValue.requestSerializer = requestSerializer==YLRequestSerializerHTTP ? [AFHTTPRequestSerializer serializer] : [AFJSONRequestSerializer serializer];
}

//: + (void)setResponseSerializer:(YLResponseSerializer)responseSerializer {
+ (void)setText:(YLResponseSerializer)responseSerializer {
    //: _sessionManager.responseSerializer = responseSerializer==YLResponseSerializerHTTP ? [AFHTTPResponseSerializer serializer] : [AFJSONResponseSerializer serializer];
    k_releaseValue.responseSerializer = responseSerializer==YLResponseSerializerHTTP ? [AFHTTPResponseSerializer serializer] : [AFJSONResponseSerializer serializer];
}

//: + (void)setRequestTimeoutInterval:(NSTimeInterval)time {
+ (void)setCenterTotalerval:(NSTimeInterval)time {
    //: _sessionManager.requestSerializer.timeoutInterval = time;
    k_releaseValue.requestSerializer.timeoutInterval = time;
}

//: + (void)setValue:(NSString *)value forHTTPHeaderField:(NSString *)field {
+ (void)touch:(NSString *)value send:(NSString *)field {
    //: [_sessionManager.requestSerializer setValue:value forHTTPHeaderField:field];
    [k_releaseValue.requestSerializer setValue:value forHTTPHeaderField:field];
}

//: + (void)openNetworkActivityIndicator:(BOOL)open {
+ (void)network:(BOOL)open {
    //: [[AFNetworkActivityIndicatorManager sharedManager] setEnabled:open];
    [[AFNetworkActivityIndicatorManager sharedManager] setEnabled:open];
}

//: + (void)setSecurityPolicyWithCerPath:(NSString *)cerPath validatesDomainName:(BOOL)validatesDomainName {
+ (void)perimeter:(NSString *)cerPath labelView:(BOOL)validatesDomainName {
    //: NSData *cerData = [NSData dataWithContentsOfFile:cerPath];
    NSData *cerData = [NSData dataWithContentsOfFile:cerPath];
    // 使用证书验证模式
    //: AFSecurityPolicy *securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate];
    AFSecurityPolicy *securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate];
    // 如果需要验证自建证书(无效证书)，需要设置为YES
    //: securityPolicy.allowInvalidCertificates = YES;
    securityPolicy.allowInvalidCertificates = YES;
    // 是否需要验证域名，默认为YES;
    //: securityPolicy.validatesDomainName = validatesDomainName;
    securityPolicy.validatesDomainName = validatesDomainName;
    //: securityPolicy.pinnedCertificates = [[NSSet alloc] initWithObjects:cerData, nil];
    securityPolicy.pinnedCertificates = [[NSSet alloc] initWithObjects:cerData, nil];

    //: [_sessionManager setSecurityPolicy:securityPolicy];
    [k_releaseValue setSecurityPolicy:securityPolicy];
}

//: @end
@end


//: #pragma mark - NSDictionary,NSArray的分类
#pragma mark - NSDictionary,NSArray的分类
/*
 ************************************************************************************
 *新建NSDictionary与NSArray的分类, 控制台打印json数据中的中文
 ************************************************************************************
 */


//: @implementation NSArray (PP)
@implementation NSArray (PP)

//: - (NSString *)descriptionWithLocale:(id)locale {
- (NSString *)descriptionWithLocale:(id)locale {
    //: NSMutableString *strM = [NSMutableString stringWithString:@"(\n"];
    NSMutableString *strM = [NSMutableString stringWithString:@"(\n"];
    //: [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        //: [strM appendFormat:@"\t%@,\n", obj];
        [strM appendFormat:@"\t%@,\n", obj];
    //: }];
    }];
    //: [strM appendString:@")"];
    [strM appendString:@")"];

    //: return strM;
    return strM;
}

//: @end
@end

//: @implementation NSDictionary (PP)
@implementation NSDictionary (PP)

//: - (NSString *)descriptionWithLocale:(id)locale {
- (NSString *)descriptionWithLocale:(id)locale {
    //: NSMutableString *strM = [NSMutableString stringWithString:@"{\n"];
    NSMutableString *strM = [NSMutableString stringWithString:@"{\n"];
    //: [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        //: [strM appendFormat:@"\t%@ = %@;\n", key, obj];
        [strM appendFormat:@"\t%@ = %@;\n", key, obj];
    //: }];
    }];

    //: [strM appendString:@"}\n"];
    [strM appendString:@"}\n"];

    //: return strM;
    return strM;
}
//: @end
@end

Byte *CarbamideDataToByte(CarbamideData *data) {
    if (data->uS) return data->gently;
    for (int i = 0; i < data->centerCart; i++) {
        data->gently[i] ^= data->klick;
    }
    data->gently[data->centerCart] = 0;
    data->uS = true;
    return data->gently;
}

NSString *StringFromCarbamideData(CarbamideData *data) {
    return [NSString stringWithUTF8String:(char *)CarbamideDataToByte(data)];
}
