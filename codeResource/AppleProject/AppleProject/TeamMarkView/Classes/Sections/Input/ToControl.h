// __DEBUG__
// __CLOSE_PRINT__
//
//  ToControl.h
// Indicator
//
//  Created by chris.
//  Copyright (c) 2015年 NetEase. All rights reserved.
//

// __M_A_C_R_O__
//: #import <UIKit/UIKit.h>
#import <UIKit/UIKit.h>

//: @class AAAInputEmoticonTabView;
@class ToControl;

//: @protocol NIMInputEmoticonTabDelegate <NSObject>
@protocol InformationTing <NSObject>

//: - (void)tabView:(AAAInputEmoticonTabView *)tabView didSelectTabIndex:(NSInteger) index;
- (void)event:(ToControl *)tabView bar:(NSInteger) index;

//: @end
@end

//: @interface AAAInputEmoticonTabView : UIControl
@interface ToControl : UIControl

//: @property (nonatomic,strong) UIButton * sendButton;
@property (nonatomic,strong) UIButton * sendButton;

//: @property (nonatomic,weak) id<NIMInputEmoticonTabDelegate> delegate;
@property (nonatomic,weak) id<InformationTing> delegate;

//: - (void)selectTabIndex:(NSInteger)index;
- (void)vitaminPill:(NSInteger)index;

//: - (void)loadCatalogs:(NSArray*)emoticonCatalogs;
- (void)size:(NSArray*)emoticonCatalogs;

//: @end
@end