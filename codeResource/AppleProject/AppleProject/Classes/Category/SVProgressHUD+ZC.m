//
//  SVProgressHUD+ZC.m
//  ZCAuctionCar
//
//  Created by 彭爽 on 2021/4/6.
//

#import "SVProgressHUD+ZC.h"
#import "CustomGifView.h"

@implementation SVProgressHUD (ZC)

+ (void)showMessage:(NSString *)message{
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
    [SVProgressHUD setMinimumDismissTimeInterval:2];
    [SVProgressHUD showImage:[UIImage imageNamed:@""] status:message];
}

+ (void)showCustomGif:(NSData *)gifData {
    

    UIImage *gif = [UIImage sd_imageWithGIFData:gifData];
//    CustomGifView *gifView = [[CustomGifView alloc] initWithGifData:gifData];
//    gifView.frame = CGRectMake(0, 0, 100, 100); // 设置所需的大小

    UIView *gifView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    
    UIImageView *gifimg = [[UIImageView alloc]initWithFrame:gifView.bounds];
    gifimg.image = gif;
    [gifView addSubview:gifimg];
    
   
    [SVProgressHUD setContainerView:gifView];
    [SVProgressHUD show];
    
}

@end
