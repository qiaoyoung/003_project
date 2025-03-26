
#import <Foundation/Foundation.h>

NSString *StringFromFileAllocationTableData(Byte *data);        


//: friend_circle_activity_from_phone
Byte str_postNeitherValue[] = {25, 33, 52, 10, 105, 149, 245, 194, 88, 46, 50, 62, 53, 49, 58, 48, 43, 47, 53, 62, 47, 56, 49, 43, 45, 47, 64, 53, 66, 53, 64, 69, 43, 50, 62, 59, 57, 43, 60, 52, 59, 58, 49, 147};


//: please_choose
Byte str_developerNomeText[] = {45, 13, 27, 11, 249, 104, 166, 113, 45, 62, 119, 85, 81, 74, 70, 88, 74, 68, 72, 77, 84, 84, 88, 74, 204};


//: friend_circle_adapter_cancel
Byte str_indexConcedeData[] = {74, 28, 95, 8, 160, 102, 223, 185, 7, 19, 10, 6, 15, 5, 0, 4, 10, 19, 4, 13, 6, 0, 2, 5, 2, 17, 21, 6, 19, 0, 4, 2, 15, 4, 6, 13, 89};


//: friend_circle_activity_camera
Byte str_oftDataName[] = {17, 29, 6, 4, 96, 108, 99, 95, 104, 94, 89, 93, 99, 108, 93, 102, 95, 89, 91, 93, 110, 99, 112, 99, 110, 115, 89, 93, 91, 103, 95, 108, 91, 100};


//: UIImagePickerControllerOriginalImage
Byte str_liabilityTitle[] = {79, 36, 85, 10, 44, 254, 29, 169, 90, 245, 0, 244, 244, 24, 12, 18, 16, 251, 20, 14, 22, 16, 29, 238, 26, 25, 31, 29, 26, 23, 23, 16, 29, 250, 29, 20, 18, 20, 25, 12, 23, 244, 24, 12, 18, 16, 63};

// __DEBUG__
// __CLOSE_PRINT__
//
//  NameController.m
//  Kitalker
//
//  Created by chen on 13-3-19.
//  Copyright (c) 2013年 ibm. All rights reserved.
//

// __M_A_C_R_O__
//: #import "KIImagePickerController.h"
#import "NameController.h"
//: #import <Photos/PHPhotoLibrary.h>
#import <Photos/PHPhotoLibrary.h>

//: @interface KIImagePickerController ()
@interface NameController ()
//: @property (nonatomic, weak) id<KIImagePickerControllerDelegate> delegate;
@property (nonatomic, weak) id<MessageLineDelegate> delegate;
//: @property (nonatomic, strong) UIViewController *viewController;
@property (nonatomic, strong) UIViewController *viewController;
//: @property (nonatomic, assign) CGSize cropSize;
@property (nonatomic, assign) CGSize cropSize;
//: @property (nonatomic, strong) NSArray *otherItems;
@property (nonatomic, strong) NSArray *otherItems;
//: @property (nonatomic, assign) BOOL showDelete;
@property (nonatomic, assign) BOOL showDelete;
//: @end
@end

//: @implementation KIImagePickerController
@implementation NameController
//: @synthesize delegate = _delegate;
@synthesize delegate = _delegate;
//: @synthesize viewController = _viewController;
@synthesize viewController = _viewController;
//: @synthesize title = _title;
@synthesize title = _title;
//: @synthesize cropSize = _cropSize;
@synthesize cropSize = _cropSize;
//: @synthesize otherItems = _otherItems;
@synthesize otherItems = _otherItems;
//: @synthesize showDelete = _showDelete;
@synthesize showDelete = _showDelete;

//: - (id)initWithDelegate:(id<KIImagePickerControllerDelegate>)delegate viewController:(UIViewController *)viewController {
- (id)initWithLand:(id<MessageLineDelegate>)delegate session:(UIViewController *)viewController {
    //: if (self = [super init]) {
    if (self = [super init]) {
        //: self.delegate = delegate;
        self.delegate = delegate;
        //: self.viewController = viewController;
        self.viewController = viewController;
        //: self.title = [NTESLanguageManager getTextWithKey:@"please_choose"];
        self.title = [MaxInformation off:StringFromFileAllocationTableData(str_developerNomeText)];//@"请选择";
    }
    //: return self;
    return self;
}

//: - (id)initWithDelegate:(id<KIImagePickerControllerDelegate>)delegate
- (id)initWithLength:(id<MessageLineDelegate>)delegate
                 //: title:(NSString *)title
                 up:(NSString *)title
        //: viewController:(UIViewController *)viewController {
        show:(UIViewController *)viewController {
    //: if (self = [super init]) {
    if (self = [super init]) {
        //: self.delegate = delegate;
        self.delegate = delegate;
        //: self.viewController = viewController;
        self.viewController = viewController;
        //: self.title = title;
        self.title = title;
    }
    //: return self;
    return self;
}

//: - (void)showWithDeleteButton:(BOOL)showDelete {
- (void)cognomen:(BOOL)showDelete {
    //: UIApplication *applicaiton = [UIApplication sharedApplication];
    UIApplication *applicaiton = [UIApplication sharedApplication];

    //: [[self actionSheet:showDelete] showInView:[applicaiton keyWindow]];
    [[self employment:showDelete] showInView:[applicaiton keyWindow]];
}

//: - (void)showWithDeleteButton:(BOOL)showDelete cropSize:(CGSize)cropSize {
- (void)present:(BOOL)showDelete display:(CGSize)cropSize {
    //: [self setCropSize:cropSize];
    [self setCropSize:cropSize];
    //: [self showWithDeleteButton:showDelete];
    [self cognomen:showDelete];
}

//: - (void)showWithDeleteButton:(BOOL)showDelete cropSize:(CGSize)cropSize otherItems:(NSArray *)items {
- (void)smart:(BOOL)showDelete quantity:(CGSize)cropSize session:(NSArray *)items {
    //: [self setOtherItems:items];
    [self setOtherItems:items];
    //: [self showWithDeleteButton:showDelete cropSize:cropSize];
    [self present:showDelete display:cropSize];
}

//: - (UIActionSheet *)actionSheet:(BOOL)needDelete {
- (UIActionSheet *)employment:(BOOL)needDelete {
    //: self.showDelete = needDelete;
    self.showDelete = needDelete;

    //: if (_actionSheet == nil) {
    if (_actionSheet == nil) {

        //: NSString *from_phone = [NTESLanguageManager getTextWithKey:@"friend_circle_activity_from_phone"];
        NSString *from_phone = [MaxInformation off:StringFromFileAllocationTableData(str_postNeitherValue)];
        //: NSString *activity_camera = [NTESLanguageManager getTextWithKey:@"friend_circle_activity_camera"];
        NSString *activity_camera = [MaxInformation off:StringFromFileAllocationTableData(str_oftDataName)];

        //: _actionSheet = [[UIActionSheet alloc] initWithTitle:self.title
        _actionSheet = [[UIActionSheet alloc] initWithTitle:self.title
                                                   //: delegate:self
                                                   delegate:self
                                          //: cancelButtonTitle:nil
                                          cancelButtonTitle:nil
                                     //: destructiveButtonTitle:nil
                                     destructiveButtonTitle:nil
                                          //: otherButtonTitles:from_phone, activity_camera, nil];
                                          otherButtonTitles:from_phone, activity_camera, nil];

        //: NSUInteger cancelIndex = 1;
        NSUInteger cancelIndex = 1;
        //: if (self.showDelete) {
        if (self.showDelete) {
            //: [_actionSheet addButtonWithTitle:@"删除".nim_localized];
            [_actionSheet addButtonWithTitle:@"删除".trapLocalized];
            //: cancelIndex++;
            cancelIndex++;
        }

        //: for (NSString *title in self.otherItems) {
        for (NSString *title in self.otherItems) {
            //: [_actionSheet addButtonWithTitle:title];
            [_actionSheet addButtonWithTitle:title];
            //: cancelIndex++;
            cancelIndex++;
        }

        //: [_actionSheet addButtonWithTitle:[NTESLanguageManager getTextWithKey:@"friend_circle_adapter_cancel"]];
        [_actionSheet addButtonWithTitle:[MaxInformation off:StringFromFileAllocationTableData(str_indexConcedeData)]];
        //: cancelIndex++;
        cancelIndex++;

        //: _actionSheet.cancelButtonIndex = cancelIndex;
        _actionSheet.cancelButtonIndex = cancelIndex;
        //[self retain];
    }
    //: return _actionSheet;
    return _actionSheet;
}

//: - (UIImagePickerController *)imagePickerController {
- (UIImagePickerController *)withController {
    //: if (_imagePickerController == nil) {
    if (_imagePickerController == nil) {
        //: _imagePickerController = [[UIImagePickerController alloc] init];
        _imagePickerController = [[UIImagePickerController alloc] init];
        //: [_imagePickerController setDelegate:self];
        [_imagePickerController setDelegate:self];
    }
    //: return _imagePickerController;
    return _imagePickerController;
}

- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex {
    //: if (buttonIndex == 0) {
    if (buttonIndex == 0) {

        //: [self requestAuthorizationForPhotoLibrary];
        [self label];

    //: } else if (buttonIndex == 1) {
    } else if (buttonIndex == 1) {

        //: [self requestAuthorizationForVideo];
        [self bottomText];

    //: } else if (buttonIndex == actionSheet.cancelButtonIndex) {
    } else if (buttonIndex == actionSheet.cancelButtonIndex) {
        //: if ([self.delegate respondsToSelector:@selector(KIImagePickerControllerDidCancel:)]) {
        if ([self.delegate respondsToSelector:@selector(onses:)]) {
            //: [self.delegate KIImagePickerControllerDidCancel:self];
            [self.delegate onses:self];
        }
        //: [self dismiss];
        [self towardBar];
    //: } else if (self.showDelete && buttonIndex == 2) {
    } else if (self.showDelete && buttonIndex == 2) {
        //: [self pickImage:nil];
        [self disable:nil];
    //: } else {
    } else {
        //: [self didSelectedOtherIndex:buttonIndex-(self.showDelete?3:2)];
        [self bubble:buttonIndex-(self.showDelete?3:2)];
    }
}


/**
 *  请求相机权限
 */
//: - (void)requestAuthorizationForVideo {
- (void)bottomText {

    @
     //: autoreleasepool{} __weak __typeof__(self) __weak_self__ = self;
     autoreleasepool{} __weak __typeof__(self) __weak_self__ = self;
                  ;
    //: AVAuthorizationStatus authorityStaus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    AVAuthorizationStatus authorityStaus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    //: if (AVAuthorizationStatusNotDetermined == authorityStaus) {
    if (AVAuthorizationStatusNotDetermined == authorityStaus) {
        //: [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
        [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
            //: if (granted == YES) {
            if (granted == YES) {
                //: dispatch_async(dispatch_get_main_queue(), ^{
                dispatch_async(dispatch_get_main_queue(), ^{
                    @
                     //: try{} @finally{} __typeof__(self) self = __weak_self__;
                     try{} @finally{} __typeof__(self) self = __weak_self__;
                                    ;

                    //: if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
                    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
                        //: [[self imagePickerController] setSourceType:UIImagePickerControllerSourceTypeCamera];
                        [[self withController] setSourceType:UIImagePickerControllerSourceTypeCamera];
                        //: [self imagePickerController].modalPresentationStyle = UIModalPresentationFullScreen;
                        [self withController].modalPresentationStyle = UIModalPresentationFullScreen;

                        //: [_viewController presentViewController:[self imagePickerController] animated:YES completion:^{
                        [_viewController presentViewController:[self withController] animated:YES completion:^{

                        //: }];
                        }];

                    }
                //: });
                });
            }
        //: }];
        }];
    //: } else if (AVAuthorizationStatusAuthorized == authorityStaus) {
    } else if (AVAuthorizationStatusAuthorized == authorityStaus) {
        //: if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            //: [[self imagePickerController] setSourceType:UIImagePickerControllerSourceTypeCamera];
            [[self withController] setSourceType:UIImagePickerControllerSourceTypeCamera];
            //: [self imagePickerController].modalPresentationStyle = UIModalPresentationFullScreen;
            [self withController].modalPresentationStyle = UIModalPresentationFullScreen;

            //: [_viewController presentViewController:[self imagePickerController] animated:YES completion:^{
            [_viewController presentViewController:[self withController] animated:YES completion:^{

            //: }];
            }];

        }
    //: } else {
    } else {
//        NSURL *url = [[NSURL alloc] initWithString:UIApplicationOpenSettingsURLString];
//        if( [[UIApplication sharedApplication] canOpenURL:url]) {
//            [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];
//        }
    }
}

/**
 *  请求相册
 */
//: - (void)requestAuthorizationForPhotoLibrary
- (void)label
{
    @
     //: autoreleasepool{} __weak __typeof__(self) __weak_self__ = self;
     autoreleasepool{} __weak __typeof__(self) __weak_self__ = self;
                  ;
    //: PHAuthorizationStatus authStatus = [PHPhotoLibrary authorizationStatus];
    PHAuthorizationStatus authStatus = [PHPhotoLibrary authorizationStatus];
    //: if (PHAuthorizationStatusNotDetermined == authStatus) {
    if (PHAuthorizationStatusNotDetermined == authStatus) {
        //: [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
        [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
            //: if (PHAuthorizationStatusAuthorized == status) {
            if (PHAuthorizationStatusAuthorized == status) {
                @
                 //: try{} @finally{} __typeof__(self) self = __weak_self__;
                 try{} @finally{} __typeof__(self) self = __weak_self__;
                                ;
                //: dispatch_async(dispatch_get_main_queue(), ^{
                dispatch_async(dispatch_get_main_queue(), ^{
                    //: [self callPhotoAction];
                    [self image];
                //: });
                });
            }
        //: }];
        }];
        //: return;
        return;
    //: } else if (PHAuthorizationStatusAuthorized == authStatus){
    } else if (PHAuthorizationStatusAuthorized == authStatus){
        //: [self callPhotoAction];
        [self image];
    //: } else {
    } else {
//        NSURL *url = [[NSURL alloc] initWithString:UIApplicationOpenSettingsURLString];
//        if( [[UIApplication sharedApplication] canOpenURL:url]) {
//            [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];
//        }
    }
}

//: - (void)callPhotoAction {
- (void)image {

    //: [[self imagePickerController] setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    [[self withController] setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    //: [self imagePickerController].modalPresentationStyle = UIModalPresentationFullScreen;
    [self withController].modalPresentationStyle = UIModalPresentationFullScreen;

    //: [_viewController presentViewController:[self imagePickerController] animated:YES completion:^{
    [_viewController presentViewController:[self withController] animated:YES completion:^{

    //: }];
    }];

}



//: - (void)pickImage:(UIImage *)image {
- (void)disable:(UIImage *)image {
    //: if (self.delegate != nil && [self.delegate respondsToSelector:@selector(KIImagePickerController:didFinishPickImage:)]) {
    if (self.delegate != nil && [self.delegate respondsToSelector:@selector(visualisationInsidePsychicalTotalernalRepresentation:imaginationImageWith:)]) {
        //: [self.delegate KIImagePickerController:self didFinishPickImage:image];
        [self.delegate visualisationInsidePsychicalTotalernalRepresentation:self imaginationImageWith:image];
    }
    //: [self dismiss];
    [self towardBar];
}

//: - (void)didSelectedOtherIndex:(NSUInteger)index {
- (void)bubble:(NSUInteger)index {
    //: if (self.delegate != nil && [self.delegate respondsToSelector:@selector(KIImagePickerController:didSelectedOtherIndex:)]) {
    if (self.delegate != nil && [self.delegate respondsToSelector:@selector(name:table:)]) {
        //: [self.delegate KIImagePickerController:self didSelectedOtherIndex:index];
        [self.delegate name:self table:index];
    }
}

//: - (void)dismiss {
- (void)towardBar {
    //: [[self imagePickerController] dismissViewControllerAnimated:YES completion:^{
    [[self withController] dismissViewControllerAnimated:YES completion:^{

    //: }];
    }];
}



//: #pragma mark ==================================================
#pragma mark ==================================================
//: #pragma mark == UINavigationControllerDelegate
#pragma mark == UINavigationControllerDelegate
//: #pragma mark ==================================================
#pragma mark ==================================================
//: - (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    //: if ([self.delegate respondsToSelector:@selector(KINavigationController:willShowViewController:animated:)]) {
    if ([self.delegate respondsToSelector:@selector(event:readAnimated:show:)]) {
        //: [self.delegate KINavigationController:navigationController willShowViewController:viewController animated:animated];
        [self.delegate event:navigationController readAnimated:viewController show:animated];
    }
}

//: - (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    //: if ([self.delegate respondsToSelector:@selector(KINavigationController:didShowViewController:animated:)]) {
    if ([self.delegate respondsToSelector:@selector(background:allowAnimated:input:)]) {
        //: [self.delegate KINavigationController:navigationController didShowViewController:viewController animated:animated];
        [self.delegate background:navigationController allowAnimated:viewController input:animated];
    }
}

//: #pragma mark ==================================================
#pragma mark ==================================================
//: #pragma mark == UIImagePickerControllerDelegate
#pragma mark == UIImagePickerControllerDelegate
//: #pragma mark ==================================================
#pragma mark ==================================================
//: - (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo NS_DEPRECATED_IOS(2_0, 3_0){
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo NS_DEPRECATED_IOS(2_0, 3_0){

}

//: - (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    //: UIImage *image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    UIImage *image = [info objectForKey:StringFromFileAllocationTableData(str_liabilityTitle)];
    //    NSURL   *imageURL = [info objectForKey:@"UIImagePickerControllerReferenceURL"];
    //    NSString *imagePath = [imageURL absoluteString];
    //: [[UIApplication sharedApplication] setStatusBarHidden:NO];
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
    //: if (__CGSizeEqualToSize(self.cropSize, CGSizeZero)) {
    if (__CGSizeEqualToSize(self.cropSize, CGSizeZero)) {
        //: [self pickImage:image];
        [self disable:image];
    //: } else {
    } else {

        //: KIImageCropperViewController *cropImageViewController = [[KIImageCropperViewController alloc] initWithImage:[image fixOrientation] cropSize:self.cropSize];
        ShowHideViewController *cropImageViewController = [[ShowHideViewController alloc] initWithFrame:[image person] length:self.cropSize];
        //: UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:cropImageViewController];
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:cropImageViewController];
        //: [[self imagePickerController] presentViewController:nav animated:YES completion:nil];
        [[self withController] presentViewController:nav animated:YES completion:nil];
        //: [cropImageViewController setCroppedImage:^(UIImage *image) {
        [cropImageViewController setWeValue:^(UIImage *image) {
            //: [self pickImage:image];
            [self disable:image];
        //: }];
        }];

    }
}

//: - (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    //: if ([self.delegate respondsToSelector:@selector(KIImagePickerControllerDidCancel:)]) {
    if ([self.delegate respondsToSelector:@selector(onses:)]) {
        //: [self.delegate KIImagePickerControllerDidCancel:self];
        [self.delegate onses:self];
    }
    //: [self dismiss];
    [self towardBar];
}


//: @end
@end

Byte * FileAllocationTableDataToCache(Byte *data) {
    int overt = data[0];
    int workplaceEnablely = data[1];
    Byte specsGoing = data[2];
    int gain = data[3];
    if (!overt) return data + gain;
    for (int i = gain; i < gain + workplaceEnablely; i++) {
        int value = data[i] + specsGoing;
        if (value > 255) {
            value -= 256;
        }
        data[i] = value;
    }
    data[0] = 0;
    data[gain + workplaceEnablely] = 0;
    return data + gain;
}

NSString *StringFromFileAllocationTableData(Byte *data) {
    return [NSString stringWithUTF8String:(char *)FileAllocationTableDataToCache(data)];
}
