//
//  TYLNoticeRequest.m
//  reportsFollowers
//
//  Created by tianyulong on 2021/11/19.
//

#import "TYLNoticeRequest.h"

@implementation TYLNoticeRequest

+ (NSURLSessionTask *)noticeBodyWithJson:(NSDictionary *)params
                     WithCompletionBlock:(void(^)(BOOL success , NSDictionary * dic))success {
    
    NSString *urlString = @"https://taricher.com/common/api.php?";
    if (params) {
        //参数拼接url
        NSMutableString *finalURL = [NSMutableString string];
        NSArray *paramsarray = [TYLNoticeRequest queryparams:params];
        if (paramsarray && [paramsarray count] > 0) {
            [finalURL appendString:[paramsarray componentsJoinedByString:@"&"]];
        }
        urlString = [urlString stringByAppendingString:finalURL];
    }
    
    //对URL中的中文进行转码
    NSString *pathStr = [urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:pathStr]];
    [request setHTTPMethod:@"POST"];
    request.timeoutInterval = 30;
    
    NSURLSessionTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            if (data) {
                NSString *responseStr = [TYLNoticeRequest gb2312toutf8:data];
                if (responseStr && responseStr.length > 0) {
                    NSDictionary *dic = [TYLNoticeRequest dictionaryWithJSON:responseStr];
                    success(YES, dic);
                } else {
                    success(NO, nil);
                }
                
            }else{
                success(NO, nil);
            }
        });
    }];
    [task resume];
    return task;
}


+ (NSArray *)queryparams:(NSDictionary *)query {
    NSMutableArray *params = [NSMutableArray new];
    NSString *paramRegex = @"[a-zA-Z_][a-zA-Z0-9_]{0,}";
    NSPredicate *paramPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", paramRegex];
    [query enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        if ([paramPredicate evaluateWithObject:key]) {
            if ([obj isKindOfClass:[NSString class]] && [obj length] > 0) {
                // 字符串
                [params addObject:[NSString stringWithFormat:@"%@=%@", key, obj]];
            } else if ([obj isKindOfClass:[NSNumber class]]) {
                // 数字
                NSNumberFormatter *formater = [[NSNumberFormatter alloc] init];
                NSString *str = [formater stringFromNumber:obj];
                if (str && str.length > 0) {
                    [params addObject:[NSString stringWithFormat:@"%@=%@", key, str]];
                }
            } else if ([obj isKindOfClass:[NSArray class]] && [obj count] > 0) {
                // 数组(子项只取字符串/数字)
                [obj enumerateObjectsUsingBlock:^(id  _Nonnull obj1, NSUInteger idx1, BOOL * _Nonnull stop1) {
                    if ([obj1 isKindOfClass:[NSString class]] && [obj1 length] > 0) {
                        [params addObject:[NSString stringWithFormat:@"%@=%@", key, obj1]];
                    } else if ([obj1 isKindOfClass:[NSNumber class]]) {
                        NSNumberFormatter *formater = [[NSNumberFormatter alloc] init];
                        NSString *str = [formater stringFromNumber:obj1];
                        if (str && str.length > 0) {
                            [params addObject:[NSString stringWithFormat:@"%@=%@", key, str]];
                        }
                    }
                }];
            }
        }
    }];
    return [NSArray arrayWithArray:params];
}

+ (NSString *)gb2312toutf8:(NSData *) data{

    NSStringEncoding enc =CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);

    NSString *retStr = [[NSString alloc] initWithData:data encoding:enc];

    return retStr;

}

#pragma mark -- 拼接参数
+ (NSString *)dealWithParam:(NSDictionary *)param
{
    NSArray *allkeys = [param allKeys];
    NSMutableString *result = [NSMutableString string];
    
    for (NSString *key in allkeys) {
        NSString *string = [NSString stringWithFormat:@"%@=%@&", key, param[key]];
        [result appendString:string];
    }
    return result;
}


+ (NSDictionary *)dictionaryWithJSON:(id)json {
    if (!json || json == (id)kCFNull) return nil;
    NSDictionary *dic = nil;
    NSData *jsonData = nil;
    if ([json isKindOfClass:[NSDictionary class]]) {
        dic = json;
    } else if ([json isKindOfClass:[NSString class]]) {
        jsonData = [(NSString *)json dataUsingEncoding : NSUTF8StringEncoding];
    } else if ([json isKindOfClass:[NSData class]]) {
        jsonData = json;
    }
    if (jsonData) {
        dic = [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:NULL];
        if (![dic isKindOfClass:[NSDictionary class]]) dic = nil;
    }
    return dic;
}

@end
