//
//  ZMONRegisterNickNameViewController.m
//  NIM
//
//  Created by Yan Wang on 2024/7/26.
//  Copyright © 2024 Netease. All rights reserved.
//

#import "ZMONRegisterNickNameViewController.h"
#import "ZMONRegisterAvatarViewController.h"


@interface ZMONRegisterNickNameViewController ()<UITextFieldDelegate>

@property (nonatomic, strong) UIButton *closeBtn;

@property (nonatomic, strong) UIImageView *backGroundImgView;
@property (nonatomic, strong) UILabel  *appNameLabel;
@property (nonatomic, strong) UILabel  *subLabel;

@property (nonatomic, strong) UIView *usernameView;

@property (nonatomic, strong) UILabel *accountLabel;
@property (nonatomic, strong) UITextField *accountTextfield;

@property (nonatomic, strong) UILabel *tipsLabel;
@property (nonatomic, strong) UILabel *tipsLabel1;

@property (nonatomic, strong) UIButton *registButton;

@property (strong, nonatomic) NSString *loginbgCode;
@property (strong, nonatomic) UIColor *defColor;

@end

@implementation ZMONRegisterNickNameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView *bg = [[UIImageView alloc]initWithFrame:self.view.bounds];
    bg.image = [UIImage imageNamed:@"login_bg"];
    [self.view addSubview:bg];
    
    [self initUI];
    
}

- (void)backAction{
    [self.navigationController popViewControllerAnimated:NO];
}

- (void)initUI
{
    self.closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.closeBtn.frame = CGRectMake(15, SCREEN_STATUS_HEIGHT+2, 40, 40);
    //    self.closeBtn.backgroundColor = [UIColor clearColor];
    [self.closeBtn setImage:[UIImage imageNamed:@"back_arrow_bl"] forState:(UIControlStateNormal)];
    [self.closeBtn addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.closeBtn];
    
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(60,  45+SCREEN_STATUS_HEIGHT, SCREEN_WIDTH-120, 40)];
    titleLabel.textColor = [UIColor blackColor];
    titleLabel.font = [UIFont boldSystemFontOfSize:24];
    titleLabel.text = LangKey(@"activity_my_user_info_nick");
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:titleLabel];
    
    
    self.accountLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, titleLabel.bottom+20, SCREEN_WIDTH-40, 20)];
    self.accountLabel.font = [UIFont systemFontOfSize:14];
    self.accountLabel.textColor = TextColor_2;
    self.accountLabel.text = LangKey(@"register_good_nick");
    self.accountLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.accountLabel];
    
//    UILabel *tip = [[UILabel alloc] initWithFrame:CGRectMake(20, self.accountLabel.bottom+30, SCREEN_WIDTH-40, 40)];
//    tip.font = [UIFont systemFontOfSize:14];
//    tip.textColor = TextColor_2;
//    tip.text = LangKey(@"nickname_same_account");
//    tip.numberOfLines = 2;
//    [self.view addSubview:tip];
    
    _usernameView = [[UIView alloc]initWithFrame:CGRectMake(20, self.accountLabel.bottom+50, SCREEN_WIDTH-40, 50)];
    _usernameView.layer.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1].CGColor;
    _usernameView.layer.cornerRadius = 8;
    _usernameView.layer.shadowColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.0800].CGColor;
    _usernameView.layer.shadowOffset = CGSizeMake(0,3);
    _usernameView.layer.shadowOpacity = 1;
    _usernameView.layer.shadowRadius = 0;
    [self.view addSubview:_usernameView];
    
    
    self.accountTextfield = [[UITextField alloc] initWithFrame:CGRectMake(15, 15, SCREEN_WIDTH-60-30, 20)];
    self.accountTextfield.font = [UIFont systemFontOfSize:16];
    self.accountTextfield.textColor = TextColor_4;
    self.accountTextfield.placeholder = LangKey(@"register_avtivity3_nick");
    self.accountTextfield.delegate = self;
    [_usernameView addSubview:self.accountTextfield];
    
    
    self.registButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.registButton.frame = CGRectMake(20, _usernameView.bottom+20, SCREEN_WIDTH-40, 44);
    self.registButton.backgroundColor = ThemeColor;
    //    self.registButton.layer.masksToBounds = YES;
    self.registButton.layer.cornerRadius = 10;
    self.registButton.layer.shadowColor = DeepBtnColor.CGColor;
    self.registButton.layer.shadowOffset = CGSizeMake(0,3);
    self.registButton.layer.shadowOpacity = 1;
    self.registButton.layer.shadowRadius = 0;
    self.registButton.titleLabel.font = [UIFont systemFontOfSize:16];
    [self.registButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.registButton setTitle:LangKey(@"activity_register_next") forState:UIControlStateNormal];
    [self.view addSubview:self.registButton];
    [self.registButton addTarget:self action:@selector(nextButtonClick) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)nextButtonClick
{
    if (_accountTextfield.text.length == 0) {
        [self.view makeToast:LangKey(@"register_avtivity3_nick")
                    duration:2.0
                    position:CSToastPositionCenter];
        return;
    }
    if ([_accountTextfield.text isEqualToString:self.accountName]) {
        [self.view makeToast:LangKey(@"nickname_same_account")
                    duration:2.0
                    position:CSToastPositionCenter];
        return;
    }
    
    
    ZMONRegisterAvatarViewController *vc = [[ZMONRegisterAvatarViewController alloc]init];
    vc.nickName =  self.accountTextfield.text;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    [_accountTextfield resignFirstResponder];
}

@end
