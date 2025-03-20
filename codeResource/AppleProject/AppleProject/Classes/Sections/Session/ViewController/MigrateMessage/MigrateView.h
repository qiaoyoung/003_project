// __DEBUG__
// __CLOSE_PRINT__
//
//  MigrateView.h
//  NIM
//
//  Created by Sampson on 2018/12/11.
//  Copyright © 2018 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import <UIKit/UIKit.h>
#import <UIKit/UIKit.h>

//: NS_ASSUME_NONNULL_BEGIN
NS_ASSUME_NONNULL_BEGIN

//: @interface NTESMigrateProgressView : UIView
@interface MigrateView : UIView

//: @property (nonatomic, copy) NSString *tip;
@property (nonatomic, copy) NSString *tip;
//: @property (nonatomic, assign) float progress;
@property (nonatomic, assign) float progress;
//: @property (nonatomic, strong) UIButton *stopButton;
@property (nonatomic, strong) UIButton *stopButton;

//: @end
@end

//: NS_ASSUME_NONNULL_END
NS_ASSUME_NONNULL_END