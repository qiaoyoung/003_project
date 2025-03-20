// __DEBUG__
// __CLOSE_PRINT__
//
//  CutView.m
//  NIM
//
//  Created by Sampson on 2018/12/11.
//  Copyright © 2018 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import "NTESMigrateCompleteView.h"
#import "CutView.h"

//: @interface NTESMigrateCompleteView ()
@interface CutView ()

//: @property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *titleLabel;
//: @property (nonatomic, strong) UILabel *messageLabel;
@property (nonatomic, strong) UILabel *messageLabel;

//: @end
@end

//: @implementation NTESMigrateCompleteView
@implementation CutView

//: - (instancetype)initWithFrame:(CGRect)frame {
- (instancetype)initWithFrame:(CGRect)frame {
    //: if (self = [super initWithFrame:frame]) {
    if (self = [super initWithFrame:frame]) {
        //: self.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1];
        self.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1];

        //: UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
        //: label.font = [UIFont systemFontOfSize:20];
        label.font = [UIFont systemFontOfSize:20];
        //: label.textAlignment = NSTextAlignmentCenter;
        label.textAlignment = NSTextAlignmentCenter;
        //: [self addSubview:label];
        [self addSubview:label];
        //: self.titleLabel = label;
        self.titleLabel = label;

        //: label = [[UILabel alloc] initWithFrame:CGRectZero];
        label = [[UILabel alloc] initWithFrame:CGRectZero];
        //: label.textAlignment = NSTextAlignmentCenter;
        label.textAlignment = NSTextAlignmentCenter;
        //: label.minimumScaleFactor = 0.6;
        label.minimumScaleFactor = 0.6;
        //: [self addSubview:label];
        [self addSubview:label];
        //: self.messageLabel = label;
        self.messageLabel = label;

        //: UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        //: [self addSubview:button];
        [self addSubview:button];
        //: self.actionButton = button;
        self.actionButton = button;
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

    //: CGFloat y = CGRectGetMidY(bounds) - 80;
    CGFloat y = CGRectGetMidY(bounds) - 80;
    //: CGFloat x = 12;
    CGFloat x = 12;
    //: CGFloat width = CGRectGetWidth(bounds) - x * 2;
    CGFloat width = CGRectGetWidth(bounds) - x * 2;
    //: self.titleLabel.frame = CGRectMake(x, y, width, 40);
    self.titleLabel.frame = CGRectMake(x, y, width, 40);

    //: y += 40;
    y += 40;
    //: self.messageLabel.frame = CGRectMake(x, y, width, 30);
    self.messageLabel.frame = CGRectMake(x, y, width, 30);

    //: y += 60;
    y += 60;
    //: self.actionButton.frame = CGRectMake(x, y, width, 44);
    self.actionButton.frame = CGRectMake(x, y, width, 44);
}

//: - (void)setTitle:(NSString *)title {
- (void)setTitle:(NSString *)title {
    //: _title = [title copy];
    _title = [title copy];
    //: self.titleLabel.text = title;
    self.titleLabel.text = title;
}

//: - (void)setMessage:(NSString *)message {
- (void)setMessage:(NSString *)message {
    //: _message = [message copy];
    _message = [message copy];
    //: self.messageLabel.text = message;
    self.messageLabel.text = message;
}

//: @end
@end