//
//  NTESUserInfoModel.h
//  NIM
//
//  Created by 彭爽 on 2021/9/13.
//  Copyright © 2021 Netease. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NTESUserInfoModel : NSObject
@property (nonatomic ,strong) NSString *avatar;
@property (nonatomic ,strong) NSString *nickname;
@property (nonatomic ,strong) NSString *account;
@property (nonatomic ,strong) NSString *gender;
@property (nonatomic ,strong) NSString *birthday;
@property (nonatomic ,strong) NSString *bio;
@property (nonatomic ,strong) NSString *email;
@property (nonatomic ,strong) NSString *mobile;

@end

NS_ASSUME_NONNULL_END
