//
//  NTESSystemSignNotificationSheet.m
//  NIM
//
//  Created by 彭爽 on 2021/10/13.
//  Copyright © 2021 Netease. All rights reserved.
//

#import "NTESSystemSignNotificationSheet.h"
#define Height  320

@interface NTESSystemSignNotificationSheet ()
@property (nonatomic,strong) NSDictionary *originDict;
@property (nonatomic,strong) UIView *backView;
@end

@implementation NTESSystemSignNotificationSheet

-(instancetype)initWithFrame:(CGRect)frame dictionary:(NSDictionary *)dictionary{
    
    self = [super initWithFrame:frame];
    if (self) {
        
        _originDict = [NSDictionary dictionaryWithDictionary:dictionary];
        self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.4];
        
        CGFloat width = SCREEN_WIDTH-100;
        
        _backView = [[UIView alloc] initWithFrame:CGRectMake(50, SCREEN_HEIGHT/2- Height/2, width, width/710*1013)];
        _backView.backgroundColor = [UIColor whiteColor];
        [self addSubview:_backView];
        _backView.layer.cornerRadius = 8.2;
        _backView.layer.shadowColor = [UIColor lightGrayColor].CGColor;
        _backView.layer.shadowOffset = CGSizeMake(-1, -1);
        _backView.layer.shadowOpacity = 0.5;
        
        UIImageView *topImageView = [[UIImageView alloc] init];
        topImageView.userInteractionEnabled = YES;
        topImageView.image = [UIImage imageNamed:@"home_syetem_sign_back"];
        [_backView addSubview:topImageView];
        [topImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_offset(0);
            make.top.mas_offset(0);
            make.width.mas_equalTo(_backView.mas_width);
            make.height.mas_equalTo(_backView.mas_height);
        }];
        
  
        UILabel *title_1 = [[UILabel alloc] init];
        title_1.textColor = [UIColor whiteColor];
        title_1.font = [UIFont boldSystemFontOfSize:25];
        title_1.textAlignment = NSTextAlignmentCenter;
        title_1.text = LangKey(@"sign_gold_title");
        [topImageView addSubview:title_1];
        [title_1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_offset(5);
            make.right.mas_offset(-5);
            make.top.mas_offset(20);
            make.height.mas_equalTo(30);
        }];
        
        UILabel *title_2 = [[UILabel alloc] init];
        title_2.textColor = [UIColor whiteColor];
        title_2.textAlignment = NSTextAlignmentCenter;
        title_2.font = [UIFont boldSystemFontOfSize:15];
        title_2.text = LangKey(@"sign_keep_title");
        [topImageView addSubview:title_2];
        [title_2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_offset(5);
            make.right.mas_offset(-5);
            make.top.mas_offset(50);
            make.height.mas_equalTo(30);
        }];
        
        
        
        
        UIButton *closeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        closeButton.titleLabel.font = [UIFont systemFontOfSize:15];
        closeButton.backgroundColor = RGB_COLOR_String(@"#EE4A5C");
        [closeButton setTitle:LangKey(@"dialog_sign_now") forState:UIControlStateNormal];
        [closeButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [closeButton addTarget:self action:@selector(signButtonClick) forControlEvents:UIControlEventTouchUpInside];
        [_backView addSubview:closeButton];
        closeButton.layer.masksToBounds = YES;
        closeButton.layer.cornerRadius = 18;
        closeButton.layer.borderColor = RGB_COLOR_String(@"#EE4A5C").CGColor;
        closeButton.layer.borderWidth = 1.4;
        [closeButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(_backView.mas_bottom).offset(-20);
            make.width.mas_equalTo(150);
            make.height.mas_equalTo(36);
            make.centerX.mas_offset(0);
        }];
        
        
        UIButton *close = [UIButton buttonWithType:UIButtonTypeCustom];
        [close setImage:[UIImage imageNamed:@"home_system_sign_close"] forState:UIControlStateNormal];
        [close addTarget:self action:@selector(closeButtonClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:close];
        [close mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(_backView.mas_bottom).offset(20);
            make.width.mas_equalTo(34);
            make.height.mas_equalTo(34);
            make.centerX.mas_offset(0);
        }];
        
        
        
        UITapGestureRecognizer* singleRecognizer=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleSingleTapFrom)];
        singleRecognizer.numberOfTapsRequired=1;
        [self addGestureRecognizer:singleRecognizer];
        
    }
    return self;
}

-(void)signButtonClick{
    [self dismissPicker];
    if (self.delegate && [self.delegate respondsToSelector:@selector(signButtonClickDelegate)]) {
        [self.delegate signButtonClickDelegate];
    }
}


-(void)closeButtonClick{
    [self dismissPicker];
}

-(void)handleSingleTapFrom{
    [self dismissPicker];
}

- (void)show{
    
    UIWindow *window = [[[UIApplication sharedApplication]delegate]window];
    [window addSubview:self];
    
    [UIView animateWithDuration:0.3 animations:^{
        [self->_backView setOriginY:SCREEN_SAFE_HEIGHT/2- Height/2];
    }];
}

- (void)dismissPicker{
    [UIView animateWithDuration:0.3 animations:^{
        [self->_backView setOriginY:SCREEN_HEIGHT];
    } completion:^(BOOL finished) {
        
        self.hidden = YES;
        [self removeFromSuperview];
    }];
    
    
}

@end
