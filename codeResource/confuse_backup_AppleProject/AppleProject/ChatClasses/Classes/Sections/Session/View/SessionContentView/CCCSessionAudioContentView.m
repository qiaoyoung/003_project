//
//  SessionAudioCententView.m
//  NIMDemo
//
//  Created by chris.
//  Copyright (c) 2015年 Netease. All rights reserved.
//

#import "CCCSessionAudioContentView.h"
#import "UIViewNimKit.h"
#import "BBBMessageModel.h"
#import "UIImage+AppleProjectKit.h"
#import "CCCKitAudioCenter.h"
#import "AppleProjectKit.h"
#import "UIColor+AppleProjectKit.h"

@interface CCCSessionAudioContentView()<NIMMediaManagerDelegate>

@property (nonatomic,strong) UIImageView *voiceImageView;

@property (nonatomic,strong) UILabel *durationLabel;

@end

@implementation CCCSessionAudioContentView

-(instancetype)initSessionMessageContentView{
    self = [super initSessionMessageContentView];
    if (self) {
        [self addVoiceView];
        [[NIMSDK sharedSDK].mediaManager addDelegate:self];
    }
    return self;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [[NIMSDK sharedSDK].mediaManager removeDelegate:self];
}

- (void)setPlaying:(BOOL)isPlaying
{
    if (isPlaying) {
        [self.voiceImageView startAnimating];
    }else{
        [self.voiceImageView stopAnimating];
    }
}

- (void)addVoiceView{
    _audioBackgroundView = [[UIView alloc] initWithFrame:CGRectZero];
    _audioBackgroundView.layer.cornerRadius = 16.f;
    _audioBackgroundView.userInteractionEnabled = NO;
    [self addSubview:_audioBackgroundView];
    
    UIImage *image = [UIImage imageNamed:@"icon_receiver_voice_playing"];
    _voiceImageView = [[UIImageView alloc] initWithImage:image];
    NSArray *animateNames = @[@"icon_receiver_voice_playing_001",@"icon_receiver_voice_playing_002",@"icon_receiver_voice_playing_003",@"icon_receiver_voice_playing_004",@"icon_receiver_voice_playing_005"];
    NSMutableArray * animationImages = [[NSMutableArray alloc] initWithCapacity:animateNames.count];
    for (NSString * animateName in animateNames) {
        UIImage * animateImage = [UIImage imageNamed:animateName];
        [animationImages addObject:animateImage];
    }
    _voiceImageView.animationImages = animationImages;
    _voiceImageView.animationDuration = 1.0;
    [self addSubview:_voiceImageView];
    
    _durationLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    _durationLabel.backgroundColor = [UIColor clearColor];
    [self addSubview:_durationLabel];
    
}

- (void)refresh:(BBBMessageModel *)data {
    [super refresh:data];
    NIMAudioObject *object = self.model.message.messageObject;
    self.durationLabel.text = [NSString stringWithFormat:@"%zd\"",(NSInteger)((object.duration+500)/1000)];//四舍五入
    
    CCCKitSetting *setting = [[AppleProjectKit sharedKit].config setting:data.message];

    self.durationLabel.font      = setting.font;
    self.durationLabel.textColor = setting.textColor;
    
    [self.durationLabel sizeToFit];
    
    [self setPlaying:self.isPlaying];
    
//    [self refreshBackground:data];
}

- (void)refreshBackground:(BBBMessageModel *)data
{
//    UIColor *color = [UIColor clearColor];
    if (data.shouldShowLeft)
    {
//        color = [UIColor colorWithHex:0xF3F3F3 alpha:1];
        _voiceImageView.image = [UIImage imageNamed:@"icon_receiver_voice_playing"];
    }
    else
    {
//        color = [UIColor colorWithHex:0x1A73E0 alpha:1];
        _voiceImageView.image = [UIImage imageNamed:@"icon_receiver_voice_playing_w"];
    }
    
//    _audioBackgroundView.backgroundColor = color;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    UIEdgeInsets contentInsets = self.model.contentViewInsets;
    switch (self.layoutStyle) {
        case CCCSessionMessageContentViewLayoutLeft: {
            _voiceImageView.transform = CGAffineTransformIdentity;
            self.voiceImageView.nim_left = contentInsets.left * 2;
             _durationLabel.nim_right = self.nim_width - contentInsets.right * 2;
            break;
        }
        case CCCSessionMessageContentViewLayoutRight: {
            _voiceImageView.transform = CGAffineTransformMakeRotation(M_PI);
            self.voiceImageView.nim_right = self.nim_width - contentInsets.right * 2;
            _durationLabel.nim_left = contentInsets.left;
            break;
        }
        case CCCSessionMessageContentViewLayoutAuto:
        default:
        {
            if (self.model.message.isOutgoingMsg) {
                _voiceImageView.transform = CGAffineTransformMakeRotation(M_PI);
                self.voiceImageView.nim_right = self.nim_width - contentInsets.right * 2;
                _durationLabel.nim_left = contentInsets.left * 2;
            } else {
                _voiceImageView.transform = CGAffineTransformIdentity;
               self.voiceImageView.nim_left = contentInsets.left;
                _durationLabel.nim_right = self.nim_width - contentInsets.right * 2;
            }
            break;
        }
    }
    _voiceImageView.width = 22;
    _voiceImageView.height = 20;
    _voiceImageView.nim_centerY = self.nim_height * .5f;
    _durationLabel.nim_centerY = _voiceImageView.nim_centerY;
    
    CGFloat backgroundWidth = 0;
    CGFloat backgroundLeft = 0;
    switch (self.layoutStyle) {
        case CCCSessionMessageContentViewLayoutLeft:
            {
                backgroundWidth = self.nim_width - contentInsets.left * .5f - 2;
                backgroundLeft = contentInsets.left * .5f;
            }
            break;
        case CCCSessionMessageContentViewLayoutRight:
            {
                backgroundWidth = self.nim_width - 2 - contentInsets.right * .5f;
                backgroundLeft = 2;
            }
            break;
        default:
        {
            if (self.model.message.isOutgoingMsg) {
                backgroundWidth = self.nim_width - 2 - contentInsets.right * .5f;
                backgroundLeft = 2;
            } else {
                backgroundWidth = self.nim_width - contentInsets.left * .5f - 2;
                backgroundLeft = contentInsets.left * .5f;
            }
            break;
        }
    }
    _audioBackgroundView.nim_size = CGSizeMake(backgroundWidth,
                                               self.nim_height - 4);
    _audioBackgroundView.nim_left = backgroundLeft;
    _audioBackgroundView.nim_top = 2;
}

-(void)onTouchUpInside:(id)sender
{
    if ([self.model.message attachmentDownloadState]== NIMMessageAttachmentDownloadStateFailed
        || [self.model.message attachmentDownloadState] == NIMMessageAttachmentDownloadStateNeedDownload) {
        [[[NIMSDK sharedSDK] chatManager] fetchMessageAttachment:self.model.message
                                                           error:nil];
        return;
    }
    if ([self.model.message attachmentDownloadState] == NIMMessageAttachmentDownloadStateDownloaded) {
        
        if ([[NIMSDK sharedSDK].mediaManager isPlaying]) {
            [self stopPlayingUI];
        }
        
        BBBKitEvent *event = [[BBBKitEvent alloc] init];
        event.eventName = BBBKitEventNameTapAudio;
        event.messageModel = self.model;
        [self.delegate onCatchEvent:event];

    }
}

#pragma mark - NIMMediaManagerDelegate

- (void)playAudio:(NSString *)filePath didBeganWithError:(NSError *)error {
    if(filePath && !error) {
        if (self.isPlaying && [self.audioUIDelegate respondsToSelector:@selector(startPlayingAudioUI)]) {
            [self.audioUIDelegate startPlayingAudioUI];
        }        
    }
}

- (void)playAudio:(NSString *)filePath didCompletedWithError:(NSError *)error
{
    [self stopPlayingUI];
}

- (void)stopPlayAudio:(NSString *)filePath didCompletedWithError:(nullable NSError *)error
{
    [self stopPlayingUI];
}

#pragma mark - private methods
- (void)stopPlayingUI
{
    [self setPlaying:NO];
}

- (BOOL)isPlaying
{
    BOOL play = [CCCKitAudioCenter instance].currentPlayingMessage == self.model.message; //对比是否是同一条消息，严格同一条，不能是相同ID，防止进了会话又进云端消息界面，导致同一个ID的云消息也在动画
    return play;
}


//- (NSString *)convertToTimeStringWithTimeInterval:(NSTimeInterval)timeInterval{
//    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timeInterval];
//    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//    [dateFormatter setDateFormat:@"HH:mm"];
//    NSString *dateStsring = [dateFormatter stringFromDate:date];
//    return dateStsring;
//}

@end
