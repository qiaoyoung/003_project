//
//  NTESRedpackageDetailCell.m
//  NIM
//
//  Created by 彭爽 on 2021/10/21.
//  Copyright © 2021 Netease. All rights reserved.
//

#import "NTESRedpackageDetailCell.h"

@implementation NTESRedpackageDetailCell

- (void)initSubviews{
    
    UIView *topview = [[UIView alloc] init];
    topview.backgroundColor = RGB_COLOR_String(@"#DF7055");
    [self addSubview:topview];
    [topview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(0);
        make.height.mas_equalTo(SCREEN_STATUS_HEIGHT + 10);
        make.left.mas_offset(0);
        make.right.mas_offset(0);
    }];
    
    UIImageView *imageBack = [[UIImageView alloc] init];
    imageBack.userInteractionEnabled = YES;
    imageBack.image = [UIImage imageNamed:@"icon_redpackage_top"];
    [self addSubview:imageBack];
    [imageBack mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(SCREEN_STATUS_HEIGHT);
        make.bottom.mas_offset(0);
        make.left.mas_offset(0);
        make.right.mas_offset(0);
        make.width.mas_equalTo(SCREEN_WIDTH);
        make.height.mas_equalTo(SCREEN_WIDTH/1162*720);
    }];
    
    _backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_backButton setImage:[UIImage imageNamed:@"back_white"] forState:UIControlStateNormal];
    [self addSubview:_backButton];
    [_backButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(SCREEN_STATUS_HEIGHT);
        make.left.mas_offset(10);
        make.width.height.mas_equalTo(35);
    }];
    
    
    _nickNameLabel = [[UILabel alloc] init];
    _nickNameLabel.textAlignment = NSTextAlignmentCenter;
    _nickNameLabel.font = [UIFont systemFontOfSize:18];
    _nickNameLabel.textColor = [UIColor blackColor];
    [_nickNameLabel sizeToFit];
    [imageBack addSubview:_nickNameLabel];
    [_nickNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(imageBack).mas_offset(13);
        make.centerY.mas_offset(10);
        make.height.mas_equalTo(20);
    }];
    
    _headerImage = [[UIImageView alloc] init];
    [imageBack addSubview:_headerImage];
    _headerImage.layer.masksToBounds = YES;
    _headerImage.layer.cornerRadius = 4.2;
    [_headerImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(_nickNameLabel.mas_left).mas_offset(-5);
        make.centerY.mas_equalTo(_nickNameLabel);
        make.width.height.mas_equalTo(25);
    }];
    
    
    _wordLabel = [[UILabel alloc] init];
    _wordLabel.textAlignment = NSTextAlignmentCenter;
    _wordLabel.font = [UIFont systemFontOfSize:13];
    _wordLabel.textColor = [UIColor lightGrayColor];
    [_wordLabel sizeToFit];
    [imageBack addSubview:_wordLabel];
    [_wordLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(imageBack);
        make.top.mas_equalTo(_nickNameLabel.mas_bottom).mas_offset(7);
        make.height.mas_equalTo(20);
    }];
    
    
    _contentLabel = [[UILabel alloc] init];
    _contentLabel.textAlignment = NSTextAlignmentLeft;
    _contentLabel.font = [UIFont systemFontOfSize:13];
    _contentLabel.textColor = [UIColor lightGrayColor];
    [imageBack addSubview:_contentLabel];
    [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(5);
        make.bottom.mas_offset(-5);
        make.height.mas_equalTo(20);
        make.right.mas_offset(-5);
    }];
    
}

-(void)reloadWithInformation:(NSDictionary *)information{
    _nickNameLabel.text = [information newStringValueForKey:@"user_nickname"];
    _wordLabel.text = [information newStringValueForKey:@"words"];
    [_headerImage sd_setImageWithURL:[NSURL URLWithString:[information newStringValueForKey:@"user_avatar"]]];
    
    NSString *count = [information newStringValueForKey:@"count"];
    NSString *amount = [information newStringValueForKey:@"amount"];
    _contentLabel.text = [NSString stringWithFormat:@"%@个红包，共%@元",count,amount];
    
}

-(void)backButtonClick{
    
}

@end







@implementation NTESRedpackageDetailListCell

-(void)initSubviews{
    
    UIView *line = [[UIView alloc] init];
    line.backgroundColor = RGB_COLOR_String(@"#F1F1F1");
    [self addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(15);
        make.right.mas_offset(-15);
        make.height.mas_equalTo(0.8);
        make.top.mas_offset(0);
    }];
    
    _headerImage = [[UIImageView alloc] init];
    [self addSubview:_headerImage];
    _headerImage.layer.masksToBounds = YES;
    _headerImage.layer.cornerRadius = 5.3;
    [_headerImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(10);
        make.top.mas_offset(10);
        make.bottom.mas_offset(-10);
        make.width.height.mas_equalTo(45);
    }];
    
    _nickNameLabel = [[UILabel alloc] init];
    _nickNameLabel.textAlignment = NSTextAlignmentLeft;
    _nickNameLabel.font = [UIFont systemFontOfSize:15];
    _nickNameLabel.textColor = [UIColor blackColor];
    [_nickNameLabel sizeToFit];
    [self addSubview:_nickNameLabel];
    [_nickNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_headerImage.mas_right).mas_equalTo(5);
        make.centerY.mas_equalTo(_headerImage).mas_offset(-10);
        make.height.mas_equalTo(20);
    }];

    _praiseImage = [[UIImageView alloc] init];
    _praiseImage.image = [UIImage imageNamed:@"user_redpackage_prise"];
    [self addSubview:_praiseImage];
    [_praiseImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_nickNameLabel.mas_right).mas_offset(3);
        make.centerY.mas_equalTo(_nickNameLabel).mas_offset(0);
        make.width.height.mas_equalTo(20);
    }];


    _timeLabel = [[UILabel alloc] init];
    _timeLabel.textAlignment = NSTextAlignmentLeft;
    _timeLabel.font = [UIFont systemFontOfSize:13];
    _timeLabel.textColor = [UIColor lightGrayColor];
    [_timeLabel sizeToFit];
    [self addSubview:_timeLabel];
    [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_headerImage.mas_right).mas_equalTo(5);
        make.centerY.mas_equalTo(_headerImage).mas_offset(10);
        make.height.mas_equalTo(20);
        make.width.mas_equalTo(200);
    }];


    _redAmountLabel = [[UILabel alloc] init];
    _redAmountLabel.textAlignment = NSTextAlignmentRight;
    _redAmountLabel.font = [UIFont systemFontOfSize:18];
    _redAmountLabel.textColor = [UIColor blackColor];
    [_redAmountLabel sizeToFit];
    [self addSubview:_redAmountLabel];
    [_redAmountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-8);
        make.centerY.mas_equalTo(_headerImage).mas_offset(0);
        make.height.mas_equalTo(20);
        make.width.mas_equalTo(200);
    }];
    

    
}
-(void)reloadWithInformation:(NSDictionary *)information{
    [_headerImage sd_setImageWithURL:[NSURL URLWithString:[information newStringValueForKey:@"avatar"]]];
    _nickNameLabel.text = [information newStringValueForKey:@"nickname"];
    _timeLabel.text = [information newStringValueForKey:@"createtime"];
    _redAmountLabel.text = [NSString stringWithFormat:@"%@元",[information newStringValueForKey:@"amount"]];
    [_nickNameLabel sizeToFit];
    [_praiseImage mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_nickNameLabel.mas_right).mas_offset(3);
    }];
    
}

@end
