// __DEBUG__
// __CLOSE_PRINT__
//
//  MarqueeView.h
//  MarqueeView
//
//  Created by youyou on 16/12/5.
//  Copyright © 2016年 iceyouyou. All rights reserved.
//

// __M_A_C_R_O__
//: #import <UIKit/UIKit.h>
#import <UIKit/UIKit.h>

//: @class UUMarqueeView;
@class MarqueeView;

//: typedef NS_ENUM(NSUInteger, UUMarqueeViewDirection) {
typedef NS_ENUM(NSUInteger, UUMarqueeViewDirection) {
    //: UUMarqueeViewDirectionUpward, 
    UUMarqueeViewDirectionUpward, // scroll from bottom to top
    //: UUMarqueeViewDirectionLeftward 
    UUMarqueeViewDirectionLeftward // scroll from right to left
//: };
};

//: #pragma mark - UUMarqueeViewDelegate
#pragma mark - MessageWithDelegate
//: @protocol UUMarqueeViewDelegate <NSObject>
@protocol MessageWithDelegate <NSObject>
//: - (NSUInteger)numberOfDataForMarqueeView:(UUMarqueeView*)marqueeView;
- (NSUInteger)gamePlan:(MarqueeView*)marqueeView;
//: - (void)createItemView:(UIView*)itemView forMarqueeView:(UUMarqueeView*)marqueeView;
- (void)line:(UIView*)itemView user:(MarqueeView*)marqueeView;
//: - (void)updateItemView:(UIView*)itemView atIndex:(NSUInteger)index forMarqueeView:(UUMarqueeView*)marqueeView;
- (void)drag:(UIView*)itemView origin:(NSUInteger)index will:(MarqueeView*)marqueeView;
//: @optional
@optional
//: - (NSUInteger)numberOfVisibleItemsForMarqueeView:(UUMarqueeView*)marqueeView; 
- (NSUInteger)filtering:(MarqueeView*)marqueeView; // only for [UUMarqueeViewDirectionUpward]
//: - (CGFloat)itemViewWidthAtIndex:(NSUInteger)index forMarqueeView:(UUMarqueeView*)marqueeView; 
- (CGFloat)signView:(NSUInteger)index view:(MarqueeView*)marqueeView; // only for [UUMarqueeViewDirectionLeftward]
//: - (CGFloat)itemViewHeightAtIndex:(NSUInteger)index forMarqueeView:(UUMarqueeView*)marqueeView; 
- (CGFloat)doing:(NSUInteger)index conceal:(MarqueeView*)marqueeView; // only for [UUMarqueeViewDirectionUpward] and [useDynamicHeight = YES]
//: - (void)didTouchItemViewAtIndex:(NSUInteger)index forMarqueeView:(UUMarqueeView*)marqueeView;
- (void)bar:(NSUInteger)index changeDoing:(MarqueeView*)marqueeView;
//: @end
@end

//: #pragma mark - UUMarqueeView
#pragma mark - MarqueeView
//: @interface UUMarqueeView : UIView
@interface MarqueeView : UIView
//: @property (nonatomic, weak) id<UUMarqueeViewDelegate> delegate;
@property (nonatomic, weak) id<MessageWithDelegate> delegate;
//: @property (nonatomic, assign) NSTimeInterval timeIntervalPerScroll;
@property (nonatomic, assign) NSTimeInterval timeIntervalPerScroll;
//: @property (nonatomic, assign) NSTimeInterval timeDurationPerScroll; 
@property (nonatomic, assign) NSTimeInterval timeDurationPerScroll; // only for [UUMarqueeViewDirectionUpward] and [useDynamicHeight = NO]
//: @property (nonatomic, assign) BOOL useDynamicHeight; 
@property (nonatomic, assign) BOOL useDynamicHeight; // only for [UUMarqueeViewDirectionUpward]
//: @property (nonatomic, assign) float scrollSpeed; 
@property (nonatomic, assign) float scrollSpeed; // only for [UUMarqueeViewDirectionLeftward] or [UUMarqueeViewDirectionUpward] with [useDynamicHeight = YES]
//: @property (nonatomic, assign) float itemSpacing; 
@property (nonatomic, assign) float itemSpacing; // only for [UUMarqueeViewDirectionLeftward]
//: @property (nonatomic, assign) BOOL stopWhenLessData; 
@property (nonatomic, assign) BOOL stopWhenLessData; // do not scroll when all data has been shown
//: @property (nonatomic, assign) BOOL clipsToBounds;
@property (nonatomic, assign) BOOL clipsToBounds;
//: @property (nonatomic, assign, getter=isTouchEnabled) BOOL touchEnabled;
@property (nonatomic, assign, getter=isTouchEnabled) BOOL touchEnabled;
//: @property (nonatomic, assign) UUMarqueeViewDirection direction;
@property (nonatomic, assign) UUMarqueeViewDirection direction;
//: - (instancetype)initWithDirection:(UUMarqueeViewDirection)direction;
- (instancetype)initWithButtonRecordQuery:(UUMarqueeViewDirection)direction;
//: - (instancetype)initWithFrame:(CGRect)frame direction:(UUMarqueeViewDirection)direction;
- (instancetype)initWithCollection:(CGRect)frame before:(UUMarqueeViewDirection)direction;
//: - (void)reloadData;
- (void)high;
//: - (void)start;
- (void)device;
//: - (void)pause;
- (void)centerPause;
//: @end
@end

//: #pragma mark - UUMarqueeViewTouchResponder(Private)
#pragma mark - UpResponder(Private)
//: @protocol UUMarqueeViewTouchResponder <NSObject>
@protocol UpResponder <NSObject>
//: - (void)touchesBegan;
- (void)toss;
//: - (void)touchesEndedAtPoint:(CGPoint)point;
- (void)replyLengthPoint:(CGPoint)point;
//: - (void)touchesCancelled;
- (void)derivativeInstrument;
//: @end
@end

//: #pragma mark - UUMarqueeViewTouchReceiver(Private)
#pragma mark - TapView(Private)
//: @interface UUMarqueeViewTouchReceiver : UIView
@interface TapView : UIView
//: @property (nonatomic, weak) id<UUMarqueeViewTouchResponder> touchDelegate;
@property (nonatomic, weak) id<UpResponder> touchDelegate;
//: @end
@end

//: #pragma mark - UUMarqueeItemView(Private)
#pragma mark - MessageMaxView(Private)
//: @interface UUMarqueeItemView : UIView 
@interface MessageMaxView : UIView // MessageMaxView's [tag] is the index of data source. if none data source then [tag] is -1
//: @property (nonatomic, assign) BOOL didFinishCreate;
@property (nonatomic, assign) BOOL didFinishCreate;
//: @property (nonatomic, assign) CGFloat width; 
@property (nonatomic, assign) CGFloat width; // cache the item width, only for [UUMarqueeViewDirectionLeftward]
//: @property (nonatomic, assign) CGFloat height; 
@property (nonatomic, assign) CGFloat height; // cache the item height, only for [UUMarqueeViewDirectionUpward]
//: - (void)clear;
- (void)state;
//: @end
@end