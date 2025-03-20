// __DEBUG__
// __CLOSE_PRINT__
//
//  DoingViewController.h
// Indicator
//
//  Created by Netease on 2019/6/11.
//  Copyright © 2019 NetEase. All rights reserved.
//  基础UI

// __M_A_C_R_O__
//: #import <UIKit/UIKit.h>
#import <UIKit/UIKit.h>
//: #import "BBBTeamCardRowItem.h"
#import "DoingItem.h"
//: #import "BBBTeamMemberListCell.h"
#import "PhaseOfTheMoonView.h"
//: #import "BBBTeamSwitchTableViewCell.h"
#import "CompartmentViewCell.h"
//: #import "BBBTeamListDataManager.h"
#import "ListHideState.h"
//: #import <NIMSDK/NIMSDK.h>
#import <NIMSDK/NIMSDK.h>

//: NS_ASSUME_NONNULL_BEGIN
NS_ASSUME_NONNULL_BEGIN

//: typedef NS_ENUM (NSInteger, NIMTeamCardSwithCellType){
typedef NS_ENUM (NSInteger, NIMTeamCardSwithCellType){
    //: NIMTeamCardSwithCellTypeTop = 1,
    NIMTeamCardSwithCellTypeTop = 1,
    //: NIMTeamCardSwithCellTypeNotify,
    NIMTeamCardSwithCellTypeNotify,
    //: NIMTeamCardSwithCellTypeMute,
    NIMTeamCardSwithCellTypeMute,
//: };
};

//: typedef void(^NIMTeamCardPickerHandle)(UIImage *image);
typedef void(^NIMTeamCardPickerHandle)(UIImage *image);

//: @protocol BBBTeamCardViewControllerDelegate <NSObject>
@protocol TeamMark <NSObject>

//: - (void)NIMTeamCardVCDidSetTop:(BOOL)on;
- (void)messageTop:(BOOL)on;

//: - (void)NIMTeamCardVCDidSetMute:(BOOL)on;
- (void)parent:(BOOL)on;

//: @end
@end

//: #pragma mark - UI基类
#pragma mark - UI基类
//: @interface BBBTeamCardViewController : UIViewController
@interface DoingViewController : UIViewController

//: @property (nonatomic,weak) id <BBBTeamCardViewControllerDelegate> delegate;
@property (nonatomic,weak) id <TeamMark> delegate;

//: @property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) UITableView *tableView;

//数据源
//: @property (nonatomic,strong) NSArray <NSArray <BBBTeamCardRowItem *> *> *datas;
@property (nonatomic,strong) NSArray <NSArray <DoingItem *> *> *datas;

//显示相册
//: - (void)showImagePicker:(UIImagePickerControllerSourceType)type
- (void)media:(UIImagePickerControllerSourceType)type
             //: completion:(NIMTeamCardPickerHandle)completion;
             device:(NIMTeamCardPickerHandle)completion;

//弹框 - 标题
//: - (UIAlertController *)makeAlertSheetWithTitle:(NSString *)title
- (UIAlertController *)size:(NSString *)title
                                       //: actions:(NSArray <UIAlertAction *>*)actions;
                                       doMinActions:(NSArray <UIAlertAction *>*)actions;

//弹框 - 取消action
//: - (UIAlertAction *)makeCancelAction;
- (UIAlertAction *)styleAction;

//显示弹框
//: - (void)showAlert:(UIAlertController *)alert;
- (void)buildShow:(UIAlertController *)alert;

//显示Toast
//: - (void)showToastMsg:(NSString *)msg;
- (void)blueMsg:(NSString *)msg;


/* --- need reload by child class ---- */
// 子类自定义头文件
//: - (UIView *)didGetHeaderView;
- (UIView *)froth;

// 子类自定义cell
//: - (void)didBuildTeamMemberCell:(BBBTeamMemberListCell *)cell;
- (void)systemTingCell:(PhaseOfTheMoonView *)cell;

// 子类刷新tableview
//: - (void)reloadTableViewData;
- (void)nameLight;

// 子类刷新header
//: - (void)reloadTableHeaderData;
- (void)press;

// 子类刷新其他数据
//: - (void)reloadOtherData;
- (void)downData;

//: @end
@end




//: NS_ASSUME_NONNULL_END
NS_ASSUME_NONNULL_END