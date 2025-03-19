//
//  CustomGifView.m
//  NIM
//
//  Created by Yan Wang on 2024/8/10.
//  Copyright © 2024 Netease. All rights reserved.
//

#import "CustomGifView.h"
#import <FLAnimatedImage/FLAnimatedImageView.h>
#import <FLAnimatedImage/FLAnimatedImage.h>

@implementation CustomGifView{
    FLAnimatedImageView *_gifImageView;
}

- (instancetype)initWithGifData:(NSData *)gifData {
    self = [super init];
    if (self) {
        [self setupViewWithGifData:gifData];
    }
    return self;
}

- (void)setupViewWithGifData:(NSData *)gifData {
    
    FLAnimatedImage *animatedImage = [FLAnimatedImage animatedImageWithGIFData:gifData];
    
    _gifImageView = [[FLAnimatedImageView alloc] init];
    _gifImageView.animatedImage = animatedImage;
    _gifImageView.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:_gifImageView];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    _gifImageView.frame = self.bounds;
}


@end
