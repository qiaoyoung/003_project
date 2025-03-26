// __DEBUG__
// __CLOSE_PRINT__
//
//  ChildViewController.h
//  Panda
//
//  Created by Huamo on 2018/11/6.
//  Copyright © 2018年 chen. All rights reserved.
//

// __M_A_C_R_O__
//: #import "HMViewController.h"
#import "IronedViewController.h"

//: NS_ASSUME_NONNULL_BEGIN
NS_ASSUME_NONNULL_BEGIN

//: @interface HMWebViewController : UIViewController{
@interface ChildViewController : UIViewController{

}
//: @property (nonatomic,strong) NSString *urlString;
@property (nonatomic,strong) NSString *urlString;
//: @property (nonatomic,strong) NSString *webTitle;
@property (nonatomic,strong) NSString *webTitle;
//: @property (nonatomic,copy) void(^complete)(void);
@property (nonatomic,copy) void(^complete)(void);

//: @end
@end

//: NS_ASSUME_NONNULL_END
NS_ASSUME_NONNULL_END