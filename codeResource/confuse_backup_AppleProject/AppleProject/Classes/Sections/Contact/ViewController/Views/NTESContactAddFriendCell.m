//
//  NTESContactAddFriendCell.m
//  NIM
//
//  Created by 彭爽 on 2021/10/19.
//  Copyright © 2021 Netease. All rights reserved.
//

#import "NTESContactAddFriendCell.h"

@implementation NTESContactAddFriendCell

- (void)initSubviews{
    
    self.backgroundColor = [UIColor clearColor];
    
    UIView *backView = [[UIView alloc] init];
    backView.backgroundColor = [UIColor whiteColor];
    backView.layer.masksToBounds = YES;
    backView.layer.cornerRadius = 4.6f;
    [self addSubview:backView];
    [backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(15);
        make.right.mas_offset(-15);
        make.height.mas_equalTo(50);
        make.top.mas_offset(0);

    }];
    
    UIImageView *imageIcon = [[UIImageView alloc] init];
    imageIcon.image = [UIImage imageNamed:@"ic_search"];
    [backView addSubview:imageIcon];
    [imageIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(8);
        make.centerY.mas_offset(0);
        make.width.height.mas_equalTo(23);
    }];
    
    _textField = [[UITextField alloc] init];
    [backView addSubview:_textField];
    [_textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(imageIcon.mas_right).mas_offset(5);
        make.centerY.mas_offset(0);
        make.right.mas_offset(-15);
        make.height.mas_equalTo(30);
        
    }];
    
    NSString *my_account = LangKey(@"activity_add_friend_my_account");
    NSString *myCodeStr = [NSString stringWithFormat:@"%@:%@",my_account,[NIMUserDefaults standardUserDefaults].accountName];
    UILabel *titleLable = [[UILabel alloc] init];
    titleLable.font = [UIFont systemFontOfSize:15];
    titleLable.textColor = [UIColor blackColor];
    titleLable.text = myCodeStr;
    [titleLable sizeToFit];
    [self addSubview:titleLable];
    [titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(backView.mas_bottom).mas_offset(40);
        make.centerX.mas_offset(0).mas_offset(-25);
        make.height.mas_equalTo(30);
        make.bottom.mas_offset(0);
    }];
    
    
    _myQRCodeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_myQRCodeBtn setImage:[UIImage imageNamed:@"icon_user_contact_qr"] forState:UIControlStateNormal];
    [_myQRCodeBtn setImage:[UIImage imageNamed:@"icon_user_contact_qr"] forState:UIControlStateHighlighted];
    [self addSubview:_myQRCodeBtn];
    [_myQRCodeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(titleLable.mas_right).mas_offset(3);
        make.centerY.mas_equalTo(titleLable);
        make.width.height.mas_equalTo(25);
    }];

    
    
}

@end
