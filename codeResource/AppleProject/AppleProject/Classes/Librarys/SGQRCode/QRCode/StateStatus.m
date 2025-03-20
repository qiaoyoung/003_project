// __DEBUG__
// __CLOSE_PRINT__
//
//  KEKEProject
//  KEKEChat
//
//  Created by tyl.
//  Copyright © 2024 Ali. All rights reserved.
//

// __M_A_C_R_O__
//: #import "SGScanCode.h"
#import "StateStatus.h"
//: #import <AVFoundation/AVFoundation.h>
#import <AVFoundation/AVFoundation.h>
//: #import "SGSoundEffect.h"
#import "StateEffect.h"
//: #import "SGQRCodeLog.h"
#import "MaxLog.h"

//: @interface SGScanCode () <AVCaptureMetadataOutputObjectsDelegate, AVCaptureVideoDataOutputSampleBufferDelegate>
@interface StateStatus () <AVCaptureMetadataOutputObjectsDelegate, AVCaptureVideoDataOutputSampleBufferDelegate>
{
    //: SGSoundEffect *soundEffect;
    StateEffect *soundEffect;
}
//: @property (nonatomic, strong) AVCaptureDevice *device;
@property (nonatomic, strong) AVCaptureDevice *device;
//: @property (nonatomic, strong) AVCaptureDeviceInput *deviceInput;
@property (nonatomic, strong) AVCaptureDeviceInput *deviceInput;
//: @property (nonatomic, strong) AVCaptureMetadataOutput *metadataOutput;
@property (nonatomic, strong) AVCaptureMetadataOutput *metadataOutput;
//: @property (nonatomic, strong) AVCaptureVideoDataOutput *videoDataOutput;
@property (nonatomic, strong) AVCaptureVideoDataOutput *videoDataOutput;
//: @property (nonatomic, strong) AVCaptureSession *session;
@property (nonatomic, strong) AVCaptureSession *session;
//: @property (nonatomic, strong) NSArray *metadataObjectTypes;
@property (nonatomic, strong) NSArray *metadataObjectTypes;
//: @property (nonatomic, strong) AVCaptureVideoPreviewLayer *videoPreviewLayer;
@property (nonatomic, strong) AVCaptureVideoPreviewLayer *videoPreviewLayer;
//: @property (nonatomic, strong) dispatch_queue_t captureQueue;
@property (nonatomic, strong) dispatch_queue_t captureQueue;
//: @end
@end

//: @implementation SGScanCode
@implementation StateStatus

//: - (void)dealloc {
- (void)dealloc {
    //: if ([SGQRCodeLog sharedQRCodeLog].log) {
    if ([MaxLog tableLog].log) {
        //: NSLog(@"SGScanCode - - dealloc");
    }
}

//: + (instancetype)scanCode {
+ (instancetype)grayFrame {
    //: return [[self alloc] init];
    return [[self alloc] init];
}

//: - (instancetype)init {
- (instancetype)init {
    //: if ([super init]) {
    if ([super init]) {
        //: self.captureQueue = dispatch_queue_create("com.SGQRCode.captureQueue", DISPATCH_GLOBAL_OBJECT(dispatch_queue_attr_t, _dispatch_queue_attr_concurrent));
        self.captureQueue = dispatch_queue_create("com.SGQRCode.captureQueue", DISPATCH_GLOBAL_OBJECT(dispatch_queue_attr_t, _dispatch_queue_attr_concurrent));

        /// 将设备输入对象添加到会话对象中
        //: if ([self.session canAddInput:self.deviceInput]) {
        if ([self.session canAddInput:self.deviceInput]) {
            //: [self.session addInput:self.deviceInput];
            [self.session addInput:self.deviceInput];
        }

    }
    //: return self;
    return self;
}


//: #pragma mark - - .h公开的属性
#pragma mark - - .h公开的属性
//: - (void)setPreview:(UIView *)preview {
- (void)setPreview:(UIView *)preview {
    //: _preview = preview;
    _preview = preview;
    //: [preview.layer insertSublayer:self.videoPreviewLayer atIndex:0];
    [preview.layer insertSublayer:self.videoPreviewLayer atIndex:0];
}

//: - (void)setDelegate:(id<SGScanCodeDelegate>)delegate {
- (void)setDelegate:(id<FlushDelegate>)delegate {
    //: _delegate = delegate;
    _delegate = delegate;

    /// 将元数据输出对象添加到会话对象中
    //: if ([_session canAddOutput:self.metadataOutput]) {
    if ([_session canAddOutput:self.metadataOutput]) {
        //: [_session addOutput:self.metadataOutput];
        [_session addOutput:self.metadataOutput];
    }

    /// 元数据输出对象的二维码识数据别类型
    //: _metadataOutput.metadataObjectTypes = self.metadataObjectTypes;
    _metadataOutput.metadataObjectTypes = self.metadataObjectTypes;
}

//: - (void)setSampleBufferDelegate:(id<SGScanCodeSampleBufferDelegate>)sampleBufferDelegate {
- (void)setSampleBufferDelegate:(id<TopColor>)sampleBufferDelegate {
    //: _sampleBufferDelegate = sampleBufferDelegate;
    _sampleBufferDelegate = sampleBufferDelegate;

    /// 添加捕获输出流到会话对象；构成识了别光线强弱
    //: if ([_session canAddOutput:self.videoDataOutput]) {
    if ([_session canAddOutput:self.videoDataOutput]) {
        //: [_session addOutput:self.videoDataOutput];
        [_session addOutput:self.videoDataOutput];
    }
}

//: - (void)setRectOfInterest:(CGRect)rectOfInterest {
- (void)setRectOfInterest:(CGRect)rectOfInterest {
    //: _rectOfInterest = rectOfInterest;
    _rectOfInterest = rectOfInterest;
    //: _metadataOutput.rectOfInterest = rectOfInterest;
    _metadataOutput.rectOfInterest = rectOfInterest;
}


//: #pragma mark - - .h公开的方法
#pragma mark - - .h公开的方法
//: - (void)readQRCode:(UIImage *)image completion:(void (^)(NSString *result))completion {
- (void)data:(UIImage *)image showClean:(void (^)(NSString *result))completion {
    //: CIDetector *detector = [CIDetector detectorOfType:CIDetectorTypeQRCode context:nil options:@{CIDetectorAccuracy: CIDetectorAccuracyHigh}];
    CIDetector *detector = [CIDetector detectorOfType:CIDetectorTypeQRCode context:nil options:@{CIDetectorAccuracy: CIDetectorAccuracyHigh}];
    // 获取识别结果
    //: NSArray *features = [detector featuresInImage:[CIImage imageWithCGImage:image.CGImage]];
    NSArray *features = [detector featuresInImage:[CIImage imageWithCGImage:image.CGImage]];

    //: NSString *tempMessageString = nil;
    NSString *tempMessageString = nil;
    //: if (features.count > 0) {
    if (features.count > 0) {
        //: CIQRCodeFeature *feature = features[0];
        CIQRCodeFeature *feature = features[0];
        //: tempMessageString = feature.messageString;
        tempMessageString = feature.messageString;
    }

    //: if (completion) {
    if (completion) {
        //: completion(tempMessageString);
        completion(tempMessageString);
    }

    //: if ([SGQRCodeLog sharedQRCodeLog].log) {
    if ([MaxLog tableLog].log) {
        //: NSLog(@"图片中的二维码数据：%@", tempMessageString);
    }
}

//: - (void)setVideoZoomFactor:(CGFloat)factor {
- (void)setColorView:(CGFloat)factor {
    //: if (factor > self.device.maxAvailableVideoZoomFactor) {
    if (factor > self.device.maxAvailableVideoZoomFactor) {
        //: factor = self.device.maxAvailableVideoZoomFactor;
        factor = self.device.maxAvailableVideoZoomFactor;
    //: } else if (factor < 1) {
    } else if (factor < 1) {
        //: factor = 1;
        factor = 1;
    }
    // 设置焦距大小
    //: if ([self.device lockForConfiguration:nil]) {
    if ([self.device lockForConfiguration:nil]) {
        //: [self.device rampToVideoZoomFactor:factor withRate:10];
        [self.device rampToVideoZoomFactor:factor withRate:10];
        //: [self.device unlockForConfiguration];
        [self.device unlockForConfiguration];
    }
}

//: - (BOOL)checkCameraDeviceRearAvailable {
- (BOOL)join {
    //: BOOL isRearCamera = [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceRear];
    BOOL isRearCamera = [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceRear];
    //: return isRearCamera;
    return isRearCamera;
}

//: - (void)startRunning {
- (void)startRunning {
    //: if (![self.session isRunning]) {
    if (![self.session isRunning]) {
        //: [self.session startRunning];
        [self.session startRunning];
    }
}

- (void)stopRunning {
    //: if ([self.session isRunning]) {
    if ([self.session isRunning]) {
        //: [self.session stopRunning];
        [self.session stopRunning];
    }
}

//: - (void)playSoundEffect:(NSString *)name {
- (void)value:(NSString *)name {
    /// 静态库 path 的获取
    //: NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:nil];
    NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:nil];
    //: if (!path) {
    if (!path) {
        /// 动态库 path 的获取
        //: path = [[NSBundle bundleForClass:[self class]] pathForResource:name ofType:nil];
        path = [[NSBundle bundleForClass:[self class]] pathForResource:name ofType:nil];
    }

    //: soundEffect = [SGSoundEffect soundEffectWithFilepath:path];
    soundEffect = [StateEffect recording:path];
    //: [soundEffect play];
    [soundEffect inputSignalTool];
}


//: #pragma mark - - 内部属性
#pragma mark - - 内部属性
//: - (AVCaptureSession *)session {
- (AVCaptureSession *)session {
    //: if (!_session) {
    if (!_session) {
        //: _session = [[AVCaptureSession alloc] init];
        _session = [[AVCaptureSession alloc] init];
        //: _session.sessionPreset = [self sessionPreset];
        _session.sessionPreset = [self mediaName];
    }
    //: return _session;
    return _session;
}

//: - (AVCaptureDevice *)device {
- (AVCaptureDevice *)device {
    //: if (!_device) {
    if (!_device) {
        //: _device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
        _device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    }
    //: return _device;
    return _device;
}

//: - (AVCaptureDeviceInput *)deviceInput {
- (AVCaptureDeviceInput *)deviceInput {
    //: if (!_deviceInput) {
    if (!_deviceInput) {
        //: _deviceInput = [AVCaptureDeviceInput deviceInputWithDevice:self.device error:nil];
        _deviceInput = [AVCaptureDeviceInput deviceInputWithDevice:self.device error:nil];
    }
    //: return _deviceInput;
    return _deviceInput;
}

//: - (AVCaptureMetadataOutput *)metadataOutput {
- (AVCaptureMetadataOutput *)metadataOutput {
    //: if (!_metadataOutput) {
    if (!_metadataOutput) {
        //: _metadataOutput = [[AVCaptureMetadataOutput alloc] init];
        _metadataOutput = [[AVCaptureMetadataOutput alloc] init];
        //: [_metadataOutput setMetadataObjectsDelegate:self queue:self.captureQueue];
        [_metadataOutput setMetadataObjectsDelegate:self queue:self.captureQueue];
    }
    //: return _metadataOutput;
    return _metadataOutput;
}

//: - (AVCaptureVideoDataOutput *)videoDataOutput {
- (AVCaptureVideoDataOutput *)videoDataOutput {
    //: if (!_videoDataOutput) {
    if (!_videoDataOutput) {
        //: _videoDataOutput = [[AVCaptureVideoDataOutput alloc] init];
        _videoDataOutput = [[AVCaptureVideoDataOutput alloc] init];
        //: [_videoDataOutput setSampleBufferDelegate:self queue:self.captureQueue];
        [_videoDataOutput setSampleBufferDelegate:self queue:self.captureQueue];
    }
    //: return _videoDataOutput;
    return _videoDataOutput;
}

//: - (AVCaptureVideoPreviewLayer *)videoPreviewLayer {
- (AVCaptureVideoPreviewLayer *)videoPreviewLayer {
    //: if (!_videoPreviewLayer) {
    if (!_videoPreviewLayer) {
        //: _videoPreviewLayer = [AVCaptureVideoPreviewLayer layerWithSession:_session];
        _videoPreviewLayer = [AVCaptureVideoPreviewLayer layerWithSession:_session];
        //: _videoPreviewLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
        _videoPreviewLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
        //: _videoPreviewLayer.frame = self.preview.frame;
        _videoPreviewLayer.frame = self.preview.frame;
    }
    //: return _videoPreviewLayer;
    return _videoPreviewLayer;
}

//: - (NSArray *)metadataObjectTypes {
- (NSArray *)metadataObjectTypes {
    //: if (!_metadataObjectTypes) {
    if (!_metadataObjectTypes) {
        //: _metadataObjectTypes = @[
        _metadataObjectTypes = @[
            //: AVMetadataObjectTypeUPCECode,
            AVMetadataObjectTypeUPCECode,
            //: AVMetadataObjectTypeCode39Code,
            AVMetadataObjectTypeCode39Code,
            //: AVMetadataObjectTypeCode39Mod43Code,
            AVMetadataObjectTypeCode39Mod43Code,
            //: AVMetadataObjectTypeEAN13Code,
            AVMetadataObjectTypeEAN13Code,
            //: AVMetadataObjectTypeEAN8Code,
            AVMetadataObjectTypeEAN8Code,
            //: AVMetadataObjectTypeCode93Code,
            AVMetadataObjectTypeCode93Code,
            //: AVMetadataObjectTypeCode128Code,
            AVMetadataObjectTypeCode128Code,
            //: AVMetadataObjectTypePDF417Code,
            AVMetadataObjectTypePDF417Code,
            //: AVMetadataObjectTypeQRCode,
            AVMetadataObjectTypeQRCode,
            //: AVMetadataObjectTypeAztecCode,
            AVMetadataObjectTypeAztecCode,
            //: AVMetadataObjectTypeInterleaved2of5Code,
            AVMetadataObjectTypeInterleaved2of5Code,
            //: AVMetadataObjectTypeITF14Code,
            AVMetadataObjectTypeITF14Code,
            //: AVMetadataObjectTypeDataMatrixCode,
            AVMetadataObjectTypeDataMatrixCode,
        //: ];
        ];
    }
    //: return _metadataObjectTypes;
    return _metadataObjectTypes;
}

//: - (NSString *)sessionPreset {
- (NSString *)mediaName {
    //: if ([self.device supportsAVCaptureSessionPreset:AVCaptureSessionPreset3840x2160]) {
    if ([self.device supportsAVCaptureSessionPreset:AVCaptureSessionPreset3840x2160]) {
        //: return AVCaptureSessionPreset3840x2160;
        return AVCaptureSessionPreset3840x2160;
    }
    //: if ([self.device supportsAVCaptureSessionPreset:AVCaptureSessionPreset1920x1080]) {
    if ([self.device supportsAVCaptureSessionPreset:AVCaptureSessionPreset1920x1080]) {
        //: return AVCaptureSessionPreset1920x1080;
        return AVCaptureSessionPreset1920x1080;
    }
    //: if ([self.device supportsAVCaptureSessionPreset:AVCaptureSessionPreset1280x720]) {
    if ([self.device supportsAVCaptureSessionPreset:AVCaptureSessionPreset1280x720]) {
        //: return AVCaptureSessionPreset1280x720;
        return AVCaptureSessionPreset1280x720;
    }
    //: if ([self.device supportsAVCaptureSessionPreset:AVCaptureSessionPreset640x480]) {
    if ([self.device supportsAVCaptureSessionPreset:AVCaptureSessionPreset640x480]) {
        //: return AVCaptureSessionPreset640x480;
        return AVCaptureSessionPreset640x480;
    }
    //: if ([self.device supportsAVCaptureSessionPreset:AVCaptureSessionPreset352x288]) {
    if ([self.device supportsAVCaptureSessionPreset:AVCaptureSessionPreset352x288]) {
        //: return AVCaptureSessionPreset352x288;
        return AVCaptureSessionPreset352x288;
    }
    //: if ([self.device supportsAVCaptureSessionPreset:AVCaptureSessionPresetHigh]) {
    if ([self.device supportsAVCaptureSessionPreset:AVCaptureSessionPresetHigh]) {
        //: return AVCaptureSessionPresetHigh;
        return AVCaptureSessionPresetHigh;
    }
    //: if ([self.device supportsAVCaptureSessionPreset:AVCaptureSessionPresetMedium]) {
    if ([self.device supportsAVCaptureSessionPreset:AVCaptureSessionPresetMedium]) {
        //: return AVCaptureSessionPresetMedium;
        return AVCaptureSessionPresetMedium;
    }

    //: return AVCaptureSessionPresetLow;
    return AVCaptureSessionPresetLow;
}

//: #pragma mark - - AVCaptureMetadataOutputObjectsDelegate 的方法
#pragma mark - - AVCaptureMetadataOutputObjectsDelegate 的方法
//: - (void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection {
- (void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection {
    //: if (metadataObjects != nil && metadataObjects.count > 0) {
    if (metadataObjects != nil && metadataObjects.count > 0) {
        //: AVMetadataMachineReadableCodeObject *obj = metadataObjects[0];
        AVMetadataMachineReadableCodeObject *obj = metadataObjects[0];
        //: NSString *resultString = obj.stringValue;
        NSString *resultString = obj.stringValue;

        //: dispatch_async(dispatch_get_main_queue(), ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            //: if (self.delegate && [self.delegate respondsToSelector:@selector(scanCode:result:)]) {
            if (self.delegate && [self.delegate respondsToSelector:@selector(should:centerRange:)]) {
                //: [self.delegate scanCode:self result:resultString];
                [self.delegate should:self centerRange:resultString];
            }
        //: });
        });

        //: if ([SGQRCodeLog sharedQRCodeLog].log) {
        if ([MaxLog tableLog].log) {
            //: NSLog(@"扫描的二维码数据：%@", obj);
        }
    }
}

//: #pragma mark - - AVCaptureVideoDataOutputSampleBufferDelegate 的方法
#pragma mark - - AVCaptureVideoDataOutputSampleBufferDelegate 的方法
//: - (void)captureOutput:(AVCaptureOutput *)captureOutput didOutputSampleBuffer:(CMSampleBufferRef)sampleBuffer fromConnection:(AVCaptureConnection *)connection {
- (void)captureOutput:(AVCaptureOutput *)captureOutput didOutputSampleBuffer:(CMSampleBufferRef)sampleBuffer fromConnection:(AVCaptureConnection *)connection {
    //: CFDictionaryRef metadataDict = CMCopyDictionaryOfAttachments(NULL, sampleBuffer, kCMAttachmentMode_ShouldPropagate);
    CFDictionaryRef metadataDict = CMCopyDictionaryOfAttachments(NULL, sampleBuffer, kCMAttachmentMode_ShouldPropagate);
    //: NSDictionary *metadata = [[NSMutableDictionary alloc] initWithDictionary:(__bridge NSDictionary*)metadataDict];
    NSDictionary *metadata = [[NSMutableDictionary alloc] initWithDictionary:(__bridge NSDictionary*)metadataDict];
    //: CFRelease(metadataDict);
    CFRelease(metadataDict);
    //: NSDictionary *exifMetadata = [[metadata objectForKey:(NSString *)kCGImagePropertyExifDictionary] mutableCopy];
    NSDictionary *exifMetadata = [[metadata objectForKey:(NSString *)kCGImagePropertyExifDictionary] mutableCopy];
    //: CGFloat brightnessValue = [[exifMetadata objectForKey:(NSString *)kCGImagePropertyExifBrightnessValue] floatValue];
    CGFloat brightnessValue = [[exifMetadata objectForKey:(NSString *)kCGImagePropertyExifBrightnessValue] floatValue];

    //: dispatch_async(dispatch_get_main_queue(), ^{
    dispatch_async(dispatch_get_main_queue(), ^{
        //: if (self.sampleBufferDelegate && [self.sampleBufferDelegate respondsToSelector:@selector(scanCode:brightness:)]) {
        if (self.sampleBufferDelegate && [self.sampleBufferDelegate respondsToSelector:@selector(with:afterToFloat:)]) {
            //: [self.sampleBufferDelegate scanCode:self brightness:brightnessValue];
            [self.sampleBufferDelegate with:self afterToFloat:brightnessValue];
        }
    //: });
    });
}


//: @end
@end
