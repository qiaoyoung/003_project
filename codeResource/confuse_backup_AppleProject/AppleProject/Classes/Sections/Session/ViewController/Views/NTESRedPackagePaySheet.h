//
//  NTESRedPackagePaySheet.h
//  NIM
//
//  Created by 彭爽 on 2021/10/10.
//  Copyright © 2021 Netease. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^PayPasswordBlock)(NSString *payPassword);

@interface NTESRedPackagePaySheet : UIView

@property (nonatomic ,copy) PayPasswordBlock block;

-(instancetype)initWithFrame:(CGRect)frame dictionary:(NSDictionary *)dictionary;

- (void)show;

- (void)dismissPicker;

-(void)finshInputPassword:(PayPasswordBlock)block;

@end

NS_ASSUME_NONNULL_END
