//
//  ZMONFriendCardViewController.m
//  NIM
//
//  Created by Yan Wang on 2024/7/30.
//  Copyright © 2024 Netease. All rights reserved.
//

#import "ZMONFriendCardViewController.h"
#import "CCCCommonTableDelegate.h"
#import "CCCCommonTableData.h"
#import "UIView+Toast.h"
#import "SVProgressHUD.h"
#import "NTESColorButtonCell.h"
#import "UIView+NTES.h"
#import "NTESSessionViewController.h"
#import "NTESBundleSetting.h"
#import "UIAlertView+NTESBlock.h"
#import "NTESUserUtil.h"
#import "HMDataPicker.h"
#import "NTESOpinionBackViewController.h"

@interface ZMONFriendCardViewController ()<NIMUserManagerDelegate>


@property (nonatomic,copy  ) NSString                *userId;
@property (nonatomic,strong) NIMUser                 *user;


@property (nonatomic, strong) UIButton *closeBtn;
@property (nonatomic, strong) UIView *userView;
@property (nonatomic, strong) UIImageView *accountheadImg;
@property (nonatomic, strong) UILabel *accountNickname;
@property (nonatomic, strong) UILabel *accountId;
@property (nonatomic, strong) UILabel *account;

@property (nonatomic, strong) UIView *personView;

@end

@implementation ZMONFriendCardViewController

- (instancetype)initWithUserId:(NSString *)userId{
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        _userId = userId;
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setHidden:YES];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar setHidden:NO];
}

- (void)backAction{
    [self.navigationController popViewControllerAnimated:NO];
}
- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [[NIMSDK sharedSDK].userManager removeDelegate:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"common_bg"]];
    UIImageView *bg = [[UIImageView alloc]initWithFrame:self.view.bounds];
    bg.image = [UIImage imageNamed:@"common_bg"];
    [self.view addSubview:bg];
    
    self.closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.closeBtn.backgroundColor = [UIColor clearColor];
    [self.closeBtn setImage:[UIImage imageNamed:@"back_arrow_bl"] forState:(UIControlStateNormal)];
    [self.closeBtn addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.closeBtn];
    self.closeBtn.frame = CGRectMake(15, 4+SCREEN_STATUS_HEIGHT, 36, 36);
    
    self.user = [[NIMSDK sharedSDK].userManager userInfo:self.userId];
    
    self.accountheadImg = [[UIImageView alloc] initWithFrame:CGRectMake((SCREEN_WIDTH-120)/2, SCREEN_TOP_HEIGHT+30, 120, 120)];
    self.accountheadImg.layer.cornerRadius = 60;
    self.accountheadImg.layer.masksToBounds = YES;
    [self.view addSubview:self.accountheadImg];
    [self.accountheadImg sd_setImageWithURL:[NSURL URLWithString:self.user.userInfo.avatarUrl] placeholderImage:[UIImage imageNamed:@"head_default"]];

    self.accountNickname = [[UILabel alloc] initWithFrame:CGRectMake(15, self.accountheadImg.bottom+30, SCREEN_WIDTH-30, 20)];
    self.accountNickname.font = [UIFont boldSystemFontOfSize:18];
    self.accountNickname.textColor = [UIColor blackColor];
    self.accountNickname.text = self.user.userInfo.nickName;
    self.accountNickname.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.accountNickname];

    self.account = [[UILabel alloc] initWithFrame:CGRectMake(15, self.accountNickname.bottom+10, SCREEN_WIDTH-30, 15)];
    self.account.font = [UIFont systemFontOfSize:12];
    self.account.textColor = RGB_COLOR_String(@"#999999");
//    self.account.text = [NSString stringWithFormat:@"Account:%@",self.user.userId];
    self.account.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.account];
    

//    _personView = [[UIView alloc]initWithFrame:CGRectMake(15, self.account.bottom+30, SCREEN_WIDTH-30, 96)];
//    _personView.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1];
//    _personView.layer.borderWidth = 0.5;
//    _personView.layer.borderColor = [UIColor colorWithRed:236/255.0 green:236/255.0 blue:236/255.0 alpha:1].CGColor;
//    _personView.layer.cornerRadius = 10;
//    _personView.layer.shadowColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.0800].CGColor;
//    _personView.layer.shadowOffset = CGSizeMake(0,3);
//    _personView.layer.shadowOpacity = 1;
//    _personView.layer.shadowRadius = 0;
//    [self.view addSubview:_personView];
//
//    UIView *box1 = [[UIView alloc]initWithFrame:CGRectMake(15, 0, SCREEN_WIDTH-60, 48)];
//    box1.backgroundColor = [UIColor clearColor];
//    [_personView addSubview:box1];
//
//    UIImageView *image11 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ic_card_black"]];
//    image11.frame = CGRectMake(0, 15, 24, 24);
//    [box1 addSubview:image11];
//    UILabel *label11 = [[UILabel alloc] initWithFrame:CGRectMake(image11.right+12, image11.top, SCREEN_WIDTH-90-60, 24)];
//    label11.font = [UIFont systemFontOfSize:13.f];
//    label11.textColor = [UIColor blackColor];
//    label11.text = @"黑名单".nim_localized;
//    [box1 addSubview:label11];
//    UISwitch *switch11 = [[UISwitch alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-60-51, image11.top-3, 51, 31)];
//    switch11.onTintColor = RGB_COLOR_String(@"#0183FD");
//    [switch11 addTarget:self action:@selector(onActionBlackListValueChange:) forControlEvents:UIControlEventValueChanged];
//    [box1 addSubview:switch11];
//
//
//
//    UIView *box2 = [[UIView alloc]initWithFrame:CGRectMake(15, box1.bottom, SCREEN_WIDTH-60, 48)];
//    box2.backgroundColor = [UIColor clearColor];
//    [_personView addSubview:box2];
//
//    UIImageView *image12 = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ic_card_black"]];
//    image12.frame = CGRectMake(0, 15, 24, 24);
//    [box2 addSubview:image12];
//    UILabel *label12 = [[UILabel alloc] initWithFrame:CGRectMake(image12.right+12, image12.top, SCREEN_WIDTH-60-60, 24)];
//    label12.font = [UIFont systemFontOfSize:13.f];
//    label12.textColor = [UIColor blackColor];
//    label12.text = LangKey(@"report_activity_title");
//    [box2 addSubview:label12];
//    UIImageView *arrowright1 = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-60-12, 21, 12, 12)];
//    arrowright1.image = [UIImage imageNamed:@"btn_right"];
//    [box2 addSubview:arrowright1];
//
//    box2.userInteractionEnabled = YES;
//    UITapGestureRecognizer *singleTap2 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(reportsAction)];
//    [box2 addGestureRecognizer:singleTap2];
    

    UIButton *addBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    addBtn.frame = CGRectMake(15, self.account.bottom+30, SCREEN_WIDTH-30, 44);
    [addBtn addTarget:self action:@selector(sendAddFriendRequest) forControlEvents:UIControlEventTouchUpInside];
    addBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [addBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [addBtn setTitle:LangKey(@"add_friend_activity_add_friend") forState:UIControlStateNormal];
//    [addBtn setImage:[UIImage imageNamed:@"ic_down"] forState:UIControlStateNormal];
//    [addBtn layoutButtonWithEdgeInsetsStyle:(MKButtonEdgeInsetsStyleLeft) imageTitleSpace:10];
    addBtn.backgroundColor = ThemeColor;
    addBtn.layer.cornerRadius = 10;
    addBtn.layer.shadowColor = DeepBtnColor.CGColor;
    addBtn.layer.shadowOffset = CGSizeMake(0,3);
    addBtn.layer.shadowOpacity = 1;
    addBtn.layer.shadowRadius = 0;
    [self.view addSubview:addBtn];
 
    
    [[NIMSDK sharedSDK].userManager addDelegate:self];
    
    NSMutableDictionary *dict = @{}.mutableCopy;
    dict[@"user_id"] = self.userId;
    [ZCHttpManager getWithUrl:Server_user_detail params:dict isShow:NO success:^(id responseObject) {
        NSDictionary *resultDict = (NSDictionary *)responseObject;
        NSString *code = [resultDict newStringValueForKey:@"code"];
        if (code.integerValue <= 0) {
            NSDictionary *data = [resultDict valueObjectForKey:@"data"];
            NSString *account = [data newStringValueForKey:@"account"];
//            self.accountLabel.hidden = NO;
            self.account.text = [NSString stringWithFormat:@"%@：%@",LangKey(@"friend_info_activity_account"), account];
//            [self.accountLabel sizeToFit];
//            self.accountId.text = account;
        }

    } failed:^(id responseObject, NSError *error) {

    }];
    
}




- (void)refresh{
 
 
 
    
}




#pragma mark - Action

//
//-(void)onActionGroup:(id)sender{
//
//    [SVProgressHUD show];
//    [ZCHttpManager getWithUrl:Server_group_getgroups params:nil isShow:NO success:^(id responseObject) {
//        [SVProgressHUD dismissWithCompletion:^{
//            NSDictionary *resultDict = (NSDictionary *)responseObject;
//            NSString *code = [resultDict newStringValueForKey:@"code"];
//            if (code.integerValue == 0) {
//                NSArray *dataArray = [resultDict arrayValueForKey:@"data"];
//                NSDictionary *dataDict = [NSDictionary dictionaryWithObject:dataArray forKey:@"item_data"];
//                HMDataPicker *dataPick = [[HMDataPicker alloc] initWithDelegate:self dataDict:dataDict selectedDict:nil jsonNode:@"name"];
//                dataPick.tag = 500;
//                [dataPick show];
//            }
//        }];
//    } failed:^(id responseObject, NSError *error) {
//        [SVProgressHUD dismiss];
//        [self.view makeToast:LangKey(@"add_friend_request_fail")
//                    duration:2.0
//                    position:CSToastPositionCenter];
//    }];
//}



#pragma mark - HMDataPickerDelegate

- (void)onActionBlackListValueChange:(id)sender{
    
    [self onActionBlackListValueChange_1:sender];//SDK拉黑
//    [self requestBlackChanged:sender];
}
////拉黑信息同步
-(void)requestBlackChanged:(id)sender{
    UISwitch *switcher = sender;
    
    __weak typeof(self) wself = self;

    if (switcher.on) {
        NSMutableDictionary *dict = @{}.mutableCopy;
        dict[@"mobile"] = self.userId;
        dict[@"type"] =  kConstant_1;//拉入黑名单
        [wself refresh];

    }else{
        NSMutableDictionary *dict = @{}.mutableCopy;
        dict[@"mobile"] = self.userId;
        dict[@"type"] =  kConstant_0;//解除黑名单
        [wself refresh];

    }
}

- (void)onActionBlackListValueChange_1:(id)sender{
    UISwitch *switcher = sender;
    [SVProgressHUD show];
    __weak typeof(self) wself = self;
    if (switcher.on) {
        [[NIMSDK sharedSDK].userManager addToBlackList:self.userId completion:^(NSError *error) {
            [SVProgressHUD dismiss];
            if (!error) {
                [wself.view makeToast:LangKey(@"group_chat_avatar_activity_add_black_success") duration:2.0f position:CSToastPositionCenter];
            }else{
                [wself.view makeToast:LangKey(@"black_list_activity_add_black_failed") duration:2.0f position:CSToastPositionCenter];
                [wself refresh];
            }
        }];
    }else{
        [[NIMSDK sharedSDK].userManager removeFromBlackBlackList:self.userId completion:^(NSError *error) {
            [SVProgressHUD dismiss];
            if (!error) {
                [wself.view makeToast:LangKey(@"black_list_activity_remove_black") duration:2.0f position:CSToastPositionCenter];
            }else{
                [wself.view makeToast:LangKey(@"black_list_activity_remove_black_failed") duration:2.0f position:CSToastPositionCenter];
                [wself refresh];
            }
        }];
    }
}

- (void)onActionNeedNotifyValueChange:(id)sender{
    UISwitch *switcher = sender;
    [SVProgressHUD show];
    __weak typeof(self) wself = self;
    [[NIMSDK sharedSDK].userManager updateNotifyState:switcher.on forUser:self.userId completion:^(NSError *error) {            [SVProgressHUD dismiss];
        if (error) {
            [wself.view makeToast:LangKey(@"group_info_activity_op_failed") duration:2.0f position:CSToastPositionCenter];
            [wself refresh];
        }
    }];
}



-(void)sendAddFriendRequest{
    NSString *tempVerificationInfo = [NIMUserDefaults standardUserDefaults].tempVerificationInfo;
    NIMUserRequest *request = [[NIMUserRequest alloc] init];
    request.userId = self.userId;
    request.operation = NIMUserOperationAdd;
//    if ([[NTESBundleSetting sharedConfig] needVerifyForFriend]) {//需要验证
//        request.operation = NIMUserOperationRequest;
//        request.message = @"跪求通过".ntes_localized;
//    }
    request.operation = NIMUserOperationRequest;
    request.message = tempVerificationInfo.length > 0 ? tempVerificationInfo : @"";
    
    NSString *contact_tag_fragment_add_success = LangKey(@"contact_tag_fragment_add_success");//@"添加成功".ntes_localized
    NSString *request_successful = LangKey(@"request_successful");//@"请求成功".ntes_localized
    NSString *add_friend_add_fail = LangKey(@"add_friend_add_fail");//@"添加失败".ntes_localized
    NSString *add_friend_request_fail = LangKey(@"add_friend_request_fail");//@"请求失败".ntes_localized
    NSString *successText = request.operation == NIMUserOperationAdd ? contact_tag_fragment_add_success: request_successful;
    NSString *failedText =  request.operation == NIMUserOperationAdd ? add_friend_add_fail : add_friend_request_fail;
    
    __weak typeof(self) wself = self;
    [SVProgressHUD show];
    [[NIMSDK sharedSDK].userManager requestFriend:request completion:^(NSError *error) {
        [SVProgressHUD dismiss];
        if (!error) {
            [wself.view makeToast:successText
                         duration:2.0f
                         position:CSToastPositionCenter];
            [wself refresh];
        }else{
            [wself.view makeToast:failedText
                         duration:2.0f
                         position:CSToastPositionCenter];
        }
    }];
}





#pragma mark - NIMUserManagerDelegate

- (void)onUserInfoChanged:(NIMUser *)user
{
    if ([user.userId isEqualToString:self.userId]) {
        [self refresh];
    }
}

- (void)onFriendChanged:(NIMUser *)user{
    if ([user.userId isEqualToString:self.userId]) {
        [self refresh];
    }
}

- (void)onBlackListChanged{
    [self refresh];
}

- (void)onMuteListChanged
{
    [self refresh];
}



- (void)reportsAction {
    NTESOpinionBackViewController *vc = [[NTESOpinionBackViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}








@end
