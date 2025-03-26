// __DEBUG__
// __CLOSE_PRINT__
//
//  OfCompleteManager.h
//  sohunews
//
//  Created by tianyulong on 2020/4/20.
//  Copyright © 2020 Sohu.com. All rights reserved.
//

// __M_A_C_R_O__
//: #import <Foundation/Foundation.h>
#import <Foundation/Foundation.h>
//: #import <UIKit/UIKit.h>
#import <UIKit/UIKit.h>

//: NS_ASSUME_NONNULL_BEGIN
NS_ASSUME_NONNULL_BEGIN

//: @interface SNLeadCompleteManager : NSObject
@interface OfCompleteManager : NSObject

//: + (instancetype)sharedInstance;;
+ (instancetype)team;;

/// 引导用户完善资料，显示提示框
//: - (void)showLeadViewForCompletingUserInfoWithSuperView:(UIView *)superView
- (void)make:(UIView *)superView
                                           //: withMessage:(NSString *)msg
                                           total:(NSString *)msg
                                           //: cancleBlock:(void (^)(void))callback;
                                           position:(void (^)(void))callback;

//: - (void)dismissLeadView;
- (void)cord;

//: @end
@end

//: NS_ASSUME_NONNULL_END
NS_ASSUME_NONNULL_END