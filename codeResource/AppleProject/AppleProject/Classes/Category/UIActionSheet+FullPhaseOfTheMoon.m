// __DEBUG__
// __CLOSE_PRINT__
//
//  UIActionSheet+FullPhaseOfTheMoon.m
//  eim_iphone
//
//  Created by amao on 12-11-23.
//  Copyright (c) 2012年 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import "UIActionSheet+NTESBlock.h"
#import "UIActionSheet+FullPhaseOfTheMoon.h"
//: #import <objc/runtime.h>
#import <objc/runtime.h>

//: static char kUIActionSheetBlockAddress;
static char k_timeContent;


//: @implementation UIActionSheet (NTESBlock)
@implementation UIActionSheet (FullPhaseOfTheMoon)


//: - (void)showInView: (UIView *)view completionHandler: (ActionSheetBlock)block
- (void)circle: (UIView *)view shirtButton: (ActionSheetBlock)block
{
    //: self.delegate = self;
    self.delegate = self;
    //: objc_setAssociatedObject(self,&kUIActionSheetBlockAddress,block,OBJC_ASSOCIATION_COPY);
    objc_setAssociatedObject(self,&k_timeContent,block,OBJC_ASSOCIATION_COPY);

    //: if (view.window)
    if (view.window)
    {
        //: [self showInView:view];
        [self showInView:view];
    }
    //: else
    else
    {
        //: UITabBar *tabbar = [self tabbarForPresent];
        UITabBar *tabbar = [self array];
        //: if (tabbar)
        if (tabbar)
        {
            //: [self showFromTabBar:tabbar];
            [self showFromTabBar:tabbar];
        }
        //: else
        else
        {
            //如果出现嵌套调用,会出现当前view的window因为被UIActionSheet的attachedWindow出现而置为nil的情况
            //所以这种情况下先hack一下
            //: [self performSelector:@selector(showInView:)
            [self performSelector:@selector(informationned:)
                       //: withObject:view
                       withObject:view
                       //: afterDelay:1];
                       afterDelay:1];

        }
    }
}

//: - (UITabBar *)tabbarForPresent
- (UITabBar *)array
{
    //: UITabBar *bar = nil;
    UITabBar *bar = nil;
    //: UIInterfaceOrientation orientation = [[UIApplication sharedApplication] statusBarOrientation];
    UIInterfaceOrientation orientation = [[UIApplication sharedApplication] statusBarOrientation];
    //: if (UIInterfaceOrientationIsLandscape(orientation))
    if (UIInterfaceOrientationIsLandscape(orientation))
    {
        //: UIViewController *rootViewController= [[[UIApplication sharedApplication] keyWindow] rootViewController];
        UIViewController *rootViewController= [[[UIApplication sharedApplication] keyWindow] rootViewController];
        //: if ([rootViewController isKindOfClass:[UITabBarController class]])
        if ([rootViewController isKindOfClass:[UITabBarController class]])
        {
            //: bar = [(UITabBarController *)rootViewController tabBar];
            bar = [(UITabBarController *)rootViewController tabBar];
        }
    }
    //: return bar;
    return bar;
}

- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    //: ActionSheetBlock block = [objc_getAssociatedObject(self, &kUIActionSheetBlockAddress) copy];
    ActionSheetBlock block = [objc_getAssociatedObject(self, &k_timeContent) copy];
    //: objc_setAssociatedObject(self,&kUIActionSheetBlockAddress,nil,OBJC_ASSOCIATION_COPY);
    objc_setAssociatedObject(self,&k_timeContent,nil,OBJC_ASSOCIATION_COPY);
    //: dispatch_block_t dispatchBlock = ^(){
    dispatch_block_t dispatchBlock = ^(){
        //: if (block)
        if (block)
        {
            //: block(buttonIndex);
            block(buttonIndex);
        }
    //: };
    };
    //需要延迟的原因是actionsheet dismiss本身是个动画,如果在这种动画没完成的情况下直接调用present会导致两个切换冲突
    //这种情况在iOS5上最为明显
    //: dispatchBlock();
    dispatchBlock();
}


//: - (void)clearActionBlock
- (void)viewDoing
{
    //: self.delegate = nil;
    self.delegate = nil;
    //: objc_setAssociatedObject(self,&kUIActionSheetBlockAddress,nil,OBJC_ASSOCIATION_COPY);
    objc_setAssociatedObject(self,&k_timeContent,nil,OBJC_ASSOCIATION_COPY);
}


//: @end
@end
