
#import <Foundation/Foundation.h>
typedef struct {
    Byte wolfCurious;
    Byte *sum;
    unsigned int tingSpecially;
    bool limbConcerning;
	int beCustom;
	int missingListenTitle;
} FessQuitData;

NSString *StringFromFessQuitData(FessQuitData *data);


//: 已将视频保存至相册
FessQuitData str_cameraGestureScanData = (FessQuitData){101, (Byte []){128, 210, 215, 128, 213, 227, 141, 194, 227, 140, 199, 244, 129, 218, 248, 128, 200, 253, 141, 226, 214, 130, 254, 221, 128, 227, 233, 193}, 27, false, 234, 1};


//: player_push
FessQuitData str_blocMarbleValue = (FessQuitData){22, (Byte []){102, 122, 119, 111, 115, 100, 73, 102, 99, 101, 126, 104}, 11, false, 176, 121};


//: ic_pic_save
FessQuitData str_gelChangeInsectValue = (FessQuitData){168, (Byte []){193, 203, 247, 216, 193, 203, 247, 219, 201, 222, 205, 53}, 11, false, 36, 35};


//: back_arrow_bw
FessQuitData str_sessionImageText = (FessQuitData){13, (Byte []){111, 108, 110, 102, 82, 108, 127, 127, 98, 122, 82, 111, 122, 183}, 13, false, 96, 2};


//: 保存视频失败 , 错误
FessQuitData str_missingTropicName = (FessQuitData){63, (Byte []){219, 128, 162, 218, 146, 167, 215, 152, 185, 214, 157, 174, 218, 155, 142, 215, 139, 154, 31, 19, 31, 214, 171, 166, 215, 144, 144, 124}, 27, false, 174, 33};


//: 00:00
FessQuitData str_changeOriginTitle = (FessQuitData){95, (Byte []){111, 111, 101, 111, 111, 36}, 5, false, 221, 173};


//: 播放失败
FessQuitData str_sessionMagnitudeStatusValue = (FessQuitData){159, (Byte []){121, 13, 50, 121, 11, 33, 122, 59, 46, 119, 43, 58, 254}, 12, false, 249, 2};


//: 下载失败，请检查网络
FessQuitData str_dataPlainWeaponName = (FessQuitData){228, (Byte []){0, 92, 111, 12, 89, 89, 1, 64, 85, 12, 80, 65, 11, 88, 104, 12, 75, 83, 2, 71, 100, 2, 123, 65, 3, 89, 117, 3, 95, 120, 245}, 30, false, 84, 72};


//: error
FessQuitData str_needByValue = (FessQuitData){135, (Byte []){226, 245, 245, 232, 245, 121}, 5, false, 106, 152};


//: #2BBCFB
FessQuitData str_tropicWithValue = (FessQuitData){217, (Byte []){250, 235, 155, 155, 154, 159, 155, 212}, 7, false, 234, 98};

// __DEBUG__
// __CLOSE_PRINT__
//
//  OpenViewController.m
//  NIM
//
//  Created by chris on 15/4/12.
//  Copyright (c) 2015年 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import "NTESVideoViewController.h"
#import "OpenViewController.h"
//: #import "UIView+Toast.h"
#import "UIView+Toast.h"
//: #import "Reachability.h"
#import "Reachability.h"
//: #import "UIAlertView+NTESBlock.h"
#import "UIAlertView+FullPhaseOfTheMoon.h"
//: #import "SVProgressHUD.h"
#import "SVProgressHUD.h"
//: #import "NTESNavigationHandler.h"
#import "IndicatorHandler.h"
//: #import <Photos/Photos.h>
#import <Photos/Photos.h>
//: #import "LYSlider.h"
#import "StatusView.h"
//: #import "UIImage+ComPress.h"
#import "UIImage+MonthPress.h"
//: #import "ZMONCustomLoadingView.h"
#import "SightView.h"

//: @interface NTESVideoViewController ()<LYVideoPlayerDelegate>
@interface OpenViewController ()<CutDelegate>

//: @property (nonatomic,strong) NTESVideoViewItem *item;
@property (nonatomic,strong) TeamItem *item;

//: @property (nonatomic,strong) NTESAVMoivePlayerController *avPlayer;
@property (nonatomic,strong) ShowController *avPlayer;

//: @property (nonatomic,strong) UIButton *btnSave;
@property (nonatomic,strong) UIButton *btnSave;

//: @property (nonatomic, strong) UILabel *currentLabel; 
@property (nonatomic, strong) UILabel *currentLabel; //当前播放时间
//: @property (nonatomic, strong) UILabel *totalLabel; 
@property (nonatomic, strong) UILabel *totalLabel; //视频总时间
//: @property (nonatomic, strong) LYSlider *videoSlider; 
@property (nonatomic, strong) StatusView *videoSlider; //滑动条
//: @property (nonatomic, assign) NSInteger currentTime;
@property (nonatomic, assign) NSInteger currentTime;
//: @property (nonatomic, assign) NSInteger totalTime;
@property (nonatomic, assign) NSInteger totalTime;
//: @property (nonatomic, assign) CGFloat playValue; 
@property (nonatomic, assign) CGFloat playValue; //播放进度
//: @property (nonatomic, assign) CGFloat progress; 
@property (nonatomic, assign) CGFloat progress; //缓冲进度

//: @property (nonatomic,strong) UIImageView *imgPlay;
@property (nonatomic,strong) UIImageView *imgPlay;

//: @property (nonatomic,strong) UIProgressView *progres;
@property (nonatomic,strong) UIProgressView *progres;
//: @property (nonatomic, strong) UIPanGestureRecognizer *panGesture; 
@property (nonatomic, strong) UIPanGestureRecognizer *panGesture; //滑动手势

//: @property (strong, nonatomic) UISlider *progressSlider;
@property (strong, nonatomic) UISlider *progressSlider;
//: @property (nonatomic, strong) ZMONCustomLoadingView *loadingView;
@property (nonatomic, strong) SightView *loadingView;

//: @end
@end

//: @implementation NTESVideoViewController
@implementation OpenViewController
{
    //: CGPoint _startPoint; 
    CGPoint _startPoint; //手势滑动的起始点
    //: CGPoint _lastPoint; 
    CGPoint _lastPoint; //记录上次滑动的点
    //: BOOL _isStartPan; 
    BOOL _isStartPan; //记录手势开始滑动
    //: CGFloat _fastCurrentTime;
    CGFloat _fastCurrentTime;//记录当前快进快退的时间
}

//: - (instancetype)initWithVideoViewItem:(NTESVideoViewItem *)item
- (instancetype)initWithView:(TeamItem *)item
{
    //: self = [super initWithNibName:nil bundle:nil];
    self = [super initWithNibName:nil bundle:nil];
    //: if (self)
    if (self)
    {
        //: _item = item;
        _item = item;
    }
    //: return self;
    return self;
}

//: - (void)dealloc{
- (void)dealloc{
    //: [_avPlayer stop];
    [_avPlayer ting];
    //: [SVProgressHUD dismiss];
    [SVProgressHUD dismiss];
    //: [[NSNotificationCenter defaultCenter] removeObserver:self];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    //    [[NIMSDK sharedSDK].resourceManager cancelTask:_item.path];
}

//: - (void)viewWillAppear:(BOOL)animated{
- (void)viewWillAppear:(BOOL)animated{
    //: [super viewWillAppear:animated];
    [super viewWillAppear:animated];
    //: [self.navigationController.navigationBar setHidden:YES];
    [self.navigationController.navigationBar setHidden:YES];
//    if (_avPlayer.playbackState == NTESAVMoviePlaybackStatePlaying) {//不要调用.get方法，会过早的初始化播放器
//        [self topStatusUIHidden:YES];
//    }else{
//        [self topStatusUIHidden:NO];
//    }
}

//: - (void)viewWillDisappear:(BOOL)animated{
- (void)viewWillDisappear:(BOOL)animated{
    //: [super viewWillDisappear:animated];
    [super viewWillDisappear:animated];
    //: [self.navigationController.navigationBar setHidden:NO];
    [self.navigationController.navigationBar setHidden:NO];
//    if (![[self.navigationController viewControllers] containsObject: self])
//    {
//        [self topStatusUIHidden:NO];
//    }
}


//: - (void)viewDidDisappear:(BOOL)animated{
- (void)viewDidDisappear:(BOOL)animated{
    //: [super viewDidDisappear:animated];
    [super viewDidDisappear:animated];
    //: [self.avPlayer pause];
    [self.avPlayer nearRecording];
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
    //: self.view.backgroundColor = [UIColor blackColor];
    self.view.backgroundColor = [UIColor blackColor];

    //: UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    //: backButton.frame = CGRectMake(5, [UIDevice vg_statusBarHeight]+4, 40, 40);
    backButton.frame = CGRectMake(5, [UIDevice task]+4, 40, 40);
    //: [backButton setImage:[UIImage imageNamed:@"back_arrow_bw"] forState:(UIControlStateNormal)];
    [backButton setImage:[UIImage imageNamed:StringFromFessQuitData(&str_sessionImageText)] forState:(UIControlStateNormal)];
    //: [backButton addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    [backButton addTarget:self action:@selector(withItem) forControlEvents:UIControlEventTouchUpInside];
    //: [self.view addSubview:backButton];
    [self.view addSubview:backButton];

    //: UIView *btnView = [[UIView alloc]initWithFrame:CGRectMake(0, [[UIScreen mainScreen] bounds].size.height-(([UIScreen mainScreen].bounds.size.height == 812.0f || [UIScreen mainScreen].bounds.size.height == 896.0f) ? 49 + 35 : 49), [[UIScreen mainScreen] bounds].size.width, 49)];
    UIView *btnView = [[UIView alloc]initWithFrame:CGRectMake(0, [[UIScreen mainScreen] bounds].size.height-(([UIScreen mainScreen].bounds.size.height == 812.0f || [UIScreen mainScreen].bounds.size.height == 896.0f) ? 49 + 35 : 49), [[UIScreen mainScreen] bounds].size.width, 49)];
    //: [self.view addSubview:btnView];
    [self.view addSubview:btnView];
    //: [self.view bringSubviewToFront:btnView];
    [self.view bringSubviewToFront:btnView];


    //: CGFloat width = [[UIScreen mainScreen] bounds].size.width/4;
    CGFloat width = [[UIScreen mainScreen] bounds].size.width/4;

    //: [btnView addSubview:self.currentLabel];
    [btnView addSubview:self.currentLabel];
    //: self.currentLabel.frame = CGRectMake(15, 25, width, 14);
    self.currentLabel.frame = CGRectMake(15, 25, width, 14);

    //: [btnView addSubview:self.totalLabel];
    [btnView addSubview:self.totalLabel];
    //: self.totalLabel.frame = CGRectMake(15+2*width, 25, width, 14);
    self.totalLabel.frame = CGRectMake(15+2*width, 25, width, 14);

//    [btnView addSubview:self.videoSlider];
//    self.videoSlider.frame = CGRectMake(15, 5, 3*width-30, 20);

    //: self.progressSlider = [[UISlider alloc] initWithFrame:CGRectMake(15, 5, 3*width, 30)];
    self.progressSlider = [[UISlider alloc] initWithFrame:CGRectMake(15, 5, 3*width, 30)];
    //: self.progressSlider.minimumTrackTintColor = [UIColor whiteColor];
    self.progressSlider.minimumTrackTintColor = [UIColor whiteColor];
    //: self.progressSlider.maximumTrackTintColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:0.2];
    self.progressSlider.maximumTrackTintColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:0.2];
//    self.progressSlider.thumbTintColor = ThemeColor;
    //: [self.progressSlider setThumbImage:[UIImage createImageWithColor:[UIColor colorWithHexString:@"#2BBCFB"] radius:6.0] forState:UIControlStateNormal];
    [self.progressSlider setThumbImage:[UIImage key:[UIColor direction:StringFromFessQuitData(&str_tropicWithValue)] media:6.0] forState:UIControlStateNormal];
    //: self.progressSlider.layer.cornerRadius = 3;
    self.progressSlider.layer.cornerRadius = 3;
    //: self.progressSlider.layer.masksToBounds = YES;
    self.progressSlider.layer.masksToBounds = YES;
    //: [btnView addSubview:self.progressSlider];
    [btnView addSubview:self.progressSlider];
    //: [self.progressSlider addTarget:self action:@selector(progressSliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    [self.progressSlider addTarget:self action:@selector(beggarMyNeighborPolicyChanged:) forControlEvents:UIControlEventValueChanged];

    //: _btnSave = [UIButton buttonWithType:UIButtonTypeCustom];
    _btnSave = [UIButton buttonWithType:UIButtonTypeCustom];
    //: _btnSave.frame = CGRectMake((width-26)/2+width*3, 6, 36, 36);
    _btnSave.frame = CGRectMake((width-26)/2+width*3, 6, 36, 36);
    //: [_btnSave setImage:[UIImage imageNamed:@"ic_pic_save"] forState:UIControlStateNormal];
    [_btnSave setImage:[UIImage imageNamed:StringFromFessQuitData(&str_gelChangeInsectValue)] forState:UIControlStateNormal];
    //: [_btnSave addTarget:self action:@selector(onTouchSaveBtn) forControlEvents:UIControlEventTouchUpInside];
    [_btnSave addTarget:self action:@selector(dioramaMonth) forControlEvents:UIControlEventTouchUpInside];
    //: [btnView addSubview:_btnSave];
    [btnView addSubview:_btnSave];

    //    self.edgesForExtendedLayout = UIRectEdgeAll;
    //    self.navigationItem.title = @"视频短片".ntes_localized;
    //    if (self.item.session)
    //    {
    //        [self setupRightNavItem];
    //    }

    //: if ([[NSFileManager defaultManager] fileExistsAtPath:self.item.path]) {
    if ([[NSFileManager defaultManager] fileExistsAtPath:self.item.path]) {
        //: [self startPlay];
        [self titlePlay];
    //: }else{
    }else{
        //: __weak typeof(self) wself = self;
        __weak typeof(self) wself = self;
        //: [self downLoadVideo:^(NSError *error) {
        [self downwardWithoutTelecastingVideo:^(NSError *error) {
            //: if (!error) {
            if (!error) {
                //: [wself startPlay];
                [wself titlePlay];
            //: }else{
            }else{
                //: [wself.view makeToast:@"下载失败，请检查网络".ntes_localized
                [wself.view makeToast:StringFromFessQuitData(&str_dataPlainWeaponName).language
                             //: duration:2
                             duration:2
                             //: position:CSToastPositionCenter];
                             position:CSToastPositionCenter];
            }
        //: }];
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

//: - (void)onTouchSaveBtn {
- (void)dioramaMonth {

    //: PHPhotoLibrary *photoLibrary = [PHPhotoLibrary sharedPhotoLibrary];
    PHPhotoLibrary *photoLibrary = [PHPhotoLibrary sharedPhotoLibrary];
    //: [photoLibrary performChanges:^{
    [photoLibrary performChanges:^{
        //: [PHAssetChangeRequest creationRequestForAssetFromVideoAtFileURL:[NSURL
        [PHAssetChangeRequest creationRequestForAssetFromVideoAtFileURL:[NSURL
                                                                         //: fileURLWithPath:self.item.path]];
                                                                         fileURLWithPath:self.item.path]];
    //: } completionHandler:^(BOOL success, NSError * _Nullable error) {
    } completionHandler:^(BOOL success, NSError * _Nullable error) {

        //: NSString *toast = (success)?@"已将视频保存至相册".ntes_localized :[NSString stringWithFormat:@"%@：%@",@"保存视频失败 , 错误".ntes_localized,error];
        NSString *toast = (success)?StringFromFessQuitData(&str_cameraGestureScanData).language :[NSString stringWithFormat:@"%@：%@",StringFromFessQuitData(&str_missingTropicName).language,error];
        //: [self.view makeToast:toast duration:2.0 position:CSToastPositionCenter];
        [self.view makeToast:toast duration:2.0 position:CSToastPositionCenter];
//        if (success) {
//
//            NSString *toast = @"已将视频保存至相册".ntes_localized;
//            [self.view makeToast:toast duration:2.0 position:CSToastPositionCenter];
//        } else {
//            NSLog(@"未能保存视频到相册");
//        }
    //: }];
    }];
}


//: - (void)downLoadVideo:(void(^)(NSError *error))handler{
- (void)downwardWithoutTelecastingVideo:(void(^)(NSError *error))handler{
//    [SVProgressHUD show];
    //: [self.view addSubview:self.loadingView];
    [self.view addSubview:self.loadingView];
    //: __weak typeof(self) wself = self;
    __weak typeof(self) wself = self;
    //: [[NIMSDK sharedSDK].resourceManager download:self.item.url filepath:self.item.path progress:^(float progress) {
    [[NIMSDK sharedSDK].resourceManager download:self.item.url filepath:self.item.path progress:^(float progress) {
//        if (wself)
//        {
//            [SVProgressHUD showProgress:progress];
//        }
    //: } completion:^(NSError *error) {
    } completion:^(NSError *error) {
        //: if (wself) {
        if (wself) {
//            [SVProgressHUD dismiss];
            //: [self.loadingView animationClose];
            [self.loadingView iconEnable];
            //: if (handler) {
            if (handler) {
                //: handler(error);
                handler(error);
            }
        }
    //: }];
    }];
}

//: - (void)videoPlayertotalTime:(NSInteger)totalTime
- (void)barTime:(NSInteger)totalTime
{
    //: self.totalTime = totalTime;
    self.totalTime = totalTime;
    //: self.totalLabel.text = [self timeFormatted:totalTime];
    self.totalLabel.text = [self key:totalTime];
}

//: - (void)videoPlayercurrentTime:(NSInteger)currentTime
- (void)sweepped:(NSInteger)currentTime
{
    //: self.currentTime = currentTime;
    self.currentTime = currentTime;
    //: self.currentLabel.text = [self timeFormatted:currentTime];
    self.currentLabel.text = [self key:currentTime];
//    self.videoSlider.value = (CGFloat)currentTime/(CGFloat)self.totalTime;
    //: self.progressSlider.value = (CGFloat)currentTime/(CGFloat)self.totalTime;
    self.progressSlider.value = (CGFloat)currentTime/(CGFloat)self.totalTime;

}

//: - (void)progressSliderValueChanged:(UISlider *)sender {
- (void)beggarMyNeighborPolicyChanged:(UISlider *)sender {
    //: CGFloat totime = sender.value * (CGFloat)self.totalTime;
    CGFloat totime = sender.value * (CGFloat)self.totalTime;
    //: [self.avPlayer seekToTimePlay:totime];
    [self.avPlayer sum:totime];

//    CMTime newTime = CMTimeMakeWithSeconds(sender.value, NSEC_PER_SEC);
//    [self.avPlayer.player seekToTime:newTime completionHandler:^(BOOL finished) {
//        if (finished) {
//            [self.avPlayer play];
//        }
//    }];
}

//转换时间格式
//: - (NSString *)timeFormatted:(NSInteger)totalSeconds
- (NSString *)key:(NSInteger)totalSeconds
{
    //: NSInteger seconds = totalSeconds % 60;
    NSInteger seconds = totalSeconds % 60;
    //: NSInteger minutes = (totalSeconds / 60) % 60;
    NSInteger minutes = (totalSeconds / 60) % 60;

    //: return [NSString stringWithFormat:@"%02ld:%02ld",minutes, seconds];
    return [NSString stringWithFormat:@"%02ld:%02ld",minutes, seconds];
}


//: - (void)startPlay{
- (void)titlePlay{
    //: self.avPlayer.view.frame = CGRectMake(0, (44.0f + [UIDevice vg_statusBarHeight]), [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height-(44.0f + [UIDevice vg_statusBarHeight])-(([UIScreen mainScreen].bounds.size.height == 812.0f || [UIScreen mainScreen].bounds.size.height == 896.0f) ? 49 + 35 : 49));
    self.avPlayer.view.frame = CGRectMake(0, (44.0f + [UIDevice task]), [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height-(44.0f + [UIDevice task])-(([UIScreen mainScreen].bounds.size.height == 812.0f || [UIScreen mainScreen].bounds.size.height == 896.0f) ? 49 + 35 : 49));
//    self.avPlayer.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;

    //: [self.avPlayer prepareToPlay];
    [self.avPlayer buttonText];
    //: [self.view addSubview:self.avPlayer.view];
    [self.view addSubview:self.avPlayer.view];

    //: [[NSNotificationCenter defaultCenter] addObserver:self
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             //: selector:@selector(moviePlaybackComplete:)
                                             selector:@selector(lineups:)
                                                 //: name:NTESAVMoviePlayerPlaybackDidFinishNotification
                                                 name:k_pointText
                                               //: object:self.avPlayer];
                                               object:self.avPlayer];

    //: [[NSNotificationCenter defaultCenter] addObserver:self
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             //: selector:@selector(moviePlayStateChanged:)
                                             selector:@selector(beChanged:)
                                                 //: name:NTESAVMoviePlayerPlaybackStateDidChangeNotification
                                                 name:k_controlText
                                               //: object:self.avPlayer];
                                               object:self.avPlayer];


    //: CGRect bounds = self.avPlayer.view.bounds;
    CGRect bounds = self.avPlayer.view.bounds;
    //: CGRect tapViewFrame = CGRectMake(0, 0, bounds.size.width, bounds.size.height);
    CGRect tapViewFrame = CGRectMake(0, 0, bounds.size.width, bounds.size.height);
    //: UIView *tapView = [[UIView alloc]initWithFrame:tapViewFrame];
    UIView *tapView = [[UIView alloc]initWithFrame:tapViewFrame];
    //: [tapView setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];
    [tapView setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];
    //: tapView.backgroundColor = [UIColor clearColor];
    tapView.backgroundColor = [UIColor clearColor];
    //: [self.avPlayer.view addSubview:tapView];
    [self.avPlayer.view addSubview:tapView];
    //: UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(onTap:)];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(befored:)];
    //: [tapView addGestureRecognizer:tap];
    [tapView addGestureRecognizer:tap];

    //: [self.view addSubview:self.imgPlay];
    [self.view addSubview:self.imgPlay];


}

//: - (void)moviePlaybackComplete: (NSNotification *)aNotification
- (void)lineups: (NSNotification *)aNotification
{
    //: if (self.avPlayer == aNotification.object)
    if (self.avPlayer == aNotification.object)
    {
        //: [self topStatusUIHidden:NO];
        [self item:NO];
        //: NSDictionary *notificationUserInfo = [aNotification userInfo];
        NSDictionary *notificationUserInfo = [aNotification userInfo];
        //: NSNumber *resultValue = [notificationUserInfo objectForKey:NTESAVMoviePlayerPlaybackDidFinishReasonUserInfoKey];
        NSNumber *resultValue = [notificationUserInfo objectForKey:k_startData];
        //: NTESAVMovieFinishReason reason = [resultValue intValue];
        NTESAVMovieFinishReason reason = [resultValue intValue];
        //: if (reason == NTESAVMovieFinishReasonPlaybackError)
        if (reason == NTESAVMovieFinishReasonPlaybackError)
        {
            //: NSError *mediaPlayerError = [notificationUserInfo objectForKey:@"error"];
            NSError *mediaPlayerError = [notificationUserInfo objectForKey:StringFromFessQuitData(&str_needByValue)];
            //: NSString *errorTip = [NSString stringWithFormat:@"%@: %@", @"播放失败".ntes_localized, [mediaPlayerError localizedDescription]];
            NSString *errorTip = [NSString stringWithFormat:@"%@: %@", StringFromFessQuitData(&str_sessionMagnitudeStatusValue).language, [mediaPlayerError localizedDescription]];
            //: [self.view makeToast:errorTip
            [self.view makeToast:errorTip
                        //: duration:2
                        duration:2
                        //: position:CSToastPositionCenter];
                        position:CSToastPositionCenter];
        }
    }

}

//: - (void)moviePlayStateChanged: (NSNotification *)aNotification
- (void)beChanged: (NSNotification *)aNotification
{
    //: if (self.avPlayer == aNotification.object)
    if (self.avPlayer == aNotification.object)
    {
        //: switch (self.avPlayer.playbackState)
        switch (self.avPlayer.playbackState)
        {
            //: case NTESAVMoviePlaybackStatePlaying:
            case NTESAVMoviePlaybackStatePlaying:
                //: [self topStatusUIHidden:YES];
                [self item:YES];
                //: break;
                break;
            //: case NTESAVMoviePlaybackStatePaused:
            case NTESAVMoviePlaybackStatePaused:
            //: case NTESAVMoviePlaybackStateStopped:
            case NTESAVMoviePlaybackStateStopped:
            //: case NTESAVMoviePlaybackStateInterrupted:
            case NTESAVMoviePlaybackStateInterrupted:
                //: [self topStatusUIHidden:NO];
                [self item:NO];
            //: case NTESAVPMoviePlaybackStateSeekingBackward:
            case NTESAVPMoviePlaybackStateSeekingBackward:
            //: case NTESAVPMoviePlaybackStateSeekingForward:
            case NTESAVPMoviePlaybackStateSeekingForward:
                //: break;
                break;
        }

    }
}

//: - (void)topStatusUIHidden:(BOOL)isHidden
- (void)item:(BOOL)isHidden
{
    //: self.imgPlay.hidden = isHidden;
    self.imgPlay.hidden = isHidden;
}

//: - (void)onTap: (UIGestureRecognizer *)recognizer
- (void)befored: (UIGestureRecognizer *)recognizer
{
    //: switch (self.avPlayer.playbackState)
    switch (self.avPlayer.playbackState)
    {
        //: case NTESAVMoviePlaybackStatePlaying:
        case NTESAVMoviePlaybackStatePlaying:
            //: [self.avPlayer pause];
            [self.avPlayer nearRecording];
            //: break;
            break;
        //: case NTESAVMoviePlaybackStatePaused:
        case NTESAVMoviePlaybackStatePaused:
        //: case NTESAVMoviePlaybackStateStopped:
        case NTESAVMoviePlaybackStateStopped:
        //: case NTESAVMoviePlaybackStateInterrupted:
        case NTESAVMoviePlaybackStateInterrupted:
            //: [self.avPlayer play];
            [self.avPlayer viewPlay];
            //: break;
            break;
        //: default:
        default:
            //: break;
            break;
    }
}

//: - (NTESAVMoivePlayerController *)avPlayer {
- (ShowController *)avPlayer {
    //: if (!_avPlayer) {
    if (!_avPlayer) {
        //: _avPlayer = [[NTESAVMoivePlayerController alloc] initWithContentURL:[NSURL fileURLWithPath:self.item.path]];
        _avPlayer = [[ShowController alloc] initWithFile:[NSURL fileURLWithPath:self.item.path]];
        //: _avPlayer.delegate = self;
        _avPlayer.delegate = self;
        //: _avPlayer.scalingMode = NTESAVMovieScalingModeAspectFill;
        _avPlayer.scalingMode = NTESAVMovieScalingModeAspectFill;
    }
    //: return _avPlayer;
    return _avPlayer;
}

//: - (UIImageView *)imgPlay{
- (UIImageView *)imgPlay{
    //: if(!_imgPlay){
    if(!_imgPlay){
        //: _imgPlay = [[UIImageView alloc]initWithFrame:CGRectMake(([[UIScreen mainScreen] bounds].size.width-80)/2, ([[UIScreen mainScreen] bounds].size.height-80)/2, 80, 80)];
        _imgPlay = [[UIImageView alloc]initWithFrame:CGRectMake(([[UIScreen mainScreen] bounds].size.width-80)/2, ([[UIScreen mainScreen] bounds].size.height-80)/2, 80, 80)];
//        _imgPlay.center = self.view.center;
        //: _imgPlay.image = [UIImage imageNamed:@"player_push"];
        _imgPlay.image = [UIImage imageNamed:StringFromFessQuitData(&str_blocMarbleValue)];
        //: _imgPlay.hidden = YES;
        _imgPlay.hidden = YES;
    }
    //: return _imgPlay;
    return _imgPlay;
}

//: - (UILabel *)currentLabel{
- (UILabel *)currentLabel{
    //: if (!_currentLabel) {
    if (!_currentLabel) {
        //: _currentLabel = [[UILabel alloc] init];
        _currentLabel = [[UILabel alloc] init];
        //: _currentLabel.text = @"00:00";
        _currentLabel.text = StringFromFessQuitData(&str_changeOriginTitle);
        //: _currentLabel.textColor = [UIColor whiteColor];
        _currentLabel.textColor = [UIColor whiteColor];
        //: _currentLabel.textAlignment = NSTextAlignmentLeft;
        _currentLabel.textAlignment = NSTextAlignmentLeft;
        //: _currentLabel.font = [UIFont systemFontOfSize:12];
        _currentLabel.font = [UIFont systemFontOfSize:12];
    }
    //: return _currentLabel;
    return _currentLabel;
}
//: - (UILabel *)totalLabel{
- (UILabel *)totalLabel{
    //: if (!_totalLabel) {
    if (!_totalLabel) {
        //: _totalLabel = [[UILabel alloc] init];
        _totalLabel = [[UILabel alloc] init];
        //: _totalLabel.text = @"00:00";
        _totalLabel.text = StringFromFessQuitData(&str_changeOriginTitle);
        //: _totalLabel.textColor = [UIColor whiteColor];
        _totalLabel.textColor = [UIColor whiteColor];
        //: _totalLabel.font = [UIFont systemFontOfSize:12];
        _totalLabel.font = [UIFont systemFontOfSize:12];
        //: _totalLabel.textAlignment = NSTextAlignmentRight;
        _totalLabel.textAlignment = NSTextAlignmentRight;
    }
    //: return _totalLabel;
    return _totalLabel;
}

//: - (LYSlider *)videoSlider{
- (StatusView *)videoSlider{
    //: if (!_videoSlider) {
    if (!_videoSlider) {
        //: _videoSlider = [[LYSlider alloc] initWithFrame:CGRectMake(0, 0, 3*([[UIScreen mainScreen] bounds].size.width/4), 20)];
        _videoSlider = [[StatusView alloc] initWithFrame:CGRectMake(0, 0, 3*([[UIScreen mainScreen] bounds].size.width/4), 20)];

//        //设置滑块图片样式
        // 1 通过颜色创建 Image
        //: UIImage *normalImage = [UIImage createImageWithColor:[UIColor colorWithHexString:@"#2BBCFB"] radius:7.0];
        UIImage *normalImage = [UIImage key:[UIColor direction:StringFromFessQuitData(&str_tropicWithValue)] media:7.0];

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

        //: [_videoSlider setThumbImage:normalImage forState:UIControlStateNormal];
        [_videoSlider press:normalImage contentDomain:UIControlStateNormal];
//        [_videoSlider setThumbImage:highlightImage forState:UIControlStateHighlighted];

//        _videoSlider.trackColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:0.2];//轨道的颜色
//        _videoSlider.bufferColor = RGB_COLOR_String(@"#ffffff");//缓冲的颜色
//        _videoSlider.thumbValueColor = RGB_COLOR_String(@"#ffffff");///播放进度的颜色
        ///
        //: _videoSlider.trackHeight = 6;
        _videoSlider.trackHeight = 6;
        //: _videoSlider.thumbVisibleSize = 14;
        _videoSlider.thumbVisibleSize = 14;//设置滑块（可见的）大小

//        [_videoSlider addTarget:self action:@selector(sliderValueChange:) forControlEvents:UIControlEventValueChanged];//正在拖动
//        [_videoSlider addTarget:self action:@selector(sliderTouchEnd:) forControlEvents:UIControlEventEditingDidEnd];//拖动结束
        //: [_videoSlider addGestureRecognizer:self.panGesture];
        [_videoSlider addGestureRecognizer:self.panGesture];

//        [self.bottomView addSubview:_videoSlider];
    }
    //: return _videoSlider;
    return _videoSlider;
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


//: #pragma mark - Event
#pragma mark - Event
//: - (void)sliderValueChange:(LYSlider *)slider{
- (void)sliderWithoutDetachmentChange:(StatusView *)slider{

//    _sliderIsTouching = YES;
//    self.currentLabel.text = [self timeFormatted:slider.value * self.totalTime];
//    [self startHideControlTimer];
}
//: - (void)sliderTouchEnd:(LYSlider *)slider{
- (void)language:(StatusView *)slider{

//    if (_delegate && [_delegate respondsToSelector:@selector(videoControl:didPlayToTime:)]) {
//        [_delegate videoControl:self didPlayToTime:slider.value * self.totalTime];
//    }
//    _sliderIsTouching = NO;
//    [self startHideControlTimer];
    //: NSLog(@"12345678");
    //: NSLog(@"%f",slider.value);
    //: [self.avPlayer seekToTimePlay: slider.value];
    [self.avPlayer sum: slider.value];
}

//: - (UIPanGestureRecognizer *)panGesture{
- (UIPanGestureRecognizer *)panGesture{
    //: if (!_panGesture) {
    if (!_panGesture) {
        //: _panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestureTouch:)];
        _panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(replies:)];
    }
    //: return _panGesture;
    return _panGesture;
}
//: - (void)panGestureTouch:(UIPanGestureRecognizer *)panGestureTouch{
- (void)replies:(UIPanGestureRecognizer *)panGestureTouch{
    //: CGPoint touPoint = [panGestureTouch translationInView:self.videoSlider];
    CGPoint touPoint = [panGestureTouch translationInView:self.videoSlider];
    //: static int changeXorY = 0; 
    static int changeXorY = 0; //0:X:进度   1:Y：音量

    //: if (panGestureTouch.state == UIGestureRecognizerStateBegan) {
    if (panGestureTouch.state == UIGestureRecognizerStateBegan) {
        //: _startPoint = touPoint;
        _startPoint = touPoint;
        //: _lastPoint = touPoint;
        _lastPoint = touPoint;
        //: _isStartPan = YES;
        _isStartPan = YES;
        //: _fastCurrentTime = self.currentTime;
        _fastCurrentTime = self.currentTime;
        //: changeXorY = 0;
        changeXorY = 0;
    //: }else if (panGestureTouch.state == UIGestureRecognizerStateChanged){
    }else if (panGestureTouch.state == UIGestureRecognizerStateChanged){
        //: CGFloat change_X = touPoint.x - _startPoint.x;
        CGFloat change_X = touPoint.x - _startPoint.x;
        //: CGFloat change_Y = touPoint.y - _startPoint.y;
        CGFloat change_Y = touPoint.y - _startPoint.y;

        //: if (_isStartPan) {
        if (_isStartPan) {

            //: if (fabs(change_X) > fabs(change_Y)) {
            if (fabs(change_X) > fabs(change_Y)) {
                //: changeXorY = 0;
                changeXorY = 0;
            //: }else{
            }else{
                //: changeXorY = 1;
                changeXorY = 1;
            }
            //: _isStartPan = NO;
            _isStartPan = NO;
        }
        //: if (changeXorY == 0) {
        if (changeXorY == 0) {//进度


            //: if (touPoint.x - _lastPoint.x >= 1) {
            if (touPoint.x - _lastPoint.x >= 1) {
                //: _lastPoint = touPoint;
                _lastPoint = touPoint;
                //: _fastCurrentTime += 1;
                _fastCurrentTime += 1;
                //: if (_fastCurrentTime > self.totalTime) {
                if (_fastCurrentTime > self.totalTime) {
                    //: _fastCurrentTime = self.totalTime;
                    _fastCurrentTime = self.totalTime;
                }
            }
            //: if (touPoint.x - _lastPoint.x <= - 1) {
            if (touPoint.x - _lastPoint.x <= - 1) {
                //: _lastPoint = touPoint;
                _lastPoint = touPoint;
                //: _fastCurrentTime -= 1;
                _fastCurrentTime -= 1;
                //: if (_fastCurrentTime < 0) {
                if (_fastCurrentTime < 0) {
                    //: _fastCurrentTime = 0;
                    _fastCurrentTime = 0;
                }
            }

//            NSString *currentTimeString = [self timeFormatted:(int)_fastCurrentTime];
//            NSString *totalTimeString = [self timeFormatted:(int)self.totalTime];
//            self.fastTimeLabel.text = [NSString stringWithFormat:@"%@/%@",currentTimeString,totalTimeString];

        }

    //: }else if (panGestureTouch.state == UIGestureRecognizerStateEnded){
    }else if (panGestureTouch.state == UIGestureRecognizerStateEnded){

        //: if (changeXorY == 0) {
        if (changeXorY == 0) {
//            if (_delegate && [_delegate respondsToSelector:@selector(videoControl:didPlayToTime:)]) {
//                [_delegate videoControl:self didPlayToTime:_fastCurrentTime];
//            }

            //: [self.avPlayer seekToTimePlay:_fastCurrentTime];
            [self.avPlayer sum:_fastCurrentTime];
        }
//        [self startHideControlTimer];
    }
}

//: @end
@end


//: @implementation NTESVideoViewItem
@implementation TeamItem
//: @end
@end

Byte *FessQuitDataToByte(FessQuitData *data) {
    if (data->limbConcerning) return data->sum;
    for (int i = 0; i < data->tingSpecially; i++) {
        data->sum[i] ^= data->wolfCurious;
    }
    data->sum[data->tingSpecially] = 0;
    data->limbConcerning = true;
	if (data->tingSpecially >= 2) {
		data->beCustom = data->sum[0];
		data->missingListenTitle = data->sum[1];
	}
    return data->sum;
}

NSString *StringFromFessQuitData(FessQuitData *data) {
    return [NSString stringWithUTF8String:(char *)FessQuitDataToByte(data)];
}
