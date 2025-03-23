// __DEBUG__
// __CLOSE_PRINT__
//
//  StreetwiseView.h
// Indicator
//
//  Created by chris.
//  Copyright (c) 2015年 NetEase. All rights reserved.
//

// __M_A_C_R_O__
//: #import "BBBPageView.h"
#import "ColorAddView.h"
//: #import "CCCSessionConfig.h"
#import "FromConfig.h"

//: @class NIMInputEmoticonCatalog;
@class TinCanTeam;
//: @class AAAInputEmoticonTabView;
@class ToControl;

//: @protocol NIMInputEmoticonProtocol <NSObject>
@protocol PutOnProtocol <NSObject>

//: - (void)didPressSend:(id)sender;
- (void)deviceRange:(id)sender;

//: - (void)didPressDelete:(id)sender;
- (void)activitied:(id)sender;

//: - (void)selectedEmoticon:(NSString*)emoticonID catalog:(NSString*)emotCatalogID description:(NSString *)description;
- (void)system:(NSString*)emoticonID listName:(NSString*)emotCatalogID hiddenRead:(NSString *)description;

//: - (void)selectedGifEmoticon:(NSString*)gif;
- (void)perimeter:(NSString*)gif;

//: @end
@end


//: @interface AAAInputEmoticonContainerView : UIView<BBBPageViewDataSource,BBBPageViewDelegate>
@interface StreetwiseView : UIView<TingFacingPagesSource,MinDelegate>

//: @property (nonatomic, strong) BBBPageView *emoticonPageView;
@property (nonatomic, strong) ColorAddView *emoticonPageView;
//: @property (nonatomic, strong) UIPageControl *emotPageController;
@property (nonatomic, strong) UIPageControl *emotPageController;
//: @property (nonatomic, strong) NSArray *totalCatalogData;
@property (nonatomic, strong) NSArray *totalCatalogData;
//: @property (nonatomic, strong) NIMInputEmoticonCatalog *currentCatalogData;
@property (nonatomic, strong) TinCanTeam *currentCatalogData;
//: @property (nonatomic, readonly)NSArray *allEmoticons;
@property (nonatomic, readonly)NSArray *allEmoticons;
//: @property (nonatomic, strong) AAAInputEmoticonTabView *tabView;
@property (nonatomic, strong) ToControl *tabView;
//: @property (nonatomic, weak) id<NIMInputEmoticonProtocol> delegate;
@property (nonatomic, weak) id<PutOnProtocol> delegate;
//: @property (nonatomic, weak) id<CCCSessionConfig> config;
@property (nonatomic, weak) id<FromConfig> config;

//: @property (nonatomic,strong) UIScrollView *scrollView;
@property (nonatomic,strong) UIScrollView *scrollView;

//: @end
@end