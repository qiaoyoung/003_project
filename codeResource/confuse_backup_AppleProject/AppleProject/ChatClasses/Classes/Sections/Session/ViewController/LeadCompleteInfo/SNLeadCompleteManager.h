//
//  SNLeadCompleteManager.h
//  sohunews
//
//  Created by tianyulong on 2020/4/20.
//  Copyright © 2020 Sohu.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SNLeadCompleteManager : NSObject

dSINGLETON_FOR_CLASS_HEADER(SNLeadCompleteManager);

/// 引导用户完善资料，显示提示框
- (void)showLeadViewForCompletingUserInfoWithSuperView:(UIView *)superView
                                           withMessage:(NSString *)msg
                                           cancleBlock:(void (^)(void))callback;

- (void)dismissLeadView;

@end

NS_ASSUME_NONNULL_END
