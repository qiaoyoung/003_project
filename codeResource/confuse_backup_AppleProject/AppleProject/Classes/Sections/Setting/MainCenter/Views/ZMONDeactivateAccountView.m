//
//  ZMONDeactivateAccountView.m
//  AppleProject
//
//  Created by Yan Wang on 2025/2/5.
//  Copyright © 2025 AppleProject. All rights reserved.
//

#import "ZMONDeactivateAccountView.h"

@interface ZMONDeactivateAccountView ()

@property (nonatomic,assign) NSInteger inputLimit;
@property (nonatomic,strong) UIButton *sureBtn;
@property (nonatomic,strong) UIButton *closeBtn;
@property (nonatomic,strong) UILabel *titleLabel;
@property(nonatomic, strong) UIView *lineView;
@property (nonatomic,strong) UIView *searchView;
@property (nonatomic,strong) UITextField *searchField;
@property (nonatomic,strong) UIView *box;
@property (nonatomic,strong) UIImageView *img;
@property (nonatomic,strong) UIView *nextBox;
@property (nonatomic,strong) UIView *contentBox;
@property (nonatomic,strong) UIButton *agreementButton;

@end

@implementation ZMONDeactivateAccountView

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
    _box = [[UIView alloc]initWithFrame:CGRectMake(15, (SCREEN_HEIGHT-600)/2, SCREEN_WIDTH-30, 600)];
    _box.backgroundColor = [UIColor whiteColor];
    _box.layer.cornerRadius = 12;
    [self addSubview:_box];
    

    [_box addSubview:self.img];
    self.img.frame = CGRectMake(20, 20, 32, 32);
    
    [_box addSubview:self.titleLabel];
    self.titleLabel.frame = CGRectMake(30+32, 20, SCREEN_WIDTH-150, 32);
    
    UILabel *labtitle = [[UILabel alloc] initWithFrame:CGRectMake(20, self.img.bottom+15, SCREEN_WIDTH-70, 30)];
    labtitle.font = [UIFont systemFontOfSize:14.f];
    labtitle.textColor = [UIColor blackColor];
    labtitle.text = LangKey(@"Confirm_Account_Deactivation");
    [_box addSubview:labtitle];
    
    [_box addSubview:self.nextBox];
    self.nextBox.frame = CGRectMake(20, labtitle.bottom+10, SCREEN_WIDTH-70, 54);
    
    [_box addSubview:self.contentBox];
    self.contentBox.frame = CGRectMake(20, self.nextBox.bottom, SCREEN_WIDTH-70, 360);
    
    

    CGFloat width = (SCREEN_WIDTH-90)/2;
    CGFloat height = 40;
    
    [_box addSubview:self.closeBtn];
    self.closeBtn.frame = CGRectMake(width+40, 600-20-height, width, height);
    
    [_box addSubview:self.sureBtn];
    self.sureBtn.frame = CGRectMake(20, 600-20-height, width, height);
    
}



- (void)updateTheNickname{
    
    if (_agreementButton.selected == NO) {
        [self makeToast:LangKey(@"Read_agree_agreement") duration:2.0 position:CSToastPositionCenter];
        return;
    }
    
    [self animationClose];
    if ([self.delegate respondsToSelector:@selector(didTouchNextButton)]) {
        [self.delegate didTouchNextButton];
    }
 
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    return YES;
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{

    return YES;
}
- (void)textFieldDidEndEditing:(UITextField *)textField{
    self.titleLabel.text = textField.text;
}
- (BOOL)textFieldShouldClear:(UITextField *)textField{
    self.searchField.text = @"";
    return YES;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    return [textField resignFirstResponder];
    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self endEditing:YES];
}
#pragma mark -- Setter && Getter
- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:16.f];
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.text = LangKey(@"deactivate_account");
    }
    return _titleLabel;
}

- (UIImageView *)img
{
    if(!_img){
        _img = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ic-delete_account"]];
    }
    return _img;
}

- (UIView *)nextBox
{
    if(!_nextBox){
        _nextBox = [[UIView alloc]init];
        
        CGFloat width = (SCREEN_WIDTH-30-40)/3;
        UIView *view1 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, width, 54)];
        [_nextBox addSubview:view1];
        
        UIView *numView1 = [[UIView alloc]initWithFrame:CGRectMake((width-20)/2, 0, 20, 20)];
        numView1.backgroundColor = ThemeColor;
        numView1.layer.cornerRadius = 10;
        numView1.layer.masksToBounds = YES;
        [view1 addSubview:numView1];
        UILabel *labtitlenum1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
        labtitlenum1.font = [UIFont systemFontOfSize:12.f];
        labtitlenum1.textColor = [UIColor whiteColor];
        labtitlenum1.text = @"1";
        labtitlenum1.textAlignment = NSTextAlignmentCenter;
        [numView1 addSubview:labtitlenum1];
        
        UILabel *labtitle1 = [[UILabel alloc] initWithFrame:CGRectMake(0, numView1.bottom+4, width, 30)];
        labtitle1.font = [UIFont systemFontOfSize:11.f];
        labtitle1.textColor = [UIColor blackColor];
        labtitle1.text = LangKey(@"Read_agree_agreement");
        labtitle1.numberOfLines = 2;
        labtitle1.textAlignment = NSTextAlignmentCenter;
        [view1 addSubview:labtitle1];
        
        UIView *view2 = [[UIView alloc]initWithFrame:CGRectMake(width, 0, width, 54)];
        [_nextBox addSubview:view2];
        UIView *numView2 = [[UIView alloc]initWithFrame:CGRectMake((width-20)/2, 0, 20, 20)];
        numView2.backgroundColor = RGB_COLOR_String(@"#BCC1C8");
        numView2.layer.cornerRadius = 10;
        numView2.layer.masksToBounds = YES;
        [view2 addSubview:numView2];
        UILabel *labtitlenum2 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
        labtitlenum2.font = [UIFont systemFontOfSize:12.f];
        labtitlenum2.textColor = [UIColor whiteColor];
        labtitlenum2.text = @"2";
        labtitlenum2.textAlignment = NSTextAlignmentCenter;
        [numView2 addSubview:labtitlenum2];
        UILabel *labtitle2 = [[UILabel alloc] initWithFrame:CGRectMake(0, numView2.bottom+4, width, 30)];
        labtitle2.font = [UIFont systemFontOfSize:11.f];
        labtitle2.textColor = TextColor_2;
        labtitle2.text = LangKey(@"Vertify_login_password");
        labtitle2.numberOfLines = 2;
        labtitle2.textAlignment = NSTextAlignmentCenter;
        [view2 addSubview:labtitle2];
        
        UIView *view3 = [[UIView alloc]initWithFrame:CGRectMake(width*2, 0, width, 54)];
        [_nextBox addSubview:view3];
        UIView *numView3 = [[UIView alloc]initWithFrame:CGRectMake((width-20)/2, 0, 20, 20)];
        numView3.backgroundColor = RGB_COLOR_String(@"#BCC1C8");
        numView3.layer.cornerRadius = 10;
        numView3.layer.masksToBounds = YES;
        [view3 addSubview:numView3];
        UILabel *labtitlenum3 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
        labtitlenum3.font = [UIFont systemFontOfSize:12.f];
        labtitlenum3.textColor = [UIColor whiteColor];
        labtitlenum3.text = @"3";
        labtitlenum3.textAlignment = NSTextAlignmentCenter;
        [numView3 addSubview:labtitlenum3];
        UILabel *labtitle3 = [[UILabel alloc] initWithFrame:CGRectMake(0, numView3.bottom+4, width, 30)];
        labtitle3.font = [UIFont systemFontOfSize:11.f];
        labtitle3.textColor = TextColor_2;
        labtitle3.text = LangKey(@"Complete_operation");
        labtitle3.numberOfLines = 2;
        labtitle3.textAlignment = NSTextAlignmentCenter;
        [view3 addSubview:labtitle3];
        
        UIImageView *arrow1 = [[UIImageView alloc]initWithFrame:CGRectMake(width-10, 4, 20, 12)];
        arrow1.image = [UIImage imageNamed:@"safe_arrow_next"];
        [_nextBox addSubview:arrow1];
        
        UIImageView *arrow2 = [[UIImageView alloc]initWithFrame:CGRectMake(width*2-10, 4, 20, 12)];
        arrow2.image = [UIImage imageNamed:@"safe_arrow_next"];
        [_nextBox addSubview:arrow2];
    }
    return _nextBox;
}

- (UIView *)contentBox
{
    if(!_contentBox){
        _contentBox = [[UIView alloc]init];
        
        CGFloat width = (SCREEN_WIDTH-30-40);
        
        UILabel *labtitle1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 15, width, 20)];
        labtitle1.font = [UIFont boldSystemFontOfSize:12.f];
        labtitle1.textColor = TextColor_4;
        labtitle1.text = LangKey(@"Consequences_Deactivation");
        [_contentBox addSubview:labtitle1];
        UILabel *labsubtitle1 = [[UILabel alloc] initWithFrame:CGRectMake(0, labtitle1.bottom, width, 70)];
        labsubtitle1.font = [UIFont systemFontOfSize:12.f];
        labsubtitle1.textColor = TextColor_4;
        labsubtitle1.text = LangKey(@"Consequences_Deactivation_content");
        labsubtitle1.numberOfLines = 0;
        [_contentBox addSubview:labsubtitle1];
        [labsubtitle1 sizeToFit];
        
        UILabel *labtitle2 = [[UILabel alloc] initWithFrame:CGRectMake(0, labsubtitle1.bottom, width, 20)];
        labtitle2.font = [UIFont boldSystemFontOfSize:12.f];
        labtitle2.textColor = TextColor_4;
        labtitle2.text = LangKey(@"Data_Retention_Policy");
        [_contentBox addSubview:labtitle2];
        UILabel *labsubtitle2 = [[UILabel alloc] initWithFrame:CGRectMake(0, labtitle2.bottom, width, 70)];
        labsubtitle2.font = [UIFont systemFontOfSize:12.f];
        labsubtitle2.textColor = TextColor_4;
        labsubtitle2.text = LangKey(@"Data_Retention_Policy_content");
        labsubtitle2.numberOfLines = 0;
        [_contentBox addSubview:labsubtitle2];
        [labsubtitle2 sizeToFit];
        
        UILabel *labtitle3 = [[UILabel alloc] initWithFrame:CGRectMake(0, labsubtitle2.bottom, width, 20)];
        labtitle3.font = [UIFont boldSystemFontOfSize:12.f];
        labtitle3.textColor = TextColor_4;
        labtitle3.text = LangKey(@"Recovery_Options");
        [_contentBox addSubview:labtitle3];
        UILabel *labsubtitle3 = [[UILabel alloc] initWithFrame:CGRectMake(0, labtitle3.bottom, width, 70)];
        labsubtitle3.font = [UIFont systemFontOfSize:12.f];
        labsubtitle3.textColor = TextColor_4;
        labsubtitle3.text = LangKey(@"Recovery_Options_content");
        labsubtitle3.numberOfLines = 0;
        [_contentBox addSubview:labsubtitle3];
        [labsubtitle3 sizeToFit];
        
        _agreementButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _agreementButton.frame = CGRectMake(0, labsubtitle3.bottom+30, 16, 16);
        _agreementButton.selected = YES;
        [_agreementButton setImage:[UIImage imageNamed:@"login_agreement_normal"] forState:UIControlStateNormal];
        [_agreementButton setImage:[UIImage imageNamed:@"login_agreement_press"] forState:UIControlStateSelected];
        [_agreementButton addTarget:self action:@selector(agreementButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [_contentBox addSubview:_agreementButton];
        
        UILabel *labprotocol = [[UILabel alloc] initWithFrame:CGRectMake(_agreementButton.right+10, _agreementButton.top, SCREEN_WIDTH-70-40, 32)];
        labprotocol.font = [UIFont systemFontOfSize:12.f];
//        labprotocol.textColor = TextColor_4;
//        labprotocol.text = @"I have read and agree to the account deactivation terms";
        labprotocol.numberOfLines = 0;
        [_contentBox addSubview:labprotocol];
        labprotocol.userInteractionEnabled = YES;
        UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleProtocol)];
        [labprotocol addGestureRecognizer:singleTap];

        NSMutableAttributedString *tncString = [[NSMutableAttributedString alloc] initWithString:LangKey(@"agree_account_deactivation_terms")];
        [tncString addAttribute:NSUnderlineStyleAttributeName
                          value:@(NSUnderlineStyleSingle)
                          range:(NSRange){0,[tncString length]}];
        [tncString addAttribute:NSForegroundColorAttributeName value:ThemeColor  range:NSMakeRange(0,[tncString length])];
        [tncString addAttribute:NSUnderlineColorAttributeName value:ThemeColor range:(NSRange){0,[tncString length]}];
        labprotocol.attributedText = tncString;
        
        [labprotocol sizeToFit];
        
        
    }
    return _contentBox;
}

-(void)agreementButtonClick:(UIButton *)senderBtn
{
    senderBtn.selected = !senderBtn.selected;
}

-(void)handleProtocol
{
//    [self animationClose];
    if ([self.delegate respondsToSelector:@selector(didTouchProtocolButton)]) {
        [self.delegate didTouchProtocolButton];
    }
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
        [_sureBtn setTitleColor:RGB_COLOR_String(@"#FF483D") forState:UIControlStateNormal];
        [_sureBtn setTitle:LangKey(@"activity_register_next") forState:UIControlStateNormal];
        _sureBtn.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1];
        _sureBtn.layer.borderWidth = 0.5;
        _sureBtn.layer.borderColor = [UIColor colorWithRed:255/255.0 green:72/255.0 blue:61/255.0 alpha:1].CGColor;
        _sureBtn.layer.cornerRadius = 10;
        _sureBtn.layer.shadowColor = [UIColor colorWithRed:255/255.0 green:72/255.0 blue:61/255.0 alpha:0.0800].CGColor;
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

