//
//  MainTabController.m
//  NIMDemo
//
//  Created by chris on 15/2/2.
//  Copyright (c) 2015年 Netease. All rights reserved.
//

#import "NTESMainTabController.h"
#import "CCCAppDelegate.h"
#import "NTESSessionListViewController.h"
#import "UIImage+NTESColor.h"
#import "NTESCustomNotificationDB.h"
#import "NTESNotificationCenter.h"
#import "NTESNavigationHandler.h"
#import "NTESNavigationAnimator.h"
#import "NTESBundleSetting.h"
#import "CCCContactsViewController.h"
#import "NTESVideoListViewController.h"
#import "NTESMainCenterViewController.h"
#import "CustomTabBar.h"
#import "CustomTabBarController.h"

#define TabbarVC    @"vc"
#define TabbarTitle @"title"
#define TabbarImage @"image"
#define TabbarSelectedImage @"selectedImage"
#define TabbarItemBadgeValue @"badgeValue"
#define TabBarCount 4

typedef NS_ENUM(NSInteger,NTESMainTabType) {
    NTESMainTabTypeMessageList,    //聊天
    NTESMainTabTypeContact,        //通讯录
    NTESMainTabTypeChatroomList,   //聊天室
    NTESMainTabTypeSetting,        //设置
};

@interface NTESMainTabController ()<NIMSystemNotificationManagerDelegate,NIMConversationManagerDelegate,NIMChatManagerDelegate,NIMLoginManagerDelegate,CustomTabBarControllerDelegate>

@property (nonatomic,strong) NSArray *navigationHandlers;

@property (nonatomic,strong) NTESNavigationAnimator *animator;

@property (nonatomic,assign) NSInteger sessionUnreadCount;

@property (nonatomic,assign) NSInteger systemUnreadCount;

@property (nonatomic,assign) NSInteger customSystemUnreadCount;

@property (nonatomic,copy)  NSDictionary *configs;

@end

@implementation NTESMainTabController

+ (instancetype)instance{
    CCCAppDelegate *delegete = (CCCAppDelegate *)[UIApplication sharedApplication].delegate;
    UIViewController *vc = delegete.window.rootViewController;
    if ([vc isKindOfClass:[NTESMainTabController class]]) {
        return (NTESMainTabController *)vc;
    }else{
        return nil;
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpSubNav];
    [[NIMSDK sharedSDK].systemNotificationManager addDelegate:self];
    [[NIMSDK sharedSDK].conversationManager addDelegate:self];

    extern NSString *NTESCustomNotificationCountChanged;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onCustomNotifyChanged:) name:NTESCustomNotificationCountChanged object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(languageChanged:) name:KEKENotificationLanguageChanged object:nil];
    
    // 设置自定义TabBar的颜色
    self.customTabBar.itemTintColor = RGB_COLOR_String(@"#888888");
    self.customTabBar.selectedItemTintColor = RGB_COLOR_String(@"#000000");
  
    self.delegate = self;
}

- (BOOL)customTabBarController:(UIViewController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {
    [UIView setAnimationsEnabled:NO];
    return YES;
}

- (void)customTabBarController:(UIViewController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    [UIView setAnimationsEnabled:YES];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    // 设置自定义TabBar的颜色
    self.customTabBar.itemTintColor = RGB_COLOR_String(@"#888888");
    self.customTabBar.selectedItemTintColor = RGB_COLOR_String(@"#000000");
    
    // 如果是根视图控制器，应该显示 TabBar
    BOOL isRoot = YES;
    for (UINavigationController *nav in self.viewControllers) {
        if (nav.viewControllers.count > 1) {
            isRoot = NO;
            break;
        }
    }
    
    if (isRoot && self.customTabBar.hidden) {
        [self showTabBar];
    }
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    //会话界面发送拍摄的视频，拍摄结束后点击发送后可能顶部会有红条，导致的界面错位。
    self.view.frame = [UIScreen mainScreen].bounds;
}

- (void)dealloc{
    [[NIMSDK sharedSDK].systemNotificationManager removeDelegate:self];
    [[NIMSDK sharedSDK].conversationManager removeDelegate:self];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (NSArray*)tabbars{
    self.sessionUnreadCount  = [NIMSDK sharedSDK].conversationManager.allUnreadCount;
//    self.systemUnreadCount   = [NIMSDK sharedSDK].systemNotificationManager.allUnreadCount;
    self.customSystemUnreadCount = [[NTESCustomNotificationDB sharedInstance] unreadCount];
    NSMutableArray *items = [[NSMutableArray alloc] init];
    
    [items addObject:@(0)];
    [items addObject:@(1)];
    [items addObject:@(2)];
//    [items addObject:@(3)];
    
    return items;
}

#pragma mark - Notification
- (void)languageChanged:(NSNotification *)noti {
    // 重新设置导航栏和标签栏
    [self setUpSubNav];
    
    // 确保在语言切换后 TabBar 可见
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (self.customTabBar.hidden) {
            [self showTabBar];
        }
    });
}

- (void)setUpSubNav{
    NSMutableArray *handleArray = [[NSMutableArray alloc] init];
    NSMutableArray *vcArray = [[NSMutableArray alloc] init];
    [self.tabbars enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        NSDictionary * item =[self vcInfoForTabType:[obj integerValue]];
        NSString *vcName = item[TabbarVC];
        NSString *title  = @"";
        if(idx == 0){
            title  = LangKey(@"activity_user_profile_chat");
        }else if (idx == 1){
            title  = LangKey(@"contacts_list_title");
        }else if (idx == 2){
            title  = LangKey(@"main_tab_my");
        }
        
        NSString *imageName = item[TabbarImage];
        NSString *imageSelected = item[TabbarSelectedImage];
        Class clazz = NSClassFromString(vcName);
        UIViewController *vc = [[clazz alloc] initWithNibName:nil bundle:nil];
        vc.hidesBottomBarWhenPushed = NO;
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
        
        UIImage *normalImage = [UIImage imageNamed:imageName];
        normalImage = [normalImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        UIImage *selectImage = [UIImage imageNamed:imageSelected];
        selectImage = [selectImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];

        nav.tabBarItem = [[UITabBarItem alloc] initWithTitle:title
                                                       image:normalImage
                                               selectedImage:selectImage];
        nav.tabBarItem.tag = idx;
        NSInteger badge = [item[TabbarItemBadgeValue] integerValue];
        if (badge) {
            nav.tabBarItem.badgeValue = [NSString stringWithFormat:@"%zd",badge];
        }
        NTESNavigationHandler *handler = [[NTESNavigationHandler alloc] initWithNavigationController:nav];
        nav.delegate = handler;
        
        if (@available(iOS 15.0, *)) {
            
            NSDictionary *dic = @{NSForegroundColorAttributeName : [UIColor whiteColor],
                                  NSFontAttributeName : [UIFont boldSystemFontOfSize:11]};
            
            UINavigationBarAppearance *barApp = [UINavigationBarAppearance new];
            barApp.backgroundColor = RGB_COLOR_String(kCommonBGColor_All);
            barApp.shadowColor = RGB_COLOR_String(kCommonBGColor_All);
            barApp.titleTextAttributes = dic;
            
            nav.navigationBar.scrollEdgeAppearance = barApp;
            nav.navigationBar.standardAppearance = barApp;
        }
        
        [vcArray addObject:nav];
        [handleArray addObject:handler];
    }];
    self.viewControllers = [NSArray arrayWithArray:vcArray];
    self.navigationHandlers = [NSArray arrayWithArray:handleArray];
    
    
    UINavigationBar *navBar = [UINavigationBar appearance];
    
    NSDictionary *dic = @{NSForegroundColorAttributeName : [UIColor blackColor],
                          NSFontAttributeName : [UIFont boldSystemFontOfSize:16]};
    
    navBar.barTintColor = [UIColor colorWithPatternImage:[SNGradientHelper getLinearGradientImage:RGB_COLOR_String(kCommonBGColor_begin) and:RGB_COLOR_String(kCommonBGColor_end) directionType:SNLinearGradientDirectionVertical]];
    [navBar setTitleTextAttributes:dic];
    [navBar setShadowImage:[UIImage new]];
    [navBar setBackgroundImage:[SNGradientHelper getLinearGradientImage:RGB_COLOR_String(kCommonBGColor_begin) and:RGB_COLOR_String(kCommonBGColor_end) directionType:SNLinearGradientDirectionLevel] forBarMetrics:UIBarMetricsDefault];

    navBar.translucent = YES;
    navBar.tintColor = [UIColor grayColor];
    
    // 设置自定义TabBar的样式
    self.customTabBar.backgroundColor = [UIColor whiteColor];
    // 刷新自定义TabBar
    [self.customTabBar refreshTabBarItems];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
}

#pragma mark - NIMConversationManagerDelegate
- (void)didAddRecentSession:(NIMRecentSession *)recentSession
           totalUnreadCount:(NSInteger)totalUnreadCount{
    self.sessionUnreadCount = totalUnreadCount;
    [self refreshSessionBadge];
}


- (void)didUpdateRecentSession:(NIMRecentSession *)recentSession
              totalUnreadCount:(NSInteger)totalUnreadCount{
    self.sessionUnreadCount = totalUnreadCount;
    [self refreshSessionBadge];
}

- (void)didUpdateUnreadCountDic:(NSDictionary *)unreadCountDic
{
    NSLog(@"%@",unreadCountDic);
    NSInteger unreadCount = [[NIMSDK sharedSDK].conversationManager allUnreadCount:YES];
    self.sessionUnreadCount = unreadCount;
    [self refreshSessionBadge];
}

- (void)didRemoveRecentSession:(NIMRecentSession *)recentSession totalUnreadCount:(NSInteger)totalUnreadCount{
    self.sessionUnreadCount = totalUnreadCount;
    [self refreshSessionBadge];
}

- (void)messagesDeletedInSession:(NIMSession *)session{
    self.sessionUnreadCount = [NIMSDK sharedSDK].conversationManager.allUnreadCount;
    [self refreshSessionBadge];
}

- (void)allMessagesDeleted{
    self.sessionUnreadCount = 0;
    [self refreshSessionBadge];
}

- (void)allMessagesRead
{
    self.sessionUnreadCount = 0;
    [self refreshSessionBadge];
}

- (void)onBatchMarkMessagesReadInSessions:(NSArray<NIMSession *> *)sessions
{
    self.sessionUnreadCount = [NIMSDK sharedSDK].conversationManager.allUnreadCount;
    [self refreshSessionBadge];
}

#pragma mark - NIMSystemNotificationManagerDelegate
- (void)onSystemNotificationCountChanged:(NSInteger)unreadCount
{
    self.systemUnreadCount = unreadCount;
    [self refreshContactBadge];
}

#pragma mark - Notification
- (void)onCustomNotifyChanged:(NSNotification *)notification
{
    NTESCustomNotificationDB *db = [NTESCustomNotificationDB sharedInstance];
    self.customSystemUnreadCount = db.unreadCount;
    [self refreshSettingBadge];
}

- (void)refreshSessionBadge{
    NSString *badgeValue = self.sessionUnreadCount ? @(self.sessionUnreadCount).stringValue : nil;
    [super setBadgeValue:badgeValue atIndex:NTESMainTabTypeMessageList];
}

- (void)refreshContactBadge{
    // 注释掉的原有代码
    // UINavigationController *nav = self.viewControllers[NTESMainTabTypeContact];
    // NSInteger badge = self.systemUnreadCount;
    // nav.tabBarItem.badgeValue = badge ? @(badge).stringValue : nil;
}

- (void)refreshSettingBadge{
    NSString *badgeValue = self.customSystemUnreadCount ? @(self.customSystemUnreadCount).stringValue : nil;
    [super setBadgeValue:badgeValue atIndex:NTESMainTabTypeSetting];
}


- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleDefault;
}


#pragma mark - Rotate

- (BOOL)shouldAutorotate{
    BOOL enableRotate = [NTESBundleSetting sharedConfig].enableRotate;
    return enableRotate ? [self.selectedViewController shouldAutorotate] : NO;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations{
    BOOL enableRotate = [NTESBundleSetting sharedConfig].enableRotate;
    return enableRotate ? [self.selectedViewController supportedInterfaceOrientations] : UIInterfaceOrientationMaskPortrait;
}


#pragma mark - VC
- (NSDictionary *)vcInfoForTabType:(NTESMainTabType)type{
    
    if (_configs == nil)
    {
        _configs = @{
                     @(NTESMainTabTypeMessageList) : @{
                             TabbarVC           : @"NTESSessionListViewController",
                             TabbarTitle        : LangKey(@"activity_user_profile_chat"),
                             TabbarImage        : @"icon_message_normal",
                             TabbarSelectedImage: @"icon_message_pressed",
                             TabbarItemBadgeValue: @(self.sessionUnreadCount)
                             },
                     @(NTESMainTabTypeContact)     : @{
                             TabbarVC           : @"CCCContactsViewController",
                             TabbarTitle        : LangKey(@"contacts_list_title"),
                             TabbarImage        : @"icon_contact_normal",
                             TabbarSelectedImage: @"icon_contact_pressed",
                             TabbarItemBadgeValue: @(self.systemUnreadCount)
                             },
                     @(NTESMainTabTypeChatroomList): @{
                             TabbarVC           : @"NTESMainCenterViewController",
                             TabbarTitle        : LangKey(@"main_tab_my"),
                             TabbarImage        : @"icon_setting_normal",
                             TabbarSelectedImage: @"icon_setting_pressed",
                             },
                     @(NTESMainTabTypeSetting)     : @{
                             TabbarVC           : @"NTESVideoListViewController",
                             TabbarTitle        : @"视频".nim_localized,
                             TabbarImage        : @"icon_setting_normal",
                             TabbarSelectedImage: @"icon_setting_pressed",
                             TabbarItemBadgeValue: @(self.customSystemUnreadCount)
                             }
                     };

    }
    return _configs[@(type)];
}

- (void)showTabBar {
    // 如果已经显示，则不需要重复操作
    if (!self.customTabBar.hidden) {
        return;
    }
    
    // 确保自定义 TabBar 存在
    if (!self.customTabBar) {
        return;
    }
    
    // 直接设置可见性
    self.customTabBar.hidden = NO;
    self.customTabBar.alpha = 1.0; // 确保透明度为 1
    
    // 调整容器视图的大小
    CGRect containerFrame = self.containerView.frame;
    containerFrame.size.height = self.view.bounds.size.height - UITabbarHeight;
    self.containerView.frame = containerFrame;
    
    // 设置 TabBar 的位置
    CGRect tabBarFrame = CGRectMake(0, self.view.bounds.size.height - UITabbarHeight, self.view.bounds.size.width, UITabbarHeight);
    self.customTabBar.frame = tabBarFrame;
    
    // 确保 TabBar 在父视图上
    if (!self.customTabBar.superview) {
        [self.view addSubview:self.customTabBar];
    }
    
    // 确保选中的视图控制器的视图大小与容器一致
    if (self.selectedViewController) {
        self.selectedViewController.view.frame = self.containerView.bounds;
    }
    
    // 刷新 TabBar 项
    [self.customTabBar refreshTabBarItems];
    
    // 强制更新布局
    [self.view setNeedsLayout];
    [self.view layoutIfNeeded];
    
    // 确保 TabBar 在最前面
    [self.view bringSubviewToFront:self.customTabBar];
}

- (void)hideTabBar {
    // 如果已经隐藏，则不需要重复操作
    if (self.customTabBar.hidden) {
        return;
    }
    
    // 直接设置可见性
    self.customTabBar.hidden = YES;
    
    // 调整容器视图的大小
    CGRect containerFrame = self.containerView.frame;
    containerFrame.size.height = self.view.bounds.size.height;
    self.containerView.frame = containerFrame;
    
    // 确保选中的视图控制器的视图大小与容器一致
    if (self.selectedViewController) {
        self.selectedViewController.view.frame = self.containerView.bounds;
    }
    
    // 强制更新布局
    [self.view setNeedsLayout];
    [self.view layoutIfNeeded];
}

@end
