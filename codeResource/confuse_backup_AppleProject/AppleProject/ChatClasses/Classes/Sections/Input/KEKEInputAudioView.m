//
//  KEKEInputAudioView.m
//  KEKEChat
//
//  Created by Yan Wang on 2024/4/27.
//  Copyright © 2024 KEKE. All rights reserved.
//

#import "KEKEInputAudioView.h"
#import "UIViewNimKit.h"
#import "UIView+NTES.h"

#define KEKEKit_ViewHeight 200

@interface KEKEInputAudioView()

@property (nonatomic,strong) UIView *audioBgview;

@property (nonatomic, strong) UIImageView *animationImageView;
@property (nonatomic, strong) UIImageView *soundwaveImageView;

@property (nonatomic, strong) UIImageView *delImg;
@property (nonatomic, strong) UILabel *delLabel;
@property (nonatomic, strong) UIImageView *audioBtnBg;

@property (nonatomic, strong) UILabel *tipLabel;



@end

@implementation KEKEInputAudioView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(animationClose)];
         [self addGestureRecognizer:tapGesture];
        
        _audioBgview = [[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, KEKEKit_ViewHeight)];
        _audioBgview.backgroundColor = [UIColor whiteColor];
        if (@available(iOS 11.0, *)) {
            _audioBgview.layer.cornerRadius = 16;
            _audioBgview.layer.maskedCorners = kCALayerMinXMinYCorner | kCALayerMaxXMinYCorner; // 左上圆角 // 右上圆角
        }
        [self addSubview:_audioBgview];
            
        
//        UIImageView *bgImg = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, KEKEKit_ViewHeight)];
//        bgImg.image = [UIImage imageNamed:@"recording_bg"];
//        [_audioBgview addSubview:bgImg];
        
     
        
        _delLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 15, SCREEN_WIDTH, 20)];
        _delLabel.font = [UIFont systemFontOfSize:12];
        _delLabel.textColor = RGB_COLOR_String(@"#FF1C1C");
        _delLabel.textAlignment = NSTextAlignmentCenter;
        _delLabel.hidden = YES;
        _delLabel.text = LangKey(@"Releasetocancel");
        [_audioBgview addSubview:_delLabel];
        
        _delImg = [[UIImageView alloc]initWithFrame:CGRectMake((SCREEN_WIDTH-17)/2, _delLabel.bottom+5, 17, 19)];
        _delImg.image = [UIImage imageNamed:@"sound_del"];
        _delImg.hidden = YES;
        [_audioBgview addSubview:_delImg];
        
        _tipLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 25, SCREEN_WIDTH, 20)];
        _tipLabel.font = [UIFont systemFontOfSize:12];
        _tipLabel.textColor = TextColor_2;
        _tipLabel.textAlignment = NSTextAlignmentCenter;
//        _tipLabel.text = @"手指上滑，取消发送".nim_localized;
        _tipLabel.text = LangKey(@"Releasetosend_swipeuptocancel");
        [_audioBgview addSubview:_tipLabel];
        
        _soundwaveImageView = [[UIImageView alloc]initWithFrame:CGRectMake(20, 40, SCREEN_WIDTH-40, 147)];
        _soundwaveImageView.image = [UIImage imageNamed:@"sound_wave"];
        [_audioBgview addSubview:_soundwaveImageView];
        
        
        // 创建UIImageView
            self.animationImageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 40, SCREEN_WIDTH-40, 147)];
            [_audioBgview addSubview:self.animationImageView];
            
            // 创建UIImage数组，用于帧动画
            NSMutableArray<UIImage *> *animationFrames = [NSMutableArray array];
            
            // 添加帧到数组中
            for (int i = 0; i <= 5; i++) { //
                NSString *imageName = [NSString stringWithFormat:@"sound_wave_%d", i];
                UIImage *image = [UIImage imageNamed:imageName];
                if (image) {
                    [animationFrames addObject:image];
                }
            }
            
            // 设置动画帧
            self.animationImageView.animationImages = animationFrames;
            self.animationImageView.animationDuration = 1.0; // 设置动画持续时间
            self.animationImageView.animationRepeatCount = 0; // 无限循环
            
          
        

        
        self.recordPhase = AudioRecordPhaseEnd;
        
        
        
        _audioBtnBg = [[UIImageView alloc]initWithFrame:CGRectMake((SCREEN_WIDTH-80)/2, 75, 80, 80)];
        _audioBtnBg.backgroundColor = [UIColor whiteColor];
        _audioBtnBg.image = [UIImage imageNamed:@"recording_bg_circle"];
        [_audioBgview addSubview:_audioBtnBg];
        
        _audioButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _audioButton.frame = CGRectMake((SCREEN_WIDTH-65)/2, 82.5, 65, 65);
        [_audioButton setImage:[UIImage imageNamed:@"recording_btn"]
                      forState:UIControlStateNormal];
        [_audioButton setImage:[UIImage imageNamed:@"recording_btn"]
                      forState:UIControlStateHighlighted];
//        [_audioButton addTarget:self action:@selector(onClicked:) forControlEvents:UIControlEventTouchUpInside];
        [_audioButton addTarget:self action:@selector(onTouchRecordBtnDown:) forControlEvents:UIControlEventTouchDown];
        [_audioButton addTarget:self action:@selector(onTouchRecordBtnDragInside:) forControlEvents:UIControlEventTouchDragInside];
        [_audioButton addTarget:self action:@selector(onTouchRecordBtnDragOutside:) forControlEvents:UIControlEventTouchDragOutside];
        [_audioButton addTarget:self action:@selector(onTouchRecordBtnUpInside:) forControlEvents:UIControlEventTouchUpInside];
        [_audioButton addTarget:self action:@selector(onTouchRecordBtnUpOutside:) forControlEvents:UIControlEventTouchUpOutside];
        [_audioBgview addSubview:_audioButton];
        
    }
    return self;
}

- (void)setInputActionDelegate:(id<NIMInputActionDelegate>)actionDelegate
{
    _actionDelegate = actionDelegate;
}


-(void)onClicked:(UIButton *)sender{
    
}
- (void)onTouchRecordBtnDown:(id)sender {
    self.recordPhase = AudioRecordPhaseStart;
    // 启动动画
    [self.animationImageView startAnimating];
    _delImg.hidden = NO;
    _delLabel.hidden = NO;
    _tipLabel.hidden = YES;
    _soundwaveImageView.hidden = YES;
    _audioBtnBg.frame = CGRectMake((SCREEN_WIDTH-100)/2, 65, 100, 100);
}
- (void)onTouchRecordBtnUpInside:(id)sender {
    // finish Recording
    self.recordPhase = AudioRecordPhaseEnd;
    
    // 停止动画
    [self.animationImageView stopAnimating];
    _delImg.hidden = YES;
    _delLabel.hidden = YES;
    _tipLabel.hidden = NO;
    _soundwaveImageView.hidden = NO;
    _audioBtnBg.frame = CGRectMake((SCREEN_WIDTH-80)/2, 75, 80, 80);
}
- (void)onTouchRecordBtnUpOutside:(id)sender {
    // cancel Recording
    self.recordPhase = AudioRecordPhaseEnd;
    // 停止动画
    [self.animationImageView stopAnimating];
    _delImg.hidden = YES;
    _delLabel.hidden = YES;
    _tipLabel.hidden = NO;
    _soundwaveImageView.hidden = NO;
    _audioBtnBg.frame = CGRectMake((SCREEN_WIDTH-80)/2, 75, 80, 80);
}

- (void)onTouchRecordBtnDragInside:(id)sender {
    // "手指上滑，取消发送"
    self.recordPhase = AudioRecordPhaseRecording;
   
}
- (void)onTouchRecordBtnDragOutside:(id)sender {
    // "松开手指，取消发送"
    self.recordPhase = AudioRecordPhaseCancelling;
    // 停止动画
    [self.animationImageView stopAnimating];
    _delImg.hidden = YES;
    _delLabel.hidden = YES;
    _tipLabel.hidden = NO;
    _soundwaveImageView.hidden = NO;
    _audioBtnBg.frame = CGRectMake((SCREEN_WIDTH-80)/2, 75, 80, 80);
}

- (void)setRecordPhase:(NIMAudioRecordPhase)recordPhase {
    NIMAudioRecordPhase prevPhase = _recordPhase;
    _recordPhase = recordPhase;
    if(prevPhase == AudioRecordPhaseEnd) {
        if(AudioRecordPhaseStart == _recordPhase) {
            if ([_actionDelegate respondsToSelector:@selector(onStartRecording)]) {
                [_actionDelegate onStartRecording];
            }
        }
    } else if (prevPhase == AudioRecordPhaseStart || prevPhase == AudioRecordPhaseRecording) {
        if (AudioRecordPhaseEnd == _recordPhase) {
            if ([_actionDelegate respondsToSelector:@selector(onStopRecording)]) {
                [_actionDelegate onStopRecording];
            }
        }
    } else if (prevPhase == AudioRecordPhaseCancelling) {
        if(AudioRecordPhaseEnd == _recordPhase) {
            if ([_actionDelegate respondsToSelector:@selector(onCancelRecording)]) {
                [_actionDelegate onCancelRecording];
            }
        }
    }
}

- (void)setConfig:(id<CCCSessionConfig>)config
{
    _config = config;
}


- (void)animationClose
{
//    self.hidden = YES;
    self.audioBgview.frame = CGRectMake(0, SCREEN_HEIGHT-KEKEKit_ViewHeight, SCREEN_WIDTH, KEKEKit_ViewHeight);
        [UIView animateWithDuration:0.3f
                         animations:^{
                             
            self.alpha = 0.0;
            self.audioBgview.frame = CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, KEKEKit_ViewHeight);
                         }
                         completion:nil];
}

- (void)animationShow
{
//    self.hidden = NO;
    self.audioBgview.frame = CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, KEKEKit_ViewHeight);
     
        [UIView animateWithDuration:0.3 animations:^{
             self.alpha = 1.0;
            self.audioBgview.frame = CGRectMake(0, SCREEN_HEIGHT-KEKEKit_ViewHeight, SCREEN_WIDTH, KEKEKit_ViewHeight);
            
        } completion:nil];

     
    
}

@end
