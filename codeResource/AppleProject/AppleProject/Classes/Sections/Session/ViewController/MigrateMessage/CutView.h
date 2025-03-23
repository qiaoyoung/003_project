// __DEBUG__
// __CLOSE_PRINT__
//
//  CutView.h
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

//: @interface NTESMigrateCompleteView : UIView
@interface CutView : UIView

//: @property (nonatomic, nullable, copy) NSString *title;
@property (nonatomic, nullable, copy) NSString *title;
//: @property (nonatomic, nullable, copy) NSString *message;
@property (nonatomic, nullable, copy) NSString *message;
//: @property (nonatomic, strong) UIButton *actionButton;
@property (nonatomic, strong) UIButton *actionButton;

//: @end
@end

//: NS_ASSUME_NONNULL_END
NS_ASSUME_NONNULL_END