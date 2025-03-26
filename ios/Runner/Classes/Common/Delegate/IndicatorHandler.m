
#import <Foundation/Foundation.h>

NSString *StringFromAwarenessData(Byte *data);


//: useClearBar
Byte str_sizeValueData[] = {25, 11, 38, 10, 5, 2, 224, 59, 40, 100, 155, 153, 139, 105, 146, 139, 135, 152, 104, 135, 152, 209};


//: forbidInteractivePop
Byte str_tingDuringBlackName[] = {62, 20, 77, 11, 152, 216, 203, 144, 52, 28, 1, 179, 188, 191, 175, 182, 177, 150, 187, 193, 178, 191, 174, 176, 193, 182, 195, 178, 157, 188, 189, 2};

// __DEBUG__
// __CLOSE_PRINT__
//
//  IndicatorHandler.m
//  NIM
//
//  Created by chris on 16/1/28.
//  Copyright © 2016年 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import "NTESNavigationHandler.h"
#import "IndicatorHandler.h"
//: #import "UIView+NTES.h"
#import "UIView+Status.h"
//: #import "NTESMainTabController.h"
#import "CutBarController.h"
//: #import "UIResponder+NTESFirstResponder.h"
#import "UIResponder+NameResponder.h"
//: #import "NTESNavigationAnimator.h"
#import "ComputerFilenameInformation.h"

//: @interface NTESNavigationHandler()<UIGestureRecognizerDelegate,NTESNavigationAnimatorDelegate>
@interface IndicatorHandler()<UIGestureRecognizerDelegate,TapTeam>

//: @property (nonatomic,strong) UIPercentDrivenInteractiveTransition* interaction;
@property (nonatomic,strong) UIPercentDrivenInteractiveTransition* interaction;

//: @property (nonatomic,weak) UINavigationController *navigationController;
@property (nonatomic,weak) UINavigationController *navigationController;

//: @property (nonatomic,strong) NTESNavigationAnimator *animator;
@property (nonatomic,strong) ComputerFilenameInformation *animator;

//: @property (nonatomic,assign) UINavigationControllerOperation currentOperation;
@property (nonatomic,assign) UINavigationControllerOperation currentOperation;

//: @property (nonatomic,strong) CAGradientLayer *uiPopShadow;
@property (nonatomic,strong) CAGradientLayer *uiPopShadow;

//: @property (nonatomic,assign) BOOL isAnimating;
@property (nonatomic,assign) BOOL isAnimating;

//: @end
@end

//: @implementation NTESNavigationHandler
@implementation IndicatorHandler

//: - (instancetype)initWithNavigationController:(UINavigationController *)navigationController
- (instancetype)initWithViewQuick:(UINavigationController *)navigationController
{
    //: self = [super init];
    self = [super init];
    //: if (self) {
    if (self) {
        //: _recognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
        _recognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(rendering:)];
        //: _recognizer.delegate = self;
        _recognizer.delegate = self;
        //: _recognizer.delaysTouchesBegan = NO;
        _recognizer.delaysTouchesBegan = NO;
        //: [navigationController.view addGestureRecognizer:_recognizer];
        [navigationController.view addGestureRecognizer:_recognizer];
        //: _animator = [[NTESNavigationAnimator alloc] initWithNavigationController:navigationController];
        _animator = [[ComputerFilenameInformation alloc] initWithSize:navigationController];
        //: _animator.delegate = self;
        _animator.delegate = self;
        //: _navigationController = navigationController;
        _navigationController = navigationController;

    }
    //: return self;
    return self;
}

//: - (void)pan:(UIPanGestureRecognizer*)recognizer
- (void)rendering:(UIPanGestureRecognizer*)recognizer
{
    //: UIView* view = recognizer.view;
    UIView* view = recognizer.view;
    //: switch (recognizer.state) {
    switch (recognizer.state) {
        //: case UIGestureRecognizerStateBegan:{
        case UIGestureRecognizerStateBegan:{
            //: CGPoint location = [recognizer locationInView:view];
            CGPoint location = [recognizer locationInView:view];
            //: if (location.x < CGRectGetMidX(view.bounds) && self.navigationController.viewControllers.count > 1) { 
            if (location.x < CGRectGetMidX(view.bounds) && self.navigationController.viewControllers.count > 1) { // left half
                //: self.interaction = [UIPercentDrivenInteractiveTransition new];
                self.interaction = [UIPercentDrivenInteractiveTransition new];
                //: [self.navigationController popViewControllerAnimated:NO];
                [self.navigationController popViewControllerAnimated:NO];
            }
        }
            //: break;
            break;
        //: case UIGestureRecognizerStateChanged:{
        case UIGestureRecognizerStateChanged:{
            //: CGPoint translation = [recognizer translationInView:view];
            CGPoint translation = [recognizer translationInView:view];
            //: CGFloat d = translation.x / view.width;
            CGFloat d = translation.x / view.width;
            //: [self.interaction updateInteractiveTransition:d];
            [self.interaction updateInteractiveTransition:d];
        }
            //: break;
            break;
        //: case UIGestureRecognizerStateEnded:
        case UIGestureRecognizerStateEnded:
        //: case UIGestureRecognizerStateCancelled:{
        case UIGestureRecognizerStateCancelled:{
            //: if ([recognizer locationInView:view].x > view.width * .5f) {
            if ([recognizer locationInView:view].x > view.width * .5f) {
                //: [self.interaction finishInteractiveTransition];
                [self.interaction finishInteractiveTransition];
            //: } else {
            } else {
                //: [self.interaction cancelInteractiveTransition];
                [self.interaction cancelInteractiveTransition];
            }
            //: self.interaction = nil;
            self.interaction = nil;
        }
            //: break;
            break;
        //: default:
        default:
            //: break;
            break;
    }
}

//: #pragma mark - UINavigationControllerDelegate
#pragma mark - UINavigationControllerDelegate
//: - (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    // 处理 TabBar 的显示/隐藏，只在 push 操作时处理
    //: if (self.currentOperation == UINavigationControllerOperationPush) {
    if (self.currentOperation == UINavigationControllerOperationPush) {
        //: NTESMainTabController *mainTabController = [NTESMainTabController instance];
        CutBarController *mainTabController = [CutBarController textInstance];
        //: if (mainTabController && viewController.hidesBottomBarWhenPushed) {
        if (mainTabController && viewController.hidesBottomBarWhenPushed) {
            //: [mainTabController hideTabBar];
            [mainTabController text];
        }
    }
}

//: - (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated
- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    // 处理 TabBar 的显示/隐藏
    //: NTESMainTabController *mainTabController = [NTESMainTabController instance];
    CutBarController *mainTabController = [CutBarController textInstance];
    //: if (!mainTabController) {
    if (!mainTabController) {
        //: return;
        return;
    }

    // 通过导航栈数量判断是否回到了根视图控制器
    //: if (navigationController.viewControllers.count == 1) {
    if (navigationController.viewControllers.count == 1) {
        // 如果当前只有一个控制器在栈中，说明回到了根视图
        //: [mainTabController showTabBar]; 
        [mainTabController message]; // 显示 TabBar
    //: } else if (self.currentOperation == UINavigationControllerOperationPush) {
    } else if (self.currentOperation == UINavigationControllerOperationPush) {
        // 处理 Push 操作，如果需要隐藏 TabBar 则隐藏
        //: if (viewController.hidesBottomBarWhenPushed) {
        if (viewController.hidesBottomBarWhenPushed) {
            //: [mainTabController hideTabBar];
            [mainTabController text];
        }
    }
}

//: - (nullable id <UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController
- (nullable id <UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController
                                   //: interactionControllerForAnimationController:(id <UIViewControllerAnimatedTransitioning>) animationController
                                   interactionControllerForAnimationController:(id <UIViewControllerAnimatedTransitioning>) animationController
{
    //: return self.interaction;
    return self.interaction;
}


//: - (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                            //: animationControllerForOperation:(UINavigationControllerOperation)operation
                                            animationControllerForOperation:(UINavigationControllerOperation)operation
                                                         //: fromViewController:(UIViewController *)fromVC
                                                         fromViewController:(UIViewController *)fromVC
                                                           //: toViewController:(UIViewController *)toVC
                                                           toViewController:(UIViewController *)toVC
{
    //: self.currentOperation = operation;
    self.currentOperation = operation;
    //: self.animator.currentOpearation = operation;
    self.animator.currentOpearation = operation;
    //: BOOL cross = [self isUseClearBar:fromVC] || [self isUseClearBar:toVC];
    BOOL cross = [self afterBar:fromVC] || [self afterBar:toVC];
    //: self.animator.animationType = cross ? NTESNavigationAnimationTypeCross : NTESNavigationAnimationTypeNormal;
    self.animator.animationType = cross ? NTESNavigationAnimationTypeCross : NTESNavigationAnimationTypeNormal;

    //: if (operation == UINavigationControllerOperationPop) {
    if (operation == UINavigationControllerOperationPop) {
        //: [fromVC.view.layer addSublayer:self.uiPopShadow];
        [fromVC.view.layer addSublayer:self.uiPopShadow];
    }
    //: return self.animator;
    return self.animator;
}

//: #pragma mark - UIGestureRecognizerDelegate
#pragma mark - UIGestureRecognizerDelegate

//: - (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    //: BOOL forbid = [self isForbidInteractivePop:self.navigationController.topViewController];
    BOOL forbid = [self information:self.navigationController.topViewController];
    //: if (forbid || self.isAnimating) {
    if (forbid || self.isAnimating) {
        //: return NO;
        return NO;
    }
    //: UIView* view = gestureRecognizer.view;
    UIView* view = gestureRecognizer.view;
    //: CGPoint location = [gestureRecognizer locationInView:view];
    CGPoint location = [gestureRecognizer locationInView:view];
    //: return location.x < 44.f;
    return location.x < 44.f;
}

//: - (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRequireFailureOfGestureRecognizer:(nonnull UIGestureRecognizer *)otherGestureRecognizer
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRequireFailureOfGestureRecognizer:(nonnull UIGestureRecognizer *)otherGestureRecognizer
{
    //: return [otherGestureRecognizer.view.superview isKindOfClass:[UITableView class]];
    return [otherGestureRecognizer.view.superview isKindOfClass:[UITableView class]];
}



//: #pragma mark - Get
#pragma mark - Get
//: - (CAGradientLayer *)uiPopShadow
- (CAGradientLayer *)uiPopShadow
{
    //: if (!_uiPopShadow) {
    if (!_uiPopShadow) {
        //: _uiPopShadow = [CAGradientLayer layer];
        _uiPopShadow = [CAGradientLayer layer];
        //: _uiPopShadow.frame = CGRectMake(-6, 0, 6, [NTESMainTabController instance].view.frame.size.height);
        _uiPopShadow.frame = CGRectMake(-6, 0, 6, [CutBarController textInstance].view.frame.size.height);
        //: _uiPopShadow.startPoint = CGPointMake(1.0, 0.5);
        _uiPopShadow.startPoint = CGPointMake(1.0, 0.5);
        //: _uiPopShadow.endPoint = CGPointMake(0, 0.5);
        _uiPopShadow.endPoint = CGPointMake(0, 0.5);
        //: _uiPopShadow.colors = [NSArray arrayWithObjects:(id)[[UIColor colorWithWhite:0.0 alpha:0.2f] CGColor], (id)[[UIColor clearColor] CGColor], nil];
        _uiPopShadow.colors = [NSArray arrayWithObjects:(id)[[UIColor colorWithWhite:0.0 alpha:0.2f] CGColor], (id)[[UIColor clearColor] CGColor], nil];
    }
    //: return _uiPopShadow;
    return _uiPopShadow;
}

//: #pragma mark - NTESNavigationAnimatorDelegate
#pragma mark - TapTeam
//: - (void)animationWillStart:(NTESNavigationAnimator *)animator
- (void)titleName:(ComputerFilenameInformation *)animator
{
    //: self.isAnimating = YES;
    self.isAnimating = YES;
}

//: - (void)animationDidEnd:(NTESNavigationAnimator *)animator
- (void)called:(ComputerFilenameInformation *)animator
{
    //: self.isAnimating = NO;
    self.isAnimating = NO;
}

//: #pragma mark - Private
#pragma mark - Private
//: - (BOOL)isUseClearBar:(UIViewController *)vc
- (BOOL)afterBar:(UIViewController *)vc
{
    //: SEL sel = NSSelectorFromString(@"useClearBar");
    SEL sel = NSSelectorFromString(StringFromAwarenessData(str_sizeValueData));
    //: BOOL use = NO;
    BOOL use = NO;
    //: if ([vc respondsToSelector:sel]) {
    if ([vc respondsToSelector:sel]) {
        //: SuppressPerformSelectorLeakWarning(use = (BOOL)[vc performSelector:sel]);
        SuppressPerformSelectorLeakWarning(use = (BOOL)[vc performSelector:sel]);
    }
    //: return use;
    return use;
}

//: - (BOOL)isForbidInteractivePop:(UIViewController *)vc{
- (BOOL)information:(UIViewController *)vc{
    //: SEL sel = NSSelectorFromString(@"forbidInteractivePop");
    SEL sel = NSSelectorFromString(StringFromAwarenessData(str_tingDuringBlackName));
    //: BOOL use = NO;
    BOOL use = NO;
    //: if ([vc respondsToSelector:sel]) {
    if ([vc respondsToSelector:sel]) {
        //: SuppressPerformSelectorLeakWarning(use = (BOOL)[vc performSelector:sel]);
        SuppressPerformSelectorLeakWarning(use = (BOOL)[vc performSelector:sel]);
    }
    //: return use;
    return use;
}

//: @end
@end

Byte * AwarenessDataToCache(Byte *data) {
    int susceptibleness = data[0];
    int worthToll = data[1];
    Byte mediaOftRefuge = data[2];
    int cowBadlyShared = data[3];
    if (!susceptibleness) return data + cowBadlyShared;
    for (int i = cowBadlyShared; i < cowBadlyShared + worthToll; i++) {
        int value = data[i] - mediaOftRefuge;
        if (value < 0) {
            value += 256;
        }
        data[i] = value;
    }
    data[0] = 0;
    data[cowBadlyShared + worthToll] = 0;
    return data + cowBadlyShared;
}

NSString *StringFromAwarenessData(Byte *data) {
    return [NSString stringWithUTF8String:(char *)AwarenessDataToCache(data)];
}
