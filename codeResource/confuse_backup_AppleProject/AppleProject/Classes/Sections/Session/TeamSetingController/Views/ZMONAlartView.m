//
//  ZMONAlartView.m
//  NIM
//
//  Created by Yan Wang on 2024/7/29.
//  Copyright © 2024 Netease. All rights reserved.
//

#import "ZMONAlartView.h"


@interface ZMONAlartView ()

@property (nonatomic,strong) UIButton *sureBtn;
@property (nonatomic,strong) UIButton *closeBtn;
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UIView *box;

@end

@implementation ZMONAlartView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
        
        [self initUI];
        
    }
    return self;
}


- (void)initUI{
    _box = [[UIView alloc]initWithFrame:CGRectMake(20, (SCREEN_HEIGHT-130)/2, SCREEN_WIDTH-40, 130)];
    _box.backgroundColor = [UIColor whiteColor];
    _box.layer.cornerRadius = 12;
    [self addSubview:_box];

    [_box addSubview:self.titleLabel];
    self.titleLabel.frame = CGRectMake(0, 20, SCREEN_WIDTH-40, 40);

    
    CGFloat width = (SCREEN_WIDTH-100)/2;
    CGFloat height = 40;
    
    [_box addSubview:self.sureBtn];
    [_box addSubview:self.closeBtn];
    self.sureBtn.frame = CGRectMake(20, self.titleLabel.bottom+10, width, height);
    self.closeBtn.frame = CGRectMake(width+40, self.titleLabel.bottom+10, width, height);

    
}

- (void)reloadWithTitlename:(NSString *)name
{
    self.titleLabel.text = name;
}

- (void)updateTheNickname{
    
    [self endEditing:YES];
    self.speiceBackBlock(@"");

}

#pragma mark -- Setter && Getter
- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:16.f];
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.numberOfLines = 0;
        _titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    }
    return _titleLabel;
}

- (UIButton *)closeBtn {
    if (!_closeBtn) {
        _closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_closeBtn addTarget:self action:@selector(animationClose) forControlEvents:UIControlEventTouchUpInside];
        _closeBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [_closeBtn setTitleColor:TextColor_2 forState:UIControlStateNormal];
        [_closeBtn setTitle:LangKey(@"contact_tag_fragment_cancel") forState:UIControlStateNormal];
        _closeBtn.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1];
        _closeBtn.layer.borderWidth = 0.5;
        _closeBtn.layer.borderColor = [UIColor colorWithRed:236/255.0 green:236/255.0 blue:236/255.0 alpha:1].CGColor;
        _closeBtn.layer.cornerRadius = 10;
        _closeBtn.layer.shadowColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.0800].CGColor;
        _closeBtn.layer.shadowOffset = CGSizeMake(0,3);
        _closeBtn.layer.shadowOpacity = 1;
        _closeBtn.layer.shadowRadius = 0;
    }
    return _closeBtn;
}

- (UIButton *)sureBtn {
    if (!_sureBtn) {
        _sureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_sureBtn addTarget:self action:@selector(updateTheNickname) forControlEvents:UIControlEventTouchUpInside];
        _sureBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [_sureBtn setTitleColor:ThemeColor forState:UIControlStateNormal];
        [_sureBtn setTitle:LangKey(@"contact_tag_fragment_sure") forState:UIControlStateNormal];
        _sureBtn.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1];
        _sureBtn.layer.borderWidth = 0.5;
        
        _sureBtn.layer.borderColor = [UIColor colorWithRed:43/255.0 green:188/255.0 blue:251/255.0 alpha:1].CGColor;
        _sureBtn.layer.cornerRadius = 10;
        _sureBtn.layer.shadowColor = DeepBtnColor.CGColor;
        _sureBtn.layer.shadowOffset = CGSizeMake(0,3);
        _sureBtn.layer.shadowOpacity = 1;
        _sureBtn.layer.shadowRadius = 0;
        
    }
    return _sureBtn;
}

- (void)animationClose
{
    self.hidden = YES;
}

- (void)animationShow
{
    self.hidden = NO;
    
}


@end
