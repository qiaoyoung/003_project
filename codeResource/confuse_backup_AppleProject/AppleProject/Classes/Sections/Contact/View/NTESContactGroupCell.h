//
//  NTESContactGroupCell.h
//  NIM
//
//  Created by 彭爽 on 2021/9/28.
//  Copyright © 2021 Netease. All rights reserved.
//

#import "BaseTableViewCell.h"
#import "BBBAvatarImageView.h"

NS_ASSUME_NONNULL_BEGIN

@interface NTESContactGroupCell : BaseTableViewCell
@property (nonatomic ,strong) UIImageView *iconImageView;
@property (nonatomic ,strong) UILabel *titleLabel;
@property (nonatomic,strong) BBBAvatarImageView *avatar;

@end

NS_ASSUME_NONNULL_END
