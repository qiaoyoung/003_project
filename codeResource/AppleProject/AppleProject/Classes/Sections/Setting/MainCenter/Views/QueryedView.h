// __DEBUG__
// __CLOSE_PRINT__
//
//  QueryedView.h
//  NIM
//
//  Created by 彭爽 on 2021/9/13.
//  Copyright © 2021 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import "BaseTableViewCell.h"
#import "CompartmentView.h"

//: NS_ASSUME_NONNULL_BEGIN
NS_ASSUME_NONNULL_BEGIN

//: @interface NTESDeviceListTableViewCell : BaseTableViewCell
@interface QueryedView : CompartmentView

//: @property (nonatomic ,strong) UILabel *deviceName;
@property (nonatomic ,strong) UILabel *deviceName;
//: @property (nonatomic ,strong) UIImageView *imageViewIcon;
@property (nonatomic ,strong) UIImageView *imageViewIcon;
//: @property (nonatomic ,strong) UILabel *timeLabel;
@property (nonatomic ,strong) UILabel *timeLabel;
//: @property (nonatomic ,strong) UILabel *deveceVersion;
@property (nonatomic ,strong) UILabel *deveceVersion;

//: @end
@end

//: NS_ASSUME_NONNULL_END
NS_ASSUME_NONNULL_END