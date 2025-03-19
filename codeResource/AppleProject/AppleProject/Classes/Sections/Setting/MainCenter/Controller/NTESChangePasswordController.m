//
//  NTESChangePasswordController.m
//  NIM
//
//  Created by 彭爽 on 2021/9/29.
//  Copyright © 2021 Netease. All rights reserved.
//

#import "NTESChangePasswordController.h"
#import "NTESChangePasswordCell.h"

@interface NTESChangePasswordController ()<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>
@property (nonatomic ,strong) UITableView *tableView;
@property (nonatomic ,strong) UITextField *textfile_1;
@property (nonatomic ,strong) UITextField *textfile_2;
@property (nonatomic ,strong) UITextField *textfile_3;
@end

@implementation NTESChangePasswordController

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
//    self.title = LangKey(@"activity_safe_setting_modify");//@"修改登录密码";
    
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
    labtitle.text = LangKey(@"activity_safe_setting_modify");
    [bgView addSubview:labtitle];
    
//    UIButton *submitButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    submitButton.frame = CGRectMake(SCREEN_WIDTH-15-40, SCREEN_STATUS_HEIGHT+4, 40, 40);
//    [submitButton setImage:[UIImage imageNamed:@"icon_checkbox_selected"] forState:(UIControlStateNormal)];
//    [submitButton addTarget:self action:@selector(commitButtonClick) forControlEvents:UIControlEventTouchUpInside];
//    [bgView addSubview:submitButton];
    
//    [self setNavRightItem:@selector(commitButtonClick) title:LangKey(@"contact_list_activity_complete") color:[UIColor blackColor]];
//    [self initTableView];
//    [self.view registEndEditing];
    
    UILabel *labphone = [[UILabel alloc] initWithFrame:CGRectMake(30, SCREEN_TOP_HEIGHT+15, SCREEN_WIDTH-60, 20)];
    labphone.font = [UIFont boldSystemFontOfSize:14.f];
    labphone.textColor = TextColor_4;
    labphone.textAlignment = NSTextAlignmentLeft;
    labphone.text = LangKey(@"psw_old");
    [self.view addSubview:labphone];
    
    UIView *view1 = [[UIView alloc]initWithFrame:CGRectMake(30, labphone.bottom+15, SCREEN_WIDTH-60, 50)];
    view1.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1];
    view1.layer.borderWidth = 0.5;
    view1.layer.borderColor = [UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1].CGColor;
    view1.layer.cornerRadius = 10;
    view1.layer.shadowColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.0800].CGColor;
    view1.layer.shadowOffset = CGSizeMake(0,3);
    view1.layer.shadowOpacity = 1;
    view1.layer.shadowRadius = 0;
    [self.view addSubview:view1];

    
    UIImageView *imgname = [[UIImageView alloc]initWithFrame:CGRectMake(15, 15, 20, 20)];
    imgname.image = [UIImage imageNamed:@"safe_bind_phone_icon"];
    [view1 addSubview:imgname];
    
    self.textfile_1 = [[UITextField alloc] initWithFrame:CGRectMake(35+10, 15, SCREEN_WIDTH-60-30-30, 20)];
    self.textfile_1.font = [UIFont systemFontOfSize:16];
    self.textfile_1.textColor = TextColor_4;
    self.textfile_1.placeholder = LangKey(@"activity_modify_old");
    self.textfile_1.delegate = self;
    self.textfile_1.secureTextEntry = YES;
    [view1 addSubview:self.textfile_1];
    
    UILabel *labphone2 = [[UILabel alloc] initWithFrame:CGRectMake(30, view1.bottom+15, SCREEN_WIDTH-60, 20)];
    labphone2.font = [UIFont boldSystemFontOfSize:14.f];
    labphone2.textColor = TextColor_4;
    labphone2.textAlignment = NSTextAlignmentLeft;
    labphone2.text = LangKey(@"psw_new");
    [self.view addSubview:labphone2];
    
    UIView *view2 = [[UIView alloc]initWithFrame:CGRectMake(30, labphone2.bottom+15, SCREEN_WIDTH-60, 50)];
    view2.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1];
    view2.layer.borderWidth = 0.5;
    view2.layer.borderColor = [UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1].CGColor;
    view2.layer.cornerRadius = 10;
    view2.layer.shadowColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.0800].CGColor;
    view2.layer.shadowOffset = CGSizeMake(0,3);
    view2.layer.shadowOpacity = 1;
    view2.layer.shadowRadius = 0;
    [self.view addSubview:view2];
    
    UIImageView *imgname2 = [[UIImageView alloc]initWithFrame:CGRectMake(15, 15, 20, 20)];
    imgname2.image = [UIImage imageNamed:@"safe_bind_phone_icon"];
    [view2 addSubview:imgname2];
    
    self.textfile_2 = [[UITextField alloc] initWithFrame:CGRectMake(35+10, 15, SCREEN_WIDTH-60-30-30, 20)];
    self.textfile_2.font = [UIFont systemFontOfSize:16];
    self.textfile_2.textColor = TextColor_4;
    self.textfile_2.placeholder = LangKey(@"activity_modify_new");
    self.textfile_2.delegate = self;
    self.textfile_2.secureTextEntry = YES;
    [view2 addSubview:self.textfile_2];
    
    UILabel *labphone3 = [[UILabel alloc] initWithFrame:CGRectMake(30, view2.bottom+15, SCREEN_WIDTH-60, 20)];
    labphone3.font = [UIFont boldSystemFontOfSize:14.f];
    labphone3.textColor = TextColor_4;
    labphone3.textAlignment = NSTextAlignmentLeft;
    labphone3.text = LangKey(@"psw_again");
    [self.view addSubview:labphone3];
    
    UIView *view3 = [[UIView alloc]initWithFrame:CGRectMake(30, labphone3.bottom+15, SCREEN_WIDTH-60, 50)];
    view3.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1];
    view3.layer.borderWidth = 0.5;
    view3.layer.borderColor = [UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1].CGColor;
    view3.layer.cornerRadius = 10;
    view3.layer.shadowColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.0800].CGColor;
    view3.layer.shadowOffset = CGSizeMake(0,3);
    view3.layer.shadowOpacity = 1;
    view3.layer.shadowRadius = 0;
    [self.view addSubview:view3];
    
    UIImageView *imgname3 = [[UIImageView alloc]initWithFrame:CGRectMake(15, 15, 20, 20)];
    imgname3.image = [UIImage imageNamed:@"safe_bind_phone_icon"];
    [view3 addSubview:imgname3];
    
    self.textfile_3 = [[UITextField alloc] initWithFrame:CGRectMake(35+10, 15, SCREEN_WIDTH-60-30-30, 20)];
    self.textfile_3.font = [UIFont systemFontOfSize:16];
    self.textfile_3.textColor = TextColor_4;
    self.textfile_3.placeholder = LangKey(@"activity_modify_new");
    self.textfile_3.delegate = self;
    self.textfile_3.secureTextEntry = YES;
    [view3 addSubview:self.textfile_3];

    UIButton *emptyButton = [UIButton buttonWithType:UIButtonTypeCustom];
    emptyButton.frame = CGRectMake(30, view3.bottom+30, SCREEN_WIDTH-60, 44);
    emptyButton.titleLabel.font = [UIFont systemFontOfSize:15];
    [emptyButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [emptyButton setTitle:LangKey(@"sure_edit") forState:UIControlStateNormal];
    [emptyButton addTarget:self action:@selector(commitButtonClick) forControlEvents:UIControlEventTouchUpInside];
    emptyButton.backgroundColor = ThemeColor;
    emptyButton.layer.cornerRadius = 10;
    emptyButton.layer.shadowColor = DeepBtnColor.CGColor;
    emptyButton.layer.shadowOffset = CGSizeMake(0,3);
    emptyButton.layer.shadowOpacity = 1;
    emptyButton.layer.shadowRadius = 0;
    [self.view addSubview:emptyButton];
    
  
}


-(void)initTableView{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, SCREEN_TOP_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT-SCREEN_TOP_HEIGHT) style:UITableViewStyleGrouped];
    [self.view addSubview:self.tableView];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor =  [UIColor colorWithRed:243/255.0 green:242/255.0 blue:252/255.0 alpha:1.0];
    _tableView.estimatedSectionHeaderHeight=15.1;
    _tableView.estimatedSectionFooterHeight=.1;
    self.tableView.estimatedRowHeight = UITableViewAutomaticDimension;
    self.tableView.delegate   = self;
    self.tableView.dataSource = self;
    
}



#pragma mark - UITableViewDelegate

//Setup your cell margins:
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
// Remove seperator inset
if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
    [cell setSeparatorInset:UIEdgeInsetsZero];
}
// Prevent the cell from inheriting the Table View's margin settings
if ([cell respondsToSelector:@selector(setPreservesSuperviewLayoutMargins:)]) {
    [cell setPreservesSuperviewLayoutMargins:NO];
}
// Explictly set your cell's layout margins
if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
    [cell setLayoutMargins:UIEdgeInsetsZero];
}
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
return 1;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
return 15.f;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
UIView *backView = [UIView new];
backView.backgroundColor = [UIColor clearColor];
return backView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
return 0.1f;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *backView = [UIView new];
    backView.backgroundColor = [UIColor clearColor];
    return backView;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    static NSString *identifier = @"HMTopCellIdentifier_0";
    NTESChangePasswordCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[NTESChangePasswordCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        //cell.delegate = self;
    }
    _textfile_1 = cell.textfile_1;
    _textfile_2 = cell.textfile_2;
    _textfile_3 = cell.textfile_3;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

-(void)commitButtonClick{
    NSString *account = [[NIMSDK sharedSDK].loginManager currentAccount];
    
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithCapacity:0];
    [dict setObject:account forKey:@"account"];
    [dict setObject:@"" forKey:@"type"];
    [dict setObject:_textfile_1.text forKey:@"oldpass"];
    [dict setObject:_textfile_2.text forKey:@"newpass"];
    [dict setObject:_textfile_3.text forKey:@"renewpass"];
    
    [ZCHttpManager getWithUrl:Server_user_modifyPass params:dict isShow:YES success:^(id responseObject) {
        NSDictionary *resultDict = (NSDictionary *)responseObject;
        NSString *msg = [resultDict newStringValueForKey:@"msg"];
        [SVProgressHUD showMessage:msg];
        [self.navigationController popViewControllerAnimated:NO];
    } failed:^(id responseObject, NSError *error) {
        
    }];
    
}

@end
