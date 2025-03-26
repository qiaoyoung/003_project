// __DEBUG__
// __CLOSE_PRINT__
//
//  ColorAddView.h
// Indicator
//
//  Created by chris.
//  Copyright (c) 2015年 NetEase. All rights reserved.
//

// __M_A_C_R_O__
//: #import <UIKit/UIKit.h>
#import <UIKit/UIKit.h>

//: @class BBBPageView;
@class ColorAddView;

//: @protocol BBBPageViewDataSource <NSObject>
@protocol TingFacingPagesSource <NSObject>
//: - (NSInteger)numberOfPages: (BBBPageView *)pageView;
- (NSInteger)titles: (ColorAddView *)pageView;
//: - (UIView *)pageView: (BBBPageView *)pageView viewInPage: (NSInteger)index;
- (UIView *)comment: (ColorAddView *)pageView designatePage: (NSInteger)index;
//: @end
@end

//: @protocol BBBPageViewDelegate <NSObject>
@protocol MinDelegate <NSObject>
//: @optional
@optional
//: - (void)pageViewScrollEnd: (BBBPageView *)pageView
- (void)paradigmPages: (ColorAddView *)pageView
             //: currentIndex: (NSInteger)index
             versoByPages: (NSInteger)index
               //: totolPages: (NSInteger)pages;
               than: (NSInteger)pages;

//: - (void)pageViewDidScroll: (BBBPageView *)pageView;
- (void)underShould: (ColorAddView *)pageView;
//: - (BOOL)needScrollAnimation;
- (BOOL)scrollColor;
//: @end
@end


//: @interface BBBPageView : UIView<UIScrollViewDelegate>
@interface ColorAddView : UIView<UIScrollViewDelegate>
//: @property (nonatomic,strong) UIScrollView *scrollView;
@property (nonatomic,strong) UIScrollView *scrollView;
//: @property (nonatomic,weak) id<BBBPageViewDataSource> dataSource;
@property (nonatomic,weak) id<TingFacingPagesSource> dataSource;
//: @property (nonatomic,weak) id<BBBPageViewDelegate> pageViewDelegate;
@property (nonatomic,weak) id<MinDelegate> pageViewDelegate;
//: - (void)scrollToPage: (NSInteger)pages;
- (void)textShow: (NSInteger)pages;
//: - (void)reloadData;
- (void)reload;
//: - (UIView *)viewAtIndex: (NSInteger)index;
- (UIView *)viewWithoutIndex: (NSInteger)index;
//: - (NSInteger)currentPage;
- (NSInteger)date;


//旋转相关方法,这两个方法必须配对调用,否则会有问题
//: - (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
- (void)color:(UIInterfaceOrientation)toInterfaceOrientation
                                //: duration:(NSTimeInterval)duration;
                                numbererfaceMessage:(NSTimeInterval)duration;

//: - (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
- (void)hide:(UIInterfaceOrientation)toInterfaceOrientation
                                         //: duration:(NSTimeInterval)duration;
                                         low:(NSTimeInterval)duration;
//: @end
@end