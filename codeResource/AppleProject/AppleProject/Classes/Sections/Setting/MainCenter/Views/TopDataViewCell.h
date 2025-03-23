// __DEBUG__
// __CLOSE_PRINT__
//
//  TopDataViewCell.h
//  NIM
//
//  Created by 彭爽 on 2021/9/17.
//  Copyright © 2021 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import "BaseTableViewCell.h"
#import "CompartmentView.h"

//: NS_ASSUME_NONNULL_BEGIN
NS_ASSUME_NONNULL_BEGIN

//: @interface NTESSafetySetingCell : BaseTableViewCell
@interface TopDataViewCell : CompartmentView
//: @property (nonatomic ,strong) UIButton *buttonTop;
@property (nonatomic ,strong) UIButton *buttonTop;
//: @property (nonatomic ,strong) UILabel *topLabel;
@property (nonatomic ,strong) UILabel *topLabel;

//: @property (nonatomic ,strong) UIButton *buttomBottom;
@property (nonatomic ,strong) UIButton *buttomBottom;
//: @property (nonatomic ,strong) UILabel *bottomLabel;
@property (nonatomic ,strong) UILabel *bottomLabel;

//: @end
@end

//: NS_ASSUME_NONNULL_END
NS_ASSUME_NONNULL_END