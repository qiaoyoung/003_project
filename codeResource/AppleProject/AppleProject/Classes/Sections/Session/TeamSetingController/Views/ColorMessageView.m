
#import <Foundation/Foundation.h>

NSString *StringFromMaxOftData(Byte *data);


//: #F4E9FF
Byte str_lowNameText[] = {29, 7, 27, 5, 253, 62, 97, 79, 96, 84, 97, 97, 217};

// __DEBUG__
// __CLOSE_PRINT__
//
//  ColorMessageView.m
//  NIM
//
//  Created by 彭爽 on 2021/10/22.
//  Copyright © 2021 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import "NIMAdvancedTeamCardView.h"
#import "ColorMessageView.h"
//: #import "NIMAdvancedTeamCardCell.h"
#import "ContainerView.h"

//: @interface NIMAdvancedTeamCardView ()<UITableViewDelegate,UITableViewDataSource>
@interface ColorMessageView ()<UITableViewDelegate,UITableViewDataSource>
//: @property (nonatomic,strong) UITableView *newsTable;
@property (nonatomic,strong) UITableView *newsTable;

//: @end
@end


//: @implementation NIMAdvancedTeamCardView
@implementation ColorMessageView

//: -(instancetype)init{
-(instancetype)init{
    //: self = [super init];
    self = [super init];
    //: if (self) {
    if (self) {
        //: [self initTableView];
        [self initSize];
    }
    //: return self;
    return self;
}

//: - (void)reloaddata {
- (void)at {
    //: [self.newsTable reloadData];
    [self.newsTable reloadData];
}

//: -(void)initTableView{
-(void)initSize{

    //: self.newsTable = [[UITableView alloc] initWithFrame:self.bounds style:UITableViewStyleGrouped];
    self.newsTable = [[UITableView alloc] initWithFrame:self.bounds style:UITableViewStyleGrouped];
    //: [self addSubview:self.newsTable];
    [self addSubview:self.newsTable];
    //: self.newsTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.newsTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    //: self.newsTable.backgroundColor = [UIColor colorWithHexString:@"#F4E9FF"];
    self.newsTable.backgroundColor = [UIColor direction:StringFromMaxOftData(str_lowNameText)];
    //: self.newsTable.estimatedSectionHeaderHeight=.1;
    self.newsTable.estimatedSectionHeaderHeight=.1;
    //: self.newsTable.estimatedSectionFooterHeight=.1;
    self.newsTable.estimatedSectionFooterHeight=.1;
    //: self.newsTable.estimatedRowHeight = UITableViewAutomaticDimension;
    self.newsTable.estimatedRowHeight = UITableViewAutomaticDimension;
    //: self.newsTable.delegate = self;
    self.newsTable.delegate = self;
    //: self.self.newsTable.dataSource = self;
    self.self.newsTable.dataSource = self;

    //: [self.newsTable mas_makeConstraints:^(MASConstraintMaker *make) {
    [self.newsTable mas_makeConstraints:^(MASConstraintMaker *make) {
        //: make.left.mas_offset(0);
        make.left.mas_offset(0);
        //: make.right.mas_offset(0);
        make.right.mas_offset(0);
        //: make.top.mas_offset(0);
        make.top.mas_offset(0);
        //: make.bottom.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
    //: }];
    }];
    //: self.newsTable.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    self.newsTable.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
}


//: #pragma mark - UITableViewDelegate
#pragma mark - UITableViewDelegate

//Setup your cell margins:
//: -(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    // Remove seperator inset
    //: if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        //: [cell setSeparatorInset:UIEdgeInsetsZero];
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    // Prevent the cell from inheriting the Table View's margin settings
    //: if ([cell respondsToSelector:@selector(setPreservesSuperviewLayoutMargins:)]) {
    if ([cell respondsToSelector:@selector(setPreservesSuperviewLayoutMargins:)]) {
        //: [cell setPreservesSuperviewLayoutMargins:NO];
        [cell setPreservesSuperviewLayoutMargins:NO];
    }
    // Explictly set your cell's layout margins
    //: if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        //: [cell setLayoutMargins:UIEdgeInsetsZero];
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}

//: - (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    //: BOOL isOwner = self.teamListManager.myTeamInfo.type == NIMTeamMemberTypeOwner;
    BOOL isOwner = self.teamListManager.myTeamInfo.type == NIMTeamMemberTypeOwner;
    //: if (isOwner) {
    if (isOwner) {
        //: return 7;
        return 7;

    //: }else{
    }else{
        //: return 5;
        return 5;

    }

}

//: - (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    //: if (section == 1) {
    if (section == 1) {
        //: BOOL isManager = self.teamListManager.myTeamInfo.type == NIMTeamMemberTypeManager;
        BOOL isManager = self.teamListManager.myTeamInfo.type == NIMTeamMemberTypeManager;
        //: BOOL isOwner = self.teamListManager.myTeamInfo.type == NIMTeamMemberTypeOwner;
        BOOL isOwner = self.teamListManager.myTeamInfo.type == NIMTeamMemberTypeOwner;
        //: if (self.teamListManager.team.inviteMode == NIMTeamInviteModeManager && !isManager && !isOwner) {
        if (self.teamListManager.team.inviteMode == NIMTeamInviteModeManager && !isManager && !isOwner) {
            //: return 0;
            return 0;
        }
    }
    //: return 1;
    return 1;
}


//: - (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{

    //: if (section == 1) {
    if (section == 1) {
        //: BOOL isManager = self.teamListManager.myTeamInfo.type == NIMTeamMemberTypeManager;
        BOOL isManager = self.teamListManager.myTeamInfo.type == NIMTeamMemberTypeManager;
        //: BOOL isOwner = self.teamListManager.myTeamInfo.type == NIMTeamMemberTypeOwner;
        BOOL isOwner = self.teamListManager.myTeamInfo.type == NIMTeamMemberTypeOwner;
        //: if (self.teamListManager.team.inviteMode == NIMTeamInviteModeManager && !isManager && !isOwner) {
        if (self.teamListManager.team.inviteMode == NIMTeamInviteModeManager && !isManager && !isOwner) {
            //: return 0;
            return 0;
        }
    }
    //: return 12.f;
    return 12.f;
}

//: - (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    //: UIView *backView = [UIView new];
    UIView *backView = [UIView new];
    //: backView.backgroundColor = [UIColor clearColor];
    backView.backgroundColor = [UIColor clearColor];
    //: return backView;
    return backView;
}

//: - (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    //: return 0.01f;
    return 0.01f;
}

//: - (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    //: UIView *backView = [UIView new];
    UIView *backView = [UIView new];
    //: backView.backgroundColor = [UIColor clearColor];
    backView.backgroundColor = [UIColor clearColor];
    //: return backView;
    return backView;
}

//: - (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //: if (indexPath.section == 0) {
    if (indexPath.section == 0) {
        //: static NSString *identifier = @"cell_0";
        static NSString *identifier = @"cell_0";
        //: NIMAdvancedTeamCardCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        ContainerView *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        //: if (!cell) {
        if (!cell) {
            //: cell = [[NIMAdvancedTeamCardCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
            cell = [[ContainerView alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
            //: cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            //: cell.vc = self.vc;
            cell.vc = self.vc;
        }
        //: [cell reloadWith:self.teamListManager];
        [cell light:self.teamListManager];
        //: return cell;
        return cell;
    //: }else if (indexPath.section == 1){
    }else if (indexPath.section == 1){
        //: static NSString *identifier = @"cell_1";
        static NSString *identifier = @"cell_1";
        //: NIMAdvancedTeamCardCell_1 *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        ContainerViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        //: if (!cell) {
        if (!cell) {
            //: cell = [[NIMAdvancedTeamCardCell_1 alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
            cell = [[ContainerViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
            //: cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            //: cell.vc = self.vc;
            cell.vc = self.vc;
            //: cell.teamListManager = self.teamListManager;
            cell.teamListManager = self.teamListManager;
        }
        //: return cell;
        return cell;
    //: }else if (indexPath.section == 2){
    }else if (indexPath.section == 2){
        //: static NSString *identifier = @"cell_2";
        static NSString *identifier = @"cell_2";
        //: NIMAdvancedTeamCardCell_2 *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        DateViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        //: if (!cell) {
        if (!cell) {
            //: cell = [[NIMAdvancedTeamCardCell_2 alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
            cell = [[DateViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
            //: cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            //: cell.vc = self.vc;
            cell.vc = self.vc;
            //: cell.option = self.option;
            cell.option = self.option;
            //: cell.teamListManager = self.teamListManager;
            cell.teamListManager = self.teamListManager;
        }
        //: [cell reloadWith:self.teamListManager];
        [cell team:self.teamListManager];

        //: return cell;
        return cell;
    //: }else if (indexPath.section == 3){
    }else if (indexPath.section == 3){
        //: static NSString *identifier = @"cell_3";
        static NSString *identifier = @"cell_3";
        //: NIMAdvancedTeamCardCell_3 *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        MinViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        //: if (!cell) {
        if (!cell) {
            //: cell = [[NIMAdvancedTeamCardCell_3 alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
            cell = [[MinViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
            //: cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            //: cell.vc = self.vc;
            cell.vc = self.vc;
            //: cell.teamListManager = self.teamListManager;
            cell.teamListManager = self.teamListManager;

        }
        //: return cell;
        return cell;
    //: }else if (indexPath.section == 4){
    }else if (indexPath.section == 4){

        //: BOOL isOwner = self.teamListManager.myTeamInfo.type == NIMTeamMemberTypeOwner;
        BOOL isOwner = self.teamListManager.myTeamInfo.type == NIMTeamMemberTypeOwner;
        //: if (isOwner) {
        if (isOwner) {
            //: static NSString *identifier = @"cell_4";
            static NSString *identifier = @"cell_4";
            //: NIMAdvancedTeamCardCell_4 *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
            EmpowerViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
            //: if (!cell) {
            if (!cell) {
                //: cell = [[NIMAdvancedTeamCardCell_4 alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
                cell = [[EmpowerViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
                //: cell.selectionStyle = UITableViewCellSelectionStyleNone;
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                //: cell.vc = self.vc;
                cell.vc = self.vc;
                //: cell.teamListManager = self.teamListManager;
                cell.teamListManager = self.teamListManager;
            }
            //: [cell reloadWith:self.teamListManager];
            [cell to:self.teamListManager];

            //: return cell;
            return cell;

        //: }else{
        }else{
            //: static NSString *identifier = @"cell_6";
            static NSString *identifier = @"cell_6";
            //: NIMAdvancedTeamCardCell_6 *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
            StateView *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
            //: if (!cell) {
            if (!cell) {
                //: cell = [[NIMAdvancedTeamCardCell_6 alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
                cell = [[StateView alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
                //: cell.selectionStyle = UITableViewCellSelectionStyleNone;
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                //: cell.vc = self.vc;
                cell.vc = self.vc;
                //: cell.teamListManager = self.teamListManager;
                cell.teamListManager = self.teamListManager;

            }
            //: [cell reloadWith:self.teamListManager];
            [cell refresh:self.teamListManager];
            //: return cell;
            return cell;

        }

    //: }else if (indexPath.section == 5){
    }else if (indexPath.section == 5){
        //: static NSString *identifier = @"cell_5";
        static NSString *identifier = @"cell_5";
        //: NIMAdvancedTeamCardCell_5 *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        OfShouldViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        //: if (!cell) {
        if (!cell) {
            //: cell = [[NIMAdvancedTeamCardCell_5 alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
            cell = [[OfShouldViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
            //: cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            //: cell.vc = self.vc;
            cell.vc = self.vc;
            //: cell.teamListManager = self.teamListManager;
            cell.teamListManager = self.teamListManager;
        }
        //: [cell reloadWith:self.teamListManager];
        [cell determine:self.teamListManager];

        //: return cell;
        return cell;
    //: }else{
    }else{
        //: static NSString *identifier = @"cell_6";
        static NSString *identifier = @"cell_6";
        //: NIMAdvancedTeamCardCell_6 *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        StateView *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        //: if (!cell) {
        if (!cell) {
            //: cell = [[NIMAdvancedTeamCardCell_6 alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
            cell = [[StateView alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
            //: cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            //: cell.vc = self.vc;
            cell.vc = self.vc;
            //: cell.teamListManager = self.teamListManager;
            cell.teamListManager = self.teamListManager;

        }
        //: [cell reloadWith:self.teamListManager];
        [cell refresh:self.teamListManager];
        //: return cell;
        return cell;
    }
}

//: - (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

}

//: @end
@end

Byte * MaxOftDataToCache(Byte *data) {
    int nitrogenBalance = data[0];
    int occurrence = data[1];
    Byte minVend = data[2];
    int ethicsCommittee = data[3];
    if (!nitrogenBalance) return data + ethicsCommittee;
    for (int i = ethicsCommittee; i < ethicsCommittee + occurrence; i++) {
        int value = data[i] - minVend;
        if (value < 0) {
            value += 256;
        }
        data[i] = value;
    }
    data[0] = 0;
    data[ethicsCommittee + occurrence] = 0;
    return data + ethicsCommittee;
}

NSString *StringFromMaxOftData(Byte *data) {
    return [NSString stringWithUTF8String:(char *)MaxOftDataToCache(data)];
}
