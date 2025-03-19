//
//  ZOMNForwardViewController.m
//  AppleProject
//
//  Created by Yan Wang on 2025/2/8.
//  Copyright © 2025 AppleProject. All rights reserved.
//

#import "ZOMNForwardViewController.h"
#import "NTESFriendListTableViewCell.h"
#import "NTESContactDataCell.h"



@interface ZOMNForwardViewController ()<UITableViewDataSource,UITableViewDelegate>


@property(nonatomic, strong) UITableView *tableView;
@property (nonatomic ,assign) NSInteger sliderIndex;

@property (nonatomic,strong) UIImageView *topborder1;
@property (nonatomic,strong) UIButton *btnfriend;

@property (nonatomic,strong) UIImageView *topborder2;
@property (nonatomic,strong) UIButton *btngroup;

@property (nonatomic ,strong) NSArray *groupArray;
@property (nonatomic ,strong) NSArray *friendArray;


@end

@implementation ZOMNForwardViewController

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
    labtitle.text = LangKey(@"activity_wallet_zhuan");
    [bgView addSubview:labtitle];
    
    UIView *topview = [[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_TOP_HEIGHT, SCREEN_WIDTH, 40)];
    [self.view addSubview:topview];
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 39.5, SCREEN_WIDTH, 0.5)];
    line.backgroundColor = RGB_COLOR_String(@"#DDDDDD");
    [topview addSubview:line];
    
    _btnfriend = [UIButton buttonWithType:UIButtonTypeCustom];
    _btnfriend.frame = CGRectMake(SCREEN_WIDTH/2-80, 0, 80, 40);
    _btnfriend.tag = 0;
    _btnfriend.titleLabel.font   = [UIFont systemFontOfSize:18];
    [_btnfriend setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_btnfriend setTitle:LangKey(@"contact_fragment_friend") forState:UIControlStateNormal];
    [_btnfriend addTarget:self action:@selector(sliderButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [topview addSubview:_btnfriend];
//    [_btnfriend sizeToFit];
    _topborder1 = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2-80+32, _btnfriend.bottom-10, 16, 4)];
    _topborder1.backgroundColor = [UIColor blackColor];
    _topborder1.layer.cornerRadius = 2;
    _topborder1.layer.masksToBounds = YES;
    [topview addSubview:_topborder1];
    

    _btngroup = [UIButton buttonWithType:UIButtonTypeCustom];
    _btngroup.frame = CGRectMake(SCREEN_WIDTH/2, 0, 80, 40);
    _btngroup.tag = 1;
    _btngroup.titleLabel.font   = [UIFont systemFontOfSize:14];
    [_btngroup setTitleColor:RGB_COLOR_String(@"#8282A7") forState:UIControlStateNormal];
    [_btngroup setTitle:LangKey(@"contact_fragment_group") forState:UIControlStateNormal];
    [_btngroup addTarget:self action:@selector(sliderButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [topview addSubview:_btngroup];
//    [_btngroup sizeToFit];
    _topborder2 = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2+32, _btngroup.bottom-10, 16, 4)];
    _topborder2.backgroundColor = [UIColor blackColor];
    _topborder2.layer.cornerRadius = 2;
    _topborder2.layer.masksToBounds = YES;
    [topview addSubview:_topborder2];
    _topborder2.hidden = YES;
    

    [self.view addSubview:self.tableView];
    _sliderIndex = 0;
    [self prepareData];
}

-(void)sliderButtonClick:(UIButton *)sender
{
    sender.selected = YES;
    
    if(sender == self.btnfriend){
        _btngroup.titleLabel.font   = [UIFont systemFontOfSize:14];
        [_btngroup setTitleColor:RGB_COLOR_String(@"#8282A7") forState:UIControlStateNormal];
        _btnfriend.titleLabel.font   = [UIFont systemFontOfSize:18];
        [_btnfriend setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.topborder1.hidden = NO;
        self.topborder2.hidden = YES;
    }else if (sender == self.btngroup){
        _btnfriend.titleLabel.font   = [UIFont systemFontOfSize:14];
        [_btnfriend setTitleColor:RGB_COLOR_String(@"#8282A7") forState:UIControlStateNormal];
        _btngroup.titleLabel.font   = [UIFont systemFontOfSize:18];
        [_btngroup setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.topborder1.hidden = YES;
        self.topborder2.hidden = NO;
    }
  
    _sliderIndex = sender.tag;
    [_tableView reloadData];
    
}

- (void)prepareData
{
    self.friendArray = [NIMSDK sharedSDK].userManager.myFriends;
    self.groupArray = [NIMSDK sharedSDK].teamManager.allMyTeams;
    
    [self.tableView reloadData];
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    if(_sliderIndex <= 0){
        NIMUser *friend = self.friendArray[indexPath.row];
        self.session = [NIMSession session:friend.userId type:NIMSessionTypeP2P];
    }else{
        NIMTeam *team = self.groupArray[indexPath.row];
        self.session = [NIMSession session:team.teamId type:NIMSessionTypeTeam];
    }
    
    NSError *err;
    [[[NIMSDK sharedSDK] chatManager] forwardMessage:self.message toSession:self.session error:&err];
   
    if(!err){
        [self.view makeToast:@"已发送".nim_localized duration:1.0 position:CSToastPositionCenter title:nil image:nil style:nil completion:^(BOOL didTap) {
            [self.navigationController popViewControllerAnimated:NO];
        }];
    }else{
        [self.view makeToast:@"转发失败".nim_localized duration:2.0 position:CSToastPositionCenter];
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 56;
}

- (NIMSession *)didGetSessionWithTeam:(id)team {
    NIMTeam *teamItem = (NIMTeam *)team;
    NIMSession *session = [NIMSession session:teamItem.teamId type:NIMSessionTypeTeam];
    return session;
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if (_sliderIndex <= 0) {
        return self.friendArray.count;
    }else{
        return self.groupArray.count;
    }
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.01f;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01f;
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return [[UIView alloc] init];
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return [[UIView alloc] init];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (_sliderIndex <= 0) {
        NIMUser *user = self.friendArray[indexPath.section];

        NTESFriendListTableViewCell *cell = [NTESFriendListTableViewCell cellWithTableView:tableView];
//        cell.delegate = self;
        [cell reloadUserItem:user];
        cell.messageBtn.hidden = YES;
        
        return cell;
        
    }else{
        
        NIMTeam *team = self.groupArray[indexPath.section];

        NTESContactDataCell * cell = [tableView dequeueReusableCellWithIdentifier:@"KEKEItemCell"];
        if (!cell) {
            cell = [[NTESContactDataCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"KEKEItemCell"];
        }
        cell.backgroundColor = [UIColor clearColor];
        cell.accessoryType = UITableViewCellAccessoryNone;
        [cell refreshTeam:team];
//        [cell setDelegate:self];
        
        return cell;
    }
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, SCREEN_TOP_HEIGHT+40, SCREEN_WIDTH, SCREEN_HEIGHT-SCREEN_TOP_HEIGHT-40) style:UITableViewStyleGrouped];
        _tableView.delegate       = self;
        _tableView.dataSource     = self;
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}

@end
