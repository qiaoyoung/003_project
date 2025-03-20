// __DEBUG__
// __CLOSE_PRINT__
//
//  HideView.h
//  AppleProject
//
//  Created by Yan Wang on 2025/2/6.
//  Copyright © 2025 AppleProject. All rights reserved.
//

// __M_A_C_R_O__
//: #import <UIKit/UIKit.h>
#import <UIKit/UIKit.h>

//: NS_ASSUME_NONNULL_BEGIN
NS_ASSUME_NONNULL_BEGIN

//: @protocol NTESReportDelegate <NSObject>
@protocol ChildTitleDelegate <NSObject>

//: - (void)didTouchSubmitButton:(NSString *)reason;
- (void)shadowinesses:(NSString *)reason;

//: @end
@end

//: @interface ZMONReportUserView : UIView
@interface HideView : UIView

//: @property (nonatomic,weak) id<NTESReportDelegate> delegate;
@property (nonatomic,weak) id<ChildTitleDelegate> delegate;

/** 动画显示 */
//: - (void)animationShow;
- (void)highlight;

/** 动画关闭 */
//: - (void)animationClose;
- (void)iconEnable;

//: @end
@end

//: NS_ASSUME_NONNULL_END
NS_ASSUME_NONNULL_END