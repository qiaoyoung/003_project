//
//  ZCHttpManager.h
//  ZCBusinessCar
//
//  Created by peng on 2021/2/24.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>
#import <SDWebImage/SDWebImage.h>


#define NSStringFormat(format,...) [NSString stringWithFormat:format,##__VA_ARGS__]

/**
 *  是否开启https SSL 验证
 *  @return YES为开启，NO为关闭
 */
#define openHttpsSSL NO

/**
 *  SSL 证书名称，仅支持cer格式。“app.bishe.com.cer”,则填“app.bishe.com”
 */
#define certificate @"xiaokaapi.com"

//请求成功的回调block
typedef void(^ResponseSuccess)(id responseObject);

//请求失败的回调block
typedef void(^ResponseFailed)(id responseObject ,NSError *error);

//文件下载的成功回调block
typedef void(^DownloadSuccess)(NSURLResponse *response, NSURL *filePath);

//文件下载的失败回调block
typedef void(^DownloadFailed)( NSError *error);

//文件上传下载的进度block
typedef void (^HttpProgress)(NSProgress *progress);


@interface ZCHttpManager : NSObject

/**
 管理者单例
 */
+ (instancetype)sharedManager;

@property (nonatomic, copy) NSString *lastLang;


/**
 get请求

 @param urlStr 请求url
 @param params 参数
 @param success 成功回调
 @param failed 失败回调
 */

+ (void)getWithUrl:(NSString *)urlStr
            params:(NSDictionary *)params
            isShow:(BOOL)isShow
           success:(ResponseSuccess)success
            failed:(ResponseFailed)failed;

+ (void)getWithUrl: (NSString *)urlStr
            params: (NSDictionary *)params
            isShow: (BOOL)isShow
         cacheTime: (int)cacheDuration
       mustResrush: (BOOL)mustResrush
           success: (ResponseSuccess)success
            failed: (ResponseFailed)failed;




/**
 post请求

 @param urlStr 请求url
 @param params 参数
 @param success 成功回调
 @param failed 失败回调
 */
+ (void)postWithUrl: (NSString *)urlStr
             params: (NSDictionary *)params
             isShow: (BOOL)isShow
            success: (ResponseSuccess)success
             failed: (ResponseFailed)failed;

+ (void)postWithUrl: (NSString *)urlStr
             params: (NSDictionary *)params
             isShow: (BOOL)isShow
          cacheTime: (int)cacheDuration
        mustResrush: (BOOL)mustResrush
            success: (ResponseSuccess)success
             failed: (ResponseFailed)failed;

+ (void)postWithUrl: (NSString *)urlStr
           checksum: (NSString *)checksum
              nonce: (NSString *)nonce
            CurTime: (NSString *)CurTime
             params: (NSDictionary *)params
            success: (ResponseSuccess)success
             failed: (ResponseFailed)failed;

/**
 * 上传文件
 *  @param URL 请求地址
 *  @param parameters 请求参数
 *  @param name              文件对应服务器上的字段
 *  @param filePath     文件本地的沙盒路径
 *  @param progress     上传进度信息
 *  @param success       请求成功的回调
 *  @param failed    请求失败的回调
 */
+ (void)uploadFileWithURL:(NSString *)URL
               parameters:(id)parameters
                     name:(NSString *)name
                 filePath:(NSURL *)filePath
                 progress:(HttpProgress)progress
                  success:(ResponseSuccess)success
                   failed:(ResponseFailed)failed;


/**
 * 上传单/多张图片
 * 注意：多张图片需要接口支持，有的服务接口只支持数组的第一个数据
 * @param URL  请求地址
 * @param parameters 请求参数
 * @param images 图片数组
 * @param progress 上传进度信息
 * @param success 请求成功的回调
 * @param failed 请求失败的回调
 */
+ (void)uploadImagesWithURL:(NSString *)URL
                 parameters:(id)parameters
                     images:(NSArray<NSData *> *)images
                   progress:(HttpProgress)progress
                    success:(ResponseSuccess)success
                     failed:(ResponseFailed)failed;



/**
 *  上传单/多张图片
 *
 *  @param URL        请求地址
 *  @param parameters 请求参数
 *  @param name       图片对应服务器上的字段
 *  @param images     图片数组
 *  @param fileNames  图片文件名数组, 可以为nil, 数组内的文件名默认为当前日期时间"yyyyMMddHHmmss"
 *  @param imageScale 图片文件压缩比 范围 (0.f ~ 1.f)
 *  @param imageType  图片文件的类型,例:png、jpg(默认类型)....
 *  @param progress   上传进度信息
 *  @param success    请求成功的回调
 *  @param failed    请求失败的回调
 *
 */

+ (void)uploadImagesWithURL:(NSString *)URL
                 parameters:(id)parameters
                       name:(NSString *)name
                     images:(NSArray<UIImage *> *)images
                  fileNames:(NSArray<NSString *> *)fileNames
                 imageScale:(CGFloat)imageScale
                  imageType:(NSString *)imageType
                   progress:(HttpProgress)progress
                    success:(ResponseSuccess)success
                     failed:(ResponseFailed)failed;



/// 新增
+ (void)uploadImagesWithURL:(NSString *)URL
                 parameters:(id)parameters
                     images:(NSArray<NSData *> *)images
                 imageNames:(NSArray<NSString *> *)imageNames
                   progress:(HttpProgress)progress
                    success:(ResponseSuccess)success
                     failed:(ResponseFailed)failed;




+ (void)uploadVideoWithURL:(NSString *)URL
                 parameters:(id)parameters
                     images:(NSData *)videoData
                 coverImage:(NSData *)coverData
                   progress:(HttpProgress)progress
                    success:(ResponseSuccess)success
                    failed:(ResponseFailed)failed;


/**
 *  下载文件
 *
 *  @param URL      请求地址
 *  @param fileDir  文件存储目录(默认存储目录为Download)
 *  @param progress 文件下载的进度信息
 *  @param success  下载成功的回调(回调参数filePath:文件的路径)
 *  @param failed  下载失败的回调
 *
 *   返回NSURLSessionDownloadTask实例，可用于暂停继续，暂停调用suspend方法，开始下载调用resume方法
 */
+ (void)downloadWithURL:(NSString *)URL
                fileDir:(NSString *)fileDir
               progress:(HttpProgress)progress
                success:(void(^)(NSString *filePath))success
                 failed:(ResponseFailed)failed;

@end
