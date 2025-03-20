//
//  NTESContactTableHeader.m
//  NIM
//
//  Created by 彭爽 on 2021/9/27.
//  Copyright © 2021 Netease. All rights reserved.
//

#import "NTESContactTableHeader.h"

@implementation NTESContactTableHeader

-(instancetype)init{
    self = [super init];
    if (self) {
        self.backgroundColor = RGB_COLOR_String(@"#F7F8FB");
        
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = [UIColor lightGrayColor];
        _titleLabel.font = [UIFont boldSystemFontOfSize:14];
        [self addSubview:_titleLabel];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_offset(0);
            make.left.mas_offset(18);
            make.width.mas_equalTo(100);
            make.height.mas_equalTo(15);
        }];
    }
    return self;
}

@end




@implementation NTESContactTableHeaderGroup

-(instancetype)init{
    self = [super init];
    if (self) {
        self.backgroundColor = RGB_COLOR_String(@"#F7F8FB");
        
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.font = [UIFont boldSystemFontOfSize:14];
        [self addSubview:_titleLabel];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_offset(0);
            make.left.mas_offset(18);
            make.width.mas_equalTo(200);
            make.height.mas_equalTo(30);
        }];

        
        _arrowImageView = [[UIImageView alloc] init];
        [self addSubview:_arrowImageView];
        [_arrowImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_offset(0);
            make.right.mas_offset(-15);
            make.width.mas_equalTo(14);
            make.height.mas_equalTo(8);
        }];
        
        UIButton *button  = [UIButton buttonWithType:UIButtonTypeCustom];
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_offset(0);
            make.top.mas_offset(0);
            make.bottom.mas_offset(0);
            make.right.mas_offset(0);
        }];
    }
    return self;
}

-(void)buttonClick:(UIButton *)sender{
    if (self.delegate && [self.delegate respondsToSelector:@selector(headerClickWith:)]) {
        [self.delegate headerClickWith:self.section];
    }
}

@end
