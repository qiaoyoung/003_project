
#import <Foundation/Foundation.h>

NSString *StringFromCeremonyData(Byte *data);


//: status
Byte str_questionShouldContent[] = {56, 6, 94, 10, 153, 199, 30, 166, 241, 146, 209, 210, 191, 210, 211, 209, 235};

// __DEBUG__
// __CLOSE_PRINT__
//
//  StatuteTitleControl.m
// Indicator
//
//  Created by chris on 15/4/10.
//  Copyright (c) 2015年 Netease. All rights reserved.
//
//#import "WMPlayerModel.h"
//#import "WMPlayer.h"

// __M_A_C_R_O__
//: #import "CCCSessionVideoContentView.h"
#import "StatuteTitleControl.h"
//: #import "BBBMessageModel.h"
#import "AccumulationCenter.h"
//: #import "UIViewNimKit.h"
#import "UIViewNimKit.h"
//: #import "UIImage+AppleProjectKit.h"
#import "UIImage+Indicator.h"
//: #import "BBBLoadProgressView.h"
#import "ShouldContentView.h"
//: #import "NTESAVMoivePlayerController.h"
#import "ShowController.h"
//: #import <AVFoundation/AVFoundation.h>
#import <AVFoundation/AVFoundation.h>

//: static void *KVO_AVPlayerItem_state = &KVO_AVPlayerItem_state;
static void *k_headValue = &k_headValue;

//: @interface CCCSessionVideoContentView()
@interface StatuteTitleControl()

//: @property (nonatomic,strong,readwrite) UIImageView * imageView;
@property (nonatomic,strong,readwrite) UIImageView * imageView;

//: @property (nonatomic,strong) UIButton *playBtn;
@property (nonatomic,strong) UIButton *playBtn;

//: @property (nonatomic,strong) BBBLoadProgressView * progressView;
@property (nonatomic,strong) ShouldContentView * progressView;

//: @property (nonatomic, strong) NSURL *fileURL;
@property (nonatomic, strong) NSURL *fileURL;
//: @property (nonatomic, strong) AVPlayerItem *playerItem;
@property (nonatomic, strong) AVPlayerItem *playerItem;
//: @property (nonatomic, strong) AVPlayer *player;
@property (nonatomic, strong) AVPlayer *player;
//: @property (nonatomic, strong) AVPlayerLayer *playerLayer;
@property (nonatomic, strong) AVPlayerLayer *playerLayer;

//: @property (nonatomic,strong) NTESAVMoivePlayerController *avPlayer;
@property (nonatomic,strong) ShowController *avPlayer;
//: @property (nonatomic, strong) UCZProgressView *progress;
@property (nonatomic, strong) UCZProgressView *progress;
//: @property (nonatomic, strong) UIActivityIndicatorView *activity;
@property (nonatomic, strong) UIActivityIndicatorView *activity;
//: @end
@end

//: @implementation CCCSessionVideoContentView
@implementation StatuteTitleControl

//: - (instancetype)initSessionMessageContentView{
- (instancetype)initMessageOpen{
    //: self = [super initSessionMessageContentView];
    self = [super initMessageOpen];
    //: if (self) {
    if (self) {
        //: self.opaque = YES;
        self.opaque = YES;
//        self.progress = [[UCZProgressView alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
//        self.progress.translatesAutoresizingMaskIntoConstraints = NO;
//        self.progress.tintColor = [UIColor colorWithPatternImage:[LandHelper getLinearGradientImage:RGB_COLOR_String(kCommonBGColor_begin) and:RGB_COLOR_String(kCommonBGColor_end) directionType:SNLinearGradientDirectionLevel]];
//        [self addSubview:self.progress];

        //: _imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        _imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        //: _imageView.backgroundColor = [UIColor clearColor];
        _imageView.backgroundColor = [UIColor clearColor];
        //: [self addSubview:_imageView];
        [self addSubview:_imageView];

//        _activity = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleMedium];
//        _activity.color = [UIColor grayColor];
//        [self addSubview:_activity];



//        self.progress = [[UCZProgressView alloc] initWithFrame:self.imageView.bounds];
//        self.progress.translatesAutoresizingMaskIntoConstraints = NO;
////        self.progressView.showsText = YES;
////        self.progressView.tintColor = [KEKESkinColorManager shareInstance].skinColor;
//        self.progress.tintColor = [UIColor colorWithPatternImage:[LandHelper getLinearGradientImage:RGB_COLOR_String(kCommonBGColor_begin) and:RGB_COLOR_String(kCommonBGColor_end) directionType:SNLinearGradientDirectionLevel]];
//        [self addSubview:self.progress];
//
//        NSDictionary *views = NSDictionaryOfVariableBindings(_progress);
//        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[_progressView]-0-|" options:0 metrics:nil views:views]];
//        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[_progressView]-0-|" options:0 metrics:nil views:views]];

//        _playBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//        [_playBtn setImage:[UIImage imageNamed:@"icon_play_normal"] forState:UIControlStateNormal];
//        [_playBtn sizeToFit];
//        [_playBtn setUserInteractionEnabled:NO];
//        [self addSubview:_playBtn];

        //: _progressView = [[BBBLoadProgressView alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
        _progressView = [[ShouldContentView alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
        //: _progressView.maxProgress = 1.0;
        _progressView.maxProgress = 1.0;
        //: [self addSubview:_progressView];
        [self addSubview:_progressView];

//
    }
    //: return self;
    return self;
}

//: - (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    //: if ([keyPath isEqualToString:@"status"]) {
    if ([keyPath isEqualToString:StringFromCeremonyData(str_questionShouldContent)]) {
        //: AVPlayerItem * item = (AVPlayerItem *)object;
        AVPlayerItem * item = (AVPlayerItem *)object;
        //: if (item.status == AVPlayerItemStatusReadyToPlay) {
        if (item.status == AVPlayerItemStatusReadyToPlay) {
            //: _progressView.hidden = YES;
            _progressView.hidden = YES;
//            self.progress.hidden = YES;

//             [self.player replaceCurrentItemWithPlayerItem:item];
             //: [self.player play];
             [self.player play];
        //: }else if (item.status == AVPlayerItemStatusFailed){
        }else if (item.status == AVPlayerItemStatusFailed){
             //: NSLog(@"failed");
//            _progressView.hidden = NO;

//            [self.player replaceCurrentItemWithPlayerItem:item];
//            [self.player play];
        }
   }
}

//: - (void)refresh:(BBBMessageModel *)data{
- (void)video:(AccumulationCenter *)data{
    //: [super refresh:data];
    [super video:data];
    //: NIMVideoObject * videoObject = (NIMVideoObject*)self.model.message.messageObject;
    NIMVideoObject * videoObject = (NIMVideoObject*)self.model.message.messageObject;
    //: UIImage * image = [UIImage imageWithContentsOfFile:videoObject.coverPath];
    UIImage * image = [UIImage imageWithContentsOfFile:videoObject.coverPath];
    //: if (image) {
    if (image) {
         //: self.imageView.image = image;
         self.imageView.image = image;
     //: } else {
     } else {
         //: if (videoObject.url.length > 0)
         if (videoObject.url.length > 0)
         {
             //: NSString *videoUrl = videoObject.coverUrl;
             NSString *videoUrl = videoObject.coverUrl;
             //: [self.imageView sd_setImageWithURL:[NSURL URLWithString:[videoUrl stringByReplacingOccurrencesOfString:@" " withString:@""]]];
             [self.imageView sd_setImageWithURL:[NSURL URLWithString:[videoUrl stringByReplacingOccurrencesOfString:@" " withString:@""]]];
         }
     }

    //: [_playerItem removeObserver:self forKeyPath:@"status" context:KVO_AVPlayerItem_state];
    [_playerItem removeObserver:self forKeyPath:StringFromCeremonyData(str_questionShouldContent) context:k_headValue];
    //: NSURL *fileURL = [NSURL URLWithString:videoObject.url];
    NSURL *fileURL = [NSURL URLWithString:videoObject.url];
    //: AVAsset *asset = [AVURLAsset URLAssetWithURL:fileURL options:nil];
    AVAsset *asset = [AVURLAsset URLAssetWithURL:fileURL options:nil];
    //: _playerItem = [AVPlayerItem playerItemWithAsset:asset];
    _playerItem = [AVPlayerItem playerItemWithAsset:asset];
    //: [_playerItem addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionNew context:KVO_AVPlayerItem_state];
    [_playerItem addObserver:self forKeyPath:StringFromCeremonyData(str_questionShouldContent) options:NSKeyValueObservingOptionNew context:k_headValue];

    //player
    //: [self setupPlayer];
    [self pinButton];

    //: [self.imageView.layer addSublayer:self.playerLayer];
    [self.imageView.layer addSublayer:self.playerLayer];
//    self.playerLayer.frame = self.imageView.bounds;

//    [self.player replaceCurrentItemWithPlayerItem:_playerItem];
    //: [self.player play];
    [self.player play];

    //: NSLog(@"加载状态- %ld",(long)self.model.message.attachmentDownloadState);
    //: BOOL isSending = (self.model.message.deliveryState == NIMMessageDeliveryStateDelivering);
    BOOL isSending = (self.model.message.deliveryState == NIMMessageDeliveryStateDelivering);
    //: BOOL isDowning = (self.model.message.attachmentDownloadState == NIMMessageAttachmentDownloadStateDownloading);
    BOOL isDowning = (self.model.message.attachmentDownloadState == NIMMessageAttachmentDownloadStateDownloading);

    //: _progressView.hidden = !(isSending || isDowning);
    _progressView.hidden = !(isSending || isDowning);

//    _progressView.hidden         = YES;
    //: if (!_progressView.hidden) {
    if (!_progressView.hidden) {
        //: [_progressView setProgress:[[[NIMSDK sharedSDK] chatManager] messageTransportProgress:self.model.message]];
        [_progressView setValueProgress:[[[NIMSDK sharedSDK] chatManager] messageTransportProgress:self.model.message]];
    }
}

//: - (void)dealloc {
- (void)dealloc {
    //: [[NSNotificationCenter defaultCenter] removeObserver:self];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

//: - (void)setupPlayer {
- (void)pinButton {
    //: if (!_player) {
    if (!_player) {
        //: _player = [AVPlayer playerWithPlayerItem:_playerItem];
        _player = [AVPlayer playerWithPlayerItem:_playerItem];
        //: _player.actionAtItemEnd = AVPlayerActionAtItemEndNone;
        _player.actionAtItemEnd = AVPlayerActionAtItemEndNone;
    }
}

//: - (AVPlayerLayer *)playerLayer
- (AVPlayerLayer *)playerLayer
{
    //: if(!_playerLayer){
    if(!_playerLayer){
        //: _playerLayer = [AVPlayerLayer playerLayerWithPlayer:self.player];
        _playerLayer = [AVPlayerLayer playerLayerWithPlayer:self.player];
        //: _playerLayer.videoGravity = AVLayerVideoGravityResizeAspect;
        _playerLayer.videoGravity = AVLayerVideoGravityResizeAspect;
        //: _playerLayer.frame = self.imageView.bounds;
        _playerLayer.frame = self.imageView.bounds;
        //: [self.imageView.layer addSublayer:_playerLayer];
        [self.imageView.layer addSublayer:_playerLayer];
    }
    //: return _playerLayer;
    return _playerLayer;
}

//: - (void)startPlay{
- (void)at{
    //: self.avPlayer.view.frame = self.imageView.bounds;
    self.avPlayer.view.frame = self.imageView.bounds;
    //: self.avPlayer.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.avPlayer.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;

    //: [self.avPlayer prepareToPlay];
    [self.avPlayer buttonText];
    //: [self.imageView addSubview:self.avPlayer.view];
    [self.imageView addSubview:self.avPlayer.view];

//    [[NSNotificationCenter defaultCenter] addObserver:self
//                                             selector:@selector(moviePlaybackComplete:)
//                                                 name:NTESAVMoviePlayerPlaybackDidFinishNotification
//                                               object:self.avPlayer];
//
//    [[NSNotificationCenter defaultCenter] addObserver:self
//                                             selector:@selector(moviePlayStateChanged:)
//                                                 name:NTESAVMoviePlayerPlaybackStateDidChangeNotification
//                                               object:self.avPlayer];


}

//: - (NTESAVMoivePlayerController *)avPlayer {
- (ShowController *)avPlayer {
    //: if (!_avPlayer) {
    if (!_avPlayer) {
        //: _avPlayer = [[NTESAVMoivePlayerController alloc] initWithContentURL:self.fileURL];
        _avPlayer = [[ShowController alloc] initWithFile:self.fileURL];
        //: _avPlayer.scalingMode = NTESAVMovieScalingModeAspectFill;
        _avPlayer.scalingMode = NTESAVMovieScalingModeAspectFill;
    }
    //: return _avPlayer;
    return _avPlayer;
}


//: - (void)layoutSubviews{
- (void)layoutSubviews{
    //: [super layoutSubviews];
    [super layoutSubviews];
    //: UIEdgeInsets contentInsets = self.model.contentViewInsets;
    UIEdgeInsets contentInsets = self.model.contentViewInsets;

    //: CGFloat tableViewWidth = self.superview.nim_width;
    CGFloat tableViewWidth = self.superview.nim_width;
    //: CGSize contentsize = [self.model contentSize:tableViewWidth];
    CGSize contentsize = [self.model aggregation:tableViewWidth];

    //: CGRect imageViewFrame = CGRectMake(contentInsets.left, contentInsets.top, contentsize.width, contentsize.height);
    CGRect imageViewFrame = CGRectMake(contentInsets.left, contentInsets.top, contentsize.width, contentsize.height);
    //: self.imageView.frame = imageViewFrame;
    self.imageView.frame = imageViewFrame;
    //: _progressView.frame = imageViewFrame;
    _progressView.frame = imageViewFrame;
//
////    self.progress.frame = CGRectMake(contentInsets.left+5, contentInsets.top+5, contentsize.width-10, contentsize.height-10);
//        self.progress.nim_centerX = self.nim_width  * .5f;
//        self.progress.nim_centerY = self.nim_height * .5f;

    //: self.playerLayer.frame = self.imageView.bounds;
    self.playerLayer.frame = self.imageView.bounds;


    //: CALayer *maskLayer = [CALayer layer];
    CALayer *maskLayer = [CALayer layer];
    //: maskLayer.cornerRadius = 13.0;
    maskLayer.cornerRadius = 13.0;
    //: maskLayer.masksToBounds = YES;
    maskLayer.masksToBounds = YES;
    //: maskLayer.backgroundColor = [UIColor blackColor].CGColor;
    maskLayer.backgroundColor = [UIColor blackColor].CGColor;
    //: maskLayer.frame = self.imageView.bounds;
    maskLayer.frame = self.imageView.bounds;
    //: self.imageView.layer.mask = maskLayer;
    self.imageView.layer.mask = maskLayer;

//    self.playBtn.nim_centerX = self.nim_width  * .5f;
//    self.playBtn.nim_centerY = self.nim_height * .5f;
}

//: - (void)onTouchUpInside:(id)sender
- (void)priceTag:(id)sender
{
    //: BBBKitEvent *event = [[BBBKitEvent alloc] init];
    MightHaveBeenAdd *event = [[MightHaveBeenAdd alloc] init];
    //: event.eventName = BBBKitEventNameTapContent;
    event.eventName = k_kitTotalContactTitle;
    //: event.messageModel = self.model;
    event.messageModel = self.model;
    //: [self.delegate onCatchEvent:event];
    [self.delegate birthplaces:event];
}

//: - (void)updateProgress:(float)progress
- (void)bottomSub:(float)progress
{
    //: if (progress > 1.0) {
    if (progress > 1.0) {
        //: progress = 1.0;
        progress = 1.0;
    }
    //: self.progressView.progress = progress;
    self.progressView.valueProgress = progress;
}


//: - (UIImage *)thumbnailImageForVideo:(NSURL *)videoURL atTime:(NSTimeInterval)time
- (UIImage *)chromatic:(NSURL *)videoURL languageTime:(NSTimeInterval)time
{

    //: AVURLAsset *asset = [[AVURLAsset alloc] initWithURL:videoURL options:nil];
    AVURLAsset *asset = [[AVURLAsset alloc] initWithURL:videoURL options:nil];
    //: if (!asset)
    if (!asset)
    {
        //: return nil;
        return nil;
    }

    //: AVAssetImageGenerator *generator =[[AVAssetImageGenerator alloc] initWithAsset:asset];
    AVAssetImageGenerator *generator =[[AVAssetImageGenerator alloc] initWithAsset:asset];
    //: generator.appliesPreferredTrackTransform = YES;
    generator.appliesPreferredTrackTransform = YES;
    //: generator.apertureMode = AVAssetImageGeneratorApertureModeEncodedPixels;
    generator.apertureMode = AVAssetImageGeneratorApertureModeEncodedPixels;

    //: CGImageRef thumbnailImageRef = NULL;
    CGImageRef thumbnailImageRef = NULL;
    //: CFTimeInterval thumbnailImageTime = time;
    CFTimeInterval thumbnailImageTime = time;
    //: NSError *thumbnailImageGenerationError = nil;
    NSError *thumbnailImageGenerationError = nil;
    //: thumbnailImageRef = [generator copyCGImageAtTime:CMTimeMake(thumbnailImageTime, 60)
    thumbnailImageRef = [generator copyCGImageAtTime:CMTimeMake(thumbnailImageTime, 60)
                                          //: actualTime:NULL
                                          actualTime:NULL
                                               //: error:&thumbnailImageGenerationError];
                                               error:&thumbnailImageGenerationError];

    //: UIImage *thumbnailImage = thumbnailImageRef ? [[UIImage alloc] initWithCGImage:thumbnailImageRef] : nil;
    UIImage *thumbnailImage = thumbnailImageRef ? [[UIImage alloc] initWithCGImage:thumbnailImageRef] : nil;
    //: thumbnailImage = [thumbnailImage nim_cropedImageWithSize:CGSizeMake(600, 600)];
    thumbnailImage = [thumbnailImage to:CGSizeMake(600, 600)];

    //: CGImageRelease(thumbnailImageRef);
    CGImageRelease(thumbnailImageRef);
    //: return thumbnailImage;
    return thumbnailImage;
}

//: @end
@end

Byte * CeremonyDataToCache(Byte *data) {
    int signerInsert = data[0];
    int kingEager = data[1];
    Byte constrainRelate = data[2];
    int trend = data[3];
    if (!signerInsert) return data + trend;
    for (int i = trend; i < trend + kingEager; i++) {
        int value = data[i] - constrainRelate;
        if (value < 0) {
            value += 256;
        }
        data[i] = value;
    }
    data[0] = 0;
    data[trend + kingEager] = 0;
    return data + trend;
}

NSString *StringFromCeremonyData(Byte *data) {
    return [NSString stringWithUTF8String:(char *)CeremonyDataToCache(data)];
}
