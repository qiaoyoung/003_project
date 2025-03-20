//
//  ZMONDeactivateAccountNextView.m
//  AppleProject
//
//  Created by Yan Wang on 2025/2/6.
//  Copyright © 2025 AppleProject. All rights reserved.
//

#import "ZMONDeactivateAccountNextView.h"

@interface ZMONDeactivateAccountNextView ()<UITextFieldDelegate>

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

@end

@implementation ZMONDeactivateAccountNextView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
        
        [self initUI];
        
    }
    return self;
}


- (void)initUI
{
    _box = [[UIView alloc]initWithFrame:CGRectMake(15, (SCREEN_HEIGHT-266)/2, SCREEN_WIDTH-30, 266)];
    _box.backgroundColor = [UIColor whiteColor];
    _box.layer.cornerRadius = 12;
    [self addSubview:_box];
    

    [_box addSubview:self.img];
    self.img.frame = CGRectMake(20, 20, 32, 32);
    
    [_box addSubview:self.titleLabel];
    self.titleLabel.frame = CGRectMake(30+32, 20, SCREEN_WIDTH-150, 32);
    
//    UILabel *labtitle = [[UILabel alloc] initWithFrame:CGRectMake(20, self.img.bottom+15, SCREEN_WIDTH-70, 30)];
//    labtitle.font = [UIFont systemFontOfSize:14.f];
//    labtitle.textColor = [UIColor blackColor];
//    labtitle.text = @"Confirm Account Deactivation?";
//    [_box addSubview:labtitle];
    
    [_box addSubview:self.nextBox];
    self.nextBox.frame = CGRectMake(20, self.img.bottom+20, SCREEN_WIDTH-70, 54);
    
        [_box addSubview:self.searchView];
        self.searchView.frame = CGRectMake(20, self.nextBox.bottom+15, SCREEN_WIDTH-70, 44);
    

    
    CGFloat width = (SCREEN_WIDTH-90)/2;
    CGFloat height = 40;
    
    [_box addSubview:self.closeBtn];
    self.closeBtn.frame = CGRectMake(width+40, 266-20-height, width, height);
    
    [_box addSubview:self.sureBtn];
    self.sureBtn.frame = CGRectMake(20, 266-20-height, width, height);
    
}

- (void)reloadWithNickname:(NSString *)nickname
{
    self.titleLabel.text = nickname;
}

- (void)updateTheNickname{
    
    [self endEditing:YES];
    
    NSString *pcode = [NIMUserDefaults standardUserDefaults].pCode?:@"";
    if([pcode isEqualToString:self.searchField.text]){
        self.speiceBackBlock(self.searchField.text);

    }else{
        
        [self makeToast:LangKey(@"wrong_password") duration:2.0 position:CSToastPositionCenter];
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
        UIImageView *img1 = [[UIImageView alloc]initWithFrame:CGRectMake((width-20)/2, 0, 20, 20)];
        img1.image = [UIImage imageNamed:@"safe_success_step"];
        [view1 addSubview:img1];
//        UIView *numView1 = [[UIView alloc]initWithFrame:CGRectMake((width-20)/2, 0, 20, 20)];
//        numView1.backgroundColor = ThemeColor;
//        numView1.layer.cornerRadius = 10;
//        numView1.layer.masksToBounds = YES;
//        [view1 addSubview:numView1];
//        UILabel *labtitlenum1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
//        labtitlenum1.font = [UIFont systemFontOfSize:12.f];
//        labtitlenum1.textColor = [UIColor whiteColor];
//        labtitlenum1.text = @"1";
//        labtitlenum1.textAlignment = NSTextAlignmentCenter;
//        [numView1 addSubview:labtitlenum1];
        
        UILabel *labtitle1 = [[UILabel alloc] initWithFrame:CGRectMake(0, img1.bottom+4, width, 30)];
        labtitle1.font = [UIFont systemFontOfSize:11.f];
        labtitle1.textColor = [UIColor blackColor];
        labtitle1.text = LangKey(@"Read_agree_agreement");
        labtitle1.numberOfLines = 2;
        labtitle1.textAlignment = NSTextAlignmentCenter;
        [view1 addSubview:labtitle1];
        
        UIView *view2 = [[UIView alloc]initWithFrame:CGRectMake(width, 0, width, 54)];
        [_nextBox addSubview:view2];
        UIView *numView2 = [[UIView alloc]initWithFrame:CGRectMake((width-20)/2, 0, 20, 20)];
        numView2.backgroundColor = ThemeColor;
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
        labtitle2.textColor = [UIColor blackColor];
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


- (UIView *)searchView{
    if(!_searchView){
        _searchView = [[UIView alloc]init];
        _searchView.layer.borderWidth = 1;
        _searchView.layer.borderColor = ThemeColor.CGColor;
        _searchView.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1];
        _searchView.layer.cornerRadius = 10;
        
        UIImageView *imgname = [[UIImageView alloc]initWithFrame:CGRectMake(15, 11, 20, 20)];
        imgname.image = [UIImage imageNamed:@"safe_bind_phone_icon"];
        [_searchView addSubview:imgname];
        
        _searchField = [[UITextField alloc]initWithFrame:CGRectMake(50, 2, SCREEN_WIDTH-80-50, 40)];
        _searchField.placeholder = LangKey(@"get_pay_psw_activity_input_psw");
        _searchField.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
        _searchField.clearButtonMode = UITextFieldViewModeWhileEditing;
        _searchField.delegate = self;
        [_searchView addSubview:_searchField];
        
    }
    return _searchView;
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
        [_sureBtn setTitle:LangKey(@"contact_tag_fragment_sure") forState:UIControlStateNormal];
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
