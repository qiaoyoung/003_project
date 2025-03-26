// __DEBUG__
// __CLOSE_PRINT__
//
//  ViewAggregationHeliogramSittingControl.m
// Indicator
//
//  Created by chris.
//  Copyright (c) 2015年 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import "CCCSessionMessageContentView.h"
#import "ViewAggregationHeliogramSittingControl.h"
//: #import "BBBMessageModel.h"
#import "AccumulationCenter.h"
//: #import "UIImage+AppleProjectKit.h"
#import "UIImage+Indicator.h"
//: #import "UIViewNimKit.h"
#import "UIViewNimKit.h"
//: #import "AppleProjectKit.h"
#import "Indicator.h"

//: @interface CCCSessionMessageContentView()
@interface ViewAggregationHeliogramSittingControl()

//: @end
@end

//: @implementation CCCSessionMessageContentView
@implementation ViewAggregationHeliogramSittingControl

//: - (instancetype)initSessionMessageContentView
- (instancetype)initMessageOpen
{
    //: CGSize defaultBubbleSize = CGSizeMake(60, 35);
    CGSize defaultBubbleSize = CGSizeMake(60, 35);
    //: if (self = [self initWithFrame:CGRectMake(0, 0, defaultBubbleSize.width, defaultBubbleSize.height)]) {
    if (self = [self initWithFrame:CGRectMake(0, 0, defaultBubbleSize.width, defaultBubbleSize.height)]) {

        //: [self addTarget:self action:@selector(onTouchDown:) forControlEvents:UIControlEventTouchDown];
        [self addTarget:self action:@selector(pyeDog:) forControlEvents:UIControlEventTouchDown];
        //: [self addTarget:self action:@selector(onTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
        [self addTarget:self action:@selector(priceTag:) forControlEvents:UIControlEventTouchUpInside];
        //: [self addTarget:self action:@selector(onTouchUpOutside:) forControlEvents:UIControlEventTouchUpOutside];
        [self addTarget:self action:@selector(shoulds:) forControlEvents:UIControlEventTouchUpOutside];
        //: _bubbleImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0,0,defaultBubbleSize.width,defaultBubbleSize.height)];
        _bubbleImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0,0,defaultBubbleSize.width,defaultBubbleSize.height)];
        //: _bubbleImageView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        _bubbleImageView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        //: _bubbleImageView.hidden = YES;
        _bubbleImageView.hidden = YES;
        //: [self addSubview:_bubbleImageView];
        [self addSubview:_bubbleImageView];
    }
    //: return self;
    return self;
}

//: - (void)refresh:(BBBMessageModel*)data
- (void)video:(AccumulationCenter*)data
{
    //: _model = data;
    _model = data;
    //: [_bubbleImageView setImage:[self chatBubbleImageForState:UIControlStateNormal
    [_bubbleImageView setImage:[self administrator:UIControlStateNormal
                                                    //: outgoing:data.message.isOutgoingMsg]];
                                                    language:data.message.isOutgoingMsg]];
    //: [_bubbleImageView setHighlightedImage:[self chatBubbleImageForState:UIControlStateHighlighted
    [_bubbleImageView setHighlightedImage:[self administrator:UIControlStateHighlighted
                                                               //: outgoing:data.message.isOutgoingMsg]];
                                                               language:data.message.isOutgoingMsg]];
}


//: - (void)layoutSubviews{
- (void)layoutSubviews{
    //: [super layoutSubviews];
    [super layoutSubviews];
    //: _bubbleImageView.frame = self.bounds;
    _bubbleImageView.frame = self.bounds;
}


//: - (void)updateProgress:(float)progress
- (void)bottomSub:(float)progress
{

}

//: - (void)onTouchDown:(id)sender
- (void)pyeDog:(id)sender
{

}

//: - (void)onTouchUpInside:(id)sender
- (void)priceTag:(id)sender
{

}

//: - (void)onTouchUpOutside:(id)sender{
- (void)shoulds:(id)sender{

}


//: #pragma mark - Private
#pragma mark - Private
//: - (UIImage *)chatBubbleImageForState:(UIControlState)state outgoing:(BOOL)outgoing
- (UIImage *)administrator:(UIControlState)state language:(BOOL)outgoing
{

    //: CCCKitSetting *setting = [[AppleProjectKit sharedKit].config setting:self.model.message];
    CenterShould *setting = [[Indicator reach].config info:self.model.message];
    //: if (state == UIControlStateNormal)
    if (state == UIControlStateNormal)
    {
        //: return setting.normalBackgroundImage;
        return setting.normalBackgroundImage;
    }
    //: else
    else
    {
        //: return setting.highLightBackgroundImage;
        return setting.highLightBackgroundImage;
    }
}


//: - (void)setHighlighted:(BOOL)highlighted{
- (void)setHighlighted:(BOOL)highlighted{
    //: [super setHighlighted:highlighted];
    [super setHighlighted:highlighted];
    //: _bubbleImageView.highlighted = highlighted;
    _bubbleImageView.highlighted = highlighted;
}

//: @end
@end