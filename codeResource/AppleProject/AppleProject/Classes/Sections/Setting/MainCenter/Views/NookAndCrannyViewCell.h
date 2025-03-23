// __DEBUG__
// __CLOSE_PRINT__
//
//  NookAndCrannyViewCell.h
//  NIM
//
//  Created by 彭爽 on 2021/10/21.
//  Copyright © 2021 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import "BaseTableViewCell.h"
#import "CompartmentView.h"

//: NS_ASSUME_NONNULL_BEGIN
NS_ASSUME_NONNULL_BEGIN

//: @interface NTESRedpackageDetailCell : BaseTableViewCell
@interface NookAndCrannyViewCell : CompartmentView
//: @property (nonatomic ,strong) UIButton *backButton;
@property (nonatomic ,strong) UIButton *backButton;
//: @property (nonatomic ,strong) UILabel *nickNameLabel;
@property (nonatomic ,strong) UILabel *nickNameLabel;
//: @property (nonatomic ,strong) UIImageView *headerImage;
@property (nonatomic ,strong) UIImageView *headerImage;
//: @property (nonatomic ,strong) UILabel *wordLabel;
@property (nonatomic ,strong) UILabel *wordLabel;
//: @property (nonatomic ,strong) UILabel *contentLabel;
@property (nonatomic ,strong) UILabel *contentLabel;
//: @end
@end



//: @interface NTESRedpackageDetailListCell : BaseTableViewCell
@interface TableViewCell : CompartmentView
//: @property (nonatomic ,strong) UILabel *nickNameLabel;
@property (nonatomic ,strong) UILabel *nickNameLabel;
//: @property (nonatomic ,strong) UIImageView *headerImage;
@property (nonatomic ,strong) UIImageView *headerImage;
//: @property (nonatomic ,strong) UIImageView *praiseImage;
@property (nonatomic ,strong) UIImageView *praiseImage;
//: @property (nonatomic ,strong) UILabel *timeLabel;
@property (nonatomic ,strong) UILabel *timeLabel;
//: @property (nonatomic ,strong) UILabel *redAmountLabel;
@property (nonatomic ,strong) UILabel *redAmountLabel;

//: @end
@end

//: NS_ASSUME_NONNULL_END
NS_ASSUME_NONNULL_END