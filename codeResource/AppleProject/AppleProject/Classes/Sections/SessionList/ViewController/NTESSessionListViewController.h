//
//  NTESSessionListViewController.h
//  NIMDemo
//
//  Created by chris on 15/2/2.
//  Copyright (c) 2015年 Netease. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NTESSessionListViewController : BBBSessionListViewController

@property (nonatomic,strong) UILabel *emptyTipLabel;

@property (nonatomic,strong) UIImageView *emptyImageView;

@property (nonatomic,strong) UIButton *addBtn;

- (void)setUpNavItem;

@end
