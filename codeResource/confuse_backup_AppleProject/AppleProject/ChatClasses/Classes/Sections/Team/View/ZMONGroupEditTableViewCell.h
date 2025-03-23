//
//  ZMONGroupEditTableViewCell.h
//  NIM
//
//  Created by Yan Wang on 2024/7/30.
//  Copyright © 2024 Netease. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZMONGroupEditTableViewCell : UITableViewCell

@property (nonatomic ,strong) UIImageView *iconImageView;
@property (nonatomic ,strong) UILabel *titleLabel;
@property (nonatomic ,strong) UILabel *contentLabel;
@property (nonatomic ,strong) UIImageView *arrowsImageView;
@property (nonatomic ,strong) UIView *lineView;


@end

NS_ASSUME_NONNULL_END
