// __DEBUG__
// __CLOSE_PRINT__
//
//  TinkleViewCell.h
//  NIM
//
//  Created by chris on 15/6/26.
//  Copyright © 2015年 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import <UIKit/UIKit.h>
#import <UIKit/UIKit.h>
//: #import "CCCCommonTableViewCell.h"
#import "CommonCell.h"

//: @interface CCCKitSwitcherCell : UITableViewCell<CCCCommonTableViewCell>
@interface TinkleViewCell : UITableViewCell<CommonCell>

//: @property(nonatomic,strong,readonly) UISwitch *switcher;
@property(nonatomic,strong,readonly) UISwitch *switcher;

//: @end
@end