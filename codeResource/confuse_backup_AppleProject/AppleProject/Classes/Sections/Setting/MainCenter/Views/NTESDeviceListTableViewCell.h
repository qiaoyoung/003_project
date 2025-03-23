//
//  NTESDeviceListTableViewCell.h
//  NIM
//
//  Created by 彭爽 on 2021/9/13.
//  Copyright © 2021 Netease. All rights reserved.
//

#import "BaseTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface NTESDeviceListTableViewCell : BaseTableViewCell

@property (nonatomic ,strong) UILabel *deviceName;
@property (nonatomic ,strong) UIImageView *imageViewIcon;
@property (nonatomic ,strong) UILabel *timeLabel;
@property (nonatomic ,strong) UILabel *deveceVersion;

@end

NS_ASSUME_NONNULL_END
