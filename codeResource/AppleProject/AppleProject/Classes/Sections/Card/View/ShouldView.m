
#import <Foundation/Foundation.h>

NSString *StringFromSpectaclesData(Byte *data);        


//: YES
Byte str_viewMinValue[] = {59, 3, 61, 6, 25, 229, 28, 8, 22, 67};


//: #FF483D
Byte str_progressContent[] = {72, 7, 37, 10, 147, 141, 7, 54, 236, 15, 254, 33, 33, 15, 19, 14, 31, 172};


//: user_profile_avtivity_remove_friend
Byte str_needRecordContent[] = {82, 35, 86, 12, 64, 212, 55, 250, 30, 38, 104, 230, 31, 29, 15, 28, 9, 26, 28, 25, 16, 19, 22, 15, 9, 11, 32, 30, 19, 32, 19, 30, 35, 9, 28, 15, 23, 25, 32, 15, 9, 16, 28, 19, 15, 24, 14, 177};


//: report_next_select_delete
Byte str_recordData[] = {64, 25, 20, 4, 94, 81, 92, 91, 94, 96, 75, 90, 81, 100, 96, 75, 95, 81, 88, 81, 79, 96, 75, 80, 81, 88, 81, 96, 81, 86};


//: #333333
Byte str_showTextData[] = {57, 7, 78, 9, 89, 182, 108, 132, 147, 213, 229, 229, 229, 229, 229, 229, 144};


//: contact_tag_fragment_cancel
Byte str_questionCellForValue[] = {87, 27, 68, 8, 12, 101, 87, 166, 31, 43, 42, 48, 29, 31, 48, 27, 48, 29, 35, 27, 34, 46, 29, 35, 41, 33, 42, 48, 27, 31, 29, 42, 31, 33, 40, 58};


//: 666666
Byte str_bottomData[] = {21, 6, 52, 5, 103, 2, 2, 2, 2, 2, 2, 196};


//: delete
Byte str_pointTitleValue[] = {34, 6, 24, 10, 208, 234, 90, 242, 159, 44, 76, 77, 84, 77, 92, 77, 23};

// __DEBUG__
// __CLOSE_PRINT__
//
//  ShouldView.m
//  AppleProject
//
//  Created by Yan Wang on 2025/2/17.
//  Copyright © 2025 AppleProject. All rights reserved.
//

// __M_A_C_R_O__
//: #import "ZMONReportDeleteView.h"
#import "ShouldView.h"
//: #import "NTESBundleSetting.h"
#import "NameLine.h"

//: @interface ZMONReportDeleteView ()
@interface ShouldView ()

//: @property (nonatomic,strong) UIButton *sureBtn;
@property (nonatomic,strong) UIButton *sureBtn;
//: @property (nonatomic,strong) UIButton *closeBtn;
@property (nonatomic,strong) UIButton *closeBtn;
//: @property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UILabel *titleLabel;
//: @property (nonatomic,strong) UIView *box;
@property (nonatomic,strong) UIView *box;

//: @end
@end

//: @implementation ZMONReportDeleteView
@implementation ShouldView

//: - (instancetype)initWithFrame:(CGRect)frame
- (instancetype)initWithFrame:(CGRect)frame
{
    //: self = [super initWithFrame:frame];
    self = [super initWithFrame:frame];
    //: if (self) {
    if (self) {
        //: self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];

        //: [self initUI];
        [self initTowardTagUi];

    }
    //: return self;
    return self;
}


//: - (void)initUI{
- (void)initTowardTagUi{
    //: _box = [[UIView alloc]initWithFrame:CGRectMake(20, ([[UIScreen mainScreen] bounds].size.height-196)/2, [[UIScreen mainScreen] bounds].size.width-40, 196)];
    _box = [[UIView alloc]initWithFrame:CGRectMake(20, ([[UIScreen mainScreen] bounds].size.height-196)/2, [[UIScreen mainScreen] bounds].size.width-40, 196)];
    //: _box.backgroundColor = [UIColor whiteColor];
    _box.backgroundColor = [UIColor whiteColor];
    //: _box.layer.cornerRadius = 12;
    _box.layer.cornerRadius = 12;
    //: [self addSubview:_box];
    [self addSubview:_box];

    //: [_box addSubview:self.titleLabel];
    [_box addSubview:self.titleLabel];
    //: self.titleLabel.frame = CGRectMake(0, 20, [[UIScreen mainScreen] bounds].size.width-40, 20);
    self.titleLabel.frame = CGRectMake(0, 20, [[UIScreen mainScreen] bounds].size.width-40, 20);

    //: UILabel *labsubLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, self.titleLabel.bottom, [[UIScreen mainScreen] bounds].size.width-80, 50)];
    UILabel *labsubLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, self.titleLabel.bottom, [[UIScreen mainScreen] bounds].size.width-80, 50)];
    //: labsubLabel.font = [UIFont systemFontOfSize:12.f];
    labsubLabel.font = [UIFont systemFontOfSize:12.f];
    //: labsubLabel.textColor = [UIColor colorWithHexString:@"#333333"];
    labsubLabel.textColor = [UIColor direction:StringFromSpectaclesData(str_showTextData)];
    //: labsubLabel.numberOfLines = 0;
    labsubLabel.numberOfLines = 0;
    //: labsubLabel.text = [NTESLanguageManager getTextWithKey:@"report_next_select_delete"];
    labsubLabel.text = [MaxInformation off:StringFromSpectaclesData(str_recordData)];
    //: [_box addSubview:labsubLabel];
    [_box addSubview:labsubLabel];

    //: CGFloat width = ([[UIScreen mainScreen] bounds].size.width-100)/2;
    CGFloat width = ([[UIScreen mainScreen] bounds].size.width-100)/2;
    //: CGFloat height = 40;
    CGFloat height = 40;

    //: [_box addSubview:self.sureBtn];
    [_box addSubview:self.sureBtn];
    //: [_box addSubview:self.closeBtn];
    [_box addSubview:self.closeBtn];
    //: self.closeBtn.frame = CGRectMake(20, 196-height-20, width, height);
    self.closeBtn.frame = CGRectMake(20, 196-height-20, width, height);
    //: self.sureBtn.frame = CGRectMake(width+40, 196-height-20, width, height);
    self.sureBtn.frame = CGRectMake(width+40, 196-height-20, width, height);


}

//: - (void)handleDelete
- (void)touchWith
{
    //: [self animationClose];
    [self iconEnable];

    //: self.speiceBackBlock(@"YES");
    self.speiceBackBlock(StringFromSpectaclesData(str_viewMinValue));
}


//: #pragma mark -- Setter && Getter
#pragma mark -- Setter && Getter
//: - (UILabel *)titleLabel {
- (UILabel *)titleLabel {
    //: if (!_titleLabel) {
    if (!_titleLabel) {
        //: _titleLabel = [[UILabel alloc] init];
        _titleLabel = [[UILabel alloc] init];
        //: _titleLabel.font = [UIFont systemFontOfSize:16.f];
        _titleLabel.font = [UIFont systemFontOfSize:16.f];
        //: _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.textColor = [UIColor blackColor];
        //: _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        //: _titleLabel.text = [NTESLanguageManager getTextWithKey:@"user_profile_avtivity_remove_friend"];
        _titleLabel.text = [MaxInformation off:StringFromSpectaclesData(str_needRecordContent)];
    }
    //: return _titleLabel;
    return _titleLabel;
}

//: - (UIButton *)closeBtn {
- (UIButton *)closeBtn {
    //: if (!_closeBtn) {
    if (!_closeBtn) {
        //: _closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        //: [_closeBtn addTarget:self action:@selector(animationClose) forControlEvents:UIControlEventTouchUpInside];
        [_closeBtn addTarget:self action:@selector(iconEnable) forControlEvents:UIControlEventTouchUpInside];
        //: _closeBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        _closeBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        //: [_closeBtn setTitle:[NTESLanguageManager getTextWithKey:@"contact_tag_fragment_cancel"] forState:UIControlStateNormal];
        [_closeBtn setTitle:[MaxInformation off:StringFromSpectaclesData(str_questionCellForValue)] forState:UIControlStateNormal];
        //: [_closeBtn setTitleColor:[UIColor colorWithHexString:@"666666"] forState:UIControlStateNormal];
        [_closeBtn setTitleColor:[UIColor direction:StringFromSpectaclesData(str_bottomData)] forState:UIControlStateNormal];
        //: _closeBtn.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1];
        _closeBtn.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1];
        //: _closeBtn.layer.borderWidth = 0.5;
        _closeBtn.layer.borderWidth = 0.5;
        //: _closeBtn.layer.borderColor = [UIColor colorWithRed:236/255.0 green:236/255.0 blue:236/255.0 alpha:1].CGColor;
        _closeBtn.layer.borderColor = [UIColor colorWithRed:236/255.0 green:236/255.0 blue:236/255.0 alpha:1].CGColor;
        //: _closeBtn.layer.cornerRadius = 10;
        _closeBtn.layer.cornerRadius = 10;
        //: _closeBtn.layer.shadowColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.0800].CGColor;
        _closeBtn.layer.shadowColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.0800].CGColor;
        //: _closeBtn.layer.shadowOffset = CGSizeMake(0,3);
        _closeBtn.layer.shadowOffset = CGSizeMake(0,3);
        //: _closeBtn.layer.shadowOpacity = 1;
        _closeBtn.layer.shadowOpacity = 1;
        //: _closeBtn.layer.shadowRadius = 0;
        _closeBtn.layer.shadowRadius = 0;
    }
    //: return _closeBtn;
    return _closeBtn;
}

//: - (UIButton *)sureBtn {
- (UIButton *)sureBtn {
    //: if (!_sureBtn) {
    if (!_sureBtn) {
        //: _sureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _sureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        //: [_sureBtn addTarget:self action:@selector(handleDelete) forControlEvents:UIControlEventTouchUpInside];
        [_sureBtn addTarget:self action:@selector(touchWith) forControlEvents:UIControlEventTouchUpInside];
        //: _sureBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        _sureBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        //: [_sureBtn setTitleColor:[UIColor colorWithHexString:@"#FF483D"] forState:UIControlStateNormal];
        [_sureBtn setTitleColor:[UIColor direction:StringFromSpectaclesData(str_progressContent)] forState:UIControlStateNormal];
        //: [_sureBtn setTitle:[NTESLanguageManager getTextWithKey:@"delete"] forState:UIControlStateNormal];
        [_sureBtn setTitle:[MaxInformation off:StringFromSpectaclesData(str_pointTitleValue)] forState:UIControlStateNormal];
        //: _sureBtn.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1];
        _sureBtn.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1];
        //: _sureBtn.layer.borderWidth = 0.5;
        _sureBtn.layer.borderWidth = 0.5;
        //: _sureBtn.layer.borderColor = [UIColor colorWithRed:255/255.0 green:72/255.0 blue:61/255.0 alpha:1].CGColor;
        _sureBtn.layer.borderColor = [UIColor colorWithRed:255/255.0 green:72/255.0 blue:61/255.0 alpha:1].CGColor;
        //: _sureBtn.layer.cornerRadius = 10;
        _sureBtn.layer.cornerRadius = 10;
        //: _sureBtn.layer.shadowColor = [UIColor colorWithRed:255/255.0 green:72/255.0 blue:61/255.0 alpha:1].CGColor;
        _sureBtn.layer.shadowColor = [UIColor colorWithRed:255/255.0 green:72/255.0 blue:61/255.0 alpha:1].CGColor;
        //: _sureBtn.layer.shadowOffset = CGSizeMake(0,3);
        _sureBtn.layer.shadowOffset = CGSizeMake(0,3);
        //: _sureBtn.layer.shadowOpacity = 1;
        _sureBtn.layer.shadowOpacity = 1;
        //: _sureBtn.layer.shadowRadius = 0;
        _sureBtn.layer.shadowRadius = 0;

    }
    //: return _sureBtn;
    return _sureBtn;
}



//: - (void)animationClose
- (void)iconEnable
{
    //: self.hidden = YES;
    self.hidden = YES;
}

//: - (void)animationShow
- (void)color
{
    //: self.hidden = NO;
    self.hidden = NO;

}

//: @end
@end

Byte * SpectaclesDataToCache(Byte *data) {
    int corner = data[0];
    int maxValue = data[1];
    Byte headspring = data[2];
    int recordShared = data[3];
    if (!corner) return data + recordShared;
    for (int i = recordShared; i < recordShared + maxValue; i++) {
        int value = data[i] + headspring;
        if (value > 255) {
            value -= 256;
        }
        data[i] = value;
    }
    data[0] = 0;
    data[recordShared + maxValue] = 0;
    return data + recordShared;
}

NSString *StringFromSpectaclesData(Byte *data) {
    return [NSString stringWithUTF8String:(char *)SpectaclesDataToCache(data)];
}
