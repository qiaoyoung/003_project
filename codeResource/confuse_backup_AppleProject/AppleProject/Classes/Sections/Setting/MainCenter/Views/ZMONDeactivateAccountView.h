//
//  ZMONDeactivateAccountView.h
//  AppleProject
//
//  Created by Yan Wang on 2025/2/5.
//  Copyright © 2025 AppleProject. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol NTESDeactivateAccountDelegate <NSObject>

- (void)didTouchNextButton;
- (void)didTouchProtocolButton;

@end

@interface ZMONDeactivateAccountView : UIView

@property (nonatomic,weak) id<NTESDeactivateAccountDelegate> delegate;

/** 动画显示 */
- (void)animationShow;

/** 动画关闭 */
- (void)animationClose;

@end

NS_ASSUME_NONNULL_END
