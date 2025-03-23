//
//  AAAInputEmoticonTabView.h
// AppleProjectKit
//
//  Created by chris.
//  Copyright (c) 2015年 NetEase. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AAAInputEmoticonTabView;

@protocol NIMInputEmoticonTabDelegate <NSObject>

- (void)tabView:(AAAInputEmoticonTabView *)tabView didSelectTabIndex:(NSInteger) index;

@end

@interface AAAInputEmoticonTabView : UIControl

@property (nonatomic,strong) UIButton * sendButton;

@property (nonatomic,weak)   id<NIMInputEmoticonTabDelegate>  delegate;

- (void)selectTabIndex:(NSInteger)index;

- (void)loadCatalogs:(NSArray*)emoticonCatalogs;

@end






