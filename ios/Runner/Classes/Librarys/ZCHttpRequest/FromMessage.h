// __DEBUG__
// __CLOSE_PRINT__
//
//  FromMessage.h
//  ZCBusinessCar
//
//  Created by peng on 2021/2/24.
//

// __M_A_C_R_O__
//: #import <Foundation/Foundation.h>
#import <Foundation/Foundation.h>
//: #import <AFNetworking/AFNetworking.h>
#import <AFNetworking/AFNetworking.h>
//: #import <SDWebImage/SDWebImage.h>
#import <SDWebImage/SDWebImage.h>

/**
 *  是否开启https SSL 验证
 *  @return YES为开启，NO为关闭
 */


/**
 *  SSL 证书名称，仅支持cer格式。“app.bishe.com.cer”,则填“app.bishe.com”
 */


//请求成功的回调block
//: typedef void(^ResponseSuccess)(id responseObject);
typedef void(^ResponseSuccess)(id responseObject);

//请求失败的回调block
//: typedef void(^ResponseFailed)(id responseObject ,NSError *error);
typedef void(^ResponseFailed)(id responseObject ,NSError *error);

//文件下载的成功回调block
//: typedef void(^DownloadSuccess)(NSURLResponse *response, NSURL *filePath);
typedef void(^DownloadSuccess)(NSURLResponse *response, NSURL *filePath);

//文件下载的失败回调block
//: typedef void(^DownloadFailed)( NSError *error);
typedef void(^DownloadFailed)( NSError *error);

//文件上传下载的进度block
//: typedef void (^HttpProgress)(NSProgress *progress);
typedef void (^HttpProgress)(NSProgress *progress);


//: @interface ZCHttpManager : NSObject
@interface FromMessage : NSObject

/**
 管理者单例
 */
//: + (instancetype)sharedManager;
+ (instancetype)shared;

//: @property (nonatomic, copy) NSString *lastLang;
@property (nonatomic, copy) NSString *lastLang;


/**
 get请求

 @param urlStr 请求url
 @param params 参数
 @param success 成功回调
 @param failed 失败回调
 */

//: + (void)getWithUrl:(NSString *)urlStr
+ (void)maxColor:(NSString *)urlStr
            //: params:(NSDictionary *)params
            flush:(NSDictionary *)params
            //: isShow:(BOOL)isShow
            countIn:(BOOL)isShow
           //: success:(ResponseSuccess)success
           alongResponseSuccess:(ResponseSuccess)success
            //: failed:(ResponseFailed)failed;
            searched:(ResponseFailed)failed;

//: + (void)getWithUrl: (NSString *)urlStr
+ (void)center: (NSString *)urlStr
            //: params: (NSDictionary *)params
            bottom: (NSDictionary *)params
            //: isShow: (BOOL)isShow
            showTime: (BOOL)isShow
         //: cacheTime: (int)cacheDuration
         should: (int)cacheDuration
       //: mustResrush: (BOOL)mustResrush
       get: (BOOL)mustResrush
           //: success: (ResponseSuccess)success
           ting: (ResponseSuccess)success
            //: failed: (ResponseFailed)failed;
            dataOf: (ResponseFailed)failed;




/**
 post请求

 @param urlStr 请求url
 @param params 参数
 @param success 成功回调
 @param failed 失败回调
 */
//: + (void)postWithUrl: (NSString *)urlStr
+ (void)inputFailed: (NSString *)urlStr
             //: params: (NSDictionary *)params
             cartridge: (NSDictionary *)params
             //: isShow: (BOOL)isShow
             addView: (BOOL)isShow
            //: success: (ResponseSuccess)success
            range: (ResponseSuccess)success
             //: failed: (ResponseFailed)failed;
             doingPath: (ResponseFailed)failed;

//: + (void)postWithUrl: (NSString *)urlStr
+ (void)labFailed: (NSString *)urlStr
             //: params: (NSDictionary *)params
             contact: (NSDictionary *)params
             //: isShow: (BOOL)isShow
             key: (BOOL)isShow
          //: cacheTime: (int)cacheDuration
          picture: (int)cacheDuration
        //: mustResrush: (BOOL)mustResrush
        quickFailed: (BOOL)mustResrush
            //: success: (ResponseSuccess)success
            info: (ResponseSuccess)success
             //: failed: (ResponseFailed)failed;
             ting: (ResponseFailed)failed;

//: + (void)postWithUrl: (NSString *)urlStr
+ (void)vertical: (NSString *)urlStr
           //: checksum: (NSString *)checksum
           index: (NSString *)checksum
              //: nonce: (NSString *)nonce
              astute: (NSString *)nonce
            //: CurTime: (NSString *)CurTime
            file: (NSString *)CurTime
             //: params: (NSDictionary *)params
             to: (NSDictionary *)params
            //: success: (ResponseSuccess)success
            militaryPostMarkFailed: (ResponseSuccess)success
             //: failed: (ResponseFailed)failed;
             quick: (ResponseFailed)failed;

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
//: + (void)uploadFileWithURL:(NSString *)URL
+ (void)sendEnable:(NSString *)URL
               //: parameters:(id)parameters
               pin:(id)parameters
                     //: name:(NSString *)name
                     icon:(NSString *)name
                 //: filePath:(NSURL *)filePath
                 session_strong:(NSURL *)filePath
                 //: progress:(HttpProgress)progress
                 downMin:(HttpProgress)progress
                  //: success:(ResponseSuccess)success
                  colorInfo:(ResponseSuccess)success
                   //: failed:(ResponseFailed)failed;
                   border:(ResponseFailed)failed;


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
//: + (void)uploadImagesWithURL:(NSString *)URL
+ (void)call:(NSString *)URL
                 //: parameters:(id)parameters
                 progress:(id)parameters
                     //: images:(NSArray<NSData *> *)images
                     when:(NSArray<NSData *> *)images
                   //: progress:(HttpProgress)progress
                   tap:(HttpProgress)progress
                    //: success:(ResponseSuccess)success
                    displayResponseSuccess:(ResponseSuccess)success
                     //: failed:(ResponseFailed)failed;
                     bluishFailed:(ResponseFailed)failed;



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

//: + (void)uploadImagesWithURL:(NSString *)URL
+ (void)item:(NSString *)URL
                 //: parameters:(id)parameters
                 page:(id)parameters
                       //: name:(NSString *)name
                       message:(NSString *)name
                     //: images:(NSArray<UIImage *> *)images
                     occurrent:(NSArray<UIImage *> *)images
                  //: fileNames:(NSArray<NSString *> *)fileNames
                  streetSmart:(NSArray<NSString *> *)fileNames
                 //: imageScale:(CGFloat)imageScale
                 positionCreche:(CGFloat)imageScale
                  //: imageType:(NSString *)imageType
                  value_strong:(NSString *)imageType
                   //: progress:(HttpProgress)progress
                   input:(HttpProgress)progress
                    //: success:(ResponseSuccess)success
                    green:(ResponseSuccess)success
                     //: failed:(ResponseFailed)failed;
                     signaling:(ResponseFailed)failed;



/// 新增
//: + (void)uploadImagesWithURL:(NSString *)URL
+ (void)imageText:(NSString *)URL
                 //: parameters:(id)parameters
                 touch:(id)parameters
                     //: images:(NSArray<NSData *> *)images
                     length:(NSArray<NSData *> *)images
                 //: imageNames:(NSArray<NSString *> *)imageNames
                 input:(NSArray<NSString *> *)imageNames
                   //: progress:(HttpProgress)progress
                   imageHttpProgress:(HttpProgress)progress
                    //: success:(ResponseSuccess)success
                    high:(ResponseSuccess)success
                     //: failed:(ResponseFailed)failed;
                     label:(ResponseFailed)failed;




//: + (void)uploadVideoWithURL:(NSString *)URL
+ (void)my:(NSString *)URL
                 //: parameters:(id)parameters
                 origin:(id)parameters
                     //: images:(NSData *)videoData
                     reloadity:(NSData *)videoData
                 //: coverImage:(NSData *)coverData
                 uploadImageFailed:(NSData *)coverData
                   //: progress:(HttpProgress)progress
                   maxFailed:(HttpProgress)progress
                    //: success:(ResponseSuccess)success
                    bar:(ResponseSuccess)success
                    //: failed:(ResponseFailed)failed;
                    domain:(ResponseFailed)failed;


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
//: + (void)downloadWithURL:(NSString *)URL
+ (void)underCell:(NSString *)URL
                //: fileDir:(NSString *)fileDir
                stepIn:(NSString *)fileDir
               //: progress:(HttpProgress)progress
               lightFailed:(HttpProgress)progress
                //: success:(void(^)(NSString *filePath))success
                userKey:(void(^)(NSString *filePath))success
                 //: failed:(ResponseFailed)failed;
                 circle:(ResponseFailed)failed;

//: @end
@end