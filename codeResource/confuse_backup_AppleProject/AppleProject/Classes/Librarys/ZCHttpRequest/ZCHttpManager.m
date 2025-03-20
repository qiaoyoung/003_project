//
//  ZCHttpManager.m
//  ZCBusinessCar
//
//  Created by peng on 2021/2/24.
//

#import "ZCHttpManager.h"
#import<CommonCrypto/CommonDigest.h>

@interface ZCHttpManager ()

@property (nonatomic,strong) AFHTTPSessionManager *manager;

@end

@implementation ZCHttpManager

+ (instancetype)sharedManager{
    static ZCHttpManager *sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [ZCHttpManager new];
    });
    return sharedManager;
}

- (id)init{
    if (self = [super init]) {
        AFSecurityPolicy *securityPolicy = [ZCHttpManager defaultSecurityPolicy];
        _manager = [AFHTTPSessionManager manager];
        _manager.securityPolicy = securityPolicy;
        _manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/plain",@"text/html", nil];
        //_dbQueue = [[HMDBManager shareManager] dbQueue];
        
    }
    return self;
}

/**
 *不验证https 不验证时
 */
+ (AFSecurityPolicy *)defaultSecurityPolicy{
    AFSecurityPolicy *securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    securityPolicy.allowInvalidCertificates = YES;
    securityPolicy.validatesDomainName = NO;
    return securityPolicy;
}

/**
 *https验证
 */
+ (AFSecurityPolicy *)customSecurityPolicy {
    // /先导入证书
    NSString *cerPath = [[NSBundle mainBundle] pathForResource:certificate ofType:@"cer"]; //证书的路径
    NSData *certData = [NSData dataWithContentsOfFile:cerPath];
    // AFSSLPinningModeCertificate 使用证书验证模式
    AFSecurityPolicy *securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModePublicKey];
    
    // allowInvalidCertificates 是否允许无效证书（也就是自建的证书），默认为NO
    // 如果是需要验证自建证书，需要设置为YES
    securityPolicy.allowInvalidCertificates = NO;
    
    //validatesDomainName 是否需要验证域名，默认为YES；
    //假如证书的域名与你请求的域名不一致，需把该项设置为NO；如设成NO的话，即服务器使用其他可信任机构颁发的证书，也可以建立连接，这个非常危险，建议打开。
    //置为NO，主要用于这种情况：客户端请求的是子域名，而证书上的是另外一个域名。因为SSL证书上的域名是独立的，假如证书上注册的域名是www.google.com，那么mail.google.com是无法验证通过的；当然，有钱可以注册通配符的域名*.google.com，但这个还是比较贵的。
    //如置为NO，建议自己添加对应域名的校验逻辑。
    securityPolicy.validatesDomainName = YES;
    securityPolicy.pinnedCertificates = [NSSet setWithArray:@[certData]];
    return securityPolicy;
}

+ (void)getWithUrl:(NSString *)urlStr
            params:(NSDictionary *)params
            isShow:(BOOL)isShow
           success:(ResponseSuccess)success
            failed:(ResponseFailed)failed{
    
    if (![urlStr containsString:@"http"]){
        urlStr = RestApi(urlStr);
    }
    
    [self getWithUrl:urlStr params:params isShow:isShow cacheTime:0 mustResrush:YES success:success failed:failed];
}

+ (void)getWithUrl: (NSString *)urlStr
            params: (NSDictionary *)params
            isShow: (BOOL)isShow
         cacheTime: (int)cacheDuration
       mustResrush: (BOOL)mustResrush
           success: (ResponseSuccess)success
            failed: (ResponseFailed)failed{

    if (isShow) {
            [SVProgressHUD show];
        }
    AFHTTPSessionManager *manager = [ZCHttpManager sharedManager].manager;
    //添加请求头
    NSString *loginToken = [NIMUserDefaults standardUserDefaults].loginToken;
    NSString *lang = emptyString([NIMUserDefaults standardUserDefaults].language);
    [manager.requestSerializer setValue:lang forHTTPHeaderField:@"lang"];

    if ([NIMUserDefaults standardUserDefaults].loginToken.length > 0) {
        NSLog(@"Token--:%@",loginToken);
        NSLog(@"%@\n------%@",urlStr,params);

        [manager.requestSerializer setValue:loginToken forHTTPHeaderField:@"token"];
    }
    NSURLSessionDataTask *task = [manager GET:urlStr parameters:params  headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if (![urlStr containsString:@"systemSetting"] && ![urlStr containsString:@"loginip"]) {
            NSLog(@"%@\n------%@\n%@",urlStr,params,responseObject);
        }
        if (isShow) {
            [SVProgressHUD dismissWithDelay:0.25];
        }
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (isShow) {
            [SVProgressHUD dismissWithDelay:0.25];
        }
        failed(nil ,error);
    }];
    [[ZCHttpManager sharedManager] addTask:task];
}

+ (void)postWithUrl: (NSString *)urlStr
           checksum: (NSString *)checksum
              nonce: (NSString *)nonce
            CurTime: (NSString *)CurTime
             params: (NSDictionary *)params
            success: (ResponseSuccess)success
             failed: (ResponseFailed)failed
{
    AFHTTPSessionManager *manager = [ZCHttpManager sharedManager].manager;
    
    //添加请求头
    NSString *appKey = [[CCCConfig sharedConfig] appKey];
    [manager.requestSerializer setValue:appKey forHTTPHeaderField:@"AppKey"];
//    NSString *nonce = [NSString stringWithFormat:@"%d",arc4random() % 100 ];
    [manager.requestSerializer setValue:nonce forHTTPHeaderField:@"Nonce"];
//    NSString *time = [self getNowTimeTimestamp];
    [manager.requestSerializer setValue:CurTime forHTTPHeaderField:@"CurTime"];
//    NSString *CheckSums = [self sha1:[NSString stringWithFormat:@"%@%@%@",appKey,nonce,time]];
    [manager.requestSerializer setValue:checksum forHTTPHeaderField:@"CheckSum"];
    
    NSLog(@"%@\n------%@",urlStr,params);
    NSURLSessionDataTask *task = [manager POST:urlStr parameters:params headers:nil  progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failed(nil ,error);
    }];
    [[ZCHttpManager sharedManager] addTask:task];
}

+ (NSString *)getNowTimeTimestamp{

    NSDate *datenow = [NSDate date];
    NSTimeZone *zone = [NSTimeZone localTimeZone];
  // 获取指定时间所在时区与UTC时区的间隔秒数
  NSInteger seconds = [zone secondsFromGMTForDate:[NSDate date]];
  NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[datenow timeIntervalSince1970] - seconds];
  return timeSp;
}

//sha1加密方式
+ (NSString *)sha1:(NSString *)input
{
    //const char *cstr = [input cStringUsingEncoding:NSUTF8StringEncoding];
    //NSData *data = [NSData dataWithBytes:cstr length:input.length];
    
     NSData *data = [input dataUsingEncoding:NSUTF8StringEncoding];
    uint8_t digest[CC_SHA1_DIGEST_LENGTH];

    CC_SHA1(data.bytes, (unsigned int)data.length, digest);
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
    for(int i=0; i<CC_SHA1_DIGEST_LENGTH; i++) {
        [output appendFormat:@"%02x", digest[i]];
    }
    
    return output;
}

+ (void)postWithUrl: (NSString *)urlStr
             params: (NSDictionary *)params
             isShow: (BOOL)isShow
            success: (ResponseSuccess)success
             failed: (ResponseFailed)failed{
    
    if (![urlStr containsString:@"http"]){
        urlStr = RestApi(urlStr);
    }
    
    [self postWithUrl:urlStr params:params isShow:isShow cacheTime:0 mustResrush:YES success:success failed:failed];
}

+ (void)postWithUrl: (NSString *)urlStr
             params: (NSDictionary *)params
             isShow: (BOOL)isShow
          cacheTime: (int)cacheDuration
        mustResrush: (BOOL)mustResrush
            success: (ResponseSuccess)success
             failed: (ResponseFailed)failed{
    AFHTTPSessionManager *manager = [ZCHttpManager sharedManager].manager;
    
    //添加请求头
    NSString *loginToken = [NIMUserDefaults standardUserDefaults].loginToken;
    NSString *lang = emptyString([NIMUserDefaults standardUserDefaults].language);
    [manager.requestSerializer setValue:lang forHTTPHeaderField:@"lang"];
    
    
    if ([NIMUserDefaults standardUserDefaults].loginToken.length > 0) {
        NSLog(@"Token--:%@",loginToken);
        NSLog(@"%@\n------%@",urlStr,params);

        [manager.requestSerializer setValue:loginToken forHTTPHeaderField:@"token"];
    }
    
    NSURLSessionDataTask *task = [manager POST:urlStr parameters:params headers:nil  progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failed(nil ,error);
    }];
    [[ZCHttpManager sharedManager] addTask:task];
}


+ (void)uploadFileWithURL:(NSString *)URL
               parameters:(id)parameters
                     name:(NSString *)name
                 filePath:(NSURL *)filePath
                 progress:(HttpProgress)progress
                  success:(ResponseSuccess)success
                   failed:(ResponseFailed)failed{
    
    
    if (![URL containsString:@"http"]){
        URL = RestApi(URL);
    }
    
    AFHTTPSessionManager *manager = [ZCHttpManager sharedManager].manager;
    
    NSURLSessionDataTask *t = [manager POST:URL parameters:parameters  headers:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        NSError *error = nil;
        [formData appendPartWithFileURL:filePath name:name error:&error];
        (failed && error) ? failed(nil ,error) : nil;
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        dispatch_sync(dispatch_get_main_queue(), ^{//上传进度
            progress ? progress(uploadProgress) : nil;
        });
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success ? success(responseObject) : nil;

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failed ? failed(nil ,error) : nil;
    }];
    [[ZCHttpManager sharedManager] addTask:t];
}

+ (void)uploadImagesWithURL:(NSString *)URL
                 parameters:(id)parameters
                     images:(NSArray<NSData *> *)images
                   progress:(HttpProgress)progress
                    success:(ResponseSuccess)success
                     failed:(ResponseFailed)failed{
    
    if (![URL containsString:@"http"]){
        URL = RestApi(URL);
    }
    
    AFHTTPSessionManager *manager = [ZCHttpManager sharedManager].manager;
    NSString *lang = emptyString([NIMUserDefaults standardUserDefaults].language);
    [manager.requestSerializer setValue:lang forHTTPHeaderField:@"lang"];
    
    NSURLSessionDataTask *t = [manager POST:URL parameters:parameters headers:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        for (NSUInteger i = 0; i < images.count; i++) {
            //NSData *imageData = UIImageJPEGRepresentation(images[i], 0.5);// 图片经过等比压缩后得到的二进制文件
            NSData *imageData = images[i];

            NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[[NSDate date] timeIntervalSince1970]];
            
            NSString *imageTypeSuffix = @"jpg";
            SDImageFormat imageType = [NSData sd_imageFormatForImageData:imageData];
            switch (imageType) {
                case SDImageFormatJPEG:
                    imageTypeSuffix = @"jpg";
                    break;
                case SDImageFormatPNG:
                    imageTypeSuffix = @"png";
                    break;
                case SDImageFormatGIF:
                    imageTypeSuffix = @"gif";
                    break;
                default:
                    break;
            }
            NSString *fileName = NSStringFormat(@"%@%ld.%@",timeSp,i,imageTypeSuffix);
            NSString *mimeType = NSStringFormat(@"image/%@",imageTypeSuffix);
//            NSString *mimeType = @"video/mp4";
            [formData appendPartWithFileData:imageData name:@"image" fileName:fileName mimeType:mimeType];
        }
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        if (progress) {
            progress(uploadProgress);
        }
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"image%@\n%@\n--------\n%@",URL,parameters,responseObject);
        success ? success(responseObject) : nil;
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failed ? failed(nil ,error) : nil;
    }];
    
    [[ZCHttpManager sharedManager] addTask:t];
}

+ (void)uploadImagesWithURL:(NSString *)URL
                 parameters:(id)parameters
                     images:(NSArray<NSData *> *)images
                 imageNames:(NSArray<NSString *> *)imageNames
                   progress:(HttpProgress)progress
                    success:(ResponseSuccess)success
                     failed:(ResponseFailed)failed{
    
    if (![URL containsString:@"http"]){
        URL = RestApi(URL);
    }
    
    AFHTTPSessionManager *manager = [ZCHttpManager sharedManager].manager;
    NSURLSessionDataTask *t = [manager POST:URL parameters:parameters headers:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        for (NSUInteger i = 0; i < images.count; i++) {
            //NSData *imageData = UIImageJPEGRepresentation(images[i], 0.5);// 图片经过等比压缩后得到的二进制文件
            NSData *imageData = images[i];

            NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[[NSDate date] timeIntervalSince1970]];
            
            NSString *imageTypeSuffix = @"jpg";
            SDImageFormat imageType = [NSData sd_imageFormatForImageData:imageData];
            switch (imageType) {
                case SDImageFormatJPEG:
                    imageTypeSuffix = @"jpg";
                    break;
                case SDImageFormatPNG:
                    imageTypeSuffix = @"png";
                    break;
                case SDImageFormatGIF:
                    imageTypeSuffix = @"gif";
                    break;
                default:
                    break;
            }
            NSString *fileName = NSStringFormat(@"%@%ld.%@",timeSp,i,imageTypeSuffix);
            NSString *mimeType = NSStringFormat(@"image/%@",imageTypeSuffix);
//            NSString *mimeType = @"video/mp4";
            
            NSString *name = [imageNames objectAtIndex:i] ? :@"image";
            [formData appendPartWithFileData:imageData name:name fileName:fileName mimeType:mimeType];
        }
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        if (progress) {
            progress(uploadProgress);
        }
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@\n%@\n--------\n%@",URL,parameters,responseObject);
        success ? success(responseObject) : nil;
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failed ? failed(nil ,error) : nil;
    }];
    
    [[ZCHttpManager sharedManager] addTask:t];
}

+ (void)uploadImagesWithURL:(NSString *)URL
                 parameters:(id)parameters
                       name:(NSString *)name
                     images:(NSArray<UIImage *> *)images
                  fileNames:(NSArray<NSString *> *)fileNames
                 imageScale:(CGFloat)imageScale
                  imageType:(NSString *)imageType
                   progress:(HttpProgress)progress
                    success:(ResponseSuccess)success
                     failed:(ResponseFailed)failed{
    
    AFHTTPSessionManager *manager = [ZCHttpManager sharedManager].manager;
    NSURLSessionDataTask *t = [manager POST:URL parameters:parameters  headers:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {

        for (NSUInteger i = 0; i < images.count; i++) {
            NSData *imageData = UIImageJPEGRepresentation(images[i], imageScale ?: 1.f);// 图片经过等比压缩后得到的二进制文件
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];// 默认图片的文件名, 若fileNames为nil就使用
            formatter.dateFormat = @"yyyyMMddHHmmss";
            NSString *str = [formatter stringFromDate:[NSDate date]];
            NSString *imageFileName = NSStringFormat(@"%@%ld.%@",str,i,imageType?:@"jpg");
            
            NSString *fileName = fileNames ? NSStringFormat(@"%@.%@",fileNames[i],imageType?:@"jpg") : imageFileName;
            NSString *mimeType = NSStringFormat(@"image/%@",imageType ?: @"jpg");
            [formData appendPartWithFileData:imageData name:name fileName:fileName mimeType:mimeType];
        }
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        if (progress) {
            progress(uploadProgress);
        }
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success ? success(responseObject) : nil;
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failed ? failed(nil ,error) : nil;
    }];
    
    [[ZCHttpManager sharedManager] addTask:t];
}


+ (void)uploadVideoWithURL:(NSString *)URL
                 parameters:(id)parameters
                     images:(NSData *)videoData
                 coverImage:(NSData *)coverData
                   progress:(HttpProgress)progress
                    success:(ResponseSuccess)success
                     failed:(ResponseFailed)failed{
    
    if (![URL containsString:@"http"]){
        URL = RestApi(URL);
    }
    
    AFHTTPSessionManager *manager = [ZCHttpManager sharedManager].manager;
    NSURLSessionDataTask *t = [manager POST:URL parameters:parameters  headers:nil constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
  
        NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[[NSDate date] timeIntervalSince1970]];
        NSString *fileName = NSStringFormat(@"%@.mp4",timeSp);
        NSString *mimeType = @"video/mp4";
        [formData appendPartWithFileData:videoData name:@"video" fileName:fileName mimeType:mimeType];
        [formData appendPartWithFileData:coverData name:@"picture" fileName:NSStringFormat(@"%@.jpg",timeSp) mimeType:@"image/jpg"];
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        if (progress) {
            progress(uploadProgress);
        }
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@\n%@\n--------\n%@",URL,parameters,responseObject);
        success ? success(responseObject) : nil;
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failed ? failed(nil ,error) : nil;
    }];
    
    [[ZCHttpManager sharedManager] addTask:t];
}




+ (void)downloadWithURL:(NSString *)URL
                fileDir:(NSString *)fileDir
               progress:(HttpProgress)progress
                success:(void(^)(NSString *filePath))success
                 failed:(ResponseFailed)failed{
    
    
    if (![URL containsString:@"http"]){
        URL = RestApi(URL);
    }
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:URL]];
    AFHTTPSessionManager *manager = [ZCHttpManager sharedManager].manager;
    NSURLSessionDownloadTask *downloadTask = [manager downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress) {
        if (progress) {
            progress(downloadProgress);
        }
    } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        //拼接缓存目录
        NSString *downloadDir = [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:fileDir ? fileDir : @"Download"];
        //打开文件管理器
        NSFileManager *fileManager = [NSFileManager defaultManager];
        //创建Download目录
        [fileManager createDirectoryAtPath:downloadDir withIntermediateDirectories:YES attributes:nil error:nil];
        //拼接文件路径
        NSString *filePath = [downloadDir stringByAppendingPathComponent:response.suggestedFilename];
        //返回文件位置的URL路径
        return [NSURL fileURLWithPath:filePath];
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        if(failed && error) {failed(nil ,error) ; return ;};
        success ? success(filePath.absoluteString /** NSURL->NSString*/) : nil;
    }];
    [downloadTask resume];
}




#pragma mark - 管理请求队列


- (void)addTask:(NSURLSessionDataTask *)task{
    NSMutableDictionary *taskQueue = [self taskQueue];
    
    [taskQueue setObject:task forKey:@([NSDate date].timeIntervalSince1970)];
}

- (void)removeTask:(NSURLSessionDataTask *)task{
    if ([self ifRequesting]) {
        NSMutableDictionary *taskQueue = [self taskQueue];
        
        [taskQueue removeObjectForKey:@([NSDate date].timeIntervalSince1970)];
    }
}

- (NSMutableDictionary *)taskQueue{
//    NSMutableDictionary *taskDic = objc_getAssociatedObject(self, @selector(addTask:));
//
//    if (!taskDic) {
//        taskDic = @{}.mutableCopy;
//        objc_setAssociatedObject(self, @selector(addTask:), taskDic, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
//    }
//    return taskDic;
    return nil;
}

- (BOOL)ifRequesting{
//    NSMutableDictionary *taskDic = objc_getAssociatedObject(self, @selector(addTask:));
//
//    if (taskDic && taskDic.allKeys.count>0) {
//        return YES;
//    }
    return NO;
}

- (void)cancelRequest{
    
    if ([self ifRequesting]) {
        NSMutableDictionary *taskDic = [[ZCHttpManager sharedManager] taskQueue];
        //HMLog(@"----没有结束的队列====%lu", (unsigned long)taskDic.allKeys.count);
        
        [taskDic enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
            if (((NSURLSessionDataTask *)obj).state != NSURLSessionTaskStateCompleted) {
                [((NSURLSessionDataTask *)obj) cancel];
            }
        }];
    }
}

//取消网络请求
+ (void)cancelRequestWithURLString:(NSString *)URLString{
    
//    if ([[HMDataRequest shareDataRequest] ifRequesting]) {
//        NSMutableDictionary *taskDic = [[HMDataRequest shareDataRequest] taskQueue];
//        //HMLog(@"----没有结束的队列====%lu", (unsigned long)taskDic.allKeys.count);
//
//        [taskDic enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
//
//            if (((NSURLSessionDataTask *)obj).state != NSURLSessionTaskStateCompleted
//                && [[((NSURLSessionDataTask *)obj).currentRequest.URL absoluteString] rangeOfString:URLString].location != NSNotFound) {
//
//                HMLog(@"----end----%@", [((NSURLSessionDataTask *)obj).currentRequest.URL absoluteString]);
//
//                [((NSURLSessionDataTask *)obj) cancel];
//
//            }
//        }];
//    }
    

}

@end
