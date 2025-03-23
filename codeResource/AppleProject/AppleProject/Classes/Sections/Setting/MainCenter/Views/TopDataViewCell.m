
#import <Foundation/Foundation.h>
typedef struct {
    Byte laboratory;
    Byte *commonCamera;
    unsigned int plainName;
    bool vend;
	int countervention;
	int schemeProvider;
	int frameChange;
} KickData;

NSString *StringFromKickData(KickData *data);


//: #3F3F3F
KickData str_interventionCameraName = (KickData){116, (Byte []){87, 71, 50, 71, 50, 71, 50, 26}, 7, false, 92, 45, 95};


//: btn_right
KickData str_progressImposeContent = (KickData){231, (Byte []){133, 147, 137, 184, 149, 142, 128, 143, 147, 11}, 9, false, 105, 107, 177};

// __DEBUG__
// __CLOSE_PRINT__
//
//  TopDataViewCell.m
//  NIM
//
//  Created by 彭爽 on 2021/9/17.
//  Copyright © 2021 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import "NTESSafetySetingCell.h"
#import "TopDataViewCell.h"

//: @implementation NTESSafetySetingCell
@implementation TopDataViewCell

//: - (void)initSubviews{
- (void)initChangeByWill{
    //: self.backgroundColor = [UIColor clearColor];
    self.backgroundColor = [UIColor clearColor];

    //: UIView *backGround = [[UIView alloc] init];
    UIView *backGround = [[UIView alloc] init];
    //: backGround.backgroundColor = [UIColor whiteColor];
    backGround.backgroundColor = [UIColor whiteColor];
    //: [self addSubview:backGround];
    [self addSubview:backGround];
    //: backGround.layer.masksToBounds = YES;
    backGround.layer.masksToBounds = YES;
    //: backGround.layer.cornerRadius = 5;
    backGround.layer.cornerRadius = 5;
    //: [backGround mas_makeConstraints:^(MASConstraintMaker *make) {
    [backGround mas_makeConstraints:^(MASConstraintMaker *make) {
        //: make.left.mas_offset(15);
        make.left.mas_offset(15);
        //: make.right.mas_offset(-15);
        make.right.mas_offset(-15);
        //: make.top.mas_offset(0);
        make.top.mas_offset(0);
        //: make.bottom.mas_offset(0);
        make.bottom.mas_offset(0);
        //: make.height.mas_equalTo(50);
        make.height.mas_equalTo(50);
    //: }];
    }];




    //: _buttonTop = [UIButton buttonWithType:UIButtonTypeCustom];
    _buttonTop = [UIButton buttonWithType:UIButtonTypeCustom];
    //: [self addSubview:_buttonTop];
    [self addSubview:_buttonTop];
    //: [_buttonTop mas_makeConstraints:^(MASConstraintMaker *make) {
    [_buttonTop mas_makeConstraints:^(MASConstraintMaker *make) {
        //: make.left.mas_offset(0);
        make.left.mas_offset(0);
        //: make.right.mas_offset(0);
        make.right.mas_offset(0);
        //: make.top.mas_offset(0);
        make.top.mas_offset(0);
        //: make.height.mas_equalTo(50);
        make.height.mas_equalTo(50);
    //: }];
    }];



    //: _topLabel = [[UILabel alloc] init];
    _topLabel = [[UILabel alloc] init];
    //: _topLabel.font = [UIFont systemFontOfSize:16];
    _topLabel.font = [UIFont systemFontOfSize:16];
    //: _topLabel.text = @"";
    _topLabel.text = @"";
    //: _topLabel.textColor = [UIColor colorWithHexString:@"#3F3F3F"];
    _topLabel.textColor = [UIColor direction:StringFromKickData(&str_interventionCameraName)];
    //: [_buttonTop addSubview:_topLabel];
    [_buttonTop addSubview:_topLabel];
    //: [_topLabel mas_makeConstraints:^(MASConstraintMaker *make) {
    [_topLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        //: make.left.mas_offset(25);
        make.left.mas_offset(25);
        //: make.centerY.mas_offset(0);
        make.centerY.mas_offset(0);
        //: make.width.mas_equalTo(300);
        make.width.mas_equalTo(300);
        //: make.height.mas_equalTo(30);
        make.height.mas_equalTo(30);
    //: }];
    }];


    //: UIImageView *arrowImage = [[UIImageView alloc] init];
    UIImageView *arrowImage = [[UIImageView alloc] init];
    //: arrowImage.image = [UIImage imageNamed:@"btn_right"];
    arrowImage.image = [UIImage imageNamed:StringFromKickData(&str_progressImposeContent)];
    //: [_buttonTop addSubview:arrowImage];
    [_buttonTop addSubview:arrowImage];
    //: [arrowImage mas_makeConstraints:^(MASConstraintMaker *make) {
    [arrowImage mas_makeConstraints:^(MASConstraintMaker *make) {
        //: make.right.mas_offset(-20);
        make.right.mas_offset(-20);
        //: make.centerY.mas_offset(0);
        make.centerY.mas_offset(0);
        //: make.height.mas_equalTo(12);
        make.height.mas_equalTo(12);
        //: make.width.mas_equalTo(12);
        make.width.mas_equalTo(12);

    //: }];
    }];

}


//: @end
@end

Byte *KickDataToByte(KickData *data) {
    if (data->vend) return data->commonCamera;
    for (int i = 0; i < data->plainName; i++) {
        data->commonCamera[i] ^= data->laboratory;
    }
    data->commonCamera[data->plainName] = 0;
    data->vend = true;
	if (data->plainName >= 3) {
		data->countervention = data->commonCamera[0];
		data->schemeProvider = data->commonCamera[1];
		data->frameChange = data->commonCamera[2];
	}
    return data->commonCamera;
}

NSString *StringFromKickData(KickData *data) {
    return [NSString stringWithUTF8String:(char *)KickDataToByte(data)];
}
