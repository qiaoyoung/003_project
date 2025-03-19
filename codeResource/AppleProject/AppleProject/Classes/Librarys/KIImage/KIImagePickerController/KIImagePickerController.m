//
//  KIImagePickerController.m
//  Kitalker
//
//  Created by chen on 13-3-19.
//  Copyright (c) 2013年 ibm. All rights reserved.
//

#import "KIImagePickerController.h"
#import <Photos/PHPhotoLibrary.h>

@interface KIImagePickerController ()
@property (nonatomic, weak) id<KIImagePickerControllerDelegate>   delegate;
@property (nonatomic, strong) UIViewController                      *viewController;
@property (nonatomic, assign) CGSize                                cropSize;
@property (nonatomic, strong) NSArray                               *otherItems;
@property (nonatomic, assign) BOOL                                  showDelete;
@end

@implementation KIImagePickerController
@synthesize delegate        = _delegate;
@synthesize viewController  = _viewController;
@synthesize title           = _title;
@synthesize cropSize        = _cropSize;
@synthesize otherItems      = _otherItems;
@synthesize showDelete      = _showDelete;

- (id)initWithDelegate:(id<KIImagePickerControllerDelegate>)delegate viewController:(UIViewController *)viewController {
    if (self = [super init]) {
        self.delegate = delegate;
        self.viewController = viewController;
        self.title = LangKey(@"please_choose");//@"请选择";
    }
    return self;
}

- (id)initWithDelegate:(id<KIImagePickerControllerDelegate>)delegate
                 title:(NSString *)title
        viewController:(UIViewController *)viewController {
    if (self = [super init]) {
        self.delegate = delegate;
        self.viewController = viewController;
        self.title = title;
    }
    return self;
}

- (void)showWithDeleteButton:(BOOL)showDelete {
    UIApplication *applicaiton = [UIApplication sharedApplication];
    
    [[self actionSheet:showDelete] showInView:[applicaiton keyWindow]];
}

- (void)showWithDeleteButton:(BOOL)showDelete cropSize:(CGSize)cropSize {
    [self setCropSize:cropSize];
    [self showWithDeleteButton:showDelete];
}

- (void)showWithDeleteButton:(BOOL)showDelete cropSize:(CGSize)cropSize otherItems:(NSArray *)items {
    [self setOtherItems:items];
    [self showWithDeleteButton:showDelete cropSize:cropSize];
}

- (UIActionSheet *)actionSheet:(BOOL)needDelete {
    self.showDelete = needDelete;
    
    if (_actionSheet == nil) {
        
        NSString *from_phone = LangKey(@"friend_circle_activity_from_phone");
        NSString *activity_camera = LangKey(@"friend_circle_activity_camera");
        
        _actionSheet = [[UIActionSheet alloc] initWithTitle:self.title
                                                   delegate:self
                                          cancelButtonTitle:nil
                                     destructiveButtonTitle:nil
                                          otherButtonTitles:from_phone, activity_camera, nil];
        
        NSUInteger cancelIndex = 1;
        if (self.showDelete) {
            [_actionSheet addButtonWithTitle:@"删除".nim_localized];
            cancelIndex++;
        }
        
        for (NSString *title in self.otherItems) {
            [_actionSheet addButtonWithTitle:title];
            cancelIndex++;
        }
        
        [_actionSheet addButtonWithTitle:LangKey(@"friend_circle_adapter_cancel")];
        cancelIndex++;
        
        _actionSheet.cancelButtonIndex = cancelIndex;
        //[self retain];
    }
    return _actionSheet;
}

- (UIImagePickerController *)imagePickerController {
    if (_imagePickerController == nil) {
        _imagePickerController = [[UIImagePickerController alloc] init];
        [_imagePickerController setDelegate:self];
    }
    return _imagePickerController;
}

- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 0) {
        
        [self requestAuthorizationForPhotoLibrary];

    } else if (buttonIndex == 1) {
        
        [self requestAuthorizationForVideo];

    } else if (buttonIndex == actionSheet.cancelButtonIndex) {
        if ([self.delegate respondsToSelector:@selector(KIImagePickerControllerDidCancel:)]) {
            [self.delegate KIImagePickerControllerDidCancel:self];
        }
        [self dismiss];
    } else if (self.showDelete && buttonIndex == 2) {
        [self pickImage:nil];
    } else {
        [self didSelectedOtherIndex:buttonIndex-(self.showDelete?3:2)];
    }
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
                        [[self imagePickerController] setSourceType:UIImagePickerControllerSourceTypeCamera];
                        [self imagePickerController].modalPresentationStyle  = UIModalPresentationFullScreen;

                        [_viewController presentViewController:[self imagePickerController] animated:YES completion:^{
                            
                        }];
                        
                    }
                });
            }
        }];
    } else if (AVAuthorizationStatusAuthorized == authorityStaus) {
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            [[self imagePickerController] setSourceType:UIImagePickerControllerSourceTypeCamera];
            [self imagePickerController].modalPresentationStyle  = UIModalPresentationFullScreen;

            [_viewController presentViewController:[self imagePickerController] animated:YES completion:^{
                
            }];
            
        }
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
- (void)requestAuthorizationForPhotoLibrary
{
    @weakify(self);
    PHAuthorizationStatus authStatus = [PHPhotoLibrary authorizationStatus];
    if (PHAuthorizationStatusNotDetermined == authStatus) {
        [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
            if (PHAuthorizationStatusAuthorized == status) {
                @strongify(self);
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self callPhotoAction];
                });
            }
        }];
        return;
    } else if (PHAuthorizationStatusAuthorized == authStatus){
        [self callPhotoAction];
    } else {
//        NSURL *url = [[NSURL alloc] initWithString:UIApplicationOpenSettingsURLString];
//        if( [[UIApplication sharedApplication] canOpenURL:url]) {
//            [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];
//        }
    }
}

- (void)callPhotoAction {
    
    [[self imagePickerController] setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    [self imagePickerController].modalPresentationStyle  = UIModalPresentationFullScreen;

    [_viewController presentViewController:[self imagePickerController] animated:YES completion:^{
        
    }];
    
}



- (void)pickImage:(UIImage *)image {
    if (self.delegate != nil && [self.delegate respondsToSelector:@selector(KIImagePickerController:didFinishPickImage:)]) {
        [self.delegate KIImagePickerController:self didFinishPickImage:image];
    }
    [self dismiss];
}

- (void)didSelectedOtherIndex:(NSUInteger)index {
    if (self.delegate != nil && [self.delegate respondsToSelector:@selector(KIImagePickerController:didSelectedOtherIndex:)]) {
        [self.delegate KIImagePickerController:self didSelectedOtherIndex:index];
    }
}

- (void)dismiss {
    [[self imagePickerController] dismissViewControllerAnimated:YES completion:^{
        
    }];
}



#pragma mark ==================================================
#pragma mark == UINavigationControllerDelegate
#pragma mark ==================================================
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if ([self.delegate respondsToSelector:@selector(KINavigationController:willShowViewController:animated:)]) {
        [self.delegate KINavigationController:navigationController willShowViewController:viewController animated:animated];
    }
}

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if ([self.delegate respondsToSelector:@selector(KINavigationController:didShowViewController:animated:)]) {
        [self.delegate KINavigationController:navigationController didShowViewController:viewController animated:animated];
    }
}

#pragma mark ==================================================
#pragma mark == UIImagePickerControllerDelegate
#pragma mark ==================================================
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo NS_DEPRECATED_IOS(2_0, 3_0){
    
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    UIImage *image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    //    NSURL   *imageURL = [info objectForKey:@"UIImagePickerControllerReferenceURL"];
    //    NSString *imagePath = [imageURL absoluteString];
    [[UIApplication sharedApplication] setStatusBarHidden:NO];
    if (CGSizeEqualToSize(self.cropSize, CGSizeZero)) {
        [self pickImage:image];
    } else {
   
        KIImageCropperViewController *cropImageViewController = [[KIImageCropperViewController alloc] initWithImage:[image fixOrientation] cropSize:self.cropSize];
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:cropImageViewController];
        [[self imagePickerController] presentViewController:nav animated:YES completion:nil];
        [cropImageViewController setCroppedImage:^(UIImage *image) {
            [self pickImage:image];
        }];
        
    }
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    if ([self.delegate respondsToSelector:@selector(KIImagePickerControllerDidCancel:)]) {
        [self.delegate KIImagePickerControllerDidCancel:self];
    }
    [self dismiss];
}


@end

