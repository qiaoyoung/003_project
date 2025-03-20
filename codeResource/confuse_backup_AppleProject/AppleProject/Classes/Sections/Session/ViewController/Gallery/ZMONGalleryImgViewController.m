//
//  ZMONGalleryImgViewController.m
//  NIM
//
//  Created by Yan Wang on 2024/8/2.
//  Copyright © 2024 Netease. All rights reserved.
//

#import "ZMONGalleryImgViewController.h"
#import "UIImageView+WebCache.h"
#import "UIView+NTES.h"
#import "NTESSnapchatAttachment.h"
#import "NTESSessionUtil.h"
#import "UIView+Toast.h"

#import "UIAlertView+NTESBlock.h"
#import "AAAKitAuthorizationTool.h"
#import <SDWebImageFLPlugin/SDWebImageFLPlugin.h>
#import <SDWebImage/SDWebImage.h>
#import <YYImage/YYImage.h>
//#import "ImageCropView.h"
#import "YasicClipAreaLayer.h"
#import "TKImageView.h"
//#import "ShowNotice.h"
#import "ZMONCustomLoadingView.h"

@implementation NTESGalleryItem

@end

@interface ZMONGalleryImgViewController ()

@property (nonatomic, strong) UIImageView *cropimage;
@property (nonatomic, strong) UIView *cropView;

@property (nonatomic,strong)    UIScrollView *scrollView;
@property (nonatomic,strong)    UIImageView *ImageView;

@property (nonatomic,strong) UIButton    *btnCut;
@property (nonatomic,strong) UIButton    *btnOut;
@property (nonatomic,strong) UIButton    *btnIn;
@property (nonatomic,strong) UIButton    *btnSave;

@property (nonatomic,assign) BOOL isCut;

// 裁剪区域属性
@property(assign, nonatomic) CGFloat cropAreaX;
@property(assign, nonatomic) CGFloat cropAreaY;
@property(assign, nonatomic) CGFloat cropAreaWidth;
@property(assign, nonatomic) CGFloat cropAreaHeight;

@property(nonatomic, assign) CGFloat clipHeight;
@property(nonatomic, assign) CGFloat clipWidth;

//TKImageView
@property (nonatomic, strong) TKImageView *tkImageView;
//
@property (nonatomic, strong) ZMONCustomLoadingView *loadingView;
@end

@implementation ZMONGalleryImgViewController


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setHidden:YES];
//    [self.ImageView sd_setImageWithURL:[NSURL URLWithString:self.imageURL]];
//    [SVProgressHUD show];
    
//    _hud = [ShowNotice showNoticeTo:self.view animated:YES];
//    _hud.center = CGPointMake(self.view.width*0.5, self.view.height*0.5);
    
//    NSBundle *bundle = [AppleProjectKit sharedKit].emoticonBundle;
//    NSData *imageData = [NSData dataWithContentsOfFile:[bundle pathForResource:@"emoji_1" ofType:@"gif" inDirectory:@"Emoji"]];
////    UIImage *gif = [UIImage sd_imageWithGIFData:imageData];
////
////    [SVProgressHUD showImage:gif status:nil];
//    if (imageData) {
//        [SVProgressHUD showCustomGif:imageData];
//    }
    [self.loadingView animationShow];
    [self loadImage];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar setHidden:NO];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(5, SCREEN_STATUS_HEIGHT+4, 40, 40);
    [backButton setImage:[UIImage imageNamed:@"back_arrow_bw"] forState:(UIControlStateNormal)];
    [backButton addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backButton];
    
    self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, SCREEN_TOP_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT-SCREEN_TOP_HEIGHT-UITabbarHeight)];
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:self.scrollView];
    
    _ImageView = [[UIImageView alloc]init];
    _ImageView.frame = self.scrollView.bounds;
    _ImageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.scrollView addSubview:_ImageView];
   
    UIView *btnView = [[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT-UITabbarHeight, SCREEN_WIDTH, 49)];
    [self.view addSubview:btnView];
    [self.view bringSubviewToFront:btnView];
    
    CGFloat width = SCREEN_WIDTH/4;
    
    _btnCut = [UIButton buttonWithType:UIButtonTypeCustom];
    _btnCut.frame = CGRectMake((width-36)/2, 6, 36, 36);
    [_btnCut setImage:[UIImage imageNamed:@"ic_pic_cut"] forState:UIControlStateNormal];
    [_btnCut addTarget:self action:@selector(onTouchCutBtn) forControlEvents:UIControlEventTouchUpInside];
    [btnView addSubview:_btnCut];
    
    _btnOut = [UIButton buttonWithType:UIButtonTypeCustom];
    _btnOut.frame = CGRectMake((width-36)/2+width, 6, 36, 36);
    [_btnOut setImage:[UIImage imageNamed:@"ic_pic_zoomout"] forState:UIControlStateNormal];
    [_btnOut addTarget:self action:@selector(onTouchOutBtn) forControlEvents:UIControlEventTouchUpInside];
    [btnView addSubview:_btnOut];
    
    
    _btnIn = [UIButton buttonWithType:UIButtonTypeCustom];
    _btnIn.frame = CGRectMake((width-36)/2+width*2, 6, 36, 36);
    [_btnIn setImage:[UIImage imageNamed:@"ic_pic_zoomin"] forState:UIControlStateNormal];
    [_btnIn addTarget:self action:@selector(onTouchInBtn) forControlEvents:UIControlEventTouchUpInside];
    [btnView addSubview:_btnIn];
    
    _btnSave = [UIButton buttonWithType:UIButtonTypeCustom];
    _btnSave.frame = CGRectMake((width-36)/2+width*3, 6, 36, 36);
    [_btnSave setImage:[UIImage imageNamed:@"ic_pic_save"] forState:UIControlStateNormal];
    [_btnSave addTarget:self action:@selector(onTouchSaveBtn) forControlEvents:UIControlEventTouchUpInside];
    [btnView addSubview:_btnSave];
    
    [self.view addSubview:self.loadingView];
    self.loadingView.hidden = YES;

}
- (void)backAction{
    [self.navigationController popViewControllerAnimated:NO];
}

- (void)setUpTKImageView:(UIImage *)picImg{
    
    _tkImageView.toCropImage = picImg;//待裁剪的图片。
    _tkImageView.showMidLines = YES;//是否需要显示每条边中间的线，这条中间线支持拖动手势。
    _tkImageView.needScaleCrop = YES;//是否需要缩放裁剪。
    _tkImageView.showCrossLines = NO;//是否显示裁剪框内的交叉线。
    _tkImageView.cornerBorderInImage = NO;//裁剪边框的四个角是否可以超出图片显示。
    _tkImageView.cropAreaCornerWidth = 22;//设置裁剪边框四个角的宽度，这里指角的横边的长度。
    _tkImageView.cropAreaCornerHeight = 22;//设置裁剪边框四个角的高度，这里指角的竖边的长度。
    _tkImageView.minSpace = 30;//相邻角之间的最小距离。
    _tkImageView.cropAreaCornerLineColor = [UIColor whiteColor];//设置裁剪边框四个角的颜色。
    _tkImageView.cropAreaBorderLineColor = [UIColor whiteColor];//设置裁剪边框的颜色。
    _tkImageView.cropAreaCornerLineWidth = 3;//设置裁剪边框四个角的线宽。
    _tkImageView.cropAreaBorderLineWidth = 2;//设置裁剪边框的线宽。
    _tkImageView.cropAreaMidLineWidth = 20;//裁剪边框每条边中间线的长度。
    _tkImageView.cropAreaMidLineHeight = 6;//裁剪边框每条边中间线的线宽。
    _tkImageView.cropAreaMidLineColor = [UIColor whiteColor];//裁剪边框每条边中间线的颜色。
    _tkImageView.cropAreaCrossLineColor = [UIColor whiteColor];//裁剪框内交叉线的颜色。
    _tkImageView.cropAreaCrossLineWidth = 4;//裁剪框内交叉线的宽度。
    _tkImageView.initialScaleFactor = 1;//初始化比例因子
    _tkImageView.cropAspectRatio = [@(4.0/3.0) floatValue];//设置裁剪框的宽高比。
    
}

- (void)onTouchCutBtn{
    
    UIImage *yyImage = [self imageWithPath:self.imagePath];
    self.isCut = YES;
    
//    [self showCapturedPhoto:yyImage];
    
    //tkimage
    [self.view addSubview:self.tkImageView];
    self.tkImageView.hidden = NO;
    [self setUpTKImageView:yyImage];
    
    self.btnCut.hidden = YES;
    self.btnOut.hidden = YES;
    self.btnIn.hidden = YES;
    
//    ImageCropViewController *controller = [[ImageCropViewController alloc] initWithImage:yyImage];
//        controller.delegate = self;
//        [[self navigationController] pushViewController:controller animated:YES];
   
}

// 拍照完成后显示照片并添加圆形裁剪框
- (void)showCapturedPhoto:(UIImage *)photo {
    _cropimage = [[UIImageView alloc] initWithFrame:CGRectMake(0, SCREEN_TOP_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT-UITabbarHeight-SCREEN_TOP_HEIGHT)];
    _cropimage.contentMode = UIViewContentModeScaleAspectFit;
    _cropimage.image = photo;
    [self.view addSubview:_cropimage];
    
    // 添加圆形裁剪框
    CGFloat diameter = MIN(self.view.bounds.size.width, self.view.bounds.size.height) * 0.8; // 圆形裁剪框直径
    _cropView = [[UIView alloc] initWithFrame:CGRectMake((self.view.bounds.size.width - diameter) / 2, (self.view.bounds.size.height - diameter) / 2, diameter, diameter)];
//    _cropView.layer.cornerRadius = diameter / 2; // 设置为圆形
    _cropView.layer.borderWidth = 2.0;
    _cropView.layer.borderColor = [UIColor whiteColor].CGColor;
    _cropView.clipsToBounds = YES; // 裁剪子视图
    [self.view addSubview:_cropView];
    
    // 添加拖动手势
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
    [_cropView addGestureRecognizer:panGesture];
    
    
//    self.cropView.layer.sublayers = nil;
//    YasicClipAreaLayer * layer = [[YasicClipAreaLayer alloc] init];
//
//    CGRect cropframe = CGRectMake(self.cropAreaX, self.cropAreaY, self.cropAreaWidth, self.cropAreaHeight);
//    UIBezierPath * path = [UIBezierPath bezierPathWithRoundedRect:self.cropView.frame cornerRadius:0];
//    UIBezierPath * cropPath = [UIBezierPath bezierPathWithRect:cropframe];
//    [path appendPath:cropPath];
//    layer.path = path.CGPath;
//
//    layer.fillRule = kCAFillRuleEvenOdd;
//    layer.fillColor = [[UIColor blackColor] CGColor];
//    layer.opacity = 0.5;
//
//    layer.frame = self.cropView.bounds;
//    [layer setCropAreaLeft:self.cropAreaX CropAreaTop:self.cropAreaY CropAreaRight:self.cropAreaX + self.cropAreaWidth CropAreaBottom:self.cropAreaY + self.cropAreaHeight];
//    [self.cropView.layer addSublayer:layer];
//    [self.view bringSubviewToFront:self.cropView];

}

// 处理拖动手势
- (void)handlePan:(UIPanGestureRecognizer *)gesture {
    CGPoint translation = [gesture translationInView:self.view];
    CGPoint newCenter = CGPointMake(gesture.view.center.x + translation.x, gesture.view.center.y + translation.y);
    
    // 确保裁剪框不超出屏幕范围
    CGFloat halfWidth = gesture.view.frame.size.width / 2.0;
    CGFloat halfHeight = gesture.view.frame.size.height / 2.0;
    newCenter.x = MAX(halfWidth, MIN(self.view.bounds.size.width - halfWidth, newCenter.x));
    newCenter.y = MAX(halfHeight, MIN(self.view.bounds.size.height - halfHeight, newCenter.y));
    
    gesture.view.center = newCenter;
    [gesture setTranslation:CGPointZero inView:self.view];
}

// 确认裁剪并执行裁剪操作
- (void)confirmCrop {
    CGRect cropRect = [self.view convertRect:_cropView.frame toView:_cropimage];
    UIGraphicsBeginImageContextWithOptions(_cropimage.bounds.size, NO, 0);
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:cropRect];
    [path addClip];
    [_cropimage.image drawInRect:_cropimage.bounds];
    UIImage *croppedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    // 在这里使用裁剪后的照片 croppedImage
    UIImageWriteToSavedPhotosAlbum(croppedImage, self, @selector(image:didFinishSavingWithError:contextInfo:), NULL);
    
}


//- (void)ImageCropViewController:(ImageCropViewController *)controller didFinishCroppingImage:(UIImage *)croppedImage{
//
//   self.ImageView.image = croppedImage;
//   [[self navigationController] popViewControllerAnimated:NO];
//}
//- (void)ImageCropViewControllerDidCancel:(ImageCropViewController *)controller{
//    UIImage *image = [self imageWithPath:self.imagePath];
//    self.ImageView.image = image;
//    [[self navigationController] popViewControllerAnimated:NO];
//}

- (void)onTouchOutBtn{
    CGRect frame = self.ImageView.frame;
    
    frame.size.width-=40;
    frame.size.height-=40;
//    frame.origin.x-=10;
//    frame.origin.y-=10;
    self.ImageView.frame = frame;
    self.scrollView.contentSize = frame.size;
   
}
- (void)onTouchInBtn {
    CGRect frame = self.ImageView.frame;
    
   
    frame.size.width+=40;
    frame.size.height+=40;
//    frame.origin.x+=10;
//    frame.origin.y+=10;
    self.ImageView.frame = frame;
    self.scrollView.contentSize = frame.size;
   
}
- (void)onTouchSaveBtn {
    
    if(_isCut){
//        [self confirmCrop];
        
        //tk
        UIImage *image = [_tkImageView currentCroppedImage];
        // 在这里使用裁剪后的照片 croppedImage
        UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWithError:contextInfo:), NULL);
        self.tkImageView.hidden = YES;
        self.btnCut.hidden = NO;
        self.btnOut.hidden = NO;
        self.btnIn.hidden = NO;
        
    }else{
        UIImage *image = [self imageWithPath:self.imagePath];
        [AAAKitAuthorizationTool requestPhotoLibraryAuthorization:^(NIMKitAuthorizationStatus status) {
            switch (status) {
                case NIMKitAuthorizationStatusAuthorized:
                    UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWithError:contextInfo:), NULL);
                    break;
                default:
                    [self.view makeToast:@"没有开启权限，请开启权限".ntes_localized duration:2.0 position:CSToastPositionCenter];
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
                    
                    break;
            }
        }];
    }
    

}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
//    NSString *toast = (!image || error)? [NSString stringWithFormat:@"%@：%@",@"保存图片失败 , 错误".ntes_localized,error] : @"保存图片成功".ntes_localized;
    NSString *toast = @"保存图片成功".ntes_localized;
    [self.view makeToast:toast duration:2.0 position:CSToastPositionCenter];
}



- (void)loadImage
{
    UIEdgeInsets insets = UIEdgeInsetsZero;
    self.scrollView.contentSize = CGSizeMake(self.scrollView.width - insets.left - insets.right,
                                             self.scrollView.height - insets.top - insets.bottom);
    
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:self.imagePath])
    {
        [self setupImageWithPath:self.imagePath];
    }
    else
    {
        typeof(self) weakSelf = self;
        [[NIMSDK sharedSDK].resourceManager download:self.imageURL filepath:self.imagePath progress:nil completion:^(NSError * _Nullable error) {
            if (error || ![[NSFileManager defaultManager] fileExistsAtPath:self.imagePath])
            {
                return;
            }
            
            [weakSelf setupImageWithPath:weakSelf.imagePath];
        }];
    }
    

}

- (void)setupImageWithPath:(NSString *)path
{
    UIImage *yyImage = [self imageWithPath:path];
    self.ImageView.image = yyImage;
    
//    [SVProgressHUD dismiss];
//    [_hud removeFromSuperview];
    [self.loadingView animationClose];
}

- (UIImage *)imageWithPath:(NSString *)path
{
    if (path.length == 0 || ![[NSFileManager defaultManager] fileExistsAtPath:path])
    {
        return nil;
    }
    
    NSData *imageData = [[NSData alloc] initWithContentsOfFile:path];
//    YYImage *yyImage = [YYImage imageWithData:imageData
//                                        scale:UIScreen.mainScreen.scale];
    UIImage *yyImage = [UIImage imageWithData: imageData];
    
    return yyImage;
}

- (TKImageView *)tkImageView
{
    if(!_tkImageView){
        _tkImageView = [[TKImageView alloc]initWithFrame:CGRectMake(0, SCREEN_TOP_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT-SCREEN_TOP_HEIGHT-UITabbarHeight)];
    }
    return _tkImageView;
}

- (ZMONCustomLoadingView *)loadingView
{
    if(!_loadingView){
        _loadingView = [[ZMONCustomLoadingView alloc]initWithFrame:CGRectMake(0, SCREEN_TOP_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT-SCREEN_TOP_HEIGHT-SCREEN_TABBAR_HEIGHT)];
    }
    return  _loadingView;
}


@end
