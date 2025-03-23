//
//  ZMONReportDeleteView.m
//  AppleProject
//
//  Created by Yan Wang on 2025/2/17.
//  Copyright © 2025 AppleProject. All rights reserved.
//

#import "ZMONReportDeleteView.h"
#import "NTESBundleSetting.h"
@interface ZMONReportDeleteView ()

@property (nonatomic,strong) UIButton *sureBtn;
@property (nonatomic,strong) UIButton *closeBtn;
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UIView *box;

@end

@implementation ZMONReportDeleteView

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
    _box = [[UIView alloc]initWithFrame:CGRectMake(20, (SCREEN_HEIGHT-196)/2, SCREEN_WIDTH-40, 196)];
    _box.backgroundColor = [UIColor whiteColor];
    _box.layer.cornerRadius = 12;
    [self addSubview:_box];

    [_box addSubview:self.titleLabel];
    self.titleLabel.frame = CGRectMake(0, 20, SCREEN_WIDTH-40, 20);

    UILabel *labsubLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, self.titleLabel.bottom, SCREEN_WIDTH-80, 50)];
    labsubLabel.font = [UIFont systemFontOfSize:12.f];
    labsubLabel.textColor = TextColor_4;
    labsubLabel.numberOfLines = 0;
    labsubLabel.text = LangKey(@"report_next_select_delete");
    [_box addSubview:labsubLabel];
    
    CGFloat width = (SCREEN_WIDTH-100)/2;
    CGFloat height = 40;
    
    [_box addSubview:self.sureBtn];
    [_box addSubview:self.closeBtn];
    self.closeBtn.frame = CGRectMake(20, 196-height-20, width, height);
    self.sureBtn.frame = CGRectMake(width+40, 196-height-20, width, height);

    
}

- (void)handleDelete
{
    [self animationClose];
    
    self.speiceBackBlock(@"YES");
}


#pragma mark -- Setter && Getter
- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:16.f];
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.text = LangKey(@"user_profile_avtivity_remove_friend");
    }
    return _titleLabel;
}

- (UIButton *)closeBtn {
    if (!_closeBtn) {
        _closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_closeBtn addTarget:self action:@selector(animationClose) forControlEvents:UIControlEventTouchUpInside];
        _closeBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [_closeBtn setTitle:LangKey(@"contact_tag_fragment_cancel") forState:UIControlStateNormal];
        [_closeBtn setTitleColor:TextColor_2 forState:UIControlStateNormal];
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
        [_sureBtn addTarget:self action:@selector(handleDelete) forControlEvents:UIControlEventTouchUpInside];
        _sureBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [_sureBtn setTitleColor:RGB_COLOR_String(@"#FF483D") forState:UIControlStateNormal];
        [_sureBtn setTitle:LangKey(@"delete") forState:UIControlStateNormal];
        _sureBtn.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1];
        _sureBtn.layer.borderWidth = 0.5;
        _sureBtn.layer.borderColor = [UIColor colorWithRed:255/255.0 green:72/255.0 blue:61/255.0 alpha:1].CGColor;
        _sureBtn.layer.cornerRadius = 10;
        _sureBtn.layer.shadowColor = [UIColor colorWithRed:255/255.0 green:72/255.0 blue:61/255.0 alpha:1].CGColor;
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
