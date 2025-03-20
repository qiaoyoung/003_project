//
//  BBBTeamCardOperationViewController.m
// AppleProjectKit
//
//  Created by Genning-Work on 2019/12/12.
//  Copyright © 2019 NetEase. All rights reserved.
//

#import "BBBTeamCardOperationViewController.h"
#import "CCCKitProgressHUD.h"
#import "CCCKitDependency.h"
#import "UIImage+AppleProjectKit.h"
#import "NSString+AppleProjectKit.h"

#define NIMTeamInfoCardShowMaxMember (10)  //这个页面显示10个已经够了

@implementation BBBTeamCardOperationViewController

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (instancetype)initWithTeam:(NIMTeam *)team
                     session:(NIMSession *)session
                      option:(BBBTeamCardViewControllerOption *)option {
    if (self = [super init]) {
        _option = option;
        _teamListManager = [[BBBTeamListDataManager alloc] initWithTeam:team session:session];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(teamInfoUpdate:) name:kNIMTeamListDataTeamInfoUpdate object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(teamMemberUpdate:) name:kNIMTeamListDataTeamMembersChanged object:nil];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    BBBMembersFetchOption *option = [[BBBMembersFetchOption alloc] init];
    option.isRefresh = YES;
    option.offset = 0;
    option.count = NIMTeamInfoCardShowMaxMember;
    [self didFetchTeamMember:option];
}

- (void)reloadData {
    [self reloadTableHeaderData];
    [self reloadTableViewData];
    [self reloadOtherData];
}

- (void)didFetchTeamMember:(BBBMembersFetchOption *)option {
    __weak typeof(self) wself = self;
    [CCCKitProgressHUD show];
    [self.teamListManager fetchTeamMembersWithOption:option
                                          completion:^(NSError * _Nullable error, NSString * _Nullable msg) {
        [CCCKitProgressHUD dismiss];
        if (!error) {
            [wself reloadData];
        }
        [wself showToastMsg:msg];
    }];
}

- (void)didInviteUsers:(NSArray<NSString *> *)userIds
            completion:(dispatch_block_t)completion {
    
    if (userIds.count == 0) {
        return;
    }
    
    NSMutableDictionary *info = [NSMutableDictionary dictionary];
    info[@"attach"] = @"扩展消息";
    switch (_teamListManager.team.type) {
        case NIMTeamTypeNormal:
            info[@"postscript"] = @"邀请你加入讨论组".nim_localized;
            break;
        case NIMTeamTypeAdvanced:
            info[@"postscript"] = @"邀请你加入高级群".nim_localized;
            break;
        case NIMTeamTypeSuper:
            info[@"postscript"] = @"邀请你加入超大群".nim_localized;
            break;
        default:
            break;
    }
    __weak typeof(self) wself = self;
    [CCCKitProgressHUD show];
    [self.teamListManager addUsers:userIds info:info completion:^(NSError * _Nonnull error, NSString * _Nonnull msg) {
        [CCCKitProgressHUD dismiss];
        if (!error) {
            [wself reloadTableHeaderData];
        }
        [wself showToastMsg:msg];
        if (completion) {
            completion();
        }
    }];
}

- (void)didKickUser:(NSString *)userId {
    __weak typeof(self) wself = self;
    [CCCKitProgressHUD show];
    [self.teamListManager kickUsers:@[userId] completion:^(NSError * _Nonnull error, NSString * _Nonnull msg) {
        [CCCKitProgressHUD dismiss];
        if (!error) {
            [wself reloadTableHeaderData];
        }
        [wself showToastMsg:msg];
    }];
}

- (void)didUpdateTeamName:(NSString *)name {
    if (!name) {
        return;
    }
    __weak typeof(self) wself = self;
    [CCCKitProgressHUD show];
    [self.teamListManager updateTeamName:name
                              completion:^(NSError * _Nonnull error, NSString * _Nonnull msg) {
        [CCCKitProgressHUD dismiss];
        if (!error) {
            [wself reloadData];
        }
        [wself showToastMsg:msg];
    }];
}

- (void)didUpdateTeamNick:(NSString *)nick{
    if (!nick) {
        return;
    }
    __weak typeof(self) weakSelf = self;
    [CCCKitProgressHUD show];
    [self.teamListManager updateTeamNick:nick
                              completion:^(NSError * _Nonnull error, NSString * _Nonnull msg) {
        [CCCKitProgressHUD dismiss];
        if (!error) {
            [weakSelf reloadData];
        }
        [weakSelf showToastMsg:msg];
    }];
}

- (void)didUpdateTeamIntro:(NSString *)intro{
    if (!intro) {
        return;
    }
    __weak typeof(self) weakSelf = self;
    [CCCKitProgressHUD show];
    [self.teamListManager updateTeamIntro:intro completion:^(NSError * _Nonnull error, NSString * _Nonnull msg) {
        [CCCKitProgressHUD dismiss];
        if (!error) {
            [weakSelf reloadData];
        }
        [weakSelf showToastMsg:msg];
    }];
}

- (void)didUpdateTeamMute:(BOOL)mute {
    __weak typeof(self) weakSelf = self;
    [CCCKitProgressHUD show];
    [self.teamListManager updateTeamMute:mute
                              completion:^(NSError * _Nullable error, NSString * _Nullable msg) {
        [CCCKitProgressHUD dismiss];
        if (!error) {
            [weakSelf reloadData];
        }
        [weakSelf showToastMsg:msg];
    }];
}

- (void)didUpdateTeamAvatarWithType:(UIImagePickerControllerSourceType)type {
    __weak typeof(self) weakSelf = self;
    [self showImagePicker:type completion:^(UIImage * _Nonnull image) {
        [weakSelf uploadImage:image];
    }];
}

- (void)didupdateTeamJoinMode:(NIMTeamJoinMode)mode {
    __weak typeof(self) weakSelf = self;
    [CCCKitProgressHUD show];
    [self.teamListManager updateTeamJoinMode:mode completion:^(NSError * _Nonnull error, NSString * _Nonnull msg) {
        [CCCKitProgressHUD dismiss];
        if (!error) {
            [weakSelf reloadData];
        }
        [weakSelf showToastMsg:msg];
    }];
}

- (void)didUpdateTeamInviteMode:(NIMTeamInviteMode)mode {
    __weak typeof(self) weakSelf = self;
    [CCCKitProgressHUD show];
    [self.teamListManager updateTeamInviteMode:mode completion:^(NSError * _Nonnull error, NSString * _Nonnull msg) {
        [CCCKitProgressHUD dismiss];
        if (!error) {
            [weakSelf reloadData];
        }
        [weakSelf showToastMsg:msg];
    }];
}

- (void)didUpdateTeamBeInviteMode:(NIMTeamBeInviteMode)mode {
    __weak typeof(self) weakSelf = self;
    [CCCKitProgressHUD show];
    [self.teamListManager updateTeamBeInviteMode:mode
                                      completion:^(NSError * _Nonnull error, NSString * _Nonnull msg) {
        [CCCKitProgressHUD dismiss];
        if (!error) {
            [weakSelf reloadData];
        }
        [weakSelf showToastMsg:msg];
    }];
}

- (void)didUpdateTeamInfoMode:(NIMTeamUpdateInfoMode)mode {
    __weak typeof(self) weakSelf = self;
    [CCCKitProgressHUD show];
    [self.teamListManager updateTeamInfoMode:mode completion:^(NSError * _Nonnull error, NSString * _Nonnull msg) {
        [CCCKitProgressHUD dismiss];
        if (!error) {
            [weakSelf reloadData];
        }
        [weakSelf showToastMsg:msg];
    }];
}

- (void)didUpdateNotifiyState:(NIMTeamNotifyState)state {
    __weak typeof(self) weakSelf = self;
    [CCCKitProgressHUD show];
    [self.teamListManager updateTeamNotifyState:state completion:^(NSError * _Nonnull error, NSString * _Nonnull msg) {
        [CCCKitProgressHUD dismiss];
        if (!error) {
            [weakSelf reloadTableViewData];
        }
        [weakSelf showToastMsg:msg];
    }];
}

- (void)didOntransferToUser:(NSString *)userId leave:(BOOL)leave {
    [CCCKitProgressHUD show];
    [self.teamListManager transferOwnerWithUserId:userId
                                         leave:leave
                                    completion:^(NSError * _Nonnull error, NSString * _Nonnull msg) {
        [CCCKitProgressHUD dismiss];
        if (leave) {
            [self.navigationController popToRootViewControllerAnimated:YES];
        }else{
            [self reloadData];
        }
        [self showToastMsg:msg];
    }];
}

- (void)didDismissTeam{
    __weak typeof(self) weakSelf = self;
    [CCCKitProgressHUD show];
    [self.teamListManager dismissTeamCompletion:^(NSError * _Nonnull error, NSString * _Nonnull msg) {
        [CCCKitProgressHUD dismiss];
        if (!error) {
            [weakSelf.navigationController popToRootViewControllerAnimated:YES];
        }
        [weakSelf showToastMsg:msg];
    }];
}

- (void)didQuitTeam{
    __weak typeof(self) wself = self;
    [CCCKitProgressHUD show];
    [self.teamListManager quitTeamCompletion:^(NSError * _Nonnull error, NSString * _Nonnull msg) {
        [CCCKitProgressHUD dismiss];
        if (!error) {
            [wself.navigationController popToRootViewControllerAnimated:YES];
        }
        [wself showToastMsg:msg];
    }];
}

#pragma mark - Notication
- (void)teamInfoUpdate:(NSNotification *)note {
    [self reloadData];
}

- (void)teamMemberUpdate:(NSNotification *)note {
    [self reloadData];
}

#pragma mark - Private
- (void)uploadImage:(UIImage *)image {
    UIImage *imageForAvatarUpload = [image nim_imageForAvatarUpload];
    NSString *fileName = [[[[NSUUID UUID] UUIDString] lowercaseString] stringByAppendingPathExtension:@"jpg"];
    NSString *filePath = [NSTemporaryDirectory() stringByAppendingPathComponent:fileName];
    NSData *data = UIImageJPEGRepresentation(imageForAvatarUpload, 1.0);
    BOOL success = data && [data writeToFile:filePath atomically:YES];
    __weak typeof(self) wself = self;
    if (success) {
        [CCCKitProgressHUD show];
        __weak typeof(self) weakSelf = self;
        [self.teamListManager updateTeamAvatar:filePath completion:^(NSError * _Nonnull error, NSString * _Nonnull msg) {
            [CCCKitProgressHUD dismiss];
            if (!error) {
                NSString *urlString = weakSelf.teamListManager.team.avatarUrl;
                SDWebImageManager *sdManager = [SDWebImageManager sharedManager];
                [sdManager.imageCache storeImage:imageForAvatarUpload
                                       imageData:data
                                          forKey:urlString
                                       cacheType:SDImageCacheTypeAll
                                      completion:nil];
                [wself reloadTableHeaderData];
            }
            [wself showToastMsg:msg];
        }];
    } else {
        [wself showToastMsg:LangKey(@"group_info_activity_update_failed")];
    }
}

@end

@implementation BBBTeamCardViewControllerOption

@end
