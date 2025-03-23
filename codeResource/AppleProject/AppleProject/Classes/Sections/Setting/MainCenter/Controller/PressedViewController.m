
#import <Foundation/Foundation.h>

NSString *StringFromAttractData(Byte *data);        


//: icon_checkbox_selected
Byte str_improvementText[] = {81, 22, 31, 13, 173, 81, 245, 210, 22, 143, 85, 95, 119, 74, 68, 80, 79, 64, 68, 73, 70, 68, 76, 67, 80, 89, 64, 84, 70, 77, 70, 68, 85, 70, 69, 139};


//: report_info
Byte str_lowFrameName[] = {2, 11, 18, 11, 87, 150, 210, 54, 89, 217, 154, 96, 83, 94, 93, 96, 98, 77, 87, 92, 84, 93, 166};


//: #875FFA
Byte str_shouldTitle[] = {79, 7, 58, 8, 248, 130, 237, 194, 233, 254, 253, 251, 12, 12, 7, 148};


//: contact
Byte str_ambleModeStatusText[] = {78, 7, 90, 6, 56, 166, 9, 21, 20, 26, 7, 9, 26, 120};


//: /other/feedback
Byte str_sorryData[] = {93, 15, 4, 7, 229, 217, 149, 43, 107, 112, 100, 97, 110, 43, 98, 97, 97, 96, 94, 93, 95, 103, 152};


//: image%lu
Byte str_indexTitle[] = {50, 8, 5, 4, 100, 104, 92, 98, 96, 32, 103, 112, 195};


//: #612CF9
Byte str_sorryContent[] = {53, 7, 18, 7, 60, 160, 169, 17, 36, 31, 32, 49, 52, 39, 168};


//: common_bg
Byte str_recordFlavorTitle[] = {78, 9, 4, 8, 184, 181, 143, 16, 95, 107, 105, 105, 107, 106, 91, 94, 99, 165};


//: AlbumAddBtn
Byte str_fedValue[] = {72, 11, 46, 12, 152, 241, 218, 33, 38, 41, 246, 29, 19, 62, 52, 71, 63, 19, 54, 54, 20, 70, 64, 245};


//: #A148FF
Byte str_rideDateInsertData[] = {96, 7, 61, 11, 120, 202, 9, 173, 113, 109, 89, 230, 4, 244, 247, 251, 9, 9, 102};


//: group_info_activity_op_failed
Byte str_threeSuraName[] = {61, 29, 14, 10, 203, 67, 120, 204, 109, 246, 89, 100, 97, 103, 98, 81, 91, 96, 88, 97, 81, 83, 85, 102, 91, 104, 91, 102, 107, 81, 97, 98, 81, 88, 83, 91, 94, 87, 86, 184};


//: msg
Byte str_pastaContent[] = {10, 3, 6, 9, 71, 222, 116, 228, 40, 103, 109, 97, 227};


//: #999999
Byte str_flavorName[] = {37, 7, 17, 8, 210, 196, 183, 175, 18, 40, 40, 40, 40, 40, 40, 235};


//: public.image
Byte str_townValue[] = {50, 12, 56, 12, 153, 241, 48, 14, 67, 40, 150, 152, 56, 61, 42, 52, 49, 43, 246, 49, 53, 41, 47, 45, 19};


//: feedback_activity_title
Byte str_lifeValue[] = {99, 23, 67, 12, 230, 209, 26, 154, 154, 238, 121, 185, 35, 34, 34, 33, 31, 30, 32, 40, 28, 30, 32, 49, 38, 51, 38, 49, 54, 28, 49, 38, 49, 41, 34, 170};


//: %lu/512
Byte str_gestureOftTitle[] = {21, 7, 59, 6, 67, 250, 234, 49, 58, 244, 250, 246, 247, 121};


//: back_arrow_bl
Byte str_postClientRecentName[] = {32, 13, 60, 8, 247, 116, 194, 1, 38, 37, 39, 47, 35, 37, 54, 54, 51, 59, 35, 38, 48, 92};


//: code
Byte str_ownTitle[] = {11, 4, 96, 9, 105, 156, 24, 237, 72, 3, 15, 4, 5, 127};

// __DEBUG__
// __CLOSE_PRINT__
//
//  PressedViewController.m
//  NIM
//
//  Created by Yan Wang on 2024/7/1.
//  Copyright © 2024 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import "NTESFeedbackViewController.h"
#import "PressedViewController.h"
//: #import "UITextView+Util.h"
#import "UITextView+Util.h"
//: #import "TZImagePickerController.h"
#import "TZImagePickerController.h"
//: #import "UIView+TZLayout.h"
#import "UIView+TZLayout.h"
//: #import "TZTestCell.h"
#import "TextReusableView.h"
//: #import <Photos/Photos.h>
#import <Photos/Photos.h>
//: #import "LxGridViewFlowLayout.h"
#import "AddViewLayout.h"
//: #import "TZImageManager.h"
#import "TZImageManager.h"
//: #import "TZVideoPlayerController.h"
#import "TZVideoPlayerController.h"
//: #import "TZPhotoPreviewController.h"
#import "TZPhotoPreviewController.h"
//: #import "TZGifPhotoPreviewController.h"
#import "TZGifPhotoPreviewController.h"
//: #import "TZAssetCell.h"
#import "TZAssetCell.h"
//: #import <MobileCoreServices/MobileCoreServices.h>
#import <MobileCoreServices/MobileCoreServices.h>
//: #import "FLAnimatedImage.h"
#import "FLAnimatedImage.h"

//: @interface NTESFeedbackViewController ()<UITextViewDelegate,TZImagePickerControllerDelegate,UICollectionViewDataSource,UICollectionViewDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@interface PressedViewController ()<UITextViewDelegate,TZImagePickerControllerDelegate,UICollectionViewDataSource,UICollectionViewDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
{
    //: NSMutableArray *_selectedPhotos;
    NSMutableArray *_selectedPhotos;
    //: NSMutableArray *_selectedAssets;
    NSMutableArray *_selectedAssets;
    //: BOOL _isSelectOriginalPhoto;
    BOOL _isSelectOriginalPhoto;
    //: BOOL _isAllowEditVideo;
    BOOL _isAllowEditVideo;

    //: CGFloat _itemWH;
    CGFloat _itemWH;
    //: CGFloat _margin;
    CGFloat _margin;
}

//: @property (nonatomic ,strong) UITextView *textView;
@property (nonatomic ,strong) UITextView *textView;
//: @property (nonatomic ,strong) UIButton *backButton;
@property (nonatomic ,strong) UIButton *backButton;

//: @property (nonatomic, strong) UIImagePickerController *imagePickerVc;
@property (nonatomic, strong) UIImagePickerController *imagePickerVc;
//: @property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UICollectionView *collectionView;
//: @property (strong, nonatomic) LxGridViewFlowLayout *layout;
@property (strong, nonatomic) AddViewLayout *layout;

//: @property (nonatomic,strong) UILabel *numLabel;
@property (nonatomic,strong) UILabel *numLabel;
//: @property (nonatomic, strong) ZMONCustomLoadingView *loadingView;
@property (nonatomic, strong) SightView *loadingView;
//: @end
@end

//: @implementation NTESFeedbackViewController
@implementation PressedViewController

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

//: - (void)viewDidLoad {
- (void)viewDidLoad {
    //: [super viewDidLoad];
    [super viewDidLoad];
//    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"common_bg"]];
    //: UIImageView *bg = [[UIImageView alloc]initWithFrame:self.view.bounds];
    UIImageView *bg = [[UIImageView alloc]initWithFrame:self.view.bounds];
    //: bg.image = [UIImage imageNamed:@"common_bg"];
    bg.image = [UIImage imageNamed:StringFromAttractData(str_recordFlavorTitle)];
    //: [self.view addSubview:bg];
    [self.view addSubview:bg];

    //: UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, (44.0f + [UIDevice vg_statusBarHeight]))];
    UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, (44.0f + [UIDevice task]))];
    //: [self.view addSubview:bgView];
    [self.view addSubview:bgView];

    //: UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    //: backButton.frame = CGRectMake(5, [UIDevice vg_statusBarHeight]+4, 40, 40);
    backButton.frame = CGRectMake(5, [UIDevice task]+4, 40, 40);
    //: [backButton setImage:[UIImage imageNamed:@"back_arrow_bl"] forState:(UIControlStateNormal)];
    [backButton setImage:[UIImage imageNamed:StringFromAttractData(str_postClientRecentName)] forState:(UIControlStateNormal)];
    //: [backButton addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    [backButton addTarget:self action:@selector(withItem) forControlEvents:UIControlEventTouchUpInside];
    //: [bgView addSubview:backButton];
    [bgView addSubview:backButton];

    //: UILabel *labtitle = [[UILabel alloc] initWithFrame:CGRectMake(([[UIScreen mainScreen] bounds].size.width-200)/2, [UIDevice vg_statusBarHeight]+4, 200, 40)];
    UILabel *labtitle = [[UILabel alloc] initWithFrame:CGRectMake(([[UIScreen mainScreen] bounds].size.width-200)/2, [UIDevice task]+4, 200, 40)];
    //: labtitle.font = [UIFont systemFontOfSize:16.f];
    labtitle.font = [UIFont systemFontOfSize:16.f];
    //: labtitle.textColor = [UIColor blackColor];
    labtitle.textColor = [UIColor blackColor];
    //: labtitle.textAlignment = NSTextAlignmentCenter;
    labtitle.textAlignment = NSTextAlignmentCenter;
    //: labtitle.text = [NTESLanguageManager getTextWithKey:@"feedback_activity_title"];
    labtitle.text = [MaxInformation off:StringFromAttractData(str_lifeValue)];
    //: [bgView addSubview:labtitle];
    [bgView addSubview:labtitle];

    //: UIButton *submitButton = [UIButton buttonWithType:UIButtonTypeCustom];
    UIButton *submitButton = [UIButton buttonWithType:UIButtonTypeCustom];
    //: submitButton.frame = CGRectMake([[UIScreen mainScreen] bounds].size.width-15-40, [UIDevice vg_statusBarHeight]+4, 40, 40);
    submitButton.frame = CGRectMake([[UIScreen mainScreen] bounds].size.width-15-40, [UIDevice task]+4, 40, 40);
    //: [submitButton setImage:[UIImage imageNamed:@"icon_checkbox_selected"] forState:(UIControlStateNormal)];
    [submitButton setImage:[UIImage imageNamed:StringFromAttractData(str_improvementText)] forState:(UIControlStateNormal)];
    //: [submitButton addTarget:self action:@selector(rightNavButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [submitButton addTarget:self action:@selector(timeCircle) forControlEvents:UIControlEventTouchUpInside];
    //: [bgView addSubview:submitButton];
    [bgView addSubview:submitButton];


    //: UIView *bgview = [[UIView alloc]initWithFrame:CGRectMake(15, (44.0f + [UIDevice vg_statusBarHeight])+15, [[UIScreen mainScreen] bounds].size.width-30, 260)];
    UIView *bgview = [[UIView alloc]initWithFrame:CGRectMake(15, (44.0f + [UIDevice task])+15, [[UIScreen mainScreen] bounds].size.width-30, 260)];
    //: bgview.layer.borderWidth = 0.5;
    bgview.layer.borderWidth = 0.5;
    //: bgview.layer.borderColor = [UIColor colorWithRed:236/255.0 green:236/255.0 blue:236/255.0 alpha:1].CGColor;
    bgview.layer.borderColor = [UIColor colorWithRed:236/255.0 green:236/255.0 blue:236/255.0 alpha:1].CGColor;
    //: bgview.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1];
    bgview.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1];
    //: bgview.layer.cornerRadius = 8;
    bgview.layer.cornerRadius = 8;
    //: bgview.layer.shadowColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.0800].CGColor;
    bgview.layer.shadowColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.0800].CGColor;
    //: bgview.layer.shadowOffset = CGSizeMake(0,3);
    bgview.layer.shadowOffset = CGSizeMake(0,3);
    //: bgview.layer.shadowOpacity = 1;
    bgview.layer.shadowOpacity = 1;
    //: bgview.layer.shadowRadius = 0;
    bgview.layer.shadowRadius = 0;
    //: [self.view addSubview:bgview];
    [self.view addSubview:bgview];


    //: _textView = [[UITextView alloc] initWithFrame:CGRectMake(15, 15, [[UIScreen mainScreen] bounds].size.width-60, 230)];
    _textView = [[UITextView alloc] initWithFrame:CGRectMake(15, 15, [[UIScreen mainScreen] bounds].size.width-60, 230)];
    //: _textView.placeholder = [NTESLanguageManager getTextWithKey:@"report_info"];
    _textView.placeholder = [MaxInformation off:StringFromAttractData(str_lowFrameName)];//@"请输入您的举报信息";
    //: _textView.backgroundColor = [UIColor whiteColor];
    _textView.backgroundColor = [UIColor whiteColor];
    //: _textView.delegate = self;
    _textView.delegate = self;
//    _textView.layer.cornerRadius = 8;
//    _textView.layer.masksToBounds = YES;
    //: _textView.textColor = [UIColor blackColor];
    _textView.textColor = [UIColor blackColor];
    //: _textView.font = [UIFont systemFontOfSize:15];
    _textView.font = [UIFont systemFontOfSize:15];
//    _textView.textContainerInset = UIEdgeInsetsMake(15, 10, 15, 10);
//    [self.view addSubview:_textView];
    //: [bgview addSubview:self.textView];
    [bgview addSubview:self.textView];

    //: [self.view addSubview:self.numLabel];
    [self.view addSubview:self.numLabel];
    //: self.numLabel.text = [NSString stringWithFormat:@"%lu/512",(unsigned long)_textView.text.length];
    self.numLabel.text = [NSString stringWithFormat:StringFromAttractData(str_gestureOftTitle),(unsigned long)_textView.text.length];
    //: self.numLabel.frame = CGRectMake(15, bgview.bottom+5, [[UIScreen mainScreen] bounds].size.width-30, 20);
    self.numLabel.frame = CGRectMake(15, bgview.bottom+5, [[UIScreen mainScreen] bounds].size.width-30, 20);

//    UITextView *textView = [[UITextView alloc] init];
//    textView.font = [UIFont systemFontOfSize:16];
//    textView.placeholder = LangKey(@"report_info");//@"请输入您的举报信息";
//    textView.backgroundColor = [UIColor whiteColor];
//    textView.layer.cornerRadius = 8.f;
//    textView.layer.masksToBounds = YES;
//    textView.textColor = [UIColor blackColor];
//    textView.delegate = self;
//    [self.view addSubview:textView];
//    _textView = textView;
//    [textView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_offset(20);
//        make.right.mas_offset(-20);
//        make.top.mas_offset(SCREEN_TOP_HEIGHT+20);
//        make.height.mas_equalTo(200);
//    }];
//
//    UIView *contentView = [[UIView alloc]initWithFrame:CGRectMake(15, SCREEN_TOP_HEIGHT+10, SCREEN_WIDTH-30, 256)];
//    contentView.backgroundColor = [UIColor whiteColor];
//    contentView.layer.cornerRadius = 8;
//    [self.view addSubview:contentView];
//
//    self.contentTextView = [[UITextView alloc] initWithFrame:CGRectMake(15, 15, SCREEN_WIDTH-60, 226)];
//    self.contentTextView.textColor = [UIColor blackColor];
//    self.contentTextView.font = [UIFont systemFontOfSize:16.f];
//    self.contentTextView.delegate = self;
//    self.contentTextView.placeholder = LangKey(@"Please_enter_content");
//    self.contentTextView.text = self.defaultContent;
//    [contentView addSubview:self.contentTextView];
//
//    [self.view addSubview:self.numLabel];
//    self.numLabel.text = [NSString stringWithFormat:@"%lu/400",(unsigned long)textView.text.length];
//    self.numLabel.frame = CGRectMake(15, textView.bottom+10, SCREEN_WIDTH-30, 20);


    //: _selectedPhotos = [NSMutableArray array];
    _selectedPhotos = [NSMutableArray array];
    //: _selectedAssets = [NSMutableArray array];
    _selectedAssets = [NSMutableArray array];
    //: [self configCollectionView];
    [self column];

    //: [self.view addSubview:self.loadingView];
    [self.view addSubview:self.loadingView];
    //: self.loadingView.hidden = YES;
    self.loadingView.hidden = YES;
}

//: - (void)textViewDidChange:(UITextView *)textView; {
- (void)textViewDidChange:(UITextView *)textView; {
//    if (textView.text.length > 10) {
//        self.navigationItem.rightBarButtonItem.enabled = YES;
//    } else {
//        self.navigationItem.rightBarButtonItem.enabled = NO;
//    }
    //: self.numLabel.text = [NSString stringWithFormat:@"%lu/512",textView.text.length];
    self.numLabel.text = [NSString stringWithFormat:StringFromAttractData(str_gestureOftTitle),textView.text.length];
}


//: -(void)rightNavButtonClick{
-(void)timeCircle{

    //: NSMutableDictionary *dict = @{}.mutableCopy;
    NSMutableDictionary *dict = @{}.mutableCopy;
    //: dict[@"contact"] = _textView.text;
    dict[StringFromAttractData(str_ambleModeStatusText)] = _textView.text;

    //: NSMutableArray *array = @[].mutableCopy;
    NSMutableArray *array = @[].mutableCopy;
    //: NSMutableArray *nameArray = @[].mutableCopy;
    NSMutableArray *nameArray = @[].mutableCopy;

    //: if (_selectedPhotos.count > 0) {
    if (_selectedPhotos.count > 0) {
        //: [_selectedPhotos enumerateObjectsUsingBlock:^(UIImage *image , NSUInteger idx, BOOL * _Nonnull stop) {
        [_selectedPhotos enumerateObjectsUsingBlock:^(UIImage *image , NSUInteger idx, BOOL * _Nonnull stop) {
            //: [array addObject:UIImageJPEGRepresentation(image, 0.3)];
            [array addObject:UIImageJPEGRepresentation(image, 0.3)];
            //: [nameArray addObject:[NSString stringWithFormat:@"image%lu",(unsigned long)(idx+1)]];
            [nameArray addObject:[NSString stringWithFormat:StringFromAttractData(str_indexTitle),(unsigned long)(idx+1)]];
        //: }];
        }];
    }
//    [SVProgressHUD show];
    //: [self.loadingView animationShow];
    [self.loadingView brand];

    //: [ZCHttpManager uploadImagesWithURL:[NSString stringWithFormat:@"/other/feedback"] parameters:dict images:array imageNames:nameArray progress:^(NSProgress *progress) {
    [FromMessage imageText:[NSString stringWithFormat:StringFromAttractData(str_sorryData)] touch:dict length:array input:nameArray imageHttpProgress:^(NSProgress *progress) {

    //: } success:^(id responseObject) {
    } high:^(id responseObject) {

//        [SVProgressHUD dismiss];
        //: [self.loadingView animationClose];
        [self.loadingView iconEnable];

        //: NSLog(@"%@",responseObject);
        //: NSDictionary *resultDict = (NSDictionary *)responseObject;
        NSDictionary *resultDict = (NSDictionary *)responseObject;
        //: NSString *code = [resultDict newStringValueForKey:@"code"];
        NSString *code = [resultDict cord:StringFromAttractData(str_ownTitle)];
        //: NSString *msg = [resultDict newStringValueForKey:@"msg"];
        NSString *msg = [resultDict cord:StringFromAttractData(str_pastaContent)];
        //: [SVProgressHUD showMessage:msg];
        [SVProgressHUD aboveBroadcast:msg];
        //: if (code.integerValue == 0) {
        if (code.integerValue == 0) {
            //: [self.navigationController popToRootViewControllerAnimated:YES];
            [self.navigationController popToRootViewControllerAnimated:YES];
        }

    //: } failed:^(id responseObject, NSError *error) {
    } label:^(id responseObject, NSError *error) {
        //: NSLog(@"%@",error);
//        [SVProgressHUD dismiss];
        //: [self.loadingView animationClose];
        [self.loadingView iconEnable];
        //: [SVProgressHUD showMessage:[NTESLanguageManager getTextWithKey:@"group_info_activity_op_failed"]];
        [SVProgressHUD aboveBroadcast:[MaxInformation off:StringFromAttractData(str_threeSuraName)]];
    //: }];
    }];

    //: return;
    return;

//    [FromMessage getWithUrl:Server_other_feedback params:dict isShow:YES success:^(id responseObject) {
//        NSDictionary *resultDict = (NSDictionary *)responseObject;
//        NSString *code = [resultDict newStringValueForKey:@"code"];
//        NSString *msg = [resultDict newStringValueForKey:@"msg"];
//        [SVProgressHUD showMessage:msg];
//        if (code.integerValue == 0) {
//            [self.navigationController popToRootViewControllerAnimated:YES];
//        }
//    } failed:^(id responseObject, NSError *error) {
//
//    }];

}

//: - (UILabel *)numLabel{
- (UILabel *)numLabel{
    //: if (!_numLabel) {
    if (!_numLabel) {
        //: _numLabel = [[UILabel alloc] init];
        _numLabel = [[UILabel alloc] init];
        //: _numLabel.font = [UIFont systemFontOfSize:12.f];
        _numLabel.font = [UIFont systemFontOfSize:12.f];
        //: _numLabel.textAlignment = NSTextAlignmentRight;
        _numLabel.textAlignment = NSTextAlignmentRight;
        //: _numLabel.textColor = [UIColor colorWithHexString:@"#999999"];
        _numLabel.textColor = [UIColor direction:StringFromAttractData(str_flavorName)];
    }
    //: return _numLabel;
    return _numLabel;
}

//: - (UIImagePickerController *)imagePickerVc {
- (UIImagePickerController *)imagePickerVc {
    //: if (_imagePickerVc == nil) {
    if (_imagePickerVc == nil) {
        //: _imagePickerVc = [[UIImagePickerController alloc] init];
        _imagePickerVc = [[UIImagePickerController alloc] init];
        //: _imagePickerVc.delegate = self;
        _imagePickerVc.delegate = self;
        // set appearance / 改变相册选择页的导航栏外观
        //: _imagePickerVc.navigationBar.barTintColor = [UIColor colorWithPatternImage:[SNGradientHelper getLinearGradientImage:[UIColor colorWithHexString:@"#875FFA"] and:[UIColor colorWithHexString:@"#612CF9"] directionType:SNLinearGradientDirectionLevel]];
        _imagePickerVc.navigationBar.barTintColor = [UIColor colorWithPatternImage:[LandHelper title:[UIColor direction:StringFromAttractData(str_shouldTitle)] view:[UIColor direction:StringFromAttractData(str_sorryContent)] textGradientDirection:SNLinearGradientDirectionLevel]];
        //: _imagePickerVc.navigationBar.tintColor = [UIColor colorWithHexString:@"#A148FF"];
        _imagePickerVc.navigationBar.tintColor = [UIColor direction:StringFromAttractData(str_rideDateInsertData)];
    }
    //: return _imagePickerVc;
    return _imagePickerVc;
}

//: - (BOOL)prefersStatusBarHidden {
- (BOOL)prefersStatusBarHidden {
    //: return NO;
    return NO;
}

//: - (void)configCollectionView {
- (void)column {
    // 如不需要长按排序效果，将LxGridViewFlowLayout类改成UICollectionViewFlowLayout即可
    //: _layout = [[LxGridViewFlowLayout alloc] init];
    _layout = [[AddViewLayout alloc] init];
    //: _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:_layout];
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:_layout];
    //: _collectionView.alwaysBounceVertical = YES;
    _collectionView.alwaysBounceVertical = YES;
//    _collectionView.backgroundColor = [UIColor colorWithRed:rgb green:rgb blue:rgb alpha:1.0];
    //: _collectionView.backgroundColor = [UIColor clearColor];
    _collectionView.backgroundColor = [UIColor clearColor];
    //: _collectionView.contentInset = UIEdgeInsetsMake(15, 15, 15, 15);
    _collectionView.contentInset = UIEdgeInsetsMake(15, 15, 15, 15);
    //: _collectionView.dataSource = self;
    _collectionView.dataSource = self;
    //: _collectionView.delegate = self;
    _collectionView.delegate = self;
    //: _collectionView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    _collectionView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    //: [self.view addSubview:_collectionView];
    [self.view addSubview:_collectionView];
    //: [_collectionView registerClass:[TZTestCell class] forCellWithReuseIdentifier:@"TZTestCell"];
    [_collectionView registerClass:[TextReusableView class] forCellWithReuseIdentifier:@"TextReusableView"];
}

//: - (void)viewDidLayoutSubviews {
- (void)viewDidLayoutSubviews {
    //: [super viewDidLayoutSubviews];
    [super viewDidLayoutSubviews];

    //: _margin = 4;
    _margin = 4;
    //: _itemWH = (self.view.tz_width - 2 * _margin - 15*2) / 3 - _margin;
    _itemWH = (self.view.tz_width - 2 * _margin - 15*2) / 3 - _margin;
    //: _layout.itemSize = CGSizeMake(_itemWH, _itemWH);
    _layout.itemSize = CGSizeMake(_itemWH, _itemWH);
    //: _layout.minimumInteritemSpacing = _margin;
    _layout.minimumInteritemSpacing = _margin;
    //: _layout.minimumLineSpacing = _margin;
    _layout.minimumLineSpacing = _margin;
    //: [self.collectionView setCollectionViewLayout:_layout];
    [self.collectionView setCollectionViewLayout:_layout];
    //: self.collectionView.frame = CGRectMake(0, self.numLabel.y + self.numLabel.height, self.view.tz_width, self.view.tz_height-self.textView.height-50);
    self.collectionView.frame = CGRectMake(0, self.numLabel.completeWith + self.numLabel.height, self.view.tz_width, self.view.tz_height-self.textView.height-50);
}


//: #pragma mark UICollectionView
#pragma mark UICollectionView

//: - (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    //: if (_selectedPhotos.count >= 5) {
    if (_selectedPhotos.count >= 5) {
        //: return _selectedPhotos.count;
        return _selectedPhotos.count;
    }

    //: return _selectedPhotos.count + 1;
    return _selectedPhotos.count + 1;
}

//: - (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    //: TZTestCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"TZTestCell" forIndexPath:indexPath];
    TextReusableView *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"TextReusableView" forIndexPath:indexPath];
    //: cell.videoImageView.hidden = YES;
    cell.videoImageView.hidden = YES;
    //: cell.layer.cornerRadius = 8;
    cell.layer.cornerRadius = 8;
    //: cell.layer.masksToBounds = YES;
    cell.layer.masksToBounds = YES;
    //: if (indexPath.item == _selectedPhotos.count) {
    if (indexPath.item == _selectedPhotos.count) {
        //: cell.imageView.image = [UIImage imageNamed:@"AlbumAddBtn"];
        cell.imageView.image = [UIImage imageNamed:StringFromAttractData(str_fedValue)];
        //: cell.deleteBtn.hidden = YES;
        cell.deleteBtn.hidden = YES;
        //: cell.gifLable.hidden = YES;
        cell.gifLable.hidden = YES;
    //: } else {
    } else {
        //: cell.imageView.image = _selectedPhotos[indexPath.item];
        cell.imageView.image = _selectedPhotos[indexPath.item];
        //: if (!_isAllowEditVideo) {
        if (!_isAllowEditVideo) {
            //: cell.asset = _selectedAssets[indexPath.item];
            cell.asset = _selectedAssets[indexPath.item];
        }
        //: cell.deleteBtn.hidden = NO;
        cell.deleteBtn.hidden = NO;
    }

    //: cell.deleteBtn.tag = indexPath.item;
    cell.deleteBtn.tag = indexPath.item;
    //: [cell.deleteBtn addTarget:self action:@selector(deleteBtnClik:) forControlEvents:UIControlEventTouchUpInside];
    [cell.deleteBtn addTarget:self action:@selector(viewManager:) forControlEvents:UIControlEventTouchUpInside];
    //: return cell;
    return cell;
}

//: - (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    //: if (indexPath.item == _selectedPhotos.count) {
    if (indexPath.item == _selectedPhotos.count) {
        //: [self pushTZImagePickerController];
        [self controller];
    //: } else { 
    } else { // preview photos or video / 预览照片或者视频
        //: PHAsset *asset = _selectedAssets[indexPath.item];
        PHAsset *asset = _selectedAssets[indexPath.item];
        //: TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc] initWithSelectedAssets:_selectedAssets selectedPhotos:_selectedPhotos index:indexPath.item];
        TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc] initWithSelectedAssets:_selectedAssets selectedPhotos:_selectedPhotos index:indexPath.item];
        //: imagePickerVc.maxImagesCount = 5;
        imagePickerVc.maxImagesCount = 5;
        //: imagePickerVc.allowPickingGif = NO;
        imagePickerVc.allowPickingGif = NO;
        //: imagePickerVc.autoSelectCurrentWhenDone = NO;
        imagePickerVc.autoSelectCurrentWhenDone = NO;
        //: imagePickerVc.allowPickingOriginalPhoto = NO;
        imagePickerVc.allowPickingOriginalPhoto = NO;
        //: imagePickerVc.allowPickingMultipleVideo = NO;
        imagePickerVc.allowPickingMultipleVideo = NO;
        //: imagePickerVc.showSelectedIndex = YES;
        imagePickerVc.showSelectedIndex = YES;
        //: imagePickerVc.isSelectOriginalPhoto = _isSelectOriginalPhoto;
        imagePickerVc.isSelectOriginalPhoto = _isSelectOriginalPhoto;
        //: imagePickerVc.modalPresentationStyle = UIModalPresentationFullScreen;
        imagePickerVc.modalPresentationStyle = UIModalPresentationFullScreen;
        //: [imagePickerVc setDidFinishPickingPhotosHandle:^(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOriginalPhoto) {
        [imagePickerVc setDidFinishPickingPhotosHandle:^(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOriginalPhoto) {
            //: self->_selectedPhotos = [NSMutableArray arrayWithArray:photos];
            self->_selectedPhotos = [NSMutableArray arrayWithArray:photos];
            //: self->_selectedAssets = [NSMutableArray arrayWithArray:assets];
            self->_selectedAssets = [NSMutableArray arrayWithArray:assets];
            //: self->_isSelectOriginalPhoto = isSelectOriginalPhoto;
            self->_isSelectOriginalPhoto = isSelectOriginalPhoto;
            //: [self->_collectionView reloadData];
            [self->_collectionView reloadData];
            //: self->_collectionView.contentSize = CGSizeMake(0, ((self->_selectedPhotos.count + 2) / 3 ) * (self->_margin + self->_itemWH));
            self->_collectionView.contentSize = CGSizeMake(0, ((self->_selectedPhotos.count + 2) / 3 ) * (self->_margin + self->_itemWH));
        //: }];
        }];
        //: [self presentViewController:imagePickerVc animated:YES completion:nil];
        [self presentViewController:imagePickerVc animated:YES completion:nil];
    }
}

//: #pragma mark - LxGridViewDataSource
#pragma mark - ShouldSource

/// 以下三个方法为长按排序相关代码
//: - (BOOL)collectionView:(UICollectionView *)collectionView canMoveItemAtIndexPath:(NSIndexPath *)indexPath {
- (BOOL)collectionView:(UICollectionView *)collectionView canMoveItemAtIndexPath:(NSIndexPath *)indexPath {
    //: return indexPath.item < _selectedPhotos.count;
    return indexPath.item < _selectedPhotos.count;
}

//: - (BOOL)collectionView:(UICollectionView *)collectionView itemAtIndexPath:(NSIndexPath *)sourceIndexPath canMoveToIndexPath:(NSIndexPath *)destinationIndexPath {
- (BOOL)bubble_strong:(UICollectionView *)collectionView blue:(NSIndexPath *)sourceIndexPath tableButton:(NSIndexPath *)destinationIndexPath {
    //: return (sourceIndexPath.item < _selectedPhotos.count && destinationIndexPath.item < _selectedPhotos.count);
    return (sourceIndexPath.item < _selectedPhotos.count && destinationIndexPath.item < _selectedPhotos.count);
}

//: - (void)collectionView:(UICollectionView *)collectionView itemAtIndexPath:(NSIndexPath *)sourceIndexPath didMoveToIndexPath:(NSIndexPath *)destinationIndexPath {
- (void)view_strong:(UICollectionView *)collectionView rushAlong:(NSIndexPath *)sourceIndexPath data:(NSIndexPath *)destinationIndexPath {
    //: UIImage *image = _selectedPhotos[sourceIndexPath.item];
    UIImage *image = _selectedPhotos[sourceIndexPath.item];
    //: [_selectedPhotos removeObjectAtIndex:sourceIndexPath.item];
    [_selectedPhotos removeObjectAtIndex:sourceIndexPath.item];
    //: [_selectedPhotos insertObject:image atIndex:destinationIndexPath.item];
    [_selectedPhotos insertObject:image atIndex:destinationIndexPath.item];

    //: id asset = _selectedAssets[sourceIndexPath.item];
    id asset = _selectedAssets[sourceIndexPath.item];
    //: [_selectedAssets removeObjectAtIndex:sourceIndexPath.item];
    [_selectedAssets removeObjectAtIndex:sourceIndexPath.item];
    //: [_selectedAssets insertObject:asset atIndex:destinationIndexPath.item];
    [_selectedAssets insertObject:asset atIndex:destinationIndexPath.item];

    //: [_collectionView reloadData];
    [_collectionView reloadData];
}

//: #pragma mark - TZImagePickerController
#pragma mark - TZImagePickerController

//: - (void)pushTZImagePickerController {
- (void)controller {

    //: TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:5 columnNumber:4 delegate:self pushPhotoPickerVc:YES];
    TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:5 columnNumber:4 delegate:self pushPhotoPickerVc:YES];

//: #pragma mark - 五类个性化设置，这些参数都可以不传，此时会走默认设置
#pragma mark - 五类个性化设置，这些参数都可以不传，此时会走默认设置
    //: imagePickerVc.isSelectOriginalPhoto = _isSelectOriginalPhoto;
    imagePickerVc.isSelectOriginalPhoto = _isSelectOriginalPhoto;
    //: imagePickerVc.selectedAssets = _selectedAssets; 
    imagePickerVc.selectedAssets = _selectedAssets; // 目前已经选中的图片数组
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
    //: imagePickerVc.allowPickingOriginalPhoto = NO;
    imagePickerVc.allowPickingOriginalPhoto = NO;
    //: imagePickerVc.allowPickingGif = NO;
    imagePickerVc.allowPickingGif = NO;
    //: imagePickerVc.allowPickingMultipleVideo = NO;
    imagePickerVc.allowPickingMultipleVideo = NO;

    // 4. 照片排列按修改时间升序
    //: imagePickerVc.sortAscendingByModificationDate = YES;
    imagePickerVc.sortAscendingByModificationDate = YES;

    // imagePickerVc.minImagesCount = 3;
    // imagePickerVc.alwaysEnableDoneBtn = YES;

    // imagePickerVc.minPhotoWidthSelectable = 3000;
    // imagePickerVc.minPhotoHeightSelectable = 2000;

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

    // 设置拍照时是否需要定位，仅对选择器内部拍照有效，外部拍照的，请拷贝demo时手动把pushImagePickerController里定位方法的调用删掉
    // imagePickerVc.allowCameraLocation = NO;

    // 自定义gif播放方案
    //: [[TZImagePickerConfig sharedInstance] setGifImagePlayBlock:^(TZPhotoPreviewView *view, UIImageView *imageView, NSData *gifData, NSDictionary *info) {
    [[TZImagePickerConfig sharedInstance] setGifImagePlayBlock:^(TZPhotoPreviewView *view, UIImageView *imageView, NSData *gifData, NSDictionary *info) {
        //: FLAnimatedImage *animatedImage = [FLAnimatedImage animatedImageWithGIFData:gifData];
        FLAnimatedImage *animatedImage = [FLAnimatedImage animatedImageWithGIFData:gifData];
        //: FLAnimatedImageView *animatedImageView;
        FLAnimatedImageView *animatedImageView;
        //: for (UIView *subview in imageView.subviews) {
        for (UIView *subview in imageView.subviews) {
            //: if ([subview isKindOfClass:[FLAnimatedImageView class]]) {
            if ([subview isKindOfClass:[FLAnimatedImageView class]]) {
                //: animatedImageView = (FLAnimatedImageView *)subview;
                animatedImageView = (FLAnimatedImageView *)subview;
                //: animatedImageView.frame = imageView.bounds;
                animatedImageView.frame = imageView.bounds;
                //: animatedImageView.animatedImage = nil;
                animatedImageView.animatedImage = nil;
            }
        }
        //: if (!animatedImageView) {
        if (!animatedImageView) {
            //: animatedImageView = [[FLAnimatedImageView alloc] initWithFrame:imageView.bounds];
            animatedImageView = [[FLAnimatedImageView alloc] initWithFrame:imageView.bounds];
            //: animatedImageView.runLoopMode = NSDefaultRunLoopMode;
            animatedImageView.runLoopMode = NSDefaultRunLoopMode;
            //: [imageView addSubview:animatedImageView];
            [imageView addSubview:animatedImageView];
        }
        //: animatedImageView.animatedImage = animatedImage;
        animatedImageView.animatedImage = animatedImage;
    //: }];
    }];


    //: imagePickerVc.navigationBar.barStyle = UIBarStyleDefault;
    imagePickerVc.navigationBar.barStyle = UIBarStyleDefault;
//    imagePickerVc.naviBgColor = [KEKESkinColorManager shareInstance].skinColor;
    //: imagePickerVc.naviTitleColor = [UIColor blackColor];
    imagePickerVc.naviTitleColor = [UIColor blackColor];
    //: imagePickerVc.barItemTextColor = [UIColor blackColor];
    imagePickerVc.barItemTextColor = [UIColor blackColor];


//: #pragma mark - 到这里为止
#pragma mark - 到这里为止

    // You can get the photos by block, the same as by delegate.
    // 你可以通过block或者代理，来得到用户选择的照片.
    //: [imagePickerVc setDidFinishPickingPhotosHandle:^(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOriginalPhoto) {
    [imagePickerVc setDidFinishPickingPhotosHandle:^(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOriginalPhoto) {
        //: self->_selectedPhotos = [NSMutableArray arrayWithArray:photos];
        self->_selectedPhotos = [NSMutableArray arrayWithArray:photos];
        //: self->_selectedAssets = [NSMutableArray arrayWithArray:assets];
        self->_selectedAssets = [NSMutableArray arrayWithArray:assets];
        //: self->_isSelectOriginalPhoto = isSelectOriginalPhoto;
        self->_isSelectOriginalPhoto = isSelectOriginalPhoto;
        //: [self->_collectionView reloadData];
        [self->_collectionView reloadData];
        //: self->_collectionView.contentSize = CGSizeMake(0, ((self->_selectedPhotos.count + 2) / 3 ) * (self->_margin + self->_itemWH));
        self->_collectionView.contentSize = CGSizeMake(0, ((self->_selectedPhotos.count + 2) / 3 ) * (self->_margin + self->_itemWH));
    //: }];
    }];

    //: imagePickerVc.modalPresentationStyle = UIModalPresentationFullScreen;
    imagePickerVc.modalPresentationStyle = UIModalPresentationFullScreen;
    //: [self presentViewController:imagePickerVc animated:YES completion:nil];
    [self presentViewController:imagePickerVc animated:YES completion:nil];
}


//: #pragma mark - UIImagePickerController
#pragma mark - UIImagePickerController

//: - (void)takePhoto {
- (void)snub {
    //: AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    //: if (authStatus == AVAuthorizationStatusRestricted || authStatus == AVAuthorizationStatusDenied) {
    if (authStatus == AVAuthorizationStatusRestricted || authStatus == AVAuthorizationStatusDenied) {
        // 无相机权限 做一个友好的提示
//        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];

    //: } else if (authStatus == AVAuthorizationStatusNotDetermined) {
    } else if (authStatus == AVAuthorizationStatusNotDetermined) {
        // fix issue 466, 防止用户首次拍照拒绝授权时相机页黑屏
        //: [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
        [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
            //: if (granted) {
            if (granted) {
                //: dispatch_async(dispatch_get_main_queue(), ^{
                dispatch_async(dispatch_get_main_queue(), ^{
                    //: [self takePhoto];
                    [self snub];
                //: });
                });
            }
        //: }];
        }];
        // 拍照之前还需要检查相册权限
    //: } else if ([PHPhotoLibrary authorizationStatus] == 2) { 
    } else if ([PHPhotoLibrary authorizationStatus] == 2) { // 已被拒绝，没有相册权限，将无法保存拍的照片
//        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];

    //: } else if ([PHPhotoLibrary authorizationStatus] == 0) { 
    } else if ([PHPhotoLibrary authorizationStatus] == 0) { // 未请求过相册权限
        //: [[TZImageManager manager] requestAuthorizationWithCompletion:^{
        [[TZImageManager manager] requestAuthorizationWithCompletion:^{
            //: [self takePhoto];
            [self snub];
        //: }];
        }];
    //: } else {
    } else {
        //: [self pushImagePickerController];
        [self restate];
    }
}

// 调用相机
//: - (void)pushImagePickerController {
- (void)restate {

    //: UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
    //: if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera]) {
    if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera]) {
        //: self.imagePickerVc.sourceType = sourceType;
        self.imagePickerVc.sourceType = sourceType;
        //: NSMutableArray *mediaTypes = [NSMutableArray array];
        NSMutableArray *mediaTypes = [NSMutableArray array];
        //: [mediaTypes addObject:(NSString *)kUTTypeImage];
        [mediaTypes addObject:(NSString *)kUTTypeImage];

        //: if (mediaTypes.count) {
        if (mediaTypes.count) {
            //: _imagePickerVc.mediaTypes = mediaTypes;
            _imagePickerVc.mediaTypes = mediaTypes;
        }
        //: [self presentViewController:_imagePickerVc animated:YES completion:nil];
        [self presentViewController:_imagePickerVc animated:YES completion:nil];
    }
}

//: - (void)imagePickerController:(UIImagePickerController*)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
- (void)imagePickerController:(UIImagePickerController*)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    //: [picker dismissViewControllerAnimated:YES completion:nil];
    [picker dismissViewControllerAnimated:YES completion:nil];
    //: NSString *type = [info objectForKey:UIImagePickerControllerMediaType];
    NSString *type = [info objectForKey:UIImagePickerControllerMediaType];

    //: TZImagePickerController *tzImagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:1 delegate:self];
    TZImagePickerController *tzImagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:1 delegate:self];
    //: tzImagePickerVc.sortAscendingByModificationDate = YES;
    tzImagePickerVc.sortAscendingByModificationDate = YES;
    //: [tzImagePickerVc showProgressHUD];
    [tzImagePickerVc showProgressHUD];
    //: if ([type isEqualToString:@"public.image"]) {
    if ([type isEqualToString:StringFromAttractData(str_townValue)]) {
        //: UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
        UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
        //: NSDictionary *meta = [info objectForKey:UIImagePickerControllerMediaMetadata];
        NSDictionary *meta = [info objectForKey:UIImagePickerControllerMediaMetadata];
        // save photo and get asset / 保存图片，获取到asset
        //: [[TZImageManager manager] savePhotoWithImage:image meta:meta location:nil completion:^(PHAsset *asset, NSError *error){
        [[TZImageManager manager] savePhotoWithImage:image meta:meta location:nil completion:^(PHAsset *asset, NSError *error){
            //: [tzImagePickerVc hideProgressHUD];
            [tzImagePickerVc hideProgressHUD];
            //: if (error) {
            if (error) {

            //: } else {
            } else {
                //: TZAssetModel *assetModel = [[TZImageManager manager] createModelWithAsset:asset];
                TZAssetModel *assetModel = [[TZImageManager manager] createModelWithAsset:asset];
                //: [self refreshCollectionViewWithAddedAsset:assetModel.asset image:image];
                [self red:assetModel.asset ting:image];
            }
        //: }];
        }];
    }
}

//: - (void)refreshCollectionViewWithAddedAsset:(PHAsset *)asset image:(UIImage *)image {
- (void)red:(PHAsset *)asset ting:(UIImage *)image {
    //: [_selectedAssets addObject:asset];
    [_selectedAssets addObject:asset];
    //: [_selectedPhotos addObject:image];
    [_selectedPhotos addObject:image];
    //: [_collectionView reloadData];
    [_collectionView reloadData];
}

//: - (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    //: if ([picker isKindOfClass:[UIImagePickerController class]]) {
    if ([picker isKindOfClass:[UIImagePickerController class]]) {
        //: [picker dismissViewControllerAnimated:YES completion:nil];
        [picker dismissViewControllerAnimated:YES completion:nil];
    }
}

//: - (void)imagePickerController:(TZImagePickerController *)picker didFinishPickingAndEditingVideo:(UIImage *)coverImage outputPath:(NSString *)outputPath error:(NSString *)errorMsg {
- (void)imagePickerController:(TZImagePickerController *)picker didFinishPickingAndEditingVideo:(UIImage *)coverImage outputPath:(NSString *)outputPath error:(NSString *)errorMsg {
    //: _isAllowEditVideo = YES;
    _isAllowEditVideo = YES;
    //: self->_selectedPhotos = [NSMutableArray arrayWithArray:@[coverImage]];
    self->_selectedPhotos = [NSMutableArray arrayWithArray:@[coverImage]];
    //: self->_selectedAssets = [NSMutableArray arrayWithArray:@[[NSURL fileURLWithPath:outputPath]]];
    self->_selectedAssets = [NSMutableArray arrayWithArray:@[[NSURL fileURLWithPath:outputPath]]];
    //: [self.collectionView reloadData];
    [self.collectionView reloadData];
}

//: - (void)imagePickerController:(TZImagePickerController *)picker didFinishPickingGifImage:(UIImage *)animatedImage sourceAssets:(PHAsset *)asset {
- (void)imagePickerController:(TZImagePickerController *)picker didFinishPickingGifImage:(UIImage *)animatedImage sourceAssets:(PHAsset *)asset {
    //: _selectedPhotos = [NSMutableArray arrayWithArray:@[animatedImage]];
    _selectedPhotos = [NSMutableArray arrayWithArray:@[animatedImage]];
    //: _selectedAssets = [NSMutableArray arrayWithArray:@[asset]];
    _selectedAssets = [NSMutableArray arrayWithArray:@[asset]];
    //: [_collectionView reloadData];
    [_collectionView reloadData];
}


//: #pragma mark - Click Event
#pragma mark - Click Event

//: - (void)deleteBtnClik:(UIButton *)sender {
- (void)viewManager:(UIButton *)sender {
    //: if ([self collectionView:self.collectionView numberOfItemsInSection:0] <= _selectedPhotos.count) {
    if ([self collectionView:self.collectionView numberOfItemsInSection:0] <= _selectedPhotos.count) {
        //: [_selectedPhotos removeObjectAtIndex:sender.tag];
        [_selectedPhotos removeObjectAtIndex:sender.tag];
        //: [_selectedAssets removeObjectAtIndex:sender.tag];
        [_selectedAssets removeObjectAtIndex:sender.tag];
        //: [self.collectionView reloadData];
        [self.collectionView reloadData];
        //: return;
        return;
    }

    //: [_selectedPhotos removeObjectAtIndex:sender.tag];
    [_selectedPhotos removeObjectAtIndex:sender.tag];
    //: [_selectedAssets removeObjectAtIndex:sender.tag];
    [_selectedAssets removeObjectAtIndex:sender.tag];
    //: [_collectionView performBatchUpdates:^{
    [_collectionView performBatchUpdates:^{
        //: NSIndexPath *indexPath = [NSIndexPath indexPathForItem:sender.tag inSection:0];
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:sender.tag inSection:0];
        //: [self->_collectionView deleteItemsAtIndexPaths:@[indexPath]];
        [self->_collectionView deleteItemsAtIndexPaths:@[indexPath]];
    //: } completion:^(BOOL finished) {
    } completion:^(BOOL finished) {
        //: [self->_collectionView reloadData];
        [self->_collectionView reloadData];
    //: }];
    }];
}

//: - (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //: [self.view endEditing:YES];
    [self.view endEditing:YES];
}

//: - (ZMONCustomLoadingView *)loadingView
- (SightView *)loadingView
{
    //: if(!_loadingView){
    if(!_loadingView){
        //: _loadingView = [[ZMONCustomLoadingView alloc]initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height)];
        _loadingView = [[SightView alloc]initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height)];
    }
    //: return _loadingView;
    return _loadingView;
}


//: @end
@end

Byte * AttractDataToCache(Byte *data) {
    int fromFrame = data[0];
    int nameRecent = data[1];
    Byte ambleQuantity = data[2];
    int alinement = data[3];
    if (!fromFrame) return data + alinement;
    for (int i = alinement; i < alinement + nameRecent; i++) {
        int value = data[i] + ambleQuantity;
        if (value > 255) {
            value -= 256;
        }
        data[i] = value;
    }
    data[0] = 0;
    data[alinement + nameRecent] = 0;
    return data + alinement;
}

NSString *StringFromAttractData(Byte *data) {
    return [NSString stringWithUTF8String:(char *)AttractDataToCache(data)];
}
