//
// AppleProjectKitPhotoFetcher.m
// AppleProjectKit
//
//  Created by chris on 2016/11/12.
//  Copyright © 2016年 NetEase. All rights reserved.
//

#import "BBBKitMediaFetcher.h"
#import <MobileCoreServices/MobileCoreServices.h>
#import "AAAKitFileLocationHelper.h"
#import "CCCMessageMaker.h"
#import "CCCGlobalMacro.h"
#import "CCCKitDependency.h"
#import "TZImageManager.h"
#import "CCCKitProgressHUD.h"
#import "UIImage+AppleProjectKit.h"
#import "BBBKitMediaPickerController.h"
#import "AVAsset+AppleProjectKit.h"

@interface BBBKitMediaFetcher()<CCCKitMediaPickerDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate>

@property (nonatomic,copy)   NIMKitLibraryFetchResult libraryResultHandler;

@property (nonatomic,copy)   NIMKitCameraFetchResult  cameraResultHandler;

@property (nonatomic,weak) UIImagePickerController  *imagePicker;

@property (nonatomic,strong) BBBKitMediaPickerController  *assetsPicker;

@end

@implementation BBBKitMediaFetcher

- (instancetype)init
{
    self = [super init];
    if (self) {
        _mediaTypes = @[(NSString *)kUTTypeMovie,(NSString *)kUTTypeImage, (NSString *)kUTTypeGIF];
        _limit = 9;
    }
    return self;
}

- (void)fetchPhotoFromLibrary:(NIMKitLibraryFetchResult)result
{
    __weak typeof(self) weakSelf = self;
    [self setUpPhotoLibrary:^(UIViewController * _Nullable picker) {
        if (picker && weakSelf) {
            weakSelf.assetsPicker = picker;
            weakSelf.libraryResultHandler = result;
            UIViewController *rootVC = [UIApplication sharedApplication].windows.firstObject.rootViewController;
            picker.modalPresentationStyle = UIModalPresentationFullScreen;
            if (rootVC.presentedViewController) {
                [rootVC.presentedViewController presentViewController:picker animated:YES completion:nil];
            } else {
                [rootVC presentViewController:picker animated:YES completion:nil];
            }
        }else{
            result(nil,nil,PHAssetMediaTypeUnknown);
        }
    }];
}

- (void)fetchMediaFromCamera:(NIMKitCameraFetchResult)result
{
    if ([self initCamera]) {
        self.cameraResultHandler = result;
#if TARGET_IPHONE_SIMULATOR
        NSAssert(0, @"not supported");
#elif TARGET_OS_IPHONE
        
        UIImagePickerController *imagePicker = [self setupImagePicker];
        UIViewController *rootVC = [UIApplication sharedApplication].windows.firstObject.rootViewController;
        rootVC.modalPresentationStyle = UIModalPresentationFullScreen;
        if (rootVC.presentedViewController) {
            [rootVC.presentedViewController presentViewController:imagePicker animated:YES completion:nil];
        } else {
            [rootVC presentViewController:imagePicker animated:YES completion:nil];
        }
        _imagePicker = imagePicker;
#endif
    }
}

- (UIImagePickerController *)setupImagePicker {
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.delegate = self;
    imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    imagePicker.mediaTypes = self.mediaTypes;
    
    BOOL allowMovie = [_mediaTypes containsObject:(NSString *)kUTTypeMovie];
    BOOL allowPhoto = [_mediaTypes containsObject:(NSString *)kUTTypeImage];
    if (allowMovie && !allowPhoto) {
        imagePicker.cameraCaptureMode = UIImagePickerControllerCameraCaptureModeVideo;
    } else {
        imagePicker.cameraCaptureMode = UIImagePickerControllerCameraCaptureModePhoto;
    }
    imagePicker.videoQuality = UIImagePickerControllerQualityTypeHigh;
    return imagePicker;
}

- (void)setupPicker:(void(^)(UIViewController * _Nullable picker)) handler {
    UIViewController *pickerVC = nil;
    BBBKitMediaPickerController *vc = [[BBBKitMediaPickerController alloc] initWithMaxImagesCount:self.limit];
    vc.nim_delegate = self;
    vc.mediaTypes = self.mediaTypes;
    self.assetsPicker = vc;
    pickerVC = vc;
    if (handler) {
        handler(pickerVC);
    }
}

- (void)setUpPhotoLibrary:(void(^)(UIViewController * _Nullable picker)) handler
{
    __weak typeof(self) weakSelf = self;
#if __IPHONE_OS_VERSION_MAX_ALLOWED < 140000
    [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status){
        dispatch_async(dispatch_get_main_queue(), ^{
            if (status == PHAuthorizationStatusRestricted || status == PHAuthorizationStatusDenied) {
                [[[UIAlertView alloc] initWithTitle:nil
                                            message:@"相册权限受限".nim_localized
                                           delegate:nil
                                  cancelButtonTitle:LangKey(@"contact_tag_fragment_sure")
                                  otherButtonTitles:nil] show];
                if(handler) handler(nil);
            }
            if (status == PHAuthorizationStatusAuthorized) {
                [weakSelf setupPicker:handler];
            }
        });
    }];
#else
    if (@available(iOS 14, *)) {
        PHAuthorizationStatus rstatus = [PHPhotoLibrary authorizationStatusForAccessLevel:PHAccessLevelReadWrite];
        switch (rstatus) {
            case PHAuthorizationStatusNotDetermined:
            {
                [PHPhotoLibrary requestAuthorizationForAccessLevel:PHAccessLevelReadWrite handler:^(PHAuthorizationStatus status) {
                    dispatch_async(dispatch_get_main_queue(), ^{
                        if (status == PHAuthorizationStatusRestricted
                            || status == PHAuthorizationStatusDenied
                            || status == PHAuthorizationStatusLimited) {
                            dispatch_async(dispatch_get_main_queue(), ^{
                                if(handler) handler(nil);
                            });
                        } else if (status == PHAuthorizationStatusAuthorized) {
                            [weakSelf setupPicker:handler];
                        }
                    });
                }];
            }
                break;
            case PHAuthorizationStatusAuthorized:
            case PHAuthorizationStatusLimited:
            {
                [weakSelf setupPicker:handler];
            }
                break;
                
            default:
            {
                [[[UIAlertView alloc] initWithTitle:LangKey(@"warm_prompt")
                                            message:LangKey(@"setting_privacy")
                                           delegate:self
                                  cancelButtonTitle:LangKey(@"contact_tag_fragment_cancel")
                                  otherButtonTitles:LangKey(@"contact_tag_fragment_sure"),nil] show];
                
//                UIAlertController *alertControl = [UIAlertController alertControllerWithTitle:LangKey(@"warm_prompt") message:LangKey(@"setting_privacy") preferredStyle:UIAlertControllerStyleAlert];
//                [alertControl addAction:([UIAlertAction actionWithTitle:LangKey(@"contact_tag_fragment_cancel") style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
//                }])];
//                [alertControl addAction:([UIAlertAction actionWithTitle:LangKey(@"tag_activity_set") style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//                    NSURL *url = [[NSURL alloc] initWithString:UIApplicationOpenSettingsURLString];
//                    if( [[UIApplication sharedApplication] canOpenURL:url]) {
//                        [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];
//                    }
//                }])];
//                [self presentViewController:alertControl animated:YES completion:nil];
                
                
                
                if(handler) handler(nil);
            }
                break;
        }
    } else {
        [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status){
            dispatch_async(dispatch_get_main_queue(), ^{
                if (status == PHAuthorizationStatusRestricted || status == PHAuthorizationStatusDenied) {

                    
                    [[[UIAlertView alloc] initWithTitle:LangKey(@"warm_prompt")
                                                message:LangKey(@"setting_privacy")
                                               delegate:self
                                      cancelButtonTitle:LangKey(@"contact_tag_fragment_cancel")
                                      otherButtonTitles:LangKey(@"contact_tag_fragment_sure"),nil] show];
                    
                    if(handler) handler(nil);
                }
                if (status == PHAuthorizationStatusAuthorized) {
                    [weakSelf setupPicker:handler];
                }
            });
        }];
    }
#endif
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(buttonIndex == 1){
        NSURL *url = [[NSURL alloc] initWithString:UIApplicationOpenSettingsURLString];
                            if( [[UIApplication sharedApplication] canOpenURL:url]) {
                                [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];
                            }
    }

}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    NSString *mediaType = info[UIImagePickerControllerMediaType];
    if ([mediaType isEqualToString:(NSString *)kUTTypeMovie]) {
        
        __weak typeof(self) weakSelf = self;
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            NSURL *inputURL  = [info objectForKey:UIImagePickerControllerMediaURL];
            NSString *outputFileName = [AAAKitFileLocationHelper genFilenameWithExt:@"mp4"];
            NSString *outputPath = [AAAKitFileLocationHelper filepathForVideo:outputFileName];
            AVURLAsset *asset = [AVURLAsset URLAssetWithURL:inputURL options:nil];
            AVAssetExportSession *session = [[AVAssetExportSession alloc] initWithAsset:asset
                                                                             presetName:AVAssetExportPresetMediumQuality];
            session.outputURL = [NSURL fileURLWithPath:outputPath];
            session.outputFileType = AVFileTypeMPEG4;   // 支持安卓某些机器的视频播放
            session.shouldOptimizeForNetworkUse = YES;
            session.videoComposition = [asset nim_videoComposition];  //修正某些播放器不识别视频Rotation的问题
            [session exportAsynchronouslyWithCompletionHandler:^(void)
             {
                 dispatch_async(dispatch_get_main_queue(), ^{
                     if (!weakSelf.cameraResultHandler)
                     {
                         return;
                     }
                     
                     if (session.status == AVAssetExportSessionStatusCompleted)
                     {
                         weakSelf.cameraResultHandler(outputPath,nil);
                     }
                     else
                     {
                         weakSelf.cameraResultHandler(nil,nil);
                     }
                     weakSelf.cameraResultHandler = nil;
                 });
             }];
            
        });
        
    } else {
        if (!self.cameraResultHandler)
        {
            return;
        }
        
        UIImage *image = info[UIImagePickerControllerOriginalImage];
        image = [image nim_fixOrientation];
        
        // MARK: - 处理图片
        CGSize imgSize = image.size;
        //所有上传照片最大像素等比例压缩
        CGFloat maxPix = 414;
        
        if (imgSize.width > imgSize.height) {
            CGFloat  scale = imgSize.height/imgSize.width;
            if (imgSize.width > maxPix) {
                imgSize.width = maxPix;
                imgSize.height = scale * maxPix;
            }
        }else {
            CGFloat  scale = imgSize.width/imgSize.height;
            if (imgSize.height > maxPix) {
                imgSize.height = maxPix;
                imgSize.width = scale * maxPix;
            }
        }
        
        image = [self imageWithImage:image scaledToSize:imgSize opaque:YES];
        
        self.cameraResultHandler(nil,image);
        self.cameraResultHandler = nil;
    }
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (UIImage*)imageWithImage:(UIImage*)image scaledToSize:(CGSize)newSize opaque:(BOOL)opaque
{
    NSInteger newSizeW = (NSInteger)newSize.width;  //  转化为整型,不然像素补全会出现黑边
    NSInteger newSizeH = (NSInteger)newSize.height;
    
//    if ([[UIScreen mainScreen] respondsToSelector:@selector(scale)]) {
//        UIGraphicsBeginImageContextWithOptions(newSize, opaque, [UIScreen mainScreen].scale);
//    } else {
//        UIGraphicsBeginImageContext(newSize);
//    }
    UIGraphicsBeginImageContext(newSize);
        
    [image drawInRect:CGRectMake(0,0,newSizeW,newSizeH)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return newImage;
}


#pragma mark - 相册回调
- (void)onPickerSelectedWithType:(PHAssetMediaType)type
                          images:(nullable NSArray *)images
                            path:(nullable NSString *)path {
    if (_libraryResultHandler) {
        _libraryResultHandler(images, path, type);
    }
}


#pragma mark - Private
- (void)setMediaTypes:(NSArray *)mediaTypes
{
    _mediaTypes = mediaTypes;
    _imagePicker.mediaTypes = mediaTypes;
    _assetsPicker.mediaTypes = mediaTypes;
}

- (BOOL)initCamera{
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {

        
        [[[UIAlertView alloc] initWithTitle:LangKey(@"warm_prompt")
                                    message:LangKey(@"setting_privacy_camera")
                                   delegate:self
                          cancelButtonTitle:LangKey(@"contact_tag_fragment_cancel")
                          otherButtonTitles:LangKey(@"contact_tag_fragment_sure"),nil] show];
        return NO;
    }
    NSString *mediaType = AVMediaTypeVideo;
    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:mediaType];
    if(authStatus == AVAuthorizationStatusRestricted || authStatus == AVAuthorizationStatusDenied){

        
        [[[UIAlertView alloc] initWithTitle:LangKey(@"warm_prompt")
                                    message:LangKey(@"setting_privacy_camera")
                                   delegate:self
                          cancelButtonTitle:LangKey(@"contact_tag_fragment_cancel")
                          otherButtonTitles:LangKey(@"contact_tag_fragment_sure"),nil] show];
        
        return NO;
        
    }
    return YES;
}
@end
