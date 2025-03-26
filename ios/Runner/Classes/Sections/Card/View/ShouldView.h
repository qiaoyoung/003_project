// __DEBUG__
// __CLOSE_PRINT__
//
//  ShouldView.h
//  AppleProject
//
//  Created by Yan Wang on 2025/2/17.
//  Copyright © 2025 AppleProject. All rights reserved.
//

// __M_A_C_R_O__
//: #import <UIKit/UIKit.h>
#import <UIKit/UIKit.h>

//: NS_ASSUME_NONNULL_BEGIN
NS_ASSUME_NONNULL_BEGIN

//: typedef void(^SpeiceBackBlock) (NSString *Name);
typedef void(^SpeiceBackBlock) (NSString *Name);

//: @interface ZMONReportDeleteView : UIView
@interface ShouldView : UIView

//: @property (nonatomic, copy) SpeiceBackBlock speiceBackBlock;
@property (nonatomic, copy) SpeiceBackBlock speiceBackBlock;

//: @property (nonatomic,strong) NSString *userID;
@property (nonatomic,strong) NSString *userID;

/** 动画显示 */
//: - (void)animationShow;
- (void)color;

/** 动画关闭 */
//: - (void)animationClose;
- (void)iconEnable;

//: @end
@end

//: NS_ASSUME_NONNULL_END
NS_ASSUME_NONNULL_END