//
//  NTESOpinionBackViewController.m
//  NIM
//
//  Created by 彭爽 on 2021/9/17.
//  Copyright © 2021 Netease. All rights reserved.
//

#import "NTESOpinionBackViewController.h"
#import "UITextView+Util.h"
#import "TZImagePickerController.h"
#import "UIView+TZLayout.h"
#import "TZTestCell.h"
#import <Photos/Photos.h>
#import "LxGridViewFlowLayout.h"
#import "TZImageManager.h"
#import "TZVideoPlayerController.h"
#import "TZPhotoPreviewController.h"
#import "TZGifPhotoPreviewController.h"
#import "TZAssetCell.h"
#import <MobileCoreServices/MobileCoreServices.h>
#import "FLAnimatedImage.h"


@interface NTESOpinionBackViewController () <UITextViewDelegate,TZImagePickerControllerDelegate,UICollectionViewDataSource,UICollectionViewDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
{
    NSMutableArray *_selectedPhotos;
    NSMutableArray *_selectedAssets;
    BOOL _isSelectOriginalPhoto;
    BOOL _isAllowEditVideo;
    
    CGFloat _itemWH;
    CGFloat _margin;
}

@property (nonatomic ,strong) UITextView *textView;
@property (nonatomic ,strong) UIButton *backButton;

@property (nonatomic, strong) UIImagePickerController *imagePickerVc;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (strong, nonatomic) LxGridViewFlowLayout *layout;

@property (nonatomic,strong) UILabel *numLabel;

@end

@implementation NTESOpinionBackViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setHidden:YES];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar setHidden:NO];

}

- (void)backAction{
    [self.navigationController popViewControllerAnimated:NO];
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"common_bg"]];
    UIImageView *bg = [[UIImageView alloc]initWithFrame:self.view.bounds];
    bg.image = [UIImage imageNamed:@"common_bg"];
    [self.view addSubview:bg];
    
//    UIImageView *bg = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 375)];
//    bg.image = [UIImage imageNamed:@"chat_top_bg"];
//    [self.view addSubview:bg];

    UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_TOP_HEIGHT)];
    [self.view addSubview:bgView];
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(5, SCREEN_STATUS_HEIGHT+4, 40, 40);
    [backButton setImage:[UIImage imageNamed:@"back_arrow_b"] forState:(UIControlStateNormal)];
    [backButton addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    [bgView addSubview:backButton];
    
    UILabel *labtitle = [[UILabel alloc] initWithFrame:CGRectMake((SCREEN_WIDTH-200)/2, SCREEN_STATUS_HEIGHT+4, 200, 40)];
    labtitle.font = [UIFont systemFontOfSize:16.f];
    labtitle.textColor = [UIColor blackColor];
    labtitle.textAlignment = NSTextAlignmentCenter;
    labtitle.text = LangKey(@"report_activity_title");
    [bgView addSubview:labtitle];
    
    UIButton *submitButton = [UIButton buttonWithType:UIButtonTypeCustom];
    submitButton.frame = CGRectMake(SCREEN_WIDTH-15-40, SCREEN_STATUS_HEIGHT+4, 40, 40);
    [submitButton setImage:[UIImage imageNamed:@"icon_checkbox_selected"] forState:(UIControlStateNormal)];
    [submitButton addTarget:self action:@selector(rightNavButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [bgView addSubview:submitButton];
    
    
//    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    [backButton setImage:[UIImage imageNamed:@"btn_submit"] forState:(UIControlStateNormal)];
//    [backButton setFrame:CGRectMake(0, 7, 50, 20)];
//    [backButton addTarget:self action:@selector(rightNavButtonClick) forControlEvents:UIControlEventTouchUpInside];
//    self.backButton = backButton;
//    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
//    backItem.tintColor = [UIColor whiteColor];
//
//    self.navigationItem.rightBarButtonItem = backItem;
//    self.navigationItem.rightBarButtonItem.enabled = NO;
    
    _textView = [[UITextView alloc] initWithFrame:CGRectMake(15, SCREEN_TOP_HEIGHT+15, SCREEN_WIDTH-30, 200)];
    _textView.placeholder = LangKey(@"report_info");//@"请输入您的举报信息";
    _textView.backgroundColor = [UIColor whiteColor];
    _textView.delegate = self;
    _textView.layer.cornerRadius = 8;
    _textView.layer.masksToBounds = YES;
    _textView.textColor = [UIColor blackColor];
    _textView.font = [UIFont systemFontOfSize:15];
    _textView.textContainerInset = UIEdgeInsetsMake(15, 10, 15, 10);
    [self.view addSubview:_textView];
    
    [self.view addSubview:self.numLabel];
    self.numLabel.text = [NSString stringWithFormat:@"%lu/400",(unsigned long)_textView.text.length];
    self.numLabel.frame = CGRectMake(15, SCREEN_TOP_HEIGHT+200+30, SCREEN_WIDTH-30, 20);
    
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
    
    
    _selectedPhotos = [NSMutableArray array];
    _selectedAssets = [NSMutableArray array];
    [self configCollectionView];
}

- (void)textViewDidChange:(UITextView *)textView; {
//    if (textView.text.length > 10) {
//        self.navigationItem.rightBarButtonItem.enabled = YES;
//    } else {
//        self.navigationItem.rightBarButtonItem.enabled = NO;
//    }
    self.numLabel.text = [NSString stringWithFormat:@"%lu/400",textView.text.length];
}


-(void)rightNavButtonClick{
    
    NSMutableDictionary *dict = @{}.mutableCopy;
    dict[@"contact"] = _textView.text;
    
    NSMutableArray *array = @[].mutableCopy;
    NSMutableArray *nameArray = @[].mutableCopy;

    if (_selectedPhotos.count > 0) {
        [_selectedPhotos enumerateObjectsUsingBlock:^(UIImage *image , NSUInteger idx, BOOL * _Nonnull stop) {
            [array addObject:UIImageJPEGRepresentation(image, 0.3)];
            [nameArray addObject:[NSString stringWithFormat:@"image%lu",(unsigned long)(idx+1)]];
        }];
    }
    [SVProgressHUD show];

    [ZCHttpManager uploadImagesWithURL:Server_other_feedback parameters:dict images:array imageNames:nameArray progress:^(NSProgress *progress) {
        
    } success:^(id responseObject) {
        
        [SVProgressHUD dismiss];

        NSLog(@"%@",responseObject);
        NSDictionary *resultDict = (NSDictionary *)responseObject;
        NSString *code = [resultDict newStringValueForKey:@"code"];
        NSString *msg = [resultDict newStringValueForKey:@"msg"];
        [SVProgressHUD showMessage:msg];
        if (code.integerValue == 0) {
            [self.navigationController popToRootViewControllerAnimated:YES];
        }
        
    } failed:^(id responseObject, NSError *error) {
        NSLog(@"%@",error);
        [SVProgressHUD dismiss];
        [SVProgressHUD showMessage:LangKey(@"group_info_activity_op_failed")];
    }];

    return;
    
//    [ZCHttpManager getWithUrl:Server_other_feedback params:dict isShow:YES success:^(id responseObject) {
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

- (UILabel *)numLabel{
    if (!_numLabel) {
        _numLabel = [[UILabel alloc] init];
        _numLabel.font = [UIFont systemFontOfSize:12.f];
        _numLabel.textAlignment = NSTextAlignmentRight;
        _numLabel.textColor = TextColor_3;
    }
    return _numLabel;
}

- (UIImagePickerController *)imagePickerVc {
    if (_imagePickerVc == nil) {
        _imagePickerVc = [[UIImagePickerController alloc] init];
        _imagePickerVc.delegate = self;
        // set appearance / 改变相册选择页的导航栏外观
        _imagePickerVc.navigationBar.barTintColor = [UIColor colorWithPatternImage:[SNGradientHelper getLinearGradientImage:RGB_COLOR_String(kCommonBGColor_begin) and:RGB_COLOR_String(kCommonBGColor_end) directionType:SNLinearGradientDirectionLevel]];
        _imagePickerVc.navigationBar.tintColor = RGB_COLOR_String(kCommonBGColor_All);
    }
    return _imagePickerVc;
}

- (BOOL)prefersStatusBarHidden {
    return NO;
}

- (void)configCollectionView {
    // 如不需要长按排序效果，将LxGridViewFlowLayout类改成UICollectionViewFlowLayout即可
    _layout = [[LxGridViewFlowLayout alloc] init];
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:_layout];
    CGFloat rgb = 244 / 255.0;
    _collectionView.alwaysBounceVertical = YES;
//    _collectionView.backgroundColor = [UIColor colorWithRed:rgb green:rgb blue:rgb alpha:1.0];
    _collectionView.backgroundColor = [UIColor clearColor];
    _collectionView.contentInset = UIEdgeInsetsMake(15, 15, 15, 15);
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    _collectionView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    [self.view addSubview:_collectionView];
    [_collectionView registerClass:[TZTestCell class] forCellWithReuseIdentifier:@"TZTestCell"];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    _margin = 4;
    _itemWH = (self.view.tz_width - 2 * _margin - 15*2) / 3 - _margin;
    _layout.itemSize = CGSizeMake(_itemWH, _itemWH);
    _layout.minimumInteritemSpacing = _margin;
    _layout.minimumLineSpacing = _margin;
    [self.collectionView setCollectionViewLayout:_layout];
    self.collectionView.frame = CGRectMake(0, self.textView.y + self.textView.height, self.view.tz_width, self.view.tz_height - self.textView.height);
}


#pragma mark UICollectionView

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (_selectedPhotos.count >= 5) {
        return _selectedPhotos.count;
    }

    return _selectedPhotos.count + 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    TZTestCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"TZTestCell" forIndexPath:indexPath];
    cell.videoImageView.hidden = YES;
    cell.layer.cornerRadius = 8;
    cell.layer.masksToBounds = YES;
    if (indexPath.item == _selectedPhotos.count) {
        cell.imageView.image = [UIImage imageNamed:@"AlbumAddBtn"];
        cell.deleteBtn.hidden = YES;
        cell.gifLable.hidden = YES;
    } else {
        cell.imageView.image = _selectedPhotos[indexPath.item];
        if (!_isAllowEditVideo) {
            cell.asset = _selectedAssets[indexPath.item];
        }
        cell.deleteBtn.hidden = NO;
    }

    cell.deleteBtn.tag = indexPath.item;
    [cell.deleteBtn addTarget:self action:@selector(deleteBtnClik:) forControlEvents:UIControlEventTouchUpInside];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.item == _selectedPhotos.count) {
        [self pushTZImagePickerController];
    } else { // preview photos or video / 预览照片或者视频
        PHAsset *asset = _selectedAssets[indexPath.item];
        TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc] initWithSelectedAssets:_selectedAssets selectedPhotos:_selectedPhotos index:indexPath.item];
        imagePickerVc.maxImagesCount = 5;
        imagePickerVc.allowPickingGif = NO;
        imagePickerVc.autoSelectCurrentWhenDone = NO;
        imagePickerVc.allowPickingOriginalPhoto = NO;
        imagePickerVc.allowPickingMultipleVideo = NO;
        imagePickerVc.showSelectedIndex = YES;
        imagePickerVc.isSelectOriginalPhoto = _isSelectOriginalPhoto;
        imagePickerVc.modalPresentationStyle = UIModalPresentationFullScreen;
        [imagePickerVc setDidFinishPickingPhotosHandle:^(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOriginalPhoto) {
            self->_selectedPhotos = [NSMutableArray arrayWithArray:photos];
            self->_selectedAssets = [NSMutableArray arrayWithArray:assets];
            self->_isSelectOriginalPhoto = isSelectOriginalPhoto;
            [self->_collectionView reloadData];
            self->_collectionView.contentSize = CGSizeMake(0, ((self->_selectedPhotos.count + 2) / 3 ) * (self->_margin + self->_itemWH));
        }];
        [self presentViewController:imagePickerVc animated:YES completion:nil];
    }
}

#pragma mark - LxGridViewDataSource

/// 以下三个方法为长按排序相关代码
- (BOOL)collectionView:(UICollectionView *)collectionView canMoveItemAtIndexPath:(NSIndexPath *)indexPath {
    return indexPath.item < _selectedPhotos.count;
}

- (BOOL)collectionView:(UICollectionView *)collectionView itemAtIndexPath:(NSIndexPath *)sourceIndexPath canMoveToIndexPath:(NSIndexPath *)destinationIndexPath {
    return (sourceIndexPath.item < _selectedPhotos.count && destinationIndexPath.item < _selectedPhotos.count);
}

- (void)collectionView:(UICollectionView *)collectionView itemAtIndexPath:(NSIndexPath *)sourceIndexPath didMoveToIndexPath:(NSIndexPath *)destinationIndexPath {
    UIImage *image = _selectedPhotos[sourceIndexPath.item];
    [_selectedPhotos removeObjectAtIndex:sourceIndexPath.item];
    [_selectedPhotos insertObject:image atIndex:destinationIndexPath.item];
    
    id asset = _selectedAssets[sourceIndexPath.item];
    [_selectedAssets removeObjectAtIndex:sourceIndexPath.item];
    [_selectedAssets insertObject:asset atIndex:destinationIndexPath.item];
    
    [_collectionView reloadData];
}

#pragma mark - TZImagePickerController

- (void)pushTZImagePickerController {

    TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:5 columnNumber:4 delegate:self pushPhotoPickerVc:YES];
    
#pragma mark - 五类个性化设置，这些参数都可以不传，此时会走默认设置
    imagePickerVc.isSelectOriginalPhoto = _isSelectOriginalPhoto;
    imagePickerVc.selectedAssets = _selectedAssets; // 目前已经选中的图片数组
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
    imagePickerVc.allowPickingOriginalPhoto = NO;
    imagePickerVc.allowPickingGif = NO;
    imagePickerVc.allowPickingMultipleVideo = NO;
    
    // 4. 照片排列按修改时间升序
    imagePickerVc.sortAscendingByModificationDate = YES;
    
    // imagePickerVc.minImagesCount = 3;
    // imagePickerVc.alwaysEnableDoneBtn = YES;
    
    // imagePickerVc.minPhotoWidthSelectable = 3000;
    // imagePickerVc.minPhotoHeightSelectable = 2000;
    
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
    
    // 设置拍照时是否需要定位，仅对选择器内部拍照有效，外部拍照的，请拷贝demo时手动把pushImagePickerController里定位方法的调用删掉
    // imagePickerVc.allowCameraLocation = NO;
    
    // 自定义gif播放方案
    [[TZImagePickerConfig sharedInstance] setGifImagePlayBlock:^(TZPhotoPreviewView *view, UIImageView *imageView, NSData *gifData, NSDictionary *info) {
        FLAnimatedImage *animatedImage = [FLAnimatedImage animatedImageWithGIFData:gifData];
        FLAnimatedImageView *animatedImageView;
        for (UIView *subview in imageView.subviews) {
            if ([subview isKindOfClass:[FLAnimatedImageView class]]) {
                animatedImageView = (FLAnimatedImageView *)subview;
                animatedImageView.frame = imageView.bounds;
                animatedImageView.animatedImage = nil;
            }
        }
        if (!animatedImageView) {
            animatedImageView = [[FLAnimatedImageView alloc] initWithFrame:imageView.bounds];
            animatedImageView.runLoopMode = NSDefaultRunLoopMode;
            [imageView addSubview:animatedImageView];
        }
        animatedImageView.animatedImage = animatedImage;
    }];
    

    imagePickerVc.navigationBar.barStyle = UIBarStyleDefault;
//    imagePickerVc.naviBgColor = [KEKESkinColorManager shareInstance].skinColor;
    imagePickerVc.naviTitleColor = [UIColor blackColor];
    imagePickerVc.barItemTextColor = [UIColor blackColor];
     
 
#pragma mark - 到这里为止
    
    // You can get the photos by block, the same as by delegate.
    // 你可以通过block或者代理，来得到用户选择的照片.
    [imagePickerVc setDidFinishPickingPhotosHandle:^(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOriginalPhoto) {
        self->_selectedPhotos = [NSMutableArray arrayWithArray:photos];
        self->_selectedAssets = [NSMutableArray arrayWithArray:assets];
        self->_isSelectOriginalPhoto = isSelectOriginalPhoto;
        [self->_collectionView reloadData];
        self->_collectionView.contentSize = CGSizeMake(0, ((self->_selectedPhotos.count + 2) / 3 ) * (self->_margin + self->_itemWH));
    }];
    
    imagePickerVc.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:imagePickerVc animated:YES completion:nil];
}


#pragma mark - UIImagePickerController

- (void)takePhoto {
    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    if (authStatus == AVAuthorizationStatusRestricted || authStatus == AVAuthorizationStatusDenied) {
        // 无相机权限 做一个友好的提示
//        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];

    } else if (authStatus == AVAuthorizationStatusNotDetermined) {
        // fix issue 466, 防止用户首次拍照拒绝授权时相机页黑屏
        [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
            if (granted) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self takePhoto];
                });
            }
        }];
        // 拍照之前还需要检查相册权限
    } else if ([PHPhotoLibrary authorizationStatus] == 2) { // 已被拒绝，没有相册权限，将无法保存拍的照片
//        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];

    } else if ([PHPhotoLibrary authorizationStatus] == 0) { // 未请求过相册权限
        [[TZImageManager manager] requestAuthorizationWithCompletion:^{
            [self takePhoto];
        }];
    } else {
        [self pushImagePickerController];
    }
}

// 调用相机
- (void)pushImagePickerController {

    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
    if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera]) {
        self.imagePickerVc.sourceType = sourceType;
        NSMutableArray *mediaTypes = [NSMutableArray array];
        [mediaTypes addObject:(NSString *)kUTTypeImage];

        if (mediaTypes.count) {
            _imagePickerVc.mediaTypes = mediaTypes;
        }
        [self presentViewController:_imagePickerVc animated:YES completion:nil];
    }
}

- (void)imagePickerController:(UIImagePickerController*)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    [picker dismissViewControllerAnimated:YES completion:nil];
    NSString *type = [info objectForKey:UIImagePickerControllerMediaType];
    
    TZImagePickerController *tzImagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:1 delegate:self];
    tzImagePickerVc.sortAscendingByModificationDate = YES;
    [tzImagePickerVc showProgressHUD];
    if ([type isEqualToString:@"public.image"]) {
        UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
        NSDictionary *meta = [info objectForKey:UIImagePickerControllerMediaMetadata];
        // save photo and get asset / 保存图片，获取到asset
        [[TZImageManager manager] savePhotoWithImage:image meta:meta location:nil completion:^(PHAsset *asset, NSError *error){
            [tzImagePickerVc hideProgressHUD];
            if (error) {
                
            } else {
                TZAssetModel *assetModel = [[TZImageManager manager] createModelWithAsset:asset];
                [self refreshCollectionViewWithAddedAsset:assetModel.asset image:image];
            }
        }];
    }
}

- (void)refreshCollectionViewWithAddedAsset:(PHAsset *)asset image:(UIImage *)image {
    [_selectedAssets addObject:asset];
    [_selectedPhotos addObject:image];
    [_collectionView reloadData];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    if ([picker isKindOfClass:[UIImagePickerController class]]) {
        [picker dismissViewControllerAnimated:YES completion:nil];
    }
}

- (void)imagePickerController:(TZImagePickerController *)picker didFinishPickingAndEditingVideo:(UIImage *)coverImage outputPath:(NSString *)outputPath error:(NSString *)errorMsg {
    _isAllowEditVideo = YES;
    self->_selectedPhotos = [NSMutableArray arrayWithArray:@[coverImage]];
    self->_selectedAssets = [NSMutableArray arrayWithArray:@[[NSURL fileURLWithPath:outputPath]]];
    [self.collectionView reloadData];
}

- (void)imagePickerController:(TZImagePickerController *)picker didFinishPickingGifImage:(UIImage *)animatedImage sourceAssets:(PHAsset *)asset {
    _selectedPhotos = [NSMutableArray arrayWithArray:@[animatedImage]];
    _selectedAssets = [NSMutableArray arrayWithArray:@[asset]];
    [_collectionView reloadData];
}


#pragma mark - Click Event

- (void)deleteBtnClik:(UIButton *)sender {
    if ([self collectionView:self.collectionView numberOfItemsInSection:0] <= _selectedPhotos.count) {
        [_selectedPhotos removeObjectAtIndex:sender.tag];
        [_selectedAssets removeObjectAtIndex:sender.tag];
        [self.collectionView reloadData];
        return;
    }
    
    [_selectedPhotos removeObjectAtIndex:sender.tag];
    [_selectedAssets removeObjectAtIndex:sender.tag];
    [_collectionView performBatchUpdates:^{
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:sender.tag inSection:0];
        [self->_collectionView deleteItemsAtIndexPaths:@[indexPath]];
    } completion:^(BOOL finished) {
        [self->_collectionView reloadData];
    }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

@end
