// __DEBUG__
// __CLOSE_PRINT__
//
//  CompartmentViewCell.h
//  NIM
//
//  Created by amao on 5/29/15.
//  Copyright (c) 2015 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import <UIKit/UIKit.h>
#import <UIKit/UIKit.h>

//: @class BBBTeamSwitchTableViewCell;
@class CompartmentViewCell;

//: @protocol NIMTeamSwitchProtocol <NSObject>
@protocol MaxTitle <NSObject>
//: - (void)cell:(BBBTeamSwitchTableViewCell *)cell onStateChanged:(BOOL)on;
- (void)bubble:(CompartmentViewCell *)cell pressedTeam:(BOOL)on;
//: @end
@end

//: @interface BBBTeamSwitchTableViewCell : UITableViewCell
@interface CompartmentViewCell : UITableViewCell
//: @property (nonatomic, assign) NSInteger identify;
@property (nonatomic, assign) NSInteger identify;
//: @property (strong, nonatomic) UISwitch *switcher;
@property (strong, nonatomic) UISwitch *switcher;
//: @property (weak, nonatomic) id<NIMTeamSwitchProtocol> switchDelegate;
@property (weak, nonatomic) id<MaxTitle> switchDelegate;

//: @end
@end