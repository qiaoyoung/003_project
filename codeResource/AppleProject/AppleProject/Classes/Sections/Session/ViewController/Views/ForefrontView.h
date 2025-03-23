// __DEBUG__
// __CLOSE_PRINT__
//
//  ForefrontView.h
//  NIM
//
//  Created by Yan Wang on 2024/8/9.
//  Copyright © 2024 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import <UIKit/UIKit.h>
#import <UIKit/UIKit.h>

//: NS_ASSUME_NONNULL_BEGIN
NS_ASSUME_NONNULL_BEGIN

//: @protocol NTESReportContentDelegate <NSObject>
@protocol CenterTitle <NSObject>

//: - (void)didTouchSubmitContentButton:(NSString *)reason;
- (void)colorOf:(NSString *)reason;

//: @end
@end

//: @interface ZMONTranslateView : UIView
@interface ForefrontView : UIView

//: @property (nonatomic,weak) id<NTESReportContentDelegate> delegate;
@property (nonatomic,weak) id<CenterTitle> delegate;
/** 动画显示 */
//: - (void)animationShow;
- (void)ting;

/** 动画关闭 */
//: - (void)animationClose;
- (void)iconEnable;

//: @end
@end

//: NS_ASSUME_NONNULL_END
NS_ASSUME_NONNULL_END