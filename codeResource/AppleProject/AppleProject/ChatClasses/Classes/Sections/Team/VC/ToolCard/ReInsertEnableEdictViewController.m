
#import <Foundation/Foundation.h>

NSString *StringFromBadData(Byte *data);


//: icon_checkbox_selected
Byte str_crediblyBurdenValue[] = {2, 22, 97, 9, 11, 25, 221, 156, 176, 202, 196, 208, 207, 192, 196, 201, 198, 196, 204, 195, 208, 217, 192, 212, 198, 205, 198, 196, 213, 198, 197, 60};


//: #999999
Byte str_enforceData[] = {56, 7, 77, 7, 215, 230, 100, 112, 134, 134, 134, 134, 134, 134, 226};


//: %lu/400
Byte str_sendLuckyMathematicText[] = {18, 7, 74, 13, 164, 238, 217, 186, 89, 32, 146, 73, 25, 111, 182, 191, 121, 126, 122, 122, 221};


//: #AFB7BB
Byte str_genreName[] = {14, 7, 2, 7, 240, 12, 138, 37, 67, 72, 68, 57, 68, 68, 248};


//: back_arrow_bl
Byte str_eagerName[] = {39, 13, 23, 12, 85, 207, 238, 15, 229, 180, 170, 200, 121, 120, 122, 130, 118, 120, 137, 137, 134, 142, 118, 121, 131, 37};


//: Announcement_title
Byte str_tealTitle[] = {35, 18, 50, 4, 115, 160, 160, 161, 167, 160, 149, 151, 159, 151, 160, 166, 145, 166, 155, 166, 158, 151, 219};


//: common_bg
Byte str_blackSpeciallyName[] = {42, 9, 82, 7, 60, 150, 12, 181, 193, 191, 191, 193, 192, 177, 180, 185, 187};


//: Group_description
Byte str_definitionTitle[] = {7, 17, 86, 7, 150, 160, 58, 157, 200, 197, 203, 198, 181, 186, 187, 201, 185, 200, 191, 198, 202, 191, 197, 196, 117};


//: %lu/512
Byte str_thatAchingName[] = {82, 7, 65, 11, 241, 166, 152, 135, 37, 111, 157, 102, 173, 182, 112, 118, 114, 115, 45};


//: Please_enter_content
Byte str_nomeProofKingTitle[] = {15, 20, 68, 5, 43, 148, 176, 169, 165, 183, 169, 163, 169, 178, 184, 169, 182, 163, 167, 179, 178, 184, 169, 178, 184, 118};

// __DEBUG__
// __CLOSE_PRINT__
//
//  NTESCreateTeamAnnouncement.m
//  NIM
//
//  Created by Xuhui on 15/3/31.
//  Copyright (c) 2015年 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import "BBBCreateTeamAnnouncement.h"
#import "ReInsertEnableEdictViewController.h"
//: #import "UIViewNimKit.h"
#import "UIViewNimKit.h"
//: #import "CCCGlobalMacro.h"
#import "CCCGlobalMacro.h"
//: #import "BBBKitKeyboardInfo.h"
#import "TeamInfo.h"
//: #import "AppleProjectKit.h"
#import "Indicator.h"
//: #import "UITextView+Util.h"
#import "UITextView+Util.h"

//: @interface BBBCreateTeamAnnouncement () <UITextFieldDelegate, UITextViewDelegate>
@interface ReInsertEnableEdictViewController () <UITextFieldDelegate, UITextViewDelegate>
//: @property (strong, nonatomic) UITextField *titleTextField;
@property (strong, nonatomic) UITextField *titleTextField;
//: @property (strong, nonatomic) UITextView *contentTextView;
@property (strong, nonatomic) UITextView *contentTextView;

//: @property (nonatomic,strong) UIScrollView *scrollView;
@property (nonatomic,strong) UIScrollView *scrollView;
//: @property (nonatomic,strong) UILabel *numLabel;
@property (nonatomic,strong) UILabel *numLabel;

//: @end
@end

//: @implementation BBBCreateTeamAnnouncement
@implementation ReInsertEnableEdictViewController

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
    bg.image = [UIImage imageNamed:StringFromBadData(str_blackSpeciallyName)];
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
    [backButton setImage:[UIImage imageNamed:StringFromBadData(str_eagerName)] forState:(UIControlStateNormal)];
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
    labtitle.text = [MaxInformation off:StringFromBadData(str_definitionTitle)];
    //: [bgView addSubview:labtitle];
    [bgView addSubview:labtitle];

    //: UIButton *submitButton = [UIButton buttonWithType:UIButtonTypeCustom];
    UIButton *submitButton = [UIButton buttonWithType:UIButtonTypeCustom];
    //: submitButton.frame = CGRectMake([[UIScreen mainScreen] bounds].size.width-15-40, [UIDevice vg_statusBarHeight]+4, 40, 40);
    submitButton.frame = CGRectMake([[UIScreen mainScreen] bounds].size.width-15-40, [UIDevice task]+4, 40, 40);
    //: [submitButton setImage:[UIImage imageNamed:@"icon_checkbox_selected"] forState:(UIControlStateNormal)];
    [submitButton setImage:[UIImage imageNamed:StringFromBadData(str_crediblyBurdenValue)] forState:(UIControlStateNormal)];
    //: [submitButton addTarget:self action:@selector(onSave:) forControlEvents:UIControlEventTouchUpInside];
    [submitButton addTarget:self action:@selector(bied:) forControlEvents:UIControlEventTouchUpInside];
    //: [bgView addSubview:submitButton];
    [bgView addSubview:submitButton];


    //: UIView *titleView = [[UIView alloc]initWithFrame:CGRectMake(15, (44.0f + [UIDevice vg_statusBarHeight])+10, [[UIScreen mainScreen] bounds].size.width-30, 50)];
    UIView *titleView = [[UIView alloc]initWithFrame:CGRectMake(15, (44.0f + [UIDevice task])+10, [[UIScreen mainScreen] bounds].size.width-30, 50)];
//    titleView.backgroundColor = [UIColor whiteColor];
//    titleView.layer.cornerRadius = 8;
    //: [self.view addSubview:titleView];
    [self.view addSubview:titleView];
    //: titleView.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1];
    titleView.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1];
    //: titleView.layer.cornerRadius = 8;
    titleView.layer.cornerRadius = 8;
    //: titleView.layer.shadowColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.0800].CGColor;
    titleView.layer.shadowColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.0800].CGColor;
    //: titleView.layer.shadowOffset = CGSizeMake(0,3);
    titleView.layer.shadowOffset = CGSizeMake(0,3);
    //: titleView.layer.shadowOpacity = 1;
    titleView.layer.shadowOpacity = 1;
    //: titleView.layer.shadowRadius = 0;
    titleView.layer.shadowRadius = 0;


        //: self.titleTextField = [[UITextField alloc] initWithFrame:CGRectMake(15, 10, [[UIScreen mainScreen] bounds].size.width-60, 30)];
        self.titleTextField = [[UITextField alloc] initWithFrame:CGRectMake(15, 10, [[UIScreen mainScreen] bounds].size.width-60, 30)];
        //: self.titleTextField.placeholder = [NTESLanguageManager getTextWithKey:@"Announcement_title"];
        self.titleTextField.placeholder = [MaxInformation off:StringFromBadData(str_tealTitle)];
        //: self.titleTextField.font = [UIFont systemFontOfSize:16.f];
        self.titleTextField.font = [UIFont systemFontOfSize:16.f];
        //: self.titleTextField.textColor = [UIColor colorWithHexString:@"#AFB7BB"];
        self.titleTextField.textColor = [UIColor direction:StringFromBadData(str_genreName)];
        //: self.titleTextField.text = self.defaultTitle;
        self.titleTextField.text = self.defaultTitle;
        //: self.titleTextField.delegate = self;
        self.titleTextField.delegate = self;
        //: [titleView addSubview:self.titleTextField];
        [titleView addSubview:self.titleTextField];

    //: UIView *contentView = [[UIView alloc]initWithFrame:CGRectMake(15, titleView.bottom+10, [[UIScreen mainScreen] bounds].size.width-30, 200)];
    UIView *contentView = [[UIView alloc]initWithFrame:CGRectMake(15, titleView.bottom+10, [[UIScreen mainScreen] bounds].size.width-30, 200)];
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

    //: self.contentTextView = [[UITextView alloc] initWithFrame:CGRectMake(15, 15, [[UIScreen mainScreen] bounds].size.width-60, 170)];
    self.contentTextView = [[UITextView alloc] initWithFrame:CGRectMake(15, 15, [[UIScreen mainScreen] bounds].size.width-60, 170)];
    //: self.contentTextView.textColor = [UIColor blackColor];
    self.contentTextView.textColor = [UIColor blackColor];
    //: self.contentTextView.font = [UIFont systemFontOfSize:17.f];
    self.contentTextView.font = [UIFont systemFontOfSize:17.f];
    //: self.contentTextView.delegate = self;
    self.contentTextView.delegate = self;
    //: self.contentTextView.placeholder = [NTESLanguageManager getTextWithKey:@"Please_enter_content"];
    self.contentTextView.placeholder = [MaxInformation off:StringFromBadData(str_nomeProofKingTitle)];
    //: self.contentTextView.text = self.defaultContent;
    self.contentTextView.text = self.defaultContent;
    //: [contentView addSubview:self.contentTextView];
    [contentView addSubview:self.contentTextView];

    //: [self.view addSubview:self.numLabel];
    [self.view addSubview:self.numLabel];
    //: self.numLabel.text = [NSString stringWithFormat:@"%lu/512",(unsigned long)self.contentTextView.text.length];
    self.numLabel.text = [NSString stringWithFormat:StringFromBadData(str_thatAchingName),(unsigned long)self.contentTextView.text.length];
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
    self.numLabel.text = [NSString stringWithFormat:StringFromBadData(str_sendLuckyMathematicText),textView.text.length];
}


//: - (void)onSave:(id)sender {
- (void)bied:(id)sender {
    //: [self.titleTextField endEditing:YES];
    [self.titleTextField endEditing:YES];
    //: [self.contentTextView endEditing:YES];
    [self.contentTextView endEditing:YES];
    //: NSString *title = [self.titleTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *title = [self.titleTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    //: NSString *content = [self.contentTextView.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *content = [self.contentTextView.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    //: [self.navigationController popViewControllerAnimated:NO];
    [self.navigationController popViewControllerAnimated:NO];
    //: if([self.delegate respondsToSelector:@selector(createTeamAnnouncementCompleteWithTitle:content:)]) {
    if([self.delegate respondsToSelector:@selector(ground:textFor:)]) {
        //: [self.delegate createTeamAnnouncementCompleteWithTitle:title content:content];
        [self.delegate ground:title textFor:content];
    }
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
        _numLabel.textColor = [UIColor direction:StringFromBadData(str_enforceData)];
    }
    //: return _numLabel;
    return _numLabel;
}



//: @end
@end

Byte * BadDataToCache(Byte *data) {
    int curiousOy = data[0];
    int fishWith = data[1];
    Byte take = data[2];
    int correlationGlobal = data[3];
    if (!curiousOy) return data + correlationGlobal;
    for (int i = correlationGlobal; i < correlationGlobal + fishWith; i++) {
        int value = data[i] - take;
        if (value < 0) {
            value += 256;
        }
        data[i] = value;
    }
    data[0] = 0;
    data[correlationGlobal + fishWith] = 0;
    return data + correlationGlobal;
}

NSString *StringFromBadData(Byte *data) {
    return [NSString stringWithUTF8String:(char *)BadDataToCache(data)];
}
