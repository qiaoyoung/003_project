// __DEBUG__
// __CLOSE_PRINT__
//
//  IronedViewController.h
//  HuaxiajiaboApp
//
//  Created by HuamoMac on 15/4/20.
//  Copyright (c) 2015年 HuaMo. All rights reserved.
//

// __M_A_C_R_O__
//: #import <UIKit/UIKit.h>
#import <UIKit/UIKit.h>

//: @protocol HMViewControllerDelegate;
@protocol StatusDelegate;

//: @interface HMViewController : UIViewController <UIGestureRecognizerDelegate> {
@interface IronedViewController : UIViewController <UIGestureRecognizerDelegate> {
    //: __weak id<HMViewControllerDelegate> _viewControllerDelegate;
    __weak id<StatusDelegate> _viewControllerDelegate;
}
//: @property (nonatomic,weak) id<HMViewControllerDelegate> viewControllerDelegate;
@property (nonatomic,weak) id<StatusDelegate> viewControllerDelegate;


//系统返回手势改装
//: - (void)enableFullScreenPopGesture:(BOOL)enable;
- (void)iconTo:(BOOL)enable;

//: @end
@end




//: @protocol HMViewControllerDelegate <NSObject>
@protocol StatusDelegate <NSObject>

//: @optional
@optional
//: - (void)viewController:(HMViewController *)viewController key:(NSString *)key infomation:(id)infomation;
- (void)window:(IronedViewController *)viewController controller:(NSString *)key infomationUp:(id)infomation;

//: @end
@end




//: @interface UIViewController (HM)
@interface UIViewController (HM)

//: - (void)showEmptyView;
- (void)theFromScheme;
//: - (void)showEmptyViewWithMessage:(NSString *)message;
- (void)serration:(NSString *)message;
//: - (void)showEmptyViewWithImageName:(NSString *)imageName inView:(UIView *)inView;
- (void)showView:(NSString *)imageName shared:(UIView *)inView;
//: - (void)showEmptyViewWithMessage:(NSString *)message inView:(UIView *)inView;
- (void)textOpenView:(NSString *)message name:(UIView *)inView;
//: - (void)showEmptyViewWithMessage:(NSString *)message inView:(UIView *)inView imageName:(NSString *)imageName;
- (void)managerFalseName:(NSString *)message background:(UIView *)inView record:(NSString *)imageName;
//: - (void)hideEmptyViewInView:(UIView *)view;
- (void)send:(UIView *)view;
//: - (void)hideEmptyView;
- (void)provider;


/**
 子类重写，无网络的处理
 重写这个方法：无网络时，弹出无网络页面，点击刷新数据
 不重写：不会弹出无网络页面
 */
//: - (BOOL)canShowNotNetView;
- (BOOL)nett;
//: - (void)refrushWithNotNet;
- (void)cell;



//: @end
@end