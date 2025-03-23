// __DEBUG__
// __CLOSE_PRINT__
//
//  ShowView.h
//  AppleProject
//
//  Created by Yan Wang on 2025/2/15.
//  Copyright © 2025 AppleProject. All rights reserved.
//

// __M_A_C_R_O__
//: #import <UIKit/UIKit.h>
#import <UIKit/UIKit.h>

//: NS_ASSUME_NONNULL_BEGIN
NS_ASSUME_NONNULL_BEGIN

//: @protocol NTESReportNextDelegate <NSObject>
@protocol TitleTeam <NSObject>

//: - (void)didTouchBlackButton;
- (void)fileTeam;
//: - (void)didTouchDeleteButton;
- (void)holdfastCan;

//: @end
@end

//: @interface ZMONReportNextView : UIView
@interface ShowView : UIView

//: @property (nonatomic,weak) id<NTESReportNextDelegate> delegate;
@property (nonatomic,weak) id<TitleTeam> delegate;

/** 动画显示 */
//: - (void)animationShow;
- (void)of;

/** 动画关闭 */
//: - (void)animationClose;
- (void)iconEnable;

//: @end
@end

//: NS_ASSUME_NONNULL_END
NS_ASSUME_NONNULL_END