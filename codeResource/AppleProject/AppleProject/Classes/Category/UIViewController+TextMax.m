
#import <Foundation/Foundation.h>
typedef struct {
    Byte dam;
    Byte *enterprise;
    unsigned int recto;
    bool franchiseBloc;
	int rule;
	int venetianBlind;
	int altogether;
} CedeData;

NSString *StringFromCedeData(CedeData *data);


//: back_arrow_bl
CedeData str_battleValue = (CedeData){231, (Byte []){133, 134, 132, 140, 184, 134, 149, 149, 136, 144, 184, 133, 139, 39}, 13, false, 51, 169, 221};


//: #612CF9
CedeData str_competitiveTitle = (CedeData){30, (Byte []){61, 40, 47, 44, 93, 88, 39, 4}, 7, false, 13, 233, 229};


//: #222222
CedeData str_elegantTitle = (CedeData){28, (Byte []){63, 46, 46, 46, 46, 46, 46, 82}, 7, false, 218, 175, 183};


//: #875FFA
CedeData str_overtContent = (CedeData){30, (Byte []){61, 38, 41, 43, 88, 88, 95, 249}, 7, false, 198, 175, 97};

// __DEBUG__
// __CLOSE_PRINT__
//
//  UIViewController+KIViewController.m
//  Kitalker
//
//  Created by chen on 12-7-28.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//
//#import "UIColor+KIAdditions.h"

// __M_A_C_R_O__
//: #import "UIViewController+KIAdditions.h"
#import "UIViewController+TextMax.h"

//: @implementation UIViewController (KIAdditions)
@implementation UIViewController (TextMax)


//: #pragma mark - nav bar 设置
#pragma mark - nav bar 设置

//: - (void)showCustomBackButton {
- (void)enableLine {
    //: [self showCustomBackButton:@selector(close)];
    [self customButton:@selector(voiceShow)];
}

//: - (void)showCustomBackButton:(SEL)selector {
- (void)customButton:(SEL)selector {
    //: [self setNavLeftItem:selector image:[UIImage imageNamed:@"back_arrow_bl"] imageH:nil];
    [self light:selector namePlace:[UIImage imageNamed:StringFromCedeData(&str_battleValue)] accountNumbereractH:nil];

}

//: - (void)setNavLeftItem:(SEL)selector image:(UIImage *)image imageH:(UIImage *)imageH {
- (void)light:(SEL)selector namePlace:(UIImage *)image accountNumbereractH:(UIImage *)imageH {

    //: UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    //: [backButton setImage:image forState:UIControlStateNormal];
    [backButton setImage:image forState:UIControlStateNormal];
    //: if (imageH) {
    if (imageH) {
        //: [backButton setImage:imageH forState:UIControlStateHighlighted];
        [backButton setImage:imageH forState:UIControlStateHighlighted];
    }
    //: [backButton setFrame:CGRectMake(0, 0, 50, 44)];
    [backButton setFrame:CGRectMake(0, 0, 50, 44)];
    //: backButton.backgroundColor = [UIColor clearColor];
    backButton.backgroundColor = [UIColor clearColor];
    //: backButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    backButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    //: [backButton addTarget:self action:selector forControlEvents:UIControlEventTouchUpInside];
    [backButton addTarget:self action:selector forControlEvents:UIControlEventTouchUpInside];
    //: UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    //: self.navigationItem.leftBarButtonItem = backItem;
    self.navigationItem.leftBarButtonItem = backItem;

}

//: - (void)setNavRightItem:(SEL)selector image:(UIImage *)image imageH:(UIImage *)imageH {
- (void)visualizationCustom:(SEL)selector centerItem:(UIImage *)image titleRedH:(UIImage *)imageH {
    //: UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    //: [backButton setImage:image forState:UIControlStateNormal];
    [backButton setImage:image forState:UIControlStateNormal];
    //: if (imageH) {
    if (imageH) {
        //: [backButton setImage:imageH forState:UIControlStateHighlighted];
        [backButton setImage:imageH forState:UIControlStateHighlighted];
    }
    //: [backButton setFrame:CGRectMake(0, 7, 30, 50)];
    [backButton setFrame:CGRectMake(0, 7, 30, 50)];
    //: backButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    backButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    //: [backButton addTarget:self action:selector forControlEvents:UIControlEventTouchUpInside];
    [backButton addTarget:self action:selector forControlEvents:UIControlEventTouchUpInside];
    //: UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    //: backItem.tintColor = [UIColor whiteColor];
    backItem.tintColor = [UIColor whiteColor];

    //: self.navigationItem.rightBarButtonItem = backItem;
    self.navigationItem.rightBarButtonItem = backItem;
}
//: -(void)setNavLeftItem:(SEL)selector title:(NSString *)title color:(UIColor *)color
-(void)untilUser:(SEL)selector image:(NSString *)title state:(UIColor *)color
{
    //: UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    //: [backButton setTitle:title forState:UIControlStateNormal];
    [backButton setTitle:title forState:UIControlStateNormal];
    //: [backButton setTitle:title forState:UIControlStateHighlighted];
    [backButton setTitle:title forState:UIControlStateHighlighted];
    //: [backButton setTitleColor:color forState:UIControlStateNormal];
    [backButton setTitleColor:color forState:UIControlStateNormal];
    //: [backButton setFrame:CGRectMake(0, 7, 70, 30)];
    [backButton setFrame:CGRectMake(0, 7, 70, 30)];
    //: backButton.titleLabel.font = [UIFont systemFontOfSize:16];
    backButton.titleLabel.font = [UIFont systemFontOfSize:16];
    //: [backButton setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
    [backButton setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
    //: [backButton addTarget:self action:selector forControlEvents:UIControlEventTouchUpInside];
    [backButton addTarget:self action:selector forControlEvents:UIControlEventTouchUpInside];
    //: UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    //: self.navigationItem.leftBarButtonItem = backItem;
    self.navigationItem.leftBarButtonItem = backItem;
}

//: -(void)setNavRightItem:(SEL)selector title:(NSString *)title color:(UIColor *)color
-(void)itemWith:(SEL)selector month:(NSString *)title selected:(UIColor *)color
{
    //: UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    //: [backButton setTitle:title forState:UIControlStateNormal];
    [backButton setTitle:title forState:UIControlStateNormal];
    //: [backButton setTitle:title forState:UIControlStateHighlighted];
    [backButton setTitle:title forState:UIControlStateHighlighted];
    //: [backButton setTitleColor:color forState:UIControlStateNormal];
    [backButton setTitleColor:color forState:UIControlStateNormal];
    //: [backButton setFrame:CGRectMake(0, 7, 70, 30)];
    [backButton setFrame:CGRectMake(0, 7, 70, 30)];
    //: backButton.titleLabel.font = [UIFont systemFontOfSize:15];
    backButton.titleLabel.font = [UIFont systemFontOfSize:15];
    //: [backButton setContentHorizontalAlignment:UIControlContentHorizontalAlignmentRight];
    [backButton setContentHorizontalAlignment:UIControlContentHorizontalAlignmentRight];
    //: [backButton addTarget:self action:selector forControlEvents:UIControlEventTouchUpInside];
    [backButton addTarget:self action:selector forControlEvents:UIControlEventTouchUpInside];
    //: UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    //: backItem.tintColor = [UIColor whiteColor];
    backItem.tintColor = [UIColor whiteColor];

    //: self.navigationItem.rightBarButtonItem = backItem;
    self.navigationItem.rightBarButtonItem = backItem;
}
//: - (void)setTitle:(NSString *)title {
- (void)setTitle:(NSString *)title {
    //: UILabel *titleLabel = (UILabel *)self.navigationItem.titleView;
    UILabel *titleLabel = (UILabel *)self.navigationItem.titleView;
    //: if (!titleLabel) {
    if (!titleLabel) {
        //: titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        //: [titleLabel setTextAlignment:NSTextAlignmentCenter];
        [titleLabel setTextAlignment:NSTextAlignmentCenter];
        //: [titleLabel setBackgroundColor:[UIColor clearColor]];
        [titleLabel setBackgroundColor:[UIColor clearColor]];
        //: [titleLabel setFont:[UIFont systemFontOfSize:18]];
        [titleLabel setFont:[UIFont systemFontOfSize:18]];
        //: [self.navigationItem setTitleView:titleLabel];
        [self.navigationItem setTitleView:titleLabel];

        //注意：防止rightBarButtonItem为nil，title被挤到右屏幕边缘显示
        //: if (!self.navigationItem.rightBarButtonItem) {
        if (!self.navigationItem.rightBarButtonItem) {
            //: UIView *fixedSpaceView = [[UIView alloc]init];
            UIView *fixedSpaceView = [[UIView alloc]init];
            //: fixedSpaceView.frame = CGRectMake(0, 7, 20, 50);
            fixedSpaceView.frame = CGRectMake(0, 7, 20, 50);
            //: UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:fixedSpaceView];
            UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:fixedSpaceView];
            //: self.navigationItem.rightBarButtonItem = backItem;
            self.navigationItem.rightBarButtonItem = backItem;
        }
    }
    //: [titleLabel setTextColor:[UIColor colorWithHexString:@"#222222"]];
    [titleLabel setTextColor:[UIColor direction:StringFromCedeData(&str_elegantTitle)]];
    //: [titleLabel setText:title];
    [titleLabel setText:title];
    //: [titleLabel sizeToFit];
    [titleLabel sizeToFit];


}

//: - (void)setTitleColor:(UIColor *)color{
- (void)setSet:(UIColor *)color{
    //: UILabel *titleLabel = (UILabel *)self.navigationItem.titleView;
    UILabel *titleLabel = (UILabel *)self.navigationItem.titleView;
    //: if (!titleLabel) {
    if (!titleLabel) {
        //: titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        //: [titleLabel setTextAlignment:NSTextAlignmentCenter];
        [titleLabel setTextAlignment:NSTextAlignmentCenter];
        //: [titleLabel setBackgroundColor:[UIColor clearColor]];
        [titleLabel setBackgroundColor:[UIColor clearColor]];
        //: [titleLabel setFont:[UIFont systemFontOfSize:20]];
        [titleLabel setFont:[UIFont systemFontOfSize:20]];
        //: [self.navigationItem setTitleView:titleLabel];
        [self.navigationItem setTitleView:titleLabel];
    }
    //: [titleLabel setTextColor:color];
    [titleLabel setTextColor:color];
}

//: - (void)setTitle:(NSString *)title titleColor:(UIColor *)color{
- (void)refresh:(NSString *)title rubric:(UIColor *)color{
    //: UILabel *titleLabel = (UILabel *)self.navigationItem.titleView;
    UILabel *titleLabel = (UILabel *)self.navigationItem.titleView;
    //: if (!titleLabel) {
    if (!titleLabel) {
        //: titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        //: [titleLabel setTextAlignment:NSTextAlignmentCenter];
        [titleLabel setTextAlignment:NSTextAlignmentCenter];
        //: [titleLabel setBackgroundColor:[UIColor clearColor]];
        [titleLabel setBackgroundColor:[UIColor clearColor]];
        //: [titleLabel setFont:[UIFont systemFontOfSize:20]];
        [titleLabel setFont:[UIFont systemFontOfSize:20]];
        //: [self.navigationItem setTitleView:titleLabel];
        [self.navigationItem setTitleView:titleLabel];
    }
    //: [titleLabel setTextColor:color];
    [titleLabel setTextColor:color];
    //: [titleLabel setText:title];
    [titleLabel setText:title];
}

//: #pragma mark - controller 控制
#pragma mark - controller 控制

//- (void)pushController:(UIViewController *)viewController {
//    [self pushController:viewController animated:YES];
//}

//- (void)pushController:(UIViewController *)viewController animated:(BOOL)animated {
//    if ([self isKindOfClass:[UINavigationController class]]) {
//        [(UINavigationController *)self pushViewController:viewController animated:animated];
//    } else if (self.navigationController != nil) {
//        [self.navigationController pushViewController:viewController animated:animated];
//    } else {
//        if (viewController == self) {
//            return ;
//        }
//
//        [viewController viewWillAppear:YES];
//        [self.view pushView:viewController.view completion:^(BOOL finished) {
//            [viewController viewDidAppear:YES];
//        }];
//    }
//}

//: - (void)popController {
- (void)redBottom {
    //: if ([self isKindOfClass:[UINavigationController class]]) {
    if ([self isKindOfClass:[UINavigationController class]]) {
        //: if ([self respondsToSelector:@selector(popViewControllerAnimated:)]) {
        if ([self respondsToSelector:@selector(popViewControllerAnimated:)]) {
            //: [(UINavigationController *)self popViewControllerAnimated:NO];
            [(UINavigationController *)self popViewControllerAnimated:NO];
        }
    }
    //: if (self.navigationController != nil) {
    if (self.navigationController != nil) {
        //: if ([self.navigationController respondsToSelector:@selector(popViewControllerAnimated:)]) {
        if ([self.navigationController respondsToSelector:@selector(popViewControllerAnimated:)]) {
            //: [self.navigationController popViewControllerAnimated:NO];
            [self.navigationController popViewControllerAnimated:NO];
        }

    //: } else {
    } else {
        //: [self viewWillDisappear:YES];
        [self viewWillDisappear:YES];
        //: [self.view popCompletion:^(BOOL finished) {
        [self.view tinkle:^(BOOL finished) {
            //: [self viewDidDisappear:YES];
            [self viewDidDisappear:YES];
        //: }];
        }];
    }
}


//: - (void)dismissModalController {
- (void)container {
    //: if (self.navigationController != nil) {
    if (self.navigationController != nil) {
        //: if ([self.navigationController respondsToSelector:@selector(dismissModalViewControllerAnimated:)]) {
        if ([self.navigationController respondsToSelector:@selector(dismissModalViewControllerAnimated:)]) {
            //: [self.navigationController dismissViewControllerAnimated:YES completion:^{
            [self.navigationController dismissViewControllerAnimated:YES completion:^{

            //: }];
            }];
        }
    //: } else {
    } else {
        //: if ([self respondsToSelector:@selector(dismissModalViewControllerAnimated:)]) {
        if ([self respondsToSelector:@selector(dismissModalViewControllerAnimated:)]) {
            //: [self.navigationController dismissViewControllerAnimated:YES completion:^{
            [self.navigationController dismissViewControllerAnimated:YES completion:^{

            //: }];
            }];
        }
    }
}


//: - (void)close {
- (void)voiceShow {
    //: [self dismissModalController];
    [self container];
    //: [self popController];
    [self redBottom];
}


//找到navbar底部的黑色线条
//: - (BOOL)findNavbarBottomLineUnder:(UIView *)view hide:(BOOL)hide{
- (BOOL)bottomColorHide:(UIView *)view crop:(BOOL)hide{
    //: UIView *line = [self findHairlineImageViewUnder:view];
    UIView *line = [self date:view];

    //: if (line) {
    if (line) {
        //: line.hidden = hide;
        line.hidden = hide;
        //: return YES;
        return YES;
    }

    //: return NO;
    return NO;
}

//: - (UIImageView *)findHairlineImageViewUnder:(UIView *)view
- (UIImageView *)date:(UIView *)view
{
    //: if ([view isKindOfClass:UIImageView.class] && view.bounds.size.height <= 1.0)
    if ([view isKindOfClass:UIImageView.class] && view.bounds.size.height <= 1.0)
    {
        //: return (UIImageView *)view;
        return (UIImageView *)view;
    }
    //: for (UIView *subview in view.subviews) {
    for (UIView *subview in view.subviews) {
        //: UIImageView *imageView = [self findHairlineImageViewUnder:subview];
        UIImageView *imageView = [self date:subview];
        //: if (imageView) {
        if (imageView) {
            //: return imageView;
            return imageView;
        }
    }
    //: return nil;
    return nil;
}


//: #pragma mark - navbar
#pragma mark - navbar

//: - (void)setNavBarBackGroundColor:(UIColor *)color{
- (void)setTempNim:(UIColor *)color{
    //: [self.navigationController.navigationBar setBackgroundImage:[SNGradientHelper getLinearGradientImage:[UIColor colorWithHexString:@"#875FFA"] and:[UIColor colorWithHexString:@"#612CF9"] directionType:SNLinearGradientDirectionLevel] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setBackgroundImage:[LandHelper title:[UIColor direction:StringFromCedeData(&str_overtContent)] view:[UIColor direction:StringFromCedeData(&str_competitiveTitle)] textGradientDirection:SNLinearGradientDirectionLevel] forBarMetrics:UIBarMetricsDefault];
    //: self.navigationController.navigationBar.shadowImage = [UIImage new];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    //: self.navigationController.navigationBar.translucent = YES;
    self.navigationController.navigationBar.translucent = YES;
}

//: - (void)setNavBarClearColor{
- (void)ting{
    //: [self.navigationController.navigationBar setBackgroundImage:[self imageWithColor:[UIColor clearColor]] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setBackgroundImage:[self smartTotaleract:[UIColor clearColor]] forBarMetrics:UIBarMetricsDefault];
    //: self.navigationController.navigationBar.shadowImage = [UIImage new];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    //: self.navigationController.navigationBar.translucent = YES;
    self.navigationController.navigationBar.translucent = YES;

}

//: - (void)setNavBarWithAlpha:(CGFloat)alpha{
- (void)setStatusWith:(CGFloat)alpha{

    //: self.navigationController.navigationBar.translucent = alpha<1.0;
    self.navigationController.navigationBar.translucent = alpha<1.0;
    //: [self.navigationController.navigationBar setBackgroundImage:[SNGradientHelper getLinearGradientImage:[UIColor colorWithHexString:@"#875FFA"] and:[UIColor colorWithHexString:@"#612CF9"] directionType:SNLinearGradientDirectionLevel] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setBackgroundImage:[LandHelper title:[UIColor direction:StringFromCedeData(&str_overtContent)] view:[UIColor direction:StringFromCedeData(&str_competitiveTitle)] textGradientDirection:SNLinearGradientDirectionLevel] forBarMetrics:UIBarMetricsDefault];

}

//: - (UIImage *)imageWithColor:(UIColor *)color{
- (UIImage *)smartTotaleract:(UIColor *)color{
    //: CGRect rect = CGRectMake(0, 0, 1, 1);
    CGRect rect = CGRectMake(0, 0, 1, 1);
    //: UIGraphicsBeginImageContext(rect.size);
    UIGraphicsBeginImageContext(rect.size);
    //: CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextRef context = UIGraphicsGetCurrentContext();
    //: [color setFill];
    [color setFill];
    //: CGContextFillRect(context, rect);
    CGContextFillRect(context, rect);
    //: UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    //: UIGraphicsEndImageContext();
    UIGraphicsEndImageContext();

    //: return image;
    return image;

}

//: - (void)setShadowClearColor{
- (void)recent{
}



//: @end
@end

Byte *CedeDataToByte(CedeData *data) {
    if (data->franchiseBloc) return data->enterprise;
    for (int i = 0; i < data->recto; i++) {
        data->enterprise[i] ^= data->dam;
    }
    data->enterprise[data->recto] = 0;
    data->franchiseBloc = true;
	if (data->recto >= 3) {
		data->rule = data->enterprise[0];
		data->venetianBlind = data->enterprise[1];
		data->altogether = data->enterprise[2];
	}
    return data->enterprise;
}

NSString *StringFromCedeData(CedeData *data) {
    return [NSString stringWithUTF8String:(char *)CedeDataToByte(data)];
}
