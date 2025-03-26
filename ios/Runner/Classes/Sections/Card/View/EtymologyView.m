
#import <Foundation/Foundation.h>

NSString *StringFromSizeData(Byte *data);        


//: #333333
Byte str_tingInputData[] = {63, 7, 29, 10, 55, 69, 196, 118, 8, 71, 6, 22, 22, 22, 22, 22, 22, 8};


//: report_next_select_black
Byte str_byContent[] = {33, 24, 40, 11, 81, 200, 95, 149, 45, 242, 95, 74, 61, 72, 71, 74, 76, 55, 70, 61, 80, 76, 55, 75, 61, 68, 61, 59, 76, 55, 58, 68, 57, 59, 67, 196};


//: YES
Byte str_sharedContent[] = {80, 3, 56, 11, 123, 1, 9, 196, 170, 202, 63, 33, 13, 27, 46};


//: #2BBCFB
Byte str_showText[] = {21, 7, 97, 14, 94, 231, 158, 3, 231, 79, 49, 220, 33, 130, 194, 209, 225, 225, 226, 229, 225, 73};


//: #009ADC
Byte str_sendTitle[] = {17, 7, 56, 9, 98, 98, 227, 209, 72, 235, 248, 248, 1, 9, 12, 11, 219};


//: 666666
Byte str_statusText[] = {53, 6, 42, 9, 104, 203, 52, 211, 81, 12, 12, 12, 12, 12, 12, 225};


//: activity_group_chat_avatar_add_black
Byte str_sizeText[] = {14, 36, 36, 8, 210, 243, 224, 32, 61, 63, 80, 69, 82, 69, 80, 85, 59, 67, 78, 75, 81, 76, 59, 63, 68, 61, 80, 59, 61, 82, 61, 80, 61, 78, 59, 61, 64, 64, 59, 62, 72, 61, 63, 71, 38};


//: contact_tag_fragment_sure
Byte str_recordDisableData[] = {33, 25, 75, 5, 147, 24, 36, 35, 41, 22, 24, 41, 20, 41, 22, 28, 20, 27, 39, 22, 28, 34, 26, 35, 41, 20, 40, 42, 39, 26, 155};


//: contact_tag_fragment_cancel
Byte str_clientValue[] = {76, 27, 72, 14, 34, 142, 21, 93, 42, 185, 252, 80, 204, 106, 27, 39, 38, 44, 25, 27, 44, 23, 44, 25, 31, 23, 30, 42, 25, 31, 37, 29, 38, 44, 23, 27, 25, 38, 27, 29, 36, 89};

// __DEBUG__
// __CLOSE_PRINT__
//
//  EtymologyView.m
//  AppleProject
//
//  Created by Yan Wang on 2025/2/15.
//  Copyright © 2025 AppleProject. All rights reserved.
//

// __M_A_C_R_O__
//: #import "ZMONReportBlackView.h"
#import "EtymologyView.h"

//: @interface ZMONReportBlackView ()
@interface EtymologyView ()

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

//: @implementation ZMONReportBlackView
@implementation EtymologyView

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
        [self initChange];

    }
    //: return self;
    return self;
}


//: - (void)initUI{
- (void)initChange{
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
    labsubLabel.textColor = [UIColor direction:StringFromSizeData(str_tingInputData)];
    //: labsubLabel.numberOfLines = 0;
    labsubLabel.numberOfLines = 0;
    //: labsubLabel.text = [NTESLanguageManager getTextWithKey:@"report_next_select_black"];
    labsubLabel.text = [MaxInformation off:StringFromSizeData(str_byContent)];
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

//: - (void)handleBlack{
- (void)shouldView{

//    __weak typeof(self) wself = self;
//
//        [[NIMSDK sharedSDK].userManager addToBlackList:wself.userID completion:^(NSError *error) {
//
//            if (!error) {
//                [wself makeToast:LangKey(@"group_chat_avatar_activity_add_black_success") duration:2.0f position:CSToastPositionCenter];
//            }else{
//                [wself makeToast:LangKey(@"black_list_activity_add_black_failed") duration:2.0f position:CSToastPositionCenter];
//
//            }
//        }];
//    [self animationClose];
    //: [self animationClose];
    [self iconEnable];

    //: self.speiceBackBlock(@"YES");
    self.speiceBackBlock(StringFromSizeData(str_sharedContent));
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
        //: _titleLabel.text = [NTESLanguageManager getTextWithKey:@"activity_group_chat_avatar_add_black"];
        _titleLabel.text = [MaxInformation off:StringFromSizeData(str_sizeText)];
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
        //: [_closeBtn setTitleColor:[UIColor colorWithHexString:@"666666"] forState:UIControlStateNormal];
        [_closeBtn setTitleColor:[UIColor direction:StringFromSizeData(str_statusText)] forState:UIControlStateNormal];
        //: [_closeBtn setTitle:[NTESLanguageManager getTextWithKey:@"contact_tag_fragment_cancel"] forState:UIControlStateNormal];
        [_closeBtn setTitle:[MaxInformation off:StringFromSizeData(str_clientValue)] forState:UIControlStateNormal];

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
        //: [_sureBtn addTarget:self action:@selector(handleBlack) forControlEvents:UIControlEventTouchUpInside];
        [_sureBtn addTarget:self action:@selector(shouldView) forControlEvents:UIControlEventTouchUpInside];
        //: _sureBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        _sureBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        //: [_sureBtn setTitleColor:[UIColor colorWithHexString:@"#2BBCFB"] forState:UIControlStateNormal];
        [_sureBtn setTitleColor:[UIColor direction:StringFromSizeData(str_showText)] forState:UIControlStateNormal];
        //: [_sureBtn setTitle:[NTESLanguageManager getTextWithKey:@"contact_tag_fragment_sure"] forState:UIControlStateNormal];
        [_sureBtn setTitle:[MaxInformation off:StringFromSizeData(str_recordDisableData)] forState:UIControlStateNormal];
        //: _sureBtn.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1];
        _sureBtn.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1];
        //: _sureBtn.layer.borderWidth = 0.5;
        _sureBtn.layer.borderWidth = 0.5;
        //: _sureBtn.layer.borderColor = [UIColor colorWithHexString:@"#2BBCFB"].CGColor;
        _sureBtn.layer.borderColor = [UIColor direction:StringFromSizeData(str_showText)].CGColor;
        //: _sureBtn.layer.cornerRadius = 10;
        _sureBtn.layer.cornerRadius = 10;
        //: _sureBtn.layer.shadowColor = [UIColor colorWithHexString:@"#009ADC"].CGColor;
        _sureBtn.layer.shadowColor = [UIColor direction:StringFromSizeData(str_sendTitle)].CGColor;
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
- (void)animation
{
    //: self.hidden = NO;
    self.hidden = NO;

}



//: @end
@end

Byte * SizeDataToCache(Byte *data) {
    int rank = data[0];
    int alteration = data[1];
    Byte beSession = data[2];
    int save = data[3];
    if (!rank) return data + save;
    for (int i = save; i < save + alteration; i++) {
        int value = data[i] + beSession;
        if (value > 255) {
            value -= 256;
        }
        data[i] = value;
    }
    data[0] = 0;
    data[save + alteration] = 0;
    return data + save;
}

NSString *StringFromSizeData(Byte *data) {
    return [NSString stringWithUTF8String:(char *)SizeDataToCache(data)];
}
