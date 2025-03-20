//
//  ZMONTranslateView.m
//  NIM
//
//  Created by Yan Wang on 2024/8/9.
//  Copyright © 2024 Netease. All rights reserved.
//

#import "ZMONTranslateView.h"

@interface ZMONTranslateView ()

@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UIView *box;
@property (nonatomic,strong) UIButton *sureBtn;
@property (nonatomic,strong) UIButton *closeBtn;
@property (nonatomic,strong) UIView *buttonBox;

@property (nonatomic,strong) NSArray *selectButtons;
@property (nonatomic,assign) NSInteger index;

@end

@implementation ZMONTranslateView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
        
        [self initUI];
        
        self.selectButtons = @[LangKey(@"report_reasons7"),LangKey(@"report_reasons8"),LangKey(@"report_reasons9"),LangKey(@"report_reasons10"),LangKey(@"report_reasons6")];
        self.index = 0;
    }
    return self;
}


- (void)initUI{
    _box = [[UIView alloc]initWithFrame:CGRectMake(20, (SCREEN_HEIGHT-382)/2, SCREEN_WIDTH-40, 382)];
    _box.backgroundColor = [UIColor whiteColor];
    _box.layer.cornerRadius = 12;
    [self addSubview:_box];
 
    
    [_box addSubview:self.titleLabel];
    self.titleLabel.frame = CGRectMake(0, 20, SCREEN_WIDTH-40, 20);
    
    UILabel *labsub = [[UILabel alloc] initWithFrame:CGRectMake(20, self.titleLabel.bottom+10, SCREEN_WIDTH-80, 70)];
    labsub.font = [UIFont systemFontOfSize:12.f];
    labsub.textColor = TextColor_3;
    labsub.numberOfLines = 0;
    labsub.text = LangKey(@"report_Tip");
    [_box addSubview:labsub];
    
    [_box addSubview:self.buttonBox];
    self.buttonBox.frame = CGRectMake(20, labsub.bottom, SCREEN_WIDTH-80, 180);
    
    CGFloat width = (SCREEN_WIDTH-100)/2;
    CGFloat height = 40;
    
    [_box addSubview:self.closeBtn];
    self.closeBtn.frame = CGRectMake(20, 382-20-height, width, height);
    
    [_box addSubview:self.sureBtn];
    self.sureBtn.frame = CGRectMake(width+40, 382-20-height, width, height);
}


//- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    [self animationClose];
//}

#pragma mark -- Setter && Getter
- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont boldSystemFontOfSize:16.f];
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
//        _titleLabel.numberOfLines = 0;
//        _titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        _titleLabel.text = LangKey(@"report_Content");
    }
    return _titleLabel;
}

- (void)handleReason:(UIButton *)sender
{
    sender.selected = !sender.selected;
    
    if(sender.selected){
        self.index = sender.tag;
    }
    
}

- (UIView *)buttonBox
{
    if(!_buttonBox){
        _buttonBox = [[UIView alloc]init];
        
        UIButton *Btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
        Btn1.frame = CGRectMake(0, 16, SCREEN_WIDTH-40, 20);
        [Btn1 addTarget:self action:@selector(handleReason:) forControlEvents:UIControlEventTouchUpInside];
        [Btn1 setImage:[UIImage imageNamed:@"icon_accessory_normal"] forState:UIControlStateNormal];
        [Btn1 setImage:[UIImage imageNamed:@"icon_accessory_selected"] forState:UIControlStateSelected];
        [Btn1 setTitle:LangKey(@"report_reasons7") forState:UIControlStateNormal];
        Btn1.titleLabel.font = [UIFont systemFontOfSize:14];
        [Btn1 setTitleColor:TextColor_4 forState:UIControlStateNormal];
        Btn1.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        Btn1.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 20);  // 调整图片与文字之间的间距
        Btn1.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);  // 调整文字与图片之间的间距
        [_buttonBox addSubview:Btn1];
        Btn1.tag = 0;

        
        UIButton *Btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
        Btn2.frame = CGRectMake(0, Btn1.bottom+16, SCREEN_WIDTH-40, 20);
        [Btn2 addTarget:self action:@selector(handleReason:) forControlEvents:UIControlEventTouchUpInside];
        [Btn2 setImage:[UIImage imageNamed:@"icon_accessory_normal"] forState:UIControlStateNormal];
        [Btn2 setImage:[UIImage imageNamed:@"icon_accessory_selected"] forState:UIControlStateSelected];
        [Btn2 setTitle:LangKey(@"report_reasons8") forState:UIControlStateNormal];
        Btn2.titleLabel.font = [UIFont systemFontOfSize:14];
        [Btn2 setTitleColor:TextColor_4 forState:UIControlStateNormal];
        Btn2.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        Btn2.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 20);  // 调整图片与文字之间的间距
        Btn2.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);  // 调整文字与图片之间的间距
        [_buttonBox addSubview:Btn2];
        Btn2.tag = 1;
        
        UIButton *Btn3 = [UIButton buttonWithType:UIButtonTypeCustom];
        Btn3.frame = CGRectMake(0, Btn2.bottom+16, SCREEN_WIDTH-40, 20);
        [Btn3 addTarget:self action:@selector(handleReason:) forControlEvents:UIControlEventTouchUpInside];
        [Btn3 setImage:[UIImage imageNamed:@"icon_accessory_normal"] forState:UIControlStateNormal];
        [Btn3 setImage:[UIImage imageNamed:@"icon_accessory_selected"] forState:UIControlStateSelected];
        [_buttonBox addSubview:Btn3];
        [Btn3 setTitle:LangKey(@"report_reasons9") forState:UIControlStateNormal];
        Btn3.titleLabel.font = [UIFont systemFontOfSize:14];
        [Btn3 setTitleColor:TextColor_4 forState:UIControlStateNormal];
        Btn3.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        Btn3.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 20);  // 调整图片与文字之间的间距
        Btn3.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        Btn3.tag = 2;
        
        UIButton *Btn4 = [UIButton buttonWithType:UIButtonTypeCustom];
        Btn4.frame = CGRectMake(0, Btn3.bottom+16, SCREEN_WIDTH-40, 20);
        [Btn4 addTarget:self action:@selector(handleReason:) forControlEvents:UIControlEventTouchUpInside];
        [Btn4 setImage:[UIImage imageNamed:@"icon_accessory_normal"] forState:UIControlStateNormal];
        [Btn4 setImage:[UIImage imageNamed:@"icon_accessory_selected"] forState:UIControlStateSelected];
        [_buttonBox addSubview:Btn4];
        [Btn4 setTitle:LangKey(@"report_reasons10") forState:UIControlStateNormal];
        Btn4.titleLabel.font = [UIFont systemFontOfSize:14];
        [Btn4 setTitleColor:TextColor_4 forState:UIControlStateNormal];
        Btn4.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        Btn4.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 20);  // 调整图片与文字之间的间距
        Btn4.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        Btn4.tag = 3;
        
        UIButton *Btn5 = [UIButton buttonWithType:UIButtonTypeCustom];
        Btn5.frame = CGRectMake(0, Btn4.bottom+16, SCREEN_WIDTH-40, 20);
        [Btn5 addTarget:self action:@selector(handleReason:) forControlEvents:UIControlEventTouchUpInside];
        [Btn5 setImage:[UIImage imageNamed:@"icon_accessory_normal"] forState:UIControlStateNormal];
        [Btn5 setImage:[UIImage imageNamed:@"icon_accessory_selected"] forState:UIControlStateSelected];
        [_buttonBox addSubview:Btn5];
        [Btn5 setTitle:LangKey(@"report_reasons6") forState:UIControlStateNormal];
        Btn5.titleLabel.font = [UIFont systemFontOfSize:14];
        [Btn5 setTitleColor:TextColor_4 forState:UIControlStateNormal];
        Btn5.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        Btn5.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 20);  // 调整图片与文字之间的间距
        Btn5.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        Btn5.tag = 4;
    }
    return _buttonBox;
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
        [_sureBtn addTarget:self action:@selector(handleSubmit) forControlEvents:UIControlEventTouchUpInside];
        _sureBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [_sureBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_sureBtn setTitle:LangKey(@"contact_tag_fragment_sure") forState:UIControlStateNormal];
        _sureBtn.backgroundColor = ThemeColor;
        _sureBtn.layer.cornerRadius = 10;
        _sureBtn.layer.shadowColor = DeepBtnColor.CGColor;
        _sureBtn.layer.shadowOffset = CGSizeMake(0,3);
        _sureBtn.layer.shadowOpacity = 1;
        _sureBtn.layer.shadowRadius = 0;
        
    }
    return _sureBtn;
}

- (void)handleSubmit
{
    [self animationClose];
//    [SVProgressHUD showMessage:LangKey(@"report_sucessed")];
    
    if ([self.delegate respondsToSelector:@selector(didTouchSubmitContentButton:)]) {
        [self.delegate didTouchSubmitContentButton:self.selectButtons[self.index]];
    }
    

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
