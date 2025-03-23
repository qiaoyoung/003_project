//
//  NTESRegistConfigManager.m
//  NIM
//
//  Created by 彭爽 on 2021/9/6.
//  Copyright © 2021 Netease. All rights reserved.
//

#import "NTESRegistConfigManager.h"

@interface NTESRegistConfigManager ()
@property (nonatomic ,strong) UINavigationController *nav;
@end

@implementation NTESRegistConfigManager

static NTESRegistConfigManager *shareConfigManager = nil;

+ (NTESRegistConfigManager *)shareConfigManager {
    @synchronized(self) {
        if (shareConfigManager == nil) {
            shareConfigManager = [[NTESRegistConfigManager alloc] init];
            
            [shareConfigManager registDictDefault];
        }
        return shareConfigManager;
    }
}

- (NSMutableDictionary *)registDictDefault{
    [NTESRegistConfigManager shareConfigManager].registDict = [NSMutableDictionary dictionaryWithCapacity:0];
    NSMutableDictionary *dict = [NTESRegistConfigManager shareConfigManager].registDict;
    [dict setObject:@"iOS" forKey:@"client"];
    [dict setObject:@"" forKey:@"invitecode"];
    [dict setObject:@"" forKey:@"mobilecode"];
    [dict setObject:@"" forKey:@"question"];
    [dict setObject:@"" forKey:@"answer"];
    [dict setObject:kConstant_1 forKey:@"gender"];

    return [NTESRegistConfigManager shareConfigManager].registDict;
}

+ (void)refreshRegistConfig{
    
    [ZCHttpManager postWithUrl:Server_regist_config params:nil isShow:NO success:^(id responseObject) {
        
    } failed:^(id responseObject, NSError *error) {
        
    }];
}

+ (void)firstSendRegistName:(NSString *)name pd:(NSString *)pd RequestWithComplete:(void(^)(BOOL sucess, NSString * msg))complete {

    //#define Server_first_regist_config    [NSString stringWithFormat:@"%@/api/validate/check_username_available",[CCCConfig sharedConfig].domainURL]
    [ZCHttpManager postWithUrl:Server_first_regist_config params:@{@"username":name , @"passwd":pd } isShow:NO success:^(id responseObject) {
        
        NSDictionary *resultDict = (NSDictionary *)responseObject;
        NSString *code = [resultDict newStringValueForKey:@"code"];
        NSString *msg = [resultDict newStringValueForKey:@"msg"];
        if (code.integerValue == 0) {
            !complete ? : complete(YES,msg);
        } else {
            [SVProgressHUD showMessage:msg];
            !complete ? : complete(NO,msg);
        }
        
    } failed:^(id responseObject, NSError *error) {
        !complete ? : complete(NO,LangKey(@"friend_verify_avtivity_net_error"));
    }];
}


+ (void)sendRegistRequest:(UINavigationController *)nav{
    
    [NTESRegistConfigManager shareConfigManager].nav = nav;
    NSString *ismustmobile = [NIMUserDefaults standardUserDefaults].ismustmobile;//是否手机

    if ([NTESRegistConfigManager shareConfigManager].headerImage == nil) {//默认头像
        [NTESRegistConfigManager shareConfigManager].headerImage = [UIImage imageNamed:@"head_default"];
    }
    
    if (ismustmobile.integerValue > 0) {
        [[NTESRegistConfigManager shareConfigManager] mobileRegist];
    }else{
        [[NTESRegistConfigManager shareConfigManager] accountRegist];

    }

}

-(void)mobileRegist{
    
    NSString *account = [[NTESRegistConfigManager shareConfigManager].registDict newStringValueForKey:@"account"];
    [[NTESRegistConfigManager shareConfigManager].registDict setObject:account forKey:@"mobile"];
    
    NSDictionary *dict = [NTESRegistConfigManager shareConfigManager].registDict;
    UIImage *image = [NTESRegistConfigManager shareConfigManager].headerImage;
    
    if (!image) {
        
        [ZCHttpManager uploadImagesWithURL:Server_regist_mobile parameters:dict images:@[UIImageJPEGRepresentation(image, 0.3)] progress:^(NSProgress *progress) {
            
        } success:^(id responseObject) {
            NSLog(@"%@",responseObject);
            [self.nav popToRootViewControllerAnimated:YES];

            
        } failed:^(id responseObject, NSError *error) {
            NSLog(@"%@",error);

        }];
    }else{
        [ZCHttpManager getWithUrl:Server_regist_mobile params:dict isShow:YES success:^(id responseObject) {
            NSDictionary *resultDict = (NSDictionary *)responseObject;
            NSString *code = [resultDict newStringValueForKey:@"code"];
            NSString *msg = [resultDict newStringValueForKey:@"msg"];
            [SVProgressHUD showMessage:msg];
            if (code.integerValue <= 0) {
                [self.nav popToRootViewControllerAnimated:YES];
                
                NSMutableDictionary *notiDict = [NSMutableDictionary dictionaryWithCapacity:0];
                [notiDict setObject:[dict newStringValueForKey:@"account"] ? :@"" forKey:@"UserAccount"];
                [notiDict setObject:[dict newStringValueForKey:@"password"] ? :@"" forKey:@"UserPassWord"];
                [[NSNotificationCenter defaultCenter] postNotificationName:@"RegistFinshNotification" object:notiDict];
                
                
            }
        } failed:^(id responseObject, NSError *error) {

        }];
    }
    
    
}

-(void)accountRegist{
    
    NSDictionary *dict = [NTESRegistConfigManager shareConfigManager].registDict;
    UIImage *image = [NTESRegistConfigManager shareConfigManager].headerImage;
    UIImage *imageForAvatarUpload = [image imageByScalingAndCroppingForSize:CGSizeMake(150, 150)];
    
    
    if (image) {
        [ZCHttpManager uploadImagesWithURL:Server_regist_regist parameters:dict images:@[UIImageJPEGRepresentation(imageForAvatarUpload, 0.7)] progress:^(NSProgress *progress) {

        } success:^(id responseObject) {
            NSDictionary *resultDict = (NSDictionary *)responseObject;
            NSString *code = [resultDict newStringValueForKey:@"code"];
            NSString *msg = [resultDict newStringValueForKey:@"msg"];
            [SVProgressHUD showMessage:msg];
            
            if (code.integerValue <= 0) {
                [self.nav popToRootViewControllerAnimated:YES];
                NSMutableDictionary *notiDict = [NSMutableDictionary dictionaryWithCapacity:0];
                NSString *mobile = [dict newStringValueForKey:@"mobile"] ? :@"";
                NSString *account = [dict newStringValueForKey:@"account"] ? :@"";
                NSString *UserAccount = mobile.length > 0 ? mobile:account ;
                NSString *UserPassWord = [dict newStringValueForKey:@"password"] ? :@"";
                [notiDict setObject:UserAccount  forKey:@"UserAccount"];
                [notiDict setObject:UserPassWord  forKey:@"UserPassWord"];
                [[NSNotificationCenter defaultCenter] postNotificationName:@"RegistFinshNotification" object:notiDict];
            }

        } failed:^(id responseObject, NSError *error) {
            [SVProgressHUD showMessage:LangKey(@"register_avtivity3_register_fail")];

        }];
    }
}

@end
