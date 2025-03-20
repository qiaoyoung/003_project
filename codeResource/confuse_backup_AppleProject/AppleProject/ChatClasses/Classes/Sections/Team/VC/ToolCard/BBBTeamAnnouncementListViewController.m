//
//  TeamAnnouncementListViewController.m
//  NIM
//
//  Created by Xuhui on 15/3/31.
//  Copyright (c) 2015年 Netease. All rights reserved.
//

#import "BBBTeamAnnouncementListViewController.h"
#import "BBBUsrInfoData.h"
#import "BBBCreateTeamAnnouncement.h"
#import "BBBTeamAnnouncementListCell.h"
#import "CCCKitDependency.h"
#import "CCCKitProgressHUD.h"
#import "CCCGlobalMacro.h"
#import "LEEAlert.h"
#import "LEEAlertHelper.h"

@interface BBBTeamAnnouncementListViewController () <UITableViewDelegate,
                                                     UITableViewDataSource,
                                                     NTESCreateTeamAnnouncementDelegate>

@property (nonatomic,strong) NSMutableArray *announcements;;
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NIMTeamAnnouncementListOption *option;

@property (nonatomic,strong) UIView *defView;
@property (nonatomic,strong) UIView *box;

@end

@implementation BBBTeamAnnouncementListViewController

- (instancetype)initWithOption:(NIMTeamAnnouncementListOption *)option {
    if (self = [super initWithNibName:nil bundle:nil]) {
        self.option = option;
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
    labtitle.text = LangKey(@"activity_group_info_group_toast");//群公告
    [bgView addSubview:labtitle];
    
    
    [self.view addSubview:self.defView];
    [self.view addSubview:self.box];
    self.box.frame = CGRectMake(0, SCREEN_HEIGHT-64-SCREEN_BOTTOM_HEIGHT, SCREEN_WIDTH, 64);
    
    [self setupUI];
}

- (void)setupUI {
    [self.view addSubview:self.tableView];
    
//    if(_option.canCreateAnnouncement) {
   
//        // 新建
//        UIBarButtonItem *addItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"add_noticess"] style:UIBarButtonItemStyleDone target:self action:@selector(onCreateAnnouncement:)];
//
//        // @"清空"
//        UIBarButtonItem *cleanItem =[[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"clear_notice"] style:UIBarButtonItemStyleDone target:self action:@selector(onCleanAnnouncement:)];
//
//
//        self.navigationItem.rightBarButtonItems = @[cleanItem,addItem];
     
    
//    }
}

- (void)setOption:(NIMTeamAnnouncementListOption *)option {
    _option = option;
    [self updateAnnouncementsWithContent:option.announcement];
}

- (void)updateAnnouncementsWithContent:(NSString *)content {
    if (content) {
        NSData *contentData = [content dataUsingEncoding:NSUTF8StringEncoding];
        NSArray *datas = [NSJSONSerialization JSONObjectWithData:contentData options:0 error:0];
        _announcements = [NSMutableArray arrayWithArray:datas];
    } else {
        _announcements = nil;
    }
    if(_announcements == nil){
        self.tableView.hidden = YES;
        self.defView.hidden = NO;
        self.box.hidden = YES;
    }else{
        self.tableView.hidden = NO;
        self.defView.hidden = YES;
        if(_option.canCreateAnnouncement) {
            self.box.hidden = NO;
        }
    }
}

- (void)onCreateAnnouncement:(id)sender {
    BBBCreateTeamAnnouncement *vc = [[BBBCreateTeamAnnouncement alloc] initWithNibName:nil bundle:nil];
    vc.delegate = self;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)onEditAnnouncement:(id)sender {
    
    NSDictionary *announcement = _announcements.lastObject;
    
    BBBCreateTeamAnnouncement *vc = [[BBBCreateTeamAnnouncement alloc] initWithNibName:nil bundle:nil];
    vc.delegate = self;
    vc.defaultTitle = [announcement objectForKey:@"title"] ?: @"";
    vc.defaultContent = [announcement objectForKey:@"content"] ?: @"";
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)onCleanAnnouncement:(id)sender {

    __weak typeof(self) wself = self;

    [LEEAlert alert].config
        .LeeAddTitle(^(UILabel *label) {
            label.text = LangKey(@"sure_to_clear");
            label.textColor = [UIColor grayColor];
        })
        .LeeAddAction(^(LEEAction *action) {
            
            action.type = LEEActionTypeCancel;
            action.title = LangKey(@"contact_tag_fragment_cancel");//@"取消"
            action.titleColor = [UIColor grayColor];
            action.backgroundColor = [UIColor whiteColor];
            action.backgroundHighlightColor = [UIColor colorWithRed:239/255.0f green:239/255.0f blue:239/255.0f alpha:1.0f];
            action.borderWidth = 1.0f;
            action.borderColor = action.backgroundHighlightColor;
            action.clickBlock = ^{
                
                // 取消点击事件Block
            };
        })
        .LeeAddAction(^(LEEAction *action) {
            
            action.type = LEEActionTypeDefault;
            action.title = LangKey(@"contact_tag_fragment_sure"); //@"确定";
            action.titleColor = [UIColor redColor];
            action.backgroundColor = [UIColor whiteColor];
            action.backgroundHighlightColor = [UIColor colorWithRed:239/255.0f green:239/255.0f blue:239/255.0f alpha:1.0f];
            action.borderWidth = 1.0f;
            action.borderColor = action.backgroundHighlightColor;
            action.clickBlock = ^{
                // 删除点击事件Block
                [wself cleanTeamAnnouncement];
            };
        })
        .LeeHeaderColor([UIColor whiteColor])
        .LeeShow();
}

- (void)cleanTeamAnnouncement
{
    __weak typeof(self) wself = self;
    [CCCKitProgressHUD show];
    NSDictionary *announcement = @{@"title": @"",
                                   @"content": @"",
                                   @"creator": [[NIMSDK sharedSDK].loginManager currentAccount],
                                   @"time": @((NSInteger)[NSDate date].timeIntervalSince1970)};
    NSData *data = [NSJSONSerialization dataWithJSONObject:@[announcement] options:0 error:nil];
    self.option.team.announcement = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
    [[NIMSDK sharedSDK].teamManager updateTeamAnnouncement:wself.option.team.announcement teamId:wself.option.team.teamId completion:^(NSError *error) {
        [CCCKitProgressHUD dismiss];
        if(!error && wself) {
            [wself.view makeToast:LangKey(@"Clean_success")];// @"清理成功"
            wself.announcements = nil;
//            [wself.tableView reloadData];
            
            self.tableView.hidden = YES;
            self.defView.hidden = NO;
            self.box.hidden = YES;
        }
    }];
}


#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _announcements.lastObject ? 1 : 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary *announcement = _announcements.lastObject;
    NSString *content = [announcement objectForKey:@"content"];
    
    return [BBBTeamAnnouncementListCell cellHeight:content];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *announcement = _announcements.lastObject;
    BBBTeamAnnouncementListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BBBTeamAnnouncementListCell"];
    if (!cell) {
        cell = [[BBBTeamAnnouncementListCell alloc] initWithStyle:(UITableViewCellStyleValue1) reuseIdentifier:@"BBBTeamAnnouncementListCell"];
    }
    [cell refreshData:announcement nick:_option.nick];
//
//    BBBTeamAnnouncementListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BBBTeamAnnouncementListCell"];
//    [cell refreshData:announcement nick:_option.nick];
    return cell;
}

#pragma mark - CreateTeamAnnouncementDelegate
- (void)createTeamAnnouncementCompleteWithTitle:(NSString *)title content:(NSString *)content {
    NSString *ret = nil;
    NSDictionary *announcement = @{@"title": title ?: @"",
                                   @"content": content ?: @"",
                                   @"creator": [[NIMSDK sharedSDK].loginManager currentAccount],
                                   @"time": @((NSInteger)[NSDate date].timeIntervalSince1970)};
    NSData *data = [NSJSONSerialization dataWithJSONObject:@[announcement] options:0 error:nil];
    ret = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
    [CCCKitProgressHUD show];
    if ([_delegate respondsToSelector:@selector(didUpdateAnnouncement:completion:)]) {
        __weak typeof(self) wself = self;
        [_delegate didUpdateAnnouncement:ret completion:^(NSError *error) {
            [CCCKitProgressHUD dismiss];
            if(!error) {
                [wself.view makeToast:LangKey(@"team_create_helper_create_success")];
                [wself updateAnnouncementsWithContent:ret];
                [wself.tableView reloadData];
            } else {
                [wself.view makeToast:LangKey(@"team_create_helper_create_failed")];
            }
        }];
    }
}

#pragma mark - Getter
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(15, SCREEN_TOP_HEIGHT+15, SCREEN_WIDTH-30, SCREEN_HEIGHT-SCREEN_TOP_HEIGHT-15-64-SCREEN_BOTTOM_HEIGHT) style:UITableViewStylePlain];
        _tableView.backgroundColor = [UIColor clearColor];
//        _tableView.rowHeight = SCREEN_HEIGHT;
        [_tableView setTableFooterView:[UIView new]];
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

- (UIView *)defView{
    if(!_defView){
        _defView = [[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_TOP_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT-SCREEN_TOP_HEIGHT)];
        _defView.hidden = YES;
        
        UIImageView *defImg = [[UIImageView alloc]initWithFrame:CGRectMake((SCREEN_WIDTH-280)/2, 150, 276, 160)];
        defImg.image = [UIImage imageNamed:@"ic_none_announcement"];
        [_defView addSubview:defImg];
        
        UILabel *emptyTipLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, defImg.bottom+5, SCREEN_WIDTH, 20)];
        emptyTipLabel.textColor = TextColor_3;
        emptyTipLabel.font = [UIFont systemFontOfSize:12];
        emptyTipLabel.textAlignment = NSTextAlignmentCenter;
        [_defView addSubview:emptyTipLabel];
        emptyTipLabel.text = LangKey(@"No_group_announcement");
        
        UIButton *emptyButton = [UIButton buttonWithType:UIButtonTypeCustom];
        emptyButton.frame = CGRectMake(15, SCREEN_HEIGHT-SCREEN_TOP_HEIGHT-44-SCREEN_BOTTOM_HEIGHT, SCREEN_WIDTH-30, 44);
//        emptyButton.backgroundColor = RGB_COLOR_String(@"#875FFA");
        emptyButton.titleLabel.font = [UIFont systemFontOfSize:15];
//        emptyButton.layer.masksToBounds = YES;
//        emptyButton.layer.cornerRadius = 10;
        [emptyButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [emptyButton setTitle:LangKey(@"Create_group_announcement") forState:UIControlStateNormal];
        [emptyButton addTarget:self action:@selector(onCreateAnnouncement:) forControlEvents:UIControlEventTouchUpInside];
        [_defView addSubview:emptyButton];
        
        emptyButton.backgroundColor = ThemeColor;
        emptyButton.layer.cornerRadius = 10;
        emptyButton.layer.shadowColor = DeepBtnColor.CGColor;
        emptyButton.layer.shadowOffset = CGSizeMake(0,3);
        emptyButton.layer.shadowOpacity = 1;
        emptyButton.layer.shadowRadius = 0;
        
    }
    return _defView;
}

- (UIView *)box
{
    if(!_box){
        _box = [[UIView alloc]init];
        _box.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1];
//        [self.view addSubview:_box];
        _box.layer.shadowColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.0400].CGColor;
        _box.layer.shadowOffset = CGSizeMake(0,0);
        _box.layer.shadowOpacity = 1;
        _box.layer.shadowRadius = 12;
        _box.hidden = YES;
        
        CGFloat width = (SCREEN_WIDTH-45)/2;
        UIButton *closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        closeBtn.frame = CGRectMake(15, 10, width, 44);
        [closeBtn addTarget:self action:@selector(onEditAnnouncement:) forControlEvents:UIControlEventTouchUpInside];
       [closeBtn setImage:[UIImage imageNamed:@"add_noticess"] forState:UIControlStateNormal];
        closeBtn.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1];
        closeBtn.layer.borderWidth = 0.5;
        closeBtn.layer.borderColor = [UIColor colorWithRed:236/255.0 green:236/255.0 blue:236/255.0 alpha:1].CGColor;
        closeBtn.layer.cornerRadius = 10;
        closeBtn.layer.shadowColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.0800].CGColor;
        closeBtn.layer.shadowOffset = CGSizeMake(0,3);
        closeBtn.layer.shadowOpacity = 1;
        closeBtn.layer.shadowRadius = 0;
        [_box addSubview:closeBtn];


        UIButton *sureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        sureBtn.frame = CGRectMake(width+30, 10, width, 44);
        [sureBtn addTarget:self action:@selector(onCleanAnnouncement:) forControlEvents:UIControlEventTouchUpInside];
        [sureBtn setImage:[UIImage imageNamed:@"clear_notice"] forState:UIControlStateNormal];
        sureBtn.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1];
        sureBtn.layer.borderWidth = 0.5;
        sureBtn.layer.borderColor = [UIColor colorWithRed:236/255.0 green:236/255.0 blue:236/255.0 alpha:1].CGColor;
        sureBtn.layer.cornerRadius = 10;
        sureBtn.layer.shadowColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.0800].CGColor;
        sureBtn.layer.shadowOffset = CGSizeMake(0,3);
        sureBtn.layer.shadowOpacity = 1;
        sureBtn.layer.shadowRadius = 0;
        [_box addSubview:sureBtn];
    }
    return _box;
}


@end

@implementation NIMTeamAnnouncementListOption
@end
