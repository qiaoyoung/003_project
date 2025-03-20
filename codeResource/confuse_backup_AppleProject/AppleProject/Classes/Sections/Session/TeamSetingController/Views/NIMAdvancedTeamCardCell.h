//
//  NIMAdvancedTeamCardCell.h
//  NIM
//
//  Created by 彭爽 on 2021/10/22.
//  Copyright © 2021 Netease. All rights reserved.
//

#import "BaseTableViewCell.h"
#import "BBBTeamListDataManager.h"
#import "CCCAdvancedTeamCardViewController.h"
#import "BBBKitInfoFetchOption.h"
#import "AAAKitUtil.h"
#import "BBBTeamHelper.h"
#import "BBBTeamCardSelectedViewController.h"
#import "NTESBundleSetting.h"

NS_ASSUME_NONNULL_BEGIN

@interface NIMAdvancedTeamCardCell : BaseTableViewCell
@property (nonatomic ,strong) UILabel *titleLabel;
@property (nonatomic ,strong) UIView *headerBackView;
-(void)reloadWith:(BBBTeamListDataManager *)teamListManager;
@property (nonatomic,strong) CCCAdvancedTeamCardViewController *vc;

@end

@interface NIMAdvancedTeamCardCell_1 : BaseTableViewCell
@property (nonatomic,strong) UIView *whiteView;
@property (nonatomic,strong) CCCAdvancedTeamCardViewController *vc;
@property (nonatomic,strong) BBBTeamListDataManager *teamListManager;

-(void)reloadWith:(BBBTeamListDataManager *)teamListManager;

@end

@interface NIMAdvancedTeamCardCell_2 : BaseTableViewCell
@property (nonatomic,strong) UIView *whiteView;
@property (nonatomic,strong) BBBTeamCardViewControllerOption *option;
@property (nonatomic,strong) CCCAdvancedTeamCardViewController *vc;
@property (nonatomic,strong) BBBTeamListDataManager *teamListManager;
-(void)reloadWith:(BBBTeamListDataManager *)teamListManager;

@end

@interface NIMAdvancedTeamCardCell_3 : BaseTableViewCell
@property (nonatomic,strong) CCCAdvancedTeamCardViewController *vc;
@property (nonatomic,strong) BBBTeamListDataManager *teamListManager;

-(void)reloadWith:(BBBTeamListDataManager *)teamListManager;

@end

@interface NIMAdvancedTeamCardCell_4 : BaseTableViewCell
@property (nonatomic,strong) UIView *whiteView;
@property (nonatomic,strong) CCCAdvancedTeamCardViewController *vc;
@property (nonatomic,strong) BBBTeamListDataManager *teamListManager;

-(void)reloadWith:(BBBTeamListDataManager *)teamListManager;

@end

@interface NIMAdvancedTeamCardCell_5 : BaseTableViewCell
@property (nonatomic,strong) UIView *whiteView;
@property (nonatomic,strong) BBBTeamListDataManager *teamListManager;
@property (nonatomic,strong) CCCAdvancedTeamCardViewController *vc;

-(void)reloadWith:(BBBTeamListDataManager *)teamListManager;

@end

@interface NIMAdvancedTeamCardCell_6 : BaseTableViewCell
@property (nonatomic,strong) UIButton *backBtn;
@property (nonatomic,strong) CCCAdvancedTeamCardViewController *vc;
@property (nonatomic,strong) BBBTeamListDataManager *teamListManager;
-(void)reloadWith:(BBBTeamListDataManager *)teamListManager;

@end



@interface NIMAdvancedTeamSubview : UIView
@property (nonatomic ,strong) UIView *lineView;
@property (nonatomic ,strong) UIButton *backButton;
@property (nonatomic ,strong) UILabel *titleLabel;
@property (nonatomic ,strong) UILabel *contentLabel;
@property (nonatomic ,strong) UIImageView *arrowImage;
@property (nonatomic ,strong) UISwitch *switchView;

@property (nonatomic ,strong) UIImageView *iconImage;

- (instancetype)initWithImageName:(NSString *)imageName;

@end


NS_ASSUME_NONNULL_END
