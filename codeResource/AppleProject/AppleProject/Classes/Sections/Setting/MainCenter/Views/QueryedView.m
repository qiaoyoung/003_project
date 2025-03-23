
#import <Foundation/Foundation.h>

NSString *StringFromInfoData(Byte *data);


//: telname
Byte str_linkPopularValue[] = {46, 7, 38, 13, 185, 147, 182, 184, 188, 200, 239, 100, 19, 154, 139, 146, 148, 135, 147, 139, 26};


//: addtime
Byte str_bySchemeData[] = {85, 7, 42, 4, 139, 142, 142, 158, 147, 151, 143, 249};


//: systems
Byte str_flavorPostName[] = {67, 7, 36, 8, 99, 173, 48, 22, 151, 157, 151, 152, 137, 145, 151, 147};


//: user_device_phone
Byte str_gestureCuriousName[] = {96, 17, 66, 8, 193, 1, 29, 10, 183, 181, 167, 180, 161, 166, 167, 184, 171, 165, 167, 161, 178, 170, 177, 176, 167, 200};


//: iPhone
Byte str_imageTextTitleValue[] = {7, 6, 22, 9, 33, 148, 124, 106, 40, 127, 102, 126, 133, 132, 123, 213};

// __DEBUG__
// __CLOSE_PRINT__
//
//  QueryedView.m
//  NIM
//
//  Created by 彭爽 on 2021/9/13.
//  Copyright © 2021 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import "NTESDeviceListTableViewCell.h"
#import "QueryedView.h"

//: @implementation NTESDeviceListTableViewCell
@implementation QueryedView

//: - (void)initSubviews{
- (void)initChangeByWill{

    //: _deviceName = [[UILabel alloc] init];
    _deviceName = [[UILabel alloc] init];
    //: _deviceName.text = @"iPhone";
    _deviceName.text = StringFromInfoData(str_imageTextTitleValue);
    //: _deviceName.font = [UIFont systemFontOfSize:16];
    _deviceName.font = [UIFont systemFontOfSize:16];
    //: _deviceName.textColor = [UIColor blackColor];
    _deviceName.textColor = [UIColor blackColor];
    //: [self addSubview:_deviceName];
    [self addSubview:_deviceName];
    //: [_deviceName mas_makeConstraints:^(MASConstraintMaker *make) {
    [_deviceName mas_makeConstraints:^(MASConstraintMaker *make) {
        //: make.left.mas_offset(15);
        make.left.mas_offset(15);
        //: make.top.mas_offset(15);
        make.top.mas_offset(15);
        //: make.width.mas_equalTo(200);
        make.width.mas_equalTo(200);
        //: make.height.mas_offset(20);
        make.height.mas_offset(20);
    //: }];
    }];

    //: _imageViewIcon = [[UIImageView alloc] init];
    _imageViewIcon = [[UIImageView alloc] init];
    //: _imageViewIcon.image = [UIImage imageNamed:@"user_device_phone"];
    _imageViewIcon.image = [UIImage imageNamed:StringFromInfoData(str_gestureCuriousName)];
    //: [self addSubview:_imageViewIcon];
    [self addSubview:_imageViewIcon];
    //: [_imageViewIcon mas_makeConstraints:^(MASConstraintMaker *make) {
    [_imageViewIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        //: make.top.mas_equalTo(_deviceName.mas_bottom).mas_offset(10);
        make.top.mas_equalTo(_deviceName.mas_bottom).mas_offset(10);
        //: make.bottom.mas_offset(-10);
        make.bottom.mas_offset(-10);
        //: make.width.mas_equalTo(30);
        make.width.mas_equalTo(30);
        //: make.height.mas_equalTo(30);
        make.height.mas_equalTo(30);
        //: make.left.mas_offset(15);
        make.left.mas_offset(15);

    //: }];
    }];


    //: _timeLabel = [[UILabel alloc] init];
    _timeLabel = [[UILabel alloc] init];
    //: _timeLabel.text = @"iPhone";
    _timeLabel.text = StringFromInfoData(str_imageTextTitleValue);
    //: _timeLabel.font = [UIFont systemFontOfSize:14];
    _timeLabel.font = [UIFont systemFontOfSize:14];
    //: _timeLabel.textColor = [UIColor lightGrayColor];
    _timeLabel.textColor = [UIColor lightGrayColor];
    //: _timeLabel.textAlignment = NSTextAlignmentRight;
    _timeLabel.textAlignment = NSTextAlignmentRight;
    //: [self addSubview:_timeLabel];
    [self addSubview:_timeLabel];
    //: [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
    [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        //: make.right.mas_offset(-15);
        make.right.mas_offset(-15);
        //: make.top.mas_offset(15);
        make.top.mas_offset(15);
        //: make.width.mas_equalTo(200);
        make.width.mas_equalTo(200);
        //: make.height.mas_offset(20);
        make.height.mas_offset(20);
    //: }];
    }];

    //: _deveceVersion = [[UILabel alloc] init];
    _deveceVersion = [[UILabel alloc] init];
    //: _deveceVersion.text = @"iPhone";
    _deveceVersion.text = StringFromInfoData(str_imageTextTitleValue);
    //: _deveceVersion.font = [UIFont systemFontOfSize:14];
    _deveceVersion.font = [UIFont systemFontOfSize:14];
    //: _deveceVersion.textAlignment = NSTextAlignmentRight;
    _deveceVersion.textAlignment = NSTextAlignmentRight;
    //: _deveceVersion.textColor = [UIColor lightGrayColor];
    _deveceVersion.textColor = [UIColor lightGrayColor];
    //: [self addSubview:_deveceVersion];
    [self addSubview:_deveceVersion];
    //: [_deveceVersion mas_makeConstraints:^(MASConstraintMaker *make) {
    [_deveceVersion mas_makeConstraints:^(MASConstraintMaker *make) {
        //: make.right.mas_offset(-15);
        make.right.mas_offset(-15);
        //: make.bottom.mas_offset(-15);
        make.bottom.mas_offset(-15);
        //: make.width.mas_equalTo(200);
        make.width.mas_equalTo(200);
        //: make.height.mas_offset(20);
        make.height.mas_offset(20);
    //: }];
    }];
}

//: -(void)reloadWithInformation:(NSDictionary *)information{
-(void)heritage:(NSDictionary *)information{
    //: _deviceName.text = [information newStringValueForKey:@"telname"];
    _deviceName.text = [information cord:StringFromInfoData(str_linkPopularValue)];
    //: _deveceVersion.text = [information newStringValueForKey:@"systems"];
    _deveceVersion.text = [information cord:StringFromInfoData(str_flavorPostName)];
    //: _timeLabel.text = [information newStringValueForKey:@"addtime"];
    _timeLabel.text = [information cord:StringFromInfoData(str_bySchemeData)];
}

//: @end
@end

Byte * InfoDataToCache(Byte *data) {
    int infoConcerning = data[0];
    int statuteName = data[1];
    Byte recordTropic = data[2];
    int patronymic = data[3];
    if (!infoConcerning) return data + patronymic;
    for (int i = patronymic; i < patronymic + statuteName; i++) {
        int value = data[i] - recordTropic;
        if (value < 0) {
            value += 256;
        }
        data[i] = value;
    }
    data[0] = 0;
    data[patronymic + statuteName] = 0;
    return data + patronymic;
}

NSString *StringFromInfoData(Byte *data) {
    return [NSString stringWithUTF8String:(char *)InfoDataToCache(data)];
}
