// __DEBUG__
// __CLOSE_PRINT__
//
//  NIMSessionLayout.m
// Indicator
//
//  Created by chris on 2016/11/8.
//  Copyright © 2016年 NetEase. All rights reserved.
//

// __M_A_C_R_O__
//: #import "CCCSessionLayoutImpl.h"
#import "InformationImpl.h"
//: #import "UITableView+NIMScrollToBottom.h"
#import "UITableView+NIMScrollToBottom.h"
//: #import "CCCMessageCell.h"
#import "StatusViewCell.h"
//: #import "UserGlobalMacro.h"
#import "UserGlobalMacro.h"
//: #import "CCCSessionTableAdapter.h"
#import "AddTable.h"
//: #import "UIViewNimKit.h"
#import "UIViewNimKit.h"
//: #import "BBBKitKeyboardInfo.h"
#import "TeamInfo.h"
//: #import "AAAReplyContentView.h"
#import "StatuteTitleView.h"

//: @interface CCCSessionLayoutImpl()
@interface InformationImpl()
{
    //: NSMutableArray *_inserts;
    NSMutableArray *_inserts;
    //: CGFloat _inputViewHeight;
    CGFloat _inputViewHeight;
}

//: @property (nonatomic,strong) UIRefreshControl *refreshControl;
@property (nonatomic,strong) UIRefreshControl *refreshControl;

//: @property (nonatomic,strong) NIMSession *session;
@property (nonatomic,strong) NIMSession *session;

//: @property (nonatomic,strong) id<CCCSessionConfig> sessionConfig;
@property (nonatomic,strong) id<FromConfig> sessionConfig;

//: @property (nonatomic,weak) id<NIMSessionLayoutDelegate> delegate;
@property (nonatomic,weak) id<ShowHideFrom> delegate;

//: @end
@end

//: @implementation CCCSessionLayoutImpl
@implementation InformationImpl

//: - (instancetype)initWithSession:(NIMSession *)session
- (instancetype)initWithFind:(NIMSession *)session
                         //: config:(id<CCCSessionConfig>)sessionConfig
                         rangeNumber:(id<FromConfig>)sessionConfig
{
    //: self = [super init];
    self = [super init];
    //: if (self) {
    if (self) {
        //: _sessionConfig = sessionConfig;
        _sessionConfig = sessionConfig;
        //: _session = session;
        _session = session;
        //: _inserts = [[NSMutableArray alloc] init];
        _inserts = [[NSMutableArray alloc] init];

        //: [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(menuDidHide:) name:UIMenuControllerDidHideMenuNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(menuBy:) name:UIMenuControllerDidHideMenuNotification object:nil];
        //: [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillChangeFrame:) name:NIMKitKeyboardWillChangeFrameNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(dates:) name:k_contextTitle object:nil];
    }
    //: return self;
    return self;
}

//: - (void)dealloc
- (void)dealloc
{
    //: [[NSNotificationCenter defaultCenter] removeObserver:self];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

//: - (void)reloadTable
- (void)red
{
    //: [self.tableView reloadData];
    [self.tableView reloadData];
}

//: - (void)setTableView:(UITableView *)tableView
- (void)setTableView:(UITableView *)tableView
{
    //: BOOL change = _tableView != tableView;
    BOOL change = _tableView != tableView;
    //: if (change)
    if (change)
    {
        //: _tableView = tableView;
        _tableView = tableView;
        //: [self setupRefreshControl];
        [self show];
    }
}

//: - (void)resetLayout
- (void)message
{
    //: [self adjustInputView];
    [self changeCancel];
    //: [self adjustTableView];
    [self cipherView];
}

//: - (void)layoutAfterRefresh {
- (void)afterRange {
    //: [self.refreshControl endRefreshing];
    [self.refreshControl endRefreshing];
}



//: - (void)changeLayout:(CGFloat)inputViewHeight
- (void)custom:(CGFloat)inputViewHeight
{
    //: BOOL change = _inputViewHeight != inputViewHeight;
    BOOL change = _inputViewHeight != inputViewHeight;
    //: if (change)
    if (change)
    {
        //: _inputViewHeight = inputViewHeight;
        _inputViewHeight = inputViewHeight;
        //: [self adjustInputView];
        [self changeCancel];
        //: [self adjustTableView];
        [self cipherView];
    }
}


//: - (void)adjustInputView
- (void)changeCancel
{
//    UIView *superView = self.inputView.superview;
//    UIEdgeInsets safeAreaInsets = superView.safeAreaInsets;
//
////    self.inputView.nim_bottom = superView.nim_height - safeAreaInsets.bottom;
//    self.inputView.nim_bottom = superView.nim_height;

    //: CGFloat safeAreaInsetsBottom = [UIDevice vg_safeDistanceBottom];
    CGFloat safeAreaInsetsBottom = [UIDevice dayEqual];
    //: CGFloat containerSafeHeight = [UIScreen mainScreen].bounds.size.height - safeAreaInsetsBottom;
    CGFloat containerSafeHeight = [UIScreen mainScreen].bounds.size.height - safeAreaInsetsBottom;
    //: self.inputView.nim_bottom = containerSafeHeight;
    self.inputView.nim_bottom = containerSafeHeight;

}

//: - (void)adjustTableView
- (void)cipherView
{
//    CGRect rect = self.tableView.frame;
//
//    //tableview 的位置
//    UIView *superView = self.tableView.superview;
//    UIEdgeInsets safeAreaInsets = superView.safeAreaInsets;
//
//    CGFloat containerSafeHeight = self.tableView.superview.frame.size.height - safeAreaInsets.bottom;
//
//    rect.size.height = containerSafeHeight - self.inputView.toolBar.nim_height;
//
//
//    //tableview 的内容 inset
//    UIEdgeInsets contentInsets = self.tableView.adjustedContentInset;
//    CGFloat visiableHeight = 0;
//
//    //如果气泡过少，少于总高度，输入框视图需要顶到最后一个气泡的下面。
//    visiableHeight = visiableHeight + self.tableView.contentSize.height + contentInsets.top + contentInsets.bottom;
//    visiableHeight = MIN(visiableHeight, rect.size.height);
//
//    rect.origin.y    = containerSafeHeight - visiableHeight - self.inputView.nim_height;
//    rect.origin.y    = rect.origin.y > 0? 0 : rect.origin.y;
//
//
//    BOOL tableChanged = !CGRectEqualToRect(self.tableView.frame, rect);
//    if (tableChanged)
//    {
//        [self.tableView setFrame:rect];
//        [self.tableView nim_scrollToBottom:YES];
//    }

//    self.tableView.frame = CGRectMake(0, SCREEN_TOP_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT);
    //: CGRect rect = self.tableView.frame;
    CGRect rect = self.tableView.frame;

    //tableview 的位置
    //: CGFloat safeAreaInsetsBottom = [UIDevice vg_safeDistanceBottom];
    CGFloat safeAreaInsetsBottom = [UIDevice dayEqual];
    //: CGFloat containerSafeHeight = [UIScreen mainScreen].bounds.size.height - safeAreaInsetsBottom;
    CGFloat containerSafeHeight = [UIScreen mainScreen].bounds.size.height - safeAreaInsetsBottom;
    //: rect.size.height = containerSafeHeight - self.inputView.toolBar.nim_height;
    rect.size.height = containerSafeHeight - self.inputView.toolBar.nim_height;


    //tableview 的内容 inset
    //: UIEdgeInsets contentInsets = self.tableView.adjustedContentInset;
    UIEdgeInsets contentInsets = self.tableView.adjustedContentInset;
    //: CGFloat visiableHeight = 0;
    CGFloat visiableHeight = 0;

    //如果气泡过少，少于总高度，输入框视图需要顶到最后一个气泡的下面。
    //: visiableHeight = visiableHeight + self.tableView.contentSize.height + contentInsets.top + contentInsets.bottom;
    visiableHeight = visiableHeight + self.tableView.contentSize.height + contentInsets.top + contentInsets.bottom;
    //: visiableHeight = ((visiableHeight) < (rect.size.height) ? (visiableHeight) : (rect.size.height));
    visiableHeight = ((visiableHeight) < (rect.size.height) ? (visiableHeight) : (rect.size.height));

    //: rect.origin.y = containerSafeHeight - visiableHeight - self.inputView.nim_height;
    rect.origin.y = containerSafeHeight - visiableHeight - self.inputView.nim_height;
    //: rect.origin.y = rect.origin.y > 0? (44.0f + [UIDevice vg_statusBarHeight]) : rect.origin.y;
    rect.origin.y = rect.origin.y > 0? (44.0f + [UIDevice task]) : rect.origin.y;


    //: BOOL tableChanged = !CGRectEqualToRect(self.tableView.frame, rect);
    BOOL tableChanged = !CGRectEqualToRect(self.tableView.frame, rect);
    //: if (tableChanged)
    if (tableChanged)
    {
//        rect.origin.y += SCREEN_TOP_HEIGHT;
//        rect.size.height -= SCREEN_TOP_HEIGHT;
        //: [self.tableView setFrame:rect];
        [self.tableView setFrame:rect];
        //: [self.tableView nim_scrollToBottom:YES];
        [self.tableView valueVoice:YES];
    }
//    [self.tableView nim_scrollToBottom:YES];
}

//: #pragma mark - Notification
#pragma mark - Notification
//: - (void)menuDidHide:(NSNotification *)notification
- (void)menuBy:(NSNotification *)notification
{
    //: [UIMenuController sharedMenuController].menuItems = nil;
    [UIMenuController sharedMenuController].menuItems = nil;
}


//: - (void)keyboardWillChangeFrame:(NSNotification *)notification
- (void)dates:(NSNotification *)notification
{
    //: if (!self.tableView.window)
    if (!self.tableView.window)
    {
        //如果当前视图不是顶部视图，则不需要监听
        //: return;
        return;
    }
    //: [self.inputView sizeToFit];
    [self.inputView sizeToFit];
}




//: #pragma mark - Private
#pragma mark - Private

//: - (void)calculateContent:(BBBMessageModel *)model{
- (void)pin:(AccumulationCenter *)model{
    //: if ([NSThread isMainThread]) {^{ [model contentSize:self.tableView.nim_width]; }();} else {dispatch_sync(dispatch_get_main_queue(), ^{ [model contentSize:self.tableView.nim_width]; });};
    if ([NSThread isMainThread]) {^{ [model aggregation:self.tableView.nim_width]; }();} else {dispatch_sync(dispatch_get_main_queue(), ^{ [model aggregation:self.tableView.nim_width]; });};


}

//: - (void)setupRefreshControl
- (void)show
{
    //: self.refreshControl = [[UIRefreshControl alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    self.refreshControl = [[UIRefreshControl alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];

    //: if (@available(iOS 10.0, *))
    if (@available(iOS 10.0, *))
    {
        //: self.tableView.refreshControl = self.refreshControl;
        self.tableView.refreshControl = self.refreshControl;
    }
    //: else
    else
    {
        //: [self.tableView addSubview: self.refreshControl];
        [self.tableView addSubview: self.refreshControl];
    }

    //: [self.refreshControl addTarget:self action:@selector(headerRereshing:) forControlEvents:UIControlEventValueChanged];
    [self.refreshControl addTarget:self action:@selector(completeOn:) forControlEvents:UIControlEventValueChanged];

}

//: - (void)headerRereshing:(id)sender
- (void)completeOn:(id)sender
{
    //: if ([self.delegate respondsToSelector:@selector(onRefresh)])
    if ([self.delegate respondsToSelector:@selector(componentDistance)])
    {
        //: [self.delegate onRefresh];
        [self.delegate componentDistance];
    }
}

//: - (void)insert:(NSArray<NSIndexPath *> *)indexPaths animated:(BOOL)animated
- (void)success:(NSArray<NSIndexPath *> *)indexPaths independent:(BOOL)animated
{
    //: if (!indexPaths.count)
    if (!indexPaths.count)
    {
        //: [self.tableView reloadData];
        [self.tableView reloadData];

        //: NSInteger rowsCount = [self.tableView numberOfRowsInSection:0];
        NSInteger rowsCount = [self.tableView numberOfRowsInSection:0];
        //: if (rowsCount){
        if (rowsCount){
            //: [self.tableView setContentOffset:CGPointZero animated:NO];
            [self.tableView setContentOffset:CGPointZero animated:NO];
        }

        //: [UIView animateWithDuration:0.1 delay:0 options:7 animations:^{
        [UIView animateWithDuration:0.1 delay:0 options:7 animations:^{
            //: [self resetLayout];
            [self message];
        //: } completion:^(BOOL finished) {
        } completion:^(BOOL finished) {
            //: [self.tableView reloadData];
            [self.tableView reloadData];
        //: }];
        }];
        //: return;
        return;
    }

    //: NSMutableArray *addIndexPathes = [NSMutableArray array];
    NSMutableArray *addIndexPathes = [NSMutableArray array];
    //: [indexPaths enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
    [indexPaths enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        //: NSIndexPath *indexPath = [NSIndexPath indexPathForRow:[obj integerValue] inSection:0];
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:[obj integerValue] inSection:0];
        //: [addIndexPathes addObject:indexPath];
        [addIndexPathes addObject:indexPath];
    //: }];
    }];

    //: BOOL isScroll = (self.tableView.contentSize.height - self.tableView.contentOffset.y > [UIScreen mainScreen].bounds.size.height);
    BOOL isScroll = (self.tableView.contentSize.height - self.tableView.contentOffset.y > [UIScreen mainScreen].bounds.size.height);

    //: if (isScroll || [self shouldReloadWhenInsert:addIndexPathes])
    if (isScroll || [self connectReplacement:addIndexPathes])
    {
        //: [self.tableView reloadData];
        [self.tableView reloadData];
    }
    //: else
    else
    {
        //: [self.tableView beginUpdates];
        [self.tableView beginUpdates];
        //: [self.tableView insertRowsAtIndexPaths:addIndexPathes
        [self.tableView insertRowsAtIndexPaths:addIndexPathes
                              //: withRowAnimation:UITableViewRowAnimationNone];
                              withRowAnimation:UITableViewRowAnimationNone];
        //: [self.tableView endUpdates];
        [self.tableView endUpdates];
        //: [self.tableView scrollToRowAtIndexPath:addIndexPathes.lastObject
        [self.tableView scrollToRowAtIndexPath:addIndexPathes.lastObject
                              //: atScrollPosition:UITableViewScrollPositionTop
                              atScrollPosition:UITableViewScrollPositionTop
                                      //: animated:NO];
                                      animated:NO];
    }

    //: [UIView animateWithDuration:0.1 delay:0 options:7 animations:^{
    [UIView animateWithDuration:0.1 delay:0 options:7 animations:^{
        //: [self resetLayout];
        [self message];
    //: } completion:^(BOOL finished) {
    } completion:^(BOOL finished) {
        //: [self.tableView reloadData];
        [self.tableView reloadData];
    //: }];
    }];
}

//: - (void)remove:(NSArray<NSIndexPath *> *)indexPaths
- (void)banked:(NSArray<NSIndexPath *> *)indexPaths
{
    //: if ([self shouldReloadWhenRemoveOrUpdate:indexPaths])
    if ([self nameDomain:indexPaths])
    {
        //: [self.tableView reloadData];
        [self.tableView reloadData];
        //: return;
        return;
    }

    //: [self.tableView beginUpdates];
    [self.tableView beginUpdates];
    //: [self.tableView deleteRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationNone];
    [self.tableView deleteRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationNone];
    //: [self.tableView endUpdates];
    [self.tableView endUpdates];
//    NSInteger row = [self.tableView numberOfRowsInSection:0] - 1;
//    if (row > 0)
//    {
//        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:row inSection:0];
//        [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionBottom animated:YES];
//    }
}


//: - (void)update:(NSIndexPath *)indexPath
- (void)bigness:(NSIndexPath *)indexPath
{
    //: CCCMessageCell *cell = (CCCMessageCell *)[self.tableView cellForRowAtIndexPath:indexPath];
    StatusViewCell *cell = (StatusViewCell *)[self.tableView cellForRowAtIndexPath:indexPath];
    //: if (cell) {
    if (cell) {
        //: @try {
        @try {
            //: [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
            [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
        //: } @catch (NSException *exception) {
        } @catch (NSException *exception) {
            // 暂时无法保证数据源的一致性
        //: } @finally {
        } @finally {
            //: CGFloat scrollOffsetY = self.tableView.contentOffset.y;
            CGFloat scrollOffsetY = self.tableView.contentOffset.y;
            //: [self.tableView setContentOffset:CGPointMake(self.tableView.contentOffset.x, scrollOffsetY) animated:NO];
            [self.tableView setContentOffset:CGPointMake(self.tableView.contentOffset.x, scrollOffsetY) animated:NO];
        }
    }
}

//: - (BOOL)canInsertChatroomMessages
- (BOOL)press
{
    //: return !self.tableView.isDecelerating && !self.tableView.isDragging;
    return !self.tableView.isDecelerating && !self.tableView.isDragging;
}

//: - (void)adjustOffset:(NSInteger)row {
- (void)view:(NSInteger)row {

}

//: - (void)dismissReplyContent {
- (void)query {
    //: if (!self.inputView.replyedContent.hidden)
    if (!self.inputView.replyedContent.hidden)
    {
        //: [self.inputView.replyedContent dismiss];
        [self.inputView.replyedContent inscription];
    }
}

//: #pragma mark - 
#pragma mark - 

//: - (BOOL)shouldReloadWhenInsert:(NSArray<NSIndexPath *> *)indexPaths
- (BOOL)connectReplacement:(NSArray<NSIndexPath *> *)indexPaths
{
    // 如果插入数据后，中间有空档，则不能直接插入，需要全量重新加载
    //: NSMutableDictionary * sectionCurrentCount = [NSMutableDictionary dictionary];
    NSMutableDictionary * sectionCurrentCount = [NSMutableDictionary dictionary];
    //: NSMutableDictionary * sectionMaxCount = [NSMutableDictionary dictionary];
    NSMutableDictionary * sectionMaxCount = [NSMutableDictionary dictionary];
    //: NSMutableDictionary * sectionInsertingCount = [NSMutableDictionary dictionary];
    NSMutableDictionary * sectionInsertingCount = [NSMutableDictionary dictionary];

    //: for(NSIndexPath * indexPath in indexPaths)
    for(NSIndexPath * indexPath in indexPaths)
    {
        //: NSInteger section = indexPath.section;
        NSInteger section = indexPath.section;
        //: NSInteger count = [self.tableView numberOfRowsInSection:section];
        NSInteger count = [self.tableView numberOfRowsInSection:section];
        //: sectionCurrentCount[@(section)] = @(count);
        sectionCurrentCount[@(section)] = @(count);
    }

    //: for(NSIndexPath * indexPath in indexPaths)
    for(NSIndexPath * indexPath in indexPaths)
    {
        //: NSInteger section = indexPath.section;
        NSInteger section = indexPath.section;
        //: NSInteger row = indexPath.row;
        NSInteger row = indexPath.row;
        //: NSInteger count = [sectionCurrentCount[@(section)] integerValue];
        NSInteger count = [sectionCurrentCount[@(section)] integerValue];
        //: NSInteger sectionMaxNum = [sectionMaxCount[@(section)] integerValue];
        NSInteger sectionMaxNum = [sectionMaxCount[@(section)] integerValue];
        //: NSInteger max = 0;
        NSInteger max = 0;
        //: if (row <= count)
        if (row <= count)
        {
            //: sectionCurrentCount[@(section)] = @(count+1);
            sectionCurrentCount[@(section)] = @(count+1);
            //: max = count + 1;
            max = count + 1;
        }
        //: else
        else
        {
            //: max = row + 1;
            max = row + 1;
        }
        //: max = ((max) > (sectionMaxNum) ? (max) : (sectionMaxNum));
        max = ((max) > (sectionMaxNum) ? (max) : (sectionMaxNum));
        //: sectionMaxCount[@(section)] = @(max);
        sectionMaxCount[@(section)] = @(max);

        //: NSInteger sectionCurrentCount = [sectionInsertingCount[@(section)] integerValue];
        NSInteger sectionCurrentCount = [sectionInsertingCount[@(section)] integerValue];
        //: sectionInsertingCount[@(section)] = @(++ sectionCurrentCount);
        sectionInsertingCount[@(section)] = @(++ sectionCurrentCount);
    }

    //: for(NSNumber * sectionKey in sectionMaxCount.allKeys)
    for(NSNumber * sectionKey in sectionMaxCount.allKeys)
    {
        //: NSInteger maxCount = [sectionMaxCount[sectionKey] integerValue];
        NSInteger maxCount = [sectionMaxCount[sectionKey] integerValue];
        //: NSInteger currentCount = [sectionInsertingCount[sectionKey] integerValue];
        NSInteger currentCount = [sectionInsertingCount[sectionKey] integerValue];
        //: NSInteger section = [sectionKey integerValue];
        NSInteger section = [sectionKey integerValue];
        //: NSInteger count = [self.tableView numberOfRowsInSection:section];
        NSInteger count = [self.tableView numberOfRowsInSection:section];
        //: if (maxCount > count + currentCount)
        if (maxCount > count + currentCount)
        {
            //: return YES;
            return YES;
        }
    }

    //: return NO;
    return NO;
}

//: - (BOOL)shouldReloadWhenRemoveOrUpdate:(NSArray<NSIndexPath *> *)indexPaths
- (BOOL)nameDomain:(NSArray<NSIndexPath *> *)indexPaths
{
    //: for(NSIndexPath * indexPath in indexPaths)
    for(NSIndexPath * indexPath in indexPaths)
    {
        //: NSInteger section = indexPath.section;
        NSInteger section = indexPath.section;
        //: NSInteger number = [self.tableView numberOfRowsInSection:section];
        NSInteger number = [self.tableView numberOfRowsInSection:section];
        //: if (number <= indexPath.row)
        if (number <= indexPath.row)
        {
            //: return YES;
            return YES;
        }
    }

    //: return NO;
    return NO;
}

//: - (NSInteger)numberOfRows
- (NSInteger)container
{
    //: return [self.tableView numberOfRowsInSection:0];
    return [self.tableView numberOfRowsInSection:0];
}

//: @end
@end
