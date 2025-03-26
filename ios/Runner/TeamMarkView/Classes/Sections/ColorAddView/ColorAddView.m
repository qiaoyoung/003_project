// __DEBUG__
// __CLOSE_PRINT__
//
//  NIMInputPageView.m
// Indicator
//
//  Created by chris.
//  Copyright (c) 2015年 NetEase. All rights reserved.
//

// __M_A_C_R_O__
//: #import "BBBPageView.h"
#import "ColorAddView.h"

//: @interface BBBPageView ()
@interface ColorAddView ()
{
    //: NSInteger _currentPage;
    NSInteger _currentPage;
    //: NSInteger _currentPageForRotation;
    NSInteger _currentPageForRotation;
}

//: @property (nonatomic,strong) NSMutableArray *pages;
@property (nonatomic,strong) NSMutableArray *pages;

//: - (void)setupControls;
- (void)addPage;

//重新载入的流程
//: - (void)calculatePageNumbers;
- (void)length;
//: - (void)reloadPage;
- (void)cell;
//: - (void)raisePageIndexChangedDelegate;
- (void)marginOfSafetyBar;
//: @end
@end

//: @implementation BBBPageView
@implementation ColorAddView

//: - (id)initWithFrame:(CGRect)frame
- (id)initWithFrame:(CGRect)frame
{
    //: self = [super initWithFrame:frame];
    self = [super initWithFrame:frame];
    //: if (self)
    if (self)
    {
        //: [self setupControls];
        [self addPage];
    }
    //: return self;
    return self;
}

//: - (id)initWithCoder:(NSCoder *)aDecoder
- (id)initWithCoder:(NSCoder *)aDecoder
{
    //: if (self = [super initWithCoder:aDecoder])
    if (self = [super initWithCoder:aDecoder])
    {
        //: [self setupControls];
        [self addPage];
    }
    //: return self;
    return self;
}

//: - (void)setFrame:(CGRect)frame{
- (void)setFrame:(CGRect)frame{
    //: CGFloat originalWidth = self.frame.size.width;
    CGFloat originalWidth = self.frame.size.width;
    //: [super setFrame:frame];
    [super setFrame:frame];
    //: if (originalWidth != frame.size.width) {
    if (originalWidth != frame.size.width) {
        //: [self reloadData];
        [self reload];
    }
}

//: - (void)dealloc
- (void)dealloc
{
    //: _scrollView.delegate = nil;
    _scrollView.delegate = nil;
}

//: - (void)layoutSubviews
- (void)layoutSubviews
{
    //: [super layoutSubviews];
    [super layoutSubviews];
    //: [_scrollView setFrame:self.bounds];
    [_scrollView setFrame:self.bounds];

    //: CGSize size = self.bounds.size;
    CGSize size = self.bounds.size;
    //: [self.scrollView setContentSize:CGSizeMake(size.width * [self.pages count], size.height)];
    [self.scrollView setContentSize:CGSizeMake(size.width * [self.pages count], size.height)];
    //: for (NSInteger i = 0; i < [self.pages count]; i++)
    for (NSInteger i = 0; i < [self.pages count]; i++)
    {
        //: id obj = [self.pages objectAtIndex:i];
        id obj = [self.pages objectAtIndex:i];
        //: if ([obj isKindOfClass:[UIView class]])
        if ([obj isKindOfClass:[UIView class]])
        {
            //: [(UIView *)obj setFrame:CGRectMake(size.width * i, 0, size.width, size.height)];
            [(UIView *)obj setFrame:CGRectMake(size.width * i, 0, size.width, size.height)];
        }
    }

    //CGSize size = self.bounds.size;
    //: BOOL animation = NO;
    BOOL animation = NO;
    //: if (self.pageViewDelegate && [self.pageViewDelegate respondsToSelector:@selector(needScrollAnimation)])
    if (self.pageViewDelegate && [self.pageViewDelegate respondsToSelector:@selector(scrollColor)])
    {
        //: animation = [self.pageViewDelegate needScrollAnimation];
        animation = [self.pageViewDelegate scrollColor];
    }
    //: [self.scrollView scrollRectToVisible:CGRectMake(_currentPage * size.width, 0, size.width, size.height)
    [self.scrollView scrollRectToVisible:CGRectMake(_currentPage * size.width, 0, size.width, size.height)
                                //: animated:animation];
                                animated:animation];

}

//: - (void)setupControls
- (void)addPage
{
    //: if (_scrollView == nil)
    if (_scrollView == nil)
    {
        //: _scrollView = [[UIScrollView alloc]initWithFrame:self.bounds];
        _scrollView = [[UIScrollView alloc]initWithFrame:self.bounds];
        //: _scrollView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        _scrollView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        //: [self addSubview:_scrollView];
        [self addSubview:_scrollView];
        //: _scrollView.pagingEnabled = YES;
        _scrollView.pagingEnabled = YES;
        //: _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.showsVerticalScrollIndicator = NO;
        //: _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.showsHorizontalScrollIndicator = NO;
        //: _scrollView.delegate = self;
        _scrollView.delegate = self;
        //: _scrollView.scrollsToTop = NO;
        _scrollView.scrollsToTop = NO;
    }
}

//: #pragma mark - 对外接口
#pragma mark - 对外接口
//: - (void)scrollToPage: (NSInteger)page
- (void)textShow: (NSInteger)page
{
    //: if (_currentPage != page || page == 0)
    if (_currentPage != page || page == 0)
    {
        //: _currentPage = page;
        _currentPage = page;
        //: [self reloadData];
        [self reload];
    }

}

//: - (void)reloadData
- (void)reload
{
    //: [self calculatePageNumbers];
    [self length];
    //: [self reloadPage];
    [self cell];
}

//: - (UIView *)viewAtIndex: (NSInteger)index
- (UIView *)viewWithoutIndex: (NSInteger)index
{
    //: UIView *view = nil;
    UIView *view = nil;
    //: if (index >= 0 && index < [_pages count])
    if (index >= 0 && index < [_pages count])
    {
        //: id obj = [_pages objectAtIndex:index];
        id obj = [_pages objectAtIndex:index];
        //: if ([obj isKindOfClass:[UIView class]])
        if ([obj isKindOfClass:[UIView class]])
        {
            //: view = obj;
            view = obj;
        }
    }
    //: return view;
    return view;
}

//: - (NSInteger)currentPage
- (NSInteger)date
{
    //: return _currentPage;
    return _currentPage;
}

//: - (NSInteger)pageInBound:(NSInteger)value min:(NSInteger)min max:(NSInteger)max{
- (NSInteger)rebound:(NSInteger)value colored:(NSInteger)min pathMax:(NSInteger)max{
    //: if (max < min) {
    if (max < min) {
        //: max = min;
        max = min;
    }
    //: NSInteger bounded = value;
    NSInteger bounded = value;
    //: if (bounded > max) {
    if (bounded > max) {
        //: bounded = max;
        bounded = max;
    }
    //: if (bounded < min) {
    if (bounded < min) {
        //: bounded = min;
        bounded = min;
    }
    //: return bounded;
    return bounded;
}

//: #pragma mark - Page载入和销毁
#pragma mark - Page载入和销毁
//: - (void)loadPagesForCurrentPage:(NSInteger)currentPage
- (void)on:(NSInteger)currentPage
{
    //: NSUInteger count = [_pages count];
    NSUInteger count = [_pages count];
    //: if (count == 0)
    if (count == 0)
    {
        //: return;
        return;
    }
    //: NSInteger first = [self pageInBound:currentPage - 1 min:0 max:count - 1];
    NSInteger first = [self rebound:currentPage - 1 colored:0 pathMax:count - 1];
    //: NSInteger last = [self pageInBound:currentPage + 1 min:0 max:count - 1];
    NSInteger last = [self rebound:currentPage + 1 colored:0 pathMax:count - 1];
    //: NSRange range = NSMakeRange(first, last - first + 1);
    NSRange range = NSMakeRange(first, last - first + 1);

    //: for (NSUInteger index = 0; index < count; index++)
    for (NSUInteger index = 0; index < count; index++)
    {
        //: if (NSLocationInRange(index, range))
        if (NSLocationInRange(index, range))
        {
            //: id obj = [_pages objectAtIndex:index];
            id obj = [_pages objectAtIndex:index];
            //: if (![obj isKindOfClass:[UIView class]])
            if (![obj isKindOfClass:[UIView class]])
            {
                //: if (_dataSource && [_dataSource respondsToSelector:@selector(pageView:viewInPage:)])
                if (_dataSource && [_dataSource respondsToSelector:@selector(comment:designatePage:)])
                {
                    //: UIView *view = [_dataSource pageView:self viewInPage:index];
                    UIView *view = [_dataSource comment:self designatePage:index];
                    //: [_pages replaceObjectAtIndex:index withObject:view];
                    [_pages replaceObjectAtIndex:index withObject:view];
                    //: [self.scrollView addSubview:view];
                    [self.scrollView addSubview:view];
                    //: CGSize size = self.bounds.size;
                    CGSize size = self.bounds.size;
                    //: [view setFrame:CGRectMake(size.width * index, 0, size.width, size.height)];
                    [view setFrame:CGRectMake(size.width * index, 0, size.width, size.height)];
                }
                //: else
                else
                {
                    //: assert(0);
                    assert(0);
                }
            }

        }
        //: else
        else
        {
            //: id obj = [_pages objectAtIndex:index];
            id obj = [_pages objectAtIndex:index];
            //: if ([obj isKindOfClass:[UIView class]])
            if ([obj isKindOfClass:[UIView class]])
            {
                //: [obj removeFromSuperview];
                [obj removeFromSuperview];
                //: [_pages replaceObjectAtIndex:index withObject:[NSNull null]];
                [_pages replaceObjectAtIndex:index withObject:[NSNull null]];
            }
        }
    }
}


//: - (void)calculatePageNumbers
- (void)length
{
    //: NSInteger numberOfPages = 0;
    NSInteger numberOfPages = 0;
    //: for (id obj in _pages)
    for (id obj in _pages)
    {
        //: if ([obj isKindOfClass:[UIView class]])
        if ([obj isKindOfClass:[UIView class]])
        {
            //: [(UIView *)obj removeFromSuperview];
            [(UIView *)obj removeFromSuperview];
        }
    }
    //: if(_dataSource && [_dataSource respondsToSelector:@selector(numberOfPages:)])
    if(_dataSource && [_dataSource respondsToSelector:@selector(titles:)])
    {
        //: numberOfPages = [_dataSource numberOfPages:self];
        numberOfPages = [_dataSource titles:self];
    }
    //: self.pages = [NSMutableArray arrayWithCapacity:numberOfPages];
    self.pages = [NSMutableArray arrayWithCapacity:numberOfPages];
    //: for (NSInteger i = 0; i < numberOfPages; i ++)
    for (NSInteger i = 0; i < numberOfPages; i ++)
    {
        //: [_pages addObject:[NSNull null]];
        [_pages addObject:[NSNull null]];
    }
    //注意，这里设置delegate是因为计算contentsize的时候会引起scrollViewDidScroll执行，修改currentpage的值，这样在贴图（举个例子）前面的分类页数比后面的分类页数多，前面的分类滚动到最后面一页后，再显示后面的分类，会显示不正确
    //: self.scrollView.delegate = nil;
    self.scrollView.delegate = nil;
    //: CGSize size = self.bounds.size;
    CGSize size = self.bounds.size;
    //: [self.scrollView setContentSize:CGSizeMake(size.width * numberOfPages, size.height)];
    [self.scrollView setContentSize:CGSizeMake(size.width * numberOfPages, size.height)];
    //: self.scrollView.delegate = self;
    self.scrollView.delegate = self;
}

//: - (void)reloadPage
- (void)cell
{
    //reload的时候尽量记住上次的位置
    //: if (_currentPage >= [_pages count])
    if (_currentPage >= [_pages count])
    {
        //: _currentPage = [_pages count] - 1;
        _currentPage = [_pages count] - 1;
    }
    //: if (_currentPage < 0)
    if (_currentPage < 0)
    {
        //: _currentPage = 0;
        _currentPage = 0;
    }

    //: [self loadPagesForCurrentPage:_currentPage];
    [self on:_currentPage];
    //: [self raisePageIndexChangedDelegate];
    [self marginOfSafetyBar];
    //: [self setNeedsLayout];
    [self setNeedsLayout];
}


//: #pragma mark - ScrollView Delegate
#pragma mark - ScrollView Delegate
//: - (void)scrollViewDidScroll:(UIScrollView *)scrollView
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //: CGFloat width = scrollView.bounds.size.width;
    CGFloat width = scrollView.bounds.size.width;
    //: CGFloat offsetX = scrollView.contentOffset.x;
    CGFloat offsetX = scrollView.contentOffset.x;
    //: NSInteger page = (NSInteger)(fabs(offsetX / width));
    NSInteger page = (NSInteger)(fabs(offsetX / width));
    //: if (page >= 0 && page < [_pages count])
    if (page >= 0 && page < [_pages count])
    {
        //: if (_currentPage == page) {
        if (_currentPage == page) {
            //: return;
            return;
        }
        //: _currentPage = page;
        _currentPage = page;
        //: [self loadPagesForCurrentPage:_currentPage];
        [self on:_currentPage];
    }

    //: if (_pageViewDelegate && [_pageViewDelegate respondsToSelector:@selector(pageViewDidScroll:)])
    if (_pageViewDelegate && [_pageViewDelegate respondsToSelector:@selector(underShould:)])
    {
        //: [_pageViewDelegate pageViewDidScroll:self];
        [_pageViewDelegate underShould:self];
    }
}

//: - (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    //: [self raisePageIndexChangedDelegate];
    [self marginOfSafetyBar];
}

//: #pragma mark - 辅助方法
#pragma mark - 辅助方法
//: - (void)raisePageIndexChangedDelegate
- (void)marginOfSafetyBar
{
    //: if (_pageViewDelegate && [_pageViewDelegate respondsToSelector:@selector(pageViewScrollEnd:currentIndex:totolPages:)])
    if (_pageViewDelegate && [_pageViewDelegate respondsToSelector:@selector(paradigmPages:versoByPages:than:)])
    {
        //: [_pageViewDelegate pageViewScrollEnd:self
        [_pageViewDelegate paradigmPages:self
                                //: currentIndex:_currentPage
                                versoByPages:_currentPage
                                  //: totolPages:[_pages count]];
                                  than:[_pages count]];
    }
}

//: - (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
- (void)color:(UIInterfaceOrientation)toInterfaceOrientation
                                //: duration:(NSTimeInterval)duration
                                numbererfaceMessage:(NSTimeInterval)duration
{
    //: _scrollView.delegate = nil;
    _scrollView.delegate = nil;
    //: _currentPageForRotation = _currentPage;
    _currentPageForRotation = _currentPage;
}

//: - (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
- (void)hide:(UIInterfaceOrientation)toInterfaceOrientation
                                         //: duration:(NSTimeInterval)duration
                                         low:(NSTimeInterval)duration
{
    //: CGSize size = self.bounds.size;
    CGSize size = self.bounds.size;
    //: _scrollView.contentSize = CGSizeMake(size.width * [_pages count], size.height);
    _scrollView.contentSize = CGSizeMake(size.width * [_pages count], size.height);
    //: for (NSUInteger i = 0; i < [_pages count]; i++)
    for (NSUInteger i = 0; i < [_pages count]; i++)
    {
        //: id obj = [_pages objectAtIndex:i];
        id obj = [_pages objectAtIndex:i];
        //: if ([obj isKindOfClass:[UIView class]])
        if ([obj isKindOfClass:[UIView class]])
        {
            //: [(UIView *)obj setFrame:CGRectMake(size.width * i, 0, size.width, size.height)];
            [(UIView *)obj setFrame:CGRectMake(size.width * i, 0, size.width, size.height)];

            /*
             //这里有点ugly,先这样吧...
             if ([obj respondsToSelector:@selector(reset)])
             {
             [obj performSelector:@selector(reset)];
             }*/
        }
    }
    //: _scrollView.contentOffset = CGPointMake(_currentPageForRotation * self.bounds.size.width, 0);
    _scrollView.contentOffset = CGPointMake(_currentPageForRotation * self.bounds.size.width, 0);
    //: _scrollView.delegate = self;
    _scrollView.delegate = self;

}

//: @end
@end