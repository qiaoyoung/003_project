// __DEBUG__
// __CLOSE_PRINT__
//
//  TingView.h
//  NIM
//
//  Created by 彭爽 on 2021/9/14.
//  Copyright © 2021 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import "BaseTableViewCell.h"
#import "CompartmentView.h"

//: NS_ASSUME_NONNULL_BEGIN
NS_ASSUME_NONNULL_BEGIN

//: @interface NTESUserWalletListCell : BaseTableViewCell
@interface TingView : CompartmentView
//: @property (nonatomic ,strong) UILabel *titleLabel;
@property (nonatomic ,strong) UILabel *titleLabel;
//: @property (nonatomic ,strong) UILabel *timeLabel;
@property (nonatomic ,strong) UILabel *timeLabel;
//: @property (nonatomic ,strong) UILabel *amountLabel;
@property (nonatomic ,strong) UILabel *amountLabel;

//: @end
@end

//: NS_ASSUME_NONNULL_END
NS_ASSUME_NONNULL_END