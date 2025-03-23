
#import <Foundation/Foundation.h>

NSString *StringFromWorkData(Byte *data);        


//: #333333
Byte str_vetValue[] = {23, 7, 6, 10, 21, 131, 71, 218, 59, 97, 29, 45, 45, 45, 45, 45, 45, 44};


//: report_reasons7
Byte str_electricalData[] = {92, 15, 74, 6, 177, 16, 40, 27, 38, 37, 40, 42, 21, 40, 27, 23, 41, 37, 36, 41, 237, 76};


//: 666666
Byte str_biologicData[] = {70, 6, 93, 10, 94, 77, 18, 136, 101, 59, 217, 217, 217, 217, 217, 217, 193};


//: report_reasons9
Byte str_encounterName[] = {18, 15, 90, 7, 191, 64, 55, 24, 11, 22, 21, 24, 26, 5, 24, 11, 7, 25, 21, 20, 25, 223, 137};


//: icon_accessory_normal
Byte str_longtimeName[] = {2, 21, 68, 9, 234, 20, 17, 215, 62, 37, 31, 43, 42, 27, 29, 31, 31, 33, 47, 47, 43, 46, 53, 27, 42, 43, 46, 41, 29, 40, 199};


//: report_reasons10
Byte str_basketballValue[] = {56, 16, 17, 12, 167, 48, 81, 133, 80, 161, 8, 55, 97, 84, 95, 94, 97, 99, 78, 97, 84, 80, 98, 94, 93, 98, 32, 31, 68};


//: #2BBCFB
Byte str_tollDirtyData[] = {85, 7, 94, 4, 197, 212, 228, 228, 229, 232, 228, 109};


//: contact_tag_fragment_cancel
Byte str_refugeFromData[] = {65, 27, 83, 12, 12, 75, 211, 242, 115, 38, 246, 56, 16, 28, 27, 33, 14, 16, 33, 12, 33, 14, 20, 12, 19, 31, 14, 20, 26, 18, 27, 33, 12, 16, 14, 27, 16, 18, 25, 66};


//: report_reasons8
Byte str_refugeTitle[] = {42, 15, 84, 5, 47, 30, 17, 28, 27, 30, 32, 11, 30, 17, 13, 31, 27, 26, 31, 228, 239};


//: #999999
Byte str_fishValue[] = {37, 7, 44, 14, 101, 43, 190, 32, 140, 70, 210, 227, 63, 150, 247, 13, 13, 13, 13, 13, 13, 9};


//: contact_tag_fragment_sure
Byte str_candidAppreciateData[] = {8, 25, 67, 13, 64, 183, 122, 174, 77, 255, 226, 3, 161, 32, 44, 43, 49, 30, 32, 49, 28, 49, 30, 36, 28, 35, 47, 30, 36, 42, 34, 43, 49, 28, 48, 50, 47, 34, 67};


//: #009ADC
Byte str_minimumAxValue[] = {76, 7, 93, 14, 51, 29, 35, 78, 160, 65, 73, 65, 146, 84, 198, 211, 211, 220, 228, 231, 230, 148};


//: report_Content
Byte str_concedeText[] = {90, 14, 43, 12, 88, 164, 152, 200, 58, 235, 39, 65, 71, 58, 69, 68, 71, 73, 52, 24, 68, 67, 73, 58, 67, 73, 2};


//: report_Tip
Byte str_terriblyName[] = {20, 10, 70, 13, 154, 230, 101, 94, 46, 142, 195, 13, 14, 44, 31, 42, 41, 44, 46, 25, 14, 35, 42, 190};


//: icon_accessory_selected
Byte str_neitherData[] = {16, 23, 37, 14, 128, 6, 11, 41, 115, 7, 237, 194, 109, 18, 68, 62, 74, 73, 58, 60, 62, 62, 64, 78, 78, 74, 77, 84, 58, 78, 64, 71, 64, 62, 79, 64, 63, 208};


//: report_reasons6
Byte str_cellEdgeValue[] = {26, 15, 86, 7, 196, 250, 102, 28, 15, 26, 25, 28, 30, 9, 28, 15, 11, 29, 25, 24, 29, 224, 77};

// __DEBUG__
// __CLOSE_PRINT__
//
//  ForefrontView.m
//  NIM
//
//  Created by Yan Wang on 2024/8/9.
//  Copyright © 2024 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import "ZMONTranslateView.h"
#import "ForefrontView.h"

//: @interface ZMONTranslateView ()
@interface ForefrontView ()

//: @property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UILabel *titleLabel;
//: @property (nonatomic,strong) UIView *box;
@property (nonatomic,strong) UIView *box;
//: @property (nonatomic,strong) UIButton *sureBtn;
@property (nonatomic,strong) UIButton *sureBtn;
//: @property (nonatomic,strong) UIButton *closeBtn;
@property (nonatomic,strong) UIButton *closeBtn;
//: @property (nonatomic,strong) UIView *buttonBox;
@property (nonatomic,strong) UIView *buttonBox;

//: @property (nonatomic,strong) NSArray *selectButtons;
@property (nonatomic,strong) NSArray *selectButtons;
//: @property (nonatomic,assign) NSInteger index;
@property (nonatomic,assign) NSInteger index;

//: @end
@end

//: @implementation ZMONTranslateView
@implementation ForefrontView

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
        [self initSubUi];

        //: self.selectButtons = @[[NTESLanguageManager getTextWithKey:@"report_reasons7"],[NTESLanguageManager getTextWithKey:@"report_reasons8"],[NTESLanguageManager getTextWithKey:@"report_reasons9"],[NTESLanguageManager getTextWithKey:@"report_reasons10"],[NTESLanguageManager getTextWithKey:@"report_reasons6"]];
        self.selectButtons = @[[MaxInformation off:StringFromWorkData(str_electricalData)],[MaxInformation off:StringFromWorkData(str_refugeTitle)],[MaxInformation off:StringFromWorkData(str_encounterName)],[MaxInformation off:StringFromWorkData(str_basketballValue)],[MaxInformation off:StringFromWorkData(str_cellEdgeValue)]];
        //: self.index = 0;
        self.index = 0;
    }
    //: return self;
    return self;
}


//: - (void)initUI{
- (void)initSubUi{
    //: _box = [[UIView alloc]initWithFrame:CGRectMake(20, ([[UIScreen mainScreen] bounds].size.height-382)/2, [[UIScreen mainScreen] bounds].size.width-40, 382)];
    _box = [[UIView alloc]initWithFrame:CGRectMake(20, ([[UIScreen mainScreen] bounds].size.height-382)/2, [[UIScreen mainScreen] bounds].size.width-40, 382)];
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

    //: UILabel *labsub = [[UILabel alloc] initWithFrame:CGRectMake(20, self.titleLabel.bottom+10, [[UIScreen mainScreen] bounds].size.width-80, 70)];
    UILabel *labsub = [[UILabel alloc] initWithFrame:CGRectMake(20, self.titleLabel.bottom+10, [[UIScreen mainScreen] bounds].size.width-80, 70)];
    //: labsub.font = [UIFont systemFontOfSize:12.f];
    labsub.font = [UIFont systemFontOfSize:12.f];
    //: labsub.textColor = [UIColor colorWithHexString:@"#999999"];
    labsub.textColor = [UIColor direction:StringFromWorkData(str_fishValue)];
    //: labsub.numberOfLines = 0;
    labsub.numberOfLines = 0;
    //: labsub.text = [NTESLanguageManager getTextWithKey:@"report_Tip"];
    labsub.text = [MaxInformation off:StringFromWorkData(str_terriblyName)];
    //: [_box addSubview:labsub];
    [_box addSubview:labsub];

    //: [_box addSubview:self.buttonBox];
    [_box addSubview:self.buttonBox];
    //: self.buttonBox.frame = CGRectMake(20, labsub.bottom, [[UIScreen mainScreen] bounds].size.width-80, 180);
    self.buttonBox.frame = CGRectMake(20, labsub.bottom, [[UIScreen mainScreen] bounds].size.width-80, 180);

    //: CGFloat width = ([[UIScreen mainScreen] bounds].size.width-100)/2;
    CGFloat width = ([[UIScreen mainScreen] bounds].size.width-100)/2;
    //: CGFloat height = 40;
    CGFloat height = 40;

    //: [_box addSubview:self.closeBtn];
    [_box addSubview:self.closeBtn];
    //: self.closeBtn.frame = CGRectMake(20, 382-20-height, width, height);
    self.closeBtn.frame = CGRectMake(20, 382-20-height, width, height);

    //: [_box addSubview:self.sureBtn];
    [_box addSubview:self.sureBtn];
    //: self.sureBtn.frame = CGRectMake(width+40, 382-20-height, width, height);
    self.sureBtn.frame = CGRectMake(width+40, 382-20-height, width, height);
}


//- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    [self animationClose];
//}

//: #pragma mark -- Setter && Getter
#pragma mark -- Setter && Getter
//: - (UILabel *)titleLabel {
- (UILabel *)titleLabel {
    //: if (!_titleLabel) {
    if (!_titleLabel) {
        //: _titleLabel = [[UILabel alloc] init];
        _titleLabel = [[UILabel alloc] init];
        //: _titleLabel.font = [UIFont boldSystemFontOfSize:16.f];
        _titleLabel.font = [UIFont boldSystemFontOfSize:16.f];
        //: _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.textColor = [UIColor blackColor];
        //: _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.textAlignment = NSTextAlignmentCenter;
//        _titleLabel.numberOfLines = 0;
//        _titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        //: _titleLabel.text = [NTESLanguageManager getTextWithKey:@"report_Content"];
        _titleLabel.text = [MaxInformation off:StringFromWorkData(str_concedeText)];
    }
    //: return _titleLabel;
    return _titleLabel;
}

//: - (void)handleReason:(UIButton *)sender
- (void)handleForGrade:(UIButton *)sender
{
    //: sender.selected = !sender.selected;
    sender.selected = !sender.selected;

    //: if(sender.selected){
    if(sender.selected){
        //: self.index = sender.tag;
        self.index = sender.tag;
    }

}

//: - (UIView *)buttonBox
- (UIView *)buttonBox
{
    //: if(!_buttonBox){
    if(!_buttonBox){
        //: _buttonBox = [[UIView alloc]init];
        _buttonBox = [[UIView alloc]init];

        //: UIButton *Btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
        UIButton *Btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
        //: Btn1.frame = CGRectMake(0, 16, [[UIScreen mainScreen] bounds].size.width-40, 20);
        Btn1.frame = CGRectMake(0, 16, [[UIScreen mainScreen] bounds].size.width-40, 20);
        //: [Btn1 addTarget:self action:@selector(handleReason:) forControlEvents:UIControlEventTouchUpInside];
        [Btn1 addTarget:self action:@selector(handleForGrade:) forControlEvents:UIControlEventTouchUpInside];
        //: [Btn1 setImage:[UIImage imageNamed:@"icon_accessory_normal"] forState:UIControlStateNormal];
        [Btn1 setImage:[UIImage imageNamed:StringFromWorkData(str_longtimeName)] forState:UIControlStateNormal];
        //: [Btn1 setImage:[UIImage imageNamed:@"icon_accessory_selected"] forState:UIControlStateSelected];
        [Btn1 setImage:[UIImage imageNamed:StringFromWorkData(str_neitherData)] forState:UIControlStateSelected];
        //: [Btn1 setTitle:[NTESLanguageManager getTextWithKey:@"report_reasons7"] forState:UIControlStateNormal];
        [Btn1 setTitle:[MaxInformation off:StringFromWorkData(str_electricalData)] forState:UIControlStateNormal];
        //: Btn1.titleLabel.font = [UIFont systemFontOfSize:14];
        Btn1.titleLabel.font = [UIFont systemFontOfSize:14];
        //: [Btn1 setTitleColor:[UIColor colorWithHexString:@"#333333"] forState:UIControlStateNormal];
        [Btn1 setTitleColor:[UIColor direction:StringFromWorkData(str_vetValue)] forState:UIControlStateNormal];
        //: Btn1.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        Btn1.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        //: Btn1.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 20); 
        Btn1.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 20); // 调整图片与文字之间的间距
        //: Btn1.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0); 
        Btn1.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0); // 调整文字与图片之间的间距
        //: [_buttonBox addSubview:Btn1];
        [_buttonBox addSubview:Btn1];
        //: Btn1.tag = 0;
        Btn1.tag = 0;


        //: UIButton *Btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
        UIButton *Btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
        //: Btn2.frame = CGRectMake(0, Btn1.bottom+16, [[UIScreen mainScreen] bounds].size.width-40, 20);
        Btn2.frame = CGRectMake(0, Btn1.bottom+16, [[UIScreen mainScreen] bounds].size.width-40, 20);
        //: [Btn2 addTarget:self action:@selector(handleReason:) forControlEvents:UIControlEventTouchUpInside];
        [Btn2 addTarget:self action:@selector(handleForGrade:) forControlEvents:UIControlEventTouchUpInside];
        //: [Btn2 setImage:[UIImage imageNamed:@"icon_accessory_normal"] forState:UIControlStateNormal];
        [Btn2 setImage:[UIImage imageNamed:StringFromWorkData(str_longtimeName)] forState:UIControlStateNormal];
        //: [Btn2 setImage:[UIImage imageNamed:@"icon_accessory_selected"] forState:UIControlStateSelected];
        [Btn2 setImage:[UIImage imageNamed:StringFromWorkData(str_neitherData)] forState:UIControlStateSelected];
        //: [Btn2 setTitle:[NTESLanguageManager getTextWithKey:@"report_reasons8"] forState:UIControlStateNormal];
        [Btn2 setTitle:[MaxInformation off:StringFromWorkData(str_refugeTitle)] forState:UIControlStateNormal];
        //: Btn2.titleLabel.font = [UIFont systemFontOfSize:14];
        Btn2.titleLabel.font = [UIFont systemFontOfSize:14];
        //: [Btn2 setTitleColor:[UIColor colorWithHexString:@"#333333"] forState:UIControlStateNormal];
        [Btn2 setTitleColor:[UIColor direction:StringFromWorkData(str_vetValue)] forState:UIControlStateNormal];
        //: Btn2.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        Btn2.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        //: Btn2.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 20); 
        Btn2.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 20); // 调整图片与文字之间的间距
        //: Btn2.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0); 
        Btn2.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0); // 调整文字与图片之间的间距
        //: [_buttonBox addSubview:Btn2];
        [_buttonBox addSubview:Btn2];
        //: Btn2.tag = 1;
        Btn2.tag = 1;

        //: UIButton *Btn3 = [UIButton buttonWithType:UIButtonTypeCustom];
        UIButton *Btn3 = [UIButton buttonWithType:UIButtonTypeCustom];
        //: Btn3.frame = CGRectMake(0, Btn2.bottom+16, [[UIScreen mainScreen] bounds].size.width-40, 20);
        Btn3.frame = CGRectMake(0, Btn2.bottom+16, [[UIScreen mainScreen] bounds].size.width-40, 20);
        //: [Btn3 addTarget:self action:@selector(handleReason:) forControlEvents:UIControlEventTouchUpInside];
        [Btn3 addTarget:self action:@selector(handleForGrade:) forControlEvents:UIControlEventTouchUpInside];
        //: [Btn3 setImage:[UIImage imageNamed:@"icon_accessory_normal"] forState:UIControlStateNormal];
        [Btn3 setImage:[UIImage imageNamed:StringFromWorkData(str_longtimeName)] forState:UIControlStateNormal];
        //: [Btn3 setImage:[UIImage imageNamed:@"icon_accessory_selected"] forState:UIControlStateSelected];
        [Btn3 setImage:[UIImage imageNamed:StringFromWorkData(str_neitherData)] forState:UIControlStateSelected];
        //: [_buttonBox addSubview:Btn3];
        [_buttonBox addSubview:Btn3];
        //: [Btn3 setTitle:[NTESLanguageManager getTextWithKey:@"report_reasons9"] forState:UIControlStateNormal];
        [Btn3 setTitle:[MaxInformation off:StringFromWorkData(str_encounterName)] forState:UIControlStateNormal];
        //: Btn3.titleLabel.font = [UIFont systemFontOfSize:14];
        Btn3.titleLabel.font = [UIFont systemFontOfSize:14];
        //: [Btn3 setTitleColor:[UIColor colorWithHexString:@"#333333"] forState:UIControlStateNormal];
        [Btn3 setTitleColor:[UIColor direction:StringFromWorkData(str_vetValue)] forState:UIControlStateNormal];
        //: Btn3.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        Btn3.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        //: Btn3.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 20); 
        Btn3.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 20); // 调整图片与文字之间的间距
        //: Btn3.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        Btn3.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        //: Btn3.tag = 2;
        Btn3.tag = 2;

        //: UIButton *Btn4 = [UIButton buttonWithType:UIButtonTypeCustom];
        UIButton *Btn4 = [UIButton buttonWithType:UIButtonTypeCustom];
        //: Btn4.frame = CGRectMake(0, Btn3.bottom+16, [[UIScreen mainScreen] bounds].size.width-40, 20);
        Btn4.frame = CGRectMake(0, Btn3.bottom+16, [[UIScreen mainScreen] bounds].size.width-40, 20);
        //: [Btn4 addTarget:self action:@selector(handleReason:) forControlEvents:UIControlEventTouchUpInside];
        [Btn4 addTarget:self action:@selector(handleForGrade:) forControlEvents:UIControlEventTouchUpInside];
        //: [Btn4 setImage:[UIImage imageNamed:@"icon_accessory_normal"] forState:UIControlStateNormal];
        [Btn4 setImage:[UIImage imageNamed:StringFromWorkData(str_longtimeName)] forState:UIControlStateNormal];
        //: [Btn4 setImage:[UIImage imageNamed:@"icon_accessory_selected"] forState:UIControlStateSelected];
        [Btn4 setImage:[UIImage imageNamed:StringFromWorkData(str_neitherData)] forState:UIControlStateSelected];
        //: [_buttonBox addSubview:Btn4];
        [_buttonBox addSubview:Btn4];
        //: [Btn4 setTitle:[NTESLanguageManager getTextWithKey:@"report_reasons10"] forState:UIControlStateNormal];
        [Btn4 setTitle:[MaxInformation off:StringFromWorkData(str_basketballValue)] forState:UIControlStateNormal];
        //: Btn4.titleLabel.font = [UIFont systemFontOfSize:14];
        Btn4.titleLabel.font = [UIFont systemFontOfSize:14];
        //: [Btn4 setTitleColor:[UIColor colorWithHexString:@"#333333"] forState:UIControlStateNormal];
        [Btn4 setTitleColor:[UIColor direction:StringFromWorkData(str_vetValue)] forState:UIControlStateNormal];
        //: Btn4.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        Btn4.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        //: Btn4.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 20); 
        Btn4.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 20); // 调整图片与文字之间的间距
        //: Btn4.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        Btn4.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        //: Btn4.tag = 3;
        Btn4.tag = 3;

        //: UIButton *Btn5 = [UIButton buttonWithType:UIButtonTypeCustom];
        UIButton *Btn5 = [UIButton buttonWithType:UIButtonTypeCustom];
        //: Btn5.frame = CGRectMake(0, Btn4.bottom+16, [[UIScreen mainScreen] bounds].size.width-40, 20);
        Btn5.frame = CGRectMake(0, Btn4.bottom+16, [[UIScreen mainScreen] bounds].size.width-40, 20);
        //: [Btn5 addTarget:self action:@selector(handleReason:) forControlEvents:UIControlEventTouchUpInside];
        [Btn5 addTarget:self action:@selector(handleForGrade:) forControlEvents:UIControlEventTouchUpInside];
        //: [Btn5 setImage:[UIImage imageNamed:@"icon_accessory_normal"] forState:UIControlStateNormal];
        [Btn5 setImage:[UIImage imageNamed:StringFromWorkData(str_longtimeName)] forState:UIControlStateNormal];
        //: [Btn5 setImage:[UIImage imageNamed:@"icon_accessory_selected"] forState:UIControlStateSelected];
        [Btn5 setImage:[UIImage imageNamed:StringFromWorkData(str_neitherData)] forState:UIControlStateSelected];
        //: [_buttonBox addSubview:Btn5];
        [_buttonBox addSubview:Btn5];
        //: [Btn5 setTitle:[NTESLanguageManager getTextWithKey:@"report_reasons6"] forState:UIControlStateNormal];
        [Btn5 setTitle:[MaxInformation off:StringFromWorkData(str_cellEdgeValue)] forState:UIControlStateNormal];
        //: Btn5.titleLabel.font = [UIFont systemFontOfSize:14];
        Btn5.titleLabel.font = [UIFont systemFontOfSize:14];
        //: [Btn5 setTitleColor:[UIColor colorWithHexString:@"#333333"] forState:UIControlStateNormal];
        [Btn5 setTitleColor:[UIColor direction:StringFromWorkData(str_vetValue)] forState:UIControlStateNormal];
        //: Btn5.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        Btn5.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        //: Btn5.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 20); 
        Btn5.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 20); // 调整图片与文字之间的间距
        //: Btn5.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        Btn5.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        //: Btn5.tag = 4;
        Btn5.tag = 4;
    }
    //: return _buttonBox;
    return _buttonBox;
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
        [_closeBtn setTitleColor:[UIColor direction:StringFromWorkData(str_biologicData)] forState:UIControlStateNormal];
        //: [_closeBtn setTitle:[NTESLanguageManager getTextWithKey:@"contact_tag_fragment_cancel"] forState:UIControlStateNormal];
        [_closeBtn setTitle:[MaxInformation off:StringFromWorkData(str_refugeFromData)] forState:UIControlStateNormal];
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
        //: [_sureBtn addTarget:self action:@selector(handleSubmit) forControlEvents:UIControlEventTouchUpInside];
        [_sureBtn addTarget:self action:@selector(comeToGripsTitleRefer) forControlEvents:UIControlEventTouchUpInside];
        //: _sureBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        _sureBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        //: [_sureBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_sureBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        //: [_sureBtn setTitle:[NTESLanguageManager getTextWithKey:@"contact_tag_fragment_sure"] forState:UIControlStateNormal];
        [_sureBtn setTitle:[MaxInformation off:StringFromWorkData(str_candidAppreciateData)] forState:UIControlStateNormal];
        //: _sureBtn.backgroundColor = [UIColor colorWithHexString:@"#2BBCFB"];
        _sureBtn.backgroundColor = [UIColor direction:StringFromWorkData(str_tollDirtyData)];
        //: _sureBtn.layer.cornerRadius = 10;
        _sureBtn.layer.cornerRadius = 10;
        //: _sureBtn.layer.shadowColor = [UIColor colorWithHexString:@"#009ADC"].CGColor;
        _sureBtn.layer.shadowColor = [UIColor direction:StringFromWorkData(str_minimumAxValue)].CGColor;
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

//: - (void)handleSubmit
- (void)comeToGripsTitleRefer
{
    //: [self animationClose];
    [self iconEnable];
//    [SVProgressHUD showMessage:LangKey(@"report_sucessed")];

    //: if ([self.delegate respondsToSelector:@selector(didTouchSubmitContentButton:)]) {
    if ([self.delegate respondsToSelector:@selector(colorOf:)]) {
        //: [self.delegate didTouchSubmitContentButton:self.selectButtons[self.index]];
        [self.delegate colorOf:self.selectButtons[self.index]];
    }


}


//: - (void)animationClose
- (void)iconEnable
{
    //: self.hidden = YES;
    self.hidden = YES;
}

//: - (void)animationShow
- (void)ting
{
    //: self.hidden = NO;
    self.hidden = NO;
}

//: @end
@end

Byte * WorkDataToCache(Byte *data) {
    int investor = data[0];
    int handleTextAlcohol = data[1];
    Byte animal = data[2];
    int excitement = data[3];
    if (!investor) return data + excitement;
    for (int i = excitement; i < excitement + handleTextAlcohol; i++) {
        int value = data[i] + animal;
        if (value > 255) {
            value -= 256;
        }
        data[i] = value;
    }
    data[0] = 0;
    data[excitement + handleTextAlcohol] = 0;
    return data + excitement;
}

NSString *StringFromWorkData(Byte *data) {
    return [NSString stringWithUTF8String:(char *)WorkDataToCache(data)];
}
