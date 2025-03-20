// __DEBUG__
// __CLOSE_PRINT__
//
//  NTESTimePickerView.m
//  NIM
//
//  Created by chris on 15/7/1.
//  Copyright (c) 2015年 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import "BBBTimePickerView.h"
#import "AddTitleView.h"
//: #import "UIViewNimKit.h"
#import "UIViewNimKit.h"
//: #import "CCCGlobalMacro.h"
#import "CCCGlobalMacro.h"

//: @interface BBBTimePickerView()<UIPickerViewDelegate,UIPickerViewDataSource>
@interface AddTitleView()<UIPickerViewDelegate,UIPickerViewDataSource>

//: @property (nonatomic,strong) UIButton *bkgBtn;
@property (nonatomic,strong) UIButton *bkgBtn;

//: @property (nonatomic,strong) UIPickerView *pickerView;
@property (nonatomic,strong) UIPickerView *pickerView;

//: @property (nonatomic,copy) CompletionHandler handler;
@property (nonatomic,copy) CompletionHandler handler;

//: @end
@end

//: @implementation BBBTimePickerView
@implementation AddTitleView

//: - (instancetype)initWithFrame:(CGRect)frame{
- (instancetype)initWithFrame:(CGRect)frame{
    //: self = [super initWithFrame:frame];
    self = [super initWithFrame:frame];
    //: if (self) {
    if (self) {
        //: self.backgroundColor = [UIColor colorWithRed:((float)((0x0 & 0xFF0000) >> 16))/255.0 green:((float)((0x0 & 0x00FF00) >> 8))/255.0 blue:((float)(0x0 & 0x0000FF))/255.0 alpha:.5f];
        self.backgroundColor = [UIColor colorWithRed:((float)((0x0 & 0xFF0000) >> 16))/255.0 green:((float)((0x0 & 0x00FF00) >> 8))/255.0 blue:((float)(0x0 & 0x0000FF))/255.0 alpha:.5f];
        //: self.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        self.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        //: _bkgBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        _bkgBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        //: [_bkgBtn addTarget:self action:@selector(onActionTouchBkgBtn:) forControlEvents:UIControlEventTouchUpInside];
        [_bkgBtn addTarget:self action:@selector(possibilitying:) forControlEvents:UIControlEventTouchUpInside];
        //: _bkgBtn.frame = self.bounds;
        _bkgBtn.frame = self.bounds;
        //: _bkgBtn.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        _bkgBtn.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        //: [self addSubview:_bkgBtn];
        [self addSubview:_bkgBtn];
        //: _pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, 250)];
        _pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, 250)];
        //: _pickerView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        _pickerView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        //: _pickerView.backgroundColor = [UIColor whiteColor];
        _pickerView.backgroundColor = [UIColor whiteColor];
        //: _pickerView.delegate = self;
        _pickerView.delegate = self;
        //: _pickerView.dataSource = self;
        _pickerView.dataSource = self;
        //: [self addSubview:_pickerView];
        [self addSubview:_pickerView];
    }
    //: return self;
    return self;
}


//: - (void)refreshWithHour:(NSInteger)hour minute:(NSInteger)minute{
- (void)selected:(NSInteger)hour managerDisable:(NSInteger)minute{
    //: [self.pickerView selectRow:hour inComponent:0 animated:YES];
    [self.pickerView selectRow:hour inComponent:0 animated:YES];
    //: [self.pickerView selectRow:minute inComponent:2 animated:YES];
    [self.pickerView selectRow:minute inComponent:2 animated:YES];
}

//: - (void)onActionTouchBkgBtn:(id)sender{
- (void)possibilitying:(id)sender{
    //: NSInteger hour = [self.pickerView selectedRowInComponent:0];
    NSInteger hour = [self.pickerView selectedRowInComponent:0];
    //: NSInteger minute = [self.pickerView selectedRowInComponent:2];
    NSInteger minute = [self.pickerView selectedRowInComponent:2];
    //: if ([self.delegate respondsToSelector:@selector(didSelectHour:minute:)]) {
    if ([self.delegate respondsToSelector:@selector(blue:rangeTotalerval:)]) {
        //: [self.delegate didSelectHour:hour minute:minute];
        [self.delegate blue:hour rangeTotalerval:minute];
    }
    //: if (self.handler) {
    if (self.handler) {
        //: self.handler(hour,minute);
        self.handler(hour,minute);
    }
    //: [self removeFromSuperview];
    [self removeFromSuperview];
}


//: - (void)showInView:(UIView *)view onCompletion:(CompletionHandler) handler
- (void)userLineCompletion:(UIView *)view message:(CompletionHandler) handler
{
    //: self.frame = view.bounds;
    self.frame = view.bounds;
    //: [view addSubview:self];
    [view addSubview:self];
    //: self.handler = handler;
    self.handler = handler;
}


//: - (void)layoutSubviews{
- (void)layoutSubviews{
    //: [super layoutSubviews];
    [super layoutSubviews];
    //: self.pickerView.nim_bottom = self.nim_height;
    self.pickerView.nim_bottom = self.nim_height;
    //: self.nim_centerX = self.nim_width * .5f;
    self.nim_centerX = self.nim_width * .5f;
}

//: #pragma mark - UIPickerViewDelegate
#pragma mark - UIPickerViewDelegate
//: - (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component{
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component{
    //: CGFloat alpha = 0.0f;
    CGFloat alpha = 0.0f;
    //: switch (component) {
    switch (component) {
        //: case 0:
        case 0:
            //: alpha = .2f;
            alpha = .2f;
            //: break;
            break;
        //: case 1:
        case 1:
            //: alpha = .12f;
            alpha = .12f;
            //: break;
            break;
        //: case 2:
        case 2:
            //: alpha = .2f;
            alpha = .2f;
            //: break;
            break;
        //: case 3:
        case 3:
            //: alpha = .12f;
            alpha = .12f;
            //: break;
            break;
        //: default:
        default:
            //: break;
            break;
    }
    //: return pickerView.nim_width * alpha;
    return pickerView.nim_width * alpha;
}

//: - (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    //: switch (component) {
    switch (component) {
        //: case 0: 
        case 0: //小时
            //: return [NSString stringWithFormat:@"%02zd",row];
            return [NSString stringWithFormat:@"%02zd",row];
        //: case 1: 
        case 1: //小时说明文字
            //: return @"时".nim_localized;
            return @"时".trapLocalized;
        //: case 2:
        case 2:
            //: return [NSString stringWithFormat:@"%02zd",row];
            return [NSString stringWithFormat:@"%02zd",row];
        //: case 3:
        case 3:
            //: return @"分".nim_localized;
            return @"分".trapLocalized;
        //: default:
        default:
            //: return @"";
            return @"";
    }

}

//: #pragma mark - UIPickerViewDataSource
#pragma mark - UIPickerViewDataSource
//: - (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    //: return 4;
    return 4;
}

//: - (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    //: switch (component) {
    switch (component) {
        //: case 0:
        case 0:
            //: return 24;
            return 24;//小时
        //: case 1:
        case 1:
            //: return 1; 
            return 1; //小时说明文字
        //: case 2:
        case 2:
            //: return 60;
            return 60;//分钟
        //: case 3:
        case 3:
            //: return 1; 
            return 1; //分钟说明文字
        //: default:
        default:
            //: return 0;
            return 0;
    }
}

//: @end
@end