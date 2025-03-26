// __DEBUG__
// __CLOSE_PRINT__
//
//  StarlightView.h
//  NIM
//
//  Created by Genning-Work on 2019/10/25.
//  Copyright © 2019 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import <UIKit/UIKit.h>
#import <UIKit/UIKit.h>

//: NS_ASSUME_NONNULL_BEGIN
NS_ASSUME_NONNULL_BEGIN

//: @interface NTESAVPlayerView : UIView
@interface StarlightView : UIView

//: @property (nonatomic, strong) AVPlayer* player;
@property (nonatomic, strong) AVPlayer* player;

//: - (void)setPlayer:(nullable AVPlayer*)player;
- (void)setPlayer:(nullable AVPlayer*)player;
//: - (void)setVideoFillMode:(NSString *)fillMode;
- (void)setViewTitle:(NSString *)fillMode;

//: @end
@end

//: NS_ASSUME_NONNULL_END
NS_ASSUME_NONNULL_END