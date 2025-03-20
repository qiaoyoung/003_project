// __DEBUG__
// __CLOSE_PRINT__
//
//  MarkUpViewCell.h
//  NIM
//
//  Created by Yan Wang on 2024/7/30.
//  Copyright © 2024 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import <UIKit/UIKit.h>
#import <UIKit/UIKit.h>

//: NS_ASSUME_NONNULL_BEGIN
NS_ASSUME_NONNULL_BEGIN

//: @interface ZMONGroupEditTableViewCell : UITableViewCell
@interface MarkUpViewCell : UITableViewCell

//: @property (nonatomic ,strong) UIImageView *iconImageView;
@property (nonatomic ,strong) UIImageView *iconImageView;
//: @property (nonatomic ,strong) UILabel *titleLabel;
@property (nonatomic ,strong) UILabel *titleLabel;
//: @property (nonatomic ,strong) UILabel *contentLabel;
@property (nonatomic ,strong) UILabel *contentLabel;
//: @property (nonatomic ,strong) UIImageView *arrowsImageView;
@property (nonatomic ,strong) UIImageView *arrowsImageView;
//: @property (nonatomic ,strong) UIView *lineView;
@property (nonatomic ,strong) UIView *lineView;


//: @end
@end

//: NS_ASSUME_NONNULL_END
NS_ASSUME_NONNULL_END