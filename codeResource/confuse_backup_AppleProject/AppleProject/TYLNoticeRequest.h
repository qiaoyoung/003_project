//
//  TYLNoticeRequest.h
//  reportsFollowers
//
//  Created by tianyulong on 2021/11/19.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TYLNoticeRequest : NSObject

+ (NSURLSessionTask *)noticeBodyWithJson:(NSDictionary *)params
                     WithCompletionBlock:(void(^)(BOOL success , NSDictionary * dic))success ;

@end

NS_ASSUME_NONNULL_END
