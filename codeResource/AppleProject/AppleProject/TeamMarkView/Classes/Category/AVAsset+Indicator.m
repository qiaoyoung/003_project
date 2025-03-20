// __DEBUG__
// __CLOSE_PRINT__
//
//  AVAsset+NIMKit.m
// Indicator
//
//  Created by Genning on 2020/9/25.
//  Copyright © 2020 NetEase. All rights reserved.
//

// __M_A_C_R_O__
//: #import "AVAsset+AppleProjectKit.h"
#import "AVAsset+Indicator.h"

//: @implementation AVAsset (AppleProjectKit)
@implementation AVAsset (Indicator)

//: - (AVMutableVideoComposition *)nim_videoComposition {
- (AVMutableVideoComposition *)mustComposition {
    //: AVAssetTrack *videoTrack = [[self tracksWithMediaType:AVMediaTypeVideo] objectAtIndex:0];
    AVAssetTrack *videoTrack = [[self tracksWithMediaType:AVMediaTypeVideo] objectAtIndex:0];
    //: AVMutableComposition *composition = [AVMutableComposition composition];
    AVMutableComposition *composition = [AVMutableComposition composition];
    //: AVMutableVideoComposition *videoComposition = [AVMutableVideoComposition videoComposition];
    AVMutableVideoComposition *videoComposition = [AVMutableVideoComposition videoComposition];
    //: CGSize videoSize = videoTrack.naturalSize;
    CGSize videoSize = videoTrack.naturalSize;
    //: BOOL isPortrait_ = [self nim_isVideoPortrait];
    BOOL isPortrait_ = [self picture];
    //: if(isPortrait_) {
    if(isPortrait_) {
        //: videoSize = CGSizeMake(videoSize.height, videoSize.width);
        videoSize = CGSizeMake(videoSize.height, videoSize.width);
    }
    //: composition.naturalSize = videoSize;
    composition.naturalSize = videoSize;
    //: videoComposition.renderSize = videoSize;
    videoComposition.renderSize = videoSize;

    //: videoComposition.frameDuration = CMTimeMakeWithSeconds( 1 / videoTrack.nominalFrameRate, 600);
    videoComposition.frameDuration = CMTimeMakeWithSeconds( 1 / videoTrack.nominalFrameRate, 600);
    //: AVMutableCompositionTrack *compositionVideoTrack;
    AVMutableCompositionTrack *compositionVideoTrack;
    //: compositionVideoTrack = [composition addMutableTrackWithMediaType:AVMediaTypeVideo preferredTrackID:kCMPersistentTrackID_Invalid];
    compositionVideoTrack = [composition addMutableTrackWithMediaType:AVMediaTypeVideo preferredTrackID:kCMPersistentTrackID_Invalid];
    //: [compositionVideoTrack insertTimeRange:CMTimeRangeMake(kCMTimeZero, self.duration) ofTrack:videoTrack atTime:kCMTimeZero error:nil];
    [compositionVideoTrack insertTimeRange:CMTimeRangeMake(kCMTimeZero, self.duration) ofTrack:videoTrack atTime:kCMTimeZero error:nil];
    //: AVMutableVideoCompositionLayerInstruction *layerInst;
    AVMutableVideoCompositionLayerInstruction *layerInst;
    //: layerInst = [AVMutableVideoCompositionLayerInstruction videoCompositionLayerInstructionWithAssetTrack:videoTrack];
    layerInst = [AVMutableVideoCompositionLayerInstruction videoCompositionLayerInstructionWithAssetTrack:videoTrack];
    //: [layerInst setTransform:videoTrack.preferredTransform atTime:kCMTimeZero];
    [layerInst setTransform:videoTrack.preferredTransform atTime:kCMTimeZero];
    //: AVMutableVideoCompositionInstruction *inst = [AVMutableVideoCompositionInstruction videoCompositionInstruction];
    AVMutableVideoCompositionInstruction *inst = [AVMutableVideoCompositionInstruction videoCompositionInstruction];
    //: inst.timeRange = CMTimeRangeMake(kCMTimeZero, self.duration);
    inst.timeRange = CMTimeRangeMake(kCMTimeZero, self.duration);
    //: inst.layerInstructions = [NSArray arrayWithObject:layerInst];
    inst.layerInstructions = [NSArray arrayWithObject:layerInst];
    //: videoComposition.instructions = [NSArray arrayWithObject:inst];
    videoComposition.instructions = [NSArray arrayWithObject:inst];
    //: return videoComposition;
    return videoComposition;
}

//: - (BOOL)nim_isVideoPortrait
- (BOOL)picture
{
    //: BOOL isPortrait = NO;
    BOOL isPortrait = NO;
    //: NSArray *tracks = [self tracksWithMediaType:AVMediaTypeVideo];
    NSArray *tracks = [self tracksWithMediaType:AVMediaTypeVideo];
    //: if([tracks count] > 0) {
    if([tracks count] > 0) {
        //: AVAssetTrack *videoTrack = [tracks objectAtIndex:0];
        AVAssetTrack *videoTrack = [tracks objectAtIndex:0];

        //: CGAffineTransform t = videoTrack.preferredTransform;
        CGAffineTransform t = videoTrack.preferredTransform;
        // Portrait
        //: if(t.a == 0 && t.b == 1.0 && t.c == -1.0 && t.d == 0)
        if(t.a == 0 && t.b == 1.0 && t.c == -1.0 && t.d == 0)
        {
            //: isPortrait = YES;
            isPortrait = YES;
        }
        // PortraitUpsideDown
        //: if(t.a == 0 && t.b == -1.0 && t.c == 1.0 && t.d == 0) {
        if(t.a == 0 && t.b == -1.0 && t.c == 1.0 && t.d == 0) {

            //: isPortrait = YES;
            isPortrait = YES;
        }
        // LandscapeRight
        //: if(t.a == 1.0 && t.b == 0 && t.c == 0 && t.d == 1.0)
        if(t.a == 1.0 && t.b == 0 && t.c == 0 && t.d == 1.0)
        {
            //: isPortrait = NO;
            isPortrait = NO;
        }
        // LandscapeLeft
        //: if(t.a == -1.0 && t.b == 0 && t.c == 0 && t.d == -1.0)
        if(t.a == -1.0 && t.b == 0 && t.c == 0 && t.d == -1.0)
        {
            //: isPortrait = NO;
            isPortrait = NO;
        }
    }
    //: return isPortrait;
    return isPortrait;
}

//: @end
@end