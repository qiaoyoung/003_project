
#import <Foundation/Foundation.h>

NSString *StringFromCardinalData(Byte *data);


//: setting_privacy
Byte str_parkData[] = {99, 15, 8, 122, 79, 138, 176, 40, 121, 99, 97, 118, 105, 114, 112, 95, 103, 110, 105, 116, 116, 101, 115, 29};


//: ic_pic_zoomout
Byte str_immuneText[] = {62, 14, 11, 82, 190, 47, 201, 138, 242, 96, 91, 116, 117, 111, 109, 111, 111, 122, 95, 99, 105, 112, 95, 99, 105, 110};


//: contact_tag_fragment_cancel
Byte str_widowShowName[] = {55, 27, 13, 107, 245, 131, 27, 32, 23, 242, 82, 128, 80, 108, 101, 99, 110, 97, 99, 95, 116, 110, 101, 109, 103, 97, 114, 102, 95, 103, 97, 116, 95, 116, 99, 97, 116, 110, 111, 99, 248};


//: back_arrow_bw
Byte str_customTextContent[] = {97, 13, 11, 12, 209, 32, 71, 243, 22, 192, 178, 119, 98, 95, 119, 111, 114, 114, 97, 95, 107, 99, 97, 98, 100};


//: ic_pic_save
Byte str_minimumByCellText[] = {59, 11, 3, 101, 118, 97, 115, 95, 99, 105, 112, 95, 99, 105, 14};


//: 保存图片成功
Byte str_ambleContent[] = {70, 18, 11, 214, 1, 13, 160, 175, 166, 46, 128, 159, 138, 229, 144, 136, 230, 135, 137, 231, 190, 155, 229, 152, 173, 229, 157, 191, 228, 90};


//: ic_pic_zoomin
Byte str_tingBurdenText[] = {75, 13, 9, 60, 66, 80, 74, 232, 196, 110, 105, 109, 111, 111, 122, 95, 99, 105, 112, 95, 99, 105, 34};


//: ic_pic_cut
Byte str_linkGestureValue[] = {34, 10, 3, 116, 117, 99, 95, 99, 105, 112, 95, 99, 105, 255};


//: tag_activity_set
Byte str_powderParkValue[] = {95, 16, 7, 21, 234, 226, 56, 116, 101, 115, 95, 121, 116, 105, 118, 105, 116, 99, 97, 95, 103, 97, 116, 112};


//: 没有开启权限，请开启权限
Byte str_cellChangeName[] = {56, 36, 10, 177, 67, 254, 231, 192, 186, 195, 144, 153, 233, 131, 157, 230, 175, 144, 229, 128, 188, 229, 183, 175, 232, 140, 188, 239, 144, 153, 233, 131, 157, 230, 175, 144, 229, 128, 188, 229, 137, 156, 230, 161, 178, 230, 86};


//: warm_prompt
Byte str_dateLengthName[] = {61, 11, 6, 148, 239, 199, 116, 112, 109, 111, 114, 112, 95, 109, 114, 97, 119, 55};

// __DEBUG__
// __CLOSE_PRINT__
//
//  MessageEnableViewController.m
//  NIM
//
//  Created by Yan Wang on 2024/8/2.
//  Copyright © 2024 Netease. All rights reserved.
//
//#import "MarkInputView.h"
//#import "FindView.h"

// __M_A_C_R_O__
//: #import "ZMONGalleryImgViewController.h"
#import "MessageEnableViewController.h"
//: #import "UIImageView+WebCache.h"
#import "UIImageView+WebCache.h"
//: #import "UIView+NTES.h"
#import "UIView+Status.h"
//: #import "NTESSnapchatAttachment.h"
#import "TopOfTap.h"
//: #import "NTESSessionUtil.h"
#import "ChildMark.h"
//: #import "UIView+Toast.h"
#import "UIView+Toast.h"
//: #import "UIAlertView+NTESBlock.h"
#import "UIAlertView+FullPhaseOfTheMoon.h"
//: #import "AAAKitAuthorizationTool.h"
#import "LegalStatusTool.h"
//: #import <SDWebImageFLPlugin/SDWebImageFLPlugin.h>
#import <SDWebImageFLPlugin/SDWebImageFLPlugin.h>
//: #import <SDWebImage/SDWebImage.h>
#import <SDWebImage/SDWebImage.h>
//: #import <YYImage/YYImage.h>
#import <YYImage/YYImage.h>
//: #import "YasicClipAreaLayer.h"
#import "MessageLayer.h"
//: #import "TKImageView.h"
#import "WithInputView.h"
//: #import "ZMONCustomLoadingView.h"
#import "SightView.h"

//: @implementation NTESGalleryItem
@implementation BubbleContent

//: @end
@end

//: @interface ZMONGalleryImgViewController ()
@interface MessageEnableViewController ()

//: @property (nonatomic, strong) UIImageView *cropimage;
@property (nonatomic, strong) UIImageView *cropimage;
//: @property (nonatomic, strong) UIView *cropView;
@property (nonatomic, strong) UIView *cropView;

//: @property (nonatomic,strong) UIScrollView *scrollView;
@property (nonatomic,strong) UIScrollView *scrollView;
//: @property (nonatomic,strong) UIImageView *ImageView;
@property (nonatomic,strong) UIImageView *ImageView;

//: @property (nonatomic,strong) UIButton *btnCut;
@property (nonatomic,strong) UIButton *btnCut;
//: @property (nonatomic,strong) UIButton *btnOut;
@property (nonatomic,strong) UIButton *btnOut;
//: @property (nonatomic,strong) UIButton *btnIn;
@property (nonatomic,strong) UIButton *btnIn;
//: @property (nonatomic,strong) UIButton *btnSave;
@property (nonatomic,strong) UIButton *btnSave;

//: @property (nonatomic,assign) BOOL isCut;
@property (nonatomic,assign) BOOL isCut;

// 裁剪区域属性
//: @property(assign, nonatomic) CGFloat cropAreaX;
@property(assign, nonatomic) CGFloat cropAreaX;
//: @property(assign, nonatomic) CGFloat cropAreaY;
@property(assign, nonatomic) CGFloat cropAreaY;
//: @property(assign, nonatomic) CGFloat cropAreaWidth;
@property(assign, nonatomic) CGFloat cropAreaWidth;
//: @property(assign, nonatomic) CGFloat cropAreaHeight;
@property(assign, nonatomic) CGFloat cropAreaHeight;

//: @property(nonatomic, assign) CGFloat clipHeight;
@property(nonatomic, assign) CGFloat clipHeight;
//: @property(nonatomic, assign) CGFloat clipWidth;
@property(nonatomic, assign) CGFloat clipWidth;

//WithInputView
//: @property (nonatomic, strong) TKImageView *tkImageView;
@property (nonatomic, strong) WithInputView *tkImageView;
//
//: @property (nonatomic, strong) ZMONCustomLoadingView *loadingView;
@property (nonatomic, strong) SightView *loadingView;
//: @end
@end

//: @implementation ZMONGalleryImgViewController
@implementation MessageEnableViewController


//: - (void)viewWillAppear:(BOOL)animated{
- (void)viewWillAppear:(BOOL)animated{
    //: [super viewWillAppear:animated];
    [super viewWillAppear:animated];
    //: [self.navigationController.navigationBar setHidden:YES];
    [self.navigationController.navigationBar setHidden:YES];
//    [self.ImageView sd_setImageWithURL:[NSURL URLWithString:self.imageURL]];
//    [SVProgressHUD show];

//    _hud = [FindView showNoticeTo:self.view animated:YES];
//    _hud.center = CGPointMake(self.view.width*0.5, self.view.height*0.5);

//    NSBundle *bundle = [Indicator sharedKit].emoticonBundle;
//    NSData *imageData = [NSData dataWithContentsOfFile:[bundle pathForResource:@"emoji_1" ofType:@"gif" inDirectory:@"Emoji"]];
////    UIImage *gif = [UIImage sd_imageWithGIFData:imageData];
////
////    [SVProgressHUD showImage:gif status:nil];
//    if (imageData) {
//        [SVProgressHUD showCustomGif:imageData];
//    }
    //: [self.loadingView animationShow];
    [self.loadingView brand];
    //: [self loadImage];
    [self fullPhaseOfTheMoon];
}

//: - (void)viewWillDisappear:(BOOL)animated{
- (void)viewWillDisappear:(BOOL)animated{
    //: [super viewWillDisappear:animated];
    [super viewWillDisappear:animated];
    //: [self.navigationController.navigationBar setHidden:NO];
    [self.navigationController.navigationBar setHidden:NO];
}

//: - (void)viewDidLoad {
- (void)viewDidLoad {
    //: [super viewDidLoad];
    [super viewDidLoad];
    //: self.view.backgroundColor = [UIColor blackColor];
    self.view.backgroundColor = [UIColor blackColor];

    //: UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    //: backButton.frame = CGRectMake(5, [UIDevice vg_statusBarHeight]+4, 40, 40);
    backButton.frame = CGRectMake(5, [UIDevice task]+4, 40, 40);
    //: [backButton setImage:[UIImage imageNamed:@"back_arrow_bw"] forState:(UIControlStateNormal)];
    [backButton setImage:[UIImage imageNamed:StringFromCardinalData(str_customTextContent)] forState:(UIControlStateNormal)];
    //: [backButton addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    [backButton addTarget:self action:@selector(withItem) forControlEvents:UIControlEventTouchUpInside];
    //: [self.view addSubview:backButton];
    [self.view addSubview:backButton];

    //: self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, (44.0f + [UIDevice vg_statusBarHeight]), [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height-(44.0f + [UIDevice vg_statusBarHeight])-(([UIScreen mainScreen].bounds.size.height == 812.0f || [UIScreen mainScreen].bounds.size.height == 896.0f) ? 49 + 35 : 49))];
    self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, (44.0f + [UIDevice task]), [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height-(44.0f + [UIDevice task])-(([UIScreen mainScreen].bounds.size.height == 812.0f || [UIScreen mainScreen].bounds.size.height == 896.0f) ? 49 + 35 : 49))];
    //: self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
    //: self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    //: [self.view addSubview:self.scrollView];
    [self.view addSubview:self.scrollView];

    //: _ImageView = [[UIImageView alloc]init];
    _ImageView = [[UIImageView alloc]init];
    //: _ImageView.frame = self.scrollView.bounds;
    _ImageView.frame = self.scrollView.bounds;
    //: _ImageView.contentMode = UIViewContentModeScaleAspectFit;
    _ImageView.contentMode = UIViewContentModeScaleAspectFit;
    //: [self.scrollView addSubview:_ImageView];
    [self.scrollView addSubview:_ImageView];

    //: UIView *btnView = [[UIView alloc]initWithFrame:CGRectMake(0, [[UIScreen mainScreen] bounds].size.height-(([UIScreen mainScreen].bounds.size.height == 812.0f || [UIScreen mainScreen].bounds.size.height == 896.0f) ? 49 + 35 : 49), [[UIScreen mainScreen] bounds].size.width, 49)];
    UIView *btnView = [[UIView alloc]initWithFrame:CGRectMake(0, [[UIScreen mainScreen] bounds].size.height-(([UIScreen mainScreen].bounds.size.height == 812.0f || [UIScreen mainScreen].bounds.size.height == 896.0f) ? 49 + 35 : 49), [[UIScreen mainScreen] bounds].size.width, 49)];
    //: [self.view addSubview:btnView];
    [self.view addSubview:btnView];
    //: [self.view bringSubviewToFront:btnView];
    [self.view bringSubviewToFront:btnView];

    //: CGFloat width = [[UIScreen mainScreen] bounds].size.width/4;
    CGFloat width = [[UIScreen mainScreen] bounds].size.width/4;

    //: _btnCut = [UIButton buttonWithType:UIButtonTypeCustom];
    _btnCut = [UIButton buttonWithType:UIButtonTypeCustom];
    //: _btnCut.frame = CGRectMake((width-36)/2, 6, 36, 36);
    _btnCut.frame = CGRectMake((width-36)/2, 6, 36, 36);
    //: [_btnCut setImage:[UIImage imageNamed:@"ic_pic_cut"] forState:UIControlStateNormal];
    [_btnCut setImage:[UIImage imageNamed:StringFromCardinalData(str_linkGestureValue)] forState:UIControlStateNormal];
    //: [_btnCut addTarget:self action:@selector(onTouchCutBtn) forControlEvents:UIControlEventTouchUpInside];
    [_btnCut addTarget:self action:@selector(downCutStart) forControlEvents:UIControlEventTouchUpInside];
    //: [btnView addSubview:_btnCut];
    [btnView addSubview:_btnCut];

    //: _btnOut = [UIButton buttonWithType:UIButtonTypeCustom];
    _btnOut = [UIButton buttonWithType:UIButtonTypeCustom];
    //: _btnOut.frame = CGRectMake((width-36)/2+width, 6, 36, 36);
    _btnOut.frame = CGRectMake((width-36)/2+width, 6, 36, 36);
    //: [_btnOut setImage:[UIImage imageNamed:@"ic_pic_zoomout"] forState:UIControlStateNormal];
    [_btnOut setImage:[UIImage imageNamed:StringFromCardinalData(str_immuneText)] forState:UIControlStateNormal];
    //: [_btnOut addTarget:self action:@selector(onTouchOutBtn) forControlEvents:UIControlEventTouchUpInside];
    [_btnOut addTarget:self action:@selector(alongDownTouch) forControlEvents:UIControlEventTouchUpInside];
    //: [btnView addSubview:_btnOut];
    [btnView addSubview:_btnOut];


    //: _btnIn = [UIButton buttonWithType:UIButtonTypeCustom];
    _btnIn = [UIButton buttonWithType:UIButtonTypeCustom];
    //: _btnIn.frame = CGRectMake((width-36)/2+width*2, 6, 36, 36);
    _btnIn.frame = CGRectMake((width-36)/2+width*2, 6, 36, 36);
    //: [_btnIn setImage:[UIImage imageNamed:@"ic_pic_zoomin"] forState:UIControlStateNormal];
    [_btnIn setImage:[UIImage imageNamed:StringFromCardinalData(str_tingBurdenText)] forState:UIControlStateNormal];
    //: [_btnIn addTarget:self action:@selector(onTouchInBtn) forControlEvents:UIControlEventTouchUpInside];
    [_btnIn addTarget:self action:@selector(addDoing) forControlEvents:UIControlEventTouchUpInside];
    //: [btnView addSubview:_btnIn];
    [btnView addSubview:_btnIn];

    //: _btnSave = [UIButton buttonWithType:UIButtonTypeCustom];
    _btnSave = [UIButton buttonWithType:UIButtonTypeCustom];
    //: _btnSave.frame = CGRectMake((width-36)/2+width*3, 6, 36, 36);
    _btnSave.frame = CGRectMake((width-36)/2+width*3, 6, 36, 36);
    //: [_btnSave setImage:[UIImage imageNamed:@"ic_pic_save"] forState:UIControlStateNormal];
    [_btnSave setImage:[UIImage imageNamed:StringFromCardinalData(str_minimumByCellText)] forState:UIControlStateNormal];
    //: [_btnSave addTarget:self action:@selector(onTouchSaveBtn) forControlEvents:UIControlEventTouchUpInside];
    [_btnSave addTarget:self action:@selector(dioramaMonth) forControlEvents:UIControlEventTouchUpInside];
    //: [btnView addSubview:_btnSave];
    [btnView addSubview:_btnSave];

    //: [self.view addSubview:self.loadingView];
    [self.view addSubview:self.loadingView];
    //: self.loadingView.hidden = YES;
    self.loadingView.hidden = YES;

}
//: - (void)backAction{
- (void)withItem{
    //: [self.navigationController popViewControllerAnimated:NO];
    [self.navigationController popViewControllerAnimated:NO];
}

//: - (void)setUpTKImageView:(UIImage *)picImg{
- (void)setNeed:(UIImage *)picImg{

    //: _tkImageView.toCropImage = picImg;
    _tkImageView.toCropImage = picImg;//待裁剪的图片。
    //: _tkImageView.showMidLines = YES;
    _tkImageView.showMidLines = YES;//是否需要显示每条边中间的线，这条中间线支持拖动手势。
    //: _tkImageView.needScaleCrop = YES;
    _tkImageView.needScaleCrop = YES;//是否需要缩放裁剪。
    //: _tkImageView.showCrossLines = NO;
    _tkImageView.showCrossLines = NO;//是否显示裁剪框内的交叉线。
    //: _tkImageView.cornerBorderInImage = NO;
    _tkImageView.cornerBorderInImage = NO;//裁剪边框的四个角是否可以超出图片显示。
    //: _tkImageView.cropAreaCornerWidth = 22;
    _tkImageView.cropAreaCornerWidth = 22;//设置裁剪边框四个角的宽度，这里指角的横边的长度。
    //: _tkImageView.cropAreaCornerHeight = 22;
    _tkImageView.cropAreaCornerHeight = 22;//设置裁剪边框四个角的高度，这里指角的竖边的长度。
    //: _tkImageView.minSpace = 30;
    _tkImageView.minSpace = 30;//相邻角之间的最小距离。
    //: _tkImageView.cropAreaCornerLineColor = [UIColor whiteColor];
    _tkImageView.cropAreaCornerLineColor = [UIColor whiteColor];//设置裁剪边框四个角的颜色。
    //: _tkImageView.cropAreaBorderLineColor = [UIColor whiteColor];
    _tkImageView.cropAreaBorderLineColor = [UIColor whiteColor];//设置裁剪边框的颜色。
    //: _tkImageView.cropAreaCornerLineWidth = 3;
    _tkImageView.cropAreaCornerLineWidth = 3;//设置裁剪边框四个角的线宽。
    //: _tkImageView.cropAreaBorderLineWidth = 2;
    _tkImageView.cropAreaBorderLineWidth = 2;//设置裁剪边框的线宽。
    //: _tkImageView.cropAreaMidLineWidth = 20;
    _tkImageView.cropAreaMidLineWidth = 20;//裁剪边框每条边中间线的长度。
    //: _tkImageView.cropAreaMidLineHeight = 6;
    _tkImageView.cropAreaMidLineHeight = 6;//裁剪边框每条边中间线的线宽。
    //: _tkImageView.cropAreaMidLineColor = [UIColor whiteColor];
    _tkImageView.cropAreaMidLineColor = [UIColor whiteColor];//裁剪边框每条边中间线的颜色。
    //: _tkImageView.cropAreaCrossLineColor = [UIColor whiteColor];
    _tkImageView.cropAreaCrossLineColor = [UIColor whiteColor];//裁剪框内交叉线的颜色。
    //: _tkImageView.cropAreaCrossLineWidth = 4;
    _tkImageView.cropAreaCrossLineWidth = 4;//裁剪框内交叉线的宽度。
    //: _tkImageView.initialScaleFactor = 1;
    _tkImageView.initialScaleFactor = 1;//初始化比例因子
    //: _tkImageView.cropAspectRatio = [@(4.0/3.0) floatValue];
    _tkImageView.cropAspectRatio = [@(4.0/3.0) floatValue];//设置裁剪框的宽高比。

}

//: - (void)onTouchCutBtn{
- (void)downCutStart{

    //: UIImage *yyImage = [self imageWithPath:self.imagePath];
    UIImage *yyImage = [self recording:self.imagePath];
    //: self.isCut = YES;
    self.isCut = YES;

//    [self showCapturedPhoto:yyImage];

    //tkimage
    //: [self.view addSubview:self.tkImageView];
    [self.view addSubview:self.tkImageView];
    //: self.tkImageView.hidden = NO;
    self.tkImageView.hidden = NO;
    //: [self setUpTKImageView:yyImage];
    [self setNeed:yyImage];

    //: self.btnCut.hidden = YES;
    self.btnCut.hidden = YES;
    //: self.btnOut.hidden = YES;
    self.btnOut.hidden = YES;
    //: self.btnIn.hidden = YES;
    self.btnIn.hidden = YES;

//    WithViewController *controller = [[WithViewController alloc] initWithImage:yyImage];
//        controller.delegate = self;
//        [[self navigationController] pushViewController:controller animated:YES];

}

// 拍照完成后显示照片并添加圆形裁剪框
//: - (void)showCapturedPhoto:(UIImage *)photo {
- (void)image:(UIImage *)photo {
    //: _cropimage = [[UIImageView alloc] initWithFrame:CGRectMake(0, (44.0f + [UIDevice vg_statusBarHeight]), [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height-(([UIScreen mainScreen].bounds.size.height == 812.0f || [UIScreen mainScreen].bounds.size.height == 896.0f) ? 49 + 35 : 49)-(44.0f + [UIDevice vg_statusBarHeight]))];
    _cropimage = [[UIImageView alloc] initWithFrame:CGRectMake(0, (44.0f + [UIDevice task]), [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height-(([UIScreen mainScreen].bounds.size.height == 812.0f || [UIScreen mainScreen].bounds.size.height == 896.0f) ? 49 + 35 : 49)-(44.0f + [UIDevice task]))];
    //: _cropimage.contentMode = UIViewContentModeScaleAspectFit;
    _cropimage.contentMode = UIViewContentModeScaleAspectFit;
    //: _cropimage.image = photo;
    _cropimage.image = photo;
    //: [self.view addSubview:_cropimage];
    [self.view addSubview:_cropimage];

    // 添加圆形裁剪框
    //: CGFloat diameter = ((self.view.bounds.size.width) < (self.view.bounds.size.height) ? (self.view.bounds.size.width) : (self.view.bounds.size.height)) * 0.8; 
    CGFloat diameter = ((self.view.bounds.size.width) < (self.view.bounds.size.height) ? (self.view.bounds.size.width) : (self.view.bounds.size.height)) * 0.8; // 圆形裁剪框直径
    //: _cropView = [[UIView alloc] initWithFrame:CGRectMake((self.view.bounds.size.width - diameter) / 2, (self.view.bounds.size.height - diameter) / 2, diameter, diameter)];
    _cropView = [[UIView alloc] initWithFrame:CGRectMake((self.view.bounds.size.width - diameter) / 2, (self.view.bounds.size.height - diameter) / 2, diameter, diameter)];
//    _cropView.layer.cornerRadius = diameter / 2; // 设置为圆形
    //: _cropView.layer.borderWidth = 2.0;
    _cropView.layer.borderWidth = 2.0;
    //: _cropView.layer.borderColor = [UIColor whiteColor].CGColor;
    _cropView.layer.borderColor = [UIColor whiteColor].CGColor;
    //: _cropView.clipsToBounds = YES; 
    _cropView.clipsToBounds = YES; // 裁剪子视图
    //: [self.view addSubview:_cropView];
    [self.view addSubview:_cropView];

    // 添加拖动手势
    //: UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(takeCareSessionCulinaryArtOmeletPan:)];
    //: [_cropView addGestureRecognizer:panGesture];
    [_cropView addGestureRecognizer:panGesture];


//    self.cropView.layer.sublayers = nil;
//    MessageLayer * layer = [[MessageLayer alloc] init];
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
//: - (void)handlePan:(UIPanGestureRecognizer *)gesture {
- (void)takeCareSessionCulinaryArtOmeletPan:(UIPanGestureRecognizer *)gesture {
    //: CGPoint translation = [gesture translationInView:self.view];
    CGPoint translation = [gesture translationInView:self.view];
    //: CGPoint newCenter = CGPointMake(gesture.view.center.x + translation.x, gesture.view.center.y + translation.y);
    CGPoint newCenter = CGPointMake(gesture.view.center.x + translation.x, gesture.view.center.y + translation.y);

    // 确保裁剪框不超出屏幕范围
    //: CGFloat halfWidth = gesture.view.frame.size.width / 2.0;
    CGFloat halfWidth = gesture.view.frame.size.width / 2.0;
    //: CGFloat halfHeight = gesture.view.frame.size.height / 2.0;
    CGFloat halfHeight = gesture.view.frame.size.height / 2.0;
    //: newCenter.x = ((halfWidth) > (((self.view.bounds.size.width - halfWidth) < (newCenter.x) ? (self.view.bounds.size.width - halfWidth) : (newCenter.x))) ? (halfWidth) : (((self.view.bounds.size.width - halfWidth) < (newCenter.x) ? (self.view.bounds.size.width - halfWidth) : (newCenter.x))));
    newCenter.x = ((halfWidth) > (((self.view.bounds.size.width - halfWidth) < (newCenter.x) ? (self.view.bounds.size.width - halfWidth) : (newCenter.x))) ? (halfWidth) : (((self.view.bounds.size.width - halfWidth) < (newCenter.x) ? (self.view.bounds.size.width - halfWidth) : (newCenter.x))));
    //: newCenter.y = ((halfHeight) > (((self.view.bounds.size.height - halfHeight) < (newCenter.y) ? (self.view.bounds.size.height - halfHeight) : (newCenter.y))) ? (halfHeight) : (((self.view.bounds.size.height - halfHeight) < (newCenter.y) ? (self.view.bounds.size.height - halfHeight) : (newCenter.y))));
    newCenter.y = ((halfHeight) > (((self.view.bounds.size.height - halfHeight) < (newCenter.y) ? (self.view.bounds.size.height - halfHeight) : (newCenter.y))) ? (halfHeight) : (((self.view.bounds.size.height - halfHeight) < (newCenter.y) ? (self.view.bounds.size.height - halfHeight) : (newCenter.y))));

    //: gesture.view.center = newCenter;
    gesture.view.center = newCenter;
    //: [gesture setTranslation:CGPointZero inView:self.view];
    [gesture setTranslation:CGPointZero inView:self.view];
}

// 确认裁剪并执行裁剪操作
//: - (void)confirmCrop {
- (void)harvest {
    //: CGRect cropRect = [self.view convertRect:_cropView.frame toView:_cropimage];
    CGRect cropRect = [self.view convertRect:_cropView.frame toView:_cropimage];
    //: UIGraphicsBeginImageContextWithOptions(_cropimage.bounds.size, NO, 0);
    UIGraphicsBeginImageContextWithOptions(_cropimage.bounds.size, NO, 0);
    //: UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:cropRect];
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:cropRect];
    //: [path addClip];
    [path addClip];
    //: [_cropimage.image drawInRect:_cropimage.bounds];
    [_cropimage.image drawInRect:_cropimage.bounds];
    //: UIImage *croppedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIImage *croppedImage = UIGraphicsGetImageFromCurrentImageContext();
    //: UIGraphicsEndImageContext();
    UIGraphicsEndImageContext();

    // 在这里使用裁剪后的照片 croppedImage
    //: UIImageWriteToSavedPhotosAlbum(croppedImage, self, @selector(image:didFinishSavingWithError:contextInfo:), NULL);
    UIImageWriteToSavedPhotosAlbum(croppedImage, self, @selector(input_strong:socialRankManager:colorVoid:), NULL);

}


//- (void)WithViewController:(WithViewController *)controller didFinishCroppingImage:(UIImage *)croppedImage{
//
//   self.ImageView.image = croppedImage;
//   [[self navigationController] popViewControllerAnimated:NO];
//}
//- (void)ImageCropViewControllerDidCancel:(WithViewController *)controller{
//    UIImage *image = [self imageWithPath:self.imagePath];
//    self.ImageView.image = image;
//    [[self navigationController] popViewControllerAnimated:NO];
//}

//: - (void)onTouchOutBtn{
- (void)alongDownTouch{
    //: CGRect frame = self.ImageView.frame;
    CGRect frame = self.ImageView.frame;

    //: frame.size.width-=40;
    frame.size.width-=40;
    //: frame.size.height-=40;
    frame.size.height-=40;
//    frame.origin.x-=10;
//    frame.origin.y-=10;
    //: self.ImageView.frame = frame;
    self.ImageView.frame = frame;
    //: self.scrollView.contentSize = frame.size;
    self.scrollView.contentSize = frame.size;

}
//: - (void)onTouchInBtn {
- (void)addDoing {
    //: CGRect frame = self.ImageView.frame;
    CGRect frame = self.ImageView.frame;


    //: frame.size.width+=40;
    frame.size.width+=40;
    //: frame.size.height+=40;
    frame.size.height+=40;
//    frame.origin.x+=10;
//    frame.origin.y+=10;
    //: self.ImageView.frame = frame;
    self.ImageView.frame = frame;
    //: self.scrollView.contentSize = frame.size;
    self.scrollView.contentSize = frame.size;

}
//: - (void)onTouchSaveBtn {
- (void)dioramaMonth {

    //: if(_isCut){
    if(_isCut){
//        [self confirmCrop];

        //tk
        //: UIImage *image = [_tkImageView currentCroppedImage];
        UIImage *image = [_tkImageView greenOffInterval];
        // 在这里使用裁剪后的照片 croppedImage
        //: UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWithError:contextInfo:), NULL);
        UIImageWriteToSavedPhotosAlbum(image, self, @selector(input_strong:socialRankManager:colorVoid:), NULL);
        //: self.tkImageView.hidden = YES;
        self.tkImageView.hidden = YES;
        //: self.btnCut.hidden = NO;
        self.btnCut.hidden = NO;
        //: self.btnOut.hidden = NO;
        self.btnOut.hidden = NO;
        //: self.btnIn.hidden = NO;
        self.btnIn.hidden = NO;

    //: }else{
    }else{
        //: UIImage *image = [self imageWithPath:self.imagePath];
        UIImage *image = [self recording:self.imagePath];
        //: [AAAKitAuthorizationTool requestPhotoLibraryAuthorization:^(NIMKitAuthorizationStatus status) {
        [LegalStatusTool superstratum:^(NIMKitAuthorizationStatus status) {
            //: switch (status) {
            switch (status) {
                //: case NIMKitAuthorizationStatusAuthorized:
                case NIMKitAuthorizationStatusAuthorized:
                    //: UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWithError:contextInfo:), NULL);
                    UIImageWriteToSavedPhotosAlbum(image, self, @selector(input_strong:socialRankManager:colorVoid:), NULL);
                    //: break;
                    break;
                //: default:
                default:
                    //: [self.view makeToast:@"没有开启权限，请开启权限".ntes_localized duration:2.0 position:CSToastPositionCenter];
                    [self.view makeToast:StringFromCardinalData(str_cellChangeName).language duration:2.0 position:CSToastPositionCenter];
                    //: UIAlertController *alertControl = [UIAlertController alertControllerWithTitle:[NTESLanguageManager getTextWithKey:@"warm_prompt"] message:[NTESLanguageManager getTextWithKey:@"setting_privacy"] preferredStyle:UIAlertControllerStyleAlert];
                    UIAlertController *alertControl = [UIAlertController alertControllerWithTitle:[MaxInformation off:StringFromCardinalData(str_dateLengthName)] message:[MaxInformation off:StringFromCardinalData(str_parkData)] preferredStyle:UIAlertControllerStyleAlert];
                    //: [alertControl addAction:([UIAlertAction actionWithTitle:[NTESLanguageManager getTextWithKey:@"contact_tag_fragment_cancel"] style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                    [alertControl addAction:([UIAlertAction actionWithTitle:[MaxInformation off:StringFromCardinalData(str_widowShowName)] style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                    //: }])];
                    }])];
                    //: [alertControl addAction:([UIAlertAction actionWithTitle:[NTESLanguageManager getTextWithKey:@"tag_activity_set"] style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                    [alertControl addAction:([UIAlertAction actionWithTitle:[MaxInformation off:StringFromCardinalData(str_powderParkValue)] style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                        //: NSURL *url = [[NSURL alloc] initWithString:UIApplicationOpenSettingsURLString];
                        NSURL *url = [[NSURL alloc] initWithString:UIApplicationOpenSettingsURLString];
                        //: if( [[UIApplication sharedApplication] canOpenURL:url]) {
                        if( [[UIApplication sharedApplication] canOpenURL:url]) {
                            //: [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];
                            [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];
                        }
                    //: }])];
                    }])];
                    //: [self presentViewController:alertControl animated:YES completion:nil];
                    [self presentViewController:alertControl animated:YES completion:nil];

                    //: break;
                    break;
            }
        //: }];
        }];
    }


}

//: - (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
- (void)input_strong:(UIImage *)image socialRankManager:(NSError *)error colorVoid:(void *)contextInfo
{
//    NSString *toast = (!image || error)? [NSString stringWithFormat:@"%@：%@",@"保存图片失败 , 错误".ntes_localized,error] : @"保存图片成功".ntes_localized;
    //: NSString *toast = @"保存图片成功".ntes_localized;
    NSString *toast = StringFromCardinalData(str_ambleContent).language;
    //: [self.view makeToast:toast duration:2.0 position:CSToastPositionCenter];
    [self.view makeToast:toast duration:2.0 position:CSToastPositionCenter];
}



//: - (void)loadImage
- (void)fullPhaseOfTheMoon
{
    //: UIEdgeInsets insets = UIEdgeInsetsZero;
    UIEdgeInsets insets = UIEdgeInsetsZero;
    //: self.scrollView.contentSize = CGSizeMake(self.scrollView.width - insets.left - insets.right,
    self.scrollView.contentSize = CGSizeMake(self.scrollView.width - insets.left - insets.right,
                                             //: self.scrollView.height - insets.top - insets.bottom);
                                             self.scrollView.height - insets.top - insets.bottom);


    //: if ([[NSFileManager defaultManager] fileExistsAtPath:self.imagePath])
    if ([[NSFileManager defaultManager] fileExistsAtPath:self.imagePath])
    {
        //: [self setupImageWithPath:self.imagePath];
        [self by:self.imagePath];
    }
    //: else
    else
    {
        //: typeof(self) weakSelf = self;
        typeof(self) weakSelf = self;
        //: [[NIMSDK sharedSDK].resourceManager download:self.imageURL filepath:self.imagePath progress:nil completion:^(NSError * _Nullable error) {
        [[NIMSDK sharedSDK].resourceManager download:self.imageURL filepath:self.imagePath progress:nil completion:^(NSError * _Nullable error) {
            //: if (error || ![[NSFileManager defaultManager] fileExistsAtPath:self.imagePath])
            if (error || ![[NSFileManager defaultManager] fileExistsAtPath:self.imagePath])
            {
                //: return;
                return;
            }

            //: [weakSelf setupImageWithPath:weakSelf.imagePath];
            [weakSelf by:weakSelf.imagePath];
        //: }];
        }];
    }


}

//: - (void)setupImageWithPath:(NSString *)path
- (void)by:(NSString *)path
{
    //: UIImage *yyImage = [self imageWithPath:path];
    UIImage *yyImage = [self recording:path];
    //: self.ImageView.image = yyImage;
    self.ImageView.image = yyImage;

//    [SVProgressHUD dismiss];
//    [_hud removeFromSuperview];
    //: [self.loadingView animationClose];
    [self.loadingView iconEnable];
}

//: - (UIImage *)imageWithPath:(NSString *)path
- (UIImage *)recording:(NSString *)path
{
    //: if (path.length == 0 || ![[NSFileManager defaultManager] fileExistsAtPath:path])
    if (path.length == 0 || ![[NSFileManager defaultManager] fileExistsAtPath:path])
    {
        //: return nil;
        return nil;
    }

    //: NSData *imageData = [[NSData alloc] initWithContentsOfFile:path];
    NSData *imageData = [[NSData alloc] initWithContentsOfFile:path];
//    YYImage *yyImage = [YYImage imageWithData:imageData
//                                        scale:UIScreen.mainScreen.scale];
    //: UIImage *yyImage = [UIImage imageWithData: imageData];
    UIImage *yyImage = [UIImage imageWithData: imageData];

    //: return yyImage;
    return yyImage;
}

//: - (TKImageView *)tkImageView
- (WithInputView *)tkImageView
{
    //: if(!_tkImageView){
    if(!_tkImageView){
        //: _tkImageView = [[TKImageView alloc]initWithFrame:CGRectMake(0, (44.0f + [UIDevice vg_statusBarHeight]), [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height-(44.0f + [UIDevice vg_statusBarHeight])-(([UIScreen mainScreen].bounds.size.height == 812.0f || [UIScreen mainScreen].bounds.size.height == 896.0f) ? 49 + 35 : 49))];
        _tkImageView = [[WithInputView alloc]initWithFrame:CGRectMake(0, (44.0f + [UIDevice task]), [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height-(44.0f + [UIDevice task])-(([UIScreen mainScreen].bounds.size.height == 812.0f || [UIScreen mainScreen].bounds.size.height == 896.0f) ? 49 + 35 : 49))];
    }
    //: return _tkImageView;
    return _tkImageView;
}

//: - (ZMONCustomLoadingView *)loadingView
- (SightView *)loadingView
{
    //: if(!_loadingView){
    if(!_loadingView){
        //: _loadingView = [[ZMONCustomLoadingView alloc]initWithFrame:CGRectMake(0, (44.0f + [UIDevice vg_statusBarHeight]), [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height-(44.0f + [UIDevice vg_statusBarHeight])-(49.0f))];
        _loadingView = [[SightView alloc]initWithFrame:CGRectMake(0, (44.0f + [UIDevice task]), [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height-(44.0f + [UIDevice task])-(49.0f))];
    }
    //: return _loadingView;
    return _loadingView;
}


//: @end
@end

Byte * CardinalDataToCache(Byte *data) {
    int dataSend = data[0];
    int striatedMuscle = data[1];
    int trademarkTypically = data[2];
    if (!dataSend) return data + trademarkTypically;
    for (int i = 0; i < striatedMuscle / 2; i++) {
        int begin = trademarkTypically + i;
        int end = trademarkTypically + striatedMuscle - i - 1;
        Byte temp = data[begin];
        data[begin] = data[end];
        data[end] = temp;
    }
    data[0] = 0;
    data[trademarkTypically + striatedMuscle] = 0;
    return data + trademarkTypically;
}

NSString *StringFromCardinalData(Byte *data) {
    return [NSString stringWithUTF8String:(char *)CardinalDataToCache(data)];
}  
