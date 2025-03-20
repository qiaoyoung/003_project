
#import <Foundation/Foundation.h>

NSString *StringFromLifeStyleData(Byte *data);


//: collectionCell
Byte str_widowFileTitle[] = {6, 14, 33, 8, 97, 180, 100, 22, 132, 144, 141, 141, 134, 132, 149, 138, 144, 143, 100, 134, 141, 141, 92};

// __DEBUG__
// __CLOSE_PRINT__
//
//  InformationView.m
// Indicator
//
//  Created by chris on 15/10/15.
//  Copyright © 2015年 NetEase. All rights reserved.
//
//: #pragma mark - NIMMemebrGroupData
#pragma mark - MarkLight

// __M_A_C_R_O__
//: #import "BBBMemberGroupView.h"
#import "InformationView.h"
//: #import "BBBCardHeaderCell.h"
#import "TingReusableView.h"
//: #import "UIViewNimKit.h"
#import "UIViewNimKit.h"
//: #import "BBBCardOperationItem.h"
#import "ToTarotItem.h"
//: #import "BBBTeamCardMemberItem.h"
#import "OnenceShould.h"

//: @implementation NIMMemebrGroupData
@implementation MarkLight

//: - (instancetype)init {
- (instancetype)init {
    //: if (self = [super init]) {
    if (self = [super init]) {
        //: _opera = CardHeaderOpeatorNone;
        _opera = CardHeaderOpeatorNone;
    }
    //: return self;
    return self;
}

//: - (BOOL)isMyUserId {
- (BOOL)isMyUserId {
    //: return [_userId isEqualToString:[NIMSDK sharedSDK].loginManager.currentAccount];
    return [_userId isEqualToString:[NIMSDK sharedSDK].loginManager.currentAccount];
}

//: @end
@end

//: #pragma mark - BBBMemberGroupView
#pragma mark - InformationView

//: @interface BBBMemberGroupView()<UICollectionViewDataSource,UICollectionViewDelegate,BBBCardHeaderCellDelegate>
@interface InformationView()<UICollectionViewDataSource,UICollectionViewDelegate,TapWithOf>

//: @property (nonatomic,strong) NSMutableArray *data;
@property (nonatomic,strong) NSMutableArray *data;

//: @property (nonatomic,strong) NSMutableDictionary *operatorTitle;
@property (nonatomic,strong) NSMutableDictionary *operatorTitle;

//: @end
@end

//: @implementation BBBMemberGroupView
@implementation InformationView

//: - (instancetype)initWithFrame:(CGRect)frame{
- (instancetype)initWithFrame:(CGRect)frame{
    //: self = [super initWithFrame:frame];
    self = [super initWithFrame:frame];
    //: if (self) {
    if (self) {
        //: self.collectionView.delegate = self;
        self.collectionView.delegate = self;
        //: self.collectionView.dataSource = self;
        self.collectionView.dataSource = self;
        //: [self addSubview:self.collectionView];
        [self addSubview:self.collectionView];
    }
    //: return self;
    return self;
}

//: - (void)refreshDatas:(NSArray <NIMMemebrGroupData *> *)datas
- (void)table:(NSArray <MarkLight *> *)datas
           //: operators:(NIMKitCardHeaderOpeator)operators{
           drop:(NIMKitCardHeaderOpeator)operators{
    //: _showAddOperator = (operators & CardHeaderOpeatorAdd) != 0;
    _showAddOperator = (operators & CardHeaderOpeatorAdd) != 0;
    //: _showRemoveOperator = (operators & CardHeaderOpeatorRemove) != 0;
    _showRemoveOperator = (operators & CardHeaderOpeatorRemove) != 0;

    //normal item
    //: self.data = [[NSMutableArray alloc] initWithArray:datas];
    self.data = [[NSMutableArray alloc] initWithArray:datas];

    //add item
    //: if (self.showAddOperator) {
    if (self.showAddOperator) {
        //: NIMMemebrGroupData *groupData = [[NIMMemebrGroupData alloc] init];
        MarkLight *groupData = [[MarkLight alloc] init];
        //: groupData.opera = CardHeaderOpeatorAdd;
        groupData.opera = CardHeaderOpeatorAdd;
        //: [self.data addObject:groupData];
        [self.data addObject:groupData];
    }

    //remove item
    //: if (self.showRemoveOperator) {
    if (self.showRemoveOperator) {
        //: NIMMemebrGroupData *groupData = [[NIMMemebrGroupData alloc] init];
        MarkLight *groupData = [[MarkLight alloc] init];
        //: groupData.opera = CardHeaderOpeatorRemove;
        groupData.opera = CardHeaderOpeatorRemove;
        //: [self.data addObject:groupData];
        [self.data addObject:groupData];
    }
    //: [self.collectionView reloadData];
    [self.collectionView reloadData];
}

//: - (void)setTitle:(NSString *)title forOperator:(NIMKitCardHeaderOpeator)opera{
- (void)unwished:(NSString *)title corner:(NIMKitCardHeaderOpeator)opera{
    //: if (!self.operatorTitle) {
    if (!self.operatorTitle) {
        //: self.operatorTitle = [[NSMutableDictionary alloc] init];
        self.operatorTitle = [[NSMutableDictionary alloc] init];
    }
    //: self.operatorTitle[@(opera)] = title;
    self.operatorTitle[@(opera)] = title;
}

//: - (CGSize)sizeThatFits:(CGSize)size{
- (CGSize)sizeThatFits:(CGSize)size{
    //: CGFloat width = size.width;
    CGFloat width = size.width;
    //: NSInteger sectionNumber = [self numberOfSections:width];
    NSInteger sectionNumber = [self sign:width];
    //: CGFloat height = 80 * sectionNumber + 15 * (sectionNumber-1) + 25 * 2;
    CGFloat height = 80 * sectionNumber + 15 * (sectionNumber-1) + 25 * 2;
    //: return CGSizeMake(width, height);
    return CGSizeMake(width, height);
}

//: - (void)layoutSubviews{
- (void)layoutSubviews{
    //: [super layoutSubviews];
    [super layoutSubviews];
    //: self.collectionView.contentInset = self.sectionInsets;
    self.collectionView.contentInset = self.touch;
}

//: #pragma mark - UICollectionViewDataSource
#pragma mark - UICollectionViewDataSource
//: - (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    //: NSInteger lastTotal = self.collectionItemNumber * section;
    NSInteger lastTotal = self.exceptSystem * section;
    //: NSInteger remain = self.data.count - lastTotal;
    NSInteger remain = self.data.count - lastTotal;
    //: return remain < self.collectionItemNumber ? remain:self.collectionItemNumber;
    return remain < self.exceptSystem ? remain:self.exceptSystem;
}

//: - (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    //: NSInteger sections = self.data.count / self.collectionItemNumber;
    NSInteger sections = self.data.count / self.exceptSystem;
    //: return self.data.count % self.collectionItemNumber ? sections + 1 : sections;
    return self.data.count % self.exceptSystem ? sections + 1 : sections;
}

//: - (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    //: BBBCardHeaderCell *cell;
    TingReusableView *cell;
    //: NIMMemebrGroupData *data = [self dataAtIndexPath:indexPath];
    MarkLight *data = [self standard:indexPath];
    //: if (data.opera == CardHeaderOpeatorAdd || data.opera == CardHeaderOpeatorRemove) {
    if (data.opera == CardHeaderOpeatorAdd || data.opera == CardHeaderOpeatorRemove) {
        //: cell = [self buildOperatorCell:data.opera indexPath:indexPath];
        cell = [self recording:data.opera skinColor:indexPath];
    //: }else{
    }else{
        //: cell = [self buildUserCell:data indexPath:indexPath];
        cell = [self path:data read:indexPath];
    }
    //: cell.delegate = self;
    cell.delegate = self;
    //: return cell;
    return cell;
}

//: - (NIMMemebrGroupData *)dataAtIndexPath:(NSIndexPath*)indexpath{
- (MarkLight *)standard:(NSIndexPath*)indexpath{
    //: NSInteger index = indexpath.section * self.collectionItemNumber;
    NSInteger index = indexpath.section * self.exceptSystem;
    //: index += indexpath.row;
    index += indexpath.row;
    //: return self.data[index];
    return self.data[index];
}

//: #pragma mark - BBBCardHeaderCellDelegate
#pragma mark - TapWithOf
//: - (void)cellDidSelected:(BBBCardHeaderCell *)cell{
- (void)views:(TingReusableView *)cell{
    //: NSIndexPath *indexPath = [self.collectionView indexPathForCell:cell];
    NSIndexPath *indexPath = [self.collectionView indexPathForCell:cell];
    //: NIMMemebrGroupData *groupData = [self dataAtIndexPath:indexPath];
    MarkLight *groupData = [self standard:indexPath];
    //: if (groupData.opera == CardHeaderOpeatorNone && [self.delegate respondsToSelector:@selector(didSelectMemberId:)]) {
    if (groupData.opera == CardHeaderOpeatorNone && [self.delegate respondsToSelector:@selector(inputing:)]) {
        //: [self.delegate didSelectMemberId:groupData.userId];
        [self.delegate inputing:groupData.userId];
    //: }else if ([self.delegate respondsToSelector:@selector(didSelectOperator:)]){
    }else if ([self.delegate respondsToSelector:@selector(combined:)]){
        //: [self.delegate didSelectOperator:groupData.opera];
        [self.delegate combined:groupData.opera];
    }
}

//: - (void)cellShouldBeRemoved:(BBBCardHeaderCell*)cell{
- (void)imaged:(TingReusableView*)cell{
    //: NSIndexPath *indexPath = [self.collectionView indexPathForCell:cell];
    NSIndexPath *indexPath = [self.collectionView indexPathForCell:cell];
    //: NIMMemebrGroupData *groupData = [self dataAtIndexPath:indexPath];
    MarkLight *groupData = [self standard:indexPath];
    //: if (groupData.opera == CardHeaderOpeatorNone && [self.delegate respondsToSelector:@selector(didSelectRemoveButtonWithMemberId:)]) {
    if (groupData.opera == CardHeaderOpeatorNone && [self.delegate respondsToSelector:@selector(mediaId:)]) {
        //: [self.delegate didSelectRemoveButtonWithMemberId:groupData.userId];
        [self.delegate mediaId:groupData.userId];
    }
}

//: #pragma mark - UICollectionViewDelegateFlowLayout
#pragma mark - UICollectionViewDelegateFlowLayout
//: - (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
- (CGSize)ofPath:(UICollectionView *)collectionView streetSmartPath:(UICollectionViewLayout*)collectionViewLayout tool:(NSIndexPath *)indexPath{
    //: return CGSizeMake(58, 80);
    return CGSizeMake(58, 80);
}

//: - (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
- (UIEdgeInsets)temp:(UICollectionView *)collectionView show:(UICollectionViewLayout*)collectionViewLayout collectionForIndex:(NSInteger)section{
    //: if (section == 0) {
    if (section == 0) {
        //: return UIEdgeInsetsMake(25, 0, 0, 0);
        return UIEdgeInsetsMake(25, 0, 0, 0);
    }
    //: return UIEdgeInsetsMake(15, 0, 0, 0);
    return UIEdgeInsetsMake(15, 0, 0, 0);
}

//: #pragma mark - Getter & Setter
#pragma mark - Getter & Setter
//: - (UICollectionView *)collectionView{
- (UICollectionView *)collectionView{
    //: if (!_collectionView) {
    if (!_collectionView) {
        //: UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        //: layout.minimumInteritemSpacing = self.collectionEdgeInsetLeftRight;
        layout.minimumInteritemSpacing = self.outspokenRight;
        //: _collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:layout];
        _collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:layout];
        //: _collectionView.backgroundColor = [UIColor colorWithRed:236.0/255.0 green:241.0/255.0 blue:245.0/255.0 alpha:1];
        _collectionView.backgroundColor = [UIColor colorWithRed:236.0/255.0 green:241.0/255.0 blue:245.0/255.0 alpha:1];
        //: _collectionView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        _collectionView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        //: _collectionView.delegate = self;
        _collectionView.delegate = self;
        //: _collectionView.dataSource = self;
        _collectionView.dataSource = self;
        //: [_collectionView registerClass:[BBBCardHeaderCell class] forCellWithReuseIdentifier:@"collectionCell"];
        [_collectionView registerClass:[TingReusableView class] forCellWithReuseIdentifier:StringFromLifeStyleData(str_widowFileTitle)];
    }
    //: return _collectionView;
    return _collectionView;
}

//: - (CGFloat)collectionEdgeInsetLeftRight{
- (CGFloat)outspokenRight{
    //: return 20;
    return 20;
}

//: #pragma mark - Private
#pragma mark - Private
//: - (BBBCardHeaderCell *)buildUserCell:(NIMMemebrGroupData *)data indexPath:(NSIndexPath *)indexPath{
- (TingReusableView *)path:(MarkLight *)data read:(NSIndexPath *)indexPath{
    //: BBBCardHeaderCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"collectionCell" forIndexPath:indexPath];
    TingReusableView *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:StringFromLifeStyleData(str_widowFileTitle) forIndexPath:indexPath];
    //: NIMCardMemberItem *item = [[NIMCardMemberItem alloc] init];
    MessageItem *item = [[MessageItem alloc] init];
    //: item.userId = data.userId;
    item.userId = data.userId;

    //: [cell refreshData:item];
    [cell text:item];
    //: cell.removeBtn.hidden = (self.enableRemove ? item.isMyUserId : YES);
    cell.removeBtn.hidden = (self.enableRemove ? item.showBecome : YES);
    //: return cell;
    return cell;
}

//: - (BBBCardHeaderCell *)buildOperatorCell:(NIMKitCardHeaderOpeator)operator indexPath:(NSIndexPath *)indexPath{
- (TingReusableView *)recording:(NIMKitCardHeaderOpeator)operator skinColor:(NSIndexPath *)indexPath{
    //: BBBCardHeaderCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"collectionCell" forIndexPath:indexPath];
    TingReusableView *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:StringFromLifeStyleData(str_widowFileTitle) forIndexPath:indexPath];
    //: BBBCardOperationItem *item = [[BBBCardOperationItem alloc] initWithOperation:operator];
    ToTarotItem *item = [[ToTarotItem alloc] initWithSizeObject:operator];
    //: if (self.operatorTitle[@(operator)]) {
    if (self.operatorTitle[@(operator)]) {
        //: item.title = self.operatorTitle[@(operator)];
        item.title = self.operatorTitle[@(operator)];
    }
    //: [cell refreshData:item];
    [cell text:item];
    //: cell.removeBtn.hidden = YES;
    cell.removeBtn.hidden = YES;
    //: return cell;
    return cell;
}

//: - (UIEdgeInsets)sectionInsets {
- (UIEdgeInsets)touch {
    //: CGFloat left = (self.collectionView.nim_width - ((58 + self.collectionEdgeInsetLeftRight)) * self.collectionItemNumber - self.collectionEdgeInsetLeftRight) * 0.5;
    CGFloat left = (self.collectionView.nim_width - ((58 + self.outspokenRight)) * self.exceptSystem - self.outspokenRight) * 0.5;
    //: left = left > 20 ? left : 20;
    left = left > 20 ? left : 20;
    //: return UIEdgeInsetsMake(self.collectionView.contentInset.top, left, self.collectionView.contentInset.bottom, left);
    return UIEdgeInsetsMake(self.collectionView.contentInset.top, left, self.collectionView.contentInset.bottom, left);
}

//: - (NSInteger)collectionItemNumber{
- (NSInteger)exceptSystem{
    //: return [self collectionItemNumber:self.collectionView.nim_width];
    return [self name:self.collectionView.nim_width];
}

//: - (NSInteger)collectionItemNumber:(CGFloat)width{
- (NSInteger)name:(CGFloat)width{
    //: CGFloat minSpace = 20; 
    CGFloat minSpace = 20; //防止计算到最后出现左右贴边的情况
    //: return (int)((width - minSpace)/ (58 + self.collectionEdgeInsetLeftRight));
    return (int)((width - minSpace)/ (58 + self.outspokenRight));
}

//: - (NSInteger)numberOfSections:(CGFloat)width{
- (NSInteger)sign:(CGFloat)width{
    //: NSInteger collectionNumber = [self collectionItemNumber:width];
    NSInteger collectionNumber = [self name:width];
    //: NSInteger sections = self.data.count / collectionNumber;
    NSInteger sections = self.data.count / collectionNumber;
    //: return self.data.count % collectionNumber ? sections + 1 : sections;
    return self.data.count % collectionNumber ? sections + 1 : sections;
}

//: @end
@end

Byte * LifeStyleDataToCache(Byte *data) {
    int disc = data[0];
    int statute = data[1];
    Byte henBetInfo = data[2];
    int rail = data[3];
    if (!disc) return data + rail;
    for (int i = rail; i < rail + statute; i++) {
        int value = data[i] - henBetInfo;
        if (value < 0) {
            value += 256;
        }
        data[i] = value;
    }
    data[0] = 0;
    data[rail + statute] = 0;
    return data + rail;
}

NSString *StringFromLifeStyleData(Byte *data) {
    return [NSString stringWithUTF8String:(char *)LifeStyleDataToCache(data)];
}
