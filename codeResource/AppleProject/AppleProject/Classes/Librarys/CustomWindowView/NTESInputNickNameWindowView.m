//
//  NTESInputNickNameWindowView.m
//  NIM
//
//  Created by 彭爽 on 2021/9/7.
//  Copyright © 2021 Netease. All rights reserved.
//

#import "NTESInputNickNameWindowView.h"

@interface NTESInputNickNameWindowView ()

@end

@implementation NTESInputNickNameWindowView

-(instancetype)init{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.3];
        self.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        
        UIButton *disButton = [UIButton buttonWithType:UIButtonTypeCustom];
        disButton.frame = self.bounds;
        [disButton addTarget:self action:@selector(dismissPicker) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:disButton];
        
        
        UIView *backGroundView = [[UIView alloc] init];
        backGroundView.backgroundColor = [UIColor whiteColor];
        [self addSubview:backGroundView];
        [backGroundView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.center.mas_equalTo(self);
            make.top.mas_equalTo(100);
            make.centerX.mas_equalTo(self);
            make.width.mas_equalTo(SCREEN_WIDTH -70);
            make.height.mas_equalTo(200);
        }];
        
        
        UILabel *titleLabel = [[UILabel alloc] init];
        titleLabel.font = [UIFont systemFontOfSize:16];
        titleLabel.textColor = [UIColor blackColor];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.text = @"";
        [backGroundView addSubview:titleLabel];
        _titleLabel = titleLabel;
        [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_offset(30);
            make.left.mas_offset(20);
            make.right.mas_equalTo(-20);
            make.height.mas_equalTo(30);
        }];
        
        
        _textField = [[UITextField alloc] init];
        _textField.placeholder = LangKey(@"register_avtivity3_nick");
        [backGroundView addSubview:_textField];
        [_textField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(titleLabel.mas_bottom).mas_offset(20);
            make.left.mas_offset(30);
            make.right.mas_equalTo(-30);
            make.height.mas_equalTo(30);
        }];
        
        UIView *lineView = [[UIView alloc] init];
        lineView.backgroundColor = TableSeparatorLineColor;
        [backGroundView addSubview:lineView];
        [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(_textField.mas_bottom).mas_offset(10);
            make.left.mas_offset(30);
            make.right.mas_equalTo(-30);
            make.height.mas_equalTo(1.2);
        }];
        
        
        UIButton *knowButton = [UIButton buttonWithType:UIButtonTypeCustom];
        knowButton.titleLabel.font = [UIFont systemFontOfSize:16];
        [knowButton setTitle:LangKey(@"activity_register_next") forState:UIControlStateNormal];
        [knowButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [knowButton addTarget:self action:@selector(knowButtonClick) forControlEvents:UIControlEventTouchUpInside];
        knowButton.backgroundColor = RGB_COLOR_String(@"#52ACFC");
        [backGroundView addSubview:knowButton];
        _dowmButton = knowButton;
        knowButton.layer.masksToBounds = YES;
        knowButton.layer.cornerRadius = 4;
        [knowButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(_textField.mas_bottom).mas_offset(25);
            make.left.mas_offset(20);
            make.right.mas_offset(-20);
            make.height.mas_equalTo(45);
        }];
        
        
        
//        UIImageView *bgimage = [[UIImageView alloc] init];
//        bgimage.userInteractionEnabled = YES;
//        bgimage.image = [UIImage imageNamed:@"mine_opinipn_bgimage"];
//        [self addSubview:bgimage];
//        [bgimage mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.width.mas_equalTo(254);
//            make.height.mas_equalTo(278);
//            make.centerY.mas_equalTo(self);
//            make.centerX.mas_equalTo(self);
//        }];
//
//        UIButton *closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//        [closeBtn setImage:[UIImage imageNamed:@"mine_opinipn_close"] forState:UIControlStateNormal];
//        [closeBtn addTarget:self action:@selector(closeBtnClick) forControlEvents:UIControlEventTouchUpInside];
//        [bgimage addSubview:closeBtn];
//        [closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.right.mas_equalTo(bgimage);
//            make.top.mas_equalTo(bgimage);
//            make.width.mas_equalTo(50);
//            make.height.mas_equalTo(50);
//        }];
        

        

        
        
    }
    return self;
}

-(void)closeBtnClick{
    [self dismissPicker];
}

-(void)knowButtonClick{
    
    if (_textField.text.length <= 0) {
        [SVProgressHUD showMessage:@"输入不能为空".nim_localized];
        return;
    }
    
    if (_block) {
        _block(_textField.text);
    }
    [self dismissPicker];
}

- (void)show{
    UIWindow *window = [[[UIApplication sharedApplication]delegate]window];
    [window addSubview:self];
}

- (void)dismissPicker{

    [UIView animateWithDuration:0.3 animations:^{
        
    } completion:^(BOOL finished) {
        self.hidden = YES;
        [self removeFromSuperview];
    }];
    
}

-(void)clickKnowButton:(KnowBlock)block{
    _block = block;
}


@end
