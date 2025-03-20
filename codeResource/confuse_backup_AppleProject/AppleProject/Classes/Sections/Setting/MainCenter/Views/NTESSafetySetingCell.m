//
//  NTESSafetySetingCell.m
//  NIM
//
//  Created by 彭爽 on 2021/9/17.
//  Copyright © 2021 Netease. All rights reserved.
//

#import "NTESSafetySetingCell.h"

@implementation NTESSafetySetingCell

- (void)initSubviews{
    self.backgroundColor = [UIColor clearColor];
    
    UIView *backGround = [[UIView alloc] init];
    backGround.backgroundColor = [UIColor whiteColor];
    [self addSubview:backGround];
    backGround.layer.masksToBounds = YES;
    backGround.layer.cornerRadius = 5;
    [backGround mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(15);
        make.right.mas_offset(-15);
        make.top.mas_offset(0);
        make.bottom.mas_offset(0);
        make.height.mas_equalTo(50);
    }];
    

    
    
    _buttonTop = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:_buttonTop];
    [_buttonTop mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(0);
        make.right.mas_offset(0);
        make.top.mas_offset(0);
        make.height.mas_equalTo(50);
    }];
    
    
    
    _topLabel = [[UILabel alloc] init];
    _topLabel.font = [UIFont systemFontOfSize:16];
    _topLabel.text = @"";
    _topLabel.textColor = RGB_COLOR_String(@"#3F3F3F");
    [_buttonTop addSubview:_topLabel];
    [_topLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(25);
        make.centerY.mas_offset(0);
        make.width.mas_equalTo(300);
        make.height.mas_equalTo(30);
    }];
    
    
    UIImageView *arrowImage = [[UIImageView alloc] init];
    arrowImage.image = [UIImage imageNamed:@"btn_right"];
    [_buttonTop addSubview:arrowImage];
    [arrowImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_offset(-20);
        make.centerY.mas_offset(0);
        make.height.mas_equalTo(12);
        make.width.mas_equalTo(12);

    }];
    
}


@end
