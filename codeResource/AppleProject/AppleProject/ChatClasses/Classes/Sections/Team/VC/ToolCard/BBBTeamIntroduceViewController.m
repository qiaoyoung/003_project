//
//  BBBTeamIntroduceViewController.m
//  NIM
//
//  Created by Yan Wang on 2024/6/27.
//  Copyright © 2024 Netease. All rights reserved.
//

#import "BBBTeamIntroduceViewController.h"
#import "UITextView+Util.h"


@interface BBBTeamIntroduceViewController ()<UITextFieldDelegate, UITextViewDelegate>


@property (strong, nonatomic) UITextView *contentTextView;

@property (nonatomic, strong) UIButton *submitButton;

@property (nonatomic, strong) CAGradientLayer *gradientLayer;
@property (nonatomic,strong) UILabel *numLabel;

@end

@implementation BBBTeamIntroduceViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setHidden:YES];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.contentTextView endEditing:YES];
    [self.navigationController.navigationBar setHidden:NO];
}


- (void)viewDidLoad {
    [super viewDidLoad];
//    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"common_bg"]];
    UIImageView *bg = [[UIImageView alloc]initWithFrame:self.view.bounds];
    bg.image = [UIImage imageNamed:@"common_bg"];
    [self.view addSubview:bg];
    
    UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_TOP_HEIGHT)];
//    bgView.backgroundColor = [UIColor redColor];
    [self.view addSubview:bgView];
    
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(5, SCREEN_STATUS_HEIGHT+4, 40, 40);
    [backButton setImage:[UIImage imageNamed:@"back_arrow_bl"] forState:(UIControlStateNormal)];
    [backButton addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    [bgView addSubview:backButton];
    
    UILabel *labtitle = [[UILabel alloc] initWithFrame:CGRectMake((SCREEN_WIDTH-200)/2, SCREEN_STATUS_HEIGHT+4, 200, 40)];
    labtitle.font = [UIFont systemFontOfSize:16.f];
    labtitle.textColor = [UIColor blackColor];
    labtitle.textAlignment = NSTextAlignmentCenter;
    labtitle.text = LangKey(@"Group_description");
    [bgView addSubview:labtitle];
    
    UIButton *submitButton = [UIButton buttonWithType:UIButtonTypeCustom];
    submitButton.frame = CGRectMake(SCREEN_WIDTH-15-40, SCREEN_STATUS_HEIGHT+4, 40, 40);
    [submitButton setImage:[UIImage imageNamed:@"icon_checkbox_selected"] forState:(UIControlStateNormal)];
    [submitButton addTarget:self action:@selector(onSave:) forControlEvents:UIControlEventTouchUpInside];
    [bgView addSubview:submitButton];
    
    
    UIView *contentView = [[UIView alloc]initWithFrame:CGRectMake(15, SCREEN_TOP_HEIGHT+10, SCREEN_WIDTH-30, 256)];
//    contentView.backgroundColor = [UIColor whiteColor];
//    contentView.layer.cornerRadius = 8;
    [self.view addSubview:contentView];
    contentView.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1];
    contentView.layer.cornerRadius = 8;
    contentView.layer.shadowColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.0800].CGColor;
    contentView.layer.shadowOffset = CGSizeMake(0,3);
    contentView.layer.shadowOpacity = 1;
    contentView.layer.shadowRadius = 0;
    
    self.contentTextView = [[UITextView alloc] initWithFrame:CGRectMake(15, 15, SCREEN_WIDTH-60, 226)];
    self.contentTextView.textColor = [UIColor blackColor];
    self.contentTextView.font = [UIFont systemFontOfSize:16.f];
    self.contentTextView.delegate = self;
    self.contentTextView.placeholder = LangKey(@"Please_enter_content");
    self.contentTextView.text = self.defaultContent;
    [contentView addSubview:self.contentTextView];
    
    [self.view addSubview:self.numLabel];
    self.numLabel.text = [NSString stringWithFormat:@"%lu/512",(unsigned long)self.contentTextView.text.length];
    self.numLabel.frame = CGRectMake(15, contentView.bottom+10, SCREEN_WIDTH-30, 20);
    
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)backAction{
    [self.navigationController popViewControllerAnimated:NO];
}

- (void)textViewDidChange:(UITextView *)textView {
    self.numLabel.text = [NSString stringWithFormat:@"%lu/400",textView.text.length];
}


- (void)onSave:(id)sender {
    [self.contentTextView endEditing:YES];

    NSString *content = [self.contentTextView.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    self.speiceBackBlock(content);
    
    [self.navigationController popViewControllerAnimated:NO];
//    if([self.delegate respondsToSelector:@selector(createTeamAnnouncementCompleteWithTitle:content:)]) {
//        [self.delegate createTeamAnnouncementCompleteWithTitle:title content:content];
//    }
}


- (UILabel *)numLabel{
    if (!_numLabel) {
        _numLabel = [[UILabel alloc] init];
        _numLabel.font = [UIFont systemFontOfSize:12.f];
        _numLabel.textAlignment = NSTextAlignmentRight;
        _numLabel.textColor = TextColor_3;
    }
    return _numLabel;
}


@end
