
#import <Foundation/Foundation.h>

NSString *StringFromTingBalanceData(Byte *data);


//: 恭喜你
Byte str_immuneTitleData[] = {96, 9, 3, 160, 189, 228, 156, 150, 229, 173, 129, 230, 247};


//: zip
Byte str_poolScanSculptContent[] = {24, 3, 6, 254, 9, 60, 112, 105, 122, 221};


//: NIM
Byte str_modeAmbleName[] = {26, 3, 6, 45, 197, 74, 77, 73, 78, 242};


//: 下载消息文件失败
Byte str_keyThousandValue[] = {46, 24, 3, 165, 180, 232, 177, 164, 229, 182, 187, 228, 135, 150, 230, 175, 129, 230, 136, 182, 230, 189, 189, 232, 139, 184, 228, 14};


//: 本地消息导入
Byte str_orationPlainData[] = {94, 18, 7, 178, 176, 140, 198, 165, 133, 229, 188, 175, 229, 175, 129, 230, 136, 182, 230, 176, 156, 229, 172, 156, 230, 42};


//: 导入本地消息需要较长时间，请耐心等待
Byte str_missingQuitValue[] = {95, 54, 8, 169, 63, 250, 153, 139, 133, 190, 229, 137, 173, 231, 131, 191, 229, 144, 128, 232, 183, 175, 232, 140, 188, 239, 180, 151, 233, 182, 151, 230, 191, 149, 233, 131, 190, 232, 129, 166, 232, 128, 156, 233, 175, 129, 230, 136, 182, 230, 176, 156, 229, 172, 156, 230, 165, 133, 229, 188, 175, 229, 61};


//: 取消导入
Byte str_popularBurdenValue[] = {3, 12, 9, 172, 213, 114, 255, 240, 253, 165, 133, 229, 188, 175, 229, 136, 182, 230, 150, 143, 229, 183};


//: 确定要取消导入？
Byte str_activityTitle[] = {59, 24, 5, 189, 138, 159, 188, 239, 165, 133, 229, 188, 175, 229, 136, 182, 230, 150, 143, 229, 129, 166, 232, 154, 174, 229, 174, 161, 231, 34};


//: 继续导入
Byte str_interventionSpitLimbName[] = {23, 12, 8, 36, 34, 1, 14, 248, 165, 133, 229, 188, 175, 229, 173, 187, 231, 167, 187, 231, 173};


//: 导入失败！
Byte str_comingText[] = {66, 15, 3, 129, 188, 239, 165, 180, 232, 177, 164, 229, 165, 133, 229, 188, 175, 229, 182};


//: unzip
Byte str_hearingOftTitle[] = {11, 5, 9, 108, 126, 81, 9, 6, 210, 112, 105, 122, 110, 117, 223};


//: 解压失败
Byte str_workplaceName[] = {38, 12, 10, 165, 179, 224, 153, 138, 65, 45, 165, 180, 232, 177, 164, 229, 139, 142, 229, 163, 167, 232, 87};


//: 消息导入成功
Byte str_widowSharedInsectName[] = {52, 18, 5, 196, 183, 159, 138, 229, 144, 136, 230, 165, 133, 229, 188, 175, 229, 175, 129, 230, 136, 182, 230, 211};


//: 重新导入
Byte str_fishingRecentTitle[] = {30, 12, 13, 57, 120, 65, 165, 183, 192, 239, 179, 31, 11, 165, 133, 229, 188, 175, 229, 176, 150, 230, 141, 135, 233, 190};


//: 合并失败
Byte str_nameFessValue[] = {94, 12, 10, 113, 245, 190, 80, 69, 80, 58, 165, 180, 232, 177, 164, 229, 182, 185, 229, 136, 144, 229, 191};


//: 返回会话列表
Byte str_hareTitle[] = {86, 18, 4, 234, 168, 161, 232, 151, 136, 229, 157, 175, 232, 154, 188, 228, 158, 155, 229, 148, 191, 232, 88};


//: decryped
Byte str_insectWithName[] = {18, 8, 4, 81, 100, 101, 112, 121, 114, 99, 101, 100, 180};


//: iOS-zip-aes256
Byte str_backgroundAttractTitle[] = {76, 14, 5, 100, 214, 54, 53, 50, 115, 101, 97, 45, 112, 105, 122, 45, 83, 79, 105, 100};

// __DEBUG__
// __CLOSE_PRINT__
//
//  TingViewController.m
//  NIM
//
//  Created by Sampson on 2018/12/10.
//  Copyright © 2018 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import "NTESImportMessageViewController.h"
#import "TingViewController.h"
//: #import "NTESMigrateProgressView.h"
#import "MigrateView.h"
//: #import "NTESMigrateCompleteView.h"
#import "CutView.h"
//: #import "NSData+NTES.h"
#import "NSData+Status.h"
//: #import "NTESImportMessageDelegateImpl.h"
#import "HideImpl.h"
//: #import <SVProgressHUD/SVProgressHUD.h>
#import <SVProgressHUD/SVProgressHUD.h>
//: #import "NTESMainTabController.h"
#import "CutBarController.h"

//: static NSString * const aesVectorString = @"0123456789012345";
static NSString * const k_requestData = @"0123456789012345";

//: @interface NTESImportMessageViewController ()
@interface TingViewController ()

//: @property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) UIView *contentView;
//: @property (nonatomic, weak) UIAlertController *curAlertController;
@property (nonatomic, weak) UIAlertController *curAlertController;

//: @end
@end

//: @implementation NTESImportMessageViewController
@implementation TingViewController

//: - (void)viewDidLoad {
- (void)viewDidLoad {
    //: [super viewDidLoad];
    [super viewDidLoad];

    //: self.view.backgroundColor = [UIColor colorWithWhite:0.3 alpha:1];
    self.view.backgroundColor = [UIColor colorWithWhite:0.3 alpha:1];
    //: self.title = @"本地消息导入".ntes_localized;
    self.title = StringFromTingBalanceData(str_orationPlainData).language;

    //: NTESMigrateProgressView *progressView = [[NTESMigrateProgressView alloc] initWithFrame:self.view.bounds];
    MigrateView *progressView = [[MigrateView alloc] initWithFrame:self.view.bounds];
    //: [progressView.stopButton addTarget:self action:@selector(onCancelButton:) forControlEvents:UIControlEventTouchUpInside];
    [progressView.stopButton addTarget:self action:@selector(signaling:) forControlEvents:UIControlEventTouchUpInside];
    //: progressView.tip = @"导入本地消息需要较长时间，请耐心等待".ntes_localized;
    progressView.tip = StringFromTingBalanceData(str_missingQuitValue).language;
    //: self.contentView = progressView;
    self.contentView = progressView;

    //: [self downloadRemoteFile];
    [self threadRed];
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

//: #pragma mark -- action
#pragma mark -- action
//: - (void)onCancelButton:(id)sender {
- (void)signaling:(id)sender {
    //: UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"确定要取消导入？".ntes_localized message:nil preferredStyle:UIAlertControllerStyleAlert];
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:StringFromTingBalanceData(str_activityTitle).language message:nil preferredStyle:UIAlertControllerStyleAlert];

    // 取消导入
    //: UIAlertAction *actionCancel = [UIAlertAction actionWithTitle:@"取消导入".ntes_localized style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
    UIAlertAction *actionCancel = [UIAlertAction actionWithTitle:StringFromTingBalanceData(str_popularBurdenValue).language style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //: [self dismissViewControllerAnimated:YES completion:nil];
        [self dismissViewControllerAnimated:YES completion:nil];
        //: [[NIMSDK sharedSDK].conversationManager cancelMigrateMessages];
        [[NIMSDK sharedSDK].conversationManager cancelMigrateMessages];
    //: }];
    }];
    //: [alertController addAction:actionCancel];
    [alertController addAction:actionCancel];

    // 继续导入
    //: UIAlertAction *actionGoon = [UIAlertAction actionWithTitle:@"继续导入".ntes_localized style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
    UIAlertAction *actionGoon = [UIAlertAction actionWithTitle:StringFromTingBalanceData(str_interventionSpitLimbName).language style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
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

    // 返回到会话页
    //: NTESMainTabController *tabController = [NTESMainTabController instance];
    CutBarController *tabController = [CutBarController textInstance];
    //: UIViewController *selectedVC = tabController.selectedViewController;
    UIViewController *selectedVC = tabController.selectedViewController;
    //: if ([selectedVC isKindOfClass:[UINavigationController class]]) {
    if ([selectedVC isKindOfClass:[UINavigationController class]]) {
        //: [((UINavigationController *)selectedVC) popToRootViewControllerAnimated:NO];
        [((UINavigationController *)selectedVC) popToRootViewControllerAnimated:NO];
    }
    //: tabController.selectedIndex = 0;
    tabController.selectedIndex = 0;
}

//: #pragma mark -- private
#pragma mark -- private
//: - (void)onImportFailed:(NSError *)error description:(NSString *)description {
- (void)fileDescription:(NSError *)error name:(NSString *)description {
    //: UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"导入失败！".ntes_localized message:description preferredStyle:UIAlertControllerStyleAlert];
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:StringFromTingBalanceData(str_comingText).language message:description preferredStyle:UIAlertControllerStyleAlert];

    // 返回
    //: UIAlertAction *actionReturn = [UIAlertAction actionWithTitle:@"返回".ntes_localized style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
    UIAlertAction *actionReturn = [UIAlertAction actionWithTitle:@"返回".language style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //: [self dismissViewControllerAnimated:YES completion:nil];
        [self dismissViewControllerAnimated:YES completion:nil];
        // todo 导航
    //: }];
    }];
    //: [alertController addAction:actionReturn];
    [alertController addAction:actionReturn];

    // 重新导入
    //: UIAlertAction *actionRetry = [UIAlertAction actionWithTitle:@"重新导入".ntes_localized style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
    UIAlertAction *actionRetry = [UIAlertAction actionWithTitle:StringFromTingBalanceData(str_fishingRecentTitle).language style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //: [alertController dismissViewControllerAnimated:YES completion:nil];
        [alertController dismissViewControllerAnimated:YES completion:nil];
        //: [self downloadRemoteFile];
        [self threadRed];
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

//: - (void)onImportSuccess {
- (void)along {
    //: NTESMigrateCompleteView *completeView = [[NTESMigrateCompleteView alloc] initWithFrame:self.view.bounds];
    CutView *completeView = [[CutView alloc] initWithFrame:self.view.bounds];
    //: completeView.title = @"恭喜你".ntes_localized;
    completeView.title = StringFromTingBalanceData(str_immuneTitleData).language;
    //: completeView.message = @"消息导入成功".ntes_localized;
    completeView.message = StringFromTingBalanceData(str_widowSharedInsectName).language;
    //: [completeView.actionButton setTitle:@"返回会话列表".ntes_localized forState:UIControlStateNormal];
    [completeView.actionButton setTitle:StringFromTingBalanceData(str_hareTitle).language forState:UIControlStateNormal];
    //: [completeView.actionButton addTarget:self action:@selector(onReturnButton:) forControlEvents:UIControlEventTouchUpInside];
    [completeView.actionButton addTarget:self action:@selector(doingButton:) forControlEvents:UIControlEventTouchUpInside];
    //: self.contentView = completeView;
    self.contentView = completeView;
}

//: #pragma mark --
#pragma mark --
//: - (void)downloadRemoteFile {
- (void)threadRed {
    //: [self removeTempFiles];
    [self size];
    //: NSString *aesFilePath = [self aesFilePath];
    NSString *aesFilePath = [self shouldFor];
    //: [[NIMSDK sharedSDK].resourceManager download:self.remoteFilePath
    [[NIMSDK sharedSDK].resourceManager download:self.remoteFilePath
                                        //: filepath:aesFilePath
                                        filepath:aesFilePath
                                        //: progress:nil
                                        progress:nil
                                      //: completion:^(NSError * _Nullable error)
                                      completion:^(NSError * _Nullable error)
     {
         //: if (error) {
         if (error) {
             //: [self onImportFailed:error description:@"下载消息文件失败".ntes_localized];
             [self fileDescription:error name:StringFromTingBalanceData(str_keyThousandValue).language];
             //: return;
             return;
         }

         //: NSString *decrypedPath = self.secureKey ? [self decryptMeessageFileAtPath:aesFilePath] : aesFilePath;
         NSString *decrypedPath = self.secureKey ? [self year:aesFilePath] : aesFilePath;
         //: dispatch_async(dispatch_get_main_queue(), ^{
         dispatch_async(dispatch_get_main_queue(), ^{
             //: NSString *unzipPath = [self unzipMessageFileAtPath:decrypedPath];
             NSString *unzipPath = [self disableQueryed:decrypedPath];
             //: [self importMessageFileAtPath:unzipPath];
             [self originDataMonth:unzipPath];

             // 删除中间文件
             //: [[NSFileManager defaultManager] removeItemAtPath:aesFilePath error:nil];
             [[NSFileManager defaultManager] removeItemAtPath:aesFilePath error:nil];
         //: });
         });
     //: }];
     }];
}

// 如果上传时候有加密，需要先解密
//: - (NSString *)decryptMeessageFileAtPath:(NSString *)path {
- (NSString *)year:(NSString *)path {
    //: @autoreleasepool {
    @autoreleasepool {
        //: NSData *data = [NSData dataWithContentsOfFile:path];
        NSData *data = [NSData dataWithContentsOfFile:path];
        //: NSString *aesKey = self.secureKey;
        NSString *aesKey = self.secureKey;
        //: NSData *decryptedData = [data aes256DecryptWithKey:aesKey vector:aesVectorString];
        NSData *decryptedData = [data nutsAndBoltsShow:aesKey contentKey:k_requestData];
        //: NSString *directory = [path stringByDeletingPathExtension];
        NSString *directory = [path stringByDeletingPathExtension];
        //: directory = [directory stringByDeletingLastPathComponent];
        directory = [directory stringByDeletingLastPathComponent];
        //: NSString *decryptedPath = [directory stringByAppendingPathComponent:@"decryped"];
        NSString *decryptedPath = [directory stringByAppendingPathComponent:StringFromTingBalanceData(str_insectWithName)];
        //: decryptedPath = [decryptedPath stringByAppendingPathExtension:@"zip"];
        decryptedPath = [decryptedPath stringByAppendingPathExtension:StringFromTingBalanceData(str_poolScanSculptContent)];
        //: if ([[NSFileManager defaultManager] fileExistsAtPath:decryptedPath]) {
        if ([[NSFileManager defaultManager] fileExistsAtPath:decryptedPath]) {
            //: [[NSFileManager defaultManager] removeItemAtPath:decryptedPath error:nil];
            [[NSFileManager defaultManager] removeItemAtPath:decryptedPath error:nil];
        }
        //: [decryptedData writeToFile:decryptedPath atomically:YES];
        [decryptedData writeToFile:decryptedPath atomically:YES];
        //: return decryptedPath;
        return decryptedPath;
    }
}

// 如果上传时候有压缩，解密完了之后要解压缩
//: - (NSString *)unzipMessageFileAtPath:(NSString *)path {
- (NSString *)disableQueryed:(NSString *)path {
    //: NSString *dstPath = [path stringByDeletingPathExtension];
    NSString *dstPath = [path stringByDeletingPathExtension];
    //: dstPath = [dstPath stringByAppendingString:@"unzip"];
    dstPath = [dstPath stringByAppendingString:StringFromTingBalanceData(str_hearingOftTitle)];

    //
    //: NSString *unzipPath = nil;
    NSString *unzipPath = nil;
    //: BOOL directory = NO;
    BOOL directory = NO;
    //: if ([[NSFileManager defaultManager] fileExistsAtPath:dstPath isDirectory:&directory]) {
    if ([[NSFileManager defaultManager] fileExistsAtPath:dstPath isDirectory:&directory]) {
        //: if (directory) {
        if (directory) {
            //: NSArray *files = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:dstPath error:nil];
            NSArray *files = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:dstPath error:nil];
            //: unzipPath = files.count > 0 ? files[0] : nil;
            unzipPath = files.count > 0 ? files[0] : nil;
            //: unzipPath = [dstPath stringByAppendingPathComponent:unzipPath];
            unzipPath = [dstPath stringByAppendingPathComponent:unzipPath];
        }
        //: else {
        else {
            //: unzipPath = dstPath;
            unzipPath = dstPath;
        }
    }

    // 删掉中间文件
    //: dispatch_async(dispatch_get_main_queue(), ^{
    dispatch_async(dispatch_get_main_queue(), ^{
        //: [[NSFileManager defaultManager] removeItemAtPath:path error:nil];
        [[NSFileManager defaultManager] removeItemAtPath:path error:nil];
    //: });
    });

    //: return unzipPath;
    return unzipPath;
}

//: - (void)importMessageFileAtPath:(NSString *)path {
- (void)originDataMonth:(NSString *)path {
    //: if (!path) {
    if (!path) {
        //: [self onImportFailed:nil description:@"解压失败".ntes_localized];
        [self fileDescription:nil name:StringFromTingBalanceData(str_workplaceName).language];
        //: return;
        return;
    }

    // 用户自定义的导入过滤器，对于 custom 消息，需要用户自己处理
    //: NTESImportMessageDelegateImpl *importImpl = [[NTESImportMessageDelegateImpl alloc] init];
    HideImpl *importImpl = [[HideImpl alloc] init];

    //: [[NIMSDK sharedSDK].conversationManager importMessageInfosAtPath:path
    [[NIMSDK sharedSDK].conversationManager importMessageInfosAtPath:path
                                                            //: delegate:importImpl
                                                            delegate:importImpl
                                                            //: progress:^(float progress)
                                                            progress:^(float progress)
    {
        //NSLog(@"import progress %f", progress);
        //: NTESMigrateProgressView *progressView = (NTESMigrateProgressView *)self.contentView;
        MigrateView *progressView = (MigrateView *)self.contentView;
        //: if ([progressView isKindOfClass:[NTESMigrateProgressView class]]) {
        if ([progressView isKindOfClass:[MigrateView class]]) {
            //: progressView.progress = progress;
            progressView.progress = progress;
        }
    //: } completion:^(NSError * _Nullable error) {
    } completion:^(NSError * _Nullable error) {
        //: if (error) {
        if (error) {
            //: [self onImportFailed:error description:@"合并失败".ntes_localized];
            [self fileDescription:error name:StringFromTingBalanceData(str_nameFessValue).language];
        }
        //: else {
        else {
            //: [self onImportSuccess];
            [self along];
        }
    //: }];
    }];
}

//: #pragma mark -- temp
#pragma mark -- temp
//: - (NSString *)aesFilePath {
- (NSString *)shouldFor {
    //: NSString *ret = [NSTemporaryDirectory() stringByAppendingPathComponent:@"NIM"];
    NSString *ret = [NSTemporaryDirectory() stringByAppendingPathComponent:StringFromTingBalanceData(str_modeAmbleName)];
    //: ret = [ret stringByAppendingPathComponent:@"iOS-zip-aes256"];
    ret = [ret stringByAppendingPathComponent:StringFromTingBalanceData(str_backgroundAttractTitle)];
    //: return ret;
    return ret;
}

//: - (void)removeTempFiles {
- (void)size {
    //: NSFileManager *fileManager = [NSFileManager defaultManager];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    //: [fileManager removeItemAtPath:[self aesFilePath] error:nil];
    [fileManager removeItemAtPath:[self shouldFor] error:nil];
}

//: @end
@end

Byte * TingBalanceDataToCache(Byte *data) {
    int relatePowder = data[0];
    int sessionImprovement = data[1];
    int immuneJuror = data[2];
    if (!relatePowder) return data + immuneJuror;
    for (int i = 0; i < sessionImprovement / 2; i++) {
        int begin = immuneJuror + i;
        int end = immuneJuror + sessionImprovement - i - 1;
        Byte temp = data[begin];
        data[begin] = data[end];
        data[end] = temp;
    }
    data[0] = 0;
    data[immuneJuror + sessionImprovement] = 0;
    return data + immuneJuror;
}

NSString *StringFromTingBalanceData(Byte *data) {
    return [NSString stringWithUTF8String:(char *)TingBalanceDataToCache(data)];
}  
