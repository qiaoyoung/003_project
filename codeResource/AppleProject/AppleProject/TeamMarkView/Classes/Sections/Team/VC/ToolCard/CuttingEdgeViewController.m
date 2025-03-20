
#import <Foundation/Foundation.h>
typedef struct {
    Byte elegantEnablely;
    Byte *enterpriseCell;
    unsigned int sharedAttract;
    bool tingMedia;
	int way;
	int labKing;
} MoleData;

NSString *StringFromMoleData(MoleData *data);


//: back_arrow_bl
MoleData str_secondaryText = (MoleData){138, (Byte []){232, 235, 233, 225, 213, 235, 248, 248, 229, 253, 213, 232, 230, 11}, 13, false, 188, 118};


//: Please_enter_content
MoleData str_invisibleData = (MoleData){178, (Byte []){226, 222, 215, 211, 193, 215, 237, 215, 220, 198, 215, 192, 237, 209, 221, 220, 198, 215, 220, 198, 9}, 20, false, 66, 236};


//: common_bg
MoleData str_paradeLimbText = (MoleData){217, (Byte []){186, 182, 180, 180, 182, 183, 134, 187, 190, 227}, 9, false, 129, 255};


//: %lu/400
MoleData str_auntValue = (MoleData){140, (Byte []){169, 224, 249, 163, 184, 188, 188, 255}, 7, false, 200, 81};


//: #999999
MoleData str_dirtyName = (MoleData){218, (Byte []){249, 227, 227, 227, 227, 227, 227, 236}, 7, false, 32, 51};


//: Group_description
MoleData str_installTitle = (MoleData){183, (Byte []){240, 197, 216, 194, 199, 232, 211, 210, 196, 212, 197, 222, 199, 195, 222, 216, 217, 212}, 17, false, 213, 36};


//: %lu/512
MoleData str_searData = (MoleData){213, (Byte []){240, 185, 160, 250, 224, 228, 231, 12}, 7, false, 74, 77};


//: icon_checkbox_selected
MoleData str_brotherEdgeQuitValue = (MoleData){89, (Byte []){48, 58, 54, 55, 6, 58, 49, 60, 58, 50, 59, 54, 33, 6, 42, 60, 53, 60, 58, 45, 60, 61, 161}, 22, false, 105, 66};

// __DEBUG__
// __CLOSE_PRINT__
//
//  CuttingEdgeViewController.m
//  NIM
//
//  Created by Yan Wang on 2024/6/27.
//  Copyright © 2024 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import "BBBTeamIntroduceViewController.h"
#import "CuttingEdgeViewController.h"
//: #import "UITextView+Util.h"
#import "UITextView+Util.h"

//: @interface BBBTeamIntroduceViewController ()<UITextFieldDelegate, UITextViewDelegate>
@interface CuttingEdgeViewController ()<UITextFieldDelegate, UITextViewDelegate>


//: @property (strong, nonatomic) UITextView *contentTextView;
@property (strong, nonatomic) UITextView *contentTextView;

//: @property (nonatomic, strong) UIButton *submitButton;
@property (nonatomic, strong) UIButton *submitButton;

//: @property (nonatomic, strong) CAGradientLayer *gradientLayer;
@property (nonatomic, strong) CAGradientLayer *gradientLayer;
//: @property (nonatomic,strong) UILabel *numLabel;
@property (nonatomic,strong) UILabel *numLabel;

//: @end
@end

//: @implementation BBBTeamIntroduceViewController
@implementation CuttingEdgeViewController

//: - (void)viewWillAppear:(BOOL)animated{
- (void)viewWillAppear:(BOOL)animated{
    //: [super viewWillAppear:animated];
    [super viewWillAppear:animated];
    //: [self.navigationController.navigationBar setHidden:YES];
    [self.navigationController.navigationBar setHidden:YES];
}

//: - (void)viewWillDisappear:(BOOL)animated{
- (void)viewWillDisappear:(BOOL)animated{
    //: [super viewWillDisappear:animated];
    [super viewWillDisappear:animated];
    //: [self.contentTextView endEditing:YES];
    [self.contentTextView endEditing:YES];
    //: [self.navigationController.navigationBar setHidden:NO];
    [self.navigationController.navigationBar setHidden:NO];
}


//: - (void)viewDidLoad {
- (void)viewDidLoad {
    //: [super viewDidLoad];
    [super viewDidLoad];
//    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"common_bg"]];
    //: UIImageView *bg = [[UIImageView alloc]initWithFrame:self.view.bounds];
    UIImageView *bg = [[UIImageView alloc]initWithFrame:self.view.bounds];
    //: bg.image = [UIImage imageNamed:@"common_bg"];
    bg.image = [UIImage imageNamed:StringFromMoleData(&str_paradeLimbText)];
    //: [self.view addSubview:bg];
    [self.view addSubview:bg];

    //: UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, (44.0f + [UIDevice vg_statusBarHeight]))];
    UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, (44.0f + [UIDevice task]))];
//    bgView.backgroundColor = [UIColor redColor];
    //: [self.view addSubview:bgView];
    [self.view addSubview:bgView];


    //: UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    //: backButton.frame = CGRectMake(5, [UIDevice vg_statusBarHeight]+4, 40, 40);
    backButton.frame = CGRectMake(5, [UIDevice task]+4, 40, 40);
    //: [backButton setImage:[UIImage imageNamed:@"back_arrow_bl"] forState:(UIControlStateNormal)];
    [backButton setImage:[UIImage imageNamed:StringFromMoleData(&str_secondaryText)] forState:(UIControlStateNormal)];
    //: [backButton addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    [backButton addTarget:self action:@selector(withItem) forControlEvents:UIControlEventTouchUpInside];
    //: [bgView addSubview:backButton];
    [bgView addSubview:backButton];

    //: UILabel *labtitle = [[UILabel alloc] initWithFrame:CGRectMake(([[UIScreen mainScreen] bounds].size.width-200)/2, [UIDevice vg_statusBarHeight]+4, 200, 40)];
    UILabel *labtitle = [[UILabel alloc] initWithFrame:CGRectMake(([[UIScreen mainScreen] bounds].size.width-200)/2, [UIDevice task]+4, 200, 40)];
    //: labtitle.font = [UIFont systemFontOfSize:16.f];
    labtitle.font = [UIFont systemFontOfSize:16.f];
    //: labtitle.textColor = [UIColor blackColor];
    labtitle.textColor = [UIColor blackColor];
    //: labtitle.textAlignment = NSTextAlignmentCenter;
    labtitle.textAlignment = NSTextAlignmentCenter;
    //: labtitle.text = [NTESLanguageManager getTextWithKey:@"Group_description"];
    labtitle.text = [MaxInformation off:StringFromMoleData(&str_installTitle)];
    //: [bgView addSubview:labtitle];
    [bgView addSubview:labtitle];

    //: UIButton *submitButton = [UIButton buttonWithType:UIButtonTypeCustom];
    UIButton *submitButton = [UIButton buttonWithType:UIButtonTypeCustom];
    //: submitButton.frame = CGRectMake([[UIScreen mainScreen] bounds].size.width-15-40, [UIDevice vg_statusBarHeight]+4, 40, 40);
    submitButton.frame = CGRectMake([[UIScreen mainScreen] bounds].size.width-15-40, [UIDevice task]+4, 40, 40);
    //: [submitButton setImage:[UIImage imageNamed:@"icon_checkbox_selected"] forState:(UIControlStateNormal)];
    [submitButton setImage:[UIImage imageNamed:StringFromMoleData(&str_brotherEdgeQuitValue)] forState:(UIControlStateNormal)];
    //: [submitButton addTarget:self action:@selector(onSave:) forControlEvents:UIControlEventTouchUpInside];
    [submitButton addTarget:self action:@selector(bied:) forControlEvents:UIControlEventTouchUpInside];
    //: [bgView addSubview:submitButton];
    [bgView addSubview:submitButton];


    //: UIView *contentView = [[UIView alloc]initWithFrame:CGRectMake(15, (44.0f + [UIDevice vg_statusBarHeight])+10, [[UIScreen mainScreen] bounds].size.width-30, 256)];
    UIView *contentView = [[UIView alloc]initWithFrame:CGRectMake(15, (44.0f + [UIDevice task])+10, [[UIScreen mainScreen] bounds].size.width-30, 256)];
//    contentView.backgroundColor = [UIColor whiteColor];
//    contentView.layer.cornerRadius = 8;
    //: [self.view addSubview:contentView];
    [self.view addSubview:contentView];
    //: contentView.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1];
    contentView.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1];
    //: contentView.layer.cornerRadius = 8;
    contentView.layer.cornerRadius = 8;
    //: contentView.layer.shadowColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.0800].CGColor;
    contentView.layer.shadowColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.0800].CGColor;
    //: contentView.layer.shadowOffset = CGSizeMake(0,3);
    contentView.layer.shadowOffset = CGSizeMake(0,3);
    //: contentView.layer.shadowOpacity = 1;
    contentView.layer.shadowOpacity = 1;
    //: contentView.layer.shadowRadius = 0;
    contentView.layer.shadowRadius = 0;

    //: self.contentTextView = [[UITextView alloc] initWithFrame:CGRectMake(15, 15, [[UIScreen mainScreen] bounds].size.width-60, 226)];
    self.contentTextView = [[UITextView alloc] initWithFrame:CGRectMake(15, 15, [[UIScreen mainScreen] bounds].size.width-60, 226)];
    //: self.contentTextView.textColor = [UIColor blackColor];
    self.contentTextView.textColor = [UIColor blackColor];
    //: self.contentTextView.font = [UIFont systemFontOfSize:16.f];
    self.contentTextView.font = [UIFont systemFontOfSize:16.f];
    //: self.contentTextView.delegate = self;
    self.contentTextView.delegate = self;
    //: self.contentTextView.placeholder = [NTESLanguageManager getTextWithKey:@"Please_enter_content"];
    self.contentTextView.placeholder = [MaxInformation off:StringFromMoleData(&str_invisibleData)];
    //: self.contentTextView.text = self.defaultContent;
    self.contentTextView.text = self.defaultContent;
    //: [contentView addSubview:self.contentTextView];
    [contentView addSubview:self.contentTextView];

    //: [self.view addSubview:self.numLabel];
    [self.view addSubview:self.numLabel];
    //: self.numLabel.text = [NSString stringWithFormat:@"%lu/512",(unsigned long)self.contentTextView.text.length];
    self.numLabel.text = [NSString stringWithFormat:StringFromMoleData(&str_searData),(unsigned long)self.contentTextView.text.length];
    //: self.numLabel.frame = CGRectMake(15, contentView.bottom+10, [[UIScreen mainScreen] bounds].size.width-30, 20);
    self.numLabel.frame = CGRectMake(15, contentView.bottom+10, [[UIScreen mainScreen] bounds].size.width-30, 20);

}

//: - (void)dealloc{
- (void)dealloc{
    //: [[NSNotificationCenter defaultCenter] removeObserver:self];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

//: - (void)backAction{
- (void)withItem{
    //: [self.navigationController popViewControllerAnimated:NO];
    [self.navigationController popViewControllerAnimated:NO];
}

//: - (void)textViewDidChange:(UITextView *)textView {
- (void)textViewDidChange:(UITextView *)textView {
    //: self.numLabel.text = [NSString stringWithFormat:@"%lu/400",textView.text.length];
    self.numLabel.text = [NSString stringWithFormat:StringFromMoleData(&str_auntValue),textView.text.length];
}


//: - (void)onSave:(id)sender {
- (void)bied:(id)sender {
    //: [self.contentTextView endEditing:YES];
    [self.contentTextView endEditing:YES];

    //: NSString *content = [self.contentTextView.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *content = [self.contentTextView.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];

    //: self.speiceBackBlock(content);
    self.speiceBackBlock(content);

    //: [self.navigationController popViewControllerAnimated:NO];
    [self.navigationController popViewControllerAnimated:NO];
//    if([self.delegate respondsToSelector:@selector(createTeamAnnouncementCompleteWithTitle:content:)]) {
//        [self.delegate createTeamAnnouncementCompleteWithTitle:title content:content];
//    }
}


//: - (UILabel *)numLabel{
- (UILabel *)numLabel{
    //: if (!_numLabel) {
    if (!_numLabel) {
        //: _numLabel = [[UILabel alloc] init];
        _numLabel = [[UILabel alloc] init];
        //: _numLabel.font = [UIFont systemFontOfSize:12.f];
        _numLabel.font = [UIFont systemFontOfSize:12.f];
        //: _numLabel.textAlignment = NSTextAlignmentRight;
        _numLabel.textAlignment = NSTextAlignmentRight;
        //: _numLabel.textColor = [UIColor colorWithHexString:@"#999999"];
        _numLabel.textColor = [UIColor direction:StringFromMoleData(&str_dirtyName)];
    }
    //: return _numLabel;
    return _numLabel;
}


//: @end
@end

Byte *MoleDataToByte(MoleData *data) {
    if (data->tingMedia) return data->enterpriseCell;
    for (int i = 0; i < data->sharedAttract; i++) {
        data->enterpriseCell[i] ^= data->elegantEnablely;
    }
    data->enterpriseCell[data->sharedAttract] = 0;
    data->tingMedia = true;
	if (data->sharedAttract >= 2) {
		data->way = data->enterpriseCell[0];
		data->labKing = data->enterpriseCell[1];
	}
    return data->enterpriseCell;
}

NSString *StringFromMoleData(MoleData *data) {
    return [NSString stringWithUTF8String:(char *)MoleDataToByte(data)];
}
