//
//  CCCLoginViewController.m
//  NIMDemo
//
//  Created by ght on 15-1-26.
//  Copyright (c) 2015年 Netease. All rights reserved.
//

#import "CCCLoginViewController.h"
#import "NTESMainTabController.h"
#import "UIView+Toast.h"
#import "SVProgressHUD.h"
#import "UIView+NTES.h"
#import "NSString+NTES.h"
#import "CCCLoginManager.h"
#import "NTESNotificationCenter.h"
#import "UIActionSheet+NTESBlock.h"
#import "CCCRegisterViewController.h"
#import "NTESRegistConfigManager.h"
#import <CoreTelephony/CTCellularData.h>
#import "CCCGlobalMacro.h"
#import "CCCAppDelegate.h"
#import "CCCAutoLoginManager.h"
#import "SNDevice.h"
#import "ZMONPolicyPrivacyViewController.h"

@interface CCCLoginViewController ()<UITextFieldDelegate> {
    UIActivityIndicatorView *_ActivityIndicator;
    BOOL _isloading;
}
@property (strong, nonatomic)  UIImageView *logoImageView;

@property (nonatomic, strong) UIButton *agreementButton;
@property (nonatomic, strong) UIButton *secureButton;

@property (strong, nonatomic)  UIButton *registerButton;
@property (strong, nonatomic)  UITextField *usernameTextField;
@property (strong, nonatomic) UIImageView *titleImg;
@property (strong, nonatomic) UIImageView *titleImg2;

@property (strong, nonatomic)  UITextField *passwordTextField;

@property (strong, nonatomic)  UIButton *loginButton;

@property (nonatomic,strong) YYLabel *protocolLabel;
@property (nonatomic,strong) YYLabel *registLabel;

@property (nonatomic, strong) ZMONCustomLoadingView *loadingView;

@end

@implementation CCCLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView *bg = [[UIImageView alloc]initWithFrame:self.view.bounds];
    bg.image = [UIImage imageNamed:@"login_bg"];
    [self.view addSubview:bg];

    [NTESRegistConfigManager shareConfigManager].loginVC = self;

    NIMUserDefaults *userDefaults = [NIMUserDefaults standardUserDefaults];
    if (userDefaults.language.length > 0) {
        [CCCAutoLoginManager sharedManager].isRequestAutoLoginFinish = YES;
        [self autoLogin];
    } else {
        
        //等待登陆菊花初始化：
        _ActivityIndicator = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleLarge];
        //设置菊花的中心点，貌似不能设置菊花的大小，系统自带的有三种样式
        _ActivityIndicator.color = [[UIColor blackColor] colorWithAlphaComponent:0.5];
        _ActivityIndicator.center = CGPointMake(NEEKIT_UIScreenWidth/2, NEEKIT_UIScreenHeight/2);
        //添加菊花
        [self.view addSubview:_ActivityIndicator];
        
        [self needsInitUI];
    }
    
    //1.获取网络权限 根绝权限进行人机交互
     if (__IPHONE_10_0) {
         [self networkStatus];
     }else {
         //2.2已经开启网络权限 监听网络状态
         [self addReachabilityManager];
     }
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(registSuccessWithAccount:) name:@"RegistFinshNotification" object:nil];
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];

    if ([NIMUserDefaults standardUserDefaults].accountName && [NIMUserDefaults standardUserDefaults].accountName.length > 0){
        _usernameTextField.text = [NIMUserDefaults standardUserDefaults].accountName;
    }
    
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(languageChanged:) name:KEKENotificationLanguageChanged object:nil];
    
//    [self.view addSubview:self.loadingView];
//    self.loadingView.hidden = YES;
}

//- (void)languageChanged:(NSNotification *)noti {
////    [self refreshNavBarStyle];
//    [_loginButton setTitle:LangKey(@"activity_login_login") forState:UIControlStateNormal];
//    [_registerButton setTitle:LangKey(@"activity_register_title") forState:UIControlStateNormal];
//}

- (void)needsInitUI {
        
    NIMUserDefaults *userDefaults = [NIMUserDefaults standardUserDefaults];
    if (userDefaults.language && userDefaults.language.length <= 0) {
        
        //在某个地方设置其 ，开始旋转动画
        [_ActivityIndicator startAnimating];

        [ZCHttpManager refreshGlobalConfig:^(NSDictionary * _Nonnull configDict) {//处理第一次启动语言问题
            if (configDict.allKeys.count > 0) {
                NIMUserDefaults *userDefaults = [NIMUserDefaults standardUserDefaults];
                NSString *lang = [configDict newStringValueForKey:@"lang"];
                if (userDefaults.yinnihione.length > 0 && [userDefaults.yinnihione boolValue]){
                    lang = Language_Default;
                }
                userDefaults.language = lang;
                [[NTESLanguageManager shareInstance] setLanguagre:lang];
                [[NSNotificationCenter defaultCenter] postNotificationName:@"NTESNotificationLogout" object:nil];
                CCCAppDelegate *delegate = (CCCAppDelegate *)[UIApplication sharedApplication].delegate;
                if (delegate.deviceToken) {
                    [[NIMSDK sharedSDK] updateApnsToken:delegate.deviceToken
                                       customContentKey:lang];
                    
                    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                        id<NIMApnsManager> apnsManager = [[NIMSDK sharedSDK] apnsManager];
                        NIMPushNotificationSetting *setting = [apnsManager currentSetting];
                        setting.type = NIMPushNotificationDisplayTypeNoDetail;
                        
                        [[NIMSDK sharedSDK].apnsManager updateApnsSetting:setting completion:^(NSError * _Nullable error) {
                            if (error)
                            {
                            
                            }
                        }];
                    });
                }
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    //菊花停止旋转
                    [_ActivityIndicator stopAnimating];
                    //菊花隐藏
                    [_ActivityIndicator setHidesWhenStopped:YES];
                    
                    //需要执行的方法
                    [self autoLogin];
                });
            } else {
                [self autoLogin];
            }
        }];
    } else {
        [self autoLogin];
    }
}

- (void)autoLogin {
   
    if (![CCCAutoLoginManager sharedManager].isRequestAutoLoginFinish){
        return;
    }
    
    if (![NIMUserDefaults standardUserDefaults].autoLogin.boolValue){
        [self initUI];
        return;
    }
    
    if ([NIMUserDefaults standardUserDefaults].accid.length > 0){
        [self initUI];
        return;
    }
    
    if ([CCCAutoLoginManager sharedManager].isloading){
        return;
    }
    [CCCAutoLoginManager sharedManager].isloading = YES;
    
    [SVProgressHUD show];
    
    [ZCHttpManager refreshGenerateUser:^(NSDictionary * _Nonnull data) {
               
        if (data.allKeys.count > 0) {
         
            NSString *nimtoken = [data newStringValueForKey:@"nimtoken"];
            NSString *accid = [data newStringValueForKey:@"id"];
            NSString *accountName = [data newStringValueForKey:@"account"];
            NSString *loginToken = [data newStringValueForKey:@"token"];
            NSString *issup = [data newStringValueForKey:@"issup"];

            
            [NIMUserDefaults standardUserDefaults].loginToken = loginToken;
            [NIMUserDefaults standardUserDefaults].accid = accid;
            [NIMUserDefaults standardUserDefaults].nimToken = nimtoken;
            [NIMUserDefaults standardUserDefaults].accountName = accountName;
            [NIMUserDefaults standardUserDefaults].issup = issup;
            
            
            [SVProgressHUD dismissWithDelay:0.1 completion:^{
                
                [CCCAutoLoginManager sharedManager].isloading = NO;

   
                NIMAutoLoginData *loginData = [[NIMAutoLoginData alloc] init];
                loginData.account = accid;
                loginData.token = nimtoken;
                loginData.authType = 0;
                loginData.loginExtension = @"";
                
                NTESLoginData *sdkData = [[NTESLoginData alloc] init];
                sdkData.account   = accid;
                sdkData.token     = nimtoken;
                sdkData.authType  = 0;
                sdkData.loginExtension = @"";
                
                [[CCCLoginManager sharedManager] setCurrentLoginData:sdkData];
                
                [[[NIMSDK sharedSDK] loginManager] autoLogin:loginData];
                
                NTESMainTabController * mainTab = [[NTESMainTabController alloc] initWithNibName:nil bundle:nil];
                [UIApplication sharedApplication].windows.firstObject.rootViewController = mainTab;
                
//                CCCAppDelegate *delegate = (CCCAppDelegate *)[UIApplication sharedApplication].delegate;
//                [delegate setupRTCCallKit];
            }];
            
        }
        else {
            
            [CCCAutoLoginManager sharedManager].isloading = NO;
            [self initUI];
            
            [SVProgressHUD dismissWithDelay:0.25 completion:^{
               
            }];
        }
    }];
}

/*
 CTCellularData在iOS9之前是私有类，权限设置是iOS10开始的，所以App Store审核没有问题
 获取网络权限状态
 */
- (void)networkStatus {
    //2.根据权限执行相应的交互
    CTCellularData *cellularData = [[CTCellularData alloc] init];
      
    /*
     此函数会在网络权限改变时再次调用
     */
    cellularData.cellularDataRestrictionDidUpdateNotifier = ^(CTCellularDataRestrictedState state) {
        switch (state) {
            case kCTCellularDataRestricted:
                  
                NSLog(@"Restricted");
                //2.1权限关闭的情况下 再次请求网络数据会弹出设置网络提示
                break;
            case kCTCellularDataNotRestricted:
            {
                NSLog(@"NotRestricted");
                //2.2已经开启网络权限 监听网络状态
                [self addReachabilityManager];
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self needsInitUI];
                });
            }
                break;
            default:
                break;
        }
    };
}

/**
 实时检查当前网络状态
 */
- (void)addReachabilityManager {
    AFNetworkReachabilityManager *afNetworkReachabilityManager = [AFNetworkReachabilityManager sharedManager];
      
    [afNetworkReachabilityManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusNotReachable:{
                NSLog(@"网络不通：%@",@(status) );
                break;
            }
            case AFNetworkReachabilityStatusReachableViaWiFi:{
                NSLog(@"网络通过WIFI连接：%@",@(status));
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self needsInitUI];
                });
                break;
            }
            case AFNetworkReachabilityStatusReachableViaWWAN:{
                NSLog(@"网络通过无线连接：%@",@(status) );
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self needsInitUI];
                });
                break;
            }
            default:
                break;
        }
    }];
      
    [afNetworkReachabilityManager startMonitoring];  //开启网络监视器；
}

-(void)registSuccessWithAccount:(NSNotification *)notification{
    NSDictionary *dict = notification.object;
    _usernameTextField.text = [dict newStringValueForKey:@"UserAccount"];
    _passwordTextField.text = [dict newStringValueForKey:@"UserPassWord"];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self doLogin];
    });
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self preferredStatusBarStyle];
    self.navigationController.navigationBarHidden = YES;
}

- (void)initUI{
    
   
    _logoImageView = [[UIImageView alloc] initWithFrame:CGRectMake((SCREEN_WIDTH-120)/2, SCREEN_STATUS_HEIGHT+50, 120, 120)];
    _logoImageView.contentMode = UIViewContentModeScaleAspectFit;
    _logoImageView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_logoImageView];
    _logoImageView.image = [UIImage imageNamed:@"login_logo"];
    
   
    UIView *usernameView = [[UIView alloc]initWithFrame:CGRectMake(20, _logoImageView.bottom+10, SCREEN_WIDTH-40, 50)];
    usernameView.backgroundColor = RGB_COLOR_String(@"#F6F6F6");
    usernameView.layer.cornerRadius = 10;
    usernameView.layer.masksToBounds = YES;
    [self.view addSubview:usernameView];
    
    self.titleImg = [[UIImageView alloc] initWithFrame:CGRectMake(15, 15, 20, 20)];
    self.titleImg.image = [UIImage imageNamed:@"login_icon_user"];
    [usernameView addSubview:self.titleImg];
    
    _usernameTextField = [[UITextField alloc] initWithFrame:CGRectMake(50, 3, SCREEN_WIDTH-90, 44)];
    _usernameTextField.font = [UIFont systemFontOfSize:16];
    _usernameTextField.textColor = TextColor_4;
//    _usernameTextField.delegate = self;
//        _usernameTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc]initWithString:LangKey(@"register_account_activity_account") attributes:@{NSForegroundColorAttributeName:TextColor_3}];
    _usernameTextField.attributedPlaceholder = attrString;
    [usernameView addSubview:_usernameTextField];
    
    UIView *psdView = [[UIView alloc]initWithFrame:CGRectMake(20, usernameView.bottom+10, SCREEN_WIDTH-40, 50)];
    psdView.backgroundColor = RGB_COLOR_String(@"#F6F6F6");
    psdView.layer.masksToBounds = YES;
    psdView.layer.cornerRadius = 10;
    [self.view addSubview:psdView];
    
    self.titleImg2 = [[UIImageView alloc] initWithFrame:CGRectMake(15, 15, 20, 20)];
                self.titleImg2.image = [UIImage imageNamed:@"login_icon_pwd"];
                [psdView addSubview:self.titleImg2];
    
    _passwordTextField = [[UITextField alloc] initWithFrame:CGRectMake(50, 3, SCREEN_WIDTH-90, 44)];
    _passwordTextField.font = [UIFont systemFontOfSize:16];
    _passwordTextField.textColor = TextColor_4;
    _passwordTextField.secureTextEntry = YES;
    self.passwordTextField.delegate = self;
    NSMutableAttributedString *attrString1 = [[NSMutableAttributedString alloc]initWithString:LangKey(@"register_account_activity_psw") attributes:@{NSForegroundColorAttributeName:TextColor_3}];
    _passwordTextField.attributedPlaceholder = attrString1;
    [psdView addSubview:_passwordTextField];
    
    self.secureButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    self.secureButton.frame = CGRectMake(SCREEN_WIDTH-70, 17, 16, 16);
    [self.secureButton addTarget:self action:@selector(pwdTextSwitch:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.secureButton setImage:[UIImage imageNamed:@"ic_visible"] forState:UIControlStateNormal];
    [self.secureButton setImage:[UIImage imageNamed:@"ic_invisible"] forState:UIControlStateSelected];
    self.secureButton.hidden = YES;
    [psdView addSubview:self.secureButton];
    
    _loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _loginButton.frame = CGRectMake(20, psdView.bottom+30, SCREEN_WIDTH-40, 50);
    _loginButton.titleLabel.font = [UIFont systemFontOfSize:17];
    [_loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_loginButton setTitle:LangKey(@"activity_login_login") forState:UIControlStateNormal];
    [_loginButton addTarget:self action:@selector(doLogin) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_loginButton];
    _loginButton.backgroundColor = [UIColor colorWithRed:43/255.0 green:188/255.0 blue:251/255.0 alpha:1];
    _loginButton.layer.cornerRadius = 10;
    _loginButton.layer.shadowColor = DeepBtnColor.CGColor;
    _loginButton.layer.shadowOffset = CGSizeMake(0,3);
    _loginButton.layer.shadowOpacity = 1;
    _loginButton.layer.shadowRadius = 0;
  
    
    
    _agreementButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _agreementButton.selected = YES;
    [_agreementButton setImage:[UIImage imageNamed:@"login_agreement_normal"] forState:UIControlStateNormal];
    [_agreementButton setImage:[UIImage imageNamed:@"login_agreement_press"] forState:UIControlStateSelected];
    [_agreementButton addTarget:self action:@selector(agreementButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_agreementButton];
    [_agreementButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(30);
        make.top.mas_equalTo(self.loginButton.mas_bottom).mas_offset(25);
        make.width.mas_equalTo(20);
        make.height.mas_equalTo(20);
    }];

    [self.view addSubview:self.protocolLabel];
    [self.protocolLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_agreementButton.mas_right).mas_offset(7);
        make.top.mas_equalTo(self.loginButton.mas_bottom).mas_offset(27);
        make.right.mas_offset(-5);
        make.height.mas_equalTo(50);
    }];
    

    
    [self.view addSubview:self.registLabel];
    self.registLabel.frame = CGRectMake(30, SCREEN_HEIGHT-SCREEN_BOTTOM_HEIGHT-80-20, SCREEN_WIDTH-60, 20);
    
    
    _registerButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _registerButton.frame = CGRectMake(30, SCREEN_HEIGHT-SCREEN_BOTTOM_HEIGHT-50-20, SCREEN_WIDTH-60, 50);
    _registerButton.backgroundColor = [ThemeColor colorWithAlphaComponent:0.1];
    _registerButton.titleLabel.font = [UIFont systemFontOfSize:16];
    [_registerButton setTitleColor:ThemeColor forState:UIControlStateNormal];
    [_registerButton setTitle:LangKey(@"activity_register_title") forState:UIControlStateNormal];
    [_registerButton addTarget:self action:@selector(doRegister) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_registerButton];
    _registerButton.layer.masksToBounds = YES;
    _registerButton.layer.cornerRadius = 10;
//    _registerButton.layer.borderColor = RGB_COLOR_String(@"#612CF9").CGColor;
//    _registerButton.layer.borderWidth = 1;
    
    [self.view addSubview:self.loadingView];
    [self.view bringSubviewToFront:self.loadingView];
    self.loadingView.hidden = YES;
}

- (void)doRegister
{
    CCCRegisterViewController *vc = [[CCCRegisterViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)pwdTextSwitch:(UIButton *)sender {
    
    // 切换按钮的状态
    sender.selected = !sender.selected;
    
    if (sender.selected) { // 按下去了就是明文
        
        [sender setImage:[UIImage imageNamed:@"ic_invisible"] forState:UIControlStateNormal];

        [UIView animateWithDuration:0.25 animations:^{
            self.passwordTextField.secureTextEntry = NO;
        }];
        
    } else { // 暗文
        
        [sender setImage:[UIImage imageNamed:@"ic_visible"] forState:UIControlStateNormal];
        
        [UIView animateWithDuration:0.25 animations:^{
            self.passwordTextField.secureTextEntry = YES;
        }];
    }
}

-(YYLabel *)protocolLabel{
    if (!_protocolLabel) {
        NSString *originText = LangKey(@"activity_register_agree");
        NSMutableAttributedString  *text1 = [[NSMutableAttributedString alloc] initWithString:originText];
        text1.yy_font = [UIFont boldSystemFontOfSize:14];
        text1.yy_alignment = NSTextAlignmentLeft;
        text1.yy_lineSpacing = 3;

        [text1 yy_setTextHighlightRange:NSMakeRange(0, originText.length)//设置点击的位置
                                  color:ThemeColor
                        backgroundColor:[UIColor systemGroupedBackgroundColor]
                              tapAction:^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect)
         {

            ZMONPolicyPrivacyViewController *vc = [[ZMONPolicyPrivacyViewController alloc] init];
            vc.webTitle = LangKey(@"activity_comment_setting_ys");
            vc.urlString = [NIMUserDefaults standardUserDefaults].yshref;
            [self.navigationController pushViewController:vc animated:YES];
//            @weakify(self);
//            vc.complete = ^{
//                @strongify(self);
//                [self.navigationController popViewControllerAnimated:NO];
//                self.agreementButton.selected = YES;
//            };
        }];
        
        YYLabel *titleLb = [[YYLabel alloc] init];
        titleLb.userInteractionEnabled  = YES;
        titleLb.attributedText = text1;
        titleLb.font = [UIFont systemFontOfSize:14];
        titleLb.numberOfLines = 0;
        titleLb.textVerticalAlignment   = YYTextVerticalAlignmentTop;
        titleLb.backgroundColor = [UIColor clearColor];
        _protocolLabel = titleLb;
    }
    return _protocolLabel;
}


-(YYLabel *)registLabel{
    if (!_registLabel) {
        NSString *noCount = LangKey(@"activity_login_has_no_account");
        NSString *originText = [NSString stringWithFormat:@"%@",noCount];
        NSMutableAttributedString  *text1 = [[NSMutableAttributedString alloc] initWithString:originText];
        text1.yy_font = [UIFont boldSystemFontOfSize:14];
        text1.yy_alignment = NSTextAlignmentCenter;
        text1.yy_color = RGB_COLOR_String(@"#8282A7");
        text1.yy_lineSpacing = 8;

  
        YYLabel *titleLb = [[YYLabel alloc] init];
        titleLb.userInteractionEnabled  = YES;
        titleLb.attributedText = text1;
        titleLb.font = [UIFont systemFontOfSize:14];
        titleLb.textVerticalAlignment   = YYTextVerticalAlignmentCenter;
        titleLb.backgroundColor = [UIColor clearColor];
        titleLb.numberOfLines = 0;
        _registLabel = titleLb;
    }
    return _registLabel;
}

-(void)agreementButtonClick:(UIButton *)senderBtn
{
    senderBtn.selected = !senderBtn.selected;
}

-(void)inputAccount:(NSString*)account password:(NSString *)password{
    _usernameTextField.text = account;
    _passwordTextField.text = password;
}

- (BOOL)isVPNConnected
{
    NSDictionary *dict = CFBridgingRelease(CFNetworkCopySystemProxySettings());
        NSArray *keys = [dict[@"__SCOPED__"]allKeys];
        for (NSString *key in keys) {
            if ([key rangeOfString:@"tap"].location != NSNotFound ||
                [key rangeOfString:@"tun"].location != NSNotFound ||
                [key rangeOfString:@"ppp"].location != NSNotFound){
                return YES;
            }
        }
        return NO;
}

- (void)doLogin {
        
    if (_agreementButton.selected == NO) {
        [self.view makeToast:LangKey(@"Read_agree_agreement") duration:2.0 position:CSToastPositionCenter];
        return;
    }
    
    _usernameTextField.text = [_usernameTextField.text stringByReplacingOccurrencesOfString:@" " withString:@""];
    _passwordTextField.text = [_passwordTextField.text stringByReplacingOccurrencesOfString:@" " withString:@""];

    if (_usernameTextField.text && _usernameTextField.text.length <= 0){
        [self.view makeToast:LangKey(@"register_account_activity_account") duration:2.0 position:CSToastPositionCenter];
        return;
    }
    
    if (_passwordTextField.text && _passwordTextField.text.length <= 0){
        [self.view makeToast:LangKey(@"register_account_activity_psw") duration:2.0 position:CSToastPositionCenter];
        return;
    }
    
    [_usernameTextField resignFirstResponder];
    [_passwordTextField resignFirstResponder];
    NSMutableDictionary *dict = @{}.mutableCopy;
    [dict setObject:@"ios" forKey:@"client"];
    [dict setObject:kConstant_1 forKey:@"type"];
    [dict setObject:_usernameTextField.text forKey:@"account"];
    [dict setObject:_passwordTextField.text forKey:@"password"];
    [dict setObject:[NSString stringWithFormat:@"iOS%@",[ZCHttpRequestHeader deviceVersion]] forKey:@"telname"];
    [dict setObject:[ZCHttpRequestHeader getIOSVersion] forKey:@"systems"];
    [dict setObject:[SNDevice deviceIUUID] forKey:@"deviceid"];
    
    [dict setObject:[self isVPNConnected]?@"1":@"0" forKey:@"vpn"];
    
    if (_isloading){
        return;
    }
    _isloading = YES;
    
    [self.loadingView animationShow];

    @weakify(self);
    [ZCHttpManager getWithUrl:Server_user_login params:dict isShow:NO success:^(id responseObject) {
        
        _isloading = NO;
        
        @strongify(self);
        NSDictionary *resultDict = (NSDictionary *)responseObject;
        NSString *code = [resultDict newStringValueForKey:@"code"];
        if (code.integerValue <= 0) {
            
            NSDictionary *data = [resultDict valueObjectForKey:@"data"];
            __block NSString *nimtoken = [data newStringValueForKey:@"nimtoken"];
            __block NSString *accid = [data newStringValueForKey:@"id"];
            
            [NIMUserDefaults standardUserDefaults].loginToken = [data newStringValueForKey:@"token"];
            [NIMUserDefaults standardUserDefaults].accid = [data newStringValueForKey:@"id"];

            
            [[[NIMSDK sharedSDK] loginManager] login:accid token:nimtoken completion:^(NSError * _Nullable error) {

                    [self.loadingView animationClose];
                    
                    if (error != nil) {
                        
                        [self.view makeToast:LangKey(@"login_activity_login_failed") duration:2.0 position:CSToastPositionCenter];
                        
                        return;
                    }
                    
                    NTESLoginData *sdkData = [[NTESLoginData alloc] init];
                    sdkData.account   = accid;
                    sdkData.token     = nimtoken;
                    sdkData.authType  = 0;
                    sdkData.loginExtension = @"";
                    [[CCCLoginManager sharedManager] setCurrentLoginData:sdkData];
                
                
                
                
                    NTESMainTabController * mainTab = [[NTESMainTabController alloc] initWithNibName:nil bundle:nil];
                    [UIApplication sharedApplication].windows.firstObject.rootViewController = mainTab;
                    [NIMUserDefaults standardUserDefaults].accountName = _usernameTextField.text;
                    [NIMUserDefaults standardUserDefaults].pCode = _passwordTextField.text;


            }];
        }else{
            [self.loadingView animationClose];
            [self.view makeToast:LangKey(@"login_activity_login_failed") duration:2.0 position:CSToastPositionCenter];
        }
    } failed:^(id responseObject, NSError *error) {
        [self.loadingView animationClose];
            _isloading = NO;
            [self.view makeToast:LangKey(@"friend_verify_avtivity_net_error") duration:2.0 position:CSToastPositionCenter];
    }];
}

#pragma mark - UITextFieldDelegate
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
        
    if ([string isEqualToString:@"\n"]) {
        [self doLogin];
        return NO;
    }
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    self.secureButton.hidden = YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    self.secureButton.hidden = NO;
    [textField bringSubviewToFront:self.secureButton];
}

#pragma mark - Private
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    [_usernameTextField resignFirstResponder];
    [_passwordTextField resignFirstResponder];
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (ZMONCustomLoadingView *)loadingView
{
    if(!_loadingView){
        _loadingView = [[ZMONCustomLoadingView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        _loadingView.hidden = YES;
    }
    return  _loadingView;
}


@end
