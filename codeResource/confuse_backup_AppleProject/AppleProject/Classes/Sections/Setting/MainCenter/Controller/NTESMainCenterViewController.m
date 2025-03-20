//
//  NTESMainCenterViewController.m
//  NIM
//
//  Created by 彭爽 on 2021/9/8.
//  Copyright © 2021 Netease. All rights reserved.
//

#import "NTESMainCenterViewController.h"
#import "CCCCommonTableData.h"
#import "CCCCommonTableDelegate.h"
#import "SVProgressHUD.h"
#import "UIView+Toast.h"
#import "UIView+NTES.h"
#import "NTESBundleSetting.h"
#import "UIActionSheet+NTESBlock.h"
#import "UIAlertView+NTESBlock.h"
#import "NTESNotificationCenter.h"
#import "NTESCustomNotificationDB.h"
#import <AVFoundation/AVFoundation.h>

#import "NTESColorButtonCell.h"

#import "CCCBlackListViewController.h"
#import "NTESUserUtil.h"

#import "NTESSessionUtil.h"
#import "NTESMigrateMessageViewController.h"

#import <NIMSDK/NIMSDK.h>
#import "UIView+NTES.h"
#import "UIAlertView+NTESBlock.h"
#import "CCCUserInfoViewController.h"//个人资料
#import "NTESUserQRCodeViewController.h" //我的二维码
#import "NTESSafetySetingController.h"   //安全设置
#import "NTESFeedbackViewController.h" //意见反馈
#import "NTESLanguageViewController.h"
#import "NTESMainCenterCell.h"
#import "NTESOpinionBackViewController.h" //意见反馈
#import "ZMONPolicyPrivacyViewController.h"


@interface NTESMainCenterViewController ()<NIMUserManagerDelegate,NTESMainCenterDelegate>


@property (nonatomic,strong) UIView *box;
@property (nonatomic,strong) UIButton *sureBtn;
@property (nonatomic,strong) UIButton *closeBtn;
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UILabel *accountLabel;
@property (nonatomic,strong) UIImageView *headerImage;

@end

@implementation NTESMainCenterViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
    [self refreshUserInfo];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden = NO;
    [SVProgressHUD dismiss];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView *bg = [[UIImageView alloc]initWithFrame:self.view.bounds];
    bg.image = [UIImage imageNamed:@"login_bg"];
    [self.view addSubview:bg];
    
    [self initUI];
    [[NIMSDK sharedSDK].userManager addDelegate:self];
}

- (void)refreshUserInfo
{
    NSString *userID = [[NIMSDK sharedSDK].loginManager currentAccount];
    NIMUser *me = [[NIMSDK sharedSDK].userManager userInfo:userID];
    CCCKitInfo *info = [[AppleProjectKit sharedKit] infoByUser:userID option:nil];
    
    self.titleLabel.text = me.userInfo.nickName;
    self.accountLabel.text = [NSString stringWithFormat:@"%@",emptyString([NIMUserDefaults standardUserDefaults].accountName)];
    [self.headerImage sd_setImageWithURL:[NSURL URLWithString:me.userInfo.avatarUrl] placeholderImage:info.avatarImage];
}

- (void)initUI{
    
    NSString *userID = [[NIMSDK sharedSDK].loginManager currentAccount];
    NIMUser *me = [[NIMSDK sharedSDK].userManager userInfo:userID];
    CCCKitInfo *info = [[AppleProjectKit sharedKit] infoByUser:userID option:nil];
    
    
    [self.view addSubview:self.titleLabel];
    self.titleLabel.text = me.userInfo.nickName;
    self.titleLabel.frame = CGRectMake(30, SCREEN_TOP_HEIGHT+10, 150, 25);
    [self.titleLabel sizeToFit];
    
    UIImageView *arrowImage = [[UIImageView alloc] initWithFrame:CGRectMake(self.titleLabel.right+10, SCREEN_TOP_HEIGHT+12, 20, 20)];
    arrowImage.image = [UIImage imageNamed:@"ic_edit"];
    [self.view addSubview:arrowImage];
    
    arrowImage.userInteractionEnabled = YES;
    UITapGestureRecognizer *singleTap1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(userInfoCenter)];
    [arrowImage addGestureRecognizer:singleTap1];
    
    [self.view addSubview:self.accountLabel];
    self.accountLabel.text = [NSString stringWithFormat:@"%@",emptyString([NIMUserDefaults standardUserDefaults].accountName)];
    self.accountLabel.frame = CGRectMake(30, self.titleLabel.bottom+10, 250, 25);
    
    
    _headerImage = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-110,SCREEN_TOP_HEIGHT, 80, 80)];
    [self.view  addSubview:_headerImage];
    _headerImage.layer.cornerRadius = 40;
    _headerImage.layer.shadowColor = RGB_COLOR_String(kCommonBGColor_All).CGColor;
    _headerImage.layer.shadowOffset = CGSizeMake(5, 5);
    _headerImage.layer.masksToBounds = YES;
    [_headerImage sd_setImageWithURL:[NSURL URLWithString:me.userInfo.avatarUrl] placeholderImage:info.avatarImage];
    
    
    UIView *box1 = [[UIView alloc]initWithFrame:CGRectMake(30, _headerImage.bottom+15, SCREEN_WIDTH-60, 54)];
    box1.backgroundColor = [UIColor clearColor];
    [self.view addSubview:box1];
    
    UIImageView *image11 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"user_ic_1"]];
    image11.frame = CGRectMake(0, 15, 24, 24);
    [box1 addSubview:image11];
    UILabel *label11 = [[UILabel alloc] initWithFrame:CGRectMake(image11.right+12, image11.top, SCREEN_WIDTH-90-60, 24)];
    label11.font = [UIFont systemFontOfSize:13.f];
    label11.textColor = [UIColor blackColor];
    label11.text = LangKey(@"receiver_model");
    [box1 addSubview:label11];
    UISwitch *switch11 = [[UISwitch alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-60-51, image11.top-3, 51, 31)];
    switch11.onTintColor = ThemeColor;
    [switch11 addTarget:self action:@selector(switchWith:) forControlEvents:UIControlEventValueChanged];
    [box1 addSubview:switch11];
    
    UIView *box2 = [[UIView alloc]initWithFrame:CGRectMake(30, box1.bottom, SCREEN_WIDTH-60, 54)];
    box2.backgroundColor = [UIColor clearColor];
    [self.view addSubview:box2];
    
    UIImageView *image12 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"user_ic_2"]];
    image12.frame = CGRectMake(0, 15, 24, 24);
    [box2 addSubview:image12];
    UILabel *label12 = [[UILabel alloc] initWithFrame:CGRectMake(image12.right+12, image12.top, SCREEN_WIDTH-60-60, 24)];
    label12.font = [UIFont systemFontOfSize:13.f];
    label12.textColor = [UIColor blackColor];
    label12.text = LangKey(@"system_change_language");//@"更改语言";
    [box2 addSubview:label12];
    UIImageView *arrowright1 = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-60-12, 21, 12, 12)];
    arrowright1.image = [UIImage imageNamed:@"btn_right"];
    [box2 addSubview:arrowright1];
    
    box2.userInteractionEnabled = YES;
    UITapGestureRecognizer *singleTap2 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(changeLang)];
    [box2 addGestureRecognizer:singleTap2];
    
    UIView *box3 = [[UIView alloc]initWithFrame:CGRectMake(30, box2.bottom, SCREEN_WIDTH-60, 54)];
    box3.backgroundColor = [UIColor clearColor];
    [self.view addSubview:box3];
    
    UIImageView *image14 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"user_ic_4"]];
    image14.frame = CGRectMake(0, 15, 24, 24);
    [box3 addSubview:image14];
    UILabel *label14 = [[UILabel alloc] initWithFrame:CGRectMake(image14.right+12, image14.top, SCREEN_WIDTH-60-60, 24)];
    label14.font = [UIFont systemFontOfSize:13.f];
    label14.textColor = [UIColor blackColor];
    label14.text = LangKey(@"activity_comment_setting_ys");//@"用户协议和隐私协议";
    [box3 addSubview:label14];
    UIImageView *arrowright2 = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-60-12, 21, 12, 12)];
    arrowright2.image = [UIImage imageNamed:@"btn_right"];
    [box3 addSubview:arrowright2];
    box3.userInteractionEnabled = YES;
    UITapGestureRecognizer *singleTap4 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(jumpAgreement)];
    [box3 addGestureRecognizer:singleTap4];
    
    UIView *box5 = [[UIView alloc]initWithFrame:CGRectMake(30, box3.bottom, SCREEN_WIDTH-60, 54)];
    box5.backgroundColor = [UIColor clearColor];
    [self.view addSubview:box5];
    box5.userInteractionEnabled = YES;
    UITapGestureRecognizer *singleTap6 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(opinionBack)];
    [box5 addGestureRecognizer:singleTap6];
    
    UIImageView *image22 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"user_ic_6"]];
    image22.frame = CGRectMake(0, 15, 24, 24);
    [box5 addSubview:image22];
    UILabel *label22 = [[UILabel alloc] initWithFrame:CGRectMake(image22.right+12, image22.top, SCREEN_WIDTH-60-60, 24)];
    label22.font = [UIFont systemFontOfSize:13.f];
    label22.textColor = [UIColor blackColor];
    label22.text = LangKey(@"feedback_activity_title");
    [box5 addSubview:label22];
    
    UIImageView *arrowright5 = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-60-12, 21, 12, 12)];
    arrowright5.image = [UIImage imageNamed:@"btn_right"];
    [box5 addSubview:arrowright5];
    
    
    
    UIView *box6 = [[UIView alloc]initWithFrame:CGRectMake(30, box5.bottom, SCREEN_WIDTH-60, 54)];
    box6.backgroundColor = [UIColor clearColor];
    [self.view addSubview:box6];
    box6.userInteractionEnabled = YES;
    UITapGestureRecognizer *singleTap7 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(safetySeting)];
    [box6 addGestureRecognizer:singleTap7];
    
    UIImageView *image23 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"user_ic_7"]];
    image23.frame = CGRectMake(0, 15, 24, 24);
    [box6 addSubview:image23];
    UILabel *label23 = [[UILabel alloc] initWithFrame:CGRectMake(image23.right+12, image23.top, SCREEN_WIDTH-60-60, 24)];
    label23.font = [UIFont systemFontOfSize:13.f];
    label23.textColor = [UIColor blackColor];
    label23.text = LangKey(@"safe_setting_activity_title");
    [box6 addSubview:label23];
    UIImageView *arrowright6 = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-60-12, 21, 12, 12)];
    arrowright6.image = [UIImage imageNamed:@"btn_right"];
    [box6 addSubview:arrowright6];
    
    
    UIView *box7 = [[UIView alloc]initWithFrame:CGRectMake(30, box6.bottom, SCREEN_WIDTH-60, 54)];
    box7.backgroundColor = [UIColor clearColor];
    [self.view addSubview:box7];
    
    UIImageView *image31 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"user_ic_8"]];
    image31.frame = CGRectMake(0, 15, 24, 24);
    [box7 addSubview:image31];
    UILabel *label31 = [[UILabel alloc] initWithFrame:CGRectMake(image31.right+12, image31.top, SCREEN_WIDTH-60-60, 24)];
    label31.font = [UIFont systemFontOfSize:13.f];
    label31.textColor = [UIColor blackColor];
    [box7 addSubview:label31];
    NSString *fragment_my_version = LangKey(@"fragment_my_version");
    NSDictionary *infoDic = [[NSBundle mainBundle] infoDictionary];
    NSString *appVersion = [infoDic objectForKey:@"CFBundleShortVersionString"];// 获取App的版本号
    label31.text = [NSString stringWithFormat: @"%@：%@",fragment_my_version,appVersion];
    
    UIButton *loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
    loginButton.frame = CGRectMake(30, box7.bottom+20, SCREEN_WIDTH-60, 44);
    loginButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [loginButton setTitleColor:RGB_COLOR_String(@"#FF483D") forState:UIControlStateNormal];
    [loginButton setTitle:LangKey(@"activity_comment_setting_exit") forState:UIControlStateNormal];
    [loginButton addTarget:self action:@selector(logoutCurrentAccount) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginButton];
    loginButton.layer.borderWidth = 0.5;
    loginButton.layer.borderColor = [UIColor colorWithRed:236/255.0 green:236/255.0 blue:236/255.0 alpha:1].CGColor;
    loginButton.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1];
    loginButton.layer.cornerRadius = 8;
    loginButton.layer.shadowColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.0800].CGColor;
    loginButton.layer.shadowOffset = CGSizeMake(0,3);
    loginButton.layer.shadowOpacity = 1;
    loginButton.layer.shadowRadius = 0;
    
    
}
#pragma mark - NTESMainCenterDelegate
-(void)userInfoCenter{
    CCCUserInfoViewController *vc = [[CCCUserInfoViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}
-(void)shareUserInfo{
    
    NTESUserQRCodeViewController *vc = [[NTESUserQRCodeViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
    
}
-(void)opinionBack{
    
    NTESFeedbackViewController *vc = [[NTESFeedbackViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
    
}
-(void)safetySeting{
    NTESSafetySetingController *vc = [[NTESSafetySetingController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}
-(void)switchWith:(UISwitch *)switchView{
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    if (switchView.on) {
        [dict setObject:kConstant_1 forKey:@"enable"];
        
        // 启用听筒模式
        [self setEarpieceMode:YES];
        
    }else{
        [dict setObject:kConstant_0 forKey:@"enable"];
        
        // 禁用听筒模式
        [self setEarpieceMode:NO];
    }
}

- (void)setEarpieceMode:(BOOL)enabled {
    NSError *error = nil;
    
    // 获取当前的音频会话
    AVAudioSession *audioSession = [AVAudioSession sharedInstance];
    
    // 配置音频会话为播放和录制
    [audioSession setCategory:AVAudioSessionCategoryPlayAndRecord error:&error];
    
    if (error) {
        NSLog(@"Error setting audio session category: %@", error);
        return;
    }
    
    // 激活音频会话
    [audioSession setActive:YES error:&error];
    
    if (error) {
        NSLog(@"Error activating audio session: %@", error);
        return;
    }
    
    // 根据开关设置听筒模式
    if (enabled) {
        // 切换到听筒
        [audioSession overrideOutputAudioPort:AVAudioSessionPortOverrideSpeaker error:&error];
    } else {
        // 使用默认音频输出设备（即听筒模式）
        [audioSession overrideOutputAudioPort:AVAudioSessionPortOverrideNone error:&error];
    }
    
    if (error) {
        NSLog(@"Error overriding audio port: %@", error);
    }
}


-(void)changeLang
{
    NTESLanguageViewController *vc = [[NTESLanguageViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
-(void)exitApp{
    NSString *alertStr = LangKey(@"system_change_language_title");
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:alertStr preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:LangKey(@"contact_tag_fragment_sure") style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        exit(0);
    }]];
    
    [alert addAction:[UIAlertAction actionWithTitle:LangKey(@"contact_tag_fragment_cancel") style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }]];
    
    UIViewController *rootVC = [UIApplication sharedApplication].windows.firstObject.rootViewController;
    [rootVC presentViewController:alert animated:YES completion:nil];
    
}

-(void)jumpAgreement{
    
    ZMONPolicyPrivacyViewController *vc = [[ZMONPolicyPrivacyViewController alloc] init];
    vc.webTitle = LangKey(@"activity_comment_setting_ys");//@"隐私协议";
    vc.urlString = [NIMUserDefaults standardUserDefaults].yshref;
    
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)logoutCurrentAccount
{
    
    [[[NIMSDK sharedSDK] loginManager] logout:^(NSError *error)
     {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"NTESNotificationLogout" object:nil];
    }];
    
}


#pragma mark -- Setter && Getter
- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:22.f];
        _titleLabel.textColor = [UIColor blackColor];
    }
    return _titleLabel;
}

- (UILabel *)accountLabel{
    if (!_accountLabel) {
        _accountLabel = [[UILabel alloc] init];
        _accountLabel.font = [UIFont systemFontOfSize:12.f];
        _accountLabel.textColor = TextColor_3;
    }
    return _accountLabel;
}

- (UIButton *)closeBtn {
    if (!_closeBtn) {
        _closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_closeBtn addTarget:self action:@selector(animationClose) forControlEvents:UIControlEventTouchUpInside];
        [_closeBtn setImage:[UIImage imageNamed:@"icon_close"] forState:UIControlStateNormal];
    }
    return _closeBtn;
}

- (UIButton *)sureBtn {
    if (!_sureBtn) {
        _sureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_sureBtn setImage:[UIImage imageNamed:@"icon_select_confirm"] forState:UIControlStateNormal];
        //        [_sureBtn addTarget:self action:@selector(updateTheNickname) forControlEvents:UIControlEventTouchUpInside];
    }
    return _sureBtn;
}



@end
