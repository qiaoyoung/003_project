//
//  HMViewController.m
//  HuaxiajiaboApp
//
//  Created by HuamoMac on 15/4/20.
//  Copyright (c) 2015年 HuaMo. All rights reserved.
//

#import "HMViewController.h"


#define EmptyViewTag  53333
#define NoNetWorkViewTag  53334


@implementation HMViewController
@synthesize viewControllerDelegate = _viewControllerDelegate;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //self.view.backgroundColor = CommonBGView_Color;
    self.view.backgroundColor = RGB_COLOR_String(@"#F9F9F9");

    self.navigationController.navigationBar.barTintColor = [UIColor colorWithPatternImage:[SNGradientHelper getLinearGradientImage:RGB_COLOR_String(kCommonBGColor_begin) and:RGB_COLOR_String(kCommonBGColor_end) directionType:SNLinearGradientDirectionLevel]];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont boldSystemFontOfSize:16]}];
}


#pragma - 系统返回手势改装

/**
 注意：这个手势是添加在了self.navigationController.view上
 最好在：navigationController->RootViewController实现这个方法
 
 使用的时候一定要配置方法：注意！注意！注意！
 - (void)viewWillAppear:(BOOL)animated{
 [super viewWillAppear:animated];
 [self.navigationController setNavigationBarHidden:YES animated:animated];
 
 }
 */
- (void)addFullScreenPopGesture{
    // 获取系统自带滑动手势的target对象
    id target = self.navigationController.interactivePopGestureRecognizer.delegate;
    SEL action = NSSelectorFromString(@"handleNavigationTransition:");
    // 创建全屏滑动手势，调用系统自带滑动手势的target的action方法
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:target action:action];
    pan.delegate = self;
    pan.maximumNumberOfTouches = 1;
    // 给导航控制器的view添加全屏滑动手势
    [self.navigationController.view addGestureRecognizer:pan];
}

/**
 注意
 */
- (void)enableFullScreenPopGesture:(BOOL)enable {
    /************************/
//    //注意：暂时取消侧拉pop手势
//    for (UITapGestureRecognizer *gesture in self.navigationController.view.gestureRecognizers) {
//        
//        gesture.enabled = NO;
//        return;
//    }
    
    //如果只有系统返回手势，添加自定义手势
    if (self.navigationController.view.gestureRecognizers.count == 1) {
        [self addFullScreenPopGesture];
    }
    
    for (UITapGestureRecognizer *gesture in self.navigationController.view.gestureRecognizers) {
        
        gesture.enabled = enable;
    }
}

- (BOOL)gestureRecognizerShouldBegin:(UIPanGestureRecognizer *)gestureRecognizer{
    if (self.navigationController.viewControllers.count <= 1) {
        return NO;
    }
    
    // Ignore pan gesture when the navigation controller is currently in transition.
    if ([[self.navigationController valueForKey:@"_isTransitioning"] boolValue]) {
        return NO;
    }
    
    // Prevent calling the handler when the gesture begins in an opposite direction.
    CGPoint translation = [gestureRecognizer translationInView:gestureRecognizer.view];
    if (translation.x <= 0) {
        return NO;
    }
    
    return YES;
}


@end



@implementation UIViewController (HM)


#pragma mark - empty view

- (void)showEmptyView{
    [self showEmptyViewWithMessage:@"No related content, try another word"];
}

- (void)showEmptyViewWithMessage:(NSString *)message{
    [self showEmptyViewWithMessage:message inView:self.view];
}


- (void)showEmptyViewWithImageName:(NSString *)imageName inView:(UIView *)inView{
    [self showEmptyViewWithMessage:@"" inView:inView imageName:imageName];
}

- (void)showEmptyViewWithMessage:(NSString *)message inView:(UIView *)inView{
    [self showEmptyViewWithMessage:message inView:inView imageName:@"icon_empty_data"];
}

- (void)showEmptyViewWithMessage:(NSString *)message inView:(UIView *)inView imageName:(NSString *)imageName{
    UIView *emptyView= (UIView *)[inView viewWithTag:EmptyViewTag];
    if (!emptyView) {
        emptyView = [[UIView alloc]init];
        emptyView.backgroundColor = [UIColor clearColor];
        emptyView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        emptyView.tag = EmptyViewTag;
        
        UIImageView *emptyImage = [[UIImageView alloc]init];
        emptyImage.frame = CGRectMake((SCREEN_WIDTH-300)/2.0f, (SCREEN_HEIGHT-SCREEN_TOP_HEIGHT-SCREEN_BOTTOM_HEIGHT-250)/2.0f, 300, 200);
        emptyImage.image = [UIImage imageNamed:imageName];
        [emptyView addSubview:emptyImage];
        
        UILabel *emptyLabel = [[UILabel alloc] init];
        emptyLabel.frame = CGRectMake(40, 0, SCREEN_WIDTH-80, 20);
        emptyLabel.backgroundColor = [UIColor clearColor];
        emptyLabel.textColor = [UIColor lightGrayColor];
        emptyLabel.textAlignment = NSTextAlignmentCenter;
        emptyLabel.font = [UIFont systemFontOfSize:13];
        emptyLabel.text = message;
        [emptyView addSubview:emptyLabel];
//        [emptyLabel underView:emptyImage padding:8];
//        [emptyLabel verticalAllignment:emptyImage];
        
    }
    
    
    //emptyView.center = CGPointMake(inView.width/2.0, inView.height/2.0);
    [inView addSubview:emptyView];
    [inView bringSubviewToFront:emptyView];
}

- (void)hideEmptyView{
    [self hideEmptyViewInView:self.view];
}
- (void)hideEmptyViewInView:(UIView *)view{
    
    UIView *emptyView= (UIView *)[view viewWithTag:EmptyViewTag];
    
    emptyView.hidden = YES;
    [emptyView removeFromSuperview];
}


#pragma mark - 网络异常时调用此方法

- (BOOL)canShowNotNetView{
    return NO;
}

- (void)refrushWithNotNet{
    
    
}





@end
