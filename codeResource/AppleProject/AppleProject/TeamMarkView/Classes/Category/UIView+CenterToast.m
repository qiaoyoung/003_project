// __DEBUG__
// __CLOSE_PRINT__
//
//  UIView+CenterToast.m
// Indicator
//
//  Created by 丁文超 on 2020/3/19.
//  Copyright © 2020 NetEase. All rights reserved.
//

// __M_A_C_R_O__
//: #import "UIView+NIMToast.h"
#import "UIView+CenterToast.h"

//: @implementation UIView (NIMToast)
@implementation UIView (CenterToast)

//: - (void)nim_showToast:(NSString *)message duration:(CGFloat)duration
- (void)origin:(NSString *)message imageMessageDuration:(CGFloat)duration
{
    //: UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    //: label.textColor = UIColor.whiteColor;
    label.textColor = UIColor.whiteColor;
    //: label.text = message;
    label.text = message;
    //: label.backgroundColor = [UIColor.blackColor colorWithAlphaComponent:0.6];
    label.backgroundColor = [UIColor.blackColor colorWithAlphaComponent:0.6];
    //: label.layer.cornerRadius = 10;
    label.layer.cornerRadius = 10;
    //: label.layer.masksToBounds = YES;
    label.layer.masksToBounds = YES;
    //: label.textAlignment = NSTextAlignmentCenter;
    label.textAlignment = NSTextAlignmentCenter;
    //: label.font = [UIFont boldSystemFontOfSize:15];
    label.font = [UIFont boldSystemFontOfSize:15];

    //: CGFloat width = label.intrinsicContentSize.width+24;
    CGFloat width = label.intrinsicContentSize.width+24;
    //: CGFloat height = label.intrinsicContentSize.height+16;
    CGFloat height = label.intrinsicContentSize.height+16;
    //: label.frame = CGRectMake(self.bounds.size.width/2-width/2, self.bounds.size.height/2-height/2, width, height);
    label.frame = CGRectMake(self.bounds.size.width/2-width/2, self.bounds.size.height/2-height/2, width, height);

    //: [UIView transitionWithView:self
    [UIView transitionWithView:self
                      //: duration:0.3
                      duration:0.3
                       //: options:UIViewAnimationOptionTransitionCrossDissolve
                       options:UIViewAnimationOptionTransitionCrossDissolve
                    //: animations:^{
                    animations:^{
        //: [self addSubview:label];
        [self addSubview:label];
    //: } completion:nil];
    } completion:nil];

    //: dispatch_after(dispatch_time((0ull), (int64_t)(duration * 1000000000ull)), dispatch_get_main_queue(), ^{
    dispatch_after(dispatch_time((0ull), (int64_t)(duration * 1000000000ull)), dispatch_get_main_queue(), ^{
        //: [UIView transitionWithView:self
        [UIView transitionWithView:self
                          //: duration:0.3
                          duration:0.3
                           //: options:UIViewAnimationOptionTransitionCrossDissolve
                           options:UIViewAnimationOptionTransitionCrossDissolve
                        //: animations:^{
                        animations:^{
            //: [label removeFromSuperview];
            [label removeFromSuperview];
        //: } completion:nil];
        } completion:nil];

    //: });
    });
}

//: @end
@end