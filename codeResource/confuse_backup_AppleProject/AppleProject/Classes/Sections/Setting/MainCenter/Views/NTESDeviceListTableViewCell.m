//
//  NTESDeviceListTableViewCell.m
//  NIM
//
//  Created by 彭爽 on 2021/9/13.
//  Copyright © 2021 Netease. All rights reserved.
//

#import "NTESDeviceListTableViewCell.h"

@implementation NTESDeviceListTableViewCell

- (void)initSubviews{
    
    _deviceName = [[UILabel alloc] init];
    _deviceName.text = @"iPhone";
    _deviceName.font = [UIFont systemFontOfSize:16];
    _deviceName.textColor = [UIColor blackColor];
    [self addSubview:_deviceName];
    [_deviceName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(15);
        make.top.mas_offset(15);
        make.width.mas_equalTo(200);
        make.height.mas_offset(20);
    }];
    
    _imageViewIcon = [[UIImageView alloc] init];
    _imageViewIcon.image = [UIImage imageNamed:@"user_device_phone"];
    [self addSubview:_imageViewIcon];
    [_imageViewIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_deviceName.mas_bottom).mas_offset(10);
        make.bottom.mas_offset(-10);
        make.width.mas_equalTo(30);
        make.height.mas_equalTo(30);
        make.left.mas_offset(15);

    }];
    
    
    _timeLabel = [[UILabel alloc] init];
    _timeLabel.text = @"iPhone";
    _timeLabel.font = [UIFont systemFontOfSize:14];
    _timeLabel.textColor = [UIColor lightGrayColor];
    _timeLabel.textAlignment = NSTextAlignmentRight;
    [self addSubview:_timeLabel];
    [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_offset(-15);
        make.top.mas_offset(15);
        make.width.mas_equalTo(200);
        make.height.mas_offset(20);
    }];
    
    _deveceVersion = [[UILabel alloc] init];
    _deveceVersion.text = @"iPhone";
    _deveceVersion.font = [UIFont systemFontOfSize:14];
    _deveceVersion.textAlignment = NSTextAlignmentRight;
    _deveceVersion.textColor = [UIColor lightGrayColor];
    [self addSubview:_deveceVersion];
    [_deveceVersion mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_offset(-15);
        make.bottom.mas_offset(-15);
        make.width.mas_equalTo(200);
        make.height.mas_offset(20);
    }];
}

-(void)reloadWithInformation:(NSDictionary *)information{
    _deviceName.text = [information newStringValueForKey:@"telname"];
    _deveceVersion.text = [information newStringValueForKey:@"systems"];
    _timeLabel.text = [information newStringValueForKey:@"addtime"];
}

@end
