//
//  AAAContactSelectTabView.h
// AppleProjectKit
//
//  Created by chris on 15/9/15.
//  Copyright (c) 2015年 NetEase. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AAAContactPickedView;

@interface AAAContactSelectTabView : UIView

@property (nonatomic,strong) AAAContactPickedView *pickedView;

@property (nonatomic,strong) UIButton *doneButton;

@end
