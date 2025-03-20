// __DEBUG__
// __CLOSE_PRINT__
//
//  MigrateView.m
//  NIM
//
//  Created by Sampson on 2018/12/11.
//  Copyright © 2018 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import "NTESMigrateProgressView.h"
#import "MigrateView.h"

//: @interface NTESMigrateProgressView ()
@interface MigrateView ()

//: @property (nonatomic, strong) UILabel *tipLabel;
@property (nonatomic, strong) UILabel *tipLabel;
//: @property (nonatomic, strong) UIProgressView *progressView;
@property (nonatomic, strong) UIProgressView *progressView;
//: @property (nonatomic, strong) UILabel *progressLabel;
@property (nonatomic, strong) UILabel *progressLabel;

//: @end
@end

//: @implementation NTESMigrateProgressView
@implementation MigrateView

//: - (instancetype)initWithFrame:(CGRect)frame {
- (instancetype)initWithFrame:(CGRect)frame {
    //: if (self = [super initWithFrame:frame]) {
    if (self = [super initWithFrame:frame]) {
        //: self.backgroundColor = [UIColor colorWithWhite:0.3 alpha:1];
        self.backgroundColor = [UIColor colorWithWhite:0.3 alpha:1];

        //: UIColor *tintColor = [UIColor whiteColor];
        UIColor *tintColor = [UIColor whiteColor];

        //: UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
        //: label.textColor = tintColor;
        label.textColor = tintColor;
        //: label.textAlignment = NSTextAlignmentCenter;
        label.textAlignment = NSTextAlignmentCenter;
        //: [self addSubview:label];
        [self addSubview:label];
        //: _tipLabel = label;
        _tipLabel = label;

        //: label = [[UILabel alloc] initWithFrame:CGRectZero];
        label = [[UILabel alloc] initWithFrame:CGRectZero];
        //: label.text = @"0%";
        label.text = @"0%";
        //: label.textColor = tintColor;
        label.textColor = tintColor;
        //: label.textAlignment = NSTextAlignmentRight;
        label.textAlignment = NSTextAlignmentRight;
        //: [self addSubview:label];
        [self addSubview:label];
        //: self.progressLabel = label;
        self.progressLabel = label;

        //: UIProgressView *progress = [[UIProgressView alloc] initWithFrame:CGRectZero];
        UIProgressView *progress = [[UIProgressView alloc] initWithFrame:CGRectZero];
        //: [self addSubview:progress];
        [self addSubview:progress];
        //: _progressView = progress;
        _progressView = progress;

        //: UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        //: [button setTitleColor:tintColor forState:UIControlStateNormal];
        [button setTitleColor:tintColor forState:UIControlStateNormal];
        //: [button setTitle:@"  X  " forState:UIControlStateNormal];
        [button setTitle:@"  X  " forState:UIControlStateNormal];
        //: button.titleLabel.font = [UIFont systemFontOfSize:24];
        button.titleLabel.font = [UIFont systemFontOfSize:24];
        //: button.frame = CGRectMake(0, 0, 40, 40);
        button.frame = CGRectMake(0, 0, 40, 40);
        //: [self addSubview:button];
        [self addSubview:button];
        //: _stopButton = button;
        _stopButton = button;
    }
    //: return self;
    return self;
}

//: - (void)layoutSubviews {
- (void)layoutSubviews {
    //: [super layoutSubviews];
    [super layoutSubviews];

    //: const CGRect bounds = self.bounds;
    const CGRect bounds = self.bounds;
    //: CGFloat y = CGRectGetHeight(bounds) * 0.4;
    CGFloat y = CGRectGetHeight(bounds) * 0.4;
    //: self.tipLabel.frame = CGRectMake(10, y, CGRectGetWidth(bounds) - 20, 30);
    self.tipLabel.frame = CGRectMake(10, y, CGRectGetWidth(bounds) - 20, 30);

    //: y += 60;
    y += 60;
    //: self.stopButton.center = CGPointMake(CGRectGetMaxX(bounds) - 40, y);
    self.stopButton.center = CGPointMake(CGRectGetMaxX(bounds) - 40, y);

    //: CGFloat x = CGRectGetMinX(self.stopButton.frame) - 56;
    CGFloat x = CGRectGetMinX(self.stopButton.frame) - 56;
    //: self.progressLabel.frame = CGRectMake(x, y - 15, 50, 28);
    self.progressLabel.frame = CGRectMake(x, y - 15, 50, 28);

    //: x = 30;
    x = 30;
    //: self.progressView.frame = CGRectMake(x, y, CGRectGetMinX(self.progressLabel.frame) - 28, 30);
    self.progressView.frame = CGRectMake(x, y, CGRectGetMinX(self.progressLabel.frame) - 28, 30);
}

//: - (void)setProgress:(float)progress {
- (void)setProgress:(float)progress {
    //: _progress = progress;
    _progress = progress;
    //: self.progressView.progress = progress;
    self.progressView.progress = progress;

    //: NSString *progressText = [NSString stringWithFormat:@"%zd%%", @(progress * 100).integerValue];
    NSString *progressText = [NSString stringWithFormat:@"%zd%%", @(progress * 100).integerValue];
    //: self.progressLabel.text = progressText;
    self.progressLabel.text = progressText;
}

//: - (void)setTip:(NSString *)tip {
- (void)setTip:(NSString *)tip {
    //: _tip = [tip copy];
    _tip = [tip copy];
    //: self.tipLabel.text = tip;
    self.tipLabel.text = tip;
}

//: @end
@end