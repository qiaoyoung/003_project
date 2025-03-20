//
//  NTESSafetyTableViewCell.h
//  NIM
//
//  Created by Yan Wang on 2024/6/29.
//  Copyright © 2024 Netease. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NTESSafetyTableViewCell : UITableViewCell

@property(nonatomic, strong) UIImageView *iconImageView;
@property(nonatomic, strong) UILabel *titleLabel;
@property(nonatomic, strong) UIImageView *arrowsImageView;

@property(nonatomic, strong) UILabel *labGoout;

@property(nonatomic, strong) UISwitch *pushSwitch;

@property(nonatomic, strong) UILabel *labSubtitle;

+ (instancetype)cellWithTableView:(UITableView *)tableView;


+ (CGFloat)getCellHeight:(NSDictionary*)information;

@end

NS_ASSUME_NONNULL_END
