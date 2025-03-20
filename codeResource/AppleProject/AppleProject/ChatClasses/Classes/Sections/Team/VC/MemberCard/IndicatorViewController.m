
#import <Foundation/Foundation.h>

NSString *StringFromAleData(Byte *data);


//: 获取禁言列表失败:%zd
Byte str_blocTrendData[] = {79, 28, 57, 5, 176, 33, 199, 240, 30, 200, 207, 32, 223, 186, 33, 225, 185, 30, 193, 208, 33, 218, 225, 30, 221, 234, 33, 237, 222, 115, 94, 179, 157, 142};


//: cell
Byte str_kingByOurData[] = {4, 4, 99, 12, 204, 210, 37, 139, 178, 42, 7, 96, 198, 200, 207, 207, 36};


//: Members_of_the_banned
Byte str_lifeGelValue[] = {40, 21, 41, 8, 170, 145, 183, 13, 118, 142, 150, 139, 142, 155, 156, 136, 152, 143, 136, 157, 145, 142, 136, 139, 138, 151, 151, 142, 141, 189};

// __DEBUG__
// __CLOSE_PRINT__
//
//  IndicatorViewController.m
// Indicator
//
//  Created by Genning-Work on 2019/12/13.
//  Copyright © 2019 NetEase. All rights reserved.
//

// __M_A_C_R_O__
//: #import "BBBTeamMuteMemberListViewController.h"
#import "IndicatorViewController.h"
//: #import "BBBTeamMemberCardViewController.h"
#import "WithTeamViewController.h"
//: #import "BBBCardHeaderCell.h"
#import "TingReusableView.h"
//: #import "BBBTeamCardMemberItem.h"
#import "OnenceShould.h"
//: #import "UserKitDependency.h"
#import "UserKitDependency.h"
//: #import "CCCKitProgressHUD.h"
#import "KitDisableView.h"
//: #import "NSString+AppleProjectKit.h"
#import "NSString+Indicator.h"

//: static NSInteger kCollectionItemWidth = 55;
static NSInteger k_iconData = 55;
//: static NSInteger kCollectionItemHeight = 80;
static NSInteger k_contentEventData = 80;
//: static NSInteger kCollectionEdgeInsetLeftRight = 20;
static NSInteger k_errorCellData = 20;
//: static NSInteger kCollectionEdgeInsetTopFirstLine = 25;
static NSInteger k_currentValue = 25;
//: static NSInteger kCollectionEdgeInsetTop = 15;
static NSInteger k_resultText = 15;

//: @interface BBBTeamMuteMemberListViewController ()<UICollectionViewDelegate,
@interface IndicatorViewController ()<UICollectionViewDelegate,
                                                  //: UICollectionViewDataSource,
                                                  UICollectionViewDataSource,
                                                  //: BBBCardHeaderCellDelegate,
                                                  TapWithOf,
                                                  //: NIMTeamMemberCardActionDelegate>
                                                  IconRange>

//: @property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UICollectionView *collectionView;
//: @property (nonatomic, weak) id <CCCTeamMemberListDataSource> dataSource;
@property (nonatomic, weak) id <MessageSource> dataSource;
//: @property (nonatomic, strong) NSMutableArray<BBBTeamCardMemberItem *> *members;
@property (nonatomic, strong) NSMutableArray<OnenceShould *> *members;

//: @end
@end

//: @implementation BBBTeamMuteMemberListViewController
@implementation IndicatorViewController
//: - (instancetype)initWithDataSource:(id<CCCTeamMemberListDataSource>)dataSource {
- (instancetype)initWithViewGesture:(id<MessageSource>)dataSource {
    //: self = [super initWithNibName:nil bundle:nil];
    self = [super initWithNibName:nil bundle:nil];
    //: if (self) {
    if (self) {
        //: _dataSource = dataSource;
        _dataSource = dataSource;
    }
    //: return self;
    return self;
}

//: - (void)viewDidLoad {
- (void)viewDidLoad {
    //: [super viewDidLoad];
    [super viewDidLoad];
    //: [self setupUI];
    [self enable];
    //: [self loadData];
    [self show];
}

//: - (void)refreshPage {
- (void)user {
    //: self.navigationItem.title = [NSString stringWithFormat:@"%@(%zd)".nim_localized,[NTESLanguageManager getTextWithKey:@"Members_of_the_banned"], _members.count];
    self.navigationItem.title = [NSString stringWithFormat:@"%@(%zd)".trapLocalized,[MaxInformation off:StringFromAleData(str_lifeGelValue)], _members.count];
}

//: - (void)setupUI {
- (void)enable {
    //: self.navigationItem.title = [NTESLanguageManager getTextWithKey:@"Members_of_the_banned"];
    self.navigationItem.title = [MaxInformation off:StringFromAleData(str_lifeGelValue)];//@"禁言成员".nim_localized;
    //: [self.view addSubview:self.collectionView];
    [self.view addSubview:self.collectionView];
}

//: - (void)loadData {
- (void)show {
    //: __weak typeof(self) weakSelf = self;
    __weak typeof(self) weakSelf = self;
    //: [_dataSource fetchTeamMutedMembersCompletion:^(NSError *error, NSMutableArray<BBBTeamCardMemberItem *> *members) {
    [_dataSource tableCompletion:^(NSError *error, NSMutableArray<OnenceShould *> *members) {
        //: if (error) {
        if (error) {
            //: NSString *msg = [NSString stringWithFormat:@"获取禁言列表失败:%zd".nim_localized, error.code];
            NSString *msg = [NSString stringWithFormat:StringFromAleData(str_blocTrendData).trapLocalized, error.code];
            //: [weakSelf.view makeToast:msg duration:1.5 position:CSToastPositionCenter];
            [weakSelf.view makeToast:msg duration:1.5 position:CSToastPositionCenter];
        //: } else {
        } else {
            //: weakSelf.members = members;
            weakSelf.members = members;
            //: [weakSelf refreshPage];
            [weakSelf user];
        }
    //: }];
    }];
}

//: - (void)setMembers:(NSMutableArray<BBBTeamCardMemberItem *> *)members {
- (void)setMembers:(NSMutableArray<OnenceShould *> *)members {
    //: _members = members;
    _members = members;
    //: [_collectionView reloadData];
    [_collectionView reloadData];
}

//: #pragma mark - UICollectionViewDataSource
#pragma mark - UICollectionViewDataSource
//: - (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    //: return _members.count;
    return _members.count;
}

//: - (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    //: BBBCardHeaderCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    TingReusableView *cell = [collectionView dequeueReusableCellWithReuseIdentifier:StringFromAleData(str_kingByOurData) forIndexPath:indexPath];
    //: cell.delegate = self;
    cell.delegate = self;
    //: id<NIMKitCardHeaderData> data = _members[indexPath.row];
    id<WithChild> data = _members[indexPath.row];
    //: [cell refreshData:data];
    [cell text:data];
    //: return cell;
    return cell;
}

//: #pragma mark - UICollectionViewDelegateFlowLayout
#pragma mark - UICollectionViewDelegateFlowLayout
//: - (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
- (CGSize)file:(UICollectionView *)collectionView message:(UICollectionViewLayout*)collectionViewLayout smithereens:(NSIndexPath *)indexPath{
    //: return CGSizeMake(kCollectionItemWidth, kCollectionItemHeight);
    return CGSizeMake(k_iconData, k_contentEventData);
}

//: - (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
- (UIEdgeInsets)temp:(UICollectionView *)collectionView show:(UICollectionViewLayout*)collectionViewLayout collectionForIndex:(NSInteger)section{
    //: if (section == 0) {
    if (section == 0) {
        //: return UIEdgeInsetsMake(kCollectionEdgeInsetTopFirstLine, 0, 0, 0);
        return UIEdgeInsetsMake(k_currentValue, 0, 0, 0);
    }
    //: return UIEdgeInsetsMake(kCollectionEdgeInsetTop, 0, 0, 0);
    return UIEdgeInsetsMake(k_resultText, 0, 0, 0);
}

//: #pragma mark - BBBCardHeaderCellDelegate
#pragma mark - TapWithOf
//: - (void)cellDidSelected:(BBBCardHeaderCell*)cell{
- (void)views:(TingReusableView*)cell{
    //: NSIndexPath *indexpath = [self.collectionView indexPathForCell:cell];
    NSIndexPath *indexpath = [self.collectionView indexPathForCell:cell];
    //: BBBTeamCardMemberItem *member = _members[indexpath.row];
    OnenceShould *member = _members[indexpath.row];
    //: BBBTeamMemberCardViewController *vc = [[BBBTeamMemberCardViewController alloc] initWithMember:member.userId
    WithTeamViewController *vc = [[WithTeamViewController alloc] initWithChange:member.userId
                                                                                       //: dataSource:_dataSource];
                                                                                       keyOriginSource:_dataSource];
    //: vc.delegate = self;
    vc.delegate = self;
    //: [self.navigationController pushViewController:vc animated:YES];
    [self.navigationController pushViewController:vc animated:YES];
}

//: #pragma mark - TeamMemberCardActionDelegate
#pragma mark - TeamMemberCardActionDelegate
//: - (void)onTeamMemberKicked:(BBBTeamCardMemberItem *)member {
- (void)sizes:(OnenceShould *)member {
    //: [_members removeObject:member];
    [_members removeObject:member];
    //: [_collectionView reloadData];
    [_collectionView reloadData];
}

//: - (void)onTeamMemberMuted:(BBBTeamCardMemberItem *)member mute:(BOOL)mute {
- (void)bar:(OnenceShould *)member cellMute:(BOOL)mute {
    //: if (!mute) {
    if (!mute) {
        //: [_members removeObject:member];
        [_members removeObject:member];
    //: } else {
    } else {
        //: [_members addObject:member];
        [_members addObject:member];
    }
    //: [_collectionView reloadData];
    [_collectionView reloadData];
}

//: #pragma mark - 旋转处理 (iOS8 or above)
#pragma mark - 旋转处理 (iOS8 or above)
//: - (void)viewWillTransitionToSize:(CGSize)size
- (void)viewWillTransitionToSize:(CGSize)size
       //: withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator
       withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator
{
    //: UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    //: flowLayout.minimumInteritemSpacing = kCollectionEdgeInsetLeftRight;
    flowLayout.minimumInteritemSpacing = k_errorCellData;
    //: [self.collectionView setCollectionViewLayout:flowLayout animated:YES];
    [self.collectionView setCollectionViewLayout:flowLayout animated:YES];

    //: [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
    //: [coordinator animateAlongsideTransition:^(id <UIViewControllerTransitionCoordinatorContext> context)
    [coordinator animateAlongsideTransition:^(id <UIViewControllerTransitionCoordinatorContext> context)
     {
         //: [self.collectionView reloadData];
         [self.collectionView reloadData];
     //: } completion:nil];
     } completion:nil];
}

//: #pragma mark - Private
#pragma mark - Private
//: - (UICollectionView *)collectionView {
- (UICollectionView *)collectionView {
    //: if (!_collectionView) {
    if (!_collectionView) {
        //: UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        //: _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
        _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
        //: flowLayout.minimumInteritemSpacing = kCollectionEdgeInsetLeftRight;
        flowLayout.minimumInteritemSpacing = k_errorCellData;
        //: _collectionView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        _collectionView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        //: _collectionView.backgroundColor = [UIColor colorWithRed:236.0/255.0 green:241.0/255.0 blue:245.0/255.0 alpha:1];
        _collectionView.backgroundColor = [UIColor colorWithRed:236.0/255.0 green:241.0/255.0 blue:245.0/255.0 alpha:1];
        //: _collectionView.delegate = self;
        _collectionView.delegate = self;
        //: _collectionView.dataSource = self;
        _collectionView.dataSource = self;
        //: [_collectionView registerClass:[BBBCardHeaderCell class] forCellWithReuseIdentifier:@"cell"];
        [_collectionView registerClass:[TingReusableView class] forCellWithReuseIdentifier:StringFromAleData(str_kingByOurData)];
        //: _collectionView.contentInset = UIEdgeInsetsMake(self.collectionView.contentInset.top,
        _collectionView.contentInset = UIEdgeInsetsMake(self.collectionView.contentInset.top,
                                                        //: kCollectionEdgeInsetLeftRight,
                                                        k_errorCellData,
                                                        //: _collectionView.contentInset.bottom,
                                                        _collectionView.contentInset.bottom,
                                                        //: kCollectionEdgeInsetLeftRight);
                                                        k_errorCellData);
    }
    //: return _collectionView;
    return _collectionView;
}

//: - (NSInteger)itemCountPerPage {
- (NSInteger)callPage {
    //: CGFloat minSpace = 20.f; 
    CGFloat minSpace = 20.f; //防止计算到最后出现左右贴边的情况
    //: NSInteger lines = (self.collectionView.frame.size.width - minSpace)/ (kCollectionItemWidth + kCollectionEdgeInsetLeftRight);
    NSInteger lines = (self.collectionView.frame.size.width - minSpace)/ (k_iconData + k_errorCellData);
    //: NSInteger rows = (self.collectionView.frame.size.height - minSpace)/(kCollectionItemHeight + kCollectionEdgeInsetLeftRight);
    NSInteger rows = (self.collectionView.frame.size.height - minSpace)/(k_contentEventData + k_errorCellData);
    //: return rows * lines;
    return rows * lines;
}


//: @end
@end

Byte * AleDataToCache(Byte *data) {
    int overtContent = data[0];
    int deserving = data[1];
    Byte tilNowGoal = data[2];
    int cornerValue = data[3];
    if (!overtContent) return data + cornerValue;
    for (int i = cornerValue; i < cornerValue + deserving; i++) {
        int value = data[i] - tilNowGoal;
        if (value < 0) {
            value += 256;
        }
        data[i] = value;
    }
    data[0] = 0;
    data[cornerValue + deserving] = 0;
    return data + cornerValue;
}

NSString *StringFromAleData(Byte *data) {
    return [NSString stringWithUTF8String:(char *)AleDataToCache(data)];
}
