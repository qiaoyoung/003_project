//
//  NTESSafetySetingCell.h
//  NIM
//
//  Created by 彭爽 on 2021/9/17.
//  Copyright © 2021 Netease. All rights reserved.
//

#import "BaseTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface NTESSafetySetingCell : BaseTableViewCell
@property (nonatomic ,strong) UIButton *buttonTop;
@property (nonatomic ,strong) UILabel *topLabel;

@property (nonatomic ,strong) UIButton *buttomBottom;
@property (nonatomic ,strong) UILabel *bottomLabel;

@end

NS_ASSUME_NONNULL_END
