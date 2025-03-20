// __DEBUG__
// __CLOSE_PRINT__
//
//  IconTo.m
// Indicator
//
//  Created by chris on 2017/1/13.
//  Copyright © 2017年 NetEase. All rights reserved.
//

// __M_A_C_R_O__
//: #import "CCCKitAudioCenter.h"
#import "IconTo.h"
//: #import <NIMSDK/NIMSDK.h>
#import <NIMSDK/NIMSDK.h>

//: @interface CCCKitAudioCenter()<NIMMediaManagerDelegate>
@interface IconTo()<NIMMediaManagerDelegate>

//: @property (nonatomic,assign) NSInteger retryCount;
@property (nonatomic,assign) NSInteger retryCount;

//: @end
@end

//: @implementation CCCKitAudioCenter
@implementation IconTo

//: + (instancetype)instance
+ (instancetype)value
{
    //: static CCCKitAudioCenter *instance;
    static IconTo *instance;
    //: static dispatch_once_t onceToken;
    static dispatch_once_t onceToken;
    //: _dispatch_once(&onceToken, ^{
    _dispatch_once(&onceToken, ^{
        //: instance = [[CCCKitAudioCenter alloc] init];
        instance = [[IconTo alloc] init];
    //: });
    });
    //: return instance;
    return instance;
}


//: - (instancetype)init
- (instancetype)init
{
    //: self = [super init];
    self = [super init];
    //: if (self) {
    if (self) {
        //: [[NIMSDK sharedSDK].mediaManager addDelegate:self];
        [[NIMSDK sharedSDK].mediaManager addDelegate:self];
        //: [self resetRetryCount];
        [self text];
    }
    //: return self;
    return self;
}

//: - (void)resetRetryCount
- (void)text
{
    //: _retryCount = 3;
    _retryCount = 3;
}

//: - (void)play:(NIMMessage *)message
- (void)touchBlock:(NIMMessage *)message
{
    //: NIMAudioObject *audioObject = (NIMAudioObject *)message.messageObject;
    NIMAudioObject *audioObject = (NIMAudioObject *)message.messageObject;
    //: if ([audioObject isKindOfClass:[NIMAudioObject class]]) {
    if ([audioObject isKindOfClass:[NIMAudioObject class]]) {
        //: self.currentPlayingMessage = message;
        self.currentPlayingMessage = message;
        //: message.isPlayed = YES;
        message.isPlayed = YES;

        //: [[NIMSDK sharedSDK].mediaManager play:audioObject.path];
        [[NIMSDK sharedSDK].mediaManager play:audioObject.path];
    }
}


//: #pragma mark - NIMMediaManagerDelegate
#pragma mark - NIMMediaManagerDelegate

//: - (void)playAudio:(NSString *)filePath didBeganWithError:(NSError *)error
- (void)playAudio:(NSString *)filePath didBeganWithError:(NSError *)error
{
    //: if (error)
    if (error)
    {
        //: if (_retryCount > 0)
        if (_retryCount > 0)
        {
            //: _retryCount--;
            _retryCount--;
            // iPhone4 和 iPhone 4S 上连播会由于设备释放过慢导致 AudioQueue 启动不了的问题，这里做个延迟重试，最多重试 3 次 ( code -66681 )
            //: dispatch_after(dispatch_time((0ull), (int64_t)(0.2 * 1000000000ull)), dispatch_get_main_queue(), ^{
            dispatch_after(dispatch_time((0ull), (int64_t)(0.2 * 1000000000ull)), dispatch_get_main_queue(), ^{
                //: [[NIMSDK sharedSDK].mediaManager play:filePath];
                [[NIMSDK sharedSDK].mediaManager play:filePath];
            //: });
            });
        }
        //: else
        else
        {
            //: self.currentPlayingMessage = nil;
            self.currentPlayingMessage = nil;
            //: [self resetRetryCount];
            [self text];
        }

    }
    //: else
    else
    {
        //: [self resetRetryCount];
        [self text];
    }
}

//: - (void)stopPlayAudio:(NSString *)filePath didCompletedWithError:(nullable NSError *)error
- (void)stopPlayAudio:(NSString *)filePath didCompletedWithError:(nullable NSError *)error
{
    //: self.currentPlayingMessage = nil;
    self.currentPlayingMessage = nil;
}


//: - (void)playAudio:(NSString *)filePath didCompletedWithError:(nullable NSError *)error
- (void)playAudio:(NSString *)filePath didCompletedWithError:(nullable NSError *)error
{
    //: self.currentPlayingMessage = nil;
    self.currentPlayingMessage = nil;
}


//: @end
@end