// __DEBUG__
// __CLOSE_PRINT__
//
//  ContainerView.h
//  NIM
//
//  Created by 彭爽 on 2021/10/22.
//  Copyright © 2021 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import "BaseTableViewCell.h"
#import "CompartmentView.h"
//: #import "BBBTeamListDataManager.h"
#import "ListHideState.h"
//: #import "CCCAdvancedTeamCardViewController.h"
#import "AssemblageViewController.h"
//: #import "BBBKitInfoFetchOption.h"
#import "TitleOption.h"
//: #import "AAAKitUtil.h"
#import "TypicalCenter.h"
//: #import "BBBTeamHelper.h"
#import "LanguageChild.h"
//: #import "BBBTeamCardSelectedViewController.h"
#import "TeamOfViewController.h"
//: #import "NTESBundleSetting.h"
#import "NameLine.h"

//: NS_ASSUME_NONNULL_BEGIN
NS_ASSUME_NONNULL_BEGIN

//: @interface NIMAdvancedTeamCardCell : BaseTableViewCell
@interface ContainerView : CompartmentView
//: @property (nonatomic ,strong) UILabel *titleLabel;
@property (nonatomic ,strong) UILabel *titleLabel;
//: @property (nonatomic ,strong) UIView *headerBackView;
@property (nonatomic ,strong) UIView *headerBackView;
//: -(void)reloadWith:(BBBTeamListDataManager *)teamListManager;
-(void)light:(ListHideState *)teamListManager;
//: @property (nonatomic,strong) CCCAdvancedTeamCardViewController *vc;
@property (nonatomic,strong) AssemblageViewController *vc;

//: @end
@end

//: @interface NIMAdvancedTeamCardCell_1 : BaseTableViewCell
@interface ContainerViewCell : CompartmentView
//: @property (nonatomic,strong) UIView *whiteView;
@property (nonatomic,strong) UIView *whiteView;
//: @property (nonatomic,strong) CCCAdvancedTeamCardViewController *vc;
@property (nonatomic,strong) AssemblageViewController *vc;
//: @property (nonatomic,strong) BBBTeamListDataManager *teamListManager;
@property (nonatomic,strong) ListHideState *teamListManager;

//: -(void)reloadWith:(BBBTeamListDataManager *)teamListManager;
-(void)clean:(ListHideState *)teamListManager;

//: @end
@end

//: @interface NIMAdvancedTeamCardCell_2 : BaseTableViewCell
@interface DateViewCell : CompartmentView
//: @property (nonatomic,strong) UIView *whiteView;
@property (nonatomic,strong) UIView *whiteView;
//: @property (nonatomic,strong) BBBTeamCardViewControllerOption *option;
@property (nonatomic,strong) ViewOption *option;
//: @property (nonatomic,strong) CCCAdvancedTeamCardViewController *vc;
@property (nonatomic,strong) AssemblageViewController *vc;
//: @property (nonatomic,strong) BBBTeamListDataManager *teamListManager;
@property (nonatomic,strong) ListHideState *teamListManager;
//: -(void)reloadWith:(BBBTeamListDataManager *)teamListManager;
-(void)team:(ListHideState *)teamListManager;

//: @end
@end

//: @interface NIMAdvancedTeamCardCell_3 : BaseTableViewCell
@interface MinViewCell : CompartmentView
//: @property (nonatomic,strong) CCCAdvancedTeamCardViewController *vc;
@property (nonatomic,strong) AssemblageViewController *vc;
//: @property (nonatomic,strong) BBBTeamListDataManager *teamListManager;
@property (nonatomic,strong) ListHideState *teamListManager;

//: -(void)reloadWith:(BBBTeamListDataManager *)teamListManager;
-(void)colorWith:(ListHideState *)teamListManager;

//: @end
@end

//: @interface NIMAdvancedTeamCardCell_4 : BaseTableViewCell
@interface EmpowerViewCell : CompartmentView
//: @property (nonatomic,strong) UIView *whiteView;
@property (nonatomic,strong) UIView *whiteView;
//: @property (nonatomic,strong) CCCAdvancedTeamCardViewController *vc;
@property (nonatomic,strong) AssemblageViewController *vc;
//: @property (nonatomic,strong) BBBTeamListDataManager *teamListManager;
@property (nonatomic,strong) ListHideState *teamListManager;

//: -(void)reloadWith:(BBBTeamListDataManager *)teamListManager;
-(void)to:(ListHideState *)teamListManager;

//: @end
@end

//: @interface NIMAdvancedTeamCardCell_5 : BaseTableViewCell
@interface OfShouldViewCell : CompartmentView
//: @property (nonatomic,strong) UIView *whiteView;
@property (nonatomic,strong) UIView *whiteView;
//: @property (nonatomic,strong) BBBTeamListDataManager *teamListManager;
@property (nonatomic,strong) ListHideState *teamListManager;
//: @property (nonatomic,strong) CCCAdvancedTeamCardViewController *vc;
@property (nonatomic,strong) AssemblageViewController *vc;

//: -(void)reloadWith:(BBBTeamListDataManager *)teamListManager;
-(void)determine:(ListHideState *)teamListManager;

//: @end
@end

//: @interface NIMAdvancedTeamCardCell_6 : BaseTableViewCell
@interface StateView : CompartmentView
//: @property (nonatomic,strong) UIButton *backBtn;
@property (nonatomic,strong) UIButton *backBtn;
//: @property (nonatomic,strong) CCCAdvancedTeamCardViewController *vc;
@property (nonatomic,strong) AssemblageViewController *vc;
//: @property (nonatomic,strong) BBBTeamListDataManager *teamListManager;
@property (nonatomic,strong) ListHideState *teamListManager;
//: -(void)reloadWith:(BBBTeamListDataManager *)teamListManager;
-(void)refresh:(ListHideState *)teamListManager;

//: @end
@end



//: @interface NIMAdvancedTeamSubview : UIView
@interface PrecociousView : UIView
//: @property (nonatomic ,strong) UIView *lineView;
@property (nonatomic ,strong) UIView *lineView;
//: @property (nonatomic ,strong) UIButton *backButton;
@property (nonatomic ,strong) UIButton *backButton;
//: @property (nonatomic ,strong) UILabel *titleLabel;
@property (nonatomic ,strong) UILabel *titleLabel;
//: @property (nonatomic ,strong) UILabel *contentLabel;
@property (nonatomic ,strong) UILabel *contentLabel;
//: @property (nonatomic ,strong) UIImageView *arrowImage;
@property (nonatomic ,strong) UIImageView *arrowImage;
//: @property (nonatomic ,strong) UISwitch *switchView;
@property (nonatomic ,strong) UISwitch *switchView;

//: @property (nonatomic ,strong) UIImageView *iconImage;
@property (nonatomic ,strong) UIImageView *iconImage;

//: - (instancetype)initWithImageName:(NSString *)imageName;
- (instancetype)initWithCanSession:(NSString *)imageName;

//: @end
@end


//: NS_ASSUME_NONNULL_END
NS_ASSUME_NONNULL_END