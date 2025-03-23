// __DEBUG__
// __CLOSE_PRINT__
//
//  SVProgressHUD+ZC.m
//  ZCAuctionCar
//
//  Created by 彭爽 on 2021/4/6.
//

// __M_A_C_R_O__
//: #import "SVProgressHUD+ZC.h"
#import "SVProgressHUD+ZC.h"
//: #import "CustomGifView.h"
#import "FlushView.h"

//: @implementation SVProgressHUD (ZC)
@implementation SVProgressHUD (ZC)

//: + (void)showMessage:(NSString *)message{
+ (void)aboveBroadcast:(NSString *)message{
    //: [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
    //: [SVProgressHUD setMinimumDismissTimeInterval:2];
    [SVProgressHUD setMinimumDismissTimeInterval:2];
    //: [SVProgressHUD showImage:[UIImage imageNamed:@""] status:message];
    [SVProgressHUD showImage:[UIImage imageNamed:@""] status:message];
}

//: + (void)showCustomGif:(NSData *)gifData {
+ (void)counterval:(NSData *)gifData {


    //: UIImage *gif = [UIImage sd_imageWithGIFData:gifData];
    UIImage *gif = [UIImage sd_imageWithGIFData:gifData];
//    FlushView *gifView = [[FlushView alloc] initWithGifData:gifData];
//    gifView.frame = CGRectMake(0, 0, 100, 100); // 设置所需的大小

    //: UIView *gifView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    UIView *gifView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];

    //: UIImageView *gifimg = [[UIImageView alloc]initWithFrame:gifView.bounds];
    UIImageView *gifimg = [[UIImageView alloc]initWithFrame:gifView.bounds];
    //: gifimg.image = gif;
    gifimg.image = gif;
    //: [gifView addSubview:gifimg];
    [gifView addSubview:gifimg];


    //: [SVProgressHUD setContainerView:gifView];
    [SVProgressHUD setContainerView:gifView];
    //: [SVProgressHUD show];
    [SVProgressHUD show];

}

//: @end
@end