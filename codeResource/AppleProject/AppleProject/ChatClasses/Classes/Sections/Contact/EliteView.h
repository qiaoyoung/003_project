// __DEBUG__
// __CLOSE_PRINT__
//
//  EliteView.h
// Indicator
//
//  Created by chris on 15/9/15.
//  Copyright (c) 2015年 NetEase. All rights reserved.
//

// __M_A_C_R_O__
//: #import <UIKit/UIKit.h>
#import <UIKit/UIKit.h>

//: @class AAAContactPickedView;
@class TeamMarkView;

//: @interface AAAContactSelectTabView : UIView
@interface EliteView : UIView

//: @property (nonatomic,strong) AAAContactPickedView *pickedView;
@property (nonatomic,strong) TeamMarkView *pickedView;

//: @property (nonatomic,strong) UIButton *doneButton;
@property (nonatomic,strong) UIButton *doneButton;

//: @end
@end