//
//  ZMONRegisterAvatarViewController.m
//  NIM
//
//  Created by Yan Wang on 2024/7/30.
//  Copyright © 2024 Netease. All rights reserved.
//

#import "ZMONRegisterAvatarViewController.h"
#import "SVProgressHUD.h"
#import "UIView+Toast.h"
#import "UIActionSheet+NTESBlock.h"
#import "KEKESetNickNameView.h"
#import "SDWebImageManager.h"
#import "NTESFileLocationHelper.h"
#import <Photos/Photos.h>
#import "TZImageManager.h"
#import "TZVideoPlayerController.h"
#import "TZPhotoPreviewController.h"
#import "TZImagePickerController.h"
#import "UIView+TZLayout.h"
#import "UIView+Toast.h"
#import "NTESRegistConfigManager.h"
@interface ZMONRegisterAvatarViewController ()


@property (nonatomic, strong) UIButton *closeBtn;
@property (nonatomic, strong) UIImage *headerImage;
@property (nonatomic, strong) UIImageView *aratarImgView;
@property (nonatomic, strong) UILabel  *appNameLabel;
@property (nonatomic, strong) UILabel  *subLabel;
@property (nonatomic, strong) UILabel *accountLabel;
@property (nonatomic, strong) UIButton *registButton;


@end

@implementation ZMONRegisterAvatarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"login_bg"]];
    UIImageView *bg = [[UIImageView alloc]initWithFrame:self.view.bounds];
    bg.image = [UIImage imageNamed:@"login_bg"];
    [self.view addSubview:bg];
    
    [self initUI];
    
    self.closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.closeBtn.backgroundColor = [UIColor clearColor];
    [self.closeBtn setImage:[UIImage imageNamed:@"back_arrow_bl"] forState:(UIControlStateNormal)];
    [self.closeBtn addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.closeBtn];
    self.closeBtn.frame = CGRectMake(15, 25+SCREEN_STATUS_HEIGHT, 40, 40);
    
   
}

- (void)backAction{
    [self.navigationController popViewControllerAnimated:NO];
}

- (void)initUI
{

    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(60,  25+SCREEN_STATUS_HEIGHT, SCREEN_WIDTH-120, 40)];
    titleLabel.textColor = [UIColor blackColor];
    titleLabel.font = [UIFont boldSystemFontOfSize:24];
    titleLabel.text = LangKey(@"user_profile_avtivity_head");
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:titleLabel];
    
    self.accountLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, titleLabel.bottom+20, SCREEN_WIDTH, 20)];
    self.accountLabel.font = [UIFont boldSystemFontOfSize:14];
    self.accountLabel.textColor = TextColor_2;
    self.accountLabel.text = LangKey(@"register_good_avater");
    self.accountLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.accountLabel];
    
    UIView *imgView = [[UIView alloc]initWithFrame:CGRectMake((SCREEN_WIDTH-150)/2, self.accountLabel.bottom+30, 150, 150)];
    [self.view addSubview:imgView];
  
    _aratarImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 150, 150)];
    _aratarImgView.contentMode = UIViewContentModeScaleAspectFill;
    _aratarImgView.layer.cornerRadius = 75;
    _aratarImgView.layer.masksToBounds = YES;
    _aratarImgView.image = [UIImage imageNamed:@"head_default"];
    [imgView addSubview:_aratarImgView];
    
    UIImageView *usericon = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 38, 33)];
    usericon.image = [UIImage imageNamed:@"ic_hi"];
    [imgView addSubview:usericon];
    
    UIButton *cameraicon = [[UIButton alloc] initWithFrame:CGRectMake(150-36, 150-36, 36, 36)];
    cameraicon.backgroundColor = [UIColor whiteColor];
    [cameraicon setImage:[UIImage imageNamed:@"icon_photo"] forState:(UIControlStateNormal)];
    cameraicon.layer.cornerRadius = 18;
    cameraicon.layer.masksToBounds = YES;
    [imgView addSubview:cameraicon];
    [cameraicon addTarget:self action:@selector(showPicker) forControlEvents:(UIControlEventTouchUpInside)];
    
    UILabel *tita = [[UILabel alloc]initWithFrame:CGRectMake(0, imgView.bottom+15, SCREEN_WIDTH, 20)];
    tita.text = self.nickName;
    tita.textColor = RGB_COLOR_String(@"#000000");
    tita.textAlignment = NSTextAlignmentCenter;
    tita.font = [UIFont systemFontOfSize:16];
    [self.view addSubview:tita];
  

    
    self.registButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.registButton.frame = CGRectMake(30, tita.bottom+20, SCREEN_WIDTH-60, 44);
    self.registButton.backgroundColor = ThemeColor;
//    self.registButton.layer.masksToBounds = YES;
    self.registButton.layer.cornerRadius = 10;
    self.registButton.layer.shadowColor = DeepBtnColor.CGColor;
    self.registButton.layer.shadowOpacity = 1;
    self.registButton.layer.shadowRadius = 0;
    self.registButton.layer.shadowOffset = CGSizeMake(0,3);
    self.registButton.titleLabel.font = [UIFont systemFontOfSize:16];
    [self.registButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.registButton setTitle:LangKey(@"contact_list_activity_complete") forState:UIControlStateNormal];
    [self.view addSubview:self.registButton];
    [self.registButton addTarget:self action:@selector(nextButtonClick) forControlEvents:UIControlEventTouchUpInside];
 
    
}

/**
 *  请求相机权限
 */
- (void)requestAuthorizationForVideo {
   
    @weakify(self);
    AVAuthorizationStatus authorityStaus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    if (AVAuthorizationStatusNotDetermined == authorityStaus) {
        [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
            if (granted == YES) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    @strongify(self);

                    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
                        [self pushTZImagePickerControllerWithAsset:nil];
                        
                    }
                });
            }
        }];
    } else if (AVAuthorizationStatusAuthorized == authorityStaus) {
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            [self pushTZImagePickerControllerWithAsset:nil];
            
        }
    } else {
//        NSURL *url = [[NSURL alloc] initWithString:UIApplicationOpenSettingsURLString];
//        if( [[UIApplication sharedApplication] canOpenURL:url]) {
//            [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];
//        }
        
        UIAlertController *alertControl = [UIAlertController alertControllerWithTitle:LangKey(@"warm_prompt") message:LangKey(@"setting_privacy_camera") preferredStyle:UIAlertControllerStyleAlert];
        [alertControl addAction:([UIAlertAction actionWithTitle:LangKey(@"contact_tag_fragment_cancel") style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        }])];
        [alertControl addAction:([UIAlertAction actionWithTitle:LangKey(@"tag_activity_set") style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            NSURL *url = [[NSURL alloc] initWithString:UIApplicationOpenSettingsURLString];
            if( [[UIApplication sharedApplication] canOpenURL:url]) {
                [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];
            }
        }])];
        [self presentViewController:alertControl animated:YES completion:nil];
        
    }
}

/**
 *  请求相册
 */
- (void)requestAuthorizationForPhotoLibrary
{
    @weakify(self);
    PHAuthorizationStatus authStatus = [PHPhotoLibrary authorizationStatus];
    if (PHAuthorizationStatusNotDetermined == authStatus) {
        [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
            if (PHAuthorizationStatusAuthorized == status) {
                @strongify(self);
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self pushTZImagePickerControllerWithAsset:nil];
                });
            }
        }];
        return;
    } else if (PHAuthorizationStatusAuthorized == authStatus){
        [self pushTZImagePickerControllerWithAsset:nil];
    } else {
//        NSURL *url = [[NSURL alloc] initWithString:UIApplicationOpenSettingsURLString];
//        if( [[UIApplication sharedApplication] canOpenURL:url]) {
//            [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];
//        }
        
        UIAlertController *alertControl = [UIAlertController alertControllerWithTitle:LangKey(@"warm_prompt") message:LangKey(@"setting_privacy") preferredStyle:UIAlertControllerStyleAlert];
        [alertControl addAction:([UIAlertAction actionWithTitle:LangKey(@"contact_tag_fragment_cancel") style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        }])];
        [alertControl addAction:([UIAlertAction actionWithTitle:LangKey(@"tag_activity_set") style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            NSURL *url = [[NSURL alloc] initWithString:UIApplicationOpenSettingsURLString];
            if( [[UIApplication sharedApplication] canOpenURL:url]) {
                [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];
            }
        }])];
        [self presentViewController:alertControl animated:YES completion:nil];
    }
}







- (void)showPicker {

    UIAlertController *alertVc = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];

    UIAlertAction *camera = [UIAlertAction actionWithTitle:LangKey(@"message_send_camera") style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {

//        [self pushTZImagePickerControllerWithAsset:nil];
        [self requestAuthorizationForVideo];

    }];

    UIAlertAction *picture = [UIAlertAction actionWithTitle:LangKey(@"message_send_album") style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {

//        [self pushTZImagePickerControllerWithAsset:nil];
        [self requestAuthorizationForPhotoLibrary];

            }];
    
    UIAlertAction *cancle = [UIAlertAction actionWithTitle:LangKey(@"contact_tag_fragment_cancel") style:UIAlertActionStyleCancel handler:^(UIAlertAction *_Nonnull action) {
   }];
    

    [alertVc addAction:camera];
    [alertVc addAction:picture];
    [alertVc addAction:cancle];

    [self presentViewController:alertVc animated:YES completion:nil];
}

#pragma mark - TZImagePickerController
- (void)pushTZImagePickerControllerWithAsset:(PHAsset *)asset {

    TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:1 columnNumber:4 delegate:nil pushPhotoPickerVc:YES];
    
#pragma mark - 五类个性化设置，这些参数都可以不传，此时会走默认设置
    imagePickerVc.isSelectOriginalPhoto = YES;
    if (asset){
        imagePickerVc.selectedAssets = [NSMutableArray arrayWithObject:asset]; // 目前已经选中的图片数组
    }
    imagePickerVc.allowTakePicture = YES; // 在内部显示拍照按钮
    imagePickerVc.allowTakeVideo = NO;   // 在内部显示拍视频按
    [imagePickerVc setUiImagePickerControllerSettingBlock:^(UIImagePickerController *imagePickerController) {
        imagePickerController.videoQuality = UIImagePickerControllerQualityTypeHigh;
    }];

    imagePickerVc.iconThemeColor = [UIColor colorWithRed:31 / 255.0 green:185 / 255.0 blue:34 / 255.0 alpha:1.0];
    imagePickerVc.showPhotoCannotSelectLayer = YES;
    imagePickerVc.cannotSelectLayerColor = [[UIColor whiteColor] colorWithAlphaComponent:0.8];
    imagePickerVc.processHintStr = @"...";
    // 3. 设置是否可以选择视频/图片/原图
    imagePickerVc.allowPickingVideo = NO;
    imagePickerVc.allowPickingImage = YES;
    imagePickerVc.allowPickingOriginalPhoto = YES;
    imagePickerVc.allowPickingGif = NO;
    imagePickerVc.allowPickingMultipleVideo = NO;
    
    // 4. 照片排列按修改时间升序
    imagePickerVc.sortAscendingByModificationDate = YES;
    
     imagePickerVc.maxImagesCount = 1;

    /// 5. Single selection mode, valid when maxImagesCount = 1
    /// 5. 单选模式,maxImagesCount为1时才生效
    imagePickerVc.showSelectBtn = NO;
    imagePickerVc.allowCrop = YES;
    imagePickerVc.needCircleCrop = YES;
    // 设置竖屏下的裁剪尺寸
    NSInteger left = 30;
    NSInteger widthHeight = self.view.tz_width - 2 * left;
    NSInteger top = (self.view.tz_height - widthHeight) / 2;
    imagePickerVc.cropRect = CGRectMake(left, top, widthHeight, widthHeight);
    imagePickerVc.scaleAspectFillCrop = YES;
   
    imagePickerVc.statusBarStyle = UIStatusBarStyleLightContent;
    
    // 设置是否显示图片序号
    imagePickerVc.showSelectedIndex = YES;
    
    imagePickerVc.navigationBar.barStyle = UIBarStyleDefault;
//    imagePickerVc.naviBgColor = [KEKESkinColorManager shareInstance].skinColor;
    imagePickerVc.naviTitleColor = [UIColor blackColor];
    imagePickerVc.barItemTextColor = [UIColor blackColor];
 
    NSString *langType = emptyString([NIMUserDefaults standardUserDefaults].language);
    NSString *preferredlang = @"";
    if ([langType containsString:@"vi"]){
        preferredlang = @"vi";
    }else if ([langType containsString:@"ja"]){
        preferredlang = @"ja";
    }else if ([langType containsString:@"ko"]){
        preferredlang = @"ko-KP";
    }else if ([langType containsString:@"spa"]){
        preferredlang = @"es";
    }else if ([langType containsString:@"pt"]){
        preferredlang = @"pt";
    }else if ([langType containsString:@"zh"]){
        preferredlang = @"zh-Hans";
    }else if ([langType containsString:@"de"]){
        preferredlang = @"de";
    }else if ([langType containsString:@"sa"]){
        preferredlang = @"ar";
    }else if ([langType containsString:@"ru"]){
        preferredlang = @"ru";
    }else if ([langType containsString:@"fr"]){
        preferredlang = @"fr";
    }else if ([langType containsString:@"hant"]){
        preferredlang = @"zh-Hant";
    }else{
        preferredlang = @"en";
    }
    imagePickerVc.preferredLanguage = preferredlang;
    
//    [NSSet setWithObjects:@"zh-Hans", @"zh-Hant", @"en", @"ar", @"de", @"es", @"fr", @"ja", @"ko-KP", @"pt", @"ru", @"vi", nil];
    // 设置首选语言 / Set preferred language
//         imagePickerVc.preferredLanguage = @"zh-Hans";
        // 设置languageBundle以使用其它语言 / Set languageBundle to use other language
//         imagePickerVc.languageBundle = [NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:@"tz-ru" ofType:@"lproj"]];
    
#pragma mark - 到这里为止
    
    @weakify(self);
    [imagePickerVc setDidFinishPickingPhotosHandle:^(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOriginalPhoto) {
        if (photos.count > 0 && assets.count > 0) {
            @strongify(self);
           
            [self.aratarImgView setImage:photos.firstObject];
            self.headerImage = photos.firstObject;
  
        }
    }];
    imagePickerVc.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:imagePickerVc animated:YES completion:nil];
}

- (void)nextButtonClick{

    NTESRegistConfigManager *manager = [NTESRegistConfigManager shareConfigManager];

    if (_headerImage) {
        manager.headerImage = _headerImage;
    }else{
        [SVProgressHUD showMessage:LangKey(@"register_avtivity3_avatar")];
        return;
    }

    [manager.registDict setObject:self.nickName forKey:@"nickname"];

    //注册
    [NTESRegistConfigManager sendRegistRequest:self.navigationController];
}


@end
