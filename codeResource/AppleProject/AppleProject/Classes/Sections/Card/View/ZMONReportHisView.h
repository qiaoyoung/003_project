//
//  ZMONReportHisView.h
//  AppleProject
//
//  Created by Yan Wang on 2025/2/20.
//  Copyright © 2025 AppleProject. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol NTESReportHisNextDelegate <NSObject>

- (void)didTouchBlackButton;

@end

@interface ZMONReportHisView : UIView

@property (nonatomic,weak) id<NTESReportHisNextDelegate> delegate;

/** 动画显示 */
- (void)animationShow;

/** 动画关闭 */
- (void)animationClose;

@end

NS_ASSUME_NONNULL_END
