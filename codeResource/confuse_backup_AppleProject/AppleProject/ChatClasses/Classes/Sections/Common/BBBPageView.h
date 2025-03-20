//
//  BBBPageView.h
// AppleProjectKit
//
//  Created by chris.
//  Copyright (c) 2015年 NetEase. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BBBPageView;

@protocol BBBPageViewDataSource <NSObject>
- (NSInteger)numberOfPages: (BBBPageView *)pageView;
- (UIView *)pageView: (BBBPageView *)pageView viewInPage: (NSInteger)index;
@end

@protocol BBBPageViewDelegate <NSObject>
@optional
- (void)pageViewScrollEnd: (BBBPageView *)pageView
             currentIndex: (NSInteger)index
               totolPages: (NSInteger)pages;

- (void)pageViewDidScroll: (BBBPageView *)pageView;
- (BOOL)needScrollAnimation;
@end


@interface BBBPageView : UIView<UIScrollViewDelegate>
@property (nonatomic,strong)    UIScrollView   *scrollView;
@property (nonatomic,weak)    id<BBBPageViewDataSource>  dataSource;
@property (nonatomic,weak)    id<BBBPageViewDelegate>    pageViewDelegate;
- (void)scrollToPage: (NSInteger)pages;
- (void)reloadData;
- (UIView *)viewAtIndex: (NSInteger)index;
- (NSInteger)currentPage;


//旋转相关方法,这两个方法必须配对调用,否则会有问题
- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
                                duration:(NSTimeInterval)duration;

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
                                         duration:(NSTimeInterval)duration;
@end
