
#import <Foundation/Foundation.h>

NSString *StringFromOrdinaryData(Byte *data);


//: aes256
Byte str_sculptLeasedData[] = {51, 6, 48, 12, 36, 131, 60, 38, 104, 63, 205, 115, 145, 149, 163, 98, 101, 102, 35};


//: 导出本地消息需要较长时间，请耐心等待
Byte str_lowPriseData[] = {45, 54, 8, 11, 60, 110, 251, 66, 87, 44, 42, 237, 183, 196, 237, 143, 194, 238, 164, 180, 237, 164, 184, 238, 190, 144, 238, 137, 183, 241, 164, 136, 240, 174, 137, 240, 198, 139, 241, 157, 199, 238, 159, 190, 241, 159, 188, 247, 196, 148, 240, 183, 191, 240, 136, 152, 237, 199, 139, 239, 181, 145, 237, 198, 141, 253};


//: 导出失败!
Byte str_hesitateName[] = {54, 13, 77, 9, 53, 15, 27, 204, 196, 50, 252, 9, 50, 212, 7, 50, 241, 254, 53, 1, 242, 110, 56};


//: 本地消息导出成功，请在新设备上点击导入吧
Byte str_onlyData[] = {4, 60, 10, 8, 36, 242, 2, 162, 240, 166, 182, 239, 166, 186, 240, 192, 146, 240, 139, 185, 239, 185, 198, 239, 145, 196, 240, 146, 154, 239, 148, 169, 249, 198, 150, 242, 185, 193, 239, 166, 178, 240, 160, 186, 242, 184, 200, 239, 174, 145, 238, 194, 148, 241, 140, 195, 239, 145, 197, 239, 185, 198, 239, 143, 175, 239, 154, 177, 140};


//: 继续导出
Byte str_biologicDoingData[] = {33, 12, 27, 11, 236, 211, 172, 100, 162, 29, 148, 2, 214, 194, 2, 214, 200, 0, 202, 215, 0, 162, 213, 240};


//: 重新导出
Byte str_excitementImmuneIconText[] = {20, 12, 57, 11, 142, 231, 161, 102, 105, 149, 22, 34, 192, 198, 31, 207, 233, 30, 232, 245, 30, 192, 243, 15};


//: 可导出的消息记录总数为空
Byte str_helpEveningData[] = {78, 36, 97, 7, 117, 190, 198, 70, 240, 16, 70, 16, 29, 70, 232, 27, 72, 251, 229, 71, 23, 233, 71, 226, 16, 73, 15, 17, 70, 30, 246, 71, 225, 28, 71, 246, 17, 69, 25, 27, 72, 10, 27, 219};


//: 恭喜你
Byte str_damValue[] = {44, 9, 21, 13, 126, 197, 92, 18, 83, 177, 181, 6, 121, 251, 150, 194, 250, 171, 177, 249, 210, 181, 136};


//: 确定要取消导出?
Byte str_slatRatedName[] = {73, 22, 17, 11, 60, 35, 187, 154, 190, 236, 120, 248, 178, 191, 246, 191, 171, 249, 183, 146, 246, 160, 167, 247, 199, 153, 246, 192, 205, 246, 152, 203, 80, 142};


//: 本地消息格式化导出失败
Byte str_shouldMaxName[] = {57, 33, 93, 6, 86, 146, 67, 249, 9, 66, 249, 13, 67, 19, 229, 67, 222, 12, 67, 253, 25, 66, 25, 236, 66, 233, 243, 66, 12, 25, 66, 228, 23, 66, 1, 14, 69, 17, 2, 198};


//: 本地消息导出
Byte str_insistValue[] = {18, 18, 90, 10, 159, 63, 162, 48, 200, 41, 64, 246, 6, 63, 246, 10, 64, 16, 226, 64, 219, 9, 63, 9, 22, 63, 225, 20, 141};


//: 取消导出
Byte str_developerData[] = {17, 12, 74, 4, 47, 217, 224, 48, 0, 210, 47, 249, 6, 47, 209, 4, 169};

// __DEBUG__
// __CLOSE_PRINT__
//
//  TradeColorMarkViewController.m
//  NIM
//
//  Created by Sampson on 2018/12/10.
//  Copyright © 2018 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import "NTESExportMessageViewController.h"
#import "TradeColorMarkViewController.h"
//: #import "NTESMigrateProgressView.h"
#import "MigrateView.h"
//: #import "NTESMigrateCompleteView.h"
#import "CutView.h"
//: #import "NSString+NTES.h"
#import "NSString+Status.h"
//: #import "NSData+NTES.h"
#import "NSData+Status.h"
//: #import "NTESExportMessageDelegateImpl.h"
#import "StateMode.h"
//: #import "SVProgressHUD.h"
#import "SVProgressHUD.h"
//: #import "UIView+Toast.h"
#import "UIView+Toast.h"

//: static NSString * const aesVectorString = @"0123456789012345";
static NSString * const k_requestData = @"0123456789012345";

//: @interface NTESExportMessageViewController ()
@interface TradeColorMarkViewController ()

//: @property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) UIView *contentView;
//: @property (nonatomic, weak) UIAlertController *curAlertController;
@property (nonatomic, weak) UIAlertController *curAlertController;
//: @property (nonatomic, copy) NSString *secureKey;
@property (nonatomic, copy) NSString *secureKey;

//: @end
@end

//: @implementation NTESExportMessageViewController
@implementation TradeColorMarkViewController

//: - (void)viewDidLoad {
- (void)viewDidLoad {
    //: [super viewDidLoad];
    [super viewDidLoad];

    //: self.title = @"本地消息导出".ntes_localized;
    self.title = StringFromOrdinaryData(str_insistValue).language;

    //: NTESMigrateProgressView *progressView = [[NTESMigrateProgressView alloc] initWithFrame:self.view.bounds];
    MigrateView *progressView = [[MigrateView alloc] initWithFrame:self.view.bounds];
    //: [progressView.stopButton addTarget:self action:@selector(onCancelButton:) forControlEvents:UIControlEventTouchUpInside];
    [progressView.stopButton addTarget:self action:@selector(signaling:) forControlEvents:UIControlEventTouchUpInside];
    //: progressView.tip = @"导出本地消息需要较长时间，请耐心等待".ntes_localized;
    progressView.tip = StringFromOrdinaryData(str_lowPriseData).language;
    //: self.contentView = progressView;
    self.contentView = progressView;

    //: [self exportMessageInfos];
    [self input];
}

//: - (void)viewDidLayoutSubviews {
- (void)viewDidLayoutSubviews {
    //: [super viewDidLayoutSubviews];
    [super viewDidLayoutSubviews];

    //: const CGRect bounds = self.view.bounds;
    const CGRect bounds = self.view.bounds;
    //: self.contentView.frame = bounds;
    self.contentView.frame = bounds;
}

//: - (void)setContentView:(UIView *)contentView {
- (void)setContentView:(UIView *)contentView {
    //: if (_contentView == contentView) {
    if (_contentView == contentView) {
        //: return;
        return;
    }
    //: if (contentView) {
    if (contentView) {
        //: [self.view addSubview:contentView];
        [self.view addSubview:contentView];
    }
    //: if (_contentView) {
    if (_contentView) {
        //: [_contentView removeFromSuperview];
        [_contentView removeFromSuperview];
    }
    //: _contentView = contentView;
    _contentView = contentView;
}

//: #pragma mark
#pragma mark
//: - (void)exportMessageInfos {
- (void)input {
    //: NTESExportMessageDelegateImpl *exportImpl = [[NTESExportMessageDelegateImpl alloc] init];
    StateMode *exportImpl = [[StateMode alloc] init];

    //: [[NIMSDK sharedSDK].conversationManager exportMeessageInfosWithDelegate:exportImpl
    [[NIMSDK sharedSDK].conversationManager exportMeessageInfosWithDelegate:exportImpl
                                                                   //: progress:^(float progress)
                                                                   progress:^(float progress)
    {
        //: if ([self.contentView isKindOfClass:[NTESMigrateProgressView class]]) {
        if ([self.contentView isKindOfClass:[MigrateView class]]) {
            //: NTESMigrateProgressView *progressView = (NTESMigrateProgressView *)self.contentView;
            MigrateView *progressView = (MigrateView *)self.contentView;
            //: progressView.progress = progress;
            progressView.progress = progress;
        }
    //: } completion:^(NSError * _Nullable error, NSString * _Nullable resultFilePath) {
    } completion:^(NSError * _Nullable error, NSString * _Nullable resultFilePath) {
        //: if (error || !resultFilePath) {
        if (error || !resultFilePath) {
            //: if (error.code == 1001) {
            if (error.code == 1001) {
                //: [self onExportEmpty:error];
                [self light:error];
            }
            //: else {
            else {
                //: [self onExportFailed:error];
                [self green:error];
            }
        }
        //: else {
        else {
            //: [self onExportSuccessAtPath:resultFilePath];
            [self will:resultFilePath];
        }
    //: }];
    }];
}

//: #pragma mark -- action
#pragma mark -- action
//: - (void)onCancelButton:(id)sender {
- (void)signaling:(id)sender {
    //: UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"确定要取消导出?".ntes_localized message:nil preferredStyle:UIAlertControllerStyleAlert];
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:StringFromOrdinaryData(str_slatRatedName).language message:nil preferredStyle:UIAlertControllerStyleAlert];

    // 取消导出
    //: UIAlertAction *actionCancel = [UIAlertAction actionWithTitle:@"取消导出".ntes_localized style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
    UIAlertAction *actionCancel = [UIAlertAction actionWithTitle:StringFromOrdinaryData(str_developerData).language style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //: [self dismissViewControllerAnimated:YES completion:nil];
        [self dismissViewControllerAnimated:YES completion:nil];
        //: [[NIMSDK sharedSDK].conversationManager cancelMigrateMessages];
        [[NIMSDK sharedSDK].conversationManager cancelMigrateMessages];
    //: }];
    }];
    //: [alertController addAction:actionCancel];
    [alertController addAction:actionCancel];

    // 继续导出
    //: UIAlertAction *actionGoon = [UIAlertAction actionWithTitle:@"继续导出".ntes_localized style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
    UIAlertAction *actionGoon = [UIAlertAction actionWithTitle:StringFromOrdinaryData(str_biologicDoingData).language style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //: [alertController dismissViewControllerAnimated:YES completion:nil];
        [alertController dismissViewControllerAnimated:YES completion:nil];

    //: }];
    }];
    //: [alertController addAction:actionGoon];
    [alertController addAction:actionGoon];

    //
    //: [self presentViewController:alertController animated:YES completion:nil];
    [self presentViewController:alertController animated:YES completion:nil];
    //: self.curAlertController = alertController;
    self.curAlertController = alertController;
}

//: - (void)onReturnButton:(id)sender {
- (void)doingButton:(id)sender {
    //: [self dismissViewControllerAnimated:YES completion:nil];
    [self dismissViewControllerAnimated:YES completion:nil];
}

//: #pragma mark -- private
#pragma mark -- private
//: - (void)onExportFailed:(NSError *)error {
- (void)green:(NSError *)error {
    //: UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"导出失败!".ntes_localized message:@"本地消息格式化导出失败".ntes_localized preferredStyle:UIAlertControllerStyleAlert];
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:StringFromOrdinaryData(str_hesitateName).language message:StringFromOrdinaryData(str_shouldMaxName).language preferredStyle:UIAlertControllerStyleAlert];

    // 返回
    //: UIAlertAction *actionBack = [UIAlertAction actionWithTitle:@"返回".ntes_localized style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
    UIAlertAction *actionBack = [UIAlertAction actionWithTitle:@"返回".language style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //: [self dismissViewControllerAnimated:YES completion:nil];
        [self dismissViewControllerAnimated:YES completion:nil];
    //: }];
    }];
    //: [alertController addAction:actionBack];
    [alertController addAction:actionBack];

    // 重新导出
    //: UIAlertAction *actionRetry = [UIAlertAction actionWithTitle:@"重新导出".ntes_localized style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
    UIAlertAction *actionRetry = [UIAlertAction actionWithTitle:StringFromOrdinaryData(str_excitementImmuneIconText).language style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //: [alertController dismissViewControllerAnimated:YES completion:nil];
        [alertController dismissViewControllerAnimated:YES completion:nil];
        //: [self exportMessageInfos];
        [self input];
    //: }];
    }];
    //: [alertController addAction:actionRetry];
    [alertController addAction:actionRetry];

    //
    //: [self presentViewController:alertController animated:YES completion:nil];
    [self presentViewController:alertController animated:YES completion:nil];
    //: self.curAlertController = alertController;
    self.curAlertController = alertController;
}

//: - (void)onExportSuccessAtPath:(NSString *)infoFilePath {
- (void)will:(NSString *)infoFilePath {
    //: [SVProgressHUD show];
    [SVProgressHUD show];

    // 对导出结果进行压缩，可以有效减少文件尺寸
    //: NSString *zipFilePath = [self zipMessageFileAtPath:infoFilePath];
    NSString *zipFilePath = [self inputImage:infoFilePath];
    //: if (!zipFilePath) {
    if (!zipFilePath) {
        //: [SVProgressHUD dismiss];
        [SVProgressHUD dismiss];
        //: return;
        return;
    }

    // 对导出结果进行加密，避免明文消息的泄露
    //: dispatch_async(dispatch_get_global_queue(0, 0), ^{
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        //: NSString *encryptedFilePath = [self encryptMessageDataAtPath:zipFilePath];
        NSString *encryptedFilePath = [self past:zipFilePath];
        //: dispatch_async(dispatch_get_main_queue(), ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            //: [self uploadMessageFileToServer:encryptedFilePath];
            [self request:encryptedFilePath];
        //: });
        });
    //: });
    });
}

//: - (void)onExportEmpty:(NSError *)error {
- (void)light:(NSError *)error {
    //: NSLog(@"error %@", error);
    //: NSString *errorDscription = @"可导出的消息记录总数为空".ntes_localized;
    NSString *errorDscription = StringFromOrdinaryData(str_helpEveningData).language;
    //: [self.view makeToast:errorDscription duration:3.0 position:CSToastPositionCenter];
    [self.view makeToast:errorDscription duration:3.0 position:CSToastPositionCenter];
}

//: - (void)onMigrateToRemoteFailed:(NSError *)error {
- (void)mark:(NSError *)error {
    //: [SVProgressHUD dismiss];
    [SVProgressHUD dismiss];

    //: [self onExportFailed:error];
    [self green:error];
}

//: - (void)onMigrateToRemoteSuccess {
- (void)length {
    //: [SVProgressHUD dismiss];
    [SVProgressHUD dismiss];

    //: NTESMigrateCompleteView *completeView = [[NTESMigrateCompleteView alloc] initWithFrame:self.view.bounds];
    CutView *completeView = [[CutView alloc] initWithFrame:self.view.bounds];
    //: completeView.title = @"恭喜你".ntes_localized;
    completeView.title = StringFromOrdinaryData(str_damValue).language;
    //: completeView.message = @"本地消息导出成功，请在新设备上点击导入吧".ntes_localized;
    completeView.message = StringFromOrdinaryData(str_onlyData).language;
    //: [completeView.actionButton setTitle:@"返回".ntes_localized forState:UIControlStateNormal];
    [completeView.actionButton setTitle:@"返回".language forState:UIControlStateNormal];
    //: [completeView.actionButton addTarget:self action:@selector(onReturnButton:) forControlEvents:UIControlEventTouchUpInside];
    [completeView.actionButton addTarget:self action:@selector(doingButton:) forControlEvents:UIControlEventTouchUpInside];
    //: self.contentView = completeView;
    self.contentView = completeView;
}

//: #pragma mark -- 压缩
#pragma mark -- 压缩
//: - (NSString *)zipMessageFileAtPath:(NSString *)infoFilePath {
- (NSString *)inputImage:(NSString *)infoFilePath {
    //: return nil;
    return nil;
}

//: #pragma mark -- 加密
#pragma mark -- 加密
//: - (NSString *)encryptMessageDataAtPath:(NSString *)path {
- (NSString *)past:(NSString *)path {
    //: NSData *data = [NSData dataWithContentsOfFile:path];
    NSData *data = [NSData dataWithContentsOfFile:path];
    //: NSString *aesKey = [NSString randomStringWithLength:32];
    NSString *aesKey = [NSString hideHitOrMiss:32];
    //: self.secureKey = aesKey;
    self.secureKey = aesKey;
    //: NSData *encryptedData = [data aes256EncryptWithKey:aesKey vector:aesVectorString];
    NSData *encryptedData = [data team:aesKey with:k_requestData];
    //: NSString *encrypedPath = [path stringByAppendingString:@"aes256"];
    NSString *encrypedPath = [path stringByAppendingString:StringFromOrdinaryData(str_sculptLeasedData)];
    //: [encryptedData writeToFile:encrypedPath atomically:YES];
    [encryptedData writeToFile:encrypedPath atomically:YES];

    // 移除中间文件
    //: dispatch_async(dispatch_get_main_queue(), ^{
    dispatch_async(dispatch_get_main_queue(), ^{
        //: [[NSFileManager defaultManager] removeItemAtPath:path error:nil];
        [[NSFileManager defaultManager] removeItemAtPath:path error:nil];
    //: });
    });

    //: return encrypedPath;
    return encrypedPath;
}

//: #pragma mark -- upload to server
#pragma mark -- upload to server
//: - (void)uploadMessageFileToServer:(NSString *)path {
- (void)request:(NSString *)path {
    //: [[NIMSDK sharedSDK].resourceManager upload:path
    [[NIMSDK sharedSDK].resourceManager upload:path
                                      //: progress:nil
                                      progress:nil
                                    //: completion:^(NSString * _Nullable urlString, NSError * _Nullable error)
                                    completion:^(NSString * _Nullable urlString, NSError * _Nullable error)
    {
        // 删除中间文件
        //: [[NSFileManager defaultManager] removeItemAtPath:path error:nil];
        [[NSFileManager defaultManager] removeItemAtPath:path error:nil];
        //: if (error || !urlString) {
        if (error || !urlString) {
            //: [self onMigrateToRemoteFailed:error];
            [self mark:error];
            //: return;
            return;
        }

        //: [self updateMigrateMessageInfoWithURL:urlString];
        [self enable:urlString];
    //: }];
    }];
}

//: - (void)updateMigrateMessageInfoWithURL:(NSString *)url {
- (void)enable:(NSString *)url {

    //: [[NIMSDK sharedSDK].conversationManager updateMigrateMessageInfoWithURL:url
    [[NIMSDK sharedSDK].conversationManager updateMigrateMessageInfoWithURL:url
                                                                        //: key:self.secureKey
                                                                        key:self.secureKey
                                                                 //: completion:^(NSError * _Nullable error)
                                                                 completion:^(NSError * _Nullable error)
    {
        //: [SVProgressHUD dismiss];
        [SVProgressHUD dismiss];

        //: if (error) {
        if (error) {
            //: [self onMigrateToRemoteFailed:error];
            [self mark:error];
        }
        //: else {
        else {
            //: [self onMigrateToRemoteSuccess];
            [self length];
        }
    //: }];
    }];
}

//: @end
@end

Byte * OrdinaryDataToCache(Byte *data) {
    int driving = data[0];
    int orationBackground = data[1];
    Byte plainOy = data[2];
    int combineSession = data[3];
    if (!driving) return data + combineSession;
    for (int i = combineSession; i < combineSession + orationBackground; i++) {
        int value = data[i] - plainOy;
        if (value < 0) {
            value += 256;
        }
        data[i] = value;
    }
    data[0] = 0;
    data[combineSession + orationBackground] = 0;
    return data + combineSession;
}

NSString *StringFromOrdinaryData(Byte *data) {
    return [NSString stringWithUTF8String:(char *)OrdinaryDataToCache(data)];
}
