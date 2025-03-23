
#import <Foundation/Foundation.h>

NSString *StringFromThrowData(Byte *data);


//: qrcode_activity_title
Byte str_thousandText[] = {35, 21, 4, 21, 101, 108, 116, 105, 116, 95, 121, 116, 105, 118, 105, 116, 99, 97, 95, 101, 100, 111, 99, 114, 113, 217};


//: common_bg
Byte str_commissionTitle[] = {70, 9, 8, 149, 12, 6, 96, 66, 103, 98, 95, 110, 111, 109, 109, 111, 99, 47};


//: #009ADC
Byte str_imposeTableData[] = {50, 7, 9, 95, 24, 28, 138, 162, 12, 67, 68, 65, 57, 48, 48, 35, 61};


//: group_info_activity_update_failed
Byte str_imageListenData[] = {85, 33, 5, 121, 99, 100, 101, 108, 105, 97, 102, 95, 101, 116, 97, 100, 112, 117, 95, 121, 116, 105, 118, 105, 116, 99, 97, 95, 111, 102, 110, 105, 95, 112, 117, 111, 114, 103, 16};


//: ic_down
Byte str_limbText[] = {19, 7, 8, 25, 144, 9, 8, 190, 110, 119, 111, 100, 95, 99, 105, 194};


//: #999999
Byte str_orationValue[] = {87, 7, 12, 250, 237, 121, 15, 205, 109, 68, 172, 170, 57, 57, 57, 57, 57, 57, 35, 210};


//: back_arrow_bl
Byte str_pastaValue[] = {38, 13, 7, 77, 78, 104, 253, 108, 98, 95, 119, 111, 114, 114, 97, 95, 107, 99, 97, 98, 55};


//: activity_qrcode_scan_me
Byte str_townDisableText[] = {88, 23, 6, 25, 57, 245, 101, 109, 95, 110, 97, 99, 115, 95, 101, 100, 111, 99, 114, 113, 95, 121, 116, 105, 118, 105, 116, 99, 97, 114};


//: #2BBCFB
Byte str_imageFlavorValue[] = {38, 7, 5, 45, 232, 66, 70, 67, 66, 66, 50, 35, 239};


//: activity_qrcode_save_code
Byte str_oftFrameValue[] = {50, 25, 11, 5, 14, 98, 148, 18, 48, 80, 127, 101, 100, 111, 99, 95, 101, 118, 97, 115, 95, 101, 100, 111, 99, 114, 113, 95, 121, 116, 105, 118, 105, 116, 99, 97, 52};


//: group_info_activity_update_success
Byte str_interventionContent[] = {19, 34, 9, 148, 70, 176, 41, 65, 36, 115, 115, 101, 99, 99, 117, 115, 95, 101, 116, 97, 100, 112, 117, 95, 121, 116, 105, 118, 105, 116, 99, 97, 95, 111, 102, 110, 105, 95, 112, 117, 111, 114, 103, 62};

// __DEBUG__
// __CLOSE_PRINT__
//
//  ImageViewController.m
//  NIM
//
//  Created by 彭爽 on 2021/9/15.
//  Copyright © 2021 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import "NTESUserQRCodeViewController.h"
#import "ImageViewController.h"
//: #import "LCQRCodeUtil.h"
#import "ColorShould.h"
//: #import <Photos/Photos.h>
#import <Photos/Photos.h>

//: @interface NTESUserQRCodeViewController ()
@interface ImageViewController ()

//: @property (nonatomic ,strong) UILabel *accountLabel;
@property (nonatomic ,strong) UILabel *accountLabel;

//: @property (nonatomic,strong) UIImageView *iconImageView;
@property (nonatomic,strong) UIImageView *iconImageView;
//: @property (nonatomic,strong) UIButton *sureBtn;
@property (nonatomic,strong) UIButton *sureBtn;
//: @property (nonatomic,strong) UIButton *closeBtn;
@property (nonatomic,strong) UIButton *closeBtn;
//: @property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UILabel *titleLabel;

//: @end
@end

//: @implementation NTESUserQRCodeViewController
@implementation ImageViewController

//: - (void)viewWillAppear:(BOOL)animated{
- (void)viewWillAppear:(BOOL)animated{
    //: [super viewWillAppear:animated];
    [super viewWillAppear:animated];
    //: self.navigationController.navigationBarHidden = YES;
    self.navigationController.navigationBarHidden = YES;
}

//: - (void)viewWillDisappear:(BOOL)animated{
- (void)viewWillDisappear:(BOOL)animated{
    //: [super viewWillDisappear:animated];
    [super viewWillDisappear:animated];
    //: self.navigationController.navigationBarHidden = NO;
    self.navigationController.navigationBarHidden = NO;
}

//: - (void)gotoBack:(id)sender {
- (void)mentalPictureBack:(id)sender {
    //: [self.navigationController popViewControllerAnimated:NO];
    [self.navigationController popViewControllerAnimated:NO];
}

//: - (void)viewDidLoad {
- (void)viewDidLoad {
    //: [super viewDidLoad];
    [super viewDidLoad];
//    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"common_bg"]];
    //: UIImageView *bg = [[UIImageView alloc]initWithFrame:self.view.bounds];
    UIImageView *bg = [[UIImageView alloc]initWithFrame:self.view.bounds];
    //: bg.image = [UIImage imageNamed:@"common_bg"];
    bg.image = [UIImage imageNamed:StringFromThrowData(str_commissionTitle)];
    //: [self.view addSubview:bg];
    [self.view addSubview:bg];

    //: UIView *navview = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, (44.0f + [UIDevice vg_statusBarHeight]))];
    UIView *navview = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, (44.0f + [UIDevice task]))];
    //: [self.view addSubview:navview];
    [self.view addSubview:navview];

    //: UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    //: backBtn.frame = CGRectMake(15, [UIDevice vg_statusBarHeight], 40, 40);
    backBtn.frame = CGRectMake(15, [UIDevice task], 40, 40);
    //: [backBtn addTarget:self action:@selector(gotoBack:) forControlEvents:UIControlEventTouchUpInside];
    [backBtn addTarget:self action:@selector(mentalPictureBack:) forControlEvents:UIControlEventTouchUpInside];
    //: [backBtn setImage:[UIImage imageNamed:@"back_arrow_bl"] forState:UIControlStateNormal];
    [backBtn setImage:[UIImage imageNamed:StringFromThrowData(str_pastaValue)] forState:UIControlStateNormal];
    //: [navview addSubview:backBtn];
    [navview addSubview:backBtn];

    //: UILabel *labNavtitle = [[UILabel alloc]initWithFrame:CGRectMake(0, [UIDevice vg_statusBarHeight], [[UIScreen mainScreen] bounds].size.width, 44)];
    UILabel *labNavtitle = [[UILabel alloc]initWithFrame:CGRectMake(0, [UIDevice task], [[UIScreen mainScreen] bounds].size.width, 44)];
    //: labNavtitle.textColor = [UIColor blackColor];
    labNavtitle.textColor = [UIColor blackColor];
    //: labNavtitle.font = [UIFont boldSystemFontOfSize:16];
    labNavtitle.font = [UIFont boldSystemFontOfSize:16];
    //: labNavtitle.text = [NTESLanguageManager getTextWithKey:@"qrcode_activity_title"];
    labNavtitle.text = [MaxInformation off:StringFromThrowData(str_thousandText)];
    //: labNavtitle.textAlignment = NSTextAlignmentCenter;
    labNavtitle.textAlignment = NSTextAlignmentCenter;
    //: [navview addSubview:labNavtitle];
    [navview addSubview:labNavtitle];

    //: [self initUI];
    [self initCell];
}

//: -(void)initUI{
-(void)initCell{


    //: NSString *userID = [[NIMSDK sharedSDK].loginManager currentAccount];
    NSString *userID = [[NIMSDK sharedSDK].loginManager currentAccount];
    //: NIMUser *me = [[NIMSDK sharedSDK].userManager userInfo:userID];
    NIMUser *me = [[NIMSDK sharedSDK].userManager userInfo:userID];
    //: CCCKitInfo *info = [[AppleProjectKit sharedKit] infoByUser:userID option:nil];
    TitleInfo *info = [[Indicator reach] indoors:userID harvest:nil];

    //: [self.view addSubview:self.iconImageView];
    [self.view addSubview:self.iconImageView];
    //: [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:me.userInfo.avatarUrl] placeholderImage:info.avatarImage];
    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:me.userInfo.avatarUrl] placeholderImage:info.avatarImage];
    //: self.iconImageView.frame = CGRectMake(([[UIScreen mainScreen] bounds].size.width-60)/2, (44.0f + [UIDevice vg_statusBarHeight])+40, 60, 60);
    self.iconImageView.frame = CGRectMake(([[UIScreen mainScreen] bounds].size.width-60)/2, (44.0f + [UIDevice task])+40, 60, 60);

    //: [self.view addSubview:self.titleLabel];
    [self.view addSubview:self.titleLabel];
    //: self.titleLabel.text = me.userInfo.nickName;
    self.titleLabel.text = me.userInfo.nickName;
    //: self.titleLabel.frame = CGRectMake(0, self.iconImageView.bottom+12, [[UIScreen mainScreen] bounds].size.width, 20);
    self.titleLabel.frame = CGRectMake(0, self.iconImageView.bottom+12, [[UIScreen mainScreen] bounds].size.width, 20);

    //: UIView *qrView = [[UIView alloc]initWithFrame:CGRectMake(([[UIScreen mainScreen] bounds].size.width-244)/2, self.titleLabel.bottom+20, 244, 244)];
    UIView *qrView = [[UIView alloc]initWithFrame:CGRectMake(([[UIScreen mainScreen] bounds].size.width-244)/2, self.titleLabel.bottom+20, 244, 244)];
    //: [self.view addSubview:qrView];
    [self.view addSubview:qrView];
    //: qrView.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1];
    qrView.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1];
    //: qrView.layer.borderWidth = 1;
    qrView.layer.borderWidth = 1;
    //: qrView.layer.borderColor = [UIColor colorWithRed:236/255.0 green:236/255.0 blue:236/255.0 alpha:1].CGColor;
    qrView.layer.borderColor = [UIColor colorWithRed:236/255.0 green:236/255.0 blue:236/255.0 alpha:1].CGColor;
    //: qrView.layer.cornerRadius = 8;
    qrView.layer.cornerRadius = 8;
    //: qrView.layer.shadowColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.0800].CGColor;
    qrView.layer.shadowColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.0800].CGColor;
    //: qrView.layer.shadowOffset = CGSizeMake(0,3);
    qrView.layer.shadowOffset = CGSizeMake(0,3);
    //: qrView.layer.shadowOpacity = 1;
    qrView.layer.shadowOpacity = 1;
    //: qrView.layer.shadowRadius = 0;
    qrView.layer.shadowRadius = 0;

    //: UIImage *qrImage = [LCQRCodeUtil createQRimageString:[[NIMSDK sharedSDK].loginManager currentAccount] sizeWidth:220 fillColor:[UIColor blackColor]];
    UIImage *qrImage = [ColorShould light:[[NIMSDK sharedSDK].loginManager currentAccount] user:220 highName:[UIColor blackColor]];
    //: UIImageView *qrImageView = [[UIImageView alloc] initWithFrame:CGRectMake(12, 12, 220, 220)];
    UIImageView *qrImageView = [[UIImageView alloc] initWithFrame:CGRectMake(12, 12, 220, 220)];
    //: qrImageView.image = qrImage;
    qrImageView.image = qrImage;
    //: [qrView addSubview:qrImageView];
    [qrView addSubview:qrImageView];

    //: UILabel *contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, qrView.bottom+10, [[UIScreen mainScreen] bounds].size.width, 20)];
    UILabel *contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, qrView.bottom+10, [[UIScreen mainScreen] bounds].size.width, 20)];
    //: contentLabel.font = [UIFont systemFontOfSize:12];
    contentLabel.font = [UIFont systemFontOfSize:12];
    //: contentLabel.textColor = [UIColor colorWithHexString:@"#999999"];
    contentLabel.textColor = [UIColor direction:StringFromThrowData(str_orationValue)];
    //: contentLabel.textAlignment = NSTextAlignmentCenter;
    contentLabel.textAlignment = NSTextAlignmentCenter;
    //: contentLabel.text = [NTESLanguageManager getTextWithKey:@"activity_qrcode_scan_me"];
    contentLabel.text = [MaxInformation off:StringFromThrowData(str_townDisableText)];//@"扫描二维码，加我为好友";
    //: [self.view addSubview:contentLabel];
    [self.view addSubview:contentLabel];

    //: [self.view addSubview:self.sureBtn];
    [self.view addSubview:self.sureBtn];
    //: self.sureBtn.frame = CGRectMake(([[UIScreen mainScreen] bounds].size.width-265)/2, contentLabel.bottom+20, 265, 40);
    self.sureBtn.frame = CGRectMake(([[UIScreen mainScreen] bounds].size.width-265)/2, contentLabel.bottom+20, 265, 40);



//    UIImageView *image = [[UIImageView alloc] init];
//    image.contentMode = UIViewContentModeScaleToFill;
//    image.image = [LandHelper getLinearGradientImage:RGB_COLOR_String(kCommonBGColor_begin) and:RGB_COLOR_String(kCommonBGColor_end) directionType:SNLinearGradientDirectionLevel];
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
//    _accountLabel.text = emptyString([WastepaperBasketDefaults standardUserDefaults].accountName);
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
//    UIImage *qrImage = [ColorShould createQRimageString:[[NIMSDK sharedSDK].loginManager currentAccount] sizeWidth:200 fillColor:[UIColor blackColor]];
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
//    bottom.backgroundColor = [UIColor colorWithPatternImage:[LandHelper getLinearGradientImage:RGB_COLOR_String(kCommonBGColor_begin) and:RGB_COLOR_String(kCommonBGColor_end) directionType:SNLinearGradientDirectionLevel]];;
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

//: #pragma mark -- Setter && Getter
#pragma mark -- Setter && Getter
//: - (UILabel *)titleLabel {
- (UILabel *)titleLabel {
    //: if (!_titleLabel) {
    if (!_titleLabel) {
        //: _titleLabel = [[UILabel alloc] init];
        _titleLabel = [[UILabel alloc] init];
        //: _titleLabel.font = [UIFont systemFontOfSize:16.f];
        _titleLabel.font = [UIFont systemFontOfSize:16.f];
        //: _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.textColor = [UIColor blackColor];
        //: _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        //: _titleLabel.numberOfLines = 1;
        _titleLabel.numberOfLines = 1;
        //: _titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        _titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    }
    //: return _titleLabel;
    return _titleLabel;
}

//: - (UIImageView *)iconImageView {
- (UIImageView *)iconImageView {
    //: if (!_iconImageView) {
    if (!_iconImageView) {
        //: _iconImageView = [[UIImageView alloc] init];
        _iconImageView = [[UIImageView alloc] init];
        //: _iconImageView.layer.masksToBounds = YES;
        _iconImageView.layer.masksToBounds = YES;
        //: _iconImageView.layer.cornerRadius = 30;
        _iconImageView.layer.cornerRadius = 30;
        //: _iconImageView.contentMode = UIViewContentModeScaleToFill;
        _iconImageView.contentMode = UIViewContentModeScaleToFill;
    }
    //: return _iconImageView;
    return _iconImageView;
}



//: - (UIButton *)sureBtn {
- (UIButton *)sureBtn {
    //: if (!_sureBtn) {
    if (!_sureBtn) {
        //: _sureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _sureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        //: [_sureBtn addTarget:self action:@selector(saveQcImage) forControlEvents:UIControlEventTouchUpInside];
        [_sureBtn addTarget:self action:@selector(valueAt) forControlEvents:UIControlEventTouchUpInside];
        //: _sureBtn.titleLabel.font = [UIFont systemFontOfSize:16];
        _sureBtn.titleLabel.font = [UIFont systemFontOfSize:16];
        //: [_sureBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_sureBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        //: [_sureBtn setTitle:[NTESLanguageManager getTextWithKey:@"activity_qrcode_save_code"] forState:UIControlStateNormal];
        [_sureBtn setTitle:[MaxInformation off:StringFromThrowData(str_oftFrameValue)] forState:UIControlStateNormal];
        //: [_sureBtn setImage:[UIImage imageNamed:@"ic_down"] forState:UIControlStateNormal];
        [_sureBtn setImage:[UIImage imageNamed:StringFromThrowData(str_limbText)] forState:UIControlStateNormal];
        //: [_sureBtn layoutButtonWithEdgeInsetsStyle:(MKButtonEdgeInsetsStyleLeft) imageTitleSpace:10];
        [_sureBtn image:(MKButtonEdgeInsetsStyleLeft) keep:10];
        //: _sureBtn.backgroundColor = [UIColor colorWithHexString:@"#2BBCFB"];
        _sureBtn.backgroundColor = [UIColor direction:StringFromThrowData(str_imageFlavorValue)];
        //: _sureBtn.layer.cornerRadius = 10;
        _sureBtn.layer.cornerRadius = 10;
        //: _sureBtn.layer.shadowColor = [UIColor colorWithHexString:@"#009ADC"].CGColor;
        _sureBtn.layer.shadowColor = [UIColor direction:StringFromThrowData(str_imposeTableData)].CGColor;
        //: _sureBtn.layer.shadowOffset = CGSizeMake(0,3);
        _sureBtn.layer.shadowOffset = CGSizeMake(0,3);
        //: _sureBtn.layer.shadowOpacity = 1;
        _sureBtn.layer.shadowOpacity = 1;
        //: _sureBtn.layer.shadowRadius = 0;
        _sureBtn.layer.shadowRadius = 0;

    }
    //: return _sureBtn;
    return _sureBtn;
}

//: -(void)saveQcImage{
-(void)valueAt{

    //: CGFloat f = [UIScreen mainScreen].scale;
    CGFloat f = [UIScreen mainScreen].scale;
    //: CGRect rect = CGRectMake(0, [[UIScreen mainScreen] bounds].size.height*0.1*f, [[UIScreen mainScreen] bounds].size.width*f, [[UIScreen mainScreen] bounds].size.height*0.7*f);
    CGRect rect = CGRectMake(0, [[UIScreen mainScreen] bounds].size.height*0.1*f, [[UIScreen mainScreen] bounds].size.width*f, [[UIScreen mainScreen] bounds].size.height*0.7*f);
    //: UIImage *image = [self takeScreenshot:rect];
    UIImage *image = [self barAct:rect];

    //: [[PHPhotoLibrary sharedPhotoLibrary]performChanges:^{
    [[PHPhotoLibrary sharedPhotoLibrary]performChanges:^{
          //: [PHAssetChangeRequest creationRequestForAssetFromImage:image];
          [PHAssetChangeRequest creationRequestForAssetFromImage:image];
      //: } completionHandler:^(BOOL success, NSError * _Nullable error) {
      } completionHandler:^(BOOL success, NSError * _Nullable error) {
          //: if (error) {
          if (error) {
              //: dispatch_async(dispatch_get_main_queue(), ^{
              dispatch_async(dispatch_get_main_queue(), ^{
                  //: NSString *failed = [NTESLanguageManager getTextWithKey:@"group_info_activity_update_failed"];
                  NSString *failed = [MaxInformation off:StringFromThrowData(str_imageListenData)];//@"保存失败"
                  //: [SVProgressHUD showMessage:failed];
                  [SVProgressHUD aboveBroadcast:failed];
              //: });
              });
          //: } else {
          } else {
              //: NSString *success = [NTESLanguageManager getTextWithKey:@"group_info_activity_update_success"];
              NSString *success = [MaxInformation off:StringFromThrowData(str_interventionContent)];//保存成功
              //: dispatch_async(dispatch_get_main_queue(), ^{
              dispatch_async(dispatch_get_main_queue(), ^{
                  //: [SVProgressHUD showMessage:success];
                  [SVProgressHUD aboveBroadcast:success];
              //: });
              });
          }
      //: }];
      }];
}

//: -(UIImage *)takeScreenshot:(CGRect)rect{
-(UIImage *)barAct:(CGRect)rect{

    //: UIGraphicsBeginImageContextWithOptions(CGSizeMake(self.view.frame.size.width, self.view.frame.size.height), YES, 0);
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(self.view.frame.size.width, self.view.frame.size.height), YES, 0);
    //设置截屏大小
    //: [[self.view layer] renderInContext:UIGraphicsGetCurrentContext()];
    [[self.view layer] renderInContext:UIGraphicsGetCurrentContext()];
    //: UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
    UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
    //: UIGraphicsEndImageContext();
    UIGraphicsEndImageContext();
    //: CGImageRef imageRef = viewImage.CGImage;
    CGImageRef imageRef = viewImage.CGImage;
    //CGRect rect = CGRectMake(0, 0, 300, 300);//这里可以设置想要截图的区域
    //: CGImageRef imageRefRect =CGImageCreateWithImageInRect(imageRef, rect);
    CGImageRef imageRefRect =CGImageCreateWithImageInRect(imageRef, rect);
    //: UIImage *sendImage = [[UIImage alloc] initWithCGImage:imageRefRect];
    UIImage *sendImage = [[UIImage alloc] initWithCGImage:imageRefRect];
    //: CGImageRelease(imageRefRect);
    CGImageRelease(imageRefRect);
    //: return sendImage;
    return sendImage;


}

//: @end
@end

Byte * ThrowDataToCache(Byte *data) {
    int curious = data[0];
    int mediaAccording = data[1];
    int seventhBy = data[2];
    if (!curious) return data + seventhBy;
    for (int i = 0; i < mediaAccording / 2; i++) {
        int begin = seventhBy + i;
        int end = seventhBy + mediaAccording - i - 1;
        Byte temp = data[begin];
        data[begin] = data[end];
        data[end] = temp;
    }
    data[0] = 0;
    data[seventhBy + mediaAccording] = 0;
    return data + seventhBy;
}

NSString *StringFromThrowData(Byte *data) {
    return [NSString stringWithUTF8String:(char *)ThrowDataToCache(data)];
}  
