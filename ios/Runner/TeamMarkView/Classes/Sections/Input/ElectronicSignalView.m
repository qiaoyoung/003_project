
#import <Foundation/Foundation.h>
typedef struct {
    Byte sever;
    Byte *sweetBest;
    unsigned int egoAmble;
    bool simplicityMode;
	int join;
} MmData;

NSString *StringFromMmData(MmData *data);


//: #FF1C1C
MmData str_alcoholHorseData = (MmData){135, (Byte []){164, 193, 193, 182, 196, 182, 196, 119}, 7, false, 209};


//: sound_wave_%d
MmData str_tollGainTitle = (MmData){47, (Byte []){92, 64, 90, 65, 75, 112, 88, 78, 89, 74, 112, 10, 75, 145}, 13, false, 80};


//: sound_wave
MmData str_disabilityName = (MmData){175, (Byte []){220, 192, 218, 193, 203, 240, 216, 206, 217, 202, 99}, 10, false, 35};


//: sound_del
MmData str_skillValue = (MmData){228, (Byte []){151, 139, 145, 138, 128, 187, 128, 129, 136, 66}, 9, false, 203};


//: Releasetosend_swipeuptocancel
MmData str_auraValue = (MmData){73, (Byte []){27, 44, 37, 44, 40, 58, 44, 61, 38, 58, 44, 39, 45, 22, 58, 62, 32, 57, 44, 60, 57, 61, 38, 42, 40, 39, 42, 44, 37, 140}, 29, false, 168};


//: 666666
MmData str_joinOrganizeContent = (MmData){241, (Byte []){199, 199, 199, 199, 199, 199, 113}, 6, false, 14};


//: recording_bg_circle
MmData str_honorData = (MmData){48, (Byte []){66, 85, 83, 95, 66, 84, 89, 94, 87, 111, 82, 87, 111, 83, 89, 66, 83, 92, 85, 254}, 19, false, 6};


//: Releasetocancel
MmData str_worthContent = (MmData){215, (Byte []){133, 178, 187, 178, 182, 164, 178, 163, 184, 180, 182, 185, 180, 178, 187, 172}, 15, false, 149};


//: recording_btn
MmData str_joinOvenTitle = (MmData){82, (Byte []){32, 55, 49, 61, 32, 54, 59, 60, 53, 13, 48, 38, 60, 44}, 13, false, 250};

// __DEBUG__
// __CLOSE_PRINT__
//
//  ElectronicSignalView.m
//  KEKEChat
//
//  Created by Yan Wang on 2024/4/27.
//  Copyright © 2024 KEKE. All rights reserved.
//

// __M_A_C_R_O__
//: #import "KEKEInputAudioView.h"
#import "ElectronicSignalView.h"
//: #import "UIViewNimKit.h"
#import "UIViewNimKit.h"
//: #import "UIView+NTES.h"
#import "UIView+Status.h"

//: @interface KEKEInputAudioView()
@interface ElectronicSignalView()

//: @property (nonatomic,strong) UIView *audioBgview;
@property (nonatomic,strong) UIView *audioBgview;

//: @property (nonatomic, strong) UIImageView *animationImageView;
@property (nonatomic, strong) UIImageView *animationImageView;
//: @property (nonatomic, strong) UIImageView *soundwaveImageView;
@property (nonatomic, strong) UIImageView *soundwaveImageView;

//: @property (nonatomic, strong) UIImageView *delImg;
@property (nonatomic, strong) UIImageView *delImg;
//: @property (nonatomic, strong) UILabel *delLabel;
@property (nonatomic, strong) UILabel *delLabel;
//: @property (nonatomic, strong) UIImageView *audioBtnBg;
@property (nonatomic, strong) UIImageView *audioBtnBg;

//: @property (nonatomic, strong) UILabel *tipLabel;
@property (nonatomic, strong) UILabel *tipLabel;



//: @end
@end

//: @implementation KEKEInputAudioView
@implementation ElectronicSignalView


//: - (instancetype)initWithFrame:(CGRect)frame
- (instancetype)initWithFrame:(CGRect)frame
{
    //: self = [super initWithFrame:frame];
    self = [super initWithFrame:frame];
    //: if (self)
    if (self)
    {
        //: UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(animationClose)];
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(iconEnable)];
         //: [self addGestureRecognizer:tapGesture];
         [self addGestureRecognizer:tapGesture];

        //: _audioBgview = [[UIView alloc]initWithFrame:CGRectMake(0, [[UIScreen mainScreen] bounds].size.height, [[UIScreen mainScreen] bounds].size.width, 200)];
        _audioBgview = [[UIView alloc]initWithFrame:CGRectMake(0, [[UIScreen mainScreen] bounds].size.height, [[UIScreen mainScreen] bounds].size.width, 200)];
        //: _audioBgview.backgroundColor = [UIColor whiteColor];
        _audioBgview.backgroundColor = [UIColor whiteColor];
        //: if (@available(iOS 11.0, *)) {
        if (@available(iOS 11.0, *)) {
            //: _audioBgview.layer.cornerRadius = 16;
            _audioBgview.layer.cornerRadius = 16;
            //: _audioBgview.layer.maskedCorners = kCALayerMinXMinYCorner | kCALayerMaxXMinYCorner; 
            _audioBgview.layer.maskedCorners = kCALayerMinXMinYCorner | kCALayerMaxXMinYCorner; // 左上圆角 // 右上圆角
        }
        //: [self addSubview:_audioBgview];
        [self addSubview:_audioBgview];


//        UIImageView *bgImg = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, KEKEKit_ViewHeight)];
//        bgImg.image = [UIImage imageNamed:@"recording_bg"];
//        [_audioBgview addSubview:bgImg];



        //: _delLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 15, [[UIScreen mainScreen] bounds].size.width, 20)];
        _delLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 15, [[UIScreen mainScreen] bounds].size.width, 20)];
        //: _delLabel.font = [UIFont systemFontOfSize:12];
        _delLabel.font = [UIFont systemFontOfSize:12];
        //: _delLabel.textColor = [UIColor colorWithHexString:@"#FF1C1C"];
        _delLabel.textColor = [UIColor direction:StringFromMmData(&str_alcoholHorseData)];
        //: _delLabel.textAlignment = NSTextAlignmentCenter;
        _delLabel.textAlignment = NSTextAlignmentCenter;
        //: _delLabel.hidden = YES;
        _delLabel.hidden = YES;
        //: _delLabel.text = [NTESLanguageManager getTextWithKey:@"Releasetocancel"];
        _delLabel.text = [MaxInformation off:StringFromMmData(&str_worthContent)];
        //: [_audioBgview addSubview:_delLabel];
        [_audioBgview addSubview:_delLabel];

        //: _delImg = [[UIImageView alloc]initWithFrame:CGRectMake(([[UIScreen mainScreen] bounds].size.width-17)/2, _delLabel.bottom+5, 17, 19)];
        _delImg = [[UIImageView alloc]initWithFrame:CGRectMake(([[UIScreen mainScreen] bounds].size.width-17)/2, _delLabel.bottom+5, 17, 19)];
        //: _delImg.image = [UIImage imageNamed:@"sound_del"];
        _delImg.image = [UIImage imageNamed:StringFromMmData(&str_skillValue)];
        //: _delImg.hidden = YES;
        _delImg.hidden = YES;
        //: [_audioBgview addSubview:_delImg];
        [_audioBgview addSubview:_delImg];

        //: _tipLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 25, [[UIScreen mainScreen] bounds].size.width, 20)];
        _tipLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 25, [[UIScreen mainScreen] bounds].size.width, 20)];
        //: _tipLabel.font = [UIFont systemFontOfSize:12];
        _tipLabel.font = [UIFont systemFontOfSize:12];
        //: _tipLabel.textColor = [UIColor colorWithHexString:@"666666"];
        _tipLabel.textColor = [UIColor direction:StringFromMmData(&str_joinOrganizeContent)];
        //: _tipLabel.textAlignment = NSTextAlignmentCenter;
        _tipLabel.textAlignment = NSTextAlignmentCenter;
//        _tipLabel.text = @"手指上滑，取消发送".nim_localized;
        //: _tipLabel.text = [NTESLanguageManager getTextWithKey:@"Releasetosend_swipeuptocancel"];
        _tipLabel.text = [MaxInformation off:StringFromMmData(&str_auraValue)];
        //: [_audioBgview addSubview:_tipLabel];
        [_audioBgview addSubview:_tipLabel];

        //: _soundwaveImageView = [[UIImageView alloc]initWithFrame:CGRectMake(20, 40, [[UIScreen mainScreen] bounds].size.width-40, 147)];
        _soundwaveImageView = [[UIImageView alloc]initWithFrame:CGRectMake(20, 40, [[UIScreen mainScreen] bounds].size.width-40, 147)];
        //: _soundwaveImageView.image = [UIImage imageNamed:@"sound_wave"];
        _soundwaveImageView.image = [UIImage imageNamed:StringFromMmData(&str_disabilityName)];
        //: [_audioBgview addSubview:_soundwaveImageView];
        [_audioBgview addSubview:_soundwaveImageView];


        // 创建UIImageView
            //: self.animationImageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 40, [[UIScreen mainScreen] bounds].size.width-40, 147)];
            self.animationImageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 40, [[UIScreen mainScreen] bounds].size.width-40, 147)];
            //: [_audioBgview addSubview:self.animationImageView];
            [_audioBgview addSubview:self.animationImageView];

            // 创建UIImage数组，用于帧动画
            //: NSMutableArray<UIImage *> *animationFrames = [NSMutableArray array];
            NSMutableArray<UIImage *> *animationFrames = [NSMutableArray array];

            // 添加帧到数组中
            //: for (int i = 0; i <= 5; i++) { 
            for (int i = 0; i <= 5; i++) { //
                //: NSString *imageName = [NSString stringWithFormat:@"sound_wave_%d", i];
                NSString *imageName = [NSString stringWithFormat:StringFromMmData(&str_tollGainTitle), i];
                //: UIImage *image = [UIImage imageNamed:imageName];
                UIImage *image = [UIImage imageNamed:imageName];
                //: if (image) {
                if (image) {
                    //: [animationFrames addObject:image];
                    [animationFrames addObject:image];
                }
            }

            // 设置动画帧
            //: self.animationImageView.animationImages = animationFrames;
            self.animationImageView.animationImages = animationFrames;
            //: self.animationImageView.animationDuration = 1.0; 
            self.animationImageView.animationDuration = 1.0; // 设置动画持续时间
            //: self.animationImageView.animationRepeatCount = 0; 
            self.animationImageView.animationRepeatCount = 0; // 无限循环





        //: self.recordPhase = AudioRecordPhaseEnd;
        self.recordPhase = AudioRecordPhaseEnd;



        //: _audioBtnBg = [[UIImageView alloc]initWithFrame:CGRectMake(([[UIScreen mainScreen] bounds].size.width-80)/2, 75, 80, 80)];
        _audioBtnBg = [[UIImageView alloc]initWithFrame:CGRectMake(([[UIScreen mainScreen] bounds].size.width-80)/2, 75, 80, 80)];
        //: _audioBtnBg.backgroundColor = [UIColor whiteColor];
        _audioBtnBg.backgroundColor = [UIColor whiteColor];
        //: _audioBtnBg.image = [UIImage imageNamed:@"recording_bg_circle"];
        _audioBtnBg.image = [UIImage imageNamed:StringFromMmData(&str_honorData)];
        //: [_audioBgview addSubview:_audioBtnBg];
        [_audioBgview addSubview:_audioBtnBg];

        //: _audioButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _audioButton = [UIButton buttonWithType:UIButtonTypeCustom];
        //: _audioButton.frame = CGRectMake(([[UIScreen mainScreen] bounds].size.width-65)/2, 82.5, 65, 65);
        _audioButton.frame = CGRectMake(([[UIScreen mainScreen] bounds].size.width-65)/2, 82.5, 65, 65);
        //: [_audioButton setImage:[UIImage imageNamed:@"recording_btn"]
        [_audioButton setImage:[UIImage imageNamed:StringFromMmData(&str_joinOvenTitle)]
                      //: forState:UIControlStateNormal];
                      forState:UIControlStateNormal];
        //: [_audioButton setImage:[UIImage imageNamed:@"recording_btn"]
        [_audioButton setImage:[UIImage imageNamed:StringFromMmData(&str_joinOvenTitle)]
                      //: forState:UIControlStateHighlighted];
                      forState:UIControlStateHighlighted];
//        [_audioButton addTarget:self action:@selector(onClicked:) forControlEvents:UIControlEventTouchUpInside];
        //: [_audioButton addTarget:self action:@selector(onTouchRecordBtnDown:) forControlEvents:UIControlEventTouchDown];
        [_audioButton addTarget:self action:@selector(backgrounded:) forControlEvents:UIControlEventTouchDown];
        //: [_audioButton addTarget:self action:@selector(onTouchRecordBtnDragInside:) forControlEvents:UIControlEventTouchDragInside];
        [_audioButton addTarget:self action:@selector(bottomKitView:) forControlEvents:UIControlEventTouchDragInside];
        //: [_audioButton addTarget:self action:@selector(onTouchRecordBtnDragOutside:) forControlEvents:UIControlEventTouchDragOutside];
        [_audioButton addTarget:self action:@selector(baring:) forControlEvents:UIControlEventTouchDragOutside];
        //: [_audioButton addTarget:self action:@selector(onTouchRecordBtnUpInside:) forControlEvents:UIControlEventTouchUpInside];
        [_audioButton addTarget:self action:@selector(texted:) forControlEvents:UIControlEventTouchUpInside];
        //: [_audioButton addTarget:self action:@selector(onTouchRecordBtnUpOutside:) forControlEvents:UIControlEventTouchUpOutside];
        [_audioButton addTarget:self action:@selector(enableInAlfresco:) forControlEvents:UIControlEventTouchUpOutside];
        //: [_audioBgview addSubview:_audioButton];
        [_audioBgview addSubview:_audioButton];

    }
    //: return self;
    return self;
}

//: - (void)setInputActionDelegate:(id<NIMInputActionDelegate>)actionDelegate
- (void)setProgress:(id<ColorDelegate>)actionDelegate
{
    //: _actionDelegate = actionDelegate;
    _actionDelegate = actionDelegate;
}


//: -(void)onClicked:(UIButton *)sender{
-(void)paring:(UIButton *)sender{

}
//: - (void)onTouchRecordBtnDown:(id)sender {
- (void)backgrounded:(id)sender {
    //: self.recordPhase = AudioRecordPhaseStart;
    self.recordPhase = AudioRecordPhaseStart;
    // 启动动画
    //: [self.animationImageView startAnimating];
    [self.animationImageView startAnimating];
    //: _delImg.hidden = NO;
    _delImg.hidden = NO;
    //: _delLabel.hidden = NO;
    _delLabel.hidden = NO;
    //: _tipLabel.hidden = YES;
    _tipLabel.hidden = YES;
    //: _soundwaveImageView.hidden = YES;
    _soundwaveImageView.hidden = YES;
    //: _audioBtnBg.frame = CGRectMake(([[UIScreen mainScreen] bounds].size.width-100)/2, 65, 100, 100);
    _audioBtnBg.frame = CGRectMake(([[UIScreen mainScreen] bounds].size.width-100)/2, 65, 100, 100);
}
//: - (void)onTouchRecordBtnUpInside:(id)sender {
- (void)texted:(id)sender {
    // finish Recording
    //: self.recordPhase = AudioRecordPhaseEnd;
    self.recordPhase = AudioRecordPhaseEnd;

    // 停止动画
    //: [self.animationImageView stopAnimating];
    [self.animationImageView stopAnimating];
    //: _delImg.hidden = YES;
    _delImg.hidden = YES;
    //: _delLabel.hidden = YES;
    _delLabel.hidden = YES;
    //: _tipLabel.hidden = NO;
    _tipLabel.hidden = NO;
    //: _soundwaveImageView.hidden = NO;
    _soundwaveImageView.hidden = NO;
    //: _audioBtnBg.frame = CGRectMake(([[UIScreen mainScreen] bounds].size.width-80)/2, 75, 80, 80);
    _audioBtnBg.frame = CGRectMake(([[UIScreen mainScreen] bounds].size.width-80)/2, 75, 80, 80);
}
//: - (void)onTouchRecordBtnUpOutside:(id)sender {
- (void)enableInAlfresco:(id)sender {
    // cancel Recording
    //: self.recordPhase = AudioRecordPhaseEnd;
    self.recordPhase = AudioRecordPhaseEnd;
    // 停止动画
    //: [self.animationImageView stopAnimating];
    [self.animationImageView stopAnimating];
    //: _delImg.hidden = YES;
    _delImg.hidden = YES;
    //: _delLabel.hidden = YES;
    _delLabel.hidden = YES;
    //: _tipLabel.hidden = NO;
    _tipLabel.hidden = NO;
    //: _soundwaveImageView.hidden = NO;
    _soundwaveImageView.hidden = NO;
    //: _audioBtnBg.frame = CGRectMake(([[UIScreen mainScreen] bounds].size.width-80)/2, 75, 80, 80);
    _audioBtnBg.frame = CGRectMake(([[UIScreen mainScreen] bounds].size.width-80)/2, 75, 80, 80);
}

//: - (void)onTouchRecordBtnDragInside:(id)sender {
- (void)bottomKitView:(id)sender {
    // "手指上滑，取消发送"
    //: self.recordPhase = AudioRecordPhaseRecording;
    self.recordPhase = AudioRecordPhaseRecording;

}
//: - (void)onTouchRecordBtnDragOutside:(id)sender {
- (void)baring:(id)sender {
    // "松开手指，取消发送"
    //: self.recordPhase = AudioRecordPhaseCancelling;
    self.recordPhase = AudioRecordPhaseCancelling;
    // 停止动画
    //: [self.animationImageView stopAnimating];
    [self.animationImageView stopAnimating];
    //: _delImg.hidden = YES;
    _delImg.hidden = YES;
    //: _delLabel.hidden = YES;
    _delLabel.hidden = YES;
    //: _tipLabel.hidden = NO;
    _tipLabel.hidden = NO;
    //: _soundwaveImageView.hidden = NO;
    _soundwaveImageView.hidden = NO;
    //: _audioBtnBg.frame = CGRectMake(([[UIScreen mainScreen] bounds].size.width-80)/2, 75, 80, 80);
    _audioBtnBg.frame = CGRectMake(([[UIScreen mainScreen] bounds].size.width-80)/2, 75, 80, 80);
}

//: - (void)setRecordPhase:(NIMAudioRecordPhase)recordPhase {
- (void)setRecordPhase:(NIMAudioRecordPhase)recordPhase {
    //: NIMAudioRecordPhase prevPhase = _recordPhase;
    NIMAudioRecordPhase prevPhase = _recordPhase;
    //: _recordPhase = recordPhase;
    _recordPhase = recordPhase;
    //: if(prevPhase == AudioRecordPhaseEnd) {
    if(prevPhase == AudioRecordPhaseEnd) {
        //: if(AudioRecordPhaseStart == _recordPhase) {
        if(AudioRecordPhaseStart == _recordPhase) {
            //: if ([_actionDelegate respondsToSelector:@selector(onStartRecording)]) {
            if ([_actionDelegate respondsToSelector:@selector(systemNumber)]) {
                //: [_actionDelegate onStartRecording];
                [_actionDelegate systemNumber];
            }
        }
    //: } else if (prevPhase == AudioRecordPhaseStart || prevPhase == AudioRecordPhaseRecording) {
    } else if (prevPhase == AudioRecordPhaseStart || prevPhase == AudioRecordPhaseRecording) {
        //: if (AudioRecordPhaseEnd == _recordPhase) {
        if (AudioRecordPhaseEnd == _recordPhase) {
            //: if ([_actionDelegate respondsToSelector:@selector(onStopRecording)]) {
            if ([_actionDelegate respondsToSelector:@selector(signalLanguage)]) {
                //: [_actionDelegate onStopRecording];
                [_actionDelegate signalLanguage];
            }
        }
    //: } else if (prevPhase == AudioRecordPhaseCancelling) {
    } else if (prevPhase == AudioRecordPhaseCancelling) {
        //: if(AudioRecordPhaseEnd == _recordPhase) {
        if(AudioRecordPhaseEnd == _recordPhase) {
            //: if ([_actionDelegate respondsToSelector:@selector(onCancelRecording)]) {
            if ([_actionDelegate respondsToSelector:@selector(highlightClick)]) {
                //: [_actionDelegate onCancelRecording];
                [_actionDelegate highlightClick];
            }
        }
    }
}

//: - (void)setConfig:(id<CCCSessionConfig>)config
- (void)setConfig:(id<FromConfig>)config
{
    //: _config = config;
    _config = config;
}


//: - (void)animationClose
- (void)iconEnable
{
//    self.hidden = YES;
    //: self.audioBgview.frame = CGRectMake(0, [[UIScreen mainScreen] bounds].size.height-200, [[UIScreen mainScreen] bounds].size.width, 200);
    self.audioBgview.frame = CGRectMake(0, [[UIScreen mainScreen] bounds].size.height-200, [[UIScreen mainScreen] bounds].size.width, 200);
        //: [UIView animateWithDuration:0.3f
        [UIView animateWithDuration:0.3f
                         //: animations:^{
                         animations:^{

            //: self.alpha = 0.0;
            self.alpha = 0.0;
            //: self.audioBgview.frame = CGRectMake(0, [[UIScreen mainScreen] bounds].size.height, [[UIScreen mainScreen] bounds].size.width, 200);
            self.audioBgview.frame = CGRectMake(0, [[UIScreen mainScreen] bounds].size.height, [[UIScreen mainScreen] bounds].size.width, 200);
                         }
                         //: completion:nil];
                         completion:nil];
}

//: - (void)animationShow
- (void)key
{
//    self.hidden = NO;
    //: self.audioBgview.frame = CGRectMake(0, [[UIScreen mainScreen] bounds].size.height, [[UIScreen mainScreen] bounds].size.width, 200);
    self.audioBgview.frame = CGRectMake(0, [[UIScreen mainScreen] bounds].size.height, [[UIScreen mainScreen] bounds].size.width, 200);

        //: [UIView animateWithDuration:0.3 animations:^{
        [UIView animateWithDuration:0.3 animations:^{
             //: self.alpha = 1.0;
             self.alpha = 1.0;
            //: self.audioBgview.frame = CGRectMake(0, [[UIScreen mainScreen] bounds].size.height-200, [[UIScreen mainScreen] bounds].size.width, 200);
            self.audioBgview.frame = CGRectMake(0, [[UIScreen mainScreen] bounds].size.height-200, [[UIScreen mainScreen] bounds].size.width, 200);

        //: } completion:nil];
        } completion:nil];



}

//: @end
@end

Byte *MmDataToByte(MmData *data) {
    if (data->simplicityMode) return data->sweetBest;
    for (int i = 0; i < data->egoAmble; i++) {
        data->sweetBest[i] ^= data->sever;
    }
    data->sweetBest[data->egoAmble] = 0;
    data->simplicityMode = true;
	if (data->egoAmble >= 1) {
		data->join = data->sweetBest[0];
	}
    return data->sweetBest;
}

NSString *StringFromMmData(MmData *data) {
    return [NSString stringWithUTF8String:(char *)MmDataToByte(data)];
}
