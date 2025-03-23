
#import <Foundation/Foundation.h>

NSString *StringFromRatedData(Byte *data);        


//: onTouchImportLocalMessages:
Byte str_ratedScapeTitle[] = {36, 27, 26, 14, 140, 131, 42, 181, 23, 254, 177, 215, 193, 213, 85, 84, 58, 85, 91, 73, 78, 47, 83, 86, 85, 88, 90, 50, 85, 73, 71, 82, 51, 75, 89, 89, 71, 77, 75, 89, 32, 9};


//: onTouchExportLocalMessages:
Byte str_chemicalKickByData[] = {80, 27, 10, 12, 71, 38, 111, 238, 167, 104, 247, 30, 101, 100, 74, 101, 107, 89, 94, 59, 110, 102, 101, 104, 106, 66, 101, 89, 87, 98, 67, 91, 105, 105, 87, 93, 91, 105, 48, 110};


//: row
Byte str_numberSculptName[] = {19, 3, 31, 7, 169, 204, 18, 83, 80, 88, 142};


//: 本地消息将存至云端，会耗费较长时间
Byte str_credibilityName[] = {43, 51, 64, 6, 26, 210, 166, 92, 108, 165, 92, 112, 166, 118, 72, 166, 65, 111, 165, 112, 70, 165, 109, 88, 168, 71, 115, 164, 122, 81, 167, 107, 111, 175, 124, 76, 164, 124, 90, 168, 64, 87, 168, 116, 121, 168, 126, 67, 169, 85, 127, 166, 87, 118, 169, 87, 116, 219};


//: 本地消息迁移
Byte str_elegantName[] = {38, 18, 61, 7, 134, 175, 151, 169, 95, 111, 168, 95, 115, 169, 121, 75, 169, 68, 114, 171, 130, 68, 170, 106, 126, 28};


//: 未找到消息备份。请先在旧设备上导出消息记录
Byte str_horseValue[] = {98, 63, 53, 7, 28, 1, 115, 177, 103, 117, 177, 84, 137, 176, 83, 123, 177, 129, 83, 177, 76, 122, 176, 111, 82, 175, 134, 136, 174, 75, 77, 179, 122, 130, 176, 80, 83, 176, 103, 115, 177, 98, 114, 179, 121, 137, 176, 111, 82, 175, 131, 85, 176, 122, 135, 176, 82, 133, 177, 129, 83, 177, 76, 122, 179, 121, 123, 176, 136, 96, 58};


//: title
Byte str_eagerData[] = {48, 5, 90, 11, 204, 180, 223, 200, 143, 70, 217, 26, 15, 26, 18, 11, 229};


//: action
Byte str_disableMathematicTitle[] = {71, 6, 82, 13, 204, 32, 20, 4, 74, 233, 83, 233, 143, 15, 17, 34, 23, 29, 28, 174};


//: 继续导出
Byte str_shouldBalanceText[] = {70, 12, 2, 10, 147, 138, 34, 175, 5, 148, 229, 185, 165, 229, 185, 171, 227, 173, 186, 227, 133, 184, 124};


//: 本地消息导入
Byte str_weekendMinimumValue[] = {71, 18, 42, 12, 15, 241, 24, 193, 26, 50, 31, 186, 188, 114, 130, 187, 114, 134, 188, 140, 94, 188, 87, 133, 187, 133, 146, 187, 91, 123, 63};


//: headerTitle
Byte str_joinValue[] = {74, 11, 43, 14, 137, 223, 195, 65, 118, 96, 154, 79, 138, 173, 61, 58, 54, 57, 58, 71, 41, 62, 73, 65, 58, 30};


//: 确定导出本地消息？
Byte str_tropicPorkTitle[] = {45, 27, 24, 7, 50, 51, 98, 207, 137, 150, 205, 150, 130, 205, 151, 164, 205, 111, 162, 206, 132, 148, 205, 132, 152, 206, 158, 112, 206, 105, 151, 215, 164, 135, 27};


//: 本地消息导出
Byte str_overtData[] = {88, 18, 57, 4, 173, 99, 115, 172, 99, 119, 173, 125, 79, 173, 72, 118, 172, 118, 131, 172, 78, 129, 164};


//: 发生了错误
Byte str_cedeAttractName[] = {98, 15, 70, 11, 64, 1, 192, 171, 17, 100, 121, 159, 73, 75, 161, 78, 89, 158, 116, 64, 163, 78, 83, 162, 105, 105, 72};

// __DEBUG__
// __CLOSE_PRINT__
//
//  OfPressedViewController.m
//  NIM
//
//  Created by Sampson on 2018/12/10.
//  Copyright © 2018 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import "NTESMigrateMessageViewController.h"
#import "OfPressedViewController.h"
//: #import "UserCommonTableData.h"
#import "UserCommonTableData.h"
//: #import "CCCCommonTableDelegate.h"
#import "StreetwiseDelegate.h"
//: #import "SVProgressHUD.h"
#import "SVProgressHUD.h"
//: #import "NTESExportMessageViewController.h"
#import "TradeColorMarkViewController.h"
//: #import "NTESImportMessageViewController.h"
#import "TingViewController.h"
//: #import "UIView+Toast.h"
#import "UIView+Toast.h"

//: @interface NTESMigrateMessageViewController ()
@interface OfPressedViewController ()

//: @property (nonatomic,copy) NSArray *data;
@property (nonatomic,copy) NSArray *data;
//: @property (nonatomic,strong) CCCCommonTableDelegate *delegator;
@property (nonatomic,strong) StreetwiseDelegate *delegator;

//: @end
@end

//: @implementation NTESMigrateMessageViewController
@implementation OfPressedViewController

//: - (void)viewDidLoad {
- (void)viewDidLoad {
    //: [super viewDidLoad];
    [super viewDidLoad];

    //: self.title = @"本地消息迁移".ntes_localized;
    self.title = StringFromRatedData(str_elegantName).language;
    //: self.view.backgroundColor = [UIColor whiteColor];
    self.view.backgroundColor = [UIColor whiteColor];

    //: [self buildData];
    [self link];
    //: __weak typeof(self) wself = self;
    __weak typeof(self) wself = self;
    //: self.delegator = [[CCCCommonTableDelegate alloc] initWithTableData:^NSArray *{
    self.delegator = [[StreetwiseDelegate alloc] initWithBubbleData:^NSArray *{
        //: return wself.data;
        return wself.data;
    //: }];
    }];

    //: self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    //: [self.view addSubview:self.tableView];
    [self.view addSubview:self.tableView];
    //: self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    //: self.tableView.sectionIndexBackgroundColor = [UIColor clearColor];
    self.tableView.sectionIndexBackgroundColor = [UIColor clearColor];
    //: self.tableView.delegate = self.delegator;
    self.tableView.delegate = self.delegator;
    //: self.tableView.dataSource = self.delegator;
    self.tableView.dataSource = self.delegator;
}

//: - (void)viewDidLayoutSubviews {
- (void)viewDidLayoutSubviews {
    //: [super viewDidLayoutSubviews];
    [super viewDidLayoutSubviews];
    //: CGFloat heightAdjust = self.view.safeAreaInsets.bottom;
    CGFloat heightAdjust = self.view.safeAreaInsets.bottom;
    //: const CGRect frame = self.view.frame;
    const CGRect frame = self.view.frame;
    //: self.tableView.frame = CGRectMake(0, 0, CGRectGetWidth(frame), CGRectGetHeight(frame) - heightAdjust);
    self.tableView.frame = CGRectMake(0, 0, CGRectGetWidth(frame), CGRectGetHeight(frame) - heightAdjust);

}

//: #pragma mark --
#pragma mark --
//: - (void)buildData {
- (void)link {
    //: NSArray *data = @[
    NSArray *data = @[
                      //: @{
                      @{
                          //: @"headerTitle" : @"",
                          StringFromRatedData(str_joinValue) : @"",
                          //: @"row" : @[
                          StringFromRatedData(str_numberSculptName) : @[
                                  //: @{
                                  @{
                                      //: @"title" : @"本地消息导出".ntes_localized,
                                      StringFromRatedData(str_eagerData) : StringFromRatedData(str_overtData).language,
                                      //: @"action" : @"onTouchExportLocalMessages:",
                                      StringFromRatedData(str_disableMathematicTitle) : StringFromRatedData(str_chemicalKickByData),
                                      //: },
                                      },
                                  //: @{
                                  @{
                                      //: @"title" : @"本地消息导入".ntes_localized,
                                      StringFromRatedData(str_eagerData) : StringFromRatedData(str_weekendMinimumValue).language,
                                      //: @"action" : @"onTouchImportLocalMessages:",
                                      StringFromRatedData(str_disableMathematicTitle) : StringFromRatedData(str_ratedScapeTitle),
                                      //: },
                                      },
                                  ]
                          }
                      //: ];
                      ];
    //: self.data = [NIMCommonTableSection sectionsWithData:data];
    self.data = [ImageSection max:data];
}

//: #pragma mark -- cellAction
#pragma mark -- cellAction
//: - (void)onTouchExportLocalMessages:(id)sender {
- (void)key:(id)sender {
    //: UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"确定导出本地消息？".ntes_localized message:@"本地消息将存至云端，会耗费较长时间".ntes_localized preferredStyle:UIAlertControllerStyleAlert];
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:StringFromRatedData(str_tropicPorkTitle).language message:StringFromRatedData(str_credibilityName).language preferredStyle:UIAlertControllerStyleAlert];

    // 返回
    //: UIAlertAction *actionCancel = [UIAlertAction actionWithTitle:@"返回".ntes_localized style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
    UIAlertAction *actionCancel = [UIAlertAction actionWithTitle:@"返回".language style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //: [alertController dismissViewControllerAnimated:YES completion:nil];
        [alertController dismissViewControllerAnimated:YES completion:nil];
    //: }];
    }];
    //: [alertController addAction:actionCancel];
    [alertController addAction:actionCancel];

    // 导出
    //: UIAlertAction *actionExport = [UIAlertAction actionWithTitle:@"继续导出".ntes_localized style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
    UIAlertAction *actionExport = [UIAlertAction actionWithTitle:StringFromRatedData(str_shouldBalanceText).language style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        //: NTESExportMessageViewController *exportController = [[NTESExportMessageViewController alloc] init];
        TradeColorMarkViewController *exportController = [[TradeColorMarkViewController alloc] init];
        //: UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:exportController];
        UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:exportController];
        //: [self presentViewController:navController animated:YES completion:nil];
        [self presentViewController:navController animated:YES completion:nil];
    //: }];
    }];
    //: [alertController addAction:actionExport];
    [alertController addAction:actionExport];

    //
    //: [self presentViewController:alertController animated:YES completion:nil];
    [self presentViewController:alertController animated:YES completion:nil];
}

//: - (void)onTouchImportLocalMessages:(id)sender {
- (void)enable:(id)sender {
    // check message
    //: [SVProgressHUD show];
    [SVProgressHUD show];

    //: [[NIMSDK sharedSDK].conversationManager fetchMigrateMessageInfo:^(NSError * _Nullable error, NSString * _Nullable remoteFilePath, NSString * _Nullable secureKey)
    [[NIMSDK sharedSDK].conversationManager fetchMigrateMessageInfo:^(NSError * _Nullable error, NSString * _Nullable remoteFilePath, NSString * _Nullable secureKey)
    {
        //: [SVProgressHUD dismiss];
        [SVProgressHUD dismiss];

        //: if (error) {
        if (error) {
            //: [self onGetRemoteHistoryFailed:@"发生了错误".ntes_localized];
            [self cranch:StringFromRatedData(str_cedeAttractName).language];
            //: return;
            return;
        }
        //: if (remoteFilePath.length == 0) {
        if (remoteFilePath.length == 0) {
            //: [self onGetRemoteHistoryFailed:@"未找到消息备份。请先在旧设备上导出消息记录".ntes_localized];
            [self cranch:StringFromRatedData(str_horseValue).language];
            //: return;
            return;
        }

        //: [self onGetHistorySuccessWithRemotePath:remoteFilePath secureKey:secureKey];
        [self info:remoteFilePath runaway:secureKey];
    //: }];
    }];
}

//: #pragma mark -- private
#pragma mark -- private
//: - (void)onGetHistorySuccessWithRemotePath:(NSString *)remotePath secureKey:(NSString *)secureKey {
- (void)info:(NSString *)remotePath runaway:(NSString *)secureKey {
    //: NTESImportMessageViewController *importController = [[NTESImportMessageViewController alloc] init];
    TingViewController *importController = [[TingViewController alloc] init];
    //: importController.remoteFilePath = remotePath;
    importController.remoteFilePath = remotePath;
    //: importController.secureKey = secureKey;
    importController.secureKey = secureKey;
    //: UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:importController];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:importController];
    //: [self presentViewController:navController animated:YES completion:nil];
    [self presentViewController:navController animated:YES completion:nil];
}

//: - (void)onGetRemoteHistoryFailed:(NSString *)errorDescription {
- (void)cranch:(NSString *)errorDescription {
    //: [self.view makeToast:errorDescription duration:3.0 position:CSToastPositionCenter];
    [self.view makeToast:errorDescription duration:3.0 position:CSToastPositionCenter];
}

//: @end
@end

Byte * RatedDataToCache(Byte *data) {
    int roundness = data[0];
    int pool = data[1];
    Byte jazzImprovement = data[2];
    int black = data[3];
    if (!roundness) return data + black;
    for (int i = black; i < black + pool; i++) {
        int value = data[i] + jazzImprovement;
        if (value > 255) {
            value -= 256;
        }
        data[i] = value;
    }
    data[0] = 0;
    data[black + pool] = 0;
    return data + black;
}

NSString *StringFromRatedData(Byte *data) {
    return [NSString stringWithUTF8String:(char *)RatedDataToCache(data)];
}
