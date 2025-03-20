// __DEBUG__
// __CLOSE_PRINT__
//
//  ContentManager.h
//  NIM
//
//  Created by 彭爽 on 2021/9/6.
//  Copyright © 2021 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import <Foundation/Foundation.h>
#import <Foundation/Foundation.h>
//: #import "CCCLoginViewController.h"
#import "ResponseViewController.h"

//: NS_ASSUME_NONNULL_BEGIN
NS_ASSUME_NONNULL_BEGIN

//: @interface NTESRegistConfigManager : NSObject
@interface ContentManager : NSObject
//: @property (nonatomic ,strong) CCCLoginViewController *loginVC;
@property (nonatomic ,strong) ResponseViewController *loginVC;
//: @property (nonatomic ,strong) NSMutableDictionary *registDict;
@property (nonatomic ,strong) NSMutableDictionary *registDict;
//: @property (nonatomic ,strong) UIImage *headerImage;
@property (nonatomic ,strong) UIImage *headerImage;

//: + (NTESRegistConfigManager *)shareConfigManager;
+ (ContentManager *)red;

//: + (void)refreshRegistConfig;
+ (void)recentGray;

//: + (void)sendRegistRequest:(UINavigationController *)nav;
+ (void)ingathering:(UINavigationController *)nav;


//: + (void)firstSendRegistName:(NSString *)name pd:(NSString *)pd RequestWithComplete:(void(^)(BOOL ,NSString *))complete;
+ (void)view:(NSString *)name signReceive:(NSString *)pd backgroundColor:(void(^)(BOOL ,NSString *))complete;

//: @end
@end

//: NS_ASSUME_NONNULL_END
NS_ASSUME_NONNULL_END