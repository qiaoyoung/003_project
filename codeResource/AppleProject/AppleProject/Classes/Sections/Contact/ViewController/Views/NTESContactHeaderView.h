//
//  NTESContactHeaderView.h
//  NIM
//
//  Created by 彭爽 on 2021/9/8.
//  Copyright © 2021 Netease. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NTESContactHeaderView : UIView
@property (nonatomic ,weak) id delegate;
-(void)reloadCountNumber:(NSInteger)systemCount;
@end

@protocol NTESContactHeaderDelegate <NSObject>


-(void)searchClick;
-(void)addFriend;
-(void)newGroup;
-(void)scan;
-(void)friendNotification;
-(void)groupNotification;
-(void)deviceList;
-(void)blackFriendList;
-(void)signIn;
-(void)collectList;
-(void)onlineServer;

-(void)sliderWithIndex:(NSInteger)index;

@end


NS_ASSUME_NONNULL_END
