//
//  CCCUserInfoViewController.m
//  AppleProject
//
//  Created by Yan Wang on 2024/12/30.
//  Copyright © 2024 AppleProject. All rights reserved.
//

#import "CCCUserInfoViewController.h"
#import "NTESSignSettingViewController.h"
#import "TZImagePickerController.h"
#import "KEKESetNickNameView.h"
#import "NTESFileLocationHelper.h"


@interface CCCUserInfoViewController ()<NIMUserManagerDelegate,TZImagePickerControllerDelegate>

@property (strong, nonatomic)  UIImageView *imgHeader;
@property (strong, nonatomic)  UIButton *btnPhoto;

@property (strong, nonatomic)  UILabel *labNickname;
@property (strong, nonatomic)  UILabel *nickName;
@property (strong, nonatomic)  UIButton *btnNickname;
@property (strong, nonatomic)  UILabel *labAccount;
@property (strong, nonatomic)  UILabel *account;
@property (strong, nonatomic)  UIButton *btnCopy;
@property (strong, nonatomic)  UILabel *labSign;
@property (strong, nonatomic)  UILabel *sign;
@property (strong, nonatomic)  UIButton *btnSign;

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIView *cropView;


@property (nonatomic, strong) KEKESetNickNameView *changeNickNameView;

@end

@implementation CCCUserInfoViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setHidden:YES];
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar setHidden:NO];
}
- (void)backAction{
    [self.navigationController popViewControllerAnimated:NO];
}
- (void)dealloc{
    [[NIMSDK sharedSDK].userManager removeDelegate:self];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_my"]];
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(5, SCREEN_STATUS_HEIGHT+4, 40, 40);
    [backButton setImage:[UIImage imageNamed:@"back_arrow_bl"] forState:(UIControlStateNormal)];
    [backButton addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backButton];
    
    UILabel *labtitle = [[UILabel alloc] initWithFrame:CGRectMake((SCREEN_WIDTH-200)/2, SCREEN_STATUS_HEIGHT+4, 200, 40)];
    labtitle.font = [UIFont boldSystemFontOfSize:16.f];
    labtitle.textColor = [UIColor blackColor];
    labtitle.textAlignment = NSTextAlignmentCenter;
    labtitle.text = LangKey(@"my_user_info_activity_title");
    [self.view addSubview:labtitle];
    
    [self loadUiView];
    [[NIMSDK sharedSDK].userManager addDelegate:self];
    [self refresh];
}

- (void)loadUiView
{
    UIView *avaterView = [[UIView alloc]initWithFrame:CGRectMake((SCREEN_WIDTH-100)/2, SCREEN_TOP_HEIGHT+15, 100, 100)];
    [self.view addSubview:avaterView];
    self.imgHeader = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    self.imgHeader.layer.cornerRadius = 50;
    self.imgHeader.layer.masksToBounds = YES;
    [avaterView addSubview:self.imgHeader];
    self.btnPhoto = [UIButton buttonWithType:UIButtonTypeCustom];
    self.btnPhoto.backgroundColor = [UIColor whiteColor];
    self.btnPhoto.layer.cornerRadius = 15;
    self.btnPhoto.layer.masksToBounds = YES;
    self.btnPhoto.frame = CGRectMake(70, 70, 30, 30);
    [self.btnPhoto setImage:[UIImage imageNamed:@"icon_photo"] forState:(UIControlStateNormal)];
    [self.btnPhoto addTarget:self action:@selector(handleThePhoto) forControlEvents:UIControlEventTouchUpInside];
    [avaterView addSubview:self.btnPhoto];
    
    UIView *nameView = [[UIView alloc]initWithFrame:CGRectMake(15, avaterView.bottom+15, SCREEN_WIDTH-30, 50)];
    [self.view addSubview:nameView];
    UITapGestureRecognizer *panGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTheNickName)];
    [nameView addGestureRecognizer:panGesture];
    self.labNickname = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 150, 50)];
    self.labNickname.font = [UIFont systemFontOfSize:16.f];
    self.labNickname.textColor = [UIColor blackColor];
//    labtitle.textAlignment = NSTextAlignmentCenter;
    self.labNickname.text = LangKey(@"activity_my_user_info_nick");
    [nameView addSubview:self.labNickname];
    self.nickName = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-30-30-150, 0, 150, 50)];
    self.nickName.font = [UIFont systemFontOfSize:14.f];
    self.nickName.textColor = TextColor_2;
    self.nickName.textAlignment = NSTextAlignmentRight;
    [nameView addSubview:self.nickName];
    UIImageView *arrow = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-30-12, 19, 12, 12)];
    arrow.image = [UIImage imageNamed:@"icon_me_arrow"];
    [nameView addSubview:arrow];
    
    UIView *accountView = [[UIView alloc]initWithFrame:CGRectMake(15, nameView.bottom, SCREEN_WIDTH-30, 50)];
    [self.view addSubview:accountView];
    self.labAccount = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 150, 50)];
    self.labAccount.font = [UIFont systemFontOfSize:16.f];
    self.labAccount.textColor = [UIColor blackColor];
    self.labAccount.text = LangKey(@"user_profile_avtivity_account");
    [accountView addSubview:self.labAccount];
    self.account = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-30-30-150, 0, 150, 50)];
    self.account.font = [UIFont systemFontOfSize:14.f];
    self.account.textColor = TextColor_2;
    self.account.textAlignment = NSTextAlignmentRight;
    [accountView addSubview:self.account];
    self.btnCopy = [UIButton buttonWithType:UIButtonTypeCustom];
    self.btnCopy.frame = CGRectMake(SCREEN_WIDTH-30-30, 10, 30, 30);
    [self.btnCopy setImage:[UIImage imageNamed:@"icon_copy"] forState:(UIControlStateNormal)];
    [self.btnCopy addTarget:self action:@selector(handleTheCopy) forControlEvents:UIControlEventTouchUpInside];
    [accountView addSubview:self.btnCopy];
    
    UIView *signView = [[UIView alloc]initWithFrame:CGRectMake(15, accountView.bottom, SCREEN_WIDTH-30, 80)];
    [self.view addSubview:signView];
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTheSign)];
    [signView addGestureRecognizer:tapGesture];
    self.labSign = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 150, 40)];
    self.labSign.font = [UIFont systemFontOfSize:16.f];
    self.labSign.textColor = [UIColor blackColor];
    self.labSign.text = LangKey(@"user_profile_avtivity_signature");
    [signView addSubview:self.labSign];
    UIImageView *arrow1 = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-30-12, 14, 12, 12)];
    arrow1.image = [UIImage imageNamed:@"icon_me_arrow"];
    [signView addSubview:arrow1];
    self.sign = [[UILabel alloc]initWithFrame:CGRectMake(0, self.labSign.bottom, SCREEN_WIDTH-30, 40)];
    self.sign.font = [UIFont systemFontOfSize:14.f];
    self.sign.textColor = TextColor_2;
    self.sign.numberOfLines = 0;
    [signView addSubview:self.sign];
    
}
- (void)refresh {
    NIMUser *me = [[NIMSDK sharedSDK].userManager userInfo:[[NIMSDK sharedSDK].loginManager currentAccount]];
    [self.imgHeader sd_setImageWithURL:[NSURL URLWithString:me.userInfo.avatarUrl] placeholderImage:[UIImage imageNamed:@"icon_options_grdefault"]];
    
    self.nickName.text = me.userInfo.nickName;
//    self.account.text = me.userId;
    self.sign.text = me.userInfo.sign.length ? me.userInfo.sign : LangKey(@"未设置");
    
    NSMutableDictionary *dict = @{}.mutableCopy;
    dict[@"user_id"] = me.userId;
    [ZCHttpManager getWithUrl:Server_user_detail params:dict isShow:NO success:^(id responseObject) {
        NSDictionary *resultDict = (NSDictionary *)responseObject;
        NSString *code = [resultDict newStringValueForKey:@"code"];
        if (code.integerValue <= 0) {
            NSDictionary *data = [resultDict valueObjectForKey:@"data"];
            NSString *account = [data newStringValueForKey:@"account"];
            
            self.account.text = account;
        }

    } failed:^(id responseObject, NSError *error) {

    }];
}
- (void)handleTheNickName
{
    [self.view addSubview:self.changeNickNameView];
    [ self.changeNickNameView reloadWithNickname: self.nickName.text];
    [self.changeNickNameView animationShow];
}
- (void)handleTheSign
{
    NTESSignSettingViewController *vc = [[NTESSignSettingViewController alloc] initWithNibName:nil bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
}
- (void)handleTheCopy
{
    UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
    pasteboard.string = self.account.text;
    [self.view makeToast:@"已复制".nim_localized
                     duration:2
                     position:CSToastPositionCenter];
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





- (void)handleThePhoto
{
    UIAlertController *alertVc = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];

    UIAlertAction *camera = [UIAlertAction actionWithTitle:LangKey(@"message_send_camera") style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [self requestAuthorizationForVideo];

    }];

    UIAlertAction *picture = [UIAlertAction actionWithTitle:LangKey(@"message_send_album") style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
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

    TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:5 columnNumber:4 delegate:nil pushPhotoPickerVc:YES];
    
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
    //裁剪
    imagePickerVc.allowCrop = YES;//YES和NO不影响选择视频 但是视频也不能裁剪
    imagePickerVc.needCircleCrop = YES;//是否是圆形裁剪 YES 则是圆形裁剪 NO 方形
//    // 设置竖屏下的裁剪尺寸
//    NSInteger left = 30;
//    NSInteger widthHeight = self.view.tz_width - 2 * left;
//    NSInteger top = (self.view.tz_height - widthHeight) / 2;
//    imagePickerVc.cropRect = CGRectMake(left, top, widthHeight, widthHeight);
//    imagePickerVc.scaleAspectFillCrop = YES;
   
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

#pragma mark - 到这里为止
    
    @weakify(self);
    [imagePickerVc setDidFinishPickingPhotosHandle:^(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOriginalPhoto) {
        if (photos.count > 0 && assets.count > 0) {
            @strongify(self);
            [self uploadImage:photos.firstObject];
        }
    }];
    imagePickerVc.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:imagePickerVc animated:YES completion:nil];
}


- (void)onTouchSignSetting:(id)sender{
    NTESSignSettingViewController *vc = [[NTESSignSettingViewController alloc] initWithNibName:nil bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
}


#pragma mark - NIMUserManagerDelagate
- (void)onUserInfoChanged:(NIMUser *)user
{
    if ([user.userId isEqualToString:[[NIMSDK sharedSDK].loginManager currentAccount]]) {
        [self refresh];
    }
}

#pragma mark - Private
- (void)uploadImage:(UIImage *)image{
    
    UIImage *imageForAvatarUpload = [image imageByScalingAndCroppingForSize:CGSizeMake(150, 150)];
    NSString *fileName = [NTESFileLocationHelper genFilenameWithExt:@"jpg"];
    NSString *filePath = [[NTESFileLocationHelper getAppDocumentPath] stringByAppendingPathComponent:fileName];
    NSData *data = UIImageJPEGRepresentation(imageForAvatarUpload, 0.7);
    BOOL success = data && [data writeToFile:filePath atomically:YES];
    __weak typeof(self) wself = self;
    if (success) {
        [SVProgressHUD show];
        [[NIMSDK sharedSDK].resourceManager upload:filePath progress:^(float progress) {
            NSLog(@"%.2f",progress);
        } completion:^(NSString * _Nullable urlString, NSError * _Nullable error) {
            [SVProgressHUD dismiss];
            if (!error && wself) {
                NSLog(@"urlString：%@",urlString);
                [[NIMSDK sharedSDK].userManager updateMyUserInfo:@{@(NIMUserInfoUpdateTagAvatar):urlString} completion:^(NSError *error) {
                    if (!error) {
                        SDWebImageManager *sdManager = [SDWebImageManager sharedManager];
                        [sdManager.imageCache storeImage:imageForAvatarUpload
                                               imageData:data
                                                  forKey:urlString
                                               cacheType:SDImageCacheTypeAll
                                              completion:nil];
                        [wself refresh];
                    }else{
                        [wself.view makeToast:LangKey(@"user_info_avtivity_upload_avatar_failed")
                                     duration:2
                                     position:CSToastPositionCenter];
                    }
                }];
            }else{
                [wself.view makeToast:LangKey(@"user_info_avtivity_upload_avatar_failed")
                             duration:2
                             position:CSToastPositionCenter];
            }
        }];
    }else{
        [self.view makeToast:LangKey(@"group_info_activity_update_failed")
                    duration:2
                    position:CSToastPositionCenter];
    }
}
- (KEKESetNickNameView *)changeNickNameView
{
    if(!_changeNickNameView){
        _changeNickNameView = [[KEKESetNickNameView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
//        _changeNickNameView.hidden = YES;
    }
    return _changeNickNameView;
}

@end
