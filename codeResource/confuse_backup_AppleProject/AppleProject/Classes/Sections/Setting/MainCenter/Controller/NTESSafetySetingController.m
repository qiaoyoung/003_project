//
//  NTESSafetySetingController.m
//  NIM
//
//  Created by 彭爽 on 2021/9/17.
//  Copyright © 2021 Netease. All rights reserved.
//

#import "NTESSafetySetingController.h"
#import "NTESSafetySetingCell.h"
#import "NTESChangePasswordController.h"
#import "NTESSafetyTableViewCell.h"
#import "LEEAlert.h"
#import "LEEAlertHelper.h"
#import "CCCBlackListViewController.h"
#import "ZMONDeleteAccountView.h"
#import "ZMONDeactivateAccountView.h"
#import "ZMONPrivacyPolicyView.h"
#import "ZMONDeactivateAccountNextView.h"
#import "ZMONDeactivateAccountSuccessView.h"
#import "ZMONAccountPolicyViewController.h"
#import "SSZipArchiveManager.h"



@interface NTESSafetySetingController ()<UITableViewDataSource,UITableViewDelegate,NTESDeactivateAccountDelegate,NTESDeleteAccountDelegate>

@property (nonatomic ,strong) UITableView *tableView;
@property (nonatomic ,strong) ZMONDeleteAccountView *deleteAccountView;
@property (nonatomic ,strong) ZMONDeactivateAccountView *deactivateView;
@property (nonatomic, strong) ZMONPrivacyPolicyView *policyView;
@property (nonatomic, strong) ZMONDeactivateAccountNextView *deactivateNextView;
@property (nonatomic, strong) ZMONDeactivateAccountSuccessView *deactivateSuccessView;



@end

@implementation NTESSafetySetingController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setHidden:YES];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar setHidden:NO];

}
- (void)backAction{
    [self.navigationController popViewControllerAnimated:NO];
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"common_bg"]];
    UIImageView *bg = [[UIImageView alloc]initWithFrame:self.view.bounds];
    bg.image = [UIImage imageNamed:@"common_bg"];
    [self.view addSubview:bg];

    UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_TOP_HEIGHT)];
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
    labtitle.text = LangKey(@"safe_setting_activity_title");
    [bgView addSubview:labtitle];
    
    [self initTableView];
}

- (void)initTableView{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(15, SCREEN_TOP_HEIGHT+15, SCREEN_WIDTH-30, SCREEN_HEIGHT-SCREEN_TOP_HEIGHT) style:UITableViewStyleGrouped];
    [self.view addSubview:self.tableView];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = [UIColor clearColor];
    _tableView.estimatedSectionHeaderHeight=15.1;
    _tableView.estimatedSectionFooterHeight=.1;
    self.tableView.estimatedRowHeight = UITableViewAutomaticDimension;
    self.tableView.delegate   = self;
    self.tableView.dataSource = self;
    
    
}



#pragma mark - UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    return 56;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return CGFLOAT_MIN;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *backView = [UIView new];
    backView.backgroundColor = [UIColor clearColor];
    return backView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 16.f;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *backView = [UIView new];
    backView.backgroundColor = [UIColor clearColor];
    return backView;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NTESSafetyTableViewCell *cell = [NTESSafetyTableViewCell cellWithTableView:tableView];
    
    if(indexPath.section == 0){
        cell.iconImageView.image = [UIImage imageNamed:@"safe_blacklist"];
        cell.titleLabel.text = LangKey(@"black_list_activity_black");
        cell.labSubtitle.hidden = YES;
    }
    else if (indexPath.section == 1){
        cell.iconImageView.image = [UIImage imageNamed:@"safe_changepsd"];
        cell.titleLabel.text = LangKey(@"modify_activity_title");
        cell.labSubtitle.hidden = YES;
    }
//    else if (indexPath.section == 2){
//        cell.iconImageView.image = [UIImage imageNamed:@"safe_accountDeactivate"];
//        cell.titleLabel.text = LangKey(@"deactivate_account");
//        cell.labSubtitle.hidden = YES;
//    }
    else if (indexPath.section == 2){
        cell.iconImageView.image = [UIImage imageNamed:@"safe_accountdelete"];
        cell.titleLabel.text = LangKey(@"activity_comment_setting_cancel_account");
        cell.labSubtitle.hidden = YES;
    }
//    else if (indexPath.section == 4){
//        cell.iconImageView.image = [UIImage imageNamed:@"safe_email"];
//        cell.titleLabel.text = LangKey(@"user_profile_avtivity_email");
//        cell.labSubtitle.hidden = NO;
//        cell.labSubtitle.text = self.bindEmail;
//    }
    
    return cell;
        

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    if(indexPath.section == 0){
        [self blacklist];
    }
    else if (indexPath.section == 1){
        [self changedpwd];
    }
//    else if (indexPath.section == 2){
//        [self deactivateAccount];
//    }
    else if (indexPath.section == 2){
        [self cancelaccount];
    }
//    else if (indexPath.section == 4){
//        [self bindEmailVC];
//    }
}

- (void)didTouchNextButton
{
    [self.view addSubview:self.deactivateNextView];
    [self.deactivateNextView reloadWithNickname:LangKey(@"deactivate_account")];
    [self.deactivateNextView animationShow];
    @weakify(self)
    self.deactivateNextView.speiceBackBlock= ^(NSString *groupName){
        @strongify(self)
        [self.deactivateNextView animationClose];
        [self.view addSubview:self.deactivateSuccessView];
        [self.deactivateSuccessView reloadWithNickname:LangKey(@"deactivated_success")];
        [self.deactivateSuccessView animationShow];
        
    };
}
- (void)didTouchProtocolButton
{
//    [self.view addSubview:self.policyView];
//    [self.policyView animationShow];
    
    ZMONAccountPolicyViewController *vc = [[ZMONAccountPolicyViewController alloc]init];
    NSString *htmlFilePath = [[[SSZipArchiveManager sharedManager] getHtml_filePath] stringByAppendingPathComponent:[NSString stringWithFormat:@"Policy.html"]];
    vc.urlString = htmlFilePath;
    [self.navigationController pushViewController:vc animated:YES];
}






- (void)didTouchDeleteNextButton
{
    [self.view addSubview:self.deactivateNextView];
    [self.deactivateNextView reloadWithNickname:LangKey(@"activity_comment_setting_cancel_account")];
    [self.deactivateNextView animationShow];
    @weakify(self)
    self.deactivateNextView.speiceBackBlock= ^(NSString *groupName){
        @strongify(self)
        [self.deactivateNextView animationClose];
        [self.view addSubview:self.deactivateSuccessView];
        [self.deactivateSuccessView reloadWithNickname:LangKey(@"deleted_success")];
        
        [self.deactivateSuccessView animationShow];
        
    };
}
- (void)didTouchDeleteProtocolButton
{
//    [self.view addSubview:self.policyView];
//    [self.policyView animationShow];
    
    ZMONAccountPolicyViewController *vc = [[ZMONAccountPolicyViewController alloc]init];
        NSString *langType = emptyString([NIMUserDefaults standardUserDefaults].language);
    
    NSString *fileName = @"AccountDeletion_en.html";
    if ([langType containsString:@"ja"]){
        fileName = @"AccountDeletion_ja.html";
    }else if ([langType containsString:@"ko"]){
        fileName = @"AccountDeletion_ko.html";
    } else if ([langType containsString:@"hant"]){
        fileName = @"AccountDeletion_hant.html";
    }
    NSString *htmlFilePath = [[[SSZipArchiveManager sharedManager] getHtml_filePath] stringByAppendingPathComponent:[NSString stringWithFormat:@"%@", fileName]];
    vc.urlString = htmlFilePath;
    
    [self.navigationController pushViewController:vc animated:YES];
}


- (void)blacklist {
    CCCBlackListViewController *vc = [[CCCBlackListViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)changedpwd {
    NTESChangePasswordController *vc = [[NTESChangePasswordController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

//- (void)bindPhoneVC {
//    KEKEBindPhoneViewController *vc = [[KEKEBindPhoneViewController alloc] init];
//    vc.bindPhone = self.bindPhone;
//    [self.navigationController pushViewController:vc animated:YES];
//}
//
//- (void)bindEmailVC {
//    KEKEBindEmailViewController *vc = [[KEKEBindEmailViewController alloc] init];
//    vc.bindEmail = self.bindEmail;
//    [self.navigationController pushViewController:vc animated:YES];
//}

- (void)deactivateAccount {
    
    [self.view addSubview:self.deactivateView];
    [self.deactivateView animationShow];

}


- (void)cancelaccount {
    
    [self.view addSubview:self.deleteAccountView];
    [self.deleteAccountView animationShow];

}


//-(void)changePassWord{
//    NTESChangePasswordController *vc = [[NTESChangePasswordController alloc] init];
//    [self.navigationController pushViewController:vc animated:YES];
//
//}
//
//-(void)resetQuestion{
//    NTESChangeQuestionViewController *vc = [[NTESChangeQuestionViewController alloc] init];
//    [self.navigationController pushViewController:vc animated:YES];
//}
//
//-(void)findPayPassWord{
//    UIAlertController *alert = [UIAlertController alertControllerWithTitle:LangKey(@"warm_prompt") message:LangKey(@"contact_customer_service") preferredStyle:UIAlertControllerStyleAlert];
//    UIAlertAction *alertA = [UIAlertAction actionWithTitle:LangKey(@"got_it") style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//    }];
//    [alert addAction:alertA];
//    [self.navigationController presentViewController:alert animated:YES completion:nil];
//}
//
//-(void)changePayPassword{
//
//    NTESVerifyPayPasswordController *vc = [[NTESVerifyPayPasswordController alloc] init];
//    [self.navigationController pushViewController:vc animated:YES];
//    [vc inputPassword:^(NSString *passwordString) {
//        NTESChangePayPasswordController *vc = [[NTESChangePayPasswordController alloc] initWithType:NTESPayPassword_Change];
//        vc.oldpassword = passwordString;
//        [self.navigationController pushViewController:vc animated:YES];
//    }];
//}

- (ZMONDeleteAccountView *)deleteAccountView
{
    if(!_deleteAccountView){
        _deleteAccountView = [[ZMONDeleteAccountView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        _deleteAccountView.hidden = YES;
        _deleteAccountView.delegate = self;
    }
    return  _deleteAccountView;
}

- (ZMONDeactivateAccountView *)deactivateView
{
    if(!_deactivateView){
        _deactivateView = [[ZMONDeactivateAccountView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        _deactivateView.hidden = YES;
        _deactivateView.delegate = self;
    }
    return  _deactivateView;
}
- (ZMONDeactivateAccountNextView *)deactivateNextView
{
    if(!_deactivateNextView){
        _deactivateNextView = [[ZMONDeactivateAccountNextView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        _deactivateNextView.hidden = YES;
//        _deactivateNextView.delegate = self;
    }
    return  _deactivateNextView;
}

- (ZMONDeactivateAccountSuccessView *)deactivateSuccessView
{
    if(!_deactivateSuccessView){
        _deactivateSuccessView = [[ZMONDeactivateAccountSuccessView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        _deactivateSuccessView.hidden = YES;
//        _deactivateSuccessView.delegate = self;
    }
    return  _deactivateSuccessView;
}
- (ZMONPrivacyPolicyView *)policyView
{
    if(!_policyView){
        _policyView = [[ZMONPrivacyPolicyView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    }
    return  _policyView;
}

@end
