// __DEBUG__
// __CLOSE_PRINT__
//
//  DittyBagView.m
// Indicator
//
//  Created by chris on 2017/11/1.
//  Copyright © 2017年 NetEase. All rights reserved.
//

// __M_A_C_R_O__
//: #import "BBBKitTitleView.h"
#import "DittyBagView.h"
//: #import "UIViewNimKit.h"
#import "UIViewNimKit.h"

//: @implementation BBBKitTitleView
@implementation DittyBagView

//: - (instancetype)initWithFrame:(CGRect)frame
- (instancetype)initWithFrame:(CGRect)frame
{
    //: self = [super initWithFrame:frame];
    self = [super initWithFrame:frame];
    //: if (self)
    if (self)
    {
        //: _titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        //: _titleLabel.font = [UIFont boldSystemFontOfSize:16.f];
        _titleLabel.font = [UIFont boldSystemFontOfSize:16.f];
        //: _titleLabel.lineBreakMode = NSLineBreakByTruncatingMiddle;
        _titleLabel.lineBreakMode = NSLineBreakByTruncatingMiddle;
        //: _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        //: _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.textColor = [UIColor whiteColor];

        //: _subtitleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _subtitleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        //: _subtitleLabel.textColor = [UIColor grayColor];
        _subtitleLabel.textColor = [UIColor grayColor];
        //: _subtitleLabel.font = [UIFont systemFontOfSize:12.f];
        _subtitleLabel.font = [UIFont systemFontOfSize:12.f];
        //: _subtitleLabel.lineBreakMode = NSLineBreakByTruncatingMiddle;
        _subtitleLabel.lineBreakMode = NSLineBreakByTruncatingMiddle;
        //: _subtitleLabel.textAlignment = NSTextAlignmentCenter;
        _subtitleLabel.textAlignment = NSTextAlignmentCenter;

        //: [self addSubview:_titleLabel];
        [self addSubview:_titleLabel];
        //: [self addSubview:_subtitleLabel];
        [self addSubview:_subtitleLabel];
    }
    //: return self;
    return self;
}

//: - (CGSize)sizeThatFits:(CGSize)size
- (CGSize)sizeThatFits:(CGSize)size
{
    //: CGFloat margin = 80.f;
    CGFloat margin = 80.f;
    //: CGFloat maxWidth = [UIScreen mainScreen].bounds.size.width - margin * 2;
    CGFloat maxWidth = [UIScreen mainScreen].bounds.size.width - margin * 2;

    //: [self.titleLabel sizeToFit];
    [self.titleLabel sizeToFit];
    //: self.titleLabel.nim_width = ((self.titleLabel.nim_width) < (maxWidth) ? (self.titleLabel.nim_width) : (maxWidth));
    self.titleLabel.nim_width = ((self.titleLabel.nim_width) < (maxWidth) ? (self.titleLabel.nim_width) : (maxWidth));

    //: [self.subtitleLabel sizeToFit];
    [self.subtitleLabel sizeToFit];
    //: self.subtitleLabel.nim_width = ((self.subtitleLabel.nim_width) < (maxWidth) ? (self.subtitleLabel.nim_width) : (maxWidth));
    self.subtitleLabel.nim_width = ((self.subtitleLabel.nim_width) < (maxWidth) ? (self.subtitleLabel.nim_width) : (maxWidth));

    //: CGFloat width = ((self.titleLabel.nim_width) > (self.subtitleLabel.nim_width) ? (self.titleLabel.nim_width) : (self.subtitleLabel.nim_width));
    CGFloat width = ((self.titleLabel.nim_width) > (self.subtitleLabel.nim_width) ? (self.titleLabel.nim_width) : (self.subtitleLabel.nim_width));
    //: return CGSizeMake(width, self.titleLabel.nim_height + self.subtitleLabel.nim_height);
    return CGSizeMake(width, self.titleLabel.nim_height + self.subtitleLabel.nim_height);
}

//: - (void)layoutSubviews
- (void)layoutSubviews
{
    //: [super layoutSubviews];
    [super layoutSubviews];
    //: self.titleLabel.nim_centerX = self.nim_width * .5f;
    self.titleLabel.nim_centerX = self.nim_width * .5f;
    //: self.subtitleLabel.nim_centerX = self.nim_width * .5f;
    self.subtitleLabel.nim_centerX = self.nim_width * .5f;
    //: self.subtitleLabel.nim_bottom = self.nim_height;
    self.subtitleLabel.nim_bottom = self.nim_height;
}

//: @end
@end