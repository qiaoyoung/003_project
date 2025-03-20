// __DEBUG__
// __CLOSE_PRINT__
//
//  NTESCommonTableDelegate.m
//  NIM
//
//  Created by chris on 15/6/29.
//  Copyright (c) 2015年 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import "CCCCommonTableDelegate.h"
#import "StreetwiseDelegate.h"
//: #import "UserCommonTableData.h"
#import "UserCommonTableData.h"
//: #import "CCCCommonTableViewCell.h"
#import "CommonCell.h"
//: #import "UIViewNimKit.h"
#import "UIViewNimKit.h"
//: #import "UserGlobalMacro.h"
#import "UserGlobalMacro.h"

//: static NSString *DefaultTableCell = @"UITableViewCell";
static NSString *k_localValue = @"UITableViewCell";

//: @interface CCCCommonTableDelegate()
@interface StreetwiseDelegate()

//: @property (nonatomic,copy) NSArray *(^NTESDataReceiver)(void);
@property (nonatomic,copy) NSArray *(^NTESDataReceiver)(void);

//: @end
@end

//: @implementation CCCCommonTableDelegate
@implementation StreetwiseDelegate

//: - (instancetype) initWithTableData:(NSArray *(^)(void))data{
- (instancetype) initWithBubbleData:(NSArray *(^)(void))data{
    //: self = [super init];
    self = [super init];
    //: if (self) {
    if (self) {
        //: _NTESDataReceiver = data;
        _NTESDataReceiver = data;
        //: _defaultSeparatorLeftEdge = 15;
        _defaultSeparatorLeftEdge = 15;
    }
    //: return self;
    return self;
}

//: - (NSArray *)data{
- (NSArray *)tab{
    //: return self.NTESDataReceiver();
    return self.NTESDataReceiver();
}

//: #pragma mark - UITableViewDataSource
#pragma mark - UITableViewDataSource
//: - (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    //: return self.data.count;
    return self.tab.count;
}

//: - (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //: NIMCommonTableSection *tableSection = self.data[section];
    ImageSection *tableSection = self.tab[section];
    //: return tableSection.rows.count;
    return tableSection.rows.count;
}

//: - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //: NIMCommonTableSection *tableSection = self.data[indexPath.section];
    ImageSection *tableSection = self.tab[indexPath.section];
    //: NIMCommonTableRow *tableRow = tableSection.rows[indexPath.row];
    ChildMessage *tableRow = tableSection.rows[indexPath.row];
    //: NSString *identity = tableRow.cellClassName.length ? tableRow.cellClassName : DefaultTableCell;
    NSString *identity = tableRow.cellClassName.length ? tableRow.cellClassName : k_localValue;
    //: UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identity];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identity];
    //: if (!cell) {
    if (!cell) {
        //: Class clazz = NSClassFromString(identity);
        Class clazz = NSClassFromString(identity);
        //: cell = [[clazz alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identity];
        cell = [[clazz alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identity];
        //: UIView *sep = [[UIView alloc] initWithFrame:CGRectZero];
        UIView *sep = [[UIView alloc] initWithFrame:CGRectZero];
        //: sep.tag = 10001;
        sep.tag = 10001;
        //: sep.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
        sep.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
        //: sep.backgroundColor = [UIColor lightGrayColor];
        sep.backgroundColor = [UIColor lightGrayColor];
        //: [cell addSubview:sep];
        [cell addSubview:sep];
    }
    //: if (![cell respondsToSelector:@selector(refreshData:tableView:)]) {
    if (![cell respondsToSelector:@selector(text:should_strong:)]) {
        //: UITableViewCell *defaultCell = (UITableViewCell *)cell;
        UITableViewCell *defaultCell = (UITableViewCell *)cell;
        //: [self refreshData:tableRow cell:defaultCell];
        [self character:tableRow accountingData_strong:defaultCell];
    //: }else{
    }else{
        //: [(id<CCCCommonTableViewCell>)cell refreshData:tableRow tableView:tableView];
        [(id<CommonCell>)cell text:tableRow should_strong:tableView];
    }
    //: cell.accessoryType = tableRow.showAccessory ? UITableViewCellAccessoryDisclosureIndicator : UITableViewCellAccessoryNone;
    cell.accessoryType = tableRow.showAccessory ? UITableViewCellAccessoryDisclosureIndicator : UITableViewCellAccessoryNone;
    //: cell.userInteractionEnabled = !tableRow.userInteractionDisable;
    cell.userInteractionEnabled = !tableRow.userInteractionDisable;
    //: return cell;
    return cell;
}

//: #pragma mark - UITableViewDelegate
#pragma mark - UITableViewDelegate
//: - (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    //: NIMCommonTableSection *tableSection = self.data[indexPath.section];
    ImageSection *tableSection = self.tab[indexPath.section];
    //: NIMCommonTableRow *tableRow = tableSection.rows[indexPath.row];
    ChildMessage *tableRow = tableSection.rows[indexPath.row];
    //: return tableRow.uiRowHeight;
    return tableRow.uiRowHeight;
}

//: - (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //: [tableView deselectRowAtIndexPath:indexPath animated:NO];
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    //: NIMCommonTableSection *tableSection = self.data[indexPath.section];
    ImageSection *tableSection = self.tab[indexPath.section];
    //: NIMCommonTableRow *tableRow = tableSection.rows[indexPath.row];
    ChildMessage *tableRow = tableSection.rows[indexPath.row];
    //: if (!tableRow.forbidSelect) {
    if (!tableRow.forbidSelect) {
        //: UIViewController *vc = tableView.nim_viewController;
        UIViewController *vc = tableView.atWith;
        //: NSString *actionName = tableRow.cellActionName;
        NSString *actionName = tableRow.cellActionName;
        //: if (actionName.length) {
        if (actionName.length) {
            //: SEL sel = NSSelectorFromString(actionName);
            SEL sel = NSSelectorFromString(actionName);
            //: UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
            UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
            //: do {
            do {
            //: [vc performSelector:sel withObject:cell];
            [vc performSelector:sel withObject:cell];
            //: } while (0);
            } while (0);
        }
    }
}

//: - (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    //这里的cell已经有了正确的bounds
    //不在cellForRow的地方设置分割线是因为在ios7下，0.5像素的view利用autoResizeMask调整布局有问题，会导致显示不出来，ios6,ios8均正常。
    //具体问题类似http://stackoverflow.com/questions/30663733/add-a-0-5-point-height-subview-to-uinavigationbar-not-show-in-ios7
    //这个回调里调整分割线的位置
    //: NIMCommonTableSection *tableSection = self.data[indexPath.section];
    ImageSection *tableSection = self.tab[indexPath.section];
    //: NIMCommonTableRow *tableRow = tableSection.rows[indexPath.row];
    ChildMessage *tableRow = tableSection.rows[indexPath.row];
    //: UIView *sep = [cell viewWithTag:10001];
    UIView *sep = [cell viewWithTag:10001];
    //: CGFloat sepHeight = .5f;
    CGFloat sepHeight = .5f;
    //: CGFloat sepWidth;
    CGFloat sepWidth;
    //: if (tableRow.sepLeftEdge) {
    if (tableRow.sepLeftEdge) {
        //: sepWidth = cell.nim_width - tableRow.sepLeftEdge;
        sepWidth = cell.nim_width - tableRow.sepLeftEdge;
    //: }else{
    }else{
        //: NIMCommonTableSection *section = self.data[indexPath.section];
        ImageSection *section = self.tab[indexPath.section];
        //: if (indexPath.row == section.rows.count - 1) {
        if (indexPath.row == section.rows.count - 1) {
            //最后一行
            //: sepWidth = 0;
            sepWidth = 0;
        //: }else{
        }else{
            //: sepWidth = cell.nim_width - self.defaultSeparatorLeftEdge;
            sepWidth = cell.nim_width - self.defaultSeparatorLeftEdge;
        }
    }
    //: sepWidth = sepWidth > 0 ? sepWidth : 0;
    sepWidth = sepWidth > 0 ? sepWidth : 0;
    //: sep.frame = CGRectMake(cell.nim_width - sepWidth, cell.nim_height - sepHeight, sepWidth ,sepHeight);
    sep.frame = CGRectMake(cell.nim_width - sepWidth, cell.nim_height - sepHeight, sepWidth ,sepHeight);
}

//: - (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    //: NIMCommonTableSection *tableSection = self.data[section];
    ImageSection *tableSection = self.tab[section];
    //: return tableSection.headerTitle;
    return tableSection.headerTitle;
}

//: - (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    //: if (section == 0) {
    if (section == 0) {
        //: return 25.f;
        return 25.f;
    }
    //: NIMCommonTableSection *tableSection = self.data[section];
    ImageSection *tableSection = self.tab[section];
    //: return [tableSection.headerTitle sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13.f]}].height;
    return [tableSection.headerTitle sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13.f]}].height;
}

//: - (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    //: NIMCommonTableSection *tableSection = self.data[section];
    ImageSection *tableSection = self.tab[section];
    //: return tableSection.footerTitle;
    return tableSection.footerTitle;
}

//: - (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    //: NIMCommonTableSection *tableSection = self.data[section];
    ImageSection *tableSection = self.tab[section];
    //: if (tableSection.headerTitle.length) {
    if (tableSection.headerTitle.length) {
        //: return nil;
        return nil;
    }
    //: UIView *view = [[UIView alloc] initWithFrame:CGRectZero];
    UIView *view = [[UIView alloc] initWithFrame:CGRectZero];
    //: return view;
    return view;
}

//: - (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    //: NIMCommonTableSection *tableSection = self.data[section];
    ImageSection *tableSection = self.tab[section];
    //: if (tableSection.footerTitle.length) {
    if (tableSection.footerTitle.length) {
        //: return nil;
        return nil;
    }
    //: UIView *view = [[UIView alloc] initWithFrame:CGRectZero];
    UIView *view = [[UIView alloc] initWithFrame:CGRectZero];
    //: return view;
    return view;
}

//: #pragma mark - Private
#pragma mark - Private
//: - (void)refreshData:(NIMCommonTableRow *)rowData cell:(UITableViewCell *)cell{
- (void)character:(ChildMessage *)rowData accountingData_strong:(UITableViewCell *)cell{
    //: cell.textLabel.text = rowData.title;
    cell.textLabel.text = rowData.title;
    //: cell.detailTextLabel.text = rowData.detailTitle;
    cell.detailTextLabel.text = rowData.detailTitle;
}

//: @end
@end
