//
//  CCCSessionVideoContentView.m
// AppleProjectKit
//
//  Created by chris on 15/4/10.
//  Copyright (c) 2015年 Netease. All rights reserved.
//

#import "CCCSessionVideoContentView.h"
#import "BBBMessageModel.h"
#import "UIViewNimKit.h"
#import "UIImage+AppleProjectKit.h"
#import "BBBLoadProgressView.h"
#import "NTESAVMoivePlayerController.h"
#import <AVFoundation/AVFoundation.h>
//#import "WMPlayerModel.h"
//#import "WMPlayer.h"

static void *KVO_AVPlayerItem_state                     = &KVO_AVPlayerItem_state;

@interface CCCSessionVideoContentView()

@property (nonatomic,strong,readwrite) UIImageView * imageView;

@property (nonatomic,strong) UIButton *playBtn;

@property (nonatomic,strong) BBBLoadProgressView * progressView;

@property (nonatomic, strong)  NSURL *fileURL;
@property (nonatomic, strong) AVPlayerItem *playerItem;
@property (nonatomic, strong) AVPlayer *player;
@property (nonatomic, strong) AVPlayerLayer *playerLayer;

@property (nonatomic,strong) NTESAVMoivePlayerController *avPlayer;
@property (nonatomic, strong) UCZProgressView *progress;
@property (nonatomic, strong) UIActivityIndicatorView *activity;
@end

@implementation CCCSessionVideoContentView

- (instancetype)initSessionMessageContentView{
    self = [super initSessionMessageContentView];
    if (self) {
        self.opaque = YES;
//        self.progress = [[UCZProgressView alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
//        self.progress.translatesAutoresizingMaskIntoConstraints = NO;
//        self.progress.tintColor = [UIColor colorWithPatternImage:[SNGradientHelper getLinearGradientImage:RGB_COLOR_String(kCommonBGColor_begin) and:RGB_COLOR_String(kCommonBGColor_end) directionType:SNLinearGradientDirectionLevel]];
//        [self addSubview:self.progress];
        
        _imageView  = [[UIImageView alloc] initWithFrame:CGRectZero];
        _imageView.backgroundColor = [UIColor clearColor];
        [self addSubview:_imageView];
        
//        _activity = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleMedium];
//        _activity.color = [UIColor grayColor];
//        [self addSubview:_activity];
        
      
        
//        self.progress = [[UCZProgressView alloc] initWithFrame:self.imageView.bounds];
//        self.progress.translatesAutoresizingMaskIntoConstraints = NO;
////        self.progressView.showsText = YES;
////        self.progressView.tintColor = [KEKESkinColorManager shareInstance].skinColor;
//        self.progress.tintColor = [UIColor colorWithPatternImage:[SNGradientHelper getLinearGradientImage:RGB_COLOR_String(kCommonBGColor_begin) and:RGB_COLOR_String(kCommonBGColor_end) directionType:SNLinearGradientDirectionLevel]];
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
        
        _progressView = [[BBBLoadProgressView alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
        _progressView.maxProgress = 1.0;
        [self addSubview:_progressView];
        
//
    }
    return self;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    if ([keyPath isEqualToString:@"status"]) {
        AVPlayerItem * item = (AVPlayerItem *)object;
        if (item.status == AVPlayerItemStatusReadyToPlay) {
            _progressView.hidden = YES;
//            self.progress.hidden = YES;
            
//             [self.player replaceCurrentItemWithPlayerItem:item];
             [self.player play];
        }else if (item.status == AVPlayerItemStatusFailed){
             NSLog(@"failed");
//            _progressView.hidden = NO;
            
//            [self.player replaceCurrentItemWithPlayerItem:item];
//            [self.player play];
        }
   }
}

- (void)refresh:(BBBMessageModel *)data{
    [super refresh:data];
    NIMVideoObject * videoObject = (NIMVideoObject*)self.model.message.messageObject;
    UIImage * image              = [UIImage imageWithContentsOfFile:videoObject.coverPath];
    if (image) {
         self.imageView.image = image;
     } else {
         if (videoObject.url.length > 0)
         {
             NSString *videoUrl = videoObject.coverUrl;
             [self.imageView sd_setImageWithURL:[NSURL URLWithString:[videoUrl stringByReplacingOccurrencesOfString:@" " withString:@""]]];
         }
     }
    
    [_playerItem removeObserver:self forKeyPath:@"status" context:KVO_AVPlayerItem_state];
    NSURL *fileURL = [NSURL URLWithString:videoObject.url];
    AVAsset *asset = [AVURLAsset URLAssetWithURL:fileURL options:nil];
    _playerItem = [AVPlayerItem playerItemWithAsset:asset];
    [_playerItem addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionNew context:KVO_AVPlayerItem_state];

    //player
    [self setupPlayer];

    [self.imageView.layer addSublayer:self.playerLayer];
//    self.playerLayer.frame = self.imageView.bounds;

//    [self.player replaceCurrentItemWithPlayerItem:_playerItem];
    [self.player play];
    
    NSLog(@"加载状态- %ld",(long)self.model.message.attachmentDownloadState);
    BOOL isSending = (self.model.message.deliveryState == NIMMessageDeliveryStateDelivering);
    BOOL isDowning = (self.model.message.attachmentDownloadState == NIMMessageAttachmentDownloadStateDownloading);

    _progressView.hidden   = !(isSending || isDowning);

//    _progressView.hidden         = YES;
    if (!_progressView.hidden) {
        [_progressView setProgress:[[[NIMSDK sharedSDK] chatManager] messageTransportProgress:self.model.message]];
    }
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)setupPlayer {
    if (!_player) {
        _player = [AVPlayer playerWithPlayerItem:_playerItem];
        _player.actionAtItemEnd = AVPlayerActionAtItemEndNone;
    }
}

- (AVPlayerLayer *)playerLayer
{
    if(!_playerLayer){
        _playerLayer = [AVPlayerLayer playerLayerWithPlayer:self.player];
        _playerLayer.videoGravity = AVLayerVideoGravityResizeAspect;
        _playerLayer.frame = self.imageView.bounds;
        [self.imageView.layer addSublayer:_playerLayer];
    }
    return _playerLayer;
}

- (void)startPlay{
    self.avPlayer.view.frame = self.imageView.bounds;
    self.avPlayer.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    [self.avPlayer prepareToPlay];
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

- (NTESAVMoivePlayerController *)avPlayer {
    if (!_avPlayer) {
        _avPlayer = [[NTESAVMoivePlayerController alloc] initWithContentURL:self.fileURL];
        _avPlayer.scalingMode = NTESAVMovieScalingModeAspectFill;
    }
    return _avPlayer;
}


- (void)layoutSubviews{
    [super layoutSubviews];
    UIEdgeInsets contentInsets = self.model.contentViewInsets;
    
    CGFloat tableViewWidth = self.superview.nim_width;
    CGSize contentsize = [self.model contentSize:tableViewWidth];
    
    CGRect imageViewFrame = CGRectMake(contentInsets.left, contentInsets.top, contentsize.width, contentsize.height);
    self.imageView.frame  = imageViewFrame;
    _progressView.frame   = imageViewFrame;
//
////    self.progress.frame = CGRectMake(contentInsets.left+5, contentInsets.top+5, contentsize.width-10, contentsize.height-10);
//        self.progress.nim_centerX = self.nim_width  * .5f;
//        self.progress.nim_centerY = self.nim_height * .5f;

    self.playerLayer.frame = self.imageView.bounds;

    
    CALayer *maskLayer = [CALayer layer];
    maskLayer.cornerRadius = 13.0;
    maskLayer.masksToBounds = YES;
    maskLayer.backgroundColor = [UIColor blackColor].CGColor;
    maskLayer.frame = self.imageView.bounds;
    self.imageView.layer.mask = maskLayer;

//    self.playBtn.nim_centerX = self.nim_width  * .5f;
//    self.playBtn.nim_centerY = self.nim_height * .5f;
}

- (void)onTouchUpInside:(id)sender
{
    BBBKitEvent *event = [[BBBKitEvent alloc] init];
    event.eventName = BBBKitEventNameTapContent;
    event.messageModel = self.model;
    [self.delegate onCatchEvent:event];
}

- (void)updateProgress:(float)progress
{
    if (progress > 1.0) {
        progress = 1.0;
    }
    self.progressView.progress = progress;
}


- (UIImage *)thumbnailImageForVideo:(NSURL *)videoURL atTime:(NSTimeInterval)time
{
    
    AVURLAsset *asset = [[AVURLAsset alloc] initWithURL:videoURL options:nil];
    if (!asset)
    {
        return nil;
    }
    
    AVAssetImageGenerator *generator =[[AVAssetImageGenerator alloc] initWithAsset:asset];
    generator.appliesPreferredTrackTransform = YES;
    generator.apertureMode = AVAssetImageGeneratorApertureModeEncodedPixels;
    
    CGImageRef thumbnailImageRef = NULL;
    CFTimeInterval thumbnailImageTime = time;
    NSError *thumbnailImageGenerationError = nil;
    thumbnailImageRef = [generator copyCGImageAtTime:CMTimeMake(thumbnailImageTime, 60)
                                          actualTime:NULL
                                               error:&thumbnailImageGenerationError];
    
    UIImage *thumbnailImage = thumbnailImageRef ? [[UIImage alloc] initWithCGImage:thumbnailImageRef] : nil;
    thumbnailImage = [thumbnailImage nim_cropedImageWithSize:CGSizeMake(600, 600)];
    
    CGImageRelease(thumbnailImageRef);
    return thumbnailImage;
}

@end
