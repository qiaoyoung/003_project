
#import <Foundation/Foundation.h>

NSString *StringFromAttractiveData(Byte *data);        


//: 邀请你加入讨论组
Byte str_sizeFrameValue[] = {22, 24, 83, 13, 47, 124, 148, 112, 17, 104, 191, 126, 168, 150, 47, 45, 149, 92, 100, 145, 106, 77, 146, 55, 77, 146, 50, 82, 149, 91, 85, 149, 91, 103, 148, 104, 49, 100};


//: postscript
Byte str_slatTownData[] = {36, 10, 69, 6, 44, 56, 43, 42, 46, 47, 46, 30, 45, 36, 43, 47, 238};


//: 邀请你加入超大群
Byte str_artisticPowderTitle[] = {75, 24, 57, 7, 46, 163, 99, 176, 73, 71, 175, 118, 126, 171, 132, 103, 172, 81, 103, 172, 76, 108, 175, 125, 76, 172, 107, 110, 174, 133, 107, 32};


//: jpg
Byte str_youthContent[] = {57, 3, 75, 5, 43, 31, 37, 28, 11};


//: 邀请你加入高级群
Byte str_correlationCenterText[] = {65, 24, 9, 8, 245, 51, 196, 180, 224, 121, 119, 223, 166, 174, 219, 180, 151, 220, 129, 151, 220, 124, 156, 224, 162, 143, 222, 177, 158, 222, 181, 155, 127};


//: attach
Byte str_eyeName[] = {2, 6, 58, 4, 39, 58, 58, 39, 41, 46, 163};


//: 扩展消息
Byte str_showSuspectData[] = {18, 12, 23, 9, 93, 74, 236, 96, 116, 207, 114, 146, 206, 154, 126, 207, 159, 113, 207, 106, 152, 198};


//: group_info_activity_update_failed
Byte str_textPointTitle[] = {84, 33, 13, 13, 214, 72, 28, 145, 146, 173, 74, 139, 237, 90, 101, 98, 104, 99, 82, 92, 97, 89, 98, 82, 84, 86, 103, 92, 105, 92, 103, 108, 82, 104, 99, 87, 84, 103, 88, 82, 89, 84, 92, 95, 88, 87, 166};

// __DEBUG__
// __CLOSE_PRINT__
//
//  MessageTopViewController.m
// Indicator
//
//  Created by Genning-Work on 2019/12/12.
//  Copyright © 2019 NetEase. All rights reserved.
//

// __M_A_C_R_O__
//: #import "BBBTeamCardOperationViewController.h"
#import "MessageTopViewController.h"
//: #import "CCCKitProgressHUD.h"
#import "KitDisableView.h"
//: #import "UserKitDependency.h"
#import "UserKitDependency.h"
//: #import "UIImage+AppleProjectKit.h"
#import "UIImage+Indicator.h"
//: #import "NSString+AppleProjectKit.h"
#import "NSString+Indicator.h"

//: @implementation BBBTeamCardOperationViewController
@implementation MessageTopViewController

//: - (void)dealloc {
- (void)dealloc {
    //: [[NSNotificationCenter defaultCenter] removeObserver:self];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

//: - (instancetype)initWithTeam:(NIMTeam *)team
- (instancetype)initWithMax:(NIMTeam *)team
                     //: session:(NIMSession *)session
                     length:(NIMSession *)session
                      //: option:(BBBTeamCardViewControllerOption *)option {
                      teamRecording:(ViewOption *)option {
    //: if (self = [super init]) {
    if (self = [super init]) {
        //: _option = option;
        _option = option;
        //: _teamListManager = [[BBBTeamListDataManager alloc] initWithTeam:team session:session];
        _teamListManager = [[ListHideState alloc] initWithSecret:team iconInfo_strong:session];
        //: [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(teamInfoUpdate:) name:kNIMTeamListDataTeamInfoUpdate object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(fullMoon:) name:k_styleText object:nil];
        //: [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(teamMemberUpdate:) name:kNIMTeamListDataTeamMembersChanged object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(commentsed:) name:k_showName object:nil];
    }
    //: return self;
    return self;
}

//: - (void)viewDidLoad {
- (void)viewDidLoad {
    //: [super viewDidLoad];
    [super viewDidLoad];
    //: BBBMembersFetchOption *option = [[BBBMembersFetchOption alloc] init];
    TypicalOption *option = [[TypicalOption alloc] init];
    //: option.isRefresh = YES;
    option.isRefresh = YES;
    //: option.offset = 0;
    option.offset = 0;
    //: option.count = (10);
    option.count = (10);
    //: [self didFetchTeamMember:option];
    [self clean:option];
}

//: - (void)reloadData {
- (void)timeText {
    //: [self reloadTableHeaderData];
    [self press];
    //: [self reloadTableViewData];
    [self nameLight];
    //: [self reloadOtherData];
    [self downData];
}

//: - (void)didFetchTeamMember:(BBBMembersFetchOption *)option {
- (void)clean:(TypicalOption *)option {
    //: __weak typeof(self) wself = self;
    __weak typeof(self) wself = self;
    //: [CCCKitProgressHUD show];
    [KitDisableView grade];
    //: [self.teamListManager fetchTeamMembersWithOption:option
    [self.teamListManager mark:option
                                          //: completion:^(NSError * _Nullable error, NSString * _Nullable msg) {
                                          schemeOf:^(NSError * _Nullable error, NSString * _Nullable msg) {
        //: [CCCKitProgressHUD dismiss];
        [KitDisableView input];
        //: if (!error) {
        if (!error) {
            //: [wself reloadData];
            [wself timeText];
        }
        //: [wself showToastMsg:msg];
        [wself blueMsg:msg];
    //: }];
    }];
}

//: - (void)didInviteUsers:(NSArray<NSString *> *)userIds
- (void)toTapWith:(NSArray<NSString *> *)userIds
            //: completion:(dispatch_block_t)completion {
            link:(dispatch_block_t)completion {

    //: if (userIds.count == 0) {
    if (userIds.count == 0) {
        //: return;
        return;
    }

    //: NSMutableDictionary *info = [NSMutableDictionary dictionary];
    NSMutableDictionary *info = [NSMutableDictionary dictionary];
    //: info[@"attach"] = @"扩展消息";
    info[StringFromAttractiveData(str_eyeName)] = StringFromAttractiveData(str_showSuspectData);
    //: switch (_teamListManager.team.type) {
    switch (_teamListManager.team.type) {
        //: case NIMTeamTypeNormal:
        case NIMTeamTypeNormal:
            //: info[@"postscript"] = @"邀请你加入讨论组".nim_localized;
            info[StringFromAttractiveData(str_slatTownData)] = StringFromAttractiveData(str_sizeFrameValue).trapLocalized;
            //: break;
            break;
        //: case NIMTeamTypeAdvanced:
        case NIMTeamTypeAdvanced:
            //: info[@"postscript"] = @"邀请你加入高级群".nim_localized;
            info[StringFromAttractiveData(str_slatTownData)] = StringFromAttractiveData(str_correlationCenterText).trapLocalized;
            //: break;
            break;
        //: case NIMTeamTypeSuper:
        case NIMTeamTypeSuper:
            //: info[@"postscript"] = @"邀请你加入超大群".nim_localized;
            info[StringFromAttractiveData(str_slatTownData)] = StringFromAttractiveData(str_artisticPowderTitle).trapLocalized;
            //: break;
            break;
        //: default:
        default:
            //: break;
            break;
    }
    //: __weak typeof(self) wself = self;
    __weak typeof(self) wself = self;
    //: [CCCKitProgressHUD show];
    [KitDisableView grade];
    //: [self.teamListManager addUsers:userIds info:info completion:^(NSError * _Nonnull error, NSString * _Nonnull msg) {
    [self.teamListManager completion:userIds beforeSearched:info top:^(NSError * _Nonnull error, NSString * _Nonnull msg) {
        //: [CCCKitProgressHUD dismiss];
        [KitDisableView input];
        //: if (!error) {
        if (!error) {
            //: [wself reloadTableHeaderData];
            [wself press];
        }
        //: [wself showToastMsg:msg];
        [wself blueMsg:msg];
        //: if (completion) {
        if (completion) {
            //: completion();
            completion();
        }
    //: }];
    }];
}

//: - (void)didKickUser:(NSString *)userId {
- (void)device:(NSString *)userId {
    //: __weak typeof(self) wself = self;
    __weak typeof(self) wself = self;
    //: [CCCKitProgressHUD show];
    [KitDisableView grade];
    //: [self.teamListManager kickUsers:@[userId] completion:^(NSError * _Nonnull error, NSString * _Nonnull msg) {
    [self.teamListManager say:@[userId] messageSearch:^(NSError * _Nonnull error, NSString * _Nonnull msg) {
        //: [CCCKitProgressHUD dismiss];
        [KitDisableView input];
        //: if (!error) {
        if (!error) {
            //: [wself reloadTableHeaderData];
            [wself press];
        }
        //: [wself showToastMsg:msg];
        [wself blueMsg:msg];
    //: }];
    }];
}

//: - (void)didUpdateTeamName:(NSString *)name {
- (void)title:(NSString *)name {
    //: if (!name) {
    if (!name) {
        //: return;
        return;
    }
    //: __weak typeof(self) wself = self;
    __weak typeof(self) wself = self;
    //: [CCCKitProgressHUD show];
    [KitDisableView grade];
    //: [self.teamListManager updateTeamName:name
    [self.teamListManager frame:name
                              //: completion:^(NSError * _Nonnull error, NSString * _Nonnull msg) {
                              streetSmartDataBlock:^(NSError * _Nonnull error, NSString * _Nonnull msg) {
        //: [CCCKitProgressHUD dismiss];
        [KitDisableView input];
        //: if (!error) {
        if (!error) {
            //: [wself reloadData];
            [wself timeText];
        }
        //: [wself showToastMsg:msg];
        [wself blueMsg:msg];
    //: }];
    }];
}

//: - (void)didUpdateTeamNick:(NSString *)nick{
- (void)restoreQueryNick:(NSString *)nick{
    //: if (!nick) {
    if (!nick) {
        //: return;
        return;
    }
    //: __weak typeof(self) weakSelf = self;
    __weak typeof(self) weakSelf = self;
    //: [CCCKitProgressHUD show];
    [KitDisableView grade];
    //: [self.teamListManager updateTeamNick:nick
    [self.teamListManager option:nick
                              //: completion:^(NSError * _Nonnull error, NSString * _Nonnull msg) {
                              barCompletion:^(NSError * _Nonnull error, NSString * _Nonnull msg) {
        //: [CCCKitProgressHUD dismiss];
        [KitDisableView input];
        //: if (!error) {
        if (!error) {
            //: [weakSelf reloadData];
            [weakSelf timeText];
        }
        //: [weakSelf showToastMsg:msg];
        [weakSelf blueMsg:msg];
    //: }];
    }];
}

//: - (void)didUpdateTeamIntro:(NSString *)intro{
- (void)month:(NSString *)intro{
    //: if (!intro) {
    if (!intro) {
        //: return;
        return;
    }
    //: __weak typeof(self) weakSelf = self;
    __weak typeof(self) weakSelf = self;
    //: [CCCKitProgressHUD show];
    [KitDisableView grade];
    //: [self.teamListManager updateTeamIntro:intro completion:^(NSError * _Nonnull error, NSString * _Nonnull msg) {
    [self.teamListManager immobilize:intro refreshSharedTeamQuantityro:^(NSError * _Nonnull error, NSString * _Nonnull msg) {
        //: [CCCKitProgressHUD dismiss];
        [KitDisableView input];
        //: if (!error) {
        if (!error) {
            //: [weakSelf reloadData];
            [weakSelf timeText];
        }
        //: [weakSelf showToastMsg:msg];
        [weakSelf blueMsg:msg];
    //: }];
    }];
}

//: - (void)didUpdateTeamMute:(BOOL)mute {
- (void)label:(BOOL)mute {
    //: __weak typeof(self) weakSelf = self;
    __weak typeof(self) weakSelf = self;
    //: [CCCKitProgressHUD show];
    [KitDisableView grade];
    //: [self.teamListManager updateTeamMute:mute
    [self.teamListManager readFlush:mute
                              //: completion:^(NSError * _Nullable error, NSString * _Nullable msg) {
                              greenItem:^(NSError * _Nullable error, NSString * _Nullable msg) {
        //: [CCCKitProgressHUD dismiss];
        [KitDisableView input];
        //: if (!error) {
        if (!error) {
            //: [weakSelf reloadData];
            [weakSelf timeText];
        }
        //: [weakSelf showToastMsg:msg];
        [weakSelf blueMsg:msg];
    //: }];
    }];
}

//: - (void)didUpdateTeamAvatarWithType:(UIImagePickerControllerSourceType)type {
- (void)modify:(UIImagePickerControllerSourceType)type {
    //: __weak typeof(self) weakSelf = self;
    __weak typeof(self) weakSelf = self;
    //: [self showImagePicker:type completion:^(UIImage * _Nonnull image) {
    [self media:type device:^(UIImage * _Nonnull image) {
        //: [weakSelf uploadImage:image];
        [weakSelf uploadRefer:image];
    //: }];
    }];
}

//: - (void)didupdateTeamJoinMode:(NIMTeamJoinMode)mode {
- (void)descriptionCustom:(NIMTeamJoinMode)mode {
    //: __weak typeof(self) weakSelf = self;
    __weak typeof(self) weakSelf = self;
    //: [CCCKitProgressHUD show];
    [KitDisableView grade];
    //: [self.teamListManager updateTeamJoinMode:mode completion:^(NSError * _Nonnull error, NSString * _Nonnull msg) {
    [self.teamListManager date:mode image:^(NSError * _Nonnull error, NSString * _Nonnull msg) {
        //: [CCCKitProgressHUD dismiss];
        [KitDisableView input];
        //: if (!error) {
        if (!error) {
            //: [weakSelf reloadData];
            [weakSelf timeText];
        }
        //: [weakSelf showToastMsg:msg];
        [weakSelf blueMsg:msg];
    //: }];
    }];
}

//: - (void)didUpdateTeamInviteMode:(NIMTeamInviteMode)mode {
- (void)pin:(NIMTeamInviteMode)mode {
    //: __weak typeof(self) weakSelf = self;
    __weak typeof(self) weakSelf = self;
    //: [CCCKitProgressHUD show];
    [KitDisableView grade];
    //: [self.teamListManager updateTeamInviteMode:mode completion:^(NSError * _Nonnull error, NSString * _Nonnull msg) {
    [self.teamListManager commentSize:mode session:^(NSError * _Nonnull error, NSString * _Nonnull msg) {
        //: [CCCKitProgressHUD dismiss];
        [KitDisableView input];
        //: if (!error) {
        if (!error) {
            //: [weakSelf reloadData];
            [weakSelf timeText];
        }
        //: [weakSelf showToastMsg:msg];
        [weakSelf blueMsg:msg];
    //: }];
    }];
}

//: - (void)didUpdateTeamBeInviteMode:(NIMTeamBeInviteMode)mode {
- (void)empty:(NIMTeamBeInviteMode)mode {
    //: __weak typeof(self) weakSelf = self;
    __weak typeof(self) weakSelf = self;
    //: [CCCKitProgressHUD show];
    [KitDisableView grade];
    //: [self.teamListManager updateTeamBeInviteMode:mode
    [self.teamListManager version:mode
                                      //: completion:^(NSError * _Nonnull error, NSString * _Nonnull msg) {
                                      buttonWeShould:^(NSError * _Nonnull error, NSString * _Nonnull msg) {
        //: [CCCKitProgressHUD dismiss];
        [KitDisableView input];
        //: if (!error) {
        if (!error) {
            //: [weakSelf reloadData];
            [weakSelf timeText];
        }
        //: [weakSelf showToastMsg:msg];
        [weakSelf blueMsg:msg];
    //: }];
    }];
}

//: - (void)didUpdateTeamInfoMode:(NIMTeamUpdateInfoMode)mode {
- (void)doShould:(NIMTeamUpdateInfoMode)mode {
    //: __weak typeof(self) weakSelf = self;
    __weak typeof(self) weakSelf = self;
    //: [CCCKitProgressHUD show];
    [KitDisableView grade];
    //: [self.teamListManager updateTeamInfoMode:mode completion:^(NSError * _Nonnull error, NSString * _Nonnull msg) {
    [self.teamListManager mode:mode info:^(NSError * _Nonnull error, NSString * _Nonnull msg) {
        //: [CCCKitProgressHUD dismiss];
        [KitDisableView input];
        //: if (!error) {
        if (!error) {
            //: [weakSelf reloadData];
            [weakSelf timeText];
        }
        //: [weakSelf showToastMsg:msg];
        [weakSelf blueMsg:msg];
    //: }];
    }];
}

//: - (void)didUpdateNotifiyState:(NIMTeamNotifyState)state {
- (void)myState:(NIMTeamNotifyState)state {
    //: __weak typeof(self) weakSelf = self;
    __weak typeof(self) weakSelf = self;
    //: [CCCKitProgressHUD show];
    [KitDisableView grade];
    //: [self.teamListManager updateTeamNotifyState:state completion:^(NSError * _Nonnull error, NSString * _Nonnull msg) {
    [self.teamListManager alongBy:state empty:^(NSError * _Nonnull error, NSString * _Nonnull msg) {
        //: [CCCKitProgressHUD dismiss];
        [KitDisableView input];
        //: if (!error) {
        if (!error) {
            //: [weakSelf reloadTableViewData];
            [weakSelf nameLight];
        }
        //: [weakSelf showToastMsg:msg];
        [weakSelf blueMsg:msg];
    //: }];
    }];
}

//: - (void)didOntransferToUser:(NSString *)userId leave:(BOOL)leave {
- (void)session:(NSString *)userId crush:(BOOL)leave {
    //: [CCCKitProgressHUD show];
    [KitDisableView grade];
    //: [self.teamListManager transferOwnerWithUserId:userId
    [self.teamListManager team:userId
                                         //: leave:leave
                                         handleCompletion:leave
                                    //: completion:^(NSError * _Nonnull error, NSString * _Nonnull msg) {
                                    image:^(NSError * _Nonnull error, NSString * _Nonnull msg) {
        //: [CCCKitProgressHUD dismiss];
        [KitDisableView input];
        //: if (leave) {
        if (leave) {
            //: [self.navigationController popToRootViewControllerAnimated:YES];
            [self.navigationController popToRootViewControllerAnimated:YES];
        //: }else{
        }else{
            //: [self reloadData];
            [self timeText];
        }
        //: [self showToastMsg:msg];
        [self blueMsg:msg];
    //: }];
    }];
}

//: - (void)didDismissTeam{
- (void)success{
    //: __weak typeof(self) weakSelf = self;
    __weak typeof(self) weakSelf = self;
    //: [CCCKitProgressHUD show];
    [KitDisableView grade];
    //: [self.teamListManager dismissTeamCompletion:^(NSError * _Nonnull error, NSString * _Nonnull msg) {
    [self.teamListManager center:^(NSError * _Nonnull error, NSString * _Nonnull msg) {
        //: [CCCKitProgressHUD dismiss];
        [KitDisableView input];
        //: if (!error) {
        if (!error) {
            //: [weakSelf.navigationController popToRootViewControllerAnimated:YES];
            [weakSelf.navigationController popToRootViewControllerAnimated:YES];
        }
        //: [weakSelf showToastMsg:msg];
        [weakSelf blueMsg:msg];
    //: }];
    }];
}

//: - (void)didQuitTeam{
- (void)show{
    //: __weak typeof(self) wself = self;
    __weak typeof(self) wself = self;
    //: [CCCKitProgressHUD show];
    [KitDisableView grade];
    //: [self.teamListManager quitTeamCompletion:^(NSError * _Nonnull error, NSString * _Nonnull msg) {
    [self.teamListManager input:^(NSError * _Nonnull error, NSString * _Nonnull msg) {
        //: [CCCKitProgressHUD dismiss];
        [KitDisableView input];
        //: if (!error) {
        if (!error) {
            //: [wself.navigationController popToRootViewControllerAnimated:YES];
            [wself.navigationController popToRootViewControllerAnimated:YES];
        }
        //: [wself showToastMsg:msg];
        [wself blueMsg:msg];
    //: }];
    }];
}

//: #pragma mark - Notication
#pragma mark - Notication
//: - (void)teamInfoUpdate:(NSNotification *)note {
- (void)fullMoon:(NSNotification *)note {
    //: [self reloadData];
    [self timeText];
}

//: - (void)teamMemberUpdate:(NSNotification *)note {
- (void)commentsed:(NSNotification *)note {
    //: [self reloadData];
    [self timeText];
}

//: #pragma mark - Private
#pragma mark - Private
//: - (void)uploadImage:(UIImage *)image {
- (void)uploadRefer:(UIImage *)image {
    //: UIImage *imageForAvatarUpload = [image nim_imageForAvatarUpload];
    UIImage *imageForAvatarUpload = [image at];
    //: NSString *fileName = [[[[NSUUID UUID] UUIDString] lowercaseString] stringByAppendingPathExtension:@"jpg"];
    NSString *fileName = [[[[NSUUID UUID] UUIDString] lowercaseString] stringByAppendingPathExtension:StringFromAttractiveData(str_youthContent)];
    //: NSString *filePath = [NSTemporaryDirectory() stringByAppendingPathComponent:fileName];
    NSString *filePath = [NSTemporaryDirectory() stringByAppendingPathComponent:fileName];
    //: NSData *data = UIImageJPEGRepresentation(imageForAvatarUpload, 1.0);
    NSData *data = UIImageJPEGRepresentation(imageForAvatarUpload, 1.0);
    //: BOOL success = data && [data writeToFile:filePath atomically:YES];
    BOOL success = data && [data writeToFile:filePath atomically:YES];
    //: __weak typeof(self) wself = self;
    __weak typeof(self) wself = self;
    //: if (success) {
    if (success) {
        //: [CCCKitProgressHUD show];
        [KitDisableView grade];
        //: __weak typeof(self) weakSelf = self;
        __weak typeof(self) weakSelf = self;
        //: [self.teamListManager updateTeamAvatar:filePath completion:^(NSError * _Nonnull error, NSString * _Nonnull msg) {
        [self.teamListManager search:filePath max:^(NSError * _Nonnull error, NSString * _Nonnull msg) {
            //: [CCCKitProgressHUD dismiss];
            [KitDisableView input];
            //: if (!error) {
            if (!error) {
                //: NSString *urlString = weakSelf.teamListManager.team.avatarUrl;
                NSString *urlString = weakSelf.teamListManager.team.avatarUrl;
                //: SDWebImageManager *sdManager = [SDWebImageManager sharedManager];
                SDWebImageManager *sdManager = [SDWebImageManager sharedManager];
                //: [sdManager.imageCache storeImage:imageForAvatarUpload
                [sdManager.imageCache storeImage:imageForAvatarUpload
                                       //: imageData:data
                                       imageData:data
                                          //: forKey:urlString
                                          forKey:urlString
                                       //: cacheType:SDImageCacheTypeAll
                                       cacheType:SDImageCacheTypeAll
                                      //: completion:nil];
                                      completion:nil];
                //: [wself reloadTableHeaderData];
                [wself press];
            }
            //: [wself showToastMsg:msg];
            [wself blueMsg:msg];
        //: }];
        }];
    //: } else {
    } else {
        //: [wself showToastMsg:[NTESLanguageManager getTextWithKey:@"group_info_activity_update_failed"]];
        [wself blueMsg:[MaxInformation off:StringFromAttractiveData(str_textPointTitle)]];
    }
}

//: @end
@end

//: @implementation BBBTeamCardViewControllerOption
@implementation ViewOption

//: @end
@end

Byte * AttractiveDataToCache(Byte *data) {
    int popularTing = data[0];
    int establishment = data[1];
    Byte devour = data[2];
    int wire = data[3];
    if (!popularTing) return data + wire;
    for (int i = wire; i < wire + establishment; i++) {
        int value = data[i] + devour;
        if (value > 255) {
            value -= 256;
        }
        data[i] = value;
    }
    data[0] = 0;
    data[wire + establishment] = 0;
    return data + wire;
}

NSString *StringFromAttractiveData(Byte *data) {
    return [NSString stringWithUTF8String:(char *)AttractiveDataToCache(data)];
}
