//
//  NTESChangePasswordCell.m
//  NIM
//
//  Created by 彭爽 on 2021/9/29.
//  Copyright © 2021 Netease. All rights reserved.
//

#import "NTESChangePasswordCell.h"

@interface NTESChangePasswordCell ()<UITextFieldDelegate>

@end

@implementation NTESChangePasswordCell

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
        make.height.mas_equalTo(150);
    }];
    
    
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = TableSeparatorLineColor;
    [self addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(0);
        make.right.mas_offset(0);
        make.top.mas_offset(50);
        make.height.mas_equalTo(1);
    }];
    
    UIView *lineView_ = [[UIView alloc] init];
    lineView_.backgroundColor = TableSeparatorLineColor;
    [self addSubview:lineView_];
    [lineView_ mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(0);
        make.right.mas_offset(0);
        make.top.mas_offset(100);
        make.height.mas_equalTo(1);
    }];

    
    _textfile_1 = [[UITextField alloc] init];
    _textfile_1.secureTextEntry = YES;
    _textfile_1.font = [UIFont systemFontOfSize:16];
    _textfile_1.delegate = self;
    _textfile_1.placeholder = LangKey(@"activity_modify_old");//@"请输入旧密码";
    [backGround addSubview:_textfile_1];
    [_textfile_1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(20);
        make.right.mas_offset(-20);
        make.top.mas_offset(5);
        make.height.mas_equalTo(40);
    }];
    
    _textfile_2 = [[UITextField alloc] init];
    _textfile_2.secureTextEntry = YES;
    _textfile_2.font = [UIFont systemFontOfSize:16];
    _textfile_2.delegate = self;
    _textfile_2.placeholder = LangKey(@"activity_modify_new");//@"请输入新密码";
    [backGround addSubview:_textfile_2];
    [_textfile_2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(20);
        make.right.mas_offset(-20);
        make.top.mas_offset(55);
        make.height.mas_equalTo(40);
    }];
    
    _textfile_3 = [[UITextField alloc] init];
    _textfile_3.secureTextEntry = YES;
    _textfile_3.font = [UIFont systemFontOfSize:16];
    _textfile_3.delegate = self;
    _textfile_3.placeholder = LangKey(@"activity_modify_new");//@"请确认新密码";
    [backGround addSubview:_textfile_3];
    [_textfile_3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(20);
        make.right.mas_offset(-20);
        make.top.mas_offset(105);
        make.height.mas_equalTo(40);
    }];
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

@end
