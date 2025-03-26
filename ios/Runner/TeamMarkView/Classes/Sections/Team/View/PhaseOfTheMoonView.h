// __DEBUG__
// __CLOSE_PRINT__
//
//  PhaseOfTheMoonView.h
//  NIM
//
//  Created by chris on 15/3/26.
//  Copyright (c) 2015年 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import <UIKit/UIKit.h>
#import <UIKit/UIKit.h>
//: #import <NIMSDK/NIMSDK.h>
#import <NIMSDK/NIMSDK.h>
//: #import "AppleProjectKit.h"
#import "Indicator.h"

//: extern NSString *const kTeamMember;
extern NSString *const k_tagData;
//: extern NSString *const kTeamMemberInfo;
extern NSString *const k_errorValue;

//: @protocol BBBTeamMemberListCellActionDelegate <NSObject>
@protocol TitleStatusWith <NSObject>

//: - (void)didSelectAddOpeartor;
- (void)upBlock;

//: @end
@end


//: @interface BBBTeamMemberListCell : UITableViewCell
@interface PhaseOfTheMoonView : UITableViewCell


//: @property(nonatomic, assign) BOOL disableInvite;
@property(nonatomic, assign) BOOL disableInvite;

//: @property(nonatomic, assign) NSInteger maxShowMemberCount;
@property(nonatomic, assign) NSInteger maxShowMemberCount;

//: @property(nonatomic, strong) NSMutableArray <NSDictionary *> *infos;
@property(nonatomic, strong) NSMutableArray <NSDictionary *> *infos;

//: @property(nonatomic, weak) id<BBBTeamMemberListCellActionDelegate>delegate;
@property(nonatomic, weak) id<TitleStatusWith>delegate;

//: @end
@end