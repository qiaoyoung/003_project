// __DEBUG__
// __CLOSE_PRINT__
//
//  NTESTimePickerView.h
//  NIM
//
//  Created by chris on 15/7/1.
//  Copyright (c) 2015年 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import <UIKit/UIKit.h>
#import <UIKit/UIKit.h>

//: typedef void(^CompletionHandler)(NSInteger hour,NSInteger minute);
typedef void(^CompletionHandler)(NSInteger hour,NSInteger minute);

//: @protocol BBBTimePickerViewDelegate <NSObject>
@protocol OnTapDelegate <NSObject>

//: - (void)didSelectHour:(NSInteger)hour minute:(NSInteger)minute;
- (void)blue:(NSInteger)hour rangeTotalerval:(NSInteger)minute;

//: @end
@end

//: @interface BBBTimePickerView : UIView
@interface AddTitleView : UIView

//: @property (nonatomic,weak) id<BBBTimePickerViewDelegate> delegate;
@property (nonatomic,weak) id<OnTapDelegate> delegate;

//: - (void)refreshWithHour:(NSInteger)hour minute:(NSInteger)minute;
- (void)selected:(NSInteger)hour managerDisable:(NSInteger)minute;

//: - (void)showInView:(UIView *)view onCompletion:(CompletionHandler) handler;
- (void)userLineCompletion:(UIView *)view message:(CompletionHandler) handler;

//: @end
@end