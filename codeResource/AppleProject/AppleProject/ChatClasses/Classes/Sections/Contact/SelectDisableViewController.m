
#import <Foundation/Foundation.h>

NSString *StringFromDoctrineData(Byte *data);


//: select_contact
Byte str_interventionEgretData[] = {43, 14, 10, 135, 93, 8, 199, 207, 104, 203, 116, 99, 97, 116, 110, 111, 99, 95, 116, 99, 101, 108, 101, 115, 153};


//: back_arrow_bl
Byte str_perhapsFileData[] = {54, 13, 9, 20, 102, 26, 46, 151, 79, 108, 98, 95, 119, 111, 114, 114, 97, 95, 107, 99, 97, 98, 153};


//: #999999
Byte str_cellFessData[] = {83, 7, 3, 57, 57, 57, 57, 57, 57, 35, 52};


//: SelectContactCellID
Byte str_lowDirtyVendValue[] = {66, 19, 7, 218, 238, 137, 213, 68, 73, 108, 108, 101, 67, 116, 99, 97, 116, 110, 111, 67, 116, 99, 101, 108, 101, 83, 162};


//: No friends，please add friends
Byte str_competitiveName[] = {56, 31, 6, 146, 66, 15, 115, 100, 110, 101, 105, 114, 102, 32, 100, 100, 97, 32, 101, 115, 97, 101, 108, 112, 140, 188, 239, 115, 100, 110, 101, 105, 114, 102, 32, 111, 78, 91};


//: no_friend
Byte str_rawContent[] = {52, 9, 12, 14, 6, 238, 97, 200, 181, 57, 7, 74, 100, 110, 101, 105, 114, 102, 95, 111, 110, 188};


//: icon_checkbox_selected
Byte str_axImmuneValue[] = {71, 22, 12, 92, 248, 230, 120, 160, 193, 139, 125, 35, 100, 101, 116, 99, 101, 108, 101, 115, 95, 120, 111, 98, 107, 99, 101, 104, 99, 95, 110, 111, 99, 105, 60};


//: common_bg
Byte str_gelContent[] = {20, 9, 10, 146, 52, 1, 232, 152, 235, 210, 103, 98, 95, 110, 111, 109, 109, 111, 99, 248};

// __DEBUG__
// __CLOSE_PRINT__
//
//  SelectDisableViewController.m
// Indicator
//
//  Created by chris on 15/9/14.
//  Copyright (c) 2015年 NetEase. All rights reserved.
//

// __M_A_C_R_O__
//: #import "AAAContactSelectViewController.h"
#import "SelectDisableViewController.h"
//: #import "AAAContactSelectTabView.h"
#import "EliteView.h"
//: #import "AAAContactPickedView.h"
#import "TeamMarkView.h"
//: #import "AAAGroupedUsrInfo.h"
#import "AAAGroupedUsrInfo.h"
//: #import "AAAAppleProjectGroupedData.h"
#import "NameChecked.h"
//: #import "AAAContactDataCell.h"
#import "FromOfView.h"
//: #import "UIViewNimKit.h"
#import "UIViewNimKit.h"
//: #import "AppleProjectKit.h"
#import "Indicator.h"
//: #import "CCCKitDependency.h"
#import "CCCKitDependency.h"
//: #import "CCCGlobalMacro.h"
#import "CCCGlobalMacro.h"
//: #import "AAASetGroupNameView.h"
#import "FullView.h"
//: #import "ZMONGroupAvatarViewController.h"
#import "ModeViewController.h"

//: @interface AAAContactSelectViewController ()<UITableViewDataSource, UITableViewDelegate, AAAContactPickedViewDelegate>{
@interface SelectDisableViewController ()<UITableViewDataSource, UITableViewDelegate, ShouldDelegate>{
    //: NSMutableArray *_selectecContacts;
    NSMutableArray *_selectecContacts;
}
//: @property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) UITableView *tableView;
//: @property(nonatomic, strong) AAASetGroupNameView *setGroupnameView;
@property(nonatomic, strong) FullView *setGroupnameView;
//: @property(nonatomic, strong) UIView *headerview;
@property(nonatomic, strong) UIView *headerview;
//: @property(nonatomic, strong) UIButton *selectedBtn;
@property(nonatomic, strong) UIButton *selectedBtn;
//: @property(nonatomic, strong) UITextField *textfield;
@property(nonatomic, strong) UITextField *textfield;
//: @property(nonatomic, strong) UIImage *headPortrait;
@property(nonatomic, strong) UIImage *headPortrait;

//: @property (strong, nonatomic) AAAContactSelectTabView *selectIndicatorView;
@property (strong, nonatomic) EliteView *selectIndicatorView;

//: @property (nonatomic, assign) NSInteger maxSelectCount;
@property (nonatomic, assign) NSInteger maxSelectCount;

//: @property(nonatomic, strong) NSDictionary *contentDic;
@property(nonatomic, strong) NSDictionary *contentDic;

//: @property(nonatomic, strong) NSArray *sectionTitles;
@property(nonatomic, strong) NSArray *sectionTitles;
//: @property (nonatomic,strong) UIView *defView;
@property (nonatomic,strong) UIView *defView;

//: @end
@end

//: @implementation AAAContactSelectViewController
@implementation SelectDisableViewController

//: - (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    //: self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    //: if(self) {
    if(self) {
        //: _maxSelectCount = 9223372036854775807L;
        _maxSelectCount = 9223372036854775807L;
    }
    //: return self;
    return self;
}

//: - (instancetype)initWithConfig:(id<AAAContactSelectConfig>) config{
- (instancetype)initWithTextConfig:(id<ShowHide>) config{
    //: self = [self initWithNibName:nil bundle:nil];
    self = [self initWithNibName:nil bundle:nil];
    //: if (self) {
    if (self) {
        //: self.config = config;
        self.config = config;
    }
    //: return self;
    return self;
}


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

//: - (void)viewDidLoad
- (void)viewDidLoad
{
    //: [super viewDidLoad];
    [super viewDidLoad];
//    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"common_bg"]];
    //: UIImageView *bg = [[UIImageView alloc]initWithFrame:self.view.bounds];
    UIImageView *bg = [[UIImageView alloc]initWithFrame:self.view.bounds];
    //: bg.image = [UIImage imageNamed:@"common_bg"];
    bg.image = [UIImage imageNamed:StringFromDoctrineData(str_gelContent)];
    //: [self.view addSubview:bg];
    [self.view addSubview:bg];

    //: self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, (44.0f + [UIDevice vg_statusBarHeight]), [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height-(44.0f + [UIDevice vg_statusBarHeight])) style:UITableViewStylePlain];
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, (44.0f + [UIDevice task]), [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height-(44.0f + [UIDevice task])) style:UITableViewStylePlain];
    //: self.tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    //: self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    //: self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.backgroundColor = [UIColor clearColor];
    //: [self.view addSubview:self.tableView];
    [self.view addSubview:self.tableView];

    //: [self.view addSubview:self.defView];
    [self.view addSubview:self.defView];

    //: [self.view addSubview:self.selectIndicatorView];
    [self.view addSubview:self.selectIndicatorView];
    //: [self isshowSelectindicator];
    [self insert];

    //: self.tableView.dataSource = self;
    self.tableView.dataSource = self;
    //: self.tableView.delegate = self;
    self.tableView.delegate = self;

    //: [self setUpNav];
    [self info];

    //: self.selectIndicatorView.pickedView.delegate = self;
    self.selectIndicatorView.pickedView.delegate = self;
//    [self.selectIndicatorView.doneButton addTarget:self action:@selector(onDoneBtnClick:) forControlEvents:UIControlEventTouchUpInside];
}

//: - (void)setUpNav
- (void)info
{
    //: UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, (44.0f + [UIDevice vg_statusBarHeight]))];
    UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, (44.0f + [UIDevice task]))];
    //: [self.view addSubview:bgView];
    [self.view addSubview:bgView];

    //: UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    //: backButton.frame = CGRectMake(5, [UIDevice vg_statusBarHeight]+4, 40, 40);
    backButton.frame = CGRectMake(5, [UIDevice task]+4, 40, 40);
    //: [backButton setImage:[UIImage imageNamed:@"back_arrow_bl"] forState:(UIControlStateNormal)];
    [backButton setImage:[UIImage imageNamed:StringFromDoctrineData(str_perhapsFileData)] forState:(UIControlStateNormal)];
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
    //: labtitle.text = [NTESLanguageManager getTextWithKey:@"select_contact"];
    labtitle.text = [MaxInformation off:StringFromDoctrineData(str_interventionEgretData)];
    //: [bgView addSubview:labtitle];
    [bgView addSubview:labtitle];

    //: UIButton *submitButton = [UIButton buttonWithType:UIButtonTypeCustom];
    UIButton *submitButton = [UIButton buttonWithType:UIButtonTypeCustom];
    //: submitButton.frame = CGRectMake([[UIScreen mainScreen] bounds].size.width-15-40, [UIDevice vg_statusBarHeight]+4, 40, 40);
    submitButton.frame = CGRectMake([[UIScreen mainScreen] bounds].size.width-15-40, [UIDevice task]+4, 40, 40);
    //: [submitButton setImage:[UIImage imageNamed:@"icon_checkbox_selected"] forState:(UIControlStateNormal)];
    [submitButton setImage:[UIImage imageNamed:StringFromDoctrineData(str_axImmuneValue)] forState:(UIControlStateNormal)];
    //: [submitButton addTarget:self action:@selector(onDoneBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [submitButton addTarget:self action:@selector(userred:) forControlEvents:UIControlEventTouchUpInside];
    //: [bgView addSubview:submitButton];
    [bgView addSubview:submitButton];

//    NSString *select_contact = LangKey(@"select_contact");
//    self.navigationItem.title =select_contact;
////
////    //self.navigationItem.title = [self.config respondsToSelector:@selector(title)] ? [self.config title] : @"选择联系人".nim_localized;
////
////    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
////    button.frame = CGRectMake(0, 0, 50, 30);
////    button.titleLabel.font = [UIFont systemFontOfSize:14];
////    [button setTitle:LangKey(@"friend_circle_adapter_cancel") forState:UIControlStateNormal];
////    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
////    [button addTarget:self action:@selector(onCancelBtnClick:) forControlEvents:UIControlEventTouchUpInside];
//
//    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    backButton.frame = CGRectMake(5, SCREEN_STATUS_HEIGHT+4, 40, 40);
//    [backButton setImage:[UIImage imageNamed:@"back_arrow_b"] forState:(UIControlStateNormal)];
//    [backButton addTarget:self action:@selector(onCancelBtnClick:) forControlEvents:UIControlEventTouchUpInside];
//
//
//    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
////    if ([self.config respondsToSelector:@selector(showSelectDetail)] && self.config.showSelectDetail) {
////        UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
////        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:label];
////        [label setText:self.detailTitle];
////        [label sizeToFit];
////    }
//
//    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
//    [btn setImage:[UIImage imageNamed:@"icon_checkbox_selected"] forState:UIControlStateNormal];
//    [btn addTarget:self action:@selector(onDoneBtnClick:) forControlEvents:UIControlEventTouchUpInside];
//    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];

}

//: - (void)backAction{
- (void)withItem{
    //: if (self.presentingViewController) {
    if (self.presentingViewController) {
        //: [self dismissViewControllerAnimated:YES completion:nil];
        [self dismissViewControllerAnimated:YES completion:nil];
    //: } else {
    } else {
        //: [self.navigationController popViewControllerAnimated:NO];
        [self.navigationController popViewControllerAnimated:NO];
    }
}

//: - (void)refreshDetailTitle
- (void)enableTitle
{
    //: UIButton *btn = (UIButton *)self.navigationItem.rightBarButtonItem.customView;
    UIButton *btn = (UIButton *)self.navigationItem.rightBarButtonItem.customView;
    //: if(_selectecContacts.count > 0){
    if(_selectecContacts.count > 0){
        //: [btn setTitle:self.detailTitle forState:UIControlStateNormal];
        [btn setTitle:self.total forState:UIControlStateNormal];
        //: [btn setImage:[UIImage imageNamed:@"icon_checkbox_selected"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:StringFromDoctrineData(str_axImmuneValue)] forState:UIControlStateNormal];
//        btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
        //: btn.imageEdgeInsets = UIEdgeInsetsMake(0, 10, 0, -5);
        btn.imageEdgeInsets = UIEdgeInsetsMake(0, 10, 0, -5);
        //: btn.frame = CGRectMake(0, 0, 70, 40);
        btn.frame = CGRectMake(0, 0, 70, 40);

    //: }else{
    }else{
        //: [btn setTitle:self.detailTitle forState:UIControlStateNormal];
        [btn setTitle:self.total forState:UIControlStateNormal];
        //: [btn setImage:[UIImage imageNamed:@"icon_checkbox_selected"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:StringFromDoctrineData(str_axImmuneValue)] forState:UIControlStateNormal];
        //: btn.frame = CGRectMake(0, 0, 40, 40);
        btn.frame = CGRectMake(0, 0, 40, 40);
    }

//    UILabel *label = (UILabel *)self.navigationItem.rightBarButtonItem.customView;
//    [label setText:self.detailTitle];
//    [label sizeToFit];
}

//: - (NSString *)detailTitle
- (NSString *)total
{
//    NSString *detail = @"";
//    if ([self.config respondsToSelector:@selector(maxSelectedNum)])
//    {
//        detail = [NSString stringWithFormat:@"%zd/%zd",_selectecContacts.count,_maxSelectCount];
//    }
//    else
//    {
//        detail = [NSString stringWithFormat:@"已选%zd人".nim_localized,_selectecContacts.count];
//    }
//    return detail;
    //: NSString *detail = @"";
    NSString *detail = @"";
    //: if (_selectecContacts.count > 0)
    if (_selectecContacts.count > 0)
    {
        //: detail = [NSString stringWithFormat:@"（%zd）".nim_localized,_selectecContacts.count];
        detail = [NSString stringWithFormat:@"（%zd）".trapLocalized,_selectecContacts.count];
    }

    //: return detail;
    return detail;
}

//: - (void)viewDidLayoutSubviews{
- (void)viewDidLayoutSubviews{
    //: [super viewDidLayoutSubviews];
    [super viewDidLayoutSubviews];
    //: UIEdgeInsets safeAreaInsets = self.view.safeAreaInsets;
    UIEdgeInsets safeAreaInsets = self.view.safeAreaInsets;

//    self.selectIndicatorView.nim_width = self.view.nim_width;
//    self.tableView.nim_height = self.view.nim_height - self.selectIndicatorView.nim_height - safeAreaInsets.bottom;
//    self.selectIndicatorView.nim_bottom = self.view.nim_height - safeAreaInsets.bottom;
}

//: - (void)isshowSelectindicator
- (void)insert
{
    //: if(_selectecContacts.count > 0){
    if(_selectecContacts.count > 0){
        //: self.selectIndicatorView.hidden = NO;
        self.selectIndicatorView.hidden = NO;
        //: self.tableView.frame = CGRectMake(0, (44.0f + [UIDevice vg_statusBarHeight]), [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height-(44.0f + [UIDevice vg_statusBarHeight])-64);
        self.tableView.frame = CGRectMake(0, (44.0f + [UIDevice task]), [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height-(44.0f + [UIDevice task])-64);
    //: }else{
    }else{
        //: self.selectIndicatorView.hidden = YES;
        self.selectIndicatorView.hidden = YES;
        //: self.tableView.frame = CGRectMake(0, (44.0f + [UIDevice vg_statusBarHeight]), [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height-(44.0f + [UIDevice vg_statusBarHeight]));
        self.tableView.frame = CGRectMake(0, (44.0f + [UIDevice task]), [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height-(44.0f + [UIDevice task]));
    }
}

//: - (void)show{
- (void)fromOn{
    //: UIViewController *vc = [UIApplication sharedApplication].windows.firstObject.rootViewController;
    UIViewController *vc = [UIApplication sharedApplication].windows.firstObject.rootViewController;
    //: vc.modalPresentationStyle = UIModalPresentationFullScreen;
    vc.modalPresentationStyle = UIModalPresentationFullScreen;
    //: [vc presentViewController:[[UINavigationController alloc] initWithRootViewController:self] animated:YES completion:nil];
    [vc presentViewController:[[UINavigationController alloc] initWithRootViewController:self] animated:YES completion:nil];
}

//: - (void)setConfig:(id<AAAContactSelectConfig>)config{
- (void)setConfig:(id<ShowHide>)config{
    //: _config = config;
    _config = config;
    //: if ([config respondsToSelector:@selector(maxSelectedNum)]) {
    if ([config respondsToSelector:@selector(centerHeight)]) {
        //: _maxSelectCount = [config maxSelectedNum];
        _maxSelectCount = [config centerHeight];
        //: _contentDic = @{}.mutableCopy;
        _contentDic = @{}.mutableCopy;
        //: _sectionTitles = @[].mutableCopy;
        _sectionTitles = @[].mutableCopy;
    }
    //: [self makeData];
    [self dataWith];
}

//: - (void)onCancelBtnClick:(id)sender {
- (void)labelOpen:(id)sender {
    //: [self dismissViewControllerAnimated:YES completion:^() {
    [self dismissViewControllerAnimated:YES completion:^() {
        //: if (self.cancelBlock) {
        if (self.cancelBlock) {
            //: self.cancelBlock();
            self.cancelBlock();
            //: self.cancelBlock = nil;
            self.cancelBlock = nil;
        }
        //: if([_delegate respondsToSelector:@selector(didCancelledSelect)]) {
        if([_delegate respondsToSelector:@selector(linkString)]) {
            //: [_delegate didCancelledSelect];
            [_delegate linkString];
        }
    //: }];
    }];
}

//: - (IBAction)onDoneBtnClick:(id)sender {
- (IBAction)userred:(id)sender {

    //: if (self.config.showSelectHeaderview) {
    if (self.config.showSelectHeaderview) {

        //: [self.view addSubview:self.setGroupnameView];
        [self.view addSubview:self.setGroupnameView];
        //: [self.setGroupnameView animationShow];
        [self.setGroupnameView clean];
        @
         //: autoreleasepool{} __weak __typeof__(self) __weak_self__ = self;
         autoreleasepool{} __weak __typeof__(self) __weak_self__ = self;
        //: self.setGroupnameView.speiceBackBlock = ^(NSString *groupName){
        self.setGroupnameView.speiceBackBlock = ^(NSString *groupName){
            @
             //: try{} @finally{} __typeof__(self) self = __weak_self__;
             try{} @finally{} __typeof__(self) self = __weak_self__;
                //: if (_selectecContacts.count) {
                if (_selectecContacts.count) {
                    //: if ([self.delegate respondsToSelector:@selector(didFinishedSelect:)]) {
                    if ([self.delegate respondsToSelector:@selector(sourceTeamInfo:)]) {
                        //: [self.delegate didFinishedSelect:_selectecContacts];
                        [self.delegate sourceTeamInfo:_selectecContacts];
                    }

                    //: ZMONGroupAvatarViewController *vc = [[ZMONGroupAvatarViewController alloc]init];
                    ModeViewController *vc = [[ModeViewController alloc]init];
                    //: vc.groupName = groupName;
                    vc.groupName = groupName;
    //                vc.teamListManager = self.teamListManager;
                    //: [self.navigationController pushViewController:vc animated:YES];
                    [self.navigationController pushViewController:vc animated:YES];
                    //: vc.speiceBackBlock = ^(UIImage *avater){
                    vc.speiceBackBlock = ^(UIImage *avater){
                        //: [self dismissViewControllerAnimated:YES completion:nil];
                        [self dismissViewControllerAnimated:YES completion:nil];
                                            //: if (self.finshBlock) {
                                            if (self.finshBlock) {

                                                //: self.finshBlock(_selectecContacts, groupName, avater);
                                                self.finshBlock(_selectecContacts, groupName, avater);
                                                //: self.finshBlock = nil;
                                                self.finshBlock = nil;
                                            }
                    //: };
                    };


                }
                //: else {
                else {
                    //: if([_delegate respondsToSelector:@selector(didCancelledSelect)]) {
                    if([_delegate respondsToSelector:@selector(linkString)]) {
                        //: [_delegate didCancelledSelect];
                        [_delegate linkString];
                    }
                    //: if (self.cancelBlock) {
                    if (self.cancelBlock) {
                        //: self.cancelBlock();
                        self.cancelBlock();
                        //: self.cancelBlock = nil;
                        self.cancelBlock = nil;
                    }
                }

        //: };
        };

    //: }else{
    }else{

        //: [self dismissViewControllerAnimated:YES completion:nil];
        [self dismissViewControllerAnimated:YES completion:nil];
        //: if (_selectecContacts.count) {
        if (_selectecContacts.count) {
            //: if ([self.delegate respondsToSelector:@selector(didFinishedSelect:)]) {
            if ([self.delegate respondsToSelector:@selector(sourceTeamInfo:)]) {
                //: [self.delegate didFinishedSelect:_selectecContacts];
                [self.delegate sourceTeamInfo:_selectecContacts];
            }
            //: if (self.finshBlock) {
            if (self.finshBlock) {
                //: self.finshBlock(_selectecContacts, @"", nil);
                self.finshBlock(_selectecContacts, @"", nil);
                //: self.finshBlock = nil;
                self.finshBlock = nil;
            }
        }
        //: else {
        else {
            //: if([_delegate respondsToSelector:@selector(didCancelledSelect)]) {
            if([_delegate respondsToSelector:@selector(linkString)]) {
                //: [_delegate didCancelledSelect];
                [_delegate linkString];
            }
            //: if (self.cancelBlock) {
            if (self.cancelBlock) {
                //: self.cancelBlock();
                self.cancelBlock();
                //: self.cancelBlock = nil;
                self.cancelBlock = nil;
            }
        }
    }
}

//: - (void)makeData{
- (void)dataWith{
    //: __weak __typeof(&*self) weakSelf = self;;
    __weak __typeof(&*self) weakSelf = self;;
    //: [self.config getContactData:^(NSDictionary *contentDic, NSArray *titles) {
    [self.config eyeglasses:^(NSDictionary *contentDic, NSArray *titles) {
        //: self.contentDic = contentDic;
        self.contentDic = contentDic;
        //: self.sectionTitles = titles;
        self.sectionTitles = titles;
        //: dispatch_async(dispatch_get_main_queue(), ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            //: if(self.sectionTitles.count>0){
            if(self.sectionTitles.count>0){
                //: self.tableView.hidden = NO;
                self.tableView.hidden = NO;
                //: self.defView.hidden = YES;
                self.defView.hidden = YES;
                //: [weakSelf.tableView reloadData];
                [weakSelf.tableView reloadData];
            //: }else{
            }else{
                //: self.tableView.hidden = YES;
                self.tableView.hidden = YES;
                //: self.defView.hidden = NO;
                self.defView.hidden = NO;
            }

        //: });
        });
    //: }];
    }];
    //: if ([self.config respondsToSelector:@selector(alreadySelectedMemberId)])
    if ([self.config respondsToSelector:@selector(eliteBy)])
    {
        //: _selectecContacts = [[self.config alreadySelectedMemberId] mutableCopy];
        _selectecContacts = [[self.config eliteBy] mutableCopy];
    }

    //: _selectecContacts = _selectecContacts.count ? _selectecContacts : [NSMutableArray array];
    _selectecContacts = _selectecContacts.count ? _selectecContacts : [NSMutableArray array];
    //: for (NSString *selectId in _selectecContacts) {
    for (NSString *selectId in _selectecContacts) {
        //: CCCKitInfo *info;
        TitleInfo *info;
        //: info = [self.config getInfoById:selectId];
        info = [self.config bottom:selectId];
        //: [self.selectIndicatorView.pickedView addMemberInfo:info];
        [self.selectIndicatorView.pickedView message:info];
    }
}


//: #pragma mark - UITableViewDataSource
#pragma mark - UITableViewDataSource

//: - (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    //: return self.sectionTitles.count;
    return self.sectionTitles.count;
}

//: - (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //: NSArray *arr = [self.contentDic valueForKey:self.sectionTitles[section]];
    NSArray *arr = [self.contentDic valueForKey:self.sectionTitles[section]];
    //: return arr.count;
    return arr.count;
}

//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
//{
//    if ([self.sectionTitles[0] isEqualToString:@"$"] && section == 0) {
//        return @"机器人".nim_localized;
//    }else {
//        return self.sectionTitles[section];
//    }
//}

//: - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //: NSString *title = self.sectionTitles[indexPath.section];
    NSString *title = self.sectionTitles[indexPath.section];
    //: NSMutableArray *arr = [self.contentDic valueForKey:title];
    NSMutableArray *arr = [self.contentDic valueForKey:title];
    //: id<NIMGroupMemberProtocol> contactItem = arr[indexPath.row];
    id<UpProtocol> contactItem = arr[indexPath.row];

    //: AAAContactDataCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SelectContactCellID"];
    FromOfView *cell = [tableView dequeueReusableCellWithIdentifier:StringFromDoctrineData(str_lowDirtyVendValue)];
    //: if (cell == nil) {
    if (cell == nil) {
        //: cell = [[AAAContactDataCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"SelectContactCellID"];
        cell = [[FromOfView alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:StringFromDoctrineData(str_lowDirtyVendValue)];
    }
    //: cell.accessoryBtn.hidden = NO;
    cell.accessoryBtn.hidden = NO;
    //: cell.accessoryBtn.selected = [_selectecContacts containsObject:[contactItem memberId]];
    cell.accessoryBtn.selected = [_selectecContacts containsObject:[contactItem memberId]];
    //: [cell refreshItem:contactItem];
    [cell queryed:contactItem];
    //: return cell;
    return cell;
}

//- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView {
//    return [self.sectionTitles mutableCopy];
//}

//: #pragma mark - UITableViewDelegate
#pragma mark - UITableViewDelegate

//: - (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //: return 50;
    return 50;
}

//: - (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    //: NSString *title = self.sectionTitles[indexPath.section];
    NSString *title = self.sectionTitles[indexPath.section];
    //: NSMutableArray *arr = [self.contentDic valueForKey:title];
    NSMutableArray *arr = [self.contentDic valueForKey:title];
    //: id<NIMGroupMemberProtocol> member = arr[indexPath.row];
    id<UpProtocol> member = arr[indexPath.row];

    //: NSString *memberId = [(id<NIMGroupMemberProtocol>)member memberId];
    NSString *memberId = [(id<UpProtocol>)member memberId];
    //: AAAContactDataCell *cell = (AAAContactDataCell *)[tableView cellForRowAtIndexPath:indexPath];
    FromOfView *cell = (FromOfView *)[tableView cellForRowAtIndexPath:indexPath];
    //: CCCKitInfo *info;
    TitleInfo *info;
    //: info = [self.config getInfoById:memberId];
    info = [self.config bottom:memberId];
    //: if([_selectecContacts containsObject:memberId]) {
    if([_selectecContacts containsObject:memberId]) {
        //: [_selectecContacts removeObject:memberId];
        [_selectecContacts removeObject:memberId];
        //: cell.accessoryBtn.selected = NO;
        cell.accessoryBtn.selected = NO;
        //: [self.selectIndicatorView.pickedView removeMemberInfo:info];
        [self.selectIndicatorView.pickedView atShowInfo:info];
    //: } else if(_selectecContacts.count >= _maxSelectCount) {
    } else if(_selectecContacts.count >= _maxSelectCount) {
        //: if ([self.config respondsToSelector:@selector(selectedOverFlowTip)]) {
        if ([self.config respondsToSelector:@selector(oozeEliteOverTip)]) {
            //: NSString *tip = [self.config selectedOverFlowTip];
            NSString *tip = [self.config oozeEliteOverTip];
            //: [self.view makeToast:tip duration:2.0 position:CSToastPositionCenter];
            [self.view makeToast:tip duration:2.0 position:CSToastPositionCenter];
        }
        //: cell.accessoryBtn.selected = NO;
        cell.accessoryBtn.selected = NO;
    //: } else {
    } else {
        //: [_selectecContacts addObject:memberId];
        [_selectecContacts addObject:memberId];
        //: cell.accessoryBtn.selected = YES;
        cell.accessoryBtn.selected = YES;
        //: [self.selectIndicatorView.pickedView addMemberInfo:info];
        [self.selectIndicatorView.pickedView message:info];
    }
    //: [tableView deselectRowAtIndexPath:indexPath animated:NO];
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
//    [self refreshDetailTitle];
    //: [self isshowSelectindicator];
    [self insert];
}

//: #pragma mark - ContactPickedViewDelegate
#pragma mark - ContactPickedViewDelegate

//: - (void)removeUser:(NSString *)userId {
- (void)array:(NSString *)userId {
    //: [_selectecContacts removeObject:userId];
    [_selectecContacts removeObject:userId];
    //: [_tableView reloadData];
    [_tableView reloadData];
//    [self refreshDetailTitle];
}

//: #pragma mark - Private
#pragma mark - Private

//: - (AAAContactSelectTabView *)selectIndicatorView{
- (EliteView *)selectIndicatorView{
    //: if (_selectIndicatorView) {
    if (_selectIndicatorView) {
        //: return _selectIndicatorView;
        return _selectIndicatorView;
    }

    //: _selectIndicatorView = [[AAAContactSelectTabView alloc] initWithFrame:CGRectMake(0, [[UIScreen mainScreen] bounds].size.height-64, [[UIScreen mainScreen] bounds].size.width, 64)];
    _selectIndicatorView = [[EliteView alloc] initWithFrame:CGRectMake(0, [[UIScreen mainScreen] bounds].size.height-64, [[UIScreen mainScreen] bounds].size.width, 64)];
    //: _selectIndicatorView.doneButton.hidden = YES;
    _selectIndicatorView.doneButton.hidden = YES;
    //: return _selectIndicatorView;
    return _selectIndicatorView;
}

//: - (AAASetGroupNameView *)setGroupnameView{
- (FullView *)setGroupnameView{
    //: if(!_setGroupnameView){
    if(!_setGroupnameView){
        //: _setGroupnameView = [[AAASetGroupNameView alloc]initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height)];
        _setGroupnameView = [[FullView alloc]initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height)];
    }
    //: return _setGroupnameView;
    return _setGroupnameView;
}

//: - (UIView *)defView{
- (UIView *)defView{
    //: if(!_defView){
    if(!_defView){
        //: _defView = [[UIView alloc]initWithFrame:CGRectMake(0, (44.0f + [UIDevice vg_statusBarHeight]), [[UIScreen mainScreen] bounds].size.width, 400)];
        _defView = [[UIView alloc]initWithFrame:CGRectMake(0, (44.0f + [UIDevice task]), [[UIScreen mainScreen] bounds].size.width, 400)];
        //: _defView.hidden = YES;
        _defView.hidden = YES;

        //: UIImageView *defImg = [[UIImageView alloc]initWithFrame:CGRectMake(([[UIScreen mainScreen] bounds].size.width-276)/2, 150, 276, 160)];
        UIImageView *defImg = [[UIImageView alloc]initWithFrame:CGRectMake(([[UIScreen mainScreen] bounds].size.width-276)/2, 150, 276, 160)];
        //: defImg.image = [UIImage imageNamed:@"no_friend"];
        defImg.image = [UIImage imageNamed:StringFromDoctrineData(str_rawContent)];
        //: [_defView addSubview:defImg];
        [_defView addSubview:defImg];

        //: UILabel *emptyTipLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, defImg.bottom+5, [[UIScreen mainScreen] bounds].size.width, 20)];
        UILabel *emptyTipLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, defImg.bottom+5, [[UIScreen mainScreen] bounds].size.width, 20)];
        //: emptyTipLabel.textColor = [UIColor colorWithHexString:@"#999999"];
        emptyTipLabel.textColor = [UIColor direction:StringFromDoctrineData(str_cellFessData)];
        //: emptyTipLabel.font = [UIFont systemFontOfSize:12];
        emptyTipLabel.font = [UIFont systemFontOfSize:12];
        //: emptyTipLabel.textAlignment = NSTextAlignmentCenter;
        emptyTipLabel.textAlignment = NSTextAlignmentCenter;
        //: [_defView addSubview:emptyTipLabel];
        [_defView addSubview:emptyTipLabel];
        //: emptyTipLabel.text = @"No friends，please add friends";
        emptyTipLabel.text = StringFromDoctrineData(str_competitiveName);


    }
    //: return _defView;
    return _defView;
}

//: @end
@end

Byte * DoctrineDataToCache(Byte *data) {
    int duringFed = data[0];
    int comingIcon = data[1];
    int cedeKey = data[2];
    if (!duringFed) return data + cedeKey;
    for (int i = 0; i < comingIcon / 2; i++) {
        int begin = cedeKey + i;
        int end = cedeKey + comingIcon - i - 1;
        Byte temp = data[begin];
        data[begin] = data[end];
        data[end] = temp;
    }
    data[0] = 0;
    data[cedeKey + comingIcon] = 0;
    return data + cedeKey;
}

NSString *StringFromDoctrineData(Byte *data) {
    return [NSString stringWithUTF8String:(char *)DoctrineDataToCache(data)];
}  
