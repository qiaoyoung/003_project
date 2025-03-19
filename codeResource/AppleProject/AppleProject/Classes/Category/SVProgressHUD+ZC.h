//
//  SVProgressHUD+ZC.h
//  ZCAuctionCar
//
//  Created by 彭爽 on 2021/4/6.
//

#import "SVProgressHUD.h"

NS_ASSUME_NONNULL_BEGIN

@interface SVProgressHUD (ZC)

+ (void)showMessage:(NSString *)message;

+ (void)showCustomGif:(NSData *)gifData;

@end

NS_ASSUME_NONNULL_END
