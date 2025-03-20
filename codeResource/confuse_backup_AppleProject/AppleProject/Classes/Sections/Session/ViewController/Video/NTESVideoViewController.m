//
//  NTESVideoViewController.m
//  NIM
//
//  Created by chris on 15/4/12.
//  Copyright (c) 2015年 Netease. All rights reserved.
//

#import "NTESVideoViewController.h"
#import "UIView+Toast.h"
#import "Reachability.h"
#import "UIAlertView+NTESBlock.h"
#import "SVProgressHUD.h"
#import "NTESNavigationHandler.h"
#import <Photos/Photos.h>
#import "LYSlider.h"
#import "UIImage+ComPress.h"
#import "ZMONCustomLoadingView.h"
@interface NTESVideoViewController ()<LYVideoPlayerDelegate>

@property (nonatomic,strong) NTESVideoViewItem *item;

@property (nonatomic,strong) NTESAVMoivePlayerController *avPlayer;

@property (nonatomic,strong) UIButton    *btnSave;

@property (nonatomic, strong) UILabel  *currentLabel; //当前播放时间
@property (nonatomic, strong) UILabel  *totalLabel;   //视频总时间
@property (nonatomic, strong) LYSlider *videoSlider;  //滑动条
@property (nonatomic, assign) NSInteger  currentTime;
@property (nonatomic, assign) NSInteger  totalTime;
@property (nonatomic, assign) CGFloat  playValue;   //播放进度
@property (nonatomic, assign) CGFloat  progress;    //缓冲进度

@property (nonatomic,strong) UIImageView *imgPlay;

@property (nonatomic,strong) UIProgressView *progres;
@property (nonatomic, strong) UIPanGestureRecognizer *panGesture;     //滑动手势

@property (strong, nonatomic) UISlider *progressSlider;
@property (nonatomic, strong) ZMONCustomLoadingView *loadingView;

@end

@implementation NTESVideoViewController
{
    CGPoint _startPoint;    //手势滑动的起始点
    CGPoint _lastPoint;     //记录上次滑动的点
    BOOL    _isStartPan;    //记录手势开始滑动
    CGFloat _fastCurrentTime;//记录当前快进快退的时间
}

- (instancetype)initWithVideoViewItem:(NTESVideoViewItem *)item
{
    self = [super initWithNibName:nil bundle:nil];
    if (self)
    {
        _item = item;
    }
    return self;
}

- (void)dealloc{
    [_avPlayer stop];
    [SVProgressHUD dismiss];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    //    [[NIMSDK sharedSDK].resourceManager cancelTask:_item.path];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setHidden:YES];
//    if (_avPlayer.playbackState == NTESAVMoviePlaybackStatePlaying) {//不要调用.get方法，会过早的初始化播放器
//        [self topStatusUIHidden:YES];
//    }else{
//        [self topStatusUIHidden:NO];
//    }
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar setHidden:NO];
//    if (![[self.navigationController viewControllers] containsObject: self])
//    {
//        [self topStatusUIHidden:NO];
//    }
}


- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    [self.avPlayer pause];
}

- (void)backAction{
    [self.navigationController popViewControllerAnimated:NO];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(5, SCREEN_STATUS_HEIGHT+4, 40, 40);
    [backButton setImage:[UIImage imageNamed:@"back_arrow_bw"] forState:(UIControlStateNormal)];
    [backButton addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backButton];
    
    UIView *btnView = [[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT-UITabbarHeight, SCREEN_WIDTH, 49)];
    [self.view addSubview:btnView];
    [self.view bringSubviewToFront:btnView];
    
    
    CGFloat width = SCREEN_WIDTH/4;
    
    [btnView addSubview:self.currentLabel];
    self.currentLabel.frame = CGRectMake(15, 25, width, 14);
    
    [btnView addSubview:self.totalLabel];
    self.totalLabel.frame = CGRectMake(15+2*width, 25, width, 14);
    
//    [btnView addSubview:self.videoSlider];
//    self.videoSlider.frame = CGRectMake(15, 5, 3*width-30, 20);
    
    self.progressSlider = [[UISlider alloc] initWithFrame:CGRectMake(15, 5, 3*width, 30)];
    self.progressSlider.minimumTrackTintColor = [UIColor whiteColor];
    self.progressSlider.maximumTrackTintColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:0.2];
//    self.progressSlider.thumbTintColor = ThemeColor;
    [self.progressSlider setThumbImage:[UIImage createImageWithColor:ThemeColor radius:6.0] forState:UIControlStateNormal];
    self.progressSlider.layer.cornerRadius = 3;
    self.progressSlider.layer.masksToBounds = YES;
    [btnView addSubview:self.progressSlider];
    [self.progressSlider addTarget:self action:@selector(progressSliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    
    _btnSave = [UIButton buttonWithType:UIButtonTypeCustom];
    _btnSave.frame = CGRectMake((width-26)/2+width*3, 6, 36, 36);
    [_btnSave setImage:[UIImage imageNamed:@"ic_pic_save"] forState:UIControlStateNormal];
    [_btnSave addTarget:self action:@selector(onTouchSaveBtn) forControlEvents:UIControlEventTouchUpInside];
    [btnView addSubview:_btnSave];
    
    //    self.edgesForExtendedLayout = UIRectEdgeAll;
    //    self.navigationItem.title = @"视频短片".ntes_localized;
    //    if (self.item.session)
    //    {
    //        [self setupRightNavItem];
    //    }
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:self.item.path]) {
        [self startPlay];
    }else{
        __weak typeof(self) wself = self;
        [self downLoadVideo:^(NSError *error) {
            if (!error) {
                [wself startPlay];
            }else{
                [wself.view makeToast:@"下载失败，请检查网络".ntes_localized
                             duration:2
                             position:CSToastPositionCenter];
            }
        }];
    }
    
//    @weakify(self)
//    [self.avPlayer.player addPeriodicTimeObserverForInterval:CMTimeMakeWithSeconds(1, NSEC_PER_SEC)
//                                                      queue:NULL
//                                                 usingBlock:^(CMTime time) {
//        @strongify(self)
//        //进度 当前时间/总时间
//        CGFloat progress = CMTimeGetSeconds(self.avPlayer.player.currentItem.currentTime) / CMTimeGetSeconds(self.avPlayer.player.currentItem.duration);
//        //在这里截取播放进度并处理
//        self.progres.progress = progress;
//    }];
}

- (void)onTouchSaveBtn {
    
    PHPhotoLibrary *photoLibrary = [PHPhotoLibrary sharedPhotoLibrary];
    [photoLibrary performChanges:^{
        [PHAssetChangeRequest creationRequestForAssetFromVideoAtFileURL:[NSURL
                                                                         fileURLWithPath:self.item.path]];
    } completionHandler:^(BOOL success, NSError * _Nullable error) {
        
        NSString *toast = (success)?@"已将视频保存至相册".ntes_localized :[NSString stringWithFormat:@"%@：%@",@"保存视频失败 , 错误".ntes_localized,error];
        [self.view makeToast:toast duration:2.0 position:CSToastPositionCenter];
//        if (success) {
//
//            NSString *toast = @"已将视频保存至相册".ntes_localized;
//            [self.view makeToast:toast duration:2.0 position:CSToastPositionCenter];
//        } else {
//            NSLog(@"未能保存视频到相册");
//        }
    }];
}


- (void)downLoadVideo:(void(^)(NSError *error))handler{
//    [SVProgressHUD show];
    [self.view addSubview:self.loadingView];
    __weak typeof(self) wself = self;
    [[NIMSDK sharedSDK].resourceManager download:self.item.url filepath:self.item.path progress:^(float progress) {
//        if (wself)
//        {
//            [SVProgressHUD showProgress:progress];
//        }
    } completion:^(NSError *error) {
        if (wself) {
//            [SVProgressHUD dismiss];
            [self.loadingView animationClose];
            if (handler) {
                handler(error);
            }
        }
    }];
}

- (void)videoPlayertotalTime:(NSInteger)totalTime
{
    self.totalTime = totalTime;
    self.totalLabel.text = [self timeFormatted:totalTime];
}
 
- (void)videoPlayercurrentTime:(NSInteger)currentTime
{
    self.currentTime = currentTime;
    self.currentLabel.text = [self timeFormatted:currentTime];
//    self.videoSlider.value = (CGFloat)currentTime/(CGFloat)self.totalTime;
    self.progressSlider.value = (CGFloat)currentTime/(CGFloat)self.totalTime;

}

- (void)progressSliderValueChanged:(UISlider *)sender {
    CGFloat totime = sender.value * (CGFloat)self.totalTime;
    [self.avPlayer seekToTimePlay:totime];
    
//    CMTime newTime = CMTimeMakeWithSeconds(sender.value, NSEC_PER_SEC);
//    [self.avPlayer.player seekToTime:newTime completionHandler:^(BOOL finished) {
//        if (finished) {
//            [self.avPlayer play];
//        }
//    }];
}

//转换时间格式
- (NSString *)timeFormatted:(NSInteger)totalSeconds
{
    NSInteger seconds = totalSeconds % 60;
    NSInteger minutes = (totalSeconds / 60) % 60;
    
    return [NSString stringWithFormat:@"%02ld:%02ld",minutes, seconds];
}


- (void)startPlay{
    self.avPlayer.view.frame = CGRectMake(0, SCREEN_TOP_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT-SCREEN_TOP_HEIGHT-UITabbarHeight);
//    self.avPlayer.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    [self.avPlayer prepareToPlay];
    [self.view addSubview:self.avPlayer.view];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(moviePlaybackComplete:)
                                                 name:NTESAVMoviePlayerPlaybackDidFinishNotification
                                               object:self.avPlayer];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(moviePlayStateChanged:)
                                                 name:NTESAVMoviePlayerPlaybackStateDidChangeNotification
                                               object:self.avPlayer];
    
    
    CGRect bounds = self.avPlayer.view.bounds;
    CGRect tapViewFrame = CGRectMake(0, 0, bounds.size.width, bounds.size.height);
    UIView *tapView = [[UIView alloc]initWithFrame:tapViewFrame];
    [tapView setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];
    tapView.backgroundColor = [UIColor clearColor];
    [self.avPlayer.view addSubview:tapView];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(onTap:)];
    [tapView  addGestureRecognizer:tap];
    
    [self.view addSubview:self.imgPlay];
    
  
}

- (void)moviePlaybackComplete: (NSNotification *)aNotification
{
    if (self.avPlayer == aNotification.object)
    {
        [self topStatusUIHidden:NO];
        NSDictionary *notificationUserInfo = [aNotification userInfo];
        NSNumber *resultValue = [notificationUserInfo objectForKey:NTESAVMoviePlayerPlaybackDidFinishReasonUserInfoKey];
        NTESAVMovieFinishReason reason = [resultValue intValue];
        if (reason == NTESAVMovieFinishReasonPlaybackError)
        {
            NSError *mediaPlayerError = [notificationUserInfo objectForKey:@"error"];
            NSString *errorTip = [NSString stringWithFormat:@"%@: %@", @"播放失败".ntes_localized, [mediaPlayerError localizedDescription]];
            [self.view makeToast:errorTip
                        duration:2
                        position:CSToastPositionCenter];
        }
    }
    
}

- (void)moviePlayStateChanged: (NSNotification *)aNotification
{
    if (self.avPlayer == aNotification.object)
    {
        switch (self.avPlayer.playbackState)
        {
            case NTESAVMoviePlaybackStatePlaying:
                [self topStatusUIHidden:YES];
                break;
            case NTESAVMoviePlaybackStatePaused:
            case NTESAVMoviePlaybackStateStopped:
            case NTESAVMoviePlaybackStateInterrupted:
                [self topStatusUIHidden:NO];
            case NTESAVPMoviePlaybackStateSeekingBackward:
            case NTESAVPMoviePlaybackStateSeekingForward:
                break;
        }
        
    }
}

- (void)topStatusUIHidden:(BOOL)isHidden
{
    self.imgPlay.hidden = isHidden;
}

- (void)onTap: (UIGestureRecognizer *)recognizer
{
    switch (self.avPlayer.playbackState)
    {
        case NTESAVMoviePlaybackStatePlaying:
            [self.avPlayer pause];
            break;
        case NTESAVMoviePlaybackStatePaused:
        case NTESAVMoviePlaybackStateStopped:
        case NTESAVMoviePlaybackStateInterrupted:
            [self.avPlayer play];
            break;
        default:
            break;
    }
}

- (NTESAVMoivePlayerController *)avPlayer {
    if (!_avPlayer) {
        _avPlayer = [[NTESAVMoivePlayerController alloc] initWithContentURL:[NSURL fileURLWithPath:self.item.path]];
        _avPlayer.delegate = self;
        _avPlayer.scalingMode = NTESAVMovieScalingModeAspectFill;
    }
    return _avPlayer;
}

- (UIImageView *)imgPlay{
    if(!_imgPlay){
        _imgPlay = [[UIImageView alloc]initWithFrame:CGRectMake((SCREEN_WIDTH-80)/2, (SCREEN_HEIGHT-80)/2, 80, 80)];
//        _imgPlay.center = self.view.center;
        _imgPlay.image = [UIImage imageNamed:@"player_push"];
        _imgPlay.hidden = YES;
    }
    return _imgPlay;
}

- (UILabel *)currentLabel{
    if (!_currentLabel) {
        _currentLabel = [[UILabel alloc] init];
        _currentLabel.text = @"00:00";
        _currentLabel.textColor = [UIColor whiteColor];
        _currentLabel.textAlignment = NSTextAlignmentLeft;
        _currentLabel.font = [UIFont systemFontOfSize:12];
    }
    return _currentLabel;
}
- (UILabel *)totalLabel{
    if (!_totalLabel) {
        _totalLabel = [[UILabel alloc] init];
        _totalLabel.text = @"00:00";
        _totalLabel.textColor = [UIColor whiteColor];
        _totalLabel.font = [UIFont systemFontOfSize:12];
        _totalLabel.textAlignment = NSTextAlignmentRight;
    }
    return _totalLabel;
}

- (LYSlider *)videoSlider{
    if (!_videoSlider) {
        _videoSlider = [[LYSlider alloc] initWithFrame:CGRectMake(0, 0, 3*(SCREEN_WIDTH/4), 20)];
        
//        //设置滑块图片样式
        // 1 通过颜色创建 Image
        UIImage *normalImage = [UIImage createImageWithColor:ThemeColor radius:7.0];

        //        UIView *normalImageView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 8, 8)];
        //        normalImageView.layer.cornerRadius = 1;
        //        normalImageView.layer.masksToBounds = YES;
        //        normalImageView.backgroundColor = [UIColor whiteColor];
        //        UIImage *normalImage = [UIImage creatImageWithView:normalImageView];

//        // 2 通过view 创建 Image
//        UIView *highlightView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 12, 12)];
//        highlightView.layer.cornerRadius = 6;
//        highlightView.layer.masksToBounds = YES;
//        highlightView.backgroundColor = [UIColor redColor];
//        UIImage *highlightImage = [UIImage creatImageWithView:highlightView];

        [_videoSlider setThumbImage:normalImage forState:UIControlStateNormal];
//        [_videoSlider setThumbImage:highlightImage forState:UIControlStateHighlighted];
        
//        _videoSlider.trackColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:0.2];//轨道的颜色
//        _videoSlider.bufferColor = RGB_COLOR_String(@"#ffffff");//缓冲的颜色
//        _videoSlider.thumbValueColor = RGB_COLOR_String(@"#ffffff");///播放进度的颜色
        ///
        _videoSlider.trackHeight = 6;
        _videoSlider.thumbVisibleSize = 14;//设置滑块（可见的）大小
        
//        [_videoSlider addTarget:self action:@selector(sliderValueChange:) forControlEvents:UIControlEventValueChanged];//正在拖动
//        [_videoSlider addTarget:self action:@selector(sliderTouchEnd:) forControlEvents:UIControlEventEditingDidEnd];//拖动结束
        [_videoSlider addGestureRecognizer:self.panGesture];
        
//        [self.bottomView addSubview:_videoSlider];
    }
    return _videoSlider;
}

- (ZMONCustomLoadingView *)loadingView
{
    if(!_loadingView){
        _loadingView = [[ZMONCustomLoadingView alloc]initWithFrame:CGRectMake(0, SCREEN_TOP_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT-SCREEN_TOP_HEIGHT-SCREEN_TABBAR_HEIGHT)];
    }
    return  _loadingView;
}


#pragma mark - Event
- (void)sliderValueChange:(LYSlider *)slider{
    
//    _sliderIsTouching = YES;
//    self.currentLabel.text = [self timeFormatted:slider.value * self.totalTime];
//    [self startHideControlTimer];
}
- (void)sliderTouchEnd:(LYSlider *)slider{
    
//    if (_delegate && [_delegate respondsToSelector:@selector(videoControl:didPlayToTime:)]) {
//        [_delegate videoControl:self didPlayToTime:slider.value * self.totalTime];
//    }
//    _sliderIsTouching = NO;
//    [self startHideControlTimer];
    NSLog(@"12345678");
    NSLog(@"%f",slider.value);
    [self.avPlayer  seekToTimePlay: slider.value];
}

- (UIPanGestureRecognizer *)panGesture{
    if (!_panGesture) {
        _panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestureTouch:)];
    }
    return _panGesture;
}
- (void)panGestureTouch:(UIPanGestureRecognizer *)panGestureTouch{
    CGPoint touPoint = [panGestureTouch translationInView:self.videoSlider];
    static int changeXorY = 0;    //0:X:进度   1:Y：音量
    
    if (panGestureTouch.state == UIGestureRecognizerStateBegan) {
        _startPoint = touPoint;
        _lastPoint = touPoint;
        _isStartPan = YES;
        _fastCurrentTime = self.currentTime;
        changeXorY = 0;
    }else if (panGestureTouch.state == UIGestureRecognizerStateChanged){
        CGFloat change_X = touPoint.x - _startPoint.x;
        CGFloat change_Y = touPoint.y - _startPoint.y;
        
        if (_isStartPan) {
            
            if (fabs(change_X) > fabs(change_Y)) {
                changeXorY = 0;
            }else{
                changeXorY = 1;
            }
            _isStartPan = NO;
        }
        if (changeXorY == 0) {//进度
            
            
            if (touPoint.x - _lastPoint.x >= 1) {
                _lastPoint = touPoint;
                _fastCurrentTime += 1;
                if (_fastCurrentTime > self.totalTime) {
                    _fastCurrentTime = self.totalTime;
                }
            }
            if (touPoint.x - _lastPoint.x <= - 1) {
                _lastPoint = touPoint;
                _fastCurrentTime -= 1;
                if (_fastCurrentTime < 0) {
                    _fastCurrentTime = 0;
                }
            }
            
//            NSString *currentTimeString = [self timeFormatted:(int)_fastCurrentTime];
//            NSString *totalTimeString = [self timeFormatted:(int)self.totalTime];
//            self.fastTimeLabel.text = [NSString stringWithFormat:@"%@/%@",currentTimeString,totalTimeString];
            
        }
        
    }else if (panGestureTouch.state == UIGestureRecognizerStateEnded){
   
        if (changeXorY == 0) {
//            if (_delegate && [_delegate respondsToSelector:@selector(videoControl:didPlayToTime:)]) {
//                [_delegate videoControl:self didPlayToTime:_fastCurrentTime];
//            }
            
            [self.avPlayer seekToTimePlay:_fastCurrentTime];
        }
//        [self startHideControlTimer];
    }
}

@end


@implementation NTESVideoViewItem
@end

