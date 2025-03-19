//
//  NTESUserWalletListCell.h
//  NIM
//
//  Created by 彭爽 on 2021/9/14.
//  Copyright © 2021 Netease. All rights reserved.
//

#import "BaseTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface NTESUserWalletListCell : BaseTableViewCell
@property (nonatomic ,strong) UILabel *titleLabel;
@property (nonatomic ,strong) UILabel *timeLabel;
@property (nonatomic ,strong) UILabel *amountLabel;

@end

NS_ASSUME_NONNULL_END
