// __DEBUG__
// __CLOSE_PRINT__
//
//  ShouldContentView.h
//  NIM
//
//  Created by ios on 13-11-9.
//  Copyright (c) 2013年 Netease. All rights reserved.
//
//: #pragma mark - LoadProgressView
#pragma mark - LoadProgressView

// __M_A_C_R_O__
//: #import <UIKit/UIKit.h>
#import <UIKit/UIKit.h>
//: #import "UCZProgressView.h"
#import "UCZProgressView.h"

//: @interface BBBLoadProgressView : UIView {
@interface ShouldContentView : UIView {
    //: UIImageView *_maskView;
    UIImageView *_maskView;
    //: UILabel *_progressLabel;
    UILabel *_progressLabel;
    //: UIActivityIndicatorView *_activity;
    UIActivityIndicatorView *_activity;
}

//: @property (nonatomic, strong) UCZProgressView *progressView;
@property (nonatomic, strong) UCZProgressView *progressView;
//: @property (nonatomic, assign)CGFloat maxProgress;
@property (nonatomic, assign)CGFloat maxProgress;

//: - (void)setProgress:(CGFloat)progress;
- (void)setValueProgress:(CGFloat)progress;

//: @end
@end