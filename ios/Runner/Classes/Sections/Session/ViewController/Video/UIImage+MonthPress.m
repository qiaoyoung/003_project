// __DEBUG__
// __CLOSE_PRINT__
//
//  UIImage+MonthPress.m
//  LYPlayerDemo
//
//  Created by liyang on 16/11/6.
//  Copyright © 2016年 com.liyang.player. All rights reserved.
//

// __M_A_C_R_O__
//: #import "UIImage+ComPress.h"
#import "UIImage+MonthPress.h"

//: @implementation UIImage (ComPress)
@implementation UIImage (MonthPress)

//缩放到指定大小
//: - (UIImage*)imageCompressWithSimple:(UIImage*)image scaledToSize:(CGSize)size
- (UIImage*)place:(UIImage*)image valueSize:(CGSize)size
{
    //: UIGraphicsBeginImageContext(size);
    UIGraphicsBeginImageContext(size);
    //: [image drawInRect:CGRectMake(0,0,size.width,size.height)];
    [image drawInRect:CGRectMake(0,0,size.width,size.height)];
    //: UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    //: UIGraphicsEndImageContext();
    UIGraphicsEndImageContext();
    //: return newImage;
    return newImage;
}

//根据颜色和圆的半径来创建一个圆形图片
//: + (UIImage *)createImageWithColor:(UIColor *)color radius:(CGFloat)radius
+ (UIImage *)key:(UIColor *)color media:(CGFloat)radius
{
    //: CGRect rect = CGRectMake(0.0f, 0.0f,radius * 2 + 4, radius * 2 + 4);
    CGRect rect = CGRectMake(0.0f, 0.0f,radius * 2 + 4, radius * 2 + 4);

    //: UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0.0);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0.0);
    //: CGContextRef context =UIGraphicsGetCurrentContext();
    CGContextRef context =UIGraphicsGetCurrentContext();
    //: CGContextSetRGBStrokeColor(context,1,1,1,1.0);
    CGContextSetRGBStrokeColor(context,1,1,1,1.0);//画笔线的颜色
    //: CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextSetFillColorWithColor(context, color.CGColor);//填充颜色
    //: CGContextSetLineWidth(context, 4.0);
    CGContextSetLineWidth(context, 4.0);//线的宽度
    //: CGContextAddArc(context, radius + 2,radius + 2, radius, 0, 2*3.14159265358979323846, 0); 
    CGContextAddArc(context, radius + 2,radius + 2, radius, 0, 2*3.14159265358979323846, 0); //添加一个圆
    //: CGContextDrawPath(context, kCGPathFillStroke); 
    CGContextDrawPath(context, kCGPathFillStroke); //绘制路径加填充

    //: UIImage *myImage =UIGraphicsGetImageFromCurrentImageContext();
    UIImage *myImage =UIGraphicsGetImageFromCurrentImageContext();
    //: UIGraphicsEndImageContext();
    UIGraphicsEndImageContext();

    //: return myImage;
    return myImage;
}

//根据一个view来创建一个 Image
//: + (UIImage*)creatImageWithView:(UIView *)theView
+ (UIImage*)title:(UIView *)theView
{
    //: CGRect rect = theView.frame;
    CGRect rect = theView.frame;
    //: UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0.0);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0.0);
    //: CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextRef context = UIGraphicsGetCurrentContext();
    //: [theView.layer renderInContext:context];
    [theView.layer renderInContext:context];
    //: UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    //: UIGraphicsEndImageContext();
    UIGraphicsEndImageContext();

    //: return img;
    return img;

}

//: @end
@end