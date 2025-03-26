// __DEBUG__
// __CLOSE_PRINT__
//
//  FromView.h
//  NIM
//
//  Created by 彭爽 on 2021/10/13.
//  Copyright © 2021 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import <UIKit/UIKit.h>
#import <UIKit/UIKit.h>

//: NS_ASSUME_NONNULL_BEGIN
NS_ASSUME_NONNULL_BEGIN

//: @interface NTESSystemSignNotificationSheet : UIView
@interface FromView : UIView

//: @property (nonatomic ,weak) id delegate;
@property (nonatomic ,weak) id delegate;

//: -(instancetype)initWithFrame:(CGRect)frame dictionary:(NSDictionary *)dictionary;
-(instancetype)initWithInput:(CGRect)frame green:(NSDictionary *)dictionary;

//: - (void)show;
- (void)selectedShow;

//: - (void)dismissPicker;
- (void)dismissImage;
//: @end
@end

//: @protocol NTESSystemSignNotificationDelegate <NSObject>
@protocol MessageDelegate <NSObject>

//: -(void)signButtonClickDelegate;
-(void)emotionComment;

//: @end
@end

//: NS_ASSUME_NONNULL_END
NS_ASSUME_NONNULL_END