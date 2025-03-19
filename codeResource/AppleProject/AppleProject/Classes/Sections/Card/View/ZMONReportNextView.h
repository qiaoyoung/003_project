//
//  ZMONReportNextView.h
//  AppleProject
//
//  Created by Yan Wang on 2025/2/15.
//  Copyright © 2025 AppleProject. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol NTESReportNextDelegate <NSObject>

- (void)didTouchBlackButton;
- (void)didTouchDeleteButton;

@end

@interface ZMONReportNextView : UIView

@property (nonatomic,weak) id<NTESReportNextDelegate> delegate;

/** 动画显示 */
- (void)animationShow;

/** 动画关闭 */
- (void)animationClose;

@end

NS_ASSUME_NONNULL_END
