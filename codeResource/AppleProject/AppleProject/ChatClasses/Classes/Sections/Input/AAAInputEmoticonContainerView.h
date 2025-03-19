//
//  AAAInputEmoticonContainerView.h
// AppleProjectKit
//
//  Created by chris.
//  Copyright (c) 2015年 NetEase. All rights reserved.
//

#import "BBBPageView.h"
#import "CCCSessionConfig.h"

@class NIMInputEmoticonCatalog;
@class AAAInputEmoticonTabView;

@protocol NIMInputEmoticonProtocol <NSObject>

- (void)didPressSend:(id)sender;

- (void)didPressDelete:(id)sender;

- (void)selectedEmoticon:(NSString*)emoticonID catalog:(NSString*)emotCatalogID description:(NSString *)description;

- (void)selectedGifEmoticon:(NSString*)gif;

@end


@interface AAAInputEmoticonContainerView : UIView<BBBPageViewDataSource,BBBPageViewDelegate>

@property (nonatomic, strong)  BBBPageView *emoticonPageView;
@property (nonatomic, strong)  UIPageControl  *emotPageController;
@property (nonatomic, strong)  NSArray                    *totalCatalogData;
@property (nonatomic, strong)  NIMInputEmoticonCatalog    *currentCatalogData;
@property (nonatomic, readonly)NSArray            *allEmoticons;
@property (nonatomic, strong)  AAAInputEmoticonTabView   *tabView;
@property (nonatomic, weak)    id<NIMInputEmoticonProtocol>  delegate;
@property (nonatomic, weak)    id<CCCSessionConfig> config;

@property (nonatomic,strong)    UIScrollView   *scrollView;

@end

