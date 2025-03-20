//
//  NTESSignSettingViewController.m
//  NIM
//
//  Created by Yan Wang on 2024/6/29.
//  Copyright © 2024 Netease. All rights reserved.
//

#import "NTESSignSettingViewController.h"
#import "SVProgressHUD.h"
#import "UIView+Toast.h"
#import "UITextView+Util.h"

@interface NTESSignSettingViewController ()<UITextViewDelegate>

@property (nonatomic, strong) NSString *signStr;
@property (nonatomic, strong) UITextView *textView;
@property (nonatomic, strong) UILabel *numLabel;

@end

@implementation NTESSignSettingViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setHidden:YES];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar setHidden:NO];
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.view.backgroundColor = [UIColor colorWithRed:243/255.0 green:242/255.0 blue:252/255.0 alpha:1.0];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_my"]];
    
    UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_TOP_HEIGHT)];
    [self.view addSubview:bgView];
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(5, SCREEN_STATUS_HEIGHT+4, 40, 40);
    [backButton setImage:[UIImage imageNamed:@"back_arrow_bl"] forState:(UIControlStateNormal)];
    [backButton addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    [bgView addSubview:backButton];
    
    UILabel *labtitle = [[UILabel alloc] initWithFrame:CGRectMake((SCREEN_WIDTH-200)/2, SCREEN_STATUS_HEIGHT+4, 200, 40)];
    labtitle.font = [UIFont boldSystemFontOfSize:16.f];
    labtitle.textColor = [UIColor blackColor];
    labtitle.textAlignment = NSTextAlignmentCenter;
    labtitle.text = LangKey(@"activity_set_bio_title");
    [bgView addSubview:labtitle];
    
    UIButton *submitButton = [UIButton buttonWithType:UIButtonTypeCustom];
    submitButton.frame = CGRectMake(SCREEN_WIDTH-15-40, SCREEN_STATUS_HEIGHT+4, 40, 40);
    [submitButton setImage:[UIImage imageNamed:@"icon_checkbox_selected"] forState:(UIControlStateNormal)];
    [submitButton addTarget:self action:@selector(onDone:) forControlEvents:UIControlEventTouchUpInside];
    [bgView addSubview:submitButton];

    NSString *userId = [[NIMSDK sharedSDK].loginManager currentAccount];
    self.signStr = [[NIMSDK sharedSDK].userManager userInfo:userId].userInfo.sign ?: @"";
 
    UIView *bgview = [[UIView alloc]initWithFrame:CGRectMake(15, SCREEN_TOP_HEIGHT+16+15, SCREEN_WIDTH-30, 150)];
    bgview.layer.borderWidth = 0.5;
    bgview.layer.borderColor = [UIColor colorWithRed:236/255.0 green:236/255.0 blue:236/255.0 alpha:1].CGColor;
    bgview.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1];
    bgview.layer.cornerRadius = 8;
    bgview.layer.shadowColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.0800].CGColor;
    bgview.layer.shadowOffset = CGSizeMake(0,3);
    bgview.layer.shadowOpacity = 1;
    bgview.layer.shadowRadius = 0;
    [self.view addSubview:bgview];
    
    
    [bgview addSubview:self.textView];
    self.textView.text = self.signStr;
    self.textView.frame = CGRectMake(15, 15, SCREEN_WIDTH-60, 120);

    
    [self.view addSubview:self.numLabel];
    self.numLabel.text = [NSString stringWithFormat:@"%lu/100",self.signStr.length];
    self.numLabel.frame = CGRectMake(15, bgview.bottom+10, SCREEN_WIDTH-30, 20);
    
}

- (void)backAction{
    [self.navigationController popViewControllerAnimated:NO];
}
- (void)onDone:(id)sender{
    [self.view endEditing:YES];
//    if (self.signStr.length > 100) {
//        [self.view makeToast:@"签名过长".nim_localized duration:2.0 position:CSToastPositionCenter];
//        return;
//    }
    [SVProgressHUD show];
    __weak typeof(self) wself = self;
    [[NIMSDK sharedSDK].userManager updateMyUserInfo:@{@(NIMUserInfoUpdateTagSign) : self.signStr} completion:^(NSError *error) {
        [SVProgressHUD dismiss];
        if (!error) {
            UINavigationController *nav = wself.navigationController;
            [nav popViewControllerAnimated:NO];
            UIViewController *vc = nav.topViewController;
            [vc.view makeToast:LangKey(@"user_profile_avtivity_user_info_update_success")
                         duration:2
                         position:CSToastPositionCenter];
        }else{
            [wself.view makeToast:LangKey(@"user_profile_avtivity_user_info_update_failed")
                         duration:2
                         position:CSToastPositionCenter];
        }
    }];
}



- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {

    NSString *genString = [textView.text stringByReplacingCharactersInRange:range withString:text];
    if (genString.length > 100) {
        return NO;
    }
    self.numLabel.text = [NSString stringWithFormat:@"%lu/100",genString.length+1];
    return YES;
}

- (void)textViewDidChange:(UITextView *)textView {
    self.signStr = textView.text;
    self.numLabel.text = [NSString stringWithFormat:@"%lu/100",self.signStr.length];
}

- (UITextView *)textView{
    if(!_textView){
        _textView = [[UITextView alloc]init];
        _textView.font = [UIFont systemFontOfSize:16.0];
        _textView.textColor = TextColor_4;
        _textView.placeholder = LangKey(@"activity_set_bio_title");
        _textView.delegate = self;
//        _textView.textContainerInset = UIEdgeInsetsMake(20, 20, 20, 20);
        
    }
    return _textView;
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
