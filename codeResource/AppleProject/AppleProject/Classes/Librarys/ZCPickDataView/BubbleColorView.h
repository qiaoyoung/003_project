// __DEBUG__
// __CLOSE_PRINT__
//
//  AttendanceDatePickerView.h
//  ProjectK
//
//  Created by beartech on 14-1-3.
//  Copyright (c) 2014年 Beartech. All rights reserved.
//

// __M_A_C_R_O__
//: #import <UIKit/UIKit.h>
#import <UIKit/UIKit.h>

//: Class object_getClass(id object);
Class object_getClass(id object);

//: @protocol HMDatePickerViewDelegate;
@protocol SearchedDelegate;

//: @interface HMDatePickerView : UIView{
@interface BubbleColorView : UIView{
    //: UIDatePicker *datePicker;
    UIDatePicker *datePicker;
    //: UIButton *_blackBackgroundButton;
    UIButton *_blackBackgroundButton;

    //: Class delegateClass;
    Class delegateClass;
    //: __unsafe_unretained id<HMDatePickerViewDelegate> _delegate;
    __unsafe_unretained id<SearchedDelegate> _delegate;
}

//: @property (nonatomic,assign) id<HMDatePickerViewDelegate> delegate;
@property (nonatomic,assign) id<SearchedDelegate> delegate;
//: @property (nonatomic,retain) UIDatePicker *datePicker;
@property (nonatomic,retain) UIDatePicker *datePicker;
//: @property (nonatomic,retain) UIButton *blackBackgroundButton;
@property (nonatomic,retain) UIButton *blackBackgroundButton;
//: @property (nonatomic, strong) UILabel *titleL;
@property (nonatomic, strong) UILabel *titleL;
//: @property (nonatomic ,strong) NSString *titleString;
@property (nonatomic ,strong) NSString *titleString;

//: + (void)showInView:(UIView*)view delegate:(id<HMDatePickerViewDelegate>)delegate minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate showDate:(NSDate*)showDate;
+ (void)option:(UIView*)view omeletPan:(id<SearchedDelegate>)delegate sound:(NSDate*)minDate anSession:(NSDate*)maxDate app:(NSDate*)showDate;

//: + (id)showWithDelegate:(id<HMDatePickerViewDelegate>)delegate minDate:(NSDate*)minDate maxDate:(NSDate*)maxDate showDate:(NSDate*)showDate;
+ (id)object:(id<SearchedDelegate>)delegate day_strong:(NSDate*)minDate image:(NSDate*)maxDate nim:(NSDate*)showDate;

//: - (void)setDate:(NSDate*)date;
- (void)setEnableMargin:(NSDate*)date;

//: - (void)show;
- (void)ting;

//: - (void)changeDelegate:(id<HMDatePickerViewDelegate>)delegate;
- (void)shouldFileDelegate:(id<SearchedDelegate>)delegate;

//: @end
@end


//: @protocol HMDatePickerViewDelegate <NSObject>
@protocol SearchedDelegate <NSObject>
//: @optional
@optional

//: - (void)dismissDataPickerView;
- (void)domainTitle;
//: - (void)datePick:(HMDatePickerView *)pickView doneWithDate:(NSDate *)date;
- (void)exceptMyDate:(BubbleColorView *)pickView background:(NSDate *)date;

//: @end
@end