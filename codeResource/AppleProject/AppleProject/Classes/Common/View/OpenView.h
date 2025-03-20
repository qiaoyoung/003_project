// __DEBUG__
// __CLOSE_PRINT__
//
//  OpenView.h
//  NIM
//
//  Created by chris on 15/12/16.
//  Copyright © 2015年 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import <UIKit/UIKit.h>
#import <UIKit/UIKit.h>

//: @class NTESPageView;
@class OpenView;

//: @protocol NTESPageViewDataSource <NSObject>
@protocol AddTo <NSObject>
//: - (NSInteger)numberOfPages: (NTESPageView *)pageView;
- (NSInteger)titles: (OpenView *)pageView;
//: - (UIView *)pageView: (NTESPageView *)pageView viewInPage: (NSInteger)index;
- (UIView *)comment: (OpenView *)pageView designatePage: (NSInteger)index;
//: @end
@end

//: @protocol NTESPageViewDelegate <NSObject>
@protocol SearchBubbleDelegate <NSObject>
//: @optional
@optional
//: - (void)pageViewScrollEnd: (NTESPageView *)pageView
- (void)paradigmPages: (OpenView *)pageView
             //: currentIndex: (NSInteger)index
             versoByPages: (NSInteger)index
               //: totolPages: (NSInteger)pages;
               than: (NSInteger)pages;

//: - (void)pageViewDidScroll: (NTESPageView *)pageView;
- (void)underShould: (OpenView *)pageView;
//: - (BOOL)needScrollAnimation;
- (BOOL)scrollColor;
//: @end
@end


//: @interface NTESPageView : UIView<UIScrollViewDelegate>
@interface OpenView : UIView<UIScrollViewDelegate>
//: @property (nonatomic,strong) UIScrollView *scrollView;
@property (nonatomic,strong) UIScrollView *scrollView;
//: @property (nonatomic,weak) id<NTESPageViewDataSource> dataSource;
@property (nonatomic,weak) id<AddTo> dataSource;
//: @property (nonatomic,weak) id<NTESPageViewDelegate> pageViewDelegate;
@property (nonatomic,weak) id<SearchBubbleDelegate> pageViewDelegate;
//: - (void)scrollToPage: (NSInteger)pages;
- (void)teamSession: (NSInteger)pages;
//: - (void)reloadData;
- (void)to;
//: - (UIView *)viewAtIndex: (NSInteger)index;
- (UIView *)messageViewChange: (NSInteger)index;
//: - (NSInteger)currentPage;
- (NSInteger)callDoing;


//旋转相关方法,这两个方法必须配对调用,否则会有问题
//: - (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
- (void)expanse:(UIInterfaceOrientation)toInterfaceOrientation
                                //: duration:(NSTimeInterval)duration;
                                distance:(NSTimeInterval)duration;

//: - (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
- (void)digitiser:(UIInterfaceOrientation)toInterfaceOrientation
                                         //: duration:(NSTimeInterval)duration;
                                         title:(NSTimeInterval)duration;
//: @end
@end