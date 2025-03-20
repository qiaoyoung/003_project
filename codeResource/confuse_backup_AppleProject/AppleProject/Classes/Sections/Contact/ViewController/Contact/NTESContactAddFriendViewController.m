//
//  NTESContactAddFriendViewController.m
//  NIM
//
//  Created by chris on 15/8/18.
//  Copyright (c) 2015年 Netease. All rights reserved.
//

#import "NTESContactAddFriendViewController.h"
#import "NTESContactAddFriendCell.h"
#import "UIView+Toast.h"
#import "SVProgressHUD.h"
#import "NTESPersonalCardViewController.h"
#import "NTESUserQRCodeViewController.h"
#import "SNDevice.h"
#import "CCCLoginManager.h"
#import "UIAlertView+NTESBlock.h"
#import "UIView+NTES.h"
#import "LCQRCodeUtil.h"
#import <Photos/Photos.h>
#import "CCCContactScanViewController.h"
#import "ZMONMyQRcodeView.h"
#import "ZMONFriendCardViewController.h"

@interface NTESContactAddFriendViewController ()<UITextFieldDelegate>

@property (nonatomic ,strong) UITextField *textField;
@property (nonatomic ,strong) UILabel *accountLabel;
@property (nonatomic ,strong) UIImageView *qrImgview;
@property (nonatomic ,strong) UILabel *tipsLabel;

@property (nonatomic ,strong) ZMONMyQRcodeView *MyQRcodeView;

@end

@implementation NTESContactAddFriendViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"common_bg"]];
    UIImageView *bg = [[UIImageView alloc]initWithFrame:self.view.bounds];
    bg.image = [UIImage imageNamed:@"common_bg"];
    [self.view addSubview:bg];
    
    UIView *navview = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_TOP_HEIGHT)];
    [self.view addSubview:navview];
    
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(15, SCREEN_STATUS_HEIGHT, 40, 40);
    [backBtn addTarget:self action:@selector(gotoBack:) forControlEvents:UIControlEventTouchUpInside];
    [backBtn setImage:[UIImage imageNamed:@"back_arrow_bl"] forState:UIControlStateNormal];
    [navview addSubview:backBtn];
    
    UILabel *labNavtitle = [[UILabel alloc]initWithFrame:CGRectMake(0, SCREEN_STATUS_HEIGHT, SCREEN_WIDTH, 44)];
    labNavtitle.textColor = [UIColor blackColor];
    labNavtitle.font = [UIFont boldSystemFontOfSize:16];
    labNavtitle.text = LangKey(@"add_friend_activity_add_friend");
    labNavtitle.textAlignment = NSTextAlignmentCenter;
    [navview addSubview:labNavtitle];
    
    UIView *topview = [[UIView alloc]initWithFrame:CGRectMake(15, SCREEN_TOP_HEIGHT+20, SCREEN_WIDTH-30, 175)];
//    topview.backgroundColor = [UIColor whiteColor];
//    topview.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"search_bg"]];
    topview.layer.cornerRadius = 12;
    [self.view addSubview:topview];
    
    UIImageView *headerImage = [[UIImageView alloc] initWithFrame:topview.bounds];
    headerImage.image = [UIImage imageNamed:@"search_bg"];
    [topview addSubview:headerImage];


    UIView *searchView = [[UIView alloc]initWithFrame:CGRectMake(15, 30, SCREEN_WIDTH-60, 44)];
    searchView.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1];
    searchView.layer.cornerRadius = 8;
    searchView.layer.shadowColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.0800].CGColor;
    searchView.layer.shadowOffset = CGSizeMake(0,3);
    searchView.layer.shadowOpacity = 1;
    searchView.layer.shadowRadius = 0;
    [topview addSubview:searchView];
    
    [searchView addSubview:self.textField];
    self.textField.frame = CGRectMake(15, 0, SCREEN_WIDTH-60-30, 44);
    
    
    UIButton *btnSearch = [UIButton buttonWithType:UIButtonTypeCustom];
    btnSearch.frame = CGRectMake(15, 100, SCREEN_WIDTH-60, 44);
    [btnSearch setImage:[UIImage imageNamed:@"icon_search_w"] forState:UIControlStateNormal];
    [btnSearch setTitle:LangKey(@"add_friend_activity_search") forState:UIControlStateNormal];
    [btnSearch addTarget:self action:@selector(doneSearch) forControlEvents:UIControlEventTouchUpInside];
    [btnSearch layoutButtonWithEdgeInsetsStyle:(MKButtonEdgeInsetsStyleLeft) imageTitleSpace:10];
    btnSearch.backgroundColor = ThemeColor;
    btnSearch.layer.cornerRadius = 10;
    btnSearch.layer.shadowColor = DeepBtnColor.CGColor;
    btnSearch.layer.shadowOffset = CGSizeMake(0,3);
    btnSearch.layer.shadowOpacity = 1;
    btnSearch.layer.shadowRadius = 0;
    [topview addSubview:btnSearch];
    
    CGFloat wight = (SCREEN_WIDTH-45)/2;
    
    UIView *qrView = [[UIView alloc]initWithFrame:CGRectMake(15, topview.bottom+20, wight, 96)];
    qrView.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1];
    qrView.layer.borderWidth = 1;
    qrView.layer.borderColor = [UIColor colorWithRed:236/255.0 green:236/255.0 blue:236/255.0 alpha:1].CGColor;
    qrView.layer.cornerRadius = 8;
    qrView.layer.shadowColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.0800].CGColor;
    qrView.layer.shadowOffset = CGSizeMake(0,3);
    qrView.layer.shadowOpacity = 1;
    qrView.layer.shadowRadius = 0;
    [self.view addSubview:qrView];
    qrView.userInteractionEnabled = YES;
    UITapGestureRecognizer *singleTap1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(QRCodeButtnClick)];
    [qrView addGestureRecognizer:singleTap1];
    
    UIButton *btnQr = [UIButton buttonWithType:UIButtonTypeCustom];
    btnQr.layer.cornerRadius = 22;
    [btnQr addTarget:self action:@selector(QRCodeButtnClick) forControlEvents:UIControlEventTouchUpInside];
    btnQr.frame = CGRectMake((wight-44)/2, 12, 44, 44);
    [btnQr setImage:[UIImage imageNamed:@"my_qr"] forState:UIControlStateNormal];
    [qrView addSubview:btnQr];
    
    UILabel *labQr = [[UILabel alloc]initWithFrame:CGRectMake(0, btnQr.bottom+10, wight, 20)];
    labQr.text = LangKey(@"qrcode_activity_title");
    labQr.font = [UIFont systemFontOfSize:14];
    labQr.textColor = [UIColor blackColor];
    labQr.textAlignment = NSTextAlignmentCenter;
    [qrView addSubview:labQr];
    
    UIView *scanView = [[UIView alloc]initWithFrame:CGRectMake(30+wight, topview.bottom+20, wight, 96)];
    scanView.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1];
    scanView.layer.borderWidth = 1;
    scanView.layer.borderColor = [UIColor colorWithRed:236/255.0 green:236/255.0 blue:236/255.0 alpha:1].CGColor;
    scanView.layer.cornerRadius = 8;
    scanView.layer.shadowColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.0800].CGColor;
    scanView.layer.shadowOffset = CGSizeMake(0,3);
    scanView.layer.shadowOpacity = 1;
    scanView.layer.shadowRadius = 0;
    [self.view addSubview:scanView];
    scanView.userInteractionEnabled = YES;
    UITapGestureRecognizer *singleTap2 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(scan)];
    [scanView addGestureRecognizer:singleTap2];
    
    UIButton *btnScan = [UIButton buttonWithType:UIButtonTypeCustom];
    btnScan.layer.cornerRadius = 22;
    [btnScan addTarget:self action:@selector(scan) forControlEvents:UIControlEventTouchUpInside];
    btnScan.frame = CGRectMake((wight-44)/2, 12, 44, 44);
    [btnScan setImage:[UIImage imageNamed:@"qr_scan"] forState:UIControlStateNormal];
    [scanView addSubview:btnScan];
    
    UILabel *labScan = [[UILabel alloc]initWithFrame:CGRectMake(0, btnScan.bottom+10, wight, 20)];
    labScan.text = LangKey(@"ScanQRcode");
    labScan.font = [UIFont systemFontOfSize:14];
    labScan.textColor = [UIColor blackColor];
    labScan.textAlignment = NSTextAlignmentCenter;
    [scanView addSubview:labScan];
    
    UILabel *labTip = [[UILabel alloc]initWithFrame:CGRectMake(0, qrView.bottom+24, SCREEN_WIDTH, 20)];
    labTip.text = LangKey(@"friendrequestsin_contacts");
    labTip.font = [UIFont boldSystemFontOfSize:12];
    labTip.textColor = TextColor_3;
    labTip.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:labTip];
    
}

- (void)gotoBack:(id)sender {
    [self.navigationController popViewControllerAnimated:NO];
}

- (void)QRCodeButtnClick
{
    [self.view addSubview:self.MyQRcodeView];
    [self.MyQRcodeView animationShow];
}

-(void)scan{
    CCCContactScanViewController *vc = [[CCCContactScanViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)doneSearch{
    [self goSearch:_textField];
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self goSearch:textField];
    return YES;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    return YES;
}

-(void)goSearch:(UITextField *)textField{
    [self.view endEditing:YES];
    NSString *userId = [textField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    if (userId.length) {
        userId = [userId lowercaseString];
        [self addFriend:userId];
    }
}

- (UITextField *)textField{
    if(!_textField){
        _textField = [[UITextField alloc]init];
        _textField.placeholder = LangKey(@"add_friend_activity_input_account");
        _textField.textColor = TextColor_4;
        _textField.font = [UIFont systemFontOfSize:14];
        _textField.delegate = self;
        _textField.returnKeyType = UIReturnKeyDone;
    }
    return _textField;
}

#pragma mark - Private
- (void)addFriend:(NSString *)userId
{
    __weak typeof(self) wself = self;
    NSMutableDictionary *dict = @{}.mutableCopy;
    [dict setObject:userId forKey:@"account"];
    [ZCHttpManager getWithUrl:Server_user_search params:dict isShow:YES success:^(id responseObject) {
        NSDictionary *resultDict = (NSDictionary *)responseObject;
        NSString *code = [resultDict newStringValueForKey:@"code"];
        NSString *msg = [resultDict newStringValueForKey:@"msg"];

        if (code.integerValue <= 0) {
            NSDictionary *data = [resultDict valueObjectForKey:@"data"];
            NSString *uid = [data newStringValueForKey:@"uid"];
            [wself sendAddrequest:uid];

        }else {

            [SVProgressHUD showMessage:msg];

        }
    } failed:^(id responseObject, NSError *error) {

    }];

}

-(void)sendAddrequest:(NSString *)uid{
    __weak typeof(self) wself = self;
    [[NIMSDK sharedSDK].userManager fetchUserInfos:@[uid] completion:^(NSArray *users, NSError *error) {
        [SVProgressHUD dismiss];
        if (users.count) {
            [self checkIsAdmin:uid];
        }else{
            if (wself) {
                [wself.view makeToast:LangKey(@"group_info_activity_number_no") duration:2.0 position:CSToastPositionCenter];
            }
        }
    }];
}

-(void)checkIsAdmin:(NSString *)userId{

    __weak typeof(self) wself = self;
    NSMutableDictionary *dict = @{}.mutableCopy;
    dict[@"fuid"] = [[NIMSDK sharedSDK].loginManager currentAccount];
    dict[@"tuid"] = userId;

    [ZCHttpManager getWithUrl:Server_user_checkAddFriendEx params:dict isShow:NO success:^(id responseObject) {
        NSDictionary *resultDict = (NSDictionary *)responseObject;
        NSString *code = [resultDict newStringValueForKey:@"code"];
        if (code.integerValue == 0) {
            //跳转详情
            ZMONFriendCardViewController *vc = [[ZMONFriendCardViewController alloc] initWithUserId:userId];
            [wself.navigationController pushViewController:vc animated:YES];
        }else{
            [wself.view makeToast:LangKey(@"please_contact_your_administrator") duration:2.0 position:CSToastPositionCenter];
        }
    } failed:^(id responseObject, NSError *error) {
        [wself.view makeToast:LangKey(@"please_contact_your_administrator") duration:2.0 position:CSToastPositionCenter];
    }];
}

- (ZMONMyQRcodeView *)MyQRcodeView
{
    if(!_MyQRcodeView){
        _MyQRcodeView = [[ZMONMyQRcodeView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    }
    return _MyQRcodeView;
}

@end
