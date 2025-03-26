// __DEBUG__
// __CLOSE_PRINT__
//
//  ComputerFilenameInformation.m
//  NIM
//
//  Created by chris on 16/1/31.
//  Copyright © 2016年 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import "NTESNavigationAnimator.h"
#import "ComputerFilenameInformation.h"
//: #import "UIView+NTES.h"
#import "UIView+Status.h"
//: #import "NTESMainTabController.h"
#import "CutBarController.h"
//: #import "CustomTabBarController.h"
#import "StatusTeamViewController.h"
//: #import <objc/runtime.h>
#import <objc/runtime.h>

//: @implementation NTESNavigationAnimator
@implementation ComputerFilenameInformation
//: static inline BOOL
static inline BOOL
//: OverrideImplementation(Class targetClass, SEL targetSelector, id (^implementationBlock)(Class originClass, SEL originCMD, IMP originIMP)) {
OverrideImplementation(Class targetClass, SEL targetSelector, id (^implementationBlock)(Class originClass, SEL originCMD, IMP originIMP)) {
    //: Method originMethod = class_getInstanceMethod(targetClass, targetSelector);
    Method originMethod = class_getInstanceMethod(targetClass, targetSelector);
    //: if (!originMethod) {
    if (!originMethod) {
        //: return NO;
        return NO;
    }
    //: IMP originIMP = method_getImplementation(originMethod);
    IMP originIMP = method_getImplementation(originMethod);
    //: method_setImplementation(originMethod, imp_implementationWithBlock(implementationBlock(targetClass, targetSelector, originIMP)));
    method_setImplementation(originMethod, imp_implementationWithBlock(implementationBlock(targetClass, targetSelector, originIMP)));
    //: return YES;
    return YES;
}

//+ (void)load
//{
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        if (@available(iOS 12.1, *)) { // 解决12.1 的UITabbar 位置显示异常
//            OverrideImplementation(NSClassFromString(@"UITabBarButton"), @selector(setFrame:), ^id(__unsafe_unretained Class originClass, SEL originCMD, IMP originIMP) {
//                return ^(UIView *selfObject, CGRect firstArgv) {
//                    
//                    if ([selfObject isKindOfClass:originClass]) {
//                        if (!CGRectIsEmpty(selfObject.frame) && CGRectIsEmpty(firstArgv)) {
//                            return;
//                        }
//                    }
//                    
//                    void (*originSelectorIMP)(id, SEL, CGRect);
//                    originSelectorIMP = (void (*)(id, SEL, CGRect))originIMP;
//                    originSelectorIMP(selfObject, originCMD, firstArgv);
//                };
//            });
//        }
//    });
//}

//: - (instancetype)initWithNavigationController:(UINavigationController *)navigationController
- (instancetype)initWithSize:(UINavigationController *)navigationController
{
    //: self = [super init];
    self = [super init];
    //: if (self) {
    if (self) {
        //: _navigationController = navigationController;
        _navigationController = navigationController;
    }
    //: return self;
    return self;
}

//: - (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext
- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext
{
    //: return 0.35;
    return 0.35;
}

//: - (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{

    //: switch (self.currentOpearation) {
    switch (self.currentOpearation) {
        //: case UINavigationControllerOperationPop:
        case UINavigationControllerOperationPop:
            //: [self popAnimation:transitionContext];
            [self popIconAnimation:transitionContext];
            //: break;
            break;
        //: case UINavigationControllerOperationPush:
        case UINavigationControllerOperationPush:
            //: [self pushAnimation:transitionContext];
            [self should:transitionContext];
            //: break;
            break;
        //: default:
        default:
            //: break;
            break;
    }
}


//: - (void)pushAnimation:(id<UIViewControllerContextTransitioning>)transitionContext
- (void)should:(id<UIViewControllerContextTransitioning>)transitionContext
{
    //: UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    //: UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];

    //: UIView *containerView = [transitionContext containerView];
    UIView *containerView = [transitionContext containerView];
    //: UINavigationController *navigationController = fromViewController.navigationController;
    UINavigationController *navigationController = fromViewController.navigationController;
    //: UITabBarController *tabbarController = fromViewController.tabBarController;
    UITabBarController *tabbarController = fromViewController.tabBarController;

    // 使用 xib 可能会出现 view 的 size 不对的情况
    //: CGRect frame = fromViewController.view.frame;
    CGRect frame = fromViewController.view.frame;
    //: if ((toViewController.edgesForExtendedLayout & UIRectEdgeTop) == 0)
    if ((toViewController.edgesForExtendedLayout & UIRectEdgeTop) == 0)
    {
        //: frame = CGRectOffset(navigationController.view.frame, 0, navigationController.navigationBar.bottom);
        frame = CGRectOffset(navigationController.view.frame, 0, navigationController.navigationBar.bottom);
    }
    //: if ((toViewController.edgesForExtendedLayout & UIRectEdgeBottom) == 0) {
    if ((toViewController.edgesForExtendedLayout & UIRectEdgeBottom) == 0) {
        //: CGRect slice = CGRectZero;
        CGRect slice = CGRectZero;
        //: CGRect remainder = CGRectZero;
        CGRect remainder = CGRectZero;

        // 检查 tabbarController 是否为 CutBarController
        //: if ([tabbarController isKindOfClass:[NTESMainTabController class]]) {
        if ([tabbarController isKindOfClass:[CutBarController class]]) {
            //: NTESMainTabController *mainTabController = (NTESMainTabController *)tabbarController;
            CutBarController *mainTabController = (CutBarController *)tabbarController;
            //: if (!mainTabController.customTabBar.hidden) {
            if (!mainTabController.customTabBar.hidden) {
                //: CGRectDivide(frame, &slice, &remainder, mainTabController.customTabBar.height, CGRectMaxYEdge);
                CGRectDivide(frame, &slice, &remainder, mainTabController.customTabBar.height, CGRectMaxYEdge);
                //: frame = remainder;
                frame = remainder;
            }
        //: } else if (tabbarController && !tabbarController.tabBar.hidden) {
        } else if (tabbarController && !tabbarController.tabBar.hidden) {
            //: CGRectDivide(frame, &slice, &remainder, tabbarController.tabBar.height, CGRectMaxYEdge);
            CGRectDivide(frame, &slice, &remainder, tabbarController.tabBar.height, CGRectMaxYEdge);
            //: frame = remainder;
            frame = remainder;
        }
    }
    //: toViewController.view.frame = frame;
    toViewController.view.frame = frame;

    //: [containerView addSubview:fromViewController.view];
    [containerView addSubview:fromViewController.view];
    //: [containerView addSubview:toViewController.view];
    [containerView addSubview:toViewController.view];

    //: CGFloat width = containerView.width;
    CGFloat width = containerView.width;
    //: toViewController.view.left = width;
    toViewController.view.left = width;

    //: [self callAnimationWillStart];
    [self valueCenter];
    //: CGFloat duration = 0.35;
    CGFloat duration = 0.35;

    //: [UIView animateWithDuration:duration animations:^{
    [UIView animateWithDuration:duration animations:^{
        //: fromViewController.view.right = width * 0.5;
        fromViewController.view.right = width * 0.5;
        //: toViewController.view.right = width;
        toViewController.view.right = width;
    //: } completion:^(BOOL finished) {
    } completion:^(BOOL finished) {
        //: [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        //: [self callAnimationDidEnd];
        [self domainMedia];
    //: }];
    }];
}



//: - (void)popAnimation:(id<UIViewControllerContextTransitioning>)transitionContext
- (void)popIconAnimation:(id<UIViewControllerContextTransitioning>)transitionContext
{
    //: UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    //: UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    //: CGFloat snapshootHeight = [UIDevice vg_statusBarHeight] + fromViewController.navigationController.navigationBar.height;
    CGFloat snapshootHeight = [UIDevice task] + fromViewController.navigationController.navigationBar.height;

    //: UIView *fakeBar = [fromViewController.navigationController.view
    UIView *fakeBar = [fromViewController.navigationController.view
                       //: resizableSnapshotViewFromRect:CGRectMake(0, 0, fromViewController.view.width, snapshootHeight) afterScreenUpdates:NO withCapInsets:UIEdgeInsetsZero];
                       resizableSnapshotViewFromRect:CGRectMake(0, 0, fromViewController.view.width, snapshootHeight) afterScreenUpdates:NO withCapInsets:UIEdgeInsetsZero];
    //: UINavigationBar *tureBar = toViewController.navigationController.navigationBar;
    UINavigationBar *tureBar = toViewController.navigationController.navigationBar;

    // 保存导航控制器的引用
    //: UINavigationController *navController = fromViewController.navigationController;
    UINavigationController *navController = fromViewController.navigationController;

    //: UIView *containerView = [transitionContext containerView];
    UIView *containerView = [transitionContext containerView];

    //: [containerView addSubview:toViewController.view];
    [containerView addSubview:toViewController.view];

    //: if (self.animationType == NTESNavigationAnimationTypeCross) {
    if (self.animationType == NTESNavigationAnimationTypeCross) {
        //: [containerView addSubview:tureBar];
        [containerView addSubview:tureBar];
        //: [fromViewController.view addSubview:fakeBar];
        [fromViewController.view addSubview:fakeBar];
    }
    //: [containerView addSubview:fromViewController.view];
    [containerView addSubview:fromViewController.view];

    //: CGFloat width = containerView.width;
    CGFloat width = containerView.width;
    //: toViewController.view.right = 0.f;
    toViewController.view.right = 0.f;

    //: [self callAnimationWillStart];
    [self valueCenter];
    //: CGFloat duration = 0.35;
    CGFloat duration = 0.35;
    //: [UIView animateWithDuration:duration animations:^{
    [UIView animateWithDuration:duration animations:^{
        //: fromViewController.view.left = width;
        fromViewController.view.left = width;
        //: toViewController.view.right = width;
        toViewController.view.right = width;
        //: fakeBar.alpha = 0.0;
        fakeBar.alpha = 0.0;
    //: } completion:^(BOOL finished) {
    } completion:^(BOOL finished) {
        // 动画完成后，检查导航栈状态
        //: NTESMainTabController *mainTabController = [NTESMainTabController instance];
        CutBarController *mainTabController = [CutBarController textInstance];

        // 检查当前是否只剩一个视图控制器（回到根视图）
        //: BOOL isRootViewController = (navController.viewControllers.count == 1);
        BOOL isRootViewController = (navController.viewControllers.count == 1);

        //: if (mainTabController && isRootViewController) {
        if (mainTabController && isRootViewController) {
            //: [mainTabController showTabBar];
            [mainTabController message];
        }

        //: [toViewController.navigationController.view addSubview:tureBar];
        [toViewController.navigationController.view addSubview:tureBar];
        //: [fakeBar removeFromSuperview];
        [fakeBar removeFromSuperview];
        //: [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        //: [self callAnimationDidEnd];
        [self domainMedia];
    //: }];
    }];
}

//: - (void)callAnimationWillStart
- (void)valueCenter
{
    //: if ([self.delegate respondsToSelector:@selector(animationWillStart:)]) {
    if ([self.delegate respondsToSelector:@selector(titleName:)]) {
        //: [self.delegate animationWillStart:self];
        [self.delegate titleName:self];
    }
}

//: - (void)callAnimationDidEnd
- (void)domainMedia
{
    //: if ([self.delegate respondsToSelector:@selector(animationDidEnd:)]) {
    if ([self.delegate respondsToSelector:@selector(called:)]) {
        //: [self.delegate animationDidEnd:self];
        [self.delegate called:self];
    }
}

//: @end
@end