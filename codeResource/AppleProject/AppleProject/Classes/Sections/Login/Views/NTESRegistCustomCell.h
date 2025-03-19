//
//  NTESRegistCustomCell.h
//  NIM
//
//  Created by 彭爽 on 2021/9/7.
//  Copyright © 2021 Netease. All rights reserved.
//

#import "BaseTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface NTESRegistCustomCell : BaseTableViewCell
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UITextField *contentTextField;
@property (nonatomic, strong) UIImageView *headerImageView;
@property (nonatomic, strong) UIImageView *arrowImageView;
@end

NS_ASSUME_NONNULL_END
