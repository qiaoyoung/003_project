// __DEBUG__
// __CLOSE_PRINT__
//
//  ShowSizeView.h
//  AppleProject
//
//  Created by Yan Wang on 2025/2/20.
//  Copyright © 2025 AppleProject. All rights reserved.
//

// __M_A_C_R_O__
//: #import <UIKit/UIKit.h>
#import <UIKit/UIKit.h>

//: NS_ASSUME_NONNULL_BEGIN
NS_ASSUME_NONNULL_BEGIN

//: @protocol NTESReportHisNextDelegate <NSObject>
@protocol LanguageDelegate <NSObject>

//: - (void)didTouchBlackButton;
- (void)fileTeam;

//: @end
@end

//: @interface ZMONReportHisView : UIView
@interface ShowSizeView : UIView

//: @property (nonatomic,weak) id<NTESReportHisNextDelegate> delegate;
@property (nonatomic,weak) id<LanguageDelegate> delegate;

/** 动画显示 */
//: - (void)animationShow;
- (void)onlineTo;

/** 动画关闭 */
//: - (void)animationClose;
- (void)iconEnable;

//: @end
@end

//: NS_ASSUME_NONNULL_END
NS_ASSUME_NONNULL_END