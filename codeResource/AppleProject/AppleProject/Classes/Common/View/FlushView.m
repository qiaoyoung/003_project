// __DEBUG__
// __CLOSE_PRINT__
//
//  FlushView.m
//  NIM
//
//  Created by Yan Wang on 2024/8/10.
//  Copyright © 2024 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import "CustomGifView.h"
#import "FlushView.h"
//: #import <FLAnimatedImage/FLAnimatedImageView.h>
#import <FLAnimatedImage/FLAnimatedImageView.h>
//: #import <FLAnimatedImage/FLAnimatedImage.h>
#import <FLAnimatedImage/FLAnimatedImage.h>

//: @implementation CustomGifView{
@implementation FlushView{
    //: FLAnimatedImageView *_gifImageView;
    FLAnimatedImageView *_gifImageView;
}

//: - (instancetype)initWithGifData:(NSData *)gifData {
- (instancetype)initWithInfoSmartSecret:(NSData *)gifData {
    //: self = [super init];
    self = [super init];
    //: if (self) {
    if (self) {
        //: [self setupViewWithGifData:gifData];
        [self quickTable:gifData];
    }
    //: return self;
    return self;
}

//: - (void)setupViewWithGifData:(NSData *)gifData {
- (void)quickTable:(NSData *)gifData {

    //: FLAnimatedImage *animatedImage = [FLAnimatedImage animatedImageWithGIFData:gifData];
    FLAnimatedImage *animatedImage = [FLAnimatedImage animatedImageWithGIFData:gifData];

    //: _gifImageView = [[FLAnimatedImageView alloc] init];
    _gifImageView = [[FLAnimatedImageView alloc] init];
    //: _gifImageView.animatedImage = animatedImage;
    _gifImageView.animatedImage = animatedImage;
    //: _gifImageView.contentMode = UIViewContentModeScaleAspectFit;
    _gifImageView.contentMode = UIViewContentModeScaleAspectFit;
    //: [self addSubview:_gifImageView];
    [self addSubview:_gifImageView];
}

//: - (void)layoutSubviews {
- (void)layoutSubviews {
    //: [super layoutSubviews];
    [super layoutSubviews];
    //: _gifImageView.frame = self.bounds;
    _gifImageView.frame = self.bounds;
}


//: @end
@end