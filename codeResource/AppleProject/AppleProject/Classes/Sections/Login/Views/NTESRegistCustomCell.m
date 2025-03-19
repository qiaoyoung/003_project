//
//  NTESRegistCustomCell.m
//  NIM
//
//  Created by 彭爽 on 2021/9/7.
//  Copyright © 2021 Netease. All rights reserved.
//

#import "NTESRegistCustomCell.h"

@implementation NTESRegistCustomCell

- (void)initSubviews{
    
    
    CGFloat scale = 1.f;
    
    if (kLessThan_IPHONE5){
        scale = [[UIScreen mainScreen] bounds].size.height / 667.f;
    }
    
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.font = [UIFont systemFontOfSize:16];
    _titleLabel.textColor = RGB_COLOR_String(@"#3F3F3F");
    [self addSubview:_titleLabel];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(20*scale);
        make.bottom.mas_offset(-20*scale);
        make.left.mas_offset(25);
        make.width.mas_equalTo(100*scale);
        make.height.mas_equalTo(20*scale);
    }];
    
    _arrowImageView = [[UIImageView alloc] init];
    _arrowImageView.image = [UIImage imageNamed:@"mine_btn_right"];
    [self addSubview:_arrowImageView];
    [_arrowImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self);
        make.right.mas_offset(-10);
        make.width.mas_equalTo(12);
        make.height.mas_equalTo(12);
    }];
    
    
    _contentTextField = [[UITextField alloc] init];
    _contentTextField.textAlignment = NSTextAlignmentRight;
    _contentTextField.userInteractionEnabled = NO;
    [self addSubview:_contentTextField];
    [_contentTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self);
        make.right.mas_offset(-50);
        make.width.mas_equalTo(180*scale);
        make.height.mas_equalTo(20*scale);
    }];
    
    
    _headerImageView = [[UIImageView alloc] init];
    _headerImageView.image = [UIImage imageNamed:@"head_default"];
    _headerImageView.backgroundColor = [UIColor clearColor];
    [self addSubview:_headerImageView];
    _headerImageView.layer.masksToBounds = YES;
    _headerImageView.layer.cornerRadius = 23*scale;
    [_headerImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self);
        make.right.mas_offset(-50*scale);
        make.width.mas_equalTo(46*scale);
        make.height.mas_equalTo(46*scale);
    }];
    
    
    
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = TableSeparatorLineColor;
    [self addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(25);
        make.right.mas_offset(-25);
        make.bottom.mas_offset(0);
        make.height.mas_equalTo(1);
    }];
}

@end
