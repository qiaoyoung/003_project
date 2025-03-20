//
//  NTESUserQRCodeViewController.m
//  NIM
//
//  Created by 彭爽 on 2021/9/15.
//  Copyright © 2021 Netease. All rights reserved.
//

#import "NTESUserQRCodeViewController.h"
#import "LCQRCodeUtil.h"
#import <Photos/Photos.h>

@interface NTESUserQRCodeViewController ()

@property (nonatomic ,strong) UILabel *accountLabel;

@property (nonatomic,strong) UIImageView *iconImageView;
@property (nonatomic,strong) UIButton *sureBtn;
@property (nonatomic,strong) UIButton *closeBtn;
@property (nonatomic,strong) UILabel *titleLabel;

@end

@implementation NTESUserQRCodeViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden = NO;
}

- (void)gotoBack:(id)sender {
    [self.navigationController popViewControllerAnimated:NO];
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"common_bg"]];
    UIImageView *bg = [[UIImageView alloc]initWithFrame:self.view.bounds];
    bg.image = [UIImage imageNamed:@"common_bg"];
    [self.view addSubview:bg];
    
    UIView *navview = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_TOP_HEIGHT)];
    [self.view addSubview:navview];
    
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(15, SCREEN_STATUS_HEIGHT, 40, 40);
    [backBtn addTarget:self action:@selector(gotoBack:) forControlEvents:UIControlEventTouchUpInside];
    [backBtn setImage:[UIImage imageNamed:@"back_arrow_bl"] forState:UIControlStateNormal];
    [navview addSubview:backBtn];
    
    UILabel *labNavtitle = [[UILabel alloc]initWithFrame:CGRectMake(0, SCREEN_STATUS_HEIGHT, SCREEN_WIDTH, 44)];
    labNavtitle.textColor = [UIColor blackColor];
    labNavtitle.font = [UIFont boldSystemFontOfSize:16];
    labNavtitle.text = LangKey(@"qrcode_activity_title");
    labNavtitle.textAlignment = NSTextAlignmentCenter;
    [navview addSubview:labNavtitle];
    
    [self initUI];
}

-(void)initUI{
    
    
    NSString *userID = [[NIMSDK sharedSDK].loginManager currentAccount];
    NIMUser *me = [[NIMSDK sharedSDK].userManager userInfo:userID];
    CCCKitInfo *info = [[AppleProjectKit sharedKit] infoByUser:userID option:nil];
    
    [self.view addSubview:self.iconImageView];
    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:me.userInfo.avatarUrl] placeholderImage:info.avatarImage];
    self.iconImageView.frame = CGRectMake((SCREEN_WIDTH-60)/2, SCREEN_TOP_HEIGHT+40, 60, 60);
    
    [self.view addSubview:self.titleLabel];
    self.titleLabel.text = me.userInfo.nickName;
    self.titleLabel.frame = CGRectMake(0, self.iconImageView.bottom+12, SCREEN_WIDTH, 20);

    UIView *qrView = [[UIView alloc]initWithFrame:CGRectMake((SCREEN_WIDTH-244)/2, self.titleLabel.bottom+20, 244, 244)];
    [self.view addSubview:qrView];
    qrView.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1];
    qrView.layer.borderWidth = 1;
    qrView.layer.borderColor = [UIColor colorWithRed:236/255.0 green:236/255.0 blue:236/255.0 alpha:1].CGColor;
    qrView.layer.cornerRadius = 8;
    qrView.layer.shadowColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.0800].CGColor;
    qrView.layer.shadowOffset = CGSizeMake(0,3);
    qrView.layer.shadowOpacity = 1;
    qrView.layer.shadowRadius = 0;
    
    UIImage *qrImage = [LCQRCodeUtil createQRimageString:[[NIMSDK sharedSDK].loginManager currentAccount] sizeWidth:220 fillColor:[UIColor blackColor]];
    UIImageView *qrImageView = [[UIImageView alloc] initWithFrame:CGRectMake(12, 12, 220, 220)];
    qrImageView.image = qrImage;
    [qrView addSubview:qrImageView];
    
    UILabel *contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, qrView.bottom+10, SCREEN_WIDTH, 20)];
    contentLabel.font = [UIFont systemFontOfSize:12];
    contentLabel.textColor = TextColor_3;
    contentLabel.textAlignment = NSTextAlignmentCenter;
    contentLabel.text = LangKey(@"activity_qrcode_scan_me");//@"扫描二维码，加我为好友";
    [self.view addSubview:contentLabel];
    
    [self.view addSubview:self.sureBtn];
    self.sureBtn.frame = CGRectMake((SCREEN_WIDTH-265)/2, contentLabel.bottom+20, 265, 40);
    
    
    
//    UIImageView *image = [[UIImageView alloc] init];
//    image.contentMode = UIViewContentModeScaleToFill;
//    image.image = [SNGradientHelper getLinearGradientImage:RGB_COLOR_String(kCommonBGColor_begin) and:RGB_COLOR_String(kCommonBGColor_end) directionType:SNLinearGradientDirectionLevel];
//    image.userInteractionEnabled = YES;
//    [self.view addSubview:image];
//    [image mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_offset(0);
//        make.right.mas_offset(0);
//        make.top.mas_offset(0);
//        make.height.mas_equalTo(200);
//    }];
//
//    UIView *navView = [[UIView alloc] init];
//    [image addSubview:navView];
//    [navView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_offset(0);
//        make.right.mas_offset(0);
//        make.top.mas_offset(SCREEN_STATUS_HEIGHT);
//        make.height.mas_equalTo(44);
//    }];
//
//    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    [backButton setImage:[UIImage imageNamed:@"back_white"] forState:UIControlStateNormal];
//    [backButton addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
//    [navView addSubview:backButton];
//    [backButton mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.mas_equalTo(navView);
//        make.left.mas_offset(15);
//        make.width.mas_equalTo(44);
//        make.height.mas_equalTo(44);
//    }];
//
//    UILabel *titleLabel = [[UILabel alloc] init];
//    titleLabel.font = [UIFont boldSystemFontOfSize:19];
//    titleLabel.textColor = [UIColor whiteColor];
//    titleLabel.textAlignment = NSTextAlignmentCenter;
//    titleLabel.text = LangKey(@"share_title");//@"分享";
//    [navView addSubview:titleLabel];
//    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerX.mas_equalTo(navView);
//        make.centerY.mas_equalTo(navView);
//        make.width.mas_equalTo(180);
//        make.height.mas_equalTo(30);
//    }];
//
//    UIView *whiteView = [[UIView alloc] init];
//    whiteView.clipsToBounds = YES;
//    whiteView.backgroundColor = [UIColor whiteColor];
//    [self.view addSubview:whiteView];
//    whiteView.layer.masksToBounds = YES;
//    whiteView.layer.cornerRadius = 5.;
//    [whiteView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_offset(90);
//        make.left.mas_offset(15);
//        make.right.mas_offset(-15);
//        make.height.mas_equalTo(500);
//    }];
//
//    UIImageView *topImage = [[UIImageView alloc] init];
//    topImage.image = [UIImage imageNamed:@"user_qr_bg_icon"];
//    [whiteView addSubview:topImage];
//    [topImage mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_offset(20);
//        make.width.mas_equalTo(300);
//        make.height.mas_equalTo(37.5);
//        make.centerX.mas_offset(0);
//    }];
//
//    UILabel *t = [[UILabel alloc] init];
//    t.textColor = [UIColor blackColor];
//    t.font = [UIFont systemFontOfSize:14];
//    t.textAlignment = NSTextAlignmentCenter;
//    t.text = LangKey(@"activity_add_friend_my_account_share");
//    [topImage addSubview:t];
//    [t mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.center.mas_equalTo(topImage);
//        make.width.mas_equalTo(100);
//        make.height.mas_equalTo(20);
//    }];
//
//
//
//
//    _accountLabel = [[UILabel alloc] init];
//    _accountLabel.font = [UIFont boldSystemFontOfSize:28];
//    _accountLabel.textColor = RGB_COLOR_String(kCommonBGColor_All);
//    _accountLabel.textAlignment = NSTextAlignmentCenter;
//    _accountLabel.text = emptyString([NIMUserDefaults standardUserDefaults].accountName);
//    [whiteView addSubview:_accountLabel];
//    [_accountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerX.mas_equalTo(whiteView);
//        make.top.mas_offset(70);
//        make.width.mas_equalTo(340);
//        make.height.mas_equalTo(50);
//    }];
//
//    UILabel *textLabel = [[UILabel alloc] init];
//    textLabel.font = [UIFont boldSystemFontOfSize:14];
//    textLabel.textColor = RGB_COLOR_String(@"#A9A9A9");
//    textLabel.textAlignment = NSTextAlignmentCenter;
//    textLabel.text = LangKey(@"activity_qrcode_tip");//@"安全聊天，文明交友";
//    [whiteView addSubview:textLabel];
//    [textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerX.mas_equalTo(whiteView);
//        make.top.mas_offset(120);
//        make.width.mas_equalTo(200);
//        make.height.mas_equalTo(30);
//    }];
//
//    UIImageView *lineImage = [[UIImageView alloc] init];
//    lineImage.image = [UIImage imageNamed:@"user_qr_line"];
//    [whiteView addSubview:lineImage];
//    [lineImage mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_offset(150);
//        make.left.mas_offset(25);
//        make.right.mas_offset(-25);
//        make.height.mas_equalTo(30);
//        make.centerX.mas_offset(0);
//    }];
//
//
//    UIImage *qrImage = [LCQRCodeUtil createQRimageString:[[NIMSDK sharedSDK].loginManager currentAccount] sizeWidth:200 fillColor:[UIColor blackColor]];
//    UIImageView *qrImageView = [[UIImageView alloc] init];
//    qrImageView.image = qrImage;
//    [whiteView addSubview:qrImageView];
//    [qrImageView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_offset(200);
//        make.centerX.mas_equalTo(whiteView);
//        make.width.mas_equalTo(200);
//        make.height.mas_equalTo(200);
//    }];
//
//
//    UILabel *contentLabel = [[UILabel alloc] init];
//    contentLabel.font = [UIFont boldSystemFontOfSize:15];
//    contentLabel.textColor = [UIColor blackColor];
//    contentLabel.textAlignment = NSTextAlignmentCenter;
//    contentLabel.text = LangKey(@"activity_qrcode_scan_me");//@"扫描二维码，加我为好友";
//    [whiteView addSubview:contentLabel];
//    [contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerX.mas_equalTo(navView);
//        make.top.mas_equalTo(qrImageView.mas_bottom).mas_offset(20);
//        make.width.mas_equalTo(whiteView.mas_width);
//        make.height.mas_equalTo(30);
//    }];
//
//    NSString *activity_qrcode_save_code = LangKey(@"activity_qrcode_save_code");//@"保存二维码"
//    UIButton *bottom =[UIButton buttonWithType:UIButtonTypeCustom];
//    bottom.backgroundColor = [UIColor colorWithPatternImage:[SNGradientHelper getLinearGradientImage:RGB_COLOR_String(kCommonBGColor_begin) and:RGB_COLOR_String(kCommonBGColor_end) directionType:SNLinearGradientDirectionLevel]];;
//    [bottom setTitle:activity_qrcode_save_code forState:UIControlStateNormal];
//    [bottom setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    [bottom addTarget:self action:@selector(saveQcImage) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:bottom];
//    bottom.layer.masksToBounds = YES;
//    bottom.layer.cornerRadius = 20.f;
//    [bottom mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_offset(50);
//        make.right.mas_offset(-50);
//        make.height.mas_equalTo(40);
//        make.bottom.mas_offset(-SCREEN_BOTTOM_HEIGHT -15);
//    }];
    
    
}

#pragma mark -- Setter && Getter
- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:16.f];
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.numberOfLines = 1;
        _titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    }
    return _titleLabel;
}

- (UIImageView *)iconImageView {
    if (!_iconImageView) {
        _iconImageView = [[UIImageView alloc] init];
        _iconImageView.layer.masksToBounds = YES;
        _iconImageView.layer.cornerRadius = 30;
        _iconImageView.contentMode = UIViewContentModeScaleToFill;
    }
    return _iconImageView;
}



- (UIButton *)sureBtn {
    if (!_sureBtn) {
        _sureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_sureBtn addTarget:self action:@selector(saveQcImage) forControlEvents:UIControlEventTouchUpInside];
        _sureBtn.titleLabel.font = [UIFont systemFontOfSize:16];
        [_sureBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_sureBtn setTitle:LangKey(@"activity_qrcode_save_code") forState:UIControlStateNormal];
        [_sureBtn setImage:[UIImage imageNamed:@"ic_down"] forState:UIControlStateNormal];
        [_sureBtn layoutButtonWithEdgeInsetsStyle:(MKButtonEdgeInsetsStyleLeft) imageTitleSpace:10];
        _sureBtn.backgroundColor = ThemeColor;
        _sureBtn.layer.cornerRadius = 10;
        _sureBtn.layer.shadowColor = DeepBtnColor.CGColor;
        _sureBtn.layer.shadowOffset = CGSizeMake(0,3);
        _sureBtn.layer.shadowOpacity = 1;
        _sureBtn.layer.shadowRadius = 0;
        
    }
    return _sureBtn;
}

-(void)saveQcImage{
    
    CGFloat f = [UIScreen mainScreen].scale;
    CGRect rect = CGRectMake(0, SCREEN_HEIGHT*0.1*f, SCREEN_WIDTH*f, SCREEN_HEIGHT*0.7*f);
    UIImage *image = [self takeScreenshot:rect];
    
    [[PHPhotoLibrary sharedPhotoLibrary]performChanges:^{
          [PHAssetChangeRequest creationRequestForAssetFromImage:image];
      } completionHandler:^(BOOL success, NSError * _Nullable error) {
          if (error) {
              dispatch_async(dispatch_get_main_queue(), ^{
                  NSString *failed = LangKey(@"group_info_activity_update_failed");//@"保存失败"
                  [SVProgressHUD showMessage:failed];
              });
          } else {
              NSString *success = LangKey(@"group_info_activity_update_success");//保存成功
              dispatch_async(dispatch_get_main_queue(), ^{
                  [SVProgressHUD showMessage:success];
              });
          }
      }];
}

-(UIImage *)takeScreenshot:(CGRect)rect{

    UIGraphicsBeginImageContextWithOptions(CGSizeMake(self.view.frame.size.width, self.view.frame.size.height), YES, 0);
    //设置截屏大小
    [[self.view layer] renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    CGImageRef imageRef = viewImage.CGImage;
    //CGRect rect = CGRectMake(0, 0, 300, 300);//这里可以设置想要截图的区域
    CGImageRef imageRefRect =CGImageCreateWithImageInRect(imageRef, rect);
    UIImage *sendImage = [[UIImage alloc] initWithCGImage:imageRefRect];
    CGImageRelease(imageRefRect);
    return sendImage;


}

@end
