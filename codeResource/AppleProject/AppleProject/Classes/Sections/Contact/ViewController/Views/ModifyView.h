// __DEBUG__
// __CLOSE_PRINT__
//
//  ModifyView.h
//  NIM
//
//  Created by 彭爽 on 2021/9/8.
//  Copyright © 2021 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import <UIKit/UIKit.h>
#import <UIKit/UIKit.h>

//: NS_ASSUME_NONNULL_BEGIN
NS_ASSUME_NONNULL_BEGIN

//: @interface NTESContactHeaderView : UIView
@interface ModifyView : UIView
//: @property (nonatomic ,weak) id delegate;
@property (nonatomic ,weak) id delegate;
//: -(void)reloadCountNumber:(NSInteger)systemCount;
-(void)status:(NSInteger)systemCount;
//: @end
@end

//: @protocol NTESContactHeaderDelegate <NSObject>
@protocol NameContactDelegate <NSObject>


//: -(void)searchClick;
-(void)everyArrayLabel;
//: -(void)addFriend;
-(void)searchedFriend;
//: -(void)newGroup;
-(void)rangeGroup;
//: -(void)scan;
-(void)signRight;
//: -(void)friendNotification;
-(void)markChild;
//: -(void)groupNotification;
-(void)currValue;
//: -(void)deviceList;
-(void)keySession;
//: -(void)blackFriendList;
-(void)beyondTitle;
//: -(void)signIn;
-(void)tingIn;
//: -(void)collectList;
-(void)anActivitySelect;
//: -(void)onlineServer;
-(void)wineSteward;

//: -(void)sliderWithIndex:(NSInteger)index;
-(void)beforeTeamIndex:(NSInteger)index;

//: @end
@end


//: NS_ASSUME_NONNULL_END
NS_ASSUME_NONNULL_END
