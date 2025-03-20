
#import <Foundation/Foundation.h>

NSString *StringFromDuringModeHorseData(Byte *data);


//: KEKEItemCell
Byte str_nomeValue[] = {43, 12, 5, 65, 124, 108, 108, 101, 67, 109, 101, 116, 73, 69, 75, 69, 75, 95};


//: #8282A7
Byte str_encounterData[] = {9, 7, 5, 57, 232, 55, 65, 50, 56, 50, 56, 35, 105};


//: back_arrow_bl
Byte str_imposeCandidIncreasingContent[] = {28, 13, 8, 123, 152, 137, 128, 183, 108, 98, 95, 119, 111, 114, 114, 97, 95, 107, 99, 97, 98, 81};


//: 转发失败
Byte str_oyName[] = {74, 12, 7, 22, 128, 226, 162, 165, 180, 232, 177, 164, 229, 145, 143, 229, 172, 189, 232, 96};


//: common_bg
Byte str_refugeeTitle[] = {77, 9, 7, 12, 185, 244, 149, 103, 98, 95, 110, 111, 109, 109, 111, 99, 39};


//: 已发送
Byte str_balanceTerriblyContent[] = {71, 9, 8, 228, 241, 198, 112, 219, 129, 128, 233, 145, 143, 229, 178, 183, 229, 215};


//: #DDDDDD
Byte str_memberSizeData[] = {20, 7, 8, 13, 99, 134, 123, 139, 68, 68, 68, 68, 68, 68, 35, 190};


//: activity_wallet_zhuan
Byte str_advanceNessData[] = {9, 21, 12, 148, 15, 168, 156, 175, 51, 100, 35, 134, 110, 97, 117, 104, 122, 95, 116, 101, 108, 108, 97, 119, 95, 121, 116, 105, 118, 105, 116, 99, 97, 218};


//: contact_fragment_friend
Byte str_ceremonyName[] = {91, 23, 4, 223, 100, 110, 101, 105, 114, 102, 95, 116, 110, 101, 109, 103, 97, 114, 102, 95, 116, 99, 97, 116, 110, 111, 99, 85};


//: contact_fragment_group
Byte str_attractValue[] = {3, 22, 8, 159, 249, 100, 210, 55, 112, 117, 111, 114, 103, 95, 116, 110, 101, 109, 103, 97, 114, 102, 95, 116, 99, 97, 116, 110, 111, 99, 60};

// __DEBUG__
// __CLOSE_PRINT__
//
//  TeamViewController.m
//  AppleProject
//
//  Created by Yan Wang on 2025/2/8.
//  Copyright © 2025 AppleProject. All rights reserved.
//

// __M_A_C_R_O__
//: #import "ZOMNForwardViewController.h"
#import "TeamViewController.h"
//: #import "NTESFriendListTableViewCell.h"
#import "TingStateViewCell.h"
//: #import "NTESContactDataCell.h"
#import "AccountingDataTeamViewCell.h"

//: @interface ZOMNForwardViewController ()<UITableViewDataSource,UITableViewDelegate>
@interface TeamViewController ()<UITableViewDataSource,UITableViewDelegate>


//: @property(nonatomic, strong) UITableView *tableView;
@property(nonatomic, strong) UITableView *tableView;
//: @property (nonatomic ,assign) NSInteger sliderIndex;
@property (nonatomic ,assign) NSInteger sliderIndex;

//: @property (nonatomic,strong) UIImageView *topborder1;
@property (nonatomic,strong) UIImageView *topborder1;
//: @property (nonatomic,strong) UIButton *btnfriend;
@property (nonatomic,strong) UIButton *btnfriend;

//: @property (nonatomic,strong) UIImageView *topborder2;
@property (nonatomic,strong) UIImageView *topborder2;
//: @property (nonatomic,strong) UIButton *btngroup;
@property (nonatomic,strong) UIButton *btngroup;

//: @property (nonatomic ,strong) NSArray *groupArray;
@property (nonatomic ,strong) NSArray *groupArray;
//: @property (nonatomic ,strong) NSArray *friendArray;
@property (nonatomic ,strong) NSArray *friendArray;


//: @end
@end

//: @implementation ZOMNForwardViewController
@implementation TeamViewController

//: - (void)viewWillAppear:(BOOL)animated{
- (void)viewWillAppear:(BOOL)animated{
    //: [super viewWillAppear:animated];
    [super viewWillAppear:animated];
    //: [self.navigationController.navigationBar setHidden:YES];
    [self.navigationController.navigationBar setHidden:YES];
}

//: -(void)viewWillDisappear:(BOOL)animated{
-(void)viewWillDisappear:(BOOL)animated{
    //: [super viewWillDisappear:animated];
    [super viewWillDisappear:animated];
    //: [self.navigationController.navigationBar setHidden:NO];
    [self.navigationController.navigationBar setHidden:NO];

}

//: - (void)backAction{
- (void)withItem{
    //: [self.navigationController popViewControllerAnimated:NO];
    [self.navigationController popViewControllerAnimated:NO];
}

//: - (void)viewDidLoad {
- (void)viewDidLoad {
    //: [super viewDidLoad];
    [super viewDidLoad];
    //    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"common_bg"]];
    //: UIImageView *bg = [[UIImageView alloc]initWithFrame:self.view.bounds];
    UIImageView *bg = [[UIImageView alloc]initWithFrame:self.view.bounds];
    //: bg.image = [UIImage imageNamed:@"common_bg"];
    bg.image = [UIImage imageNamed:StringFromDuringModeHorseData(str_refugeeTitle)];
    //: [self.view addSubview:bg];
    [self.view addSubview:bg];

    //: UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, (44.0f + [UIDevice vg_statusBarHeight]))];
    UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, (44.0f + [UIDevice task]))];
    //: [self.view addSubview:bgView];
    [self.view addSubview:bgView];

    //: UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    //: backButton.frame = CGRectMake(5, [UIDevice vg_statusBarHeight]+4, 40, 40);
    backButton.frame = CGRectMake(5, [UIDevice task]+4, 40, 40);
    //: [backButton setImage:[UIImage imageNamed:@"back_arrow_bl"] forState:(UIControlStateNormal)];
    [backButton setImage:[UIImage imageNamed:StringFromDuringModeHorseData(str_imposeCandidIncreasingContent)] forState:(UIControlStateNormal)];
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
    //: labtitle.text = [NTESLanguageManager getTextWithKey:@"activity_wallet_zhuan"];
    labtitle.text = [MaxInformation off:StringFromDuringModeHorseData(str_advanceNessData)];
    //: [bgView addSubview:labtitle];
    [bgView addSubview:labtitle];

    //: UIView *topview = [[UIView alloc]initWithFrame:CGRectMake(0, (44.0f + [UIDevice vg_statusBarHeight]), [[UIScreen mainScreen] bounds].size.width, 40)];
    UIView *topview = [[UIView alloc]initWithFrame:CGRectMake(0, (44.0f + [UIDevice task]), [[UIScreen mainScreen] bounds].size.width, 40)];
    //: [self.view addSubview:topview];
    [self.view addSubview:topview];
    //: UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 39.5, [[UIScreen mainScreen] bounds].size.width, 0.5)];
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 39.5, [[UIScreen mainScreen] bounds].size.width, 0.5)];
    //: line.backgroundColor = [UIColor colorWithHexString:@"#DDDDDD"];
    line.backgroundColor = [UIColor direction:StringFromDuringModeHorseData(str_memberSizeData)];
    //: [topview addSubview:line];
    [topview addSubview:line];

    //: _btnfriend = [UIButton buttonWithType:UIButtonTypeCustom];
    _btnfriend = [UIButton buttonWithType:UIButtonTypeCustom];
    //: _btnfriend.frame = CGRectMake([[UIScreen mainScreen] bounds].size.width/2-80, 0, 80, 40);
    _btnfriend.frame = CGRectMake([[UIScreen mainScreen] bounds].size.width/2-80, 0, 80, 40);
    //: _btnfriend.tag = 0;
    _btnfriend.tag = 0;
    //: _btnfriend.titleLabel.font = [UIFont systemFontOfSize:18];
    _btnfriend.titleLabel.font = [UIFont systemFontOfSize:18];
    //: [_btnfriend setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_btnfriend setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //: [_btnfriend setTitle:[NTESLanguageManager getTextWithKey:@"contact_fragment_friend"] forState:UIControlStateNormal];
    [_btnfriend setTitle:[MaxInformation off:StringFromDuringModeHorseData(str_ceremonyName)] forState:UIControlStateNormal];
    //: [_btnfriend addTarget:self action:@selector(sliderButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [_btnfriend addTarget:self action:@selector(sizeMedia:) forControlEvents:UIControlEventTouchUpInside];
    //: [topview addSubview:_btnfriend];
    [topview addSubview:_btnfriend];
//    [_btnfriend sizeToFit];
    //: _topborder1 = [[UIImageView alloc]initWithFrame:CGRectMake([[UIScreen mainScreen] bounds].size.width/2-80+32, _btnfriend.bottom-10, 16, 4)];
    _topborder1 = [[UIImageView alloc]initWithFrame:CGRectMake([[UIScreen mainScreen] bounds].size.width/2-80+32, _btnfriend.bottom-10, 16, 4)];
    //: _topborder1.backgroundColor = [UIColor blackColor];
    _topborder1.backgroundColor = [UIColor blackColor];
    //: _topborder1.layer.cornerRadius = 2;
    _topborder1.layer.cornerRadius = 2;
    //: _topborder1.layer.masksToBounds = YES;
    _topborder1.layer.masksToBounds = YES;
    //: [topview addSubview:_topborder1];
    [topview addSubview:_topborder1];


    //: _btngroup = [UIButton buttonWithType:UIButtonTypeCustom];
    _btngroup = [UIButton buttonWithType:UIButtonTypeCustom];
    //: _btngroup.frame = CGRectMake([[UIScreen mainScreen] bounds].size.width/2, 0, 80, 40);
    _btngroup.frame = CGRectMake([[UIScreen mainScreen] bounds].size.width/2, 0, 80, 40);
    //: _btngroup.tag = 1;
    _btngroup.tag = 1;
    //: _btngroup.titleLabel.font = [UIFont systemFontOfSize:14];
    _btngroup.titleLabel.font = [UIFont systemFontOfSize:14];
    //: [_btngroup setTitleColor:[UIColor colorWithHexString:@"#8282A7"] forState:UIControlStateNormal];
    [_btngroup setTitleColor:[UIColor direction:StringFromDuringModeHorseData(str_encounterData)] forState:UIControlStateNormal];
    //: [_btngroup setTitle:[NTESLanguageManager getTextWithKey:@"contact_fragment_group"] forState:UIControlStateNormal];
    [_btngroup setTitle:[MaxInformation off:StringFromDuringModeHorseData(str_attractValue)] forState:UIControlStateNormal];
    //: [_btngroup addTarget:self action:@selector(sliderButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [_btngroup addTarget:self action:@selector(sizeMedia:) forControlEvents:UIControlEventTouchUpInside];
    //: [topview addSubview:_btngroup];
    [topview addSubview:_btngroup];
//    [_btngroup sizeToFit];
    //: _topborder2 = [[UIImageView alloc]initWithFrame:CGRectMake([[UIScreen mainScreen] bounds].size.width/2+32, _btngroup.bottom-10, 16, 4)];
    _topborder2 = [[UIImageView alloc]initWithFrame:CGRectMake([[UIScreen mainScreen] bounds].size.width/2+32, _btngroup.bottom-10, 16, 4)];
    //: _topborder2.backgroundColor = [UIColor blackColor];
    _topborder2.backgroundColor = [UIColor blackColor];
    //: _topborder2.layer.cornerRadius = 2;
    _topborder2.layer.cornerRadius = 2;
    //: _topborder2.layer.masksToBounds = YES;
    _topborder2.layer.masksToBounds = YES;
    //: [topview addSubview:_topborder2];
    [topview addSubview:_topborder2];
    //: _topborder2.hidden = YES;
    _topborder2.hidden = YES;


    //: [self.view addSubview:self.tableView];
    [self.view addSubview:self.tableView];
    //: _sliderIndex = 0;
    _sliderIndex = 0;
    //: [self prepareData];
    [self text];
}

//: -(void)sliderButtonClick:(UIButton *)sender
-(void)sizeMedia:(UIButton *)sender
{
    //: sender.selected = YES;
    sender.selected = YES;

    //: if(sender == self.btnfriend){
    if(sender == self.btnfriend){
        //: _btngroup.titleLabel.font = [UIFont systemFontOfSize:14];
        _btngroup.titleLabel.font = [UIFont systemFontOfSize:14];
        //: [_btngroup setTitleColor:[UIColor colorWithHexString:@"#8282A7"] forState:UIControlStateNormal];
        [_btngroup setTitleColor:[UIColor direction:StringFromDuringModeHorseData(str_encounterData)] forState:UIControlStateNormal];
        //: _btnfriend.titleLabel.font = [UIFont systemFontOfSize:18];
        _btnfriend.titleLabel.font = [UIFont systemFontOfSize:18];
        //: [_btnfriend setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_btnfriend setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        //: self.topborder1.hidden = NO;
        self.topborder1.hidden = NO;
        //: self.topborder2.hidden = YES;
        self.topborder2.hidden = YES;
    //: }else if (sender == self.btngroup){
    }else if (sender == self.btngroup){
        //: _btnfriend.titleLabel.font = [UIFont systemFontOfSize:14];
        _btnfriend.titleLabel.font = [UIFont systemFontOfSize:14];
        //: [_btnfriend setTitleColor:[UIColor colorWithHexString:@"#8282A7"] forState:UIControlStateNormal];
        [_btnfriend setTitleColor:[UIColor direction:StringFromDuringModeHorseData(str_encounterData)] forState:UIControlStateNormal];
        //: _btngroup.titleLabel.font = [UIFont systemFontOfSize:18];
        _btngroup.titleLabel.font = [UIFont systemFontOfSize:18];
        //: [_btngroup setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_btngroup setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        //: self.topborder1.hidden = YES;
        self.topborder1.hidden = YES;
        //: self.topborder2.hidden = NO;
        self.topborder2.hidden = NO;
    }

    //: _sliderIndex = sender.tag;
    _sliderIndex = sender.tag;
    //: [_tableView reloadData];
    [_tableView reloadData];

}

//: - (void)prepareData
- (void)text
{
    //: self.friendArray = [NIMSDK sharedSDK].userManager.myFriends;
    self.friendArray = [NIMSDK sharedSDK].userManager.myFriends;
    //: self.groupArray = [NIMSDK sharedSDK].teamManager.allMyTeams;
    self.groupArray = [NIMSDK sharedSDK].teamManager.allMyTeams;

    //: [self.tableView reloadData];
    [self.tableView reloadData];
}

//: #pragma mark - UITableViewDelegate
#pragma mark - UITableViewDelegate
//: - (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //: [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    //: if(_sliderIndex <= 0){
    if(_sliderIndex <= 0){
        //: NIMUser *friend = self.friendArray[indexPath.row];
        NIMUser *friend = self.friendArray[indexPath.row];
        //: self.session = [NIMSession session:friend.userId type:NIMSessionTypeP2P];
        self.session = [NIMSession session:friend.userId type:NIMSessionTypeP2P];
    //: }else{
    }else{
        //: NIMTeam *team = self.groupArray[indexPath.row];
        NIMTeam *team = self.groupArray[indexPath.row];
        //: self.session = [NIMSession session:team.teamId type:NIMSessionTypeTeam];
        self.session = [NIMSession session:team.teamId type:NIMSessionTypeTeam];
    }

    //: NSError *err;
    NSError *err;
    //: [[[NIMSDK sharedSDK] chatManager] forwardMessage:self.message toSession:self.session error:&err];
    [[[NIMSDK sharedSDK] chatManager] forwardMessage:self.message toSession:self.session error:&err];

    //: if(!err){
    if(!err){
        //: [self.view makeToast:@"已发送".nim_localized duration:1.0 position:CSToastPositionCenter title:nil image:nil style:nil completion:^(BOOL didTap) {
        [self.view makeToast:StringFromDuringModeHorseData(str_balanceTerriblyContent).trapLocalized duration:1.0 position:CSToastPositionCenter title:nil image:nil style:nil completion:^(BOOL didTap) {
            //: [self.navigationController popViewControllerAnimated:NO];
            [self.navigationController popViewControllerAnimated:NO];
        //: }];
        }];
    //: }else{
    }else{
        //: [self.view makeToast:@"转发失败".nim_localized duration:2.0 position:CSToastPositionCenter];
        [self.view makeToast:StringFromDuringModeHorseData(str_oyName).trapLocalized duration:2.0 position:CSToastPositionCenter];
    }

}

//: - (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    //: return 56;
    return 56;
}

//: - (NIMSession *)didGetSessionWithTeam:(id)team {
- (NIMSession *)translateBackground:(id)team {
    //: NIMTeam *teamItem = (NIMTeam *)team;
    NIMTeam *teamItem = (NIMTeam *)team;
    //: NIMSession *session = [NIMSession session:teamItem.teamId type:NIMSessionTypeTeam];
    NIMSession *session = [NIMSession session:teamItem.teamId type:NIMSessionTypeTeam];
    //: return session;
    return session;
}

//: #pragma mark - UITableViewDataSource
#pragma mark - UITableViewDataSource
//: - (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    //: if (_sliderIndex <= 0) {
    if (_sliderIndex <= 0) {
        //: return self.friendArray.count;
        return self.friendArray.count;
    //: }else{
    }else{
        //: return self.groupArray.count;
        return self.groupArray.count;
    }
}
//: - (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //: return 1;
    return 1;
}
//: - (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    //: return 0.01f;
    return 0.01f;
}
//: - (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    //: return 0.01f;
    return 0.01f;
}
//: - (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    //: return [[UIView alloc] init];
    return [[UIView alloc] init];
}
//: - (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    //: return [[UIView alloc] init];
    return [[UIView alloc] init];
}
//: - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //: if (_sliderIndex <= 0) {
    if (_sliderIndex <= 0) {
        //: NIMUser *user = self.friendArray[indexPath.section];
        NIMUser *user = self.friendArray[indexPath.section];

        //: NTESFriendListTableViewCell *cell = [NTESFriendListTableViewCell cellWithTableView:tableView];
        TingStateViewCell *cell = [TingStateViewCell call:tableView];
//        cell.delegate = self;
        //: [cell reloadUserItem:user];
        [cell option:user];
        //: cell.messageBtn.hidden = YES;
        cell.messageBtn.hidden = YES;

        //: return cell;
        return cell;

    //: }else{
    }else{

        //: NIMTeam *team = self.groupArray[indexPath.section];
        NIMTeam *team = self.groupArray[indexPath.section];

        //: NTESContactDataCell * cell = [tableView dequeueReusableCellWithIdentifier:@"KEKEItemCell"];
        AccountingDataTeamViewCell * cell = [tableView dequeueReusableCellWithIdentifier:StringFromDuringModeHorseData(str_nomeValue)];
        //: if (!cell) {
        if (!cell) {
            //: cell = [[NTESContactDataCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"KEKEItemCell"];
            cell = [[AccountingDataTeamViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:StringFromDuringModeHorseData(str_nomeValue)];
        }
        //: cell.backgroundColor = [UIColor clearColor];
        cell.backgroundColor = [UIColor clearColor];
        //: cell.accessoryType = UITableViewCellAccessoryNone;
        cell.accessoryType = UITableViewCellAccessoryNone;
        //: [cell refreshTeam:team];
        [cell cell:team];
//        [cell setDelegate:self];

        //: return cell;
        return cell;
    }
}

//: - (UITableView *)tableView {
- (UITableView *)tableView {
    //: if (!_tableView) {
    if (!_tableView) {
        //: _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, (44.0f + [UIDevice vg_statusBarHeight])+40, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height-(44.0f + [UIDevice vg_statusBarHeight])-40) style:UITableViewStyleGrouped];
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, (44.0f + [UIDevice task])+40, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height-(44.0f + [UIDevice task])-40) style:UITableViewStyleGrouped];
        //: _tableView.delegate = self;
        _tableView.delegate = self;
        //: _tableView.dataSource = self;
        _tableView.dataSource = self;
        //: _tableView.backgroundColor = [UIColor clearColor];
        _tableView.backgroundColor = [UIColor clearColor];
        //: _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    //: return _tableView;
    return _tableView;
}

//: @end
@end

Byte * DuringModeHorseDataToCache(Byte *data) {
    int swing = data[0];
    int telecommunication = data[1];
    int neither = data[2];
    if (!swing) return data + neither;
    for (int i = 0; i < telecommunication / 2; i++) {
        int begin = neither + i;
        int end = neither + telecommunication - i - 1;
        Byte temp = data[begin];
        data[begin] = data[end];
        data[end] = temp;
    }
    data[0] = 0;
    data[neither + telecommunication] = 0;
    return data + neither;
}

NSString *StringFromDuringModeHorseData(Byte *data) {
    return [NSString stringWithUTF8String:(char *)DuringModeHorseDataToCache(data)];
}  
