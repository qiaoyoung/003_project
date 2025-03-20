// __DEBUG__
// __CLOSE_PRINT__
//
//  TabularMatterView.h
// Indicator
//
//  Created by chris.
//  Copyright (c) 2015年 NetEase. All rights reserved.
//

// __M_A_C_R_O__
//: #import <UIKit/UIKit.h>
#import <UIKit/UIKit.h>

//: @class NIMInputEmoticon;
@class LiquidEcstasyEmoticon;

//: @protocol NIMEmoticonButtonTouchDelegate <NSObject>
@protocol MarkDelegate <NSObject>

//: - (void)selectedEmoticon:(NIMInputEmoticon*)emoticon catalogID:(NSString*)catalogID;
- (void)eliteStepBook:(LiquidEcstasyEmoticon*)emoticon up:(NSString*)catalogID;

//: @end
@end



//: @interface AAAInputEmoticonButton : UIButton
@interface TabularMatterView : UIButton

//: @property (nonatomic, strong) NIMInputEmoticon *emoticonData;
@property (nonatomic, strong) LiquidEcstasyEmoticon *emoticonData;

//: @property (nonatomic, copy) NSString *catalogID;
@property (nonatomic, copy) NSString *catalogID;

//: @property (nonatomic, weak) id<NIMEmoticonButtonTouchDelegate> delegate;
@property (nonatomic, weak) id<MarkDelegate> delegate;

//: + (AAAInputEmoticonButton*)iconButtonWithData:(NIMInputEmoticon*)data catalogID:(NSString*)catalogID delegate:( id<NIMEmoticonButtonTouchDelegate>)delegate;
+ (TabularMatterView*)device:(LiquidEcstasyEmoticon*)data dataConverter:(NSString*)catalogID barData:( id<MarkDelegate>)delegate;

//: - (void)onIconSelected:(id)sender;
- (void)dayed:(id)sender;

//: @end
@end