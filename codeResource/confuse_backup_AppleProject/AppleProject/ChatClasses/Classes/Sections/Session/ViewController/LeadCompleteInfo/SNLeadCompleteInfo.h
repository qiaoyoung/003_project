//
//  SNLeadCompleteInfo.h
//  sohunews
//
//  Created by tianyulong on 2020/4/20.
//  Copyright © 2020 Sohu.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UUMarqueeView.h"

NS_ASSUME_NONNULL_BEGIN

typedef enum : NSUInteger {
    CompletingUserInfoType_headicon  = 1,
} CompletingUserInfoType;

@interface SNLeadCompleteInfo : UIView

@property (nonatomic, strong) UUMarqueeView *leftwardMarqueeView;

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *actionTitle;
@property (nonatomic, assign) CompletingUserInfoType completeType;

@property (nonatomic, copy) void (^completion)(void);
@property (nonatomic, copy) void (^cancleCompletion)(void);

/// 引导用户完善资料，显示提示框
+ (instancetype)showTipViewForCompletingUserInfolWithDelay:(float)delay
                                                 superView:(UIView *)superView
                                    CompletingUserInfoType:(CompletingUserInfoType)type
                                               withMessage:(NSString *)msg
                                                 trueBlock:(void (^)(void))trueBlock
                                               cancleBlock:(void (^)(void))callback;

- (void)p_updateInTransaction:(void (^)(SNLeadCompleteInfo *tipView))transactionBlock;

- (void)p_showOnView:(UIView *)superView;

- (void)p_dismiss;


@end

NS_ASSUME_NONNULL_END
