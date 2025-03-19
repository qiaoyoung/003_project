//
//  ZMONReportUserView.h
//  AppleProject
//
//  Created by Yan Wang on 2025/2/6.
//  Copyright © 2025 AppleProject. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol NTESReportDelegate <NSObject>

- (void)didTouchSubmitButton:(NSString *)reason;

@end

@interface ZMONReportUserView : UIView

@property (nonatomic,weak) id<NTESReportDelegate> delegate;

/** 动画显示 */
- (void)animationShow;

/** 动画关闭 */
- (void)animationClose;

@end

NS_ASSUME_NONNULL_END
