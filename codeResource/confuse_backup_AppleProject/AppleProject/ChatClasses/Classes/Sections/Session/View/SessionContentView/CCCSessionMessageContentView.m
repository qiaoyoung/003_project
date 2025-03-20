//
//  CCCSessionMessageContentView.m
// AppleProjectKit
//
//  Created by chris.
//  Copyright (c) 2015年 Netease. All rights reserved.
//

#import "CCCSessionMessageContentView.h"
#import "BBBMessageModel.h"
#import "UIImage+AppleProjectKit.h"
#import "UIViewNimKit.h"
#import "AppleProjectKit.h"

@interface CCCSessionMessageContentView()

@end

@implementation CCCSessionMessageContentView

- (instancetype)initSessionMessageContentView
{
    CGSize defaultBubbleSize = CGSizeMake(60, 35);
    if (self = [self initWithFrame:CGRectMake(0, 0, defaultBubbleSize.width, defaultBubbleSize.height)]) {
        
        [self addTarget:self action:@selector(onTouchDown:) forControlEvents:UIControlEventTouchDown];
        [self addTarget:self action:@selector(onTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
        [self addTarget:self action:@selector(onTouchUpOutside:) forControlEvents:UIControlEventTouchUpOutside];
        _bubbleImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0,0,defaultBubbleSize.width,defaultBubbleSize.height)];
        _bubbleImageView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        _bubbleImageView.hidden = YES;
        [self addSubview:_bubbleImageView];
    }
    return self;
}

- (void)refresh:(BBBMessageModel*)data
{
    _model = data;
    [_bubbleImageView setImage:[self chatBubbleImageForState:UIControlStateNormal
                                                    outgoing:data.message.isOutgoingMsg]];
    [_bubbleImageView setHighlightedImage:[self chatBubbleImageForState:UIControlStateHighlighted
                                                               outgoing:data.message.isOutgoingMsg]];
}


- (void)layoutSubviews{
    [super layoutSubviews];
    _bubbleImageView.frame = self.bounds;
}


- (void)updateProgress:(float)progress
{
    
}

- (void)onTouchDown:(id)sender
{
    
}

- (void)onTouchUpInside:(id)sender
{
    
}

- (void)onTouchUpOutside:(id)sender{
    
}


#pragma mark - Private
- (UIImage *)chatBubbleImageForState:(UIControlState)state outgoing:(BOOL)outgoing
{
    
    CCCKitSetting *setting = [[AppleProjectKit sharedKit].config setting:self.model.message];
    if (state == UIControlStateNormal)
    {
        return setting.normalBackgroundImage;
    }
    else
    {
        return setting.highLightBackgroundImage;
    }
}


- (void)setHighlighted:(BOOL)highlighted{
    [super setHighlighted:highlighted];
    _bubbleImageView.highlighted = highlighted;
}

@end
