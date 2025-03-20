
#import <Foundation/Foundation.h>

NSString *StringFromPerhapsMissingData(Byte *data);


//: icon_receiver_voice_playing
Byte str_howFromValue[] = {7, 27, 11, 89, 135, 248, 140, 240, 229, 244, 23, 103, 110, 105, 121, 97, 108, 112, 95, 101, 99, 105, 111, 118, 95, 114, 101, 118, 105, 101, 99, 101, 114, 95, 110, 111, 99, 105, 138};


//: icon_receiver_voice_playing_004
Byte str_parkBucketData[] = {96, 31, 3, 52, 48, 48, 95, 103, 110, 105, 121, 97, 108, 112, 95, 101, 99, 105, 111, 118, 95, 114, 101, 118, 105, 101, 99, 101, 114, 95, 110, 111, 99, 105, 245};


//: icon_receiver_voice_playing_w
Byte str_readilyName[] = {46, 29, 13, 177, 106, 56, 59, 45, 47, 113, 250, 208, 222, 119, 95, 103, 110, 105, 121, 97, 108, 112, 95, 101, 99, 105, 111, 118, 95, 114, 101, 118, 105, 101, 99, 101, 114, 95, 110, 111, 99, 105, 216};


//: icon_receiver_voice_playing_001
Byte str_heavyTitle[] = {35, 31, 9, 60, 242, 193, 200, 82, 255, 49, 48, 48, 95, 103, 110, 105, 121, 97, 108, 112, 95, 101, 99, 105, 111, 118, 95, 114, 101, 118, 105, 101, 99, 101, 114, 95, 110, 111, 99, 105, 154};


//: icon_receiver_voice_playing_002
Byte str_vaccineChickenWeekendValue[] = {9, 31, 9, 26, 7, 231, 30, 8, 43, 50, 48, 48, 95, 103, 110, 105, 121, 97, 108, 112, 95, 101, 99, 105, 111, 118, 95, 114, 101, 118, 105, 101, 99, 101, 114, 95, 110, 111, 99, 105, 135};


//: icon_receiver_voice_playing_003
Byte str_equalFessData[] = {78, 31, 6, 228, 9, 71, 51, 48, 48, 95, 103, 110, 105, 121, 97, 108, 112, 95, 101, 99, 105, 111, 118, 95, 114, 101, 118, 105, 101, 99, 101, 114, 95, 110, 111, 99, 105, 218};


//: icon_receiver_voice_playing_005
Byte str_heavyName[] = {11, 31, 10, 167, 236, 171, 18, 56, 98, 115, 53, 48, 48, 95, 103, 110, 105, 121, 97, 108, 112, 95, 101, 99, 105, 111, 118, 95, 114, 101, 118, 105, 101, 99, 101, 114, 95, 110, 111, 99, 105, 94};

// __DEBUG__
// __CLOSE_PRINT__
//
//  SessionAudioCententView.m
//  NIMDemo
//
//  Created by chris.
//  Copyright (c) 2015年 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import "CCCSessionAudioContentView.h"
#import "LanguageView.h"
//: #import "UIViewNimKit.h"
#import "UIViewNimKit.h"
//: #import "BBBMessageModel.h"
#import "AccumulationCenter.h"
//: #import "UIImage+AppleProjectKit.h"
#import "UIImage+Indicator.h"
//: #import "CCCKitAudioCenter.h"
#import "IconTo.h"
//: #import "AppleProjectKit.h"
#import "Indicator.h"
//: #import "UIColor+AppleProjectKit.h"
#import "UIColor+Indicator.h"

//: @interface CCCSessionAudioContentView()<NIMMediaManagerDelegate>
@interface LanguageView()<NIMMediaManagerDelegate>

//: @property (nonatomic,strong) UIImageView *voiceImageView;
@property (nonatomic,strong) UIImageView *voiceImageView;

//: @property (nonatomic,strong) UILabel *durationLabel;
@property (nonatomic,strong) UILabel *durationLabel;

//: @end
@end

//: @implementation CCCSessionAudioContentView
@implementation LanguageView

//: -(instancetype)initSessionMessageContentView{
-(instancetype)initMessageOpen{
    //: self = [super initSessionMessageContentView];
    self = [super initMessageOpen];
    //: if (self) {
    if (self) {
        //: [self addVoiceView];
        [self addDisable];
        //: [[NIMSDK sharedSDK].mediaManager addDelegate:self];
        [[NIMSDK sharedSDK].mediaManager addDelegate:self];
    }
    //: return self;
    return self;
}

//: - (void)dealloc
- (void)dealloc
{
    //: [[NSNotificationCenter defaultCenter] removeObserver:self];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    //: [[NIMSDK sharedSDK].mediaManager removeDelegate:self];
    [[NIMSDK sharedSDK].mediaManager removeDelegate:self];
}

//: - (void)setPlaying:(BOOL)isPlaying
- (void)setMessage:(BOOL)isPlaying
{
    //: if (isPlaying) {
    if (isPlaying) {
        //: [self.voiceImageView startAnimating];
        [self.voiceImageView startAnimating];
    //: }else{
    }else{
        //: [self.voiceImageView stopAnimating];
        [self.voiceImageView stopAnimating];
    }
}

//: - (void)addVoiceView{
- (void)addDisable{
    //: _audioBackgroundView = [[UIView alloc] initWithFrame:CGRectZero];
    _audioBackgroundView = [[UIView alloc] initWithFrame:CGRectZero];
    //: _audioBackgroundView.layer.cornerRadius = 16.f;
    _audioBackgroundView.layer.cornerRadius = 16.f;
    //: _audioBackgroundView.userInteractionEnabled = NO;
    _audioBackgroundView.userInteractionEnabled = NO;
    //: [self addSubview:_audioBackgroundView];
    [self addSubview:_audioBackgroundView];

    //: UIImage *image = [UIImage imageNamed:@"icon_receiver_voice_playing"];
    UIImage *image = [UIImage imageNamed:StringFromPerhapsMissingData(str_howFromValue)];
    //: _voiceImageView = [[UIImageView alloc] initWithImage:image];
    _voiceImageView = [[UIImageView alloc] initWithImage:image];
    //: NSArray *animateNames = @[@"icon_receiver_voice_playing_001",@"icon_receiver_voice_playing_002",@"icon_receiver_voice_playing_003",@"icon_receiver_voice_playing_004",@"icon_receiver_voice_playing_005"];
    NSArray *animateNames = @[StringFromPerhapsMissingData(str_heavyTitle),StringFromPerhapsMissingData(str_vaccineChickenWeekendValue),StringFromPerhapsMissingData(str_equalFessData),StringFromPerhapsMissingData(str_parkBucketData),StringFromPerhapsMissingData(str_heavyName)];
    //: NSMutableArray * animationImages = [[NSMutableArray alloc] initWithCapacity:animateNames.count];
    NSMutableArray * animationImages = [[NSMutableArray alloc] initWithCapacity:animateNames.count];
    //: for (NSString * animateName in animateNames) {
    for (NSString * animateName in animateNames) {
        //: UIImage * animateImage = [UIImage imageNamed:animateName];
        UIImage * animateImage = [UIImage imageNamed:animateName];
        //: [animationImages addObject:animateImage];
        [animationImages addObject:animateImage];
    }
    //: _voiceImageView.animationImages = animationImages;
    _voiceImageView.animationImages = animationImages;
    //: _voiceImageView.animationDuration = 1.0;
    _voiceImageView.animationDuration = 1.0;
    //: [self addSubview:_voiceImageView];
    [self addSubview:_voiceImageView];

    //: _durationLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _durationLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    //: _durationLabel.backgroundColor = [UIColor clearColor];
    _durationLabel.backgroundColor = [UIColor clearColor];
    //: [self addSubview:_durationLabel];
    [self addSubview:_durationLabel];

}

//: - (void)refresh:(BBBMessageModel *)data {
- (void)video:(AccumulationCenter *)data {
    //: [super refresh:data];
    [super video:data];
    //: NIMAudioObject *object = self.model.message.messageObject;
    NIMAudioObject *object = self.model.message.messageObject;
    //: self.durationLabel.text = [NSString stringWithFormat:@"%zd\"",(NSInteger)((object.duration+500)/1000)];
    self.durationLabel.text = [NSString stringWithFormat:@"%zd\"",(NSInteger)((object.duration+500)/1000)];//四舍五入

    //: CCCKitSetting *setting = [[AppleProjectKit sharedKit].config setting:data.message];
    CenterShould *setting = [[Indicator reach].config info:data.message];

    //: self.durationLabel.font = setting.font;
    self.durationLabel.font = setting.font;
    //: self.durationLabel.textColor = setting.textColor;
    self.durationLabel.textColor = setting.textColor;

    //: [self.durationLabel sizeToFit];
    [self.durationLabel sizeToFit];

    //: [self setPlaying:self.isPlaying];
    [self setMessage:self.outsideOf];

//    [self refreshBackground:data];
}

//: - (void)refreshBackground:(BBBMessageModel *)data
- (void)locationBackground:(AccumulationCenter *)data
{
//    UIColor *color = [UIColor clearColor];
    //: if (data.shouldShowLeft)
    if (data.shouldShowLeft)
    {
//        color = [UIColor colorWithHex:0xF3F3F3 alpha:1];
        //: _voiceImageView.image = [UIImage imageNamed:@"icon_receiver_voice_playing"];
        _voiceImageView.image = [UIImage imageNamed:StringFromPerhapsMissingData(str_howFromValue)];
    }
    //: else
    else
    {
//        color = [UIColor colorWithHex:0x1A73E0 alpha:1];
        //: _voiceImageView.image = [UIImage imageNamed:@"icon_receiver_voice_playing_w"];
        _voiceImageView.image = [UIImage imageNamed:StringFromPerhapsMissingData(str_readilyName)];
    }

//    _audioBackgroundView.backgroundColor = color;
}

//: - (void)layoutSubviews{
- (void)layoutSubviews{
    //: [super layoutSubviews];
    [super layoutSubviews];
    //: UIEdgeInsets contentInsets = self.model.contentViewInsets;
    UIEdgeInsets contentInsets = self.model.contentViewInsets;
    //: switch (self.layoutStyle) {
    switch (self.layoutStyle) {
        //: case CCCSessionMessageContentViewLayoutLeft: {
        case CCCSessionMessageContentViewLayoutLeft: {
            //: _voiceImageView.transform = CGAffineTransformIdentity;
            _voiceImageView.transform = CGAffineTransformIdentity;
            //: self.voiceImageView.nim_left = contentInsets.left * 2;
            self.voiceImageView.nim_left = contentInsets.left * 2;
             //: _durationLabel.nim_right = self.nim_width - contentInsets.right * 2;
             _durationLabel.nim_right = self.nim_width - contentInsets.right * 2;
            //: break;
            break;
        }
        //: case CCCSessionMessageContentViewLayoutRight: {
        case CCCSessionMessageContentViewLayoutRight: {
            //: _voiceImageView.transform = CGAffineTransformMakeRotation(3.14159265358979323846264338327950288);
            _voiceImageView.transform = CGAffineTransformMakeRotation(3.14159265358979323846264338327950288);
            //: self.voiceImageView.nim_right = self.nim_width - contentInsets.right * 2;
            self.voiceImageView.nim_right = self.nim_width - contentInsets.right * 2;
            //: _durationLabel.nim_left = contentInsets.left;
            _durationLabel.nim_left = contentInsets.left;
            //: break;
            break;
        }
        //: case CCCSessionMessageContentViewLayoutAuto:
        case CCCSessionMessageContentViewLayoutAuto:
        //: default:
        default:
        {
            //: if (self.model.message.isOutgoingMsg) {
            if (self.model.message.isOutgoingMsg) {
                //: _voiceImageView.transform = CGAffineTransformMakeRotation(3.14159265358979323846264338327950288);
                _voiceImageView.transform = CGAffineTransformMakeRotation(3.14159265358979323846264338327950288);
                //: self.voiceImageView.nim_right = self.nim_width - contentInsets.right * 2;
                self.voiceImageView.nim_right = self.nim_width - contentInsets.right * 2;
                //: _durationLabel.nim_left = contentInsets.left * 2;
                _durationLabel.nim_left = contentInsets.left * 2;
            //: } else {
            } else {
                //: _voiceImageView.transform = CGAffineTransformIdentity;
                _voiceImageView.transform = CGAffineTransformIdentity;
               //: self.voiceImageView.nim_left = contentInsets.left;
               self.voiceImageView.nim_left = contentInsets.left;
                //: _durationLabel.nim_right = self.nim_width - contentInsets.right * 2;
                _durationLabel.nim_right = self.nim_width - contentInsets.right * 2;
            }
            //: break;
            break;
        }
    }
    //: _voiceImageView.width = 22;
    _voiceImageView.width = 22;
    //: _voiceImageView.height = 20;
    _voiceImageView.height = 20;
    //: _voiceImageView.nim_centerY = self.nim_height * .5f;
    _voiceImageView.nim_centerY = self.nim_height * .5f;
    //: _durationLabel.nim_centerY = _voiceImageView.nim_centerY;
    _durationLabel.nim_centerY = _voiceImageView.nim_centerY;

    //: CGFloat backgroundWidth = 0;
    CGFloat backgroundWidth = 0;
    //: CGFloat backgroundLeft = 0;
    CGFloat backgroundLeft = 0;
    //: switch (self.layoutStyle) {
    switch (self.layoutStyle) {
        //: case CCCSessionMessageContentViewLayoutLeft:
        case CCCSessionMessageContentViewLayoutLeft:
            {
                //: backgroundWidth = self.nim_width - contentInsets.left * .5f - 2;
                backgroundWidth = self.nim_width - contentInsets.left * .5f - 2;
                //: backgroundLeft = contentInsets.left * .5f;
                backgroundLeft = contentInsets.left * .5f;
            }
            //: break;
            break;
        //: case CCCSessionMessageContentViewLayoutRight:
        case CCCSessionMessageContentViewLayoutRight:
            {
                //: backgroundWidth = self.nim_width - 2 - contentInsets.right * .5f;
                backgroundWidth = self.nim_width - 2 - contentInsets.right * .5f;
                //: backgroundLeft = 2;
                backgroundLeft = 2;
            }
            //: break;
            break;
        //: default:
        default:
        {
            //: if (self.model.message.isOutgoingMsg) {
            if (self.model.message.isOutgoingMsg) {
                //: backgroundWidth = self.nim_width - 2 - contentInsets.right * .5f;
                backgroundWidth = self.nim_width - 2 - contentInsets.right * .5f;
                //: backgroundLeft = 2;
                backgroundLeft = 2;
            //: } else {
            } else {
                //: backgroundWidth = self.nim_width - contentInsets.left * .5f - 2;
                backgroundWidth = self.nim_width - contentInsets.left * .5f - 2;
                //: backgroundLeft = contentInsets.left * .5f;
                backgroundLeft = contentInsets.left * .5f;
            }
            //: break;
            break;
        }
    }
    //: _audioBackgroundView.nim_size = CGSizeMake(backgroundWidth,
    _audioBackgroundView.nim_size = CGSizeMake(backgroundWidth,
                                               //: self.nim_height - 4);
                                               self.nim_height - 4);
    //: _audioBackgroundView.nim_left = backgroundLeft;
    _audioBackgroundView.nim_left = backgroundLeft;
    //: _audioBackgroundView.nim_top = 2;
    _audioBackgroundView.nim_top = 2;
}

//: -(void)onTouchUpInside:(id)sender
-(void)priceTag:(id)sender
{
    //: if ([self.model.message attachmentDownloadState]== NIMMessageAttachmentDownloadStateFailed
    if ([self.model.message attachmentDownloadState]== NIMMessageAttachmentDownloadStateFailed
        //: || [self.model.message attachmentDownloadState] == NIMMessageAttachmentDownloadStateNeedDownload) {
        || [self.model.message attachmentDownloadState] == NIMMessageAttachmentDownloadStateNeedDownload) {
        //: [[[NIMSDK sharedSDK] chatManager] fetchMessageAttachment:self.model.message
        [[[NIMSDK sharedSDK] chatManager] fetchMessageAttachment:self.model.message
                                                           //: error:nil];
                                                           error:nil];
        //: return;
        return;
    }
    //: if ([self.model.message attachmentDownloadState] == NIMMessageAttachmentDownloadStateDownloaded) {
    if ([self.model.message attachmentDownloadState] == NIMMessageAttachmentDownloadStateDownloaded) {

        //: if ([[NIMSDK sharedSDK].mediaManager isPlaying]) {
        if ([[NIMSDK sharedSDK].mediaManager isPlaying]) {
            //: [self stopPlayingUI];
            [self messageContent];
        }

        //: BBBKitEvent *event = [[BBBKitEvent alloc] init];
        MightHaveBeenAdd *event = [[MightHaveBeenAdd alloc] init];
        //: event.eventName = BBBKitEventNameTapAudio;
        event.eventName = k_messageData;
        //: event.messageModel = self.model;
        event.messageModel = self.model;
        //: [self.delegate onCatchEvent:event];
        [self.delegate birthplaces:event];

    }
}

//: #pragma mark - NIMMediaManagerDelegate
#pragma mark - NIMMediaManagerDelegate

//: - (void)playAudio:(NSString *)filePath didBeganWithError:(NSError *)error {
- (void)playAudio:(NSString *)filePath didBeganWithError:(NSError *)error {
    //: if(filePath && !error) {
    if(filePath && !error) {
        //: if (self.isPlaying && [self.audioUIDelegate respondsToSelector:@selector(startPlayingAudioUI)]) {
        if (self.outsideOf && [self.audioUIDelegate respondsToSelector:@selector(commonDown)]) {
            //: [self.audioUIDelegate startPlayingAudioUI];
            [self.audioUIDelegate commonDown];
        }
    }
}

//: - (void)playAudio:(NSString *)filePath didCompletedWithError:(NSError *)error
- (void)playAudio:(NSString *)filePath didCompletedWithError:(NSError *)error
{
    //: [self stopPlayingUI];
    [self messageContent];
}

//: - (void)stopPlayAudio:(NSString *)filePath didCompletedWithError:(nullable NSError *)error
- (void)stopPlayAudio:(NSString *)filePath didCompletedWithError:(nullable NSError *)error
{
    //: [self stopPlayingUI];
    [self messageContent];
}

//: #pragma mark - private methods
#pragma mark - private methods
//: - (void)stopPlayingUI
- (void)messageContent
{
    //: [self setPlaying:NO];
    [self setMessage:NO];
}

//: - (BOOL)isPlaying
- (BOOL)outsideOf
{
    //: BOOL play = [CCCKitAudioCenter instance].currentPlayingMessage == self.model.message; 
    BOOL play = [IconTo value].currentPlayingMessage == self.model.message; //对比是否是同一条消息，严格同一条，不能是相同ID，防止进了会话又进云端消息界面，导致同一个ID的云消息也在动画
    //: return play;
    return play;
}


//- (NSString *)convertToTimeStringWithTimeInterval:(NSTimeInterval)timeInterval{
//    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timeInterval];
//    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//    [dateFormatter setDateFormat:@"HH:mm"];
//    NSString *dateStsring = [dateFormatter stringFromDate:date];
//    return dateStsring;
//}

//: @end
@end

Byte * PerhapsMissingDataToCache(Byte *data) {
    int fileBet = data[0];
    int manipulate = data[1];
    int carveSever = data[2];
    if (!fileBet) return data + carveSever;
    for (int i = 0; i < manipulate / 2; i++) {
        int begin = carveSever + i;
        int end = carveSever + manipulate - i - 1;
        Byte temp = data[begin];
        data[begin] = data[end];
        data[end] = temp;
    }
    data[0] = 0;
    data[carveSever + manipulate] = 0;
    return data + carveSever;
}

NSString *StringFromPerhapsMissingData(Byte *data) {
    return [NSString stringWithUTF8String:(char *)PerhapsMissingDataToCache(data)];
}  
