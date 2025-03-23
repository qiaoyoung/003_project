
#import <Foundation/Foundation.h>

NSString *StringFromWorthData(Byte *data);        


//: group_head_def
Byte str_pastaBottomPersonalityValue[] = {46, 14, 23, 4, 80, 91, 88, 94, 89, 72, 81, 78, 74, 77, 72, 77, 78, 79, 148};


//: spa
Byte str_attendanceTitle[] = {12, 3, 94, 10, 151, 211, 222, 82, 255, 55, 21, 18, 3, 193};


//: hant
Byte str_sendVendData[] = {18, 4, 44, 14, 165, 110, 186, 52, 32, 11, 155, 250, 95, 53, 60, 53, 66, 72, 61};


//: contact_tag_fragment_cancel
Byte str_plainFromHeightName[] = {71, 27, 1, 5, 113, 98, 110, 109, 115, 96, 98, 115, 94, 115, 96, 102, 94, 101, 113, 96, 102, 108, 100, 109, 115, 94, 98, 96, 109, 98, 100, 107, 92};


//: #000000
Byte str_campValue[] = {61, 7, 94, 8, 104, 224, 23, 39, 197, 210, 210, 210, 210, 210, 210, 154};


//: message_send_album
Byte str_worthTitle[] = {30, 18, 19, 10, 157, 46, 103, 200, 38, 196, 90, 82, 96, 96, 78, 84, 82, 76, 96, 82, 91, 81, 76, 78, 89, 79, 98, 90, 132};


//: login_bg
Byte str_flavorTitle[] = {86, 8, 6, 12, 167, 110, 86, 178, 96, 55, 171, 4, 102, 105, 97, 99, 104, 89, 92, 97, 216};


//: zh-Hans
Byte str_attendanceBrotherTitle[] = {64, 7, 37, 13, 9, 136, 159, 162, 143, 128, 234, 115, 209, 85, 67, 8, 35, 60, 73, 78, 167};


//: back_arrow_bl
Byte str_wolfLinkValue[] = {36, 13, 6, 13, 111, 221, 13, 51, 159, 95, 99, 171, 98, 92, 91, 93, 101, 89, 91, 108, 108, 105, 113, 89, 92, 102, 117};


//: set_group_avater
Byte str_combineData[] = {19, 16, 46, 13, 252, 255, 148, 47, 169, 12, 18, 198, 247, 69, 55, 70, 49, 57, 68, 65, 71, 66, 49, 51, 72, 51, 70, 55, 68, 229};


//: register_good_avater
Byte str_gelPopularName[] = {89, 20, 93, 8, 245, 187, 108, 243, 21, 8, 10, 12, 22, 23, 8, 21, 2, 10, 18, 18, 7, 2, 4, 25, 4, 23, 8, 21, 185};


//: zh-Hant
Byte str_cellWasteName[] = {1, 7, 80, 4, 42, 24, 221, 248, 17, 30, 36, 208};


//: 666666
Byte str_iconFlavorData[] = {51, 6, 79, 12, 217, 172, 215, 80, 5, 88, 200, 216, 231, 231, 231, 231, 231, 231, 143};


//: icon_photo
Byte str_luckyValue[] = {33, 10, 36, 9, 138, 213, 253, 65, 100, 69, 63, 75, 74, 59, 76, 68, 75, 80, 75, 6};


//: #009ADC
Byte str_comingName[] = {32, 7, 63, 14, 216, 249, 49, 192, 49, 238, 228, 37, 29, 90, 228, 241, 241, 250, 2, 5, 4, 133};


//: contact_list_activity_complete
Byte str_threadAttractPublicTitle[] = {19, 30, 90, 13, 249, 229, 249, 180, 213, 255, 227, 65, 10, 9, 21, 20, 26, 7, 9, 26, 5, 18, 15, 25, 26, 5, 7, 9, 26, 15, 28, 15, 26, 31, 5, 9, 21, 19, 22, 18, 11, 26, 11, 111};


//: ko-KP
Byte str_attractiveName[] = {22, 5, 73, 13, 160, 9, 207, 207, 222, 68, 9, 150, 71, 34, 38, 228, 2, 7, 75};


//: message_send_camera
Byte str_cornerLabName[] = {99, 19, 44, 5, 43, 65, 57, 71, 71, 53, 59, 57, 51, 71, 57, 66, 56, 51, 55, 53, 65, 57, 70, 53, 67};

// __DEBUG__
// __CLOSE_PRINT__
//
//  ModeViewController.m
//  NIM
//
//  Created by Yan Wang on 2024/8/8.
//  Copyright © 2024 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import "ZMONGroupAvatarViewController.h"
#import "ModeViewController.h"
//: #import "SVProgressHUD.h"
#import "SVProgressHUD.h"
//: #import "UIView+Toast.h"
#import "UIView+Toast.h"
//: #import "UIActionSheet+NTESBlock.h"
#import "UIActionSheet+FullPhaseOfTheMoon.h"
//: #import "KEKESetNickNameView.h"
#import "OfMinView.h"
//: #import "SDWebImageManager.h"
#import "SDWebImageManager.h"
//: #import "NTESFileLocationHelper.h"
#import "BubbleMaxContainer.h"
//: #import <Photos/Photos.h>
#import <Photos/Photos.h>
//: #import "TZImageManager.h"
#import "TZImageManager.h"
//: #import "TZVideoPlayerController.h"
#import "TZVideoPlayerController.h"
//: #import "TZPhotoPreviewController.h"
#import "TZPhotoPreviewController.h"
//: #import "TZImagePickerController.h"
#import "TZImagePickerController.h"
//: #import "UIView+TZLayout.h"
#import "UIView+TZLayout.h"
//: #import "UIView+Toast.h"
#import "UIView+Toast.h"
//: #import "NTESRegistConfigManager.h"
#import "ContentManager.h"
//: #import "CCCKitProgressHUD.h"
#import "KitDisableView.h"
//: #import "UserKitDependency.h"
#import "UserKitDependency.h"
//: #import "UIImage+AppleProjectKit.h"
#import "UIImage+Indicator.h"
//: #import "NSString+AppleProjectKit.h"
#import "NSString+Indicator.h"

//: @interface ZMONGroupAvatarViewController ()
@interface ModeViewController ()

//: @property (nonatomic, strong) UIButton *closeBtn;
@property (nonatomic, strong) UIButton *closeBtn;
//: @property (nonatomic, strong) UIImage *headerImage;
@property (nonatomic, strong) UIImage *headerImage;
//: @property (nonatomic, strong) UIImageView *aratarImgView;
@property (nonatomic, strong) UIImageView *aratarImgView;
//: @property (nonatomic, strong) UILabel *appNameLabel;
@property (nonatomic, strong) UILabel *appNameLabel;
//: @property (nonatomic, strong) UILabel *subLabel;
@property (nonatomic, strong) UILabel *subLabel;
//: @property (nonatomic, strong) UILabel *accountLabel;
@property (nonatomic, strong) UILabel *accountLabel;
//: @property (nonatomic, strong) UIButton *registButton;
@property (nonatomic, strong) UIButton *registButton;

//: @end
@end

//: @implementation ZMONGroupAvatarViewController
@implementation ModeViewController

//: - (void)viewDidLoad {
- (void)viewDidLoad {
    //: [super viewDidLoad];
    [super viewDidLoad];
    //    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"login_bg"]];
        //: UIImageView *bg = [[UIImageView alloc]initWithFrame:self.view.bounds];
        UIImageView *bg = [[UIImageView alloc]initWithFrame:self.view.bounds];
        //: bg.image = [UIImage imageNamed:@"login_bg"];
        bg.image = [UIImage imageNamed:StringFromWorthData(str_flavorTitle)];
        //: [self.view addSubview:bg];
        [self.view addSubview:bg];

    //: [self initUI];
    [self initGreen];

    //: self.closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    //: self.closeBtn.backgroundColor = [UIColor clearColor];
    self.closeBtn.backgroundColor = [UIColor clearColor];
    //: [self.closeBtn setImage:[UIImage imageNamed:@"back_arrow_bl"] forState:(UIControlStateNormal)];
    [self.closeBtn setImage:[UIImage imageNamed:StringFromWorthData(str_wolfLinkValue)] forState:(UIControlStateNormal)];
    //: [self.closeBtn addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    [self.closeBtn addTarget:self action:@selector(withItem) forControlEvents:UIControlEventTouchUpInside];
    //: [self.view addSubview:self.closeBtn];
    [self.view addSubview:self.closeBtn];
    //: self.closeBtn.frame = CGRectMake(15, 25+[UIDevice vg_statusBarHeight], 40, 40);
    self.closeBtn.frame = CGRectMake(15, 25+[UIDevice task], 40, 40);


}
//: - (void)viewWillAppear:(BOOL)animated{
- (void)viewWillAppear:(BOOL)animated{
    //: [super viewWillAppear:animated];
    [super viewWillAppear:animated];
    //: [self.navigationController.navigationBar setHidden:YES];
    [self.navigationController.navigationBar setHidden:YES];
}

//: -(void)viewWillDisappear:(BOOL)animated{
-(void)viewWillDisappear:(BOOL)animated{
    //: [super viewWillDisappear:animated];
    [super viewWillDisappear:animated];
    //: [self.navigationController.navigationBar setHidden:NO];
    [self.navigationController.navigationBar setHidden:NO];

}

//: - (void)backAction{
- (void)withItem{
    //: [self.navigationController popViewControllerAnimated:NO];
    [self.navigationController popViewControllerAnimated:NO];
}

//: - (void)initUI
- (void)initGreen
{
    //: UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(60, 25+[UIDevice vg_statusBarHeight], [[UIScreen mainScreen] bounds].size.width-120, 40)];
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(60, 25+[UIDevice task], [[UIScreen mainScreen] bounds].size.width-120, 40)];
    //: titleLabel.textColor = [UIColor blackColor];
    titleLabel.textColor = [UIColor blackColor];
    //: titleLabel.font = [UIFont boldSystemFontOfSize:24];
    titleLabel.font = [UIFont boldSystemFontOfSize:24];
    //: titleLabel.text = [NTESLanguageManager getTextWithKey:@"set_group_avater"];
    titleLabel.text = [MaxInformation off:StringFromWorthData(str_combineData)];
    //: titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.textAlignment = NSTextAlignmentCenter;
    //: [self.view addSubview:titleLabel];
    [self.view addSubview:titleLabel];

    //: self.accountLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, titleLabel.bottom+20, [[UIScreen mainScreen] bounds].size.width, 20)];
    self.accountLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, titleLabel.bottom+20, [[UIScreen mainScreen] bounds].size.width, 20)];
    //: self.accountLabel.font = [UIFont boldSystemFontOfSize:14];
    self.accountLabel.font = [UIFont boldSystemFontOfSize:14];
    //: self.accountLabel.textColor = [UIColor colorWithHexString:@"666666"];
    self.accountLabel.textColor = [UIColor direction:StringFromWorthData(str_iconFlavorData)];
    //: self.accountLabel.text = [NTESLanguageManager getTextWithKey:@"register_good_avater"];
    self.accountLabel.text = [MaxInformation off:StringFromWorthData(str_gelPopularName)];
    //: self.accountLabel.textAlignment = NSTextAlignmentCenter;
    self.accountLabel.textAlignment = NSTextAlignmentCenter;
    //: [self.view addSubview:self.accountLabel];
    [self.view addSubview:self.accountLabel];

    //: UIView *imgView = [[UIView alloc]initWithFrame:CGRectMake(([[UIScreen mainScreen] bounds].size.width-150)/2, self.accountLabel.bottom+30, 150, 150)];
    UIView *imgView = [[UIView alloc]initWithFrame:CGRectMake(([[UIScreen mainScreen] bounds].size.width-150)/2, self.accountLabel.bottom+30, 150, 150)];
    //: [self.view addSubview:imgView];
    [self.view addSubview:imgView];

    //: _aratarImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 150, 150)];
    _aratarImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 150, 150)];
    //: _aratarImgView.contentMode = UIViewContentModeScaleAspectFill;
    _aratarImgView.contentMode = UIViewContentModeScaleAspectFill;
    //: _aratarImgView.layer.cornerRadius = 75;
    _aratarImgView.layer.cornerRadius = 75;
    //: _aratarImgView.layer.masksToBounds = YES;
    _aratarImgView.layer.masksToBounds = YES;
    //: _aratarImgView.image = [UIImage imageNamed:@"group_head_def"];
    _aratarImgView.image = [UIImage imageNamed:StringFromWorthData(str_pastaBottomPersonalityValue)];
    //: [imgView addSubview:_aratarImgView];
    [imgView addSubview:_aratarImgView];

//    UIImageView *usericon = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 38, 33)];
//    usericon.image = [UIImage imageNamed:@"ic_hi"];
//    [imgView addSubview:usericon];

    //: UIButton *cameraicon = [[UIButton alloc] initWithFrame:CGRectMake(150-36, 150-36, 36, 36)];
    UIButton *cameraicon = [[UIButton alloc] initWithFrame:CGRectMake(150-36, 150-36, 36, 36)];
    //: cameraicon.backgroundColor = [UIColor whiteColor];
    cameraicon.backgroundColor = [UIColor whiteColor];
    //: [cameraicon setImage:[UIImage imageNamed:@"icon_photo"] forState:(UIControlStateNormal)];
    [cameraicon setImage:[UIImage imageNamed:StringFromWorthData(str_luckyValue)] forState:(UIControlStateNormal)];
    //: cameraicon.layer.cornerRadius = 18;
    cameraicon.layer.cornerRadius = 18;
    //: cameraicon.layer.masksToBounds = YES;
    cameraicon.layer.masksToBounds = YES;
    //: [imgView addSubview:cameraicon];
    [imgView addSubview:cameraicon];
    //: [cameraicon addTarget:self action:@selector(showPicker) forControlEvents:(UIControlEventTouchUpInside)];
    [cameraicon addTarget:self action:@selector(tableMessage) forControlEvents:(UIControlEventTouchUpInside)];

    //: UILabel *tita = [[UILabel alloc]initWithFrame:CGRectMake(0, imgView.bottom+15, [[UIScreen mainScreen] bounds].size.width, 20)];
    UILabel *tita = [[UILabel alloc]initWithFrame:CGRectMake(0, imgView.bottom+15, [[UIScreen mainScreen] bounds].size.width, 20)];
    //: tita.text = self.groupName;
    tita.text = self.groupName;
    //: tita.textColor = [UIColor colorWithHexString:@"#000000"];
    tita.textColor = [UIColor direction:StringFromWorthData(str_campValue)];
    //: tita.textAlignment = NSTextAlignmentCenter;
    tita.textAlignment = NSTextAlignmentCenter;
    //: tita.font = [UIFont systemFontOfSize:16];
    tita.font = [UIFont systemFontOfSize:16];
    //: [self.view addSubview:tita];
    [self.view addSubview:tita];



    //: self.registButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.registButton = [UIButton buttonWithType:UIButtonTypeCustom];
    //: self.registButton.frame = CGRectMake(30, tita.bottom+20, [[UIScreen mainScreen] bounds].size.width-60, 44);
    self.registButton.frame = CGRectMake(30, tita.bottom+20, [[UIScreen mainScreen] bounds].size.width-60, 44);
    //: self.registButton.backgroundColor = [UIColor colorWithRed:43/255.0 green:188/255.0 blue:251/255.0 alpha:1];
    self.registButton.backgroundColor = [UIColor colorWithRed:43/255.0 green:188/255.0 blue:251/255.0 alpha:1];
//    self.registButton.layer.masksToBounds = YES;
    //: self.registButton.layer.cornerRadius = 10;
    self.registButton.layer.cornerRadius = 10;
    //: self.registButton.layer.shadowColor = [UIColor colorWithHexString:@"#009ADC"].CGColor;
    self.registButton.layer.shadowColor = [UIColor direction:StringFromWorthData(str_comingName)].CGColor;
    //: self.registButton.layer.shadowOpacity = 1;
    self.registButton.layer.shadowOpacity = 1;
    //: self.registButton.layer.shadowRadius = 0;
    self.registButton.layer.shadowRadius = 0;
    //: self.registButton.layer.shadowOffset = CGSizeMake(0,3);
    self.registButton.layer.shadowOffset = CGSizeMake(0,3);
    //: self.registButton.titleLabel.font = [UIFont systemFontOfSize:16];
    self.registButton.titleLabel.font = [UIFont systemFontOfSize:16];
    //: [self.registButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.registButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    //: [self.registButton setTitle:[NTESLanguageManager getTextWithKey:@"contact_list_activity_complete"] forState:UIControlStateNormal];
    [self.registButton setTitle:[MaxInformation off:StringFromWorthData(str_threadAttractPublicTitle)] forState:UIControlStateNormal];
    //: [self.view addSubview:self.registButton];
    [self.view addSubview:self.registButton];
    //: [self.registButton addTarget:self action:@selector(nextButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.registButton addTarget:self action:@selector(locationCall) forControlEvents:UIControlEventTouchUpInside];


}

//: - (void)showPicker {
- (void)tableMessage {

    //: UIAlertController *alertVc = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertController *alertVc = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];

    //: UIAlertAction *camera = [UIAlertAction actionWithTitle:[NTESLanguageManager getTextWithKey:@"message_send_camera"] style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
    UIAlertAction *camera = [UIAlertAction actionWithTitle:[MaxInformation off:StringFromWorthData(str_cornerLabName)] style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {

        //: [self pushTZImagePickerControllerWithAsset:nil];
        [self recentChild:nil];

    //: }];
    }];

    //: UIAlertAction *picture = [UIAlertAction actionWithTitle:[NTESLanguageManager getTextWithKey:@"message_send_album"] style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
    UIAlertAction *picture = [UIAlertAction actionWithTitle:[MaxInformation off:StringFromWorthData(str_worthTitle)] style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {

        //: [self pushTZImagePickerControllerWithAsset:nil];
        [self recentChild:nil];

            //: }];
            }];

    //: UIAlertAction *cancle = [UIAlertAction actionWithTitle:[NTESLanguageManager getTextWithKey:@"contact_tag_fragment_cancel"] style:UIAlertActionStyleCancel handler:^(UIAlertAction *_Nonnull action) {
    UIAlertAction *cancle = [UIAlertAction actionWithTitle:[MaxInformation off:StringFromWorthData(str_plainFromHeightName)] style:UIAlertActionStyleCancel handler:^(UIAlertAction *_Nonnull action) {
   //: }];
   }];


    //: [alertVc addAction:camera];
    [alertVc addAction:camera];
    //: [alertVc addAction:picture];
    [alertVc addAction:picture];
    //: [alertVc addAction:cancle];
    [alertVc addAction:cancle];

    //: [self presentViewController:alertVc animated:YES completion:nil];
    [self presentViewController:alertVc animated:YES completion:nil];
}

//: #pragma mark - TZImagePickerController
#pragma mark - TZImagePickerController
//: - (void)pushTZImagePickerControllerWithAsset:(PHAsset *)asset {
- (void)recentChild:(PHAsset *)asset {

    //: TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:5 columnNumber:4 delegate:nil pushPhotoPickerVc:YES];
    TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:5 columnNumber:4 delegate:nil pushPhotoPickerVc:YES];

//: #pragma mark - 五类个性化设置，这些参数都可以不传，此时会走默认设置
#pragma mark - 五类个性化设置，这些参数都可以不传，此时会走默认设置
    //: imagePickerVc.isSelectOriginalPhoto = YES;
    imagePickerVc.isSelectOriginalPhoto = YES;
    //: if (asset){
    if (asset){
        //: imagePickerVc.selectedAssets = [NSMutableArray arrayWithObject:asset]; 
        imagePickerVc.selectedAssets = [NSMutableArray arrayWithObject:asset]; // 目前已经选中的图片数组
    }
    //: imagePickerVc.allowTakePicture = YES; 
    imagePickerVc.allowTakePicture = YES; // 在内部显示拍照按钮
    //: imagePickerVc.allowTakeVideo = NO; 
    imagePickerVc.allowTakeVideo = NO; // 在内部显示拍视频按
    //: [imagePickerVc setUiImagePickerControllerSettingBlock:^(UIImagePickerController *imagePickerController) {
    [imagePickerVc setUiImagePickerControllerSettingBlock:^(UIImagePickerController *imagePickerController) {
        //: imagePickerController.videoQuality = UIImagePickerControllerQualityTypeHigh;
        imagePickerController.videoQuality = UIImagePickerControllerQualityTypeHigh;
    //: }];
    }];

    //: imagePickerVc.iconThemeColor = [UIColor colorWithRed:31 / 255.0 green:185 / 255.0 blue:34 / 255.0 alpha:1.0];
    imagePickerVc.iconThemeColor = [UIColor colorWithRed:31 / 255.0 green:185 / 255.0 blue:34 / 255.0 alpha:1.0];
    //: imagePickerVc.showPhotoCannotSelectLayer = YES;
    imagePickerVc.showPhotoCannotSelectLayer = YES;
    //: imagePickerVc.cannotSelectLayerColor = [[UIColor whiteColor] colorWithAlphaComponent:0.8];
    imagePickerVc.cannotSelectLayerColor = [[UIColor whiteColor] colorWithAlphaComponent:0.8];
    //: imagePickerVc.processHintStr = @"...";
    imagePickerVc.processHintStr = @"...";
    // 3. 设置是否可以选择视频/图片/原图
    //: imagePickerVc.allowPickingVideo = NO;
    imagePickerVc.allowPickingVideo = NO;
    //: imagePickerVc.allowPickingImage = YES;
    imagePickerVc.allowPickingImage = YES;
    //: imagePickerVc.allowPickingOriginalPhoto = YES;
    imagePickerVc.allowPickingOriginalPhoto = YES;
    //: imagePickerVc.allowPickingGif = NO;
    imagePickerVc.allowPickingGif = NO;
    //: imagePickerVc.allowPickingMultipleVideo = NO;
    imagePickerVc.allowPickingMultipleVideo = NO;

    // 4. 照片排列按修改时间升序
    //: imagePickerVc.sortAscendingByModificationDate = YES;
    imagePickerVc.sortAscendingByModificationDate = YES;

     //: imagePickerVc.maxImagesCount = 1;
     imagePickerVc.maxImagesCount = 1;

    /// 5. Single selection mode, valid when maxImagesCount = 1
    /// 5. 单选模式,maxImagesCount为1时才生效
    //: imagePickerVc.showSelectBtn = NO;
    imagePickerVc.showSelectBtn = NO;
    //: imagePickerVc.allowCrop = YES;
    imagePickerVc.allowCrop = YES;
    //: imagePickerVc.needCircleCrop = YES;
    imagePickerVc.needCircleCrop = YES;
    // 设置竖屏下的裁剪尺寸
    //: NSInteger left = 30;
    NSInteger left = 30;
    //: NSInteger widthHeight = self.view.tz_width - 2 * left;
    NSInteger widthHeight = self.view.tz_width - 2 * left;
    //: NSInteger top = (self.view.tz_height - widthHeight) / 2;
    NSInteger top = (self.view.tz_height - widthHeight) / 2;
    //: imagePickerVc.cropRect = CGRectMake(left, top, widthHeight, widthHeight);
    imagePickerVc.cropRect = CGRectMake(left, top, widthHeight, widthHeight);
    //: imagePickerVc.scaleAspectFillCrop = YES;
    imagePickerVc.scaleAspectFillCrop = YES;

    //: imagePickerVc.statusBarStyle = UIStatusBarStyleLightContent;
    imagePickerVc.statusBarStyle = UIStatusBarStyleLightContent;

    // 设置是否显示图片序号
    //: imagePickerVc.showSelectedIndex = YES;
    imagePickerVc.showSelectedIndex = YES;

    //: imagePickerVc.navigationBar.barStyle = UIBarStyleDefault;
    imagePickerVc.navigationBar.barStyle = UIBarStyleDefault;
//    imagePickerVc.naviBgColor = [KEKESkinColorManager shareInstance].skinColor;
    //: imagePickerVc.naviTitleColor = [UIColor blackColor];
    imagePickerVc.naviTitleColor = [UIColor blackColor];
    //: imagePickerVc.barItemTextColor = [UIColor blackColor];
    imagePickerVc.barItemTextColor = [UIColor blackColor];

    //: NSString *langType = emptyString([NIMUserDefaults standardUserDefaults].language);
    NSString *langType = emptyString([WastepaperBasketDefaults at].language);
    //: NSString *preferredlang = @"";
    NSString *preferredlang = @"";
    //: if ([langType containsString:@"vi"]){
    if ([langType containsString:@"vi"]){
        //: preferredlang = @"vi";
        preferredlang = @"vi";
    //: }else if ([langType containsString:@"ja"]){
    }else if ([langType containsString:@"ja"]){
        //: preferredlang = @"ja";
        preferredlang = @"ja";
    //: }else if ([langType containsString:@"ko"]){
    }else if ([langType containsString:@"ko"]){
        //: preferredlang = @"ko-KP";
        preferredlang = StringFromWorthData(str_attractiveName);
    //: }else if ([langType containsString:@"spa"]){
    }else if ([langType containsString:StringFromWorthData(str_attendanceTitle)]){
        //: preferredlang = @"es";
        preferredlang = @"es";
    //: }else if ([langType containsString:@"pt"]){
    }else if ([langType containsString:@"pt"]){
        //: preferredlang = @"pt";
        preferredlang = @"pt";
    //: }else if ([langType containsString:@"zh"]){
    }else if ([langType containsString:@"zh"]){
        //: preferredlang = @"zh-Hans";
        preferredlang = StringFromWorthData(str_attendanceBrotherTitle);
    //: }else if ([langType containsString:@"de"]){
    }else if ([langType containsString:@"de"]){
        //: preferredlang = @"de";
        preferredlang = @"de";
    //: }else if ([langType containsString:@"sa"]){
    }else if ([langType containsString:@"sa"]){
        //: preferredlang = @"ar";
        preferredlang = @"ar";
    //: }else if ([langType containsString:@"ru"]){
    }else if ([langType containsString:@"ru"]){
        //: preferredlang = @"ru";
        preferredlang = @"ru";
    //: }else if ([langType containsString:@"fr"]){
    }else if ([langType containsString:@"fr"]){
        //: preferredlang = @"fr";
        preferredlang = @"fr";
    //: }else if ([langType containsString:@"hant"]){
    }else if ([langType containsString:StringFromWorthData(str_sendVendData)]){
        //: preferredlang = @"zh-Hant";
        preferredlang = StringFromWorthData(str_cellWasteName);
    //: }else{
    }else{
        //: preferredlang = @"en";
        preferredlang = @"en";
    }
    //: imagePickerVc.preferredLanguage = preferredlang;
    imagePickerVc.preferredLanguage = preferredlang;

//: #pragma mark - 到这里为止
#pragma mark - 到这里为止

    @
     //: autoreleasepool{} __weak __typeof__(self) __weak_self__ = self;
     autoreleasepool{} __weak __typeof__(self) __weak_self__ = self;
                  ;
    //: [imagePickerVc setDidFinishPickingPhotosHandle:^(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOriginalPhoto) {
    [imagePickerVc setDidFinishPickingPhotosHandle:^(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOriginalPhoto) {
        //: if (photos.count > 0 && assets.count > 0) {
        if (photos.count > 0 && assets.count > 0) {
            @
             //: try{} @finally{} __typeof__(self) self = __weak_self__;
             try{} @finally{} __typeof__(self) self = __weak_self__;
                            ;

            //: [self.aratarImgView setImage:photos.firstObject];
            [self.aratarImgView setImage:photos.firstObject];
            //: self.headerImage = photos.firstObject;
            self.headerImage = photos.firstObject;

        }
    //: }];
    }];
    //: imagePickerVc.modalPresentationStyle = UIModalPresentationFullScreen;
    imagePickerVc.modalPresentationStyle = UIModalPresentationFullScreen;
    //: [self presentViewController:imagePickerVc animated:YES completion:nil];
    [self presentViewController:imagePickerVc animated:YES completion:nil];
}

//: - (void)nextButtonClick{
- (void)locationCall{

    //: self.speiceBackBlock(self.headerImage);
    self.speiceBackBlock(self.headerImage);

//    UIImage *imageForAvatarUpload = [self.headerImage nim_imageForAvatarUpload];
//    NSString *fileName = [[[[NSUUID UUID] UUIDString] lowercaseString] stringByAppendingPathExtension:@"jpg"];
//    NSString *filePath = [NSTemporaryDirectory() stringByAppendingPathComponent:fileName];
//    NSData *data = UIImageJPEGRepresentation(imageForAvatarUpload, 1.0);
//    BOOL success = data && [data writeToFile:filePath atomically:YES];
//    __weak typeof(self) wself = self;
//    if (success) {
//        [KitDisableView show];
//        __weak typeof(self) weakSelf = self;
//        [self.teamListManager updateTeamAvatar:filePath completion:^(NSError * _Nonnull error, NSString * _Nonnull msg) {
//            [KitDisableView dismiss];
//            if (!error) {
//                NSString *urlString = weakSelf.teamListManager.team.avatarUrl;
//                SDWebImageManager *sdManager = [SDWebImageManager sharedManager];
//                [sdManager.imageCache storeImage:imageForAvatarUpload
//                                       imageData:data
//                                          forKey:urlString
//                                       cacheType:SDImageCacheTypeAll
//                                      completion:nil];
//                [wself.navigationController popViewControllerAnimated:NO];
//            }
////            [wself showToastMsg:msg];
//        }];
//    }

}



//: @end
@end

Byte * WorthDataToCache(Byte *data) {
    int dateListen = data[0];
    int numberTing = data[1];
    Byte activityKick = data[2];
    int number = data[3];
    if (!dateListen) return data + number;
    for (int i = number; i < number + numberTing; i++) {
        int value = data[i] + activityKick;
        if (value > 255) {
            value -= 256;
        }
        data[i] = value;
    }
    data[0] = 0;
    data[number + numberTing] = 0;
    return data + number;
}

NSString *StringFromWorthData(Byte *data) {
    return [NSString stringWithUTF8String:(char *)WorthDataToCache(data)];
}
