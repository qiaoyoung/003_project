//
//  NTESPersonCardViewController.m
//  NIM
//
//  Created by chris on 15/8/18.
//  Copyright (c) 2015年 Netease. All rights reserved.
//

#import "NTESPersonalCardViewController.h"
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
#import "CCCRemarksView.h"
#import "NTESOpinionBackViewController.h"
#import "ZMONReportUserView.h"
#import "ZMONReportNextView.h"
#import "ZMONReportBlackView.h"
#import "ZMONReportDeleteView.h"

@interface NTESPersonalCardViewController ()<NIMUserManagerDelegate,HMDataPickerDelegate,NTESReportDelegate,NTESReportNextDelegate>

@property (nonatomic,strong) CCCCommonTableDelegate *delegator;

@property (nonatomic,copy  ) NSArray                 *data;

@property (nonatomic,copy  ) NSString                *userId;

@property (nonatomic,strong) NIMUser                 *user;

@property (nonatomic,strong) UILongPressGestureRecognizer *longPressGesture;

@property (nonatomic, strong) UIButton *closeBtn;
@property (nonatomic, strong) UIView *userView;
@property (nonatomic, strong) UIImageView *accountheadImg;
@property (nonatomic, strong) UILabel *accountNickname;
@property (nonatomic, strong) UILabel *accountId;
@property (nonatomic, strong) UILabel *account;

@property (nonatomic, strong) UIView *personView;
@property (strong, nonatomic)  UIButton *btnDelete;
@property (strong, nonatomic)  UIButton *btnChat;
@property (strong, nonatomic)  UISwitch *switchNotice;
@property (strong, nonatomic)  UISwitch *switchBlack;
@property (strong, nonatomic)  UIButton *btnRes;
@property (strong, nonatomic)  UIButton *btnReport;
@property (strong, nonatomic)  UILabel *labRemark;
@property (strong, nonatomic)  UILabel *labTitleRemark;
@property (strong, nonatomic)  UILabel *labTitlenotice;
@property (strong, nonatomic)  UILabel *labTitleBlack;
@property (strong, nonatomic)  UILabel *labTitleResport;
@property (strong, nonatomic)  UIButton *btnAdd;
@property (strong, nonatomic)  UILabel *labSign;
@property (strong, nonatomic)  UILabel *labTitSign;

@property (nonatomic, strong) ZMONReportUserView *reprotView;
@property (nonatomic, strong) CCCRemarksView *changeRemarksView;
@property (nonatomic, strong) ZMONCustomLoadingView *loadingView;
@property (nonatomic, strong) ZMONReportNextView *reprotNextView;
@property (nonatomic, strong) ZMONReportBlackView *reprotBlackView;
@property (nonatomic, strong) ZMONReportDeleteView *reprotDeleteView;

@end

@implementation NTESPersonalCardViewController

- (instancetype)initWithUserId:(NSString *)userId{
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        _userId = userId;
    }
    return self;
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [[NIMSDK sharedSDK].userManager removeDelegate:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self setUpNav];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.userView];
    self.userView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 375);
    
    [self.view addSubview:self.personView];
    self.personView.frame = CGRectMake(0, 375, SCREEN_WIDTH, 375);
    
    [self.view addSubview:self.loadingView];
    self.loadingView.hidden = YES;
    
    [self refresh];
    
    [[NIMSDK sharedSDK].userManager addDelegate:self];
    
    NSMutableDictionary *dict = @{}.mutableCopy;
    dict[@"user_id"] = self.userId;
    [ZCHttpManager getWithUrl:Server_user_detail params:dict isShow:NO success:^(id responseObject) {
        NSDictionary *resultDict = (NSDictionary *)responseObject;
        NSString *code = [resultDict newStringValueForKey:@"code"];
        if (code.integerValue <= 0) {
            NSDictionary *data = [resultDict valueObjectForKey:@"data"];
            NSString *account = [data newStringValueForKey:@"account"];
            NSString *avatar = [data newStringValueForKey:@"avatar"];
            
            self.accountId.text = account;
            [self.accountheadImg sd_setImageWithURL:[NSURL URLWithString:avatar] placeholderImage:[UIImage imageNamed:@"head_default"]];
        }

    } failed:^(id responseObject, NSError *error) {

    }];
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setHidden:YES];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar setHidden:NO];
}

- (void)refresh{
 
    self.user = [[NIMSDK sharedSDK].userManager userInfo:self.userId];
    BOOL isMe          = [self.userId isEqualToString:[NIMSDK sharedSDK].loginManager.currentAccount];
    BOOL isMyFriend    = [[NIMSDK sharedSDK].userManager isMyFriend:self.userId];
    BOOL isInBlackList = [[NIMSDK sharedSDK].userManager isUserInBlackList:self.userId];
    BOOL needNotify    = [[NIMSDK sharedSDK].userManager notifyForNewMsg:self.userId];
    
    if(isMyFriend){
        self.btnAdd.hidden = YES;
        self.btnDelete.hidden = NO;
    }else{
        self.btnAdd.hidden = NO;
        self.btnDelete.hidden = YES;
    }
    self.switchBlack.on = isInBlackList;
    self.switchNotice.on = needNotify;
    
    self.labRemark.text = self.user.alias.length ? self.user.alias : LangKey(@"未设置");
    self.labSign.text = self.user.userInfo.sign.length ? self.user.userInfo.sign : LangKey(@"未设置");
    
}

- (void)backAction{
    [self.navigationController popViewControllerAnimated:NO];
}

#pragma mark - Action


-(void)onActionGroup:(id)sender{
    
//    [SVProgressHUD show];
    [self.loadingView animationShow];
    [ZCHttpManager getWithUrl:Server_group_getgroups params:nil isShow:NO success:^(id responseObject) {
        [self.loadingView animationClose];
//        [SVProgressHUD dismissWithCompletion:^{
            NSDictionary *resultDict = (NSDictionary *)responseObject;
            NSString *code = [resultDict newStringValueForKey:@"code"];
            if (code.integerValue == 0) {
                NSArray *dataArray = [resultDict arrayValueForKey:@"data"];
                NSDictionary *dataDict = [NSDictionary dictionaryWithObject:dataArray forKey:@"item_data"];
                HMDataPicker *dataPick = [[HMDataPicker alloc] initWithDelegate:self dataDict:dataDict selectedDict:nil jsonNode:@"name"];
                dataPick.tag = 500;
                [dataPick show];
            }
//        }];
    } failed:^(id responseObject, NSError *error) {
//        [SVProgressHUD dismiss];
        [self.loadingView animationClose];
        [self.view makeToast:LangKey(@"add_friend_request_fail")
                    duration:2.0
                    position:CSToastPositionCenter];
    }];
}



#pragma mark - HMDataPickerDelegate
- (void)dataPicker:(HMDataPicker *)dataPicker selectedDict:(NSDictionary *)selectedDict{
    _groupDict = selectedDict;
    [self refresh];
    [self setingGroup];//设置分组

}

- (void)onActionEditAlias:(id)sender{
//    NTESAliasSettingViewController *vc = [[NTESAliasSettingViewController alloc] initWithUserId:self.userId];
//    [self.navigationController pushViewController:vc animated:YES];
}

- (void)onActionEditMyInfo:(id)sender{
//    NTESUserInfoSettingViewController *vc = [[NTESUserInfoSettingViewController alloc] initWithNibName:nil bundle:nil];
//    [self.navigationController pushViewController:vc animated:YES];
}

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
//    [SVProgressHUD show];
    [self.loadingView animationShow];
    __weak typeof(self) wself = self;
    if (switcher.on) {
        [[NIMSDK sharedSDK].userManager addToBlackList:self.userId completion:^(NSError *error) {
//            [SVProgressHUD dismiss];
            [self.loadingView animationClose];
            if (!error) {
                [wself.view makeToast:LangKey(@"group_chat_avatar_activity_add_black_success") duration:2.0f position:CSToastPositionCenter];
            }else{
                [wself.view makeToast:LangKey(@"black_list_activity_add_black_failed") duration:2.0f position:CSToastPositionCenter];
                [wself refresh];
            }
        }];
    }else{
        [[NIMSDK sharedSDK].userManager removeFromBlackBlackList:self.userId completion:^(NSError *error) {
//            [SVProgressHUD dismiss];
            [self.loadingView animationClose];
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
//    [SVProgressHUD show];
    [self.loadingView animationShow];
    __weak typeof(self) wself = self;
    [[NIMSDK sharedSDK].userManager updateNotifyState:switcher.on forUser:self.userId completion:^(NSError *error) {
//        [SVProgressHUD dismiss];
        [self.loadingView animationClose];
        if (error) {
            [wself.view makeToast:LangKey(@"group_info_activity_op_failed") duration:2.0f position:CSToastPositionCenter];
            [wself refresh];
        }
    }];
}


- (void)btnchat{
//    if (_teamSetingConfig != nil) {
//        NSString *tprivate = [_teamSetingConfig newStringValueForKey:@"tprivate"];
//        if (tprivate.integerValue <= 0) {
//            [SVProgressHUD showMessage:LangKey(@"暂未开放,请联系管理员")];
//            return;
//        }
//    }
    
    UINavigationController *nav = self.navigationController;
    NIMSession *session = [NIMSession session:self.userId type:NIMSessionTypeP2P];
    NTESSessionViewController *vc = [[NTESSessionViewController alloc] initWithSession:session];
    [nav pushViewController:vc animated:YES];
    UIViewController *root = nav.viewControllers[0];
    nav.viewControllers = @[root,vc];
}

- (void)btnvideo{
    

}

- (void)btnvoice{
   
    
}

//加好友
-(void)addFriend{
    
    if (_teamSetingConfig != nil) {
        NSString *canAddFriend = [_teamSetingConfig newStringValueForKey:@"canAddFriend"];
        if (canAddFriend.integerValue <= 0) {
            [SVProgressHUD showMessage:LangKey(@"please_contact_your_administrator")];
            return;
        }
    }
    
    [self sendAddFriendRequest];//添加好友

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
//    [SVProgressHUD show];
    [self.loadingView animationShow];
    
    [[NIMSDK sharedSDK].userManager requestFriend:request completion:^(NSError *error) {
//        [SVProgressHUD dismiss];
        [self.loadingView animationClose];
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

//分组网络请求
-(void)setingGroup{
    
    BOOL isMyFriend    = [[NIMSDK sharedSDK].userManager isMyFriend:self.userId];

    NSMutableDictionary *dict = @{}.mutableCopy;
    dict[@"group_id"] = [_groupDict newStringValueForKey:@"id"];
    dict[@"friend_ids"] = self.user.userId;
    dict[@"isfrend"] = isMyFriend?kConstant_1:kConstant_0;
    
    [ZCHttpManager getWithUrl:Server_group_addgroupuser params:dict isShow:YES success:^(id responseObject) {
        NSDictionary *resultDict = (NSDictionary *)responseObject;
        NSLog(@"-----%@",resultDict);
    } failed:^(id responseObject, NSError *error) {
        
    }];
    
}

- (void)deleteFriend{
    __weak typeof(self) wself = self;//@"删除好友后，将同时解除双方的好友关系"
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:LangKey(@"user_profile_avtivity_remove_friend") message:LangKey(@"user_profile_avtivity_remove_friend_tip") delegate:nil cancelButtonTitle:LangKey(@"contact_tag_fragment_cancel") otherButtonTitles:LangKey(@"contact_tag_fragment_sure"), nil];
    [alert showAlertWithCompletionHandler:^(NSInteger index) {
        if (index == 1) {
//            [SVProgressHUD show];
            [self.loadingView animationShow];

            
            
            [[NIMSDK sharedSDK].userManager deleteFriend:wself.userId
                                             removeAlias:[[NTESBundleSetting sharedConfig] autoRemoveAlias]
                                              completion:^(NSError *error) {
//                [SVProgressHUD dismiss];
                [self.loadingView animationClose];
                if (!error) {
                    [wself.view makeToast:LangKey(@"contact_tag_fragment_delete_success") duration:2.0f position:CSToastPositionCenter];
                    [wself refresh];
                }else{
                    [wself.view makeToast:LangKey(@"friend_delete_fail") duration:2.0f position:CSToastPositionCenter];
                }
            }];
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

- (void)onActionEditAlias{
    
    [self.view addSubview:self.changeRemarksView];
    [ self.changeRemarksView reloadWithNickname: self.user];
    [self.changeRemarksView animationShow];
}

- (void)reportsAction {
    [self.view addSubview:self.reprotView];
    [self.reprotView animationShow];
//    NTESOpinionBackViewController *vc = [[NTESOpinionBackViewController alloc]init];
//    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - Private 
- (void)onLongPressNavbar:(UIGestureRecognizer *)gesture{
    if (gesture.state == UIGestureRecognizerStateBegan) {
        NSString *title = self.user.description;
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:LangKey(@"my_user_info_activity_title") message:title delegate:nil cancelButtonTitle:LangKey(@"contact_tag_fragment_sure") otherButtonTitles:nil, nil];
        [alert show];
    }
}

#pragma mark - 旋转处理 (iOS7)
- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
    [self.tableView reloadData];
}

- (UIView *)userView
{
    if(!_userView){
        _userView = [[UIView alloc] init];
        self.user = [[NIMSDK sharedSDK].userManager userInfo:self.userId];
        _userView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"personCard_bg"]];
        
        self.accountheadImg = [[UIImageView alloc] initWithFrame:CGRectMake((SCREEN_WIDTH-100)/2, SCREEN_TOP_HEIGHT+15, 100, 100)];
        [self.accountheadImg sd_setImageWithURL:[NSURL URLWithString:self.user.userInfo.avatarUrl] placeholderImage:[UIImage imageNamed:@"head_default"]];
        self.accountheadImg.layer.cornerRadius = 50;
        self.accountheadImg.layer.masksToBounds = YES;
        [_userView addSubview:self.accountheadImg];
    
        self.accountNickname = [[UILabel alloc] initWithFrame:CGRectMake(15, self.accountheadImg.bottom+10, SCREEN_WIDTH-30, 20)];
        self.accountNickname.font = [UIFont boldSystemFontOfSize:18];
        self.accountNickname.textColor = [UIColor blackColor];
        self.accountNickname.text = self.user.userInfo.nickName;
        self.accountNickname.textAlignment = NSTextAlignmentCenter;
        [_userView addSubview:self.accountNickname];


        self.accountId = [[UILabel alloc] initWithFrame:CGRectMake(15, self.accountNickname.bottom+5, SCREEN_WIDTH-30, 15)];
        self.accountId.font = [UIFont systemFontOfSize:12];
        self.accountId.textColor = RGB_COLOR_String(@"#666666");
        self.accountId.textAlignment = NSTextAlignmentCenter;
        [_userView addSubview:self.accountId];
 
//        self.account = [[UILabel alloc] initWithFrame:CGRectMake(15, self.accountId.bottom+6, SCREEN_WIDTH-30, 15)];
//        self.account.font = [UIFont systemFontOfSize:12];
//        self.account.textColor = RGB_COLOR_String(@"#ffffff");
//        self.account.text = [NSString stringWithFormat:@"Account:%@",self.user.userId];
//        [_userView addSubview:self.account];
        
        UIButton *messageBtn= [UIButton buttonWithType:UIButtonTypeCustom];
        messageBtn.frame = CGRectMake(15, 375-44-15, SCREEN_WIDTH-30, 44);
        messageBtn.backgroundColor = ThemeColor;
        [messageBtn setImage:[UIImage imageNamed:@"chat_ic_message"] forState:(UIControlStateNormal)];
        [messageBtn addTarget:self action:@selector(btnchat) forControlEvents:UIControlEventTouchUpInside];
        messageBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        [messageBtn setTitleColor:RGB_COLOR_String(@"#ffffff") forState:UIControlStateNormal];
        [messageBtn setTitle:LangKey(@"message_info_activity_message_info") forState:UIControlStateNormal];
        [messageBtn layoutButtonWithEdgeInsetsStyle:(MKButtonEdgeInsetsStyleLeft) imageTitleSpace:10];
        messageBtn.layer.cornerRadius = 12;
        [_userView addSubview:messageBtn];
     
        
//        CGFloat space = 15;
////        CGFloat width = (SCREEN_WIDTH-space*4)/3;
//
//        UIView *head = [[UIView alloc]initWithFrame:CGRectMake(15, 375-66-space, SCREEN_WIDTH-30, 44)];
//        head.backgroundColor = ThemeColor;
//        head.layer.cornerRadius = 12;
//        [_userView addSubview:head];
//        head.userInteractionEnabled = YES;
//        UITapGestureRecognizer *singleTap1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(btnchat)];
//        [head addGestureRecognizer:singleTap1];
//        UIImageView *img1 = [[UIImageView alloc]initWithFrame:CGRectMake((width-20)/2, 12, 20, 20)];
//        img1.image = [UIImage imageNamed:@"chat_ic_message"];
//        [head addSubview:img1];
//        UILabel *text1 = [[UILabel alloc] initWithFrame:CGRectMake(0, img1.bottom+6, width, 15)];
//        text1.font = [UIFont systemFontOfSize:12];
//        text1.textColor = RGB_COLOR_String(@"#ffffff");
//        text1.textAlignment = NSTextAlignmentCenter;
//        text1.text = @"Message";
//        [head addSubview:text1];
        
//        UIView *head2 = [[UIView alloc]initWithFrame:CGRectMake(2*space+width, 375-66-space, width, 66)];
//        head2.backgroundColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.3000];
//        head2.layer.cornerRadius = 12;
//        [_userView addSubview:head2];
//        head2.userInteractionEnabled = YES;
//        UITapGestureRecognizer *singleTap2 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(btnvoice)];
//        [head2 addGestureRecognizer:singleTap2];
//
//        UIImageView *img2 = [[UIImageView alloc]initWithFrame:CGRectMake((width-20)/2, 12, 20, 20)];
//        img2.image = [UIImage imageNamed:@"chat_ic_voice"];
//        [head2 addSubview:img2];
//        UILabel *text2 = [[UILabel alloc] initWithFrame:CGRectMake(0, img2.bottom+6, width, 15)];
//        text2.font = [UIFont systemFontOfSize:12];
//        text2.textColor = RGB_COLOR_String(@"#ffffff");
//        text2.textAlignment = NSTextAlignmentCenter;
//        text2.text = @"Voice Call";
//        [head2 addSubview:text2];
//
//        UIView *head3 = [[UIView alloc]initWithFrame:CGRectMake(3*space+2*width, 375-66-space, width, 66)];
//        head3.backgroundColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.3000];
//        head3.layer.cornerRadius = 12;
//        [_userView addSubview:head3];
//        head3.userInteractionEnabled = YES;
//        UITapGestureRecognizer *singleTap3 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(btnvideo)];
//        [head3 addGestureRecognizer:singleTap3];
//        UIImageView *img3 = [[UIImageView alloc]initWithFrame:CGRectMake((width-20)/2, 12, 20, 20)];
//        img3.image = [UIImage imageNamed:@"chat_ic_video"];
//        [head3 addSubview:img3];
//        UILabel *text3 = [[UILabel alloc] initWithFrame:CGRectMake(0, img3.bottom+6, width, 15)];
//        text3.font = [UIFont systemFontOfSize:12];
//        text3.textColor = RGB_COLOR_String(@"#ffffff");
//        text3.textAlignment = NSTextAlignmentCenter;
//        text3.text = @"Video Call";
//        [head3 addSubview:text3];
        
        self.closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.closeBtn.backgroundColor = [UIColor clearColor];
        [self.closeBtn setImage:[UIImage imageNamed:@"back_arrow_bl"] forState:(UIControlStateNormal)];
        [self.closeBtn addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
        [_userView addSubview:self.closeBtn];
        self.closeBtn.frame = CGRectMake(15, 4+SCREEN_STATUS_HEIGHT, 36, 36);
        
    }
    return _userView;
}

- (UIView *)personView
{
    if(!_personView){
        _personView = [[UIView alloc]init];
        _personView.backgroundColor = [UIColor clearColor];
        _personView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 353);
        
        UIView *contView = [[UIView alloc]initWithFrame:CGRectMake(15, 15, SCREEN_WIDTH-30, 300)];
        [_personView addSubview:contView];
        contView.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1];
        contView.layer.borderWidth = 0.5;
        contView.layer.borderColor = [UIColor colorWithRed:236/255.0 green:236/255.0 blue:236/255.0 alpha:1].CGColor;
        contView.layer.cornerRadius = 10;
        contView.layer.shadowColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.0800].CGColor;
        contView.layer.shadowOffset = CGSizeMake(0,3);
        contView.layer.shadowOpacity = 1;
        contView.layer.shadowRadius = 0;
        
        
        UIView *nameView = [[UIView alloc]initWithFrame:CGRectMake(15, 6, SCREEN_WIDTH-60, 70)];
        [contView addSubview:nameView];
        UITapGestureRecognizer *panGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onActionEditAlias)];
        [nameView addGestureRecognizer:panGesture];
        UIImageView *pic1 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 10, 24, 24)];
        pic1.image = [UIImage imageNamed:@"ic_card_edit"];
        [nameView addSubview:pic1];
        self.labTitleRemark = [[UILabel alloc]initWithFrame:CGRectMake(pic1.right+12, 10, 250, 24)];
        self.labTitleRemark.font = [UIFont systemFontOfSize:16.f];
        self.labTitleRemark.textColor = [UIColor blackColor];
        self.labTitleRemark.text = LangKey(@"message_remark_name");
        [nameView addSubview:self.labTitleRemark];
        self.labRemark = [[UILabel alloc]initWithFrame:CGRectMake(pic1.right+12, self.labTitleRemark.bottom, 250, 30)];
        self.labRemark.font = [UIFont systemFontOfSize:14.f];
        self.labRemark.textColor = ThemeColor;
        [nameView addSubview:self.labRemark];
        UIImageView *arrow = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-60-12, 29, 12, 12)];
        arrow.image = [UIImage imageNamed:@"icon_me_arrow"];
        [nameView addSubview:arrow];
        UIView *line1 = [[UIView alloc]initWithFrame:CGRectMake(36, 69, SCREEN_WIDTH-60-36, 1)];
        line1.backgroundColor = RGB_COLOR_String(@"#ECECEC");
        [nameView addSubview:line1];
        
        UIView *signView = [[UIView alloc]initWithFrame:CGRectMake(15, nameView.bottom, SCREEN_WIDTH-60, 80)];
        [contView addSubview:signView];
        UIImageView *pic2 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 10, 24, 24)];
        pic2.image = [UIImage imageNamed:@"ic_card_sign"];
        [signView addSubview:pic2];
        self.labTitSign = [[UILabel alloc]initWithFrame:CGRectMake(pic2.right+12, 10, 250, 24)];
        self.labTitSign.font = [UIFont systemFontOfSize:16.f];
        self.labTitSign.textColor = [UIColor blackColor];
        self.labTitSign.text = LangKey(@"user_profile_avtivity_signature");
        [signView addSubview:self.labTitSign];
        self.labSign = [[UILabel alloc]initWithFrame:CGRectMake(pic2.right+12, self.labTitleRemark.bottom, 250, 50)];
        self.labSign.font = [UIFont systemFontOfSize:14.f];
        self.labSign.numberOfLines = 2;
        self.labSign.textColor = TextColor_3;
        [signView addSubview:self.labSign];
        UIView *line2 = [[UIView alloc]initWithFrame:CGRectMake(36, 79, SCREEN_WIDTH-60-36, 1)];
        line2.backgroundColor = RGB_COLOR_String(@"#ECECEC");
        [signView addSubview:line2];
        
        UIView *noticeView = [[UIView alloc]initWithFrame:CGRectMake(15, signView.bottom, SCREEN_WIDTH-60, 50)];
        [contView addSubview:noticeView];
        UIImageView *pic3 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 12, 24, 24)];
        pic3.image = [UIImage imageNamed:@"ic_card_notice"];
        [noticeView addSubview:pic3];
        self.labTitlenotice = [[UILabel alloc]initWithFrame:CGRectMake(pic1.right+12, 10, 250, 28)];
        self.labTitlenotice.font = [UIFont systemFontOfSize:16.f];
        self.labTitlenotice.textColor = [UIColor blackColor];
        self.labTitlenotice.text = LangKey(@"message_info_activity_msg_notice");
        [noticeView addSubview:self.labTitlenotice];
        self.switchNotice = [[UISwitch alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-60-51, 8, 33, 20)];
        [self.switchNotice addTarget:self action:@selector(onActionNeedNotifyValueChange:) forControlEvents:UIControlEventValueChanged];
        self.switchNotice.onTintColor = ThemeColor;
        [noticeView addSubview:self.switchNotice];
        UIView *line3 = [[UIView alloc]initWithFrame:CGRectMake(36, 47, SCREEN_WIDTH-60-36, 1)];
        line3.backgroundColor = RGB_COLOR_String(@"#ECECEC");
        [noticeView addSubview:line3];
        
        UIView *blackView = [[UIView alloc]initWithFrame:CGRectMake(15, noticeView.bottom, SCREEN_WIDTH-60, 50)];
        [contView addSubview:blackView];
        UIImageView *pic4 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 12, 24, 24)];
        pic4.image = [UIImage imageNamed:@"ic_card_black"];
        [blackView addSubview:pic4];
        self.labTitleBlack = [[UILabel alloc]initWithFrame:CGRectMake(pic1.right+12, 10, 250, 28)];
        self.labTitleBlack.font = [UIFont systemFontOfSize:16.f];
        self.labTitleBlack.textColor = [UIColor blackColor];
        self.labTitleBlack.text = LangKey(@"func_viewholder_black");
        [blackView addSubview:self.labTitleBlack];
        self.switchBlack = [[UISwitch alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-60-51, 8, 33, 20)];
        [self.switchBlack addTarget:self action:@selector(onActionBlackListValueChange:) forControlEvents:UIControlEventValueChanged];
        self.switchBlack.onTintColor = ThemeColor;
        [blackView addSubview:self.switchBlack];
        UIView *line4 = [[UIView alloc]initWithFrame:CGRectMake(36, 47, SCREEN_WIDTH-60-36, 1)];
        line4.backgroundColor = RGB_COLOR_String(@"#ECECEC");
        [blackView addSubview:line4];

        UIView *reportView = [[UIView alloc]initWithFrame:CGRectMake(15, blackView.bottom, SCREEN_WIDTH-60, 50)];
        [contView addSubview:reportView];
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(reportsAction)];
        [reportView addGestureRecognizer:tapGesture];
        UIImageView *pic5 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 12, 24, 24)];
        pic5.image = [UIImage imageNamed:@"ic_card_report"];
        [reportView addSubview:pic5];
        self.labTitleResport = [[UILabel alloc]initWithFrame:CGRectMake(pic1.right+12, 10, 250, 28)];
        self.labTitleResport.font = [UIFont systemFontOfSize:16.f];
        self.labTitleResport.textColor = [UIColor blackColor];
        self.labTitleResport.text = LangKey(@"report_activity_title");
        [reportView addSubview:self.labTitleResport];
        UIImageView *arrow5 = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-60-12, 18, 12, 12)];
        arrow5.image = [UIImage imageNamed:@"icon_me_arrow"];
        [reportView addSubview:arrow5];
   
        
        self.btnAdd = [UIButton buttonWithType:UIButtonTypeCustom];
        self.btnAdd.frame = CGRectMake(15, contView.bottom+15, SCREEN_WIDTH-30, 48);
        [self.btnAdd setImage:[UIImage imageNamed:@"ic_add"] forState:UIControlStateNormal];
        [self.btnAdd addTarget:self action:@selector(addFriend) forControlEvents:UIControlEventTouchUpInside];
        self.btnAdd.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1];
        self.btnAdd.layer.borderWidth = 0.5;
        self.btnAdd.layer.borderColor = [UIColor colorWithRed:236/255.0 green:236/255.0 blue:236/255.0 alpha:1].CGColor;
        self.btnAdd.layer.cornerRadius = 10;
        self.btnAdd.layer.shadowColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.0800].CGColor;
        self.btnAdd.layer.shadowOffset = CGSizeMake(0,3);
        self.btnAdd.layer.shadowOpacity = 1;
        self.btnAdd.layer.shadowRadius = 0;
        [_personView addSubview:self.btnAdd];
        
        self.btnDelete = [UIButton buttonWithType:UIButtonTypeCustom];
        self.btnDelete.frame = CGRectMake(15, contView.bottom+15, SCREEN_WIDTH-30, 48);
        [self.btnDelete setImage:[UIImage imageNamed:@"ic_delete_red"] forState:UIControlStateNormal];
        [self.btnDelete addTarget:self action:@selector(deleteFriend) forControlEvents:UIControlEventTouchUpInside];
        self.btnDelete.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1];
        self.btnDelete.layer.borderWidth = 0.5;
        self.btnDelete.layer.borderColor = [UIColor colorWithRed:236/255.0 green:236/255.0 blue:236/255.0 alpha:1].CGColor;
        self.btnDelete.layer.cornerRadius = 10;
        self.btnDelete.layer.shadowColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.0800].CGColor;
        self.btnDelete.layer.shadowOffset = CGSizeMake(0,3);
        self.btnDelete.layer.shadowOpacity = 1;
        self.btnDelete.layer.shadowRadius = 0;
        [_personView addSubview:self.btnDelete];
    }
    return _personView;
}

- (CCCRemarksView *)changeRemarksView
{
    if(!_changeRemarksView){
        _changeRemarksView = [[CCCRemarksView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
//        _changeRemarksView.hidden = YES;

    }
    return _changeRemarksView;
}

- (ZMONCustomLoadingView *)loadingView
{
    if(!_loadingView){
        _loadingView = [[ZMONCustomLoadingView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    }
    return  _loadingView;
}
- (ZMONReportUserView *)reprotView
{
    if(!_reprotView){
        _reprotView  = [[ZMONReportUserView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        _reprotView.delegate = self;
    }
    return _reprotView;
}

-(void)didTouchSubmitButton:(NSString *)reason
{
    NSMutableDictionary *dict = @{}.mutableCopy;
    dict[@"contact"] = reason?:@"";
    [ZCHttpManager postWithUrl:Server_other_feedback params:dict isShow:NO success:^(id responseObject) {
    } failed:^(id responseObject, NSError *error) {
    }];
    
    [self.view addSubview:self.reprotNextView];
    [self.reprotNextView animationShow];
   
}

- (ZMONReportNextView *)reprotNextView
{
    if(!_reprotNextView){
        _reprotNextView  = [[ZMONReportNextView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        _reprotNextView.delegate = self;
    }
    return _reprotNextView;

}
- (void)didTouchBlackButton
{
    [self.view addSubview:self.reprotBlackView];
//    self.reprotBlackView.userID = self.userId;
    [self.reprotBlackView animationShow];
    @weakify(self)
    self.reprotBlackView.speiceBackBlock = ^(NSString *Name){
        @strongify(self)
        [[NIMSDK sharedSDK].userManager addToBlackList:self.userId completion:^(NSError *error) {
       
                   if (!error) {
                       [self.view makeToast:LangKey(@"group_chat_avatar_activity_add_black_success") duration:2.0f position:CSToastPositionCenter];
                   }else{
                       [self.view makeToast:LangKey(@"black_list_activity_add_black_failed") duration:2.0f position:CSToastPositionCenter];
       
                   }
        }];
        

        NIMDeleteRecentSessionOption *option = [[NIMDeleteRecentSessionOption alloc] init];
        option.isDeleteRoamMessage = YES;
        NIMSession *session = [NIMSession session:self.userId type:NIMSessionTypeP2P];
        NIMRecentSession *recent = [[NIMSDK sharedSDK].conversationManager recentSessionBySession:session];
        [[[NIMSDK sharedSDK] conversationManager] deleteRecentSession:recent option:option completion:^(NSError * _Nullable error) {
        }];
        
        [self.navigationController popToRootViewControllerAnimated:YES];
        
    };
    
   
}
- (void)didTouchDeleteButton
{
    [self.view addSubview:self.reprotDeleteView];
//    self.reprotDeleteView.userID = self.userId
    [self.reprotDeleteView animationShow];
    @weakify(self)
    self.reprotDeleteView.speiceBackBlock = ^(NSString *Name){
        @strongify(self)
        [[NIMSDK sharedSDK].userManager deleteFriend:self.userId
                                         removeAlias:[[NTESBundleSetting sharedConfig] autoRemoveAlias]
                                          completion:^(NSError *error) {

            if (!error) {
                [self.view makeToast:LangKey(@"contact_tag_fragment_delete_success") duration:2.0f position:CSToastPositionCenter];
            }else{
                [self.view makeToast:LangKey(@"friend_delete_fail") duration:2.0f position:CSToastPositionCenter];
            }
        }];
        

        NIMDeleteRecentSessionOption *option = [[NIMDeleteRecentSessionOption alloc] init];
        option.isDeleteRoamMessage = YES;
        NIMSession *session = [NIMSession session:self.userId type:NIMSessionTypeP2P];
        NIMRecentSession *recent = [[NIMSDK sharedSDK].conversationManager recentSessionBySession:session];
        [[[NIMSDK sharedSDK] conversationManager] deleteRecentSession:recent option:option completion:^(NSError * _Nullable error) {
        }];
        
        [self.navigationController popToRootViewControllerAnimated:YES];
        
    };
}

- (ZMONReportBlackView *)reprotBlackView
{
    if(!_reprotBlackView){
        _reprotBlackView  = [[ZMONReportBlackView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    }
    return _reprotBlackView;

}

- (ZMONReportDeleteView *)reprotDeleteView
{
    if(!_reprotDeleteView){
        _reprotDeleteView  = [[ZMONReportDeleteView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    }
    return _reprotDeleteView;
}

@end
