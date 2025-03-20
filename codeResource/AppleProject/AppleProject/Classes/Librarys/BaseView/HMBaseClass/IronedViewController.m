
#import <Foundation/Foundation.h>

NSString *StringFromParkSpeciallyData(Byte *data);


//: icon_empty_data
Byte str_prodValue[] = {41, 15, 10, 89, 136, 174, 186, 174, 187, 59, 97, 116, 97, 100, 95, 121, 116, 112, 109, 101, 95, 110, 111, 99, 105, 221};


//: No related content, try another word
Byte str_surgeonName[] = {71, 36, 10, 30, 206, 57, 118, 75, 38, 107, 100, 114, 111, 119, 32, 114, 101, 104, 116, 111, 110, 97, 32, 121, 114, 116, 32, 44, 116, 110, 101, 116, 110, 111, 99, 32, 100, 101, 116, 97, 108, 101, 114, 32, 111, 78, 125};


//: handleNavigationTransition:
Byte str_numberSwingName[] = {24, 27, 8, 109, 237, 7, 43, 246, 58, 110, 111, 105, 116, 105, 115, 110, 97, 114, 84, 110, 111, 105, 116, 97, 103, 105, 118, 97, 78, 101, 108, 100, 110, 97, 104, 123};


//: #F9F9F9
Byte str_combineScanContent[] = {28, 7, 8, 89, 217, 86, 117, 130, 57, 70, 57, 70, 57, 70, 35, 134};


//: #612CF9
Byte str_flavorParkData[] = {39, 7, 13, 239, 81, 39, 157, 144, 172, 250, 244, 195, 102, 57, 70, 67, 50, 49, 54, 35, 164};


//: _isTransitioning
Byte str_cartName[] = {6, 16, 12, 231, 102, 187, 30, 11, 225, 40, 131, 189, 103, 110, 105, 110, 111, 105, 116, 105, 115, 110, 97, 114, 84, 115, 105, 95, 249};


//: #875FFA
Byte str_bareName[] = {75, 7, 4, 87, 65, 70, 70, 53, 55, 56, 35, 239};

// __DEBUG__
// __CLOSE_PRINT__
//
//  IronedViewController.m
//  HuaxiajiaboApp
//
//  Created by HuamoMac on 15/4/20.
//  Copyright (c) 2015年 HuaMo. All rights reserved.
//

// __M_A_C_R_O__
//: #import "HMViewController.h"
#import "IronedViewController.h"

//: @implementation HMViewController
@implementation IronedViewController
//: @synthesize viewControllerDelegate = _viewControllerDelegate;
@synthesize viewControllerDelegate = _viewControllerDelegate;


//: - (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    //: self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    //: if (self) {
    if (self) {

    }
    //: return self;
    return self;
}

//: - (void)viewDidLoad {
- (void)viewDidLoad {
    //: [super viewDidLoad];
    [super viewDidLoad];
    //self.view.backgroundColor = CommonBGView_Color;
    //: self.view.backgroundColor = [UIColor colorWithHexString:@"#F9F9F9"];
    self.view.backgroundColor = [UIColor direction:StringFromParkSpeciallyData(str_combineScanContent)];

    //: self.navigationController.navigationBar.barTintColor = [UIColor colorWithPatternImage:[SNGradientHelper getLinearGradientImage:[UIColor colorWithHexString:@"#875FFA"] and:[UIColor colorWithHexString:@"#612CF9"] directionType:SNLinearGradientDirectionLevel]];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithPatternImage:[LandHelper title:[UIColor direction:StringFromParkSpeciallyData(str_bareName)] view:[UIColor direction:StringFromParkSpeciallyData(str_flavorParkData)] textGradientDirection:SNLinearGradientDirectionLevel]];
    //: [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont boldSystemFontOfSize:16]}];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont boldSystemFontOfSize:16]}];
}


//: #pragma - 系统返回手势改装
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
//: - (void)addFullScreenPopGesture{
- (void)full{
    // 获取系统自带滑动手势的target对象
    //: id target = self.navigationController.interactivePopGestureRecognizer.delegate;
    id target = self.navigationController.interactivePopGestureRecognizer.delegate;
    //: SEL action = NSSelectorFromString(@"handleNavigationTransition:");
    SEL action = NSSelectorFromString(StringFromParkSpeciallyData(str_numberSwingName));
    // 创建全屏滑动手势，调用系统自带滑动手势的target的action方法
    //: UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:target action:action];
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:target action:action];
    //: pan.delegate = self;
    pan.delegate = self;
    //: pan.maximumNumberOfTouches = 1;
    pan.maximumNumberOfTouches = 1;
    // 给导航控制器的view添加全屏滑动手势
    //: [self.navigationController.view addGestureRecognizer:pan];
    [self.navigationController.view addGestureRecognizer:pan];
}

/**
 注意
 */
//: - (void)enableFullScreenPopGesture:(BOOL)enable {
- (void)iconTo:(BOOL)enable {
    /************************/
//    //注意：暂时取消侧拉pop手势
//    for (UITapGestureRecognizer *gesture in self.navigationController.view.gestureRecognizers) {
//        
//        gesture.enabled = NO;
//        return;
//    }

    //如果只有系统返回手势，添加自定义手势
    //: if (self.navigationController.view.gestureRecognizers.count == 1) {
    if (self.navigationController.view.gestureRecognizers.count == 1) {
        //: [self addFullScreenPopGesture];
        [self full];
    }

    //: for (UITapGestureRecognizer *gesture in self.navigationController.view.gestureRecognizers) {
    for (UITapGestureRecognizer *gesture in self.navigationController.view.gestureRecognizers) {

        //: gesture.enabled = enable;
        gesture.enabled = enable;
    }
}

//: - (BOOL)gestureRecognizerShouldBegin:(UIPanGestureRecognizer *)gestureRecognizer{
- (BOOL)gestureRecognizerShouldBegin:(UIPanGestureRecognizer *)gestureRecognizer{
    //: if (self.navigationController.viewControllers.count <= 1) {
    if (self.navigationController.viewControllers.count <= 1) {
        //: return NO;
        return NO;
    }

    // Ignore pan gesture when the navigation controller is currently in transition.
    //: if ([[self.navigationController valueForKey:@"_isTransitioning"] boolValue]) {
    if ([[self.navigationController valueForKey:StringFromParkSpeciallyData(str_cartName)] boolValue]) {
        //: return NO;
        return NO;
    }

    // Prevent calling the handler when the gesture begins in an opposite direction.
    //: CGPoint translation = [gestureRecognizer translationInView:gestureRecognizer.view];
    CGPoint translation = [gestureRecognizer translationInView:gestureRecognizer.view];
    //: if (translation.x <= 0) {
    if (translation.x <= 0) {
        //: return NO;
        return NO;
    }

    //: return YES;
    return YES;
}


//: @end
@end



//: @implementation UIViewController (HM)
@implementation UIViewController (HM)


//: #pragma mark - empty view
#pragma mark - empty view

//: - (void)showEmptyView{
- (void)theFromScheme{
    //: [self showEmptyViewWithMessage:@"No related content, try another word"];
    [self serration:StringFromParkSpeciallyData(str_surgeonName)];
}

//: - (void)showEmptyViewWithMessage:(NSString *)message{
- (void)serration:(NSString *)message{
    //: [self showEmptyViewWithMessage:message inView:self.view];
    [self textOpenView:message name:self.view];
}


//: - (void)showEmptyViewWithImageName:(NSString *)imageName inView:(UIView *)inView{
- (void)showView:(NSString *)imageName shared:(UIView *)inView{
    //: [self showEmptyViewWithMessage:@"" inView:inView imageName:imageName];
    [self managerFalseName:@"" background:inView record:imageName];
}

//: - (void)showEmptyViewWithMessage:(NSString *)message inView:(UIView *)inView{
- (void)textOpenView:(NSString *)message name:(UIView *)inView{
    //: [self showEmptyViewWithMessage:message inView:inView imageName:@"icon_empty_data"];
    [self managerFalseName:message background:inView record:StringFromParkSpeciallyData(str_prodValue)];
}

//: - (void)showEmptyViewWithMessage:(NSString *)message inView:(UIView *)inView imageName:(NSString *)imageName{
- (void)managerFalseName:(NSString *)message background:(UIView *)inView record:(NSString *)imageName{
    //: UIView *emptyView= (UIView *)[inView viewWithTag:53333];
    UIView *emptyView= (UIView *)[inView viewWithTag:53333];
    //: if (!emptyView) {
    if (!emptyView) {
        //: emptyView = [[UIView alloc]init];
        emptyView = [[UIView alloc]init];
        //: emptyView.backgroundColor = [UIColor clearColor];
        emptyView.backgroundColor = [UIColor clearColor];
        //: emptyView.frame = CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height);
        emptyView.frame = CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height);
        //: emptyView.tag = 53333;
        emptyView.tag = 53333;

        //: UIImageView *emptyImage = [[UIImageView alloc]init];
        UIImageView *emptyImage = [[UIImageView alloc]init];
        //: emptyImage.frame = CGRectMake(([[UIScreen mainScreen] bounds].size.width-300)/2.0f, ([[UIScreen mainScreen] bounds].size.height-(44.0f + [UIDevice vg_statusBarHeight])-(({UIEdgeInsets i; if(@available(iOS 11.0, *)) {i = [[[UIApplication sharedApplication] delegate] window].safeAreaInsets;} else {i = UIEdgeInsetsZero;} i;}).bottom)-250)/2.0f, 300, 200);
        emptyImage.frame = CGRectMake(([[UIScreen mainScreen] bounds].size.width-300)/2.0f, ([[UIScreen mainScreen] bounds].size.height-(44.0f + [UIDevice task])-(({UIEdgeInsets i; if(@available(iOS 11.0, *)) {i = [[[UIApplication sharedApplication] delegate] window].safeAreaInsets;} else {i = UIEdgeInsetsZero;} i;}).bottom)-250)/2.0f, 300, 200);
        //: emptyImage.image = [UIImage imageNamed:imageName];
        emptyImage.image = [UIImage imageNamed:imageName];
        //: [emptyView addSubview:emptyImage];
        [emptyView addSubview:emptyImage];

        //: UILabel *emptyLabel = [[UILabel alloc] init];
        UILabel *emptyLabel = [[UILabel alloc] init];
        //: emptyLabel.frame = CGRectMake(40, 0, [[UIScreen mainScreen] bounds].size.width-80, 20);
        emptyLabel.frame = CGRectMake(40, 0, [[UIScreen mainScreen] bounds].size.width-80, 20);
        //: emptyLabel.backgroundColor = [UIColor clearColor];
        emptyLabel.backgroundColor = [UIColor clearColor];
        //: emptyLabel.textColor = [UIColor lightGrayColor];
        emptyLabel.textColor = [UIColor lightGrayColor];
        //: emptyLabel.textAlignment = NSTextAlignmentCenter;
        emptyLabel.textAlignment = NSTextAlignmentCenter;
        //: emptyLabel.font = [UIFont systemFontOfSize:13];
        emptyLabel.font = [UIFont systemFontOfSize:13];
        //: emptyLabel.text = message;
        emptyLabel.text = message;
        //: [emptyView addSubview:emptyLabel];
        [emptyView addSubview:emptyLabel];
//        [emptyLabel underView:emptyImage padding:8];
//        [emptyLabel verticalAllignment:emptyImage];

    }


    //emptyView.center = CGPointMake(inView.width/2.0, inView.height/2.0);
    //: [inView addSubview:emptyView];
    [inView addSubview:emptyView];
    //: [inView bringSubviewToFront:emptyView];
    [inView bringSubviewToFront:emptyView];
}

//: - (void)hideEmptyView{
- (void)provider{
    //: [self hideEmptyViewInView:self.view];
    [self send:self.view];
}
//: - (void)hideEmptyViewInView:(UIView *)view{
- (void)send:(UIView *)view{

    //: UIView *emptyView= (UIView *)[view viewWithTag:53333];
    UIView *emptyView= (UIView *)[view viewWithTag:53333];

    //: emptyView.hidden = YES;
    emptyView.hidden = YES;
    //: [emptyView removeFromSuperview];
    [emptyView removeFromSuperview];
}


//: #pragma mark - 网络异常时调用此方法
#pragma mark - 网络异常时调用此方法

//: - (BOOL)canShowNotNetView{
- (BOOL)nett{
    //: return NO;
    return NO;
}

//: - (void)refrushWithNotNet{
- (void)cell{


}





//: @end
@end

Byte * ParkSpeciallyDataToCache(Byte *data) {
    int flue = data[0];
    int sizeGoing = data[1];
    int gestureAttract = data[2];
    if (!flue) return data + gestureAttract;
    for (int i = 0; i < sizeGoing / 2; i++) {
        int begin = gestureAttract + i;
        int end = gestureAttract + sizeGoing - i - 1;
        Byte temp = data[begin];
        data[begin] = data[end];
        data[end] = temp;
    }
    data[0] = 0;
    data[gestureAttract + sizeGoing] = 0;
    return data + gestureAttract;
}

NSString *StringFromParkSpeciallyData(Byte *data) {
    return [NSString stringWithUTF8String:(char *)ParkSpeciallyDataToCache(data)];
}  
