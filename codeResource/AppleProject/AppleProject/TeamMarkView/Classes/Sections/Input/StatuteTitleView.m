
#import <Foundation/Foundation.h>

NSString *StringFromImmuneAttractiveData(Byte *data);


//: icon_reply_close
Byte str_compriseValue[] = {72, 16, 11, 237, 73, 243, 236, 193, 7, 46, 71, 101, 115, 111, 108, 99, 95, 121, 108, 112, 101, 114, 95, 110, 111, 99, 105, 133};

// __DEBUG__
// __CLOSE_PRINT__
//
//  StatuteTitleView.m
// Indicator
//
//  Created by He on 2020/4/3.
//  Copyright © 2020 NetEase. All rights reserved.
//

// __M_A_C_R_O__
//: #import "AAAReplyContentView.h"
#import "StatuteTitleView.h"
//: #import "UIViewNimKit.h"
#import "UIViewNimKit.h"
//: #import "UIColor+AppleProjectKit.h"
#import "UIColor+Indicator.h"
//: #import "UIImage+AppleProjectKit.h"
#import "UIImage+Indicator.h"

//: @interface AAAReplyContentView ()
@interface StatuteTitleView ()

//: @end
@end

//: @implementation AAAReplyContentView
@implementation StatuteTitleView

//: - (instancetype)initWithFrame:(CGRect)frame
- (instancetype)initWithFrame:(CGRect)frame
{
    //: self = [super initWithFrame:frame];
    self = [super initWithFrame:frame];
    //: if (self)
    if (self)
    {
        //: _label = [[M80AttributedLabel alloc] init];
        _label = [[MessageEnableTextView alloc] init];
        //: _label.numberOfLines = 1;
        _label.numberOfLines = 1;
        //: _label.textAlignment = kCTTextAlignmentLeft;
        _label.textAlignment = kCTTextAlignmentLeft;
        //: _label.lineBreakMode = kCTLineBreakByTruncatingTail;
        _label.lineBreakMode = kCTLineBreakByTruncatingTail;
        //: _label.font = [UIFont systemFontOfSize:12];
        _label.font = [UIFont systemFontOfSize:12];
        //: _label.textColor = [UIColor colorWithHex:0xBFBFBF alpha:1];
        _label.textColor = [UIColor heatherMixtureWithAlpha:0xBFBFBF to:1];
        //: [self addSubview:_label];
        [self addSubview:_label];

        //: _closeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _closeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        //: [_closeButton setImage:[UIImage imageNamed:@"icon_reply_close"]
        [_closeButton setImage:[UIImage imageNamed:StringFromImmuneAttractiveData(str_compriseValue)]
                      //: forState:UIControlStateNormal];
                      forState:UIControlStateNormal];
        //: [_closeButton addTarget:self action:@selector(onClicked:) forControlEvents:UIControlEventTouchUpInside];
        [_closeButton addTarget:self action:@selector(paring:) forControlEvents:UIControlEventTouchUpInside];
        //: [self addSubview:_closeButton];
        [self addSubview:_closeButton];

        //: _divider = [[UIView alloc] init];
        _divider = [[UIView alloc] init];
        //: _divider.backgroundColor = [UIColor colorWithHex:0xBFBFBF alpha:1];
        _divider.backgroundColor = [UIColor heatherMixtureWithAlpha:0xBFBFBF to:1];
        //: _divider.nim_width = 1;
        _divider.nim_width = 1;
        //: [self addSubview:_divider];
        [self addSubview:_divider];
    }
    //: return self;
    return self;
}

//: - (void)layoutSubviews
- (void)layoutSubviews
{
    //: [super layoutSubviews];
    [super layoutSubviews];
    //: self.closeButton.nim_size = CGSizeMake(self.nim_height, self.nim_height);
    self.closeButton.nim_size = CGSizeMake(self.nim_height, self.nim_height);

    //: self.divider.nim_left = self.closeButton.nim_right + 2;
    self.divider.nim_left = self.closeButton.nim_right + 2;

    //: self.label.nim_height = self.label.intrinsicContentSize.height + 5;
    self.label.nim_height = self.label.intrinsicContentSize.height + 5;
    //: self.label.nim_width = self.nim_width - self.closeButton.nim_right;
    self.label.nim_width = self.nim_width - self.closeButton.nim_right;
    //: self.label.nim_left = self.divider.nim_right + 2;
    self.label.nim_left = self.divider.nim_right + 2;
    //: self.label.nim_centerY = self.nim_height * 0.5;
    self.label.nim_centerY = self.nim_height * 0.5;

    //: self.divider.nim_height = self.label.nim_height;
    self.divider.nim_height = self.label.nim_height;
    //: self.divider.nim_centerY = self.nim_height * .5f;
    self.divider.nim_centerY = self.nim_height * .5f;
}

//: - (void)dismiss
- (void)inscription
{
    //: [self.closeButton sendActionsForControlEvents:UIControlEventTouchUpInside];
    [self.closeButton sendActionsForControlEvents:UIControlEventTouchUpInside];
}

//: - (void)onClicked:(id)sender
- (void)paring:(id)sender
{
    //: self.hidden = YES;
    self.hidden = YES;
    //: if ([self.delegate respondsToSelector:@selector(onClearReplyContent:)])
    if ([self.delegate respondsToSelector:@selector(replied:)])
    {
        //: [self.delegate onClearReplyContent:sender];
        [self.delegate replied:sender];
    }
}

//: @end
@end

Byte * ImmuneAttractiveDataToCache(Byte *data) {
    int insectEsthetic = data[0];
    int scheduleRover = data[1];
    int incomplete = data[2];
    if (!insectEsthetic) return data + incomplete;
    for (int i = 0; i < scheduleRover / 2; i++) {
        int begin = incomplete + i;
        int end = incomplete + scheduleRover - i - 1;
        Byte temp = data[begin];
        data[begin] = data[end];
        data[end] = temp;
    }
    data[0] = 0;
    data[incomplete + scheduleRover] = 0;
    return data + incomplete;
}

NSString *StringFromImmuneAttractiveData(Byte *data) {
    return [NSString stringWithUTF8String:(char *)ImmuneAttractiveDataToCache(data)];
}  
