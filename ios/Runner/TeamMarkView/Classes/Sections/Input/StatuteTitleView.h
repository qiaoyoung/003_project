// __DEBUG__
// __CLOSE_PRINT__
//
//  StatuteTitleView.h
// Indicator
//
//  Created by He on 2020/4/3.
//  Copyright © 2020 NetEase. All rights reserved.
//

// __M_A_C_R_O__
//: #import <UIKit/UIKit.h>
#import <UIKit/UIKit.h>
//: #import "M80AttributedLabel.h"
#import "MessageEnableTextView.h"

//: NS_ASSUME_NONNULL_BEGIN
NS_ASSUME_NONNULL_BEGIN

//: @protocol AAAReplyContentViewDelegate <NSObject>
@protocol LightTap <NSObject>

//: @optional
@optional
//: - (void)onClearReplyContent:(id)sender;
- (void)replied:(id)sender;

//: @end
@end

//: @interface AAAReplyContentView : UIView
@interface StatuteTitleView : UIView

//: @property (nonatomic,strong) UIButton *closeButton;
@property (nonatomic,strong) UIButton *closeButton;

//: @property (nonatomic,strong) UIView *divider;
@property (nonatomic,strong) UIView *divider;

//: @property (nonatomic,strong) M80AttributedLabel *label;
@property (nonatomic,strong) MessageEnableTextView *label;

//: @property (nonatomic,weak) id<AAAReplyContentViewDelegate> delegate;
@property (nonatomic,weak) id<LightTap> delegate;

//: - (void)dismiss;
- (void)inscription;

//: @end
@end

//: NS_ASSUME_NONNULL_END
NS_ASSUME_NONNULL_END