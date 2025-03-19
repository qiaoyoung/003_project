//
//  NTESGlobalConfigManager.m
//  NIM
//
//  Created by 彭爽 on 2021/9/8.
//  Copyright © 2021 Netease. All rights reserved.
//

#import "NTESGlobalConfigManager.h"

@interface NTESGlobalConfigManager ()
@property (nonatomic ,strong) NSArray *secretQuestionArray;
@end

@implementation NTESGlobalConfigManager

static NTESGlobalConfigManager *shareConfigManager = nil;

+ (NTESGlobalConfigManager *)shareConfigManager{
    @synchronized(self) {
        if (shareConfigManager == nil) {
            shareConfigManager = [[NTESGlobalConfigManager alloc] init];
        }
        return shareConfigManager;
    }
}



+ (NSArray *)getSecretQuestionList{
    return [NTESGlobalConfigManager shareConfigManager].secretQuestionArray;
}

+ (void)refreshSecretQuestionConfig{
    
    [ZCHttpManager getWithUrl:Server_regist_questionlist params:nil isShow:NO success:^(id responseObject) {
        NSDictionary *resultDict = (NSDictionary *)responseObject;
        NSString *code = [resultDict newStringValueForKey:@"code"];
        if (code.integerValue == 0) {
            [NTESGlobalConfigManager shareConfigManager].secretQuestionArray = [resultDict valueObjectForKey:@"data"];
        }
    } failed:^(id responseObject, NSError *error) {
        
    }];
}

@end
