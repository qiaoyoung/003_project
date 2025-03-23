
#import <Foundation/Foundation.h>
typedef struct {
    Byte goalMathematicMarble;
    Byte *wasteExcited;
    unsigned int hareEye;
    bool weekendRide;
	int byScheme;
} HelpData;

NSString *StringFromHelpData(HelpData *data);


//: center
HelpData str_chickenWipeName = (HelpData){173, (Byte []){206, 200, 195, 217, 200, 223, 194}, 6, false, 118};


//: frame
HelpData str_goalTitle = (HelpData){195, (Byte []){165, 177, 162, 174, 166, 134}, 5, false, 102};

// __DEBUG__
// __CLOSE_PRINT__
//
//  WithInputView.m
//  TKImageDemo
//
//  Created by yinyu on 16/7/10.
//  Copyright © 2016年 yinyu. All rights reserved.
//

// __M_A_C_R_O__
//: #import "TKImageView.h"
#import "WithInputView.h"

//: typedef NS_ENUM(NSInteger, TKCropAreaCornerPosition) {
typedef NS_ENUM(NSInteger, TKCropAreaCornerPosition) {
    //: TKCropAreaCornerPositionTopLeft,
    TKCropAreaCornerPositionTopLeft,
    //: TKCropAreaCornerPositionTopRight,
    TKCropAreaCornerPositionTopRight,
    //: TKCropAreaCornerPositionBottomLeft,
    TKCropAreaCornerPositionBottomLeft,
    //: TKCropAreaCornerPositionBottomRight
    TKCropAreaCornerPositionBottomRight
//: };
};
//: typedef NS_ENUM(NSInteger, TKMidLineType) {
typedef NS_ENUM(NSInteger, TKMidLineType) {

    //: TKMidLineTypeTop,
    TKMidLineTypeTop,
    //: TKMidLineTypeBottom,
    TKMidLineTypeBottom,
    //: TKMidLineTypeLeft,
    TKMidLineTypeLeft,
    //: TKMidLineTypeRight
    TKMidLineTypeRight

//: };
};
//: @interface UIImage(Handler)
@interface UIImage(Handler)
//: @end
@end
//: @implementation UIImage(Handler)
@implementation UIImage(Handler)
//Fix image's rotation
//: - (UIImage *)fixOrientation {
- (UIImage *)person {

    //: if (self.imageOrientation == UIImageOrientationUp)
    if (self.imageOrientation == UIImageOrientationUp)
        //: return self;
        return self;

    //: CGAffineTransform transform = CGAffineTransformIdentity;
    CGAffineTransform transform = CGAffineTransformIdentity;

    //: switch (self.imageOrientation) {
    switch (self.imageOrientation) {
        //: case UIImageOrientationDown:
        case UIImageOrientationDown:
        //: case UIImageOrientationDownMirrored:
        case UIImageOrientationDownMirrored:
            //: transform = CGAffineTransformTranslate(transform, self.size.width, self.size.height);
            transform = CGAffineTransformTranslate(transform, self.size.width, self.size.height);
            //: transform = CGAffineTransformRotate(transform, 3.14159265358979323846264338327950288);
            transform = CGAffineTransformRotate(transform, 3.14159265358979323846264338327950288);
            //: break;
            break;

        //: case UIImageOrientationLeft:
        case UIImageOrientationLeft:
        //: case UIImageOrientationLeftMirrored:
        case UIImageOrientationLeftMirrored:
            //: transform = CGAffineTransformTranslate(transform, self.size.width, 0);
            transform = CGAffineTransformTranslate(transform, self.size.width, 0);
            //: transform = CGAffineTransformRotate(transform, 1.57079632679489661923132169163975144);
            transform = CGAffineTransformRotate(transform, 1.57079632679489661923132169163975144);
            //: break;
            break;

        //: case UIImageOrientationRight:
        case UIImageOrientationRight:
        //: case UIImageOrientationRightMirrored:
        case UIImageOrientationRightMirrored:
            //: transform = CGAffineTransformTranslate(transform, 0, self.size.height);
            transform = CGAffineTransformTranslate(transform, 0, self.size.height);
            //: transform = CGAffineTransformRotate(transform, -1.57079632679489661923132169163975144);
            transform = CGAffineTransformRotate(transform, -1.57079632679489661923132169163975144);
            //: break;
            break;
        //: default:
        default:
            //: break;
            break;
    }
    //: switch (self.imageOrientation) {
    switch (self.imageOrientation) {
        //: case UIImageOrientationUpMirrored:
        case UIImageOrientationUpMirrored:
        //: case UIImageOrientationDownMirrored:
        case UIImageOrientationDownMirrored:
            //: transform = CGAffineTransformTranslate(transform, self.size.width, 0);
            transform = CGAffineTransformTranslate(transform, self.size.width, 0);
            //: transform = CGAffineTransformScale(transform, -1, 1);
            transform = CGAffineTransformScale(transform, -1, 1);
            //: break;
            break;

        //: case UIImageOrientationLeftMirrored:
        case UIImageOrientationLeftMirrored:
        //: case UIImageOrientationRightMirrored:
        case UIImageOrientationRightMirrored:
            //: transform = CGAffineTransformTranslate(transform, self.size.height, 0);
            transform = CGAffineTransformTranslate(transform, self.size.height, 0);
            //: transform = CGAffineTransformScale(transform, -1, 1);
            transform = CGAffineTransformScale(transform, -1, 1);
            //: break;
            break;
        //: default:
        default:
            //: break;
            break;
    }
    //: CGContextRef ctx = CGBitmapContextCreate(NULL, self.size.width, self.size.height,
    CGContextRef ctx = CGBitmapContextCreate(NULL, self.size.width, self.size.height,
                                             //: CGImageGetBitsPerComponent(self.CGImage), 0,
                                             CGImageGetBitsPerComponent(self.CGImage), 0,
                                             //: CGImageGetColorSpace(self.CGImage),
                                             CGImageGetColorSpace(self.CGImage),
                                             //: CGImageGetBitmapInfo(self.CGImage));
                                             CGImageGetBitmapInfo(self.CGImage));
    //: CGContextConcatCTM(ctx, transform);
    CGContextConcatCTM(ctx, transform);
    //: switch (self.imageOrientation) {
    switch (self.imageOrientation) {
        //: case UIImageOrientationLeft:
        case UIImageOrientationLeft:
        //: case UIImageOrientationLeftMirrored:
        case UIImageOrientationLeftMirrored:
        //: case UIImageOrientationRight:
        case UIImageOrientationRight:
        //: case UIImageOrientationRightMirrored:
        case UIImageOrientationRightMirrored:
            //: CGContextDrawImage(ctx, CGRectMake(0,0,self.size.height,self.size.width), self.CGImage);
            CGContextDrawImage(ctx, CGRectMake(0,0,self.size.height,self.size.width), self.CGImage);
            //: break;
            break;

        //: default:
        default:
            //: CGContextDrawImage(ctx, CGRectMake(0,0,self.size.width,self.size.height), self.CGImage);
            CGContextDrawImage(ctx, CGRectMake(0,0,self.size.width,self.size.height), self.CGImage);
            //: break;
            break;
    }
    //: CGImageRef cgimg = CGBitmapContextCreateImage(ctx);
    CGImageRef cgimg = CGBitmapContextCreateImage(ctx);
    //: UIImage *img = [UIImage imageWithCGImage:cgimg];
    UIImage *img = [UIImage imageWithCGImage:cgimg];
    //: CGContextRelease(ctx);
    CGContextRelease(ctx);
    //: CGImageRelease(cgimg);
    CGImageRelease(cgimg);
    //: return img;
    return img;

}
//: - (UIImage *)imageAtRect:(CGRect)rect
- (UIImage *)range:(CGRect)rect
{

    //: UIImage *fixedImage = [self fixOrientation];
    UIImage *fixedImage = [self person];
    //: CGImageRef imageRef = CGImageCreateWithImageInRect([fixedImage CGImage], rect);
    CGImageRef imageRef = CGImageCreateWithImageInRect([fixedImage CGImage], rect);
    //: UIImage* subImage = [UIImage imageWithCGImage: imageRef];
    UIImage* subImage = [UIImage imageWithCGImage: imageRef];
    //: CGImageRelease(imageRef);
    CGImageRelease(imageRef);

    //: return subImage;
    return subImage;

}
//: @end
@end
//: @interface CornerView: UIView
@interface MaxNameView: UIView

//: @property (assign, nonatomic) CGFloat lineWidth;
@property (assign, nonatomic) CGFloat lineWidth;
//: @property (strong, nonatomic) UIColor *lineColor;
@property (strong, nonatomic) UIColor *lineColor;
//: @property (assign, nonatomic) TKCropAreaCornerPosition cornerPosition;
@property (assign, nonatomic) TKCropAreaCornerPosition cornerPosition;
//: @property (assign, nonatomic) CornerView *relativeViewX;
@property (assign, nonatomic) MaxNameView *relativeViewX;
//: @property (assign, nonatomic) CornerView *relativeViewY;
@property (assign, nonatomic) MaxNameView *relativeViewY;
//: @property (strong, nonatomic) CAShapeLayer *cornerShapeLayer;
@property (strong, nonatomic) CAShapeLayer *cornerShapeLayer;

//: - (void)updateSizeWithWidth: (CGFloat)width height: (CGFloat)height;
- (void)languageHeight: (CGFloat)width key: (CGFloat)height;
//: @end
@end
//: @implementation CornerView
@implementation MaxNameView
//: - (instancetype)initWithFrame:(CGRect)frame lineColor: (UIColor *)lineColor lineWidth: (CGFloat)lineWidth {
- (instancetype)initWithBlue:(CGRect)frame than: (UIColor *)lineColor searched: (CGFloat)lineWidth {

    //: self = [super initWithFrame: frame];
    self = [super initWithFrame: frame];
    //: if(self) {
    if(self) {
        //: self.lineColor = lineColor;
        self.lineColor = lineColor;
        //: self.lineWidth = lineWidth;
        self.lineWidth = lineWidth;
    }
    //: return self;
    return self;
}
//: - (void)setCornerPosition:(TKCropAreaCornerPosition)cornerPosition {
- (void)setCornerPosition:(TKCropAreaCornerPosition)cornerPosition {

    //: _cornerPosition = cornerPosition;
    _cornerPosition = cornerPosition;
    //: [self drawCornerLines];
    [self on];

}
//: - (void)setLineWidth:(CGFloat)lineWidth {
- (void)setLineWidth:(CGFloat)lineWidth {

    //: _lineWidth = lineWidth;
    _lineWidth = lineWidth;
    //: [self drawCornerLines];
    [self on];

}
//: - (void)drawCornerLines {
- (void)on {

    //: if(_cornerShapeLayer && _cornerShapeLayer.superlayer) {
    if(_cornerShapeLayer && _cornerShapeLayer.superlayer) {
        //: [_cornerShapeLayer removeFromSuperlayer];
        [_cornerShapeLayer removeFromSuperlayer];
    }
    //: _cornerShapeLayer = [CAShapeLayer layer];
    _cornerShapeLayer = [CAShapeLayer layer];
    //: _cornerShapeLayer.lineWidth = _lineWidth;
    _cornerShapeLayer.lineWidth = _lineWidth;
    //: _cornerShapeLayer.strokeColor = _lineColor.CGColor;
    _cornerShapeLayer.strokeColor = _lineColor.CGColor;
    //: _cornerShapeLayer.fillColor = [UIColor clearColor].CGColor;
    _cornerShapeLayer.fillColor = [UIColor clearColor].CGColor;

    //: UIBezierPath *cornerPath = [UIBezierPath bezierPath];
    UIBezierPath *cornerPath = [UIBezierPath bezierPath];
    //: CGFloat paddingX = _lineWidth / 2.0f;
    CGFloat paddingX = _lineWidth / 2.0f;
    //: CGFloat paddingY = _lineWidth / 2.0f;
    CGFloat paddingY = _lineWidth / 2.0f;
    //: switch (_cornerPosition) {
    switch (_cornerPosition) {
        //: case TKCropAreaCornerPositionTopLeft: {
        case TKCropAreaCornerPositionTopLeft: {
            //: [cornerPath moveToPoint:CGPointMake(CGRectGetWidth(self.bounds), paddingY)];
            [cornerPath moveToPoint:CGPointMake(CGRectGetWidth(self.bounds), paddingY)];
            //: [cornerPath addLineToPoint:CGPointMake(paddingX, paddingY)];
            [cornerPath addLineToPoint:CGPointMake(paddingX, paddingY)];
            //: [cornerPath addLineToPoint:CGPointMake(paddingX, CGRectGetHeight(self.bounds))];
            [cornerPath addLineToPoint:CGPointMake(paddingX, CGRectGetHeight(self.bounds))];
            //: break;
            break;
        }
        //: case TKCropAreaCornerPositionTopRight: {
        case TKCropAreaCornerPositionTopRight: {
            //: [cornerPath moveToPoint:CGPointMake(0, paddingY)];
            [cornerPath moveToPoint:CGPointMake(0, paddingY)];
            //: [cornerPath addLineToPoint:CGPointMake(CGRectGetWidth(self.bounds) - paddingX, paddingY)];
            [cornerPath addLineToPoint:CGPointMake(CGRectGetWidth(self.bounds) - paddingX, paddingY)];
            //: [cornerPath addLineToPoint:CGPointMake(CGRectGetWidth(self.bounds) - paddingX, CGRectGetHeight(self.bounds))];
            [cornerPath addLineToPoint:CGPointMake(CGRectGetWidth(self.bounds) - paddingX, CGRectGetHeight(self.bounds))];
            //: break;
            break;
        }
        //: case TKCropAreaCornerPositionBottomLeft: {
        case TKCropAreaCornerPositionBottomLeft: {
            //: [cornerPath moveToPoint:CGPointMake(paddingX, 0)];
            [cornerPath moveToPoint:CGPointMake(paddingX, 0)];
            //: [cornerPath addLineToPoint:CGPointMake(paddingX, CGRectGetHeight(self.bounds) - paddingY)];
            [cornerPath addLineToPoint:CGPointMake(paddingX, CGRectGetHeight(self.bounds) - paddingY)];
            //: [cornerPath addLineToPoint:CGPointMake(CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds) - paddingY)];
            [cornerPath addLineToPoint:CGPointMake(CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds) - paddingY)];
            //: break;
            break;
        }
        //: case TKCropAreaCornerPositionBottomRight: {
        case TKCropAreaCornerPositionBottomRight: {
            //: [cornerPath moveToPoint:CGPointMake(CGRectGetWidth(self.bounds) - paddingX, 0)];
            [cornerPath moveToPoint:CGPointMake(CGRectGetWidth(self.bounds) - paddingX, 0)];
            //: [cornerPath addLineToPoint:CGPointMake(CGRectGetWidth(self.bounds) - paddingX, CGRectGetHeight(self.bounds) - paddingY)];
            [cornerPath addLineToPoint:CGPointMake(CGRectGetWidth(self.bounds) - paddingX, CGRectGetHeight(self.bounds) - paddingY)];
            //: [cornerPath addLineToPoint:CGPointMake(0, CGRectGetHeight(self.bounds) - paddingY)];
            [cornerPath addLineToPoint:CGPointMake(0, CGRectGetHeight(self.bounds) - paddingY)];
            //: break;
            break;
        }
        //: default:
        default:
            //: break;
            break;
    }
    //: _cornerShapeLayer.path = cornerPath.CGPath;
    _cornerShapeLayer.path = cornerPath.CGPath;
    //: [self.layer addSublayer: _cornerShapeLayer];
    [self.layer addSublayer: _cornerShapeLayer];

}
//: - (void)updateSizeWithWidth: (CGFloat)width height: (CGFloat)height {
- (void)languageHeight: (CGFloat)width key: (CGFloat)height {

    //: switch (_cornerPosition) {
    switch (_cornerPosition) {
        //: case TKCropAreaCornerPositionTopLeft: {
        case TKCropAreaCornerPositionTopLeft: {
            //: self.frame = CGRectMake(CGRectGetMinX(self.frame), CGRectGetMinY(self.frame), width, height);
            self.frame = CGRectMake(CGRectGetMinX(self.frame), CGRectGetMinY(self.frame), width, height);
            //: break;
            break;
        }
        //: case TKCropAreaCornerPositionTopRight: {
        case TKCropAreaCornerPositionTopRight: {
            //: self.frame = CGRectMake(CGRectGetMaxX(self.frame) - width, CGRectGetMinY(self.frame), width, height);
            self.frame = CGRectMake(CGRectGetMaxX(self.frame) - width, CGRectGetMinY(self.frame), width, height);
            //: break;
            break;
        }
        //: case TKCropAreaCornerPositionBottomLeft: {
        case TKCropAreaCornerPositionBottomLeft: {
            //: self.frame = CGRectMake(CGRectGetMinX(self.frame), CGRectGetMaxY(self.frame) - height, width, height);
            self.frame = CGRectMake(CGRectGetMinX(self.frame), CGRectGetMaxY(self.frame) - height, width, height);
            //: break;
            break;
        }
        //: case TKCropAreaCornerPositionBottomRight: {
        case TKCropAreaCornerPositionBottomRight: {
            //: self.frame = CGRectMake(CGRectGetMaxX(self.frame) - width, CGRectGetMaxY(self.frame) - height, width, height);
            self.frame = CGRectMake(CGRectGetMaxX(self.frame) - width, CGRectGetMaxY(self.frame) - height, width, height);
            //: break;
            break;
        }
        //: default:
        default:
            //: break;
            break;
    }
    //: [self drawCornerLines];
    [self on];

}
//: - (void)setLineColor:(UIColor *)lineColor {
- (void)setLineColor:(UIColor *)lineColor {

    //: _lineColor = lineColor;
    _lineColor = lineColor;
    //: _cornerShapeLayer.strokeColor = lineColor.CGColor;
    _cornerShapeLayer.strokeColor = lineColor.CGColor;

}
//: @end
@end

//: @interface MidLineView : UIView
@interface OnView : UIView
//: @property (strong, nonatomic) CAShapeLayer *lineLayer;
@property (strong, nonatomic) CAShapeLayer *lineLayer;
//: @property (assign, nonatomic) CGFloat lineWidth;
@property (assign, nonatomic) CGFloat lineWidth;
//: @property (assign, nonatomic) CGFloat lineHeight;
@property (assign, nonatomic) CGFloat lineHeight;
//: @property (strong, nonatomic) UIColor *lineColor;
@property (strong, nonatomic) UIColor *lineColor;
//: @property (assign, nonatomic) TKMidLineType type;
@property (assign, nonatomic) TKMidLineType type;
//: @end
@end
//: @implementation MidLineView
@implementation OnView
//: - (instancetype)initWithLineWidth: (CGFloat)lineWidth lineHeight: (CGFloat)lineHeight lineColor: (UIColor *)lineColor {
- (instancetype)initWithTeam: (CGFloat)lineWidth reloadity: (CGFloat)lineHeight lineBubble: (UIColor *)lineColor {

    //: self = [super initWithFrame: CGRectMake(0, 0, 44, 44)];
    self = [super initWithFrame: CGRectMake(0, 0, 44, 44)];
    //: if(self) {
    if(self) {
        //: self.lineWidth = lineWidth;
        self.lineWidth = lineWidth;
        //: self.lineHeight = lineHeight;
        self.lineHeight = lineHeight;
        //: self.lineColor = lineColor;
        self.lineColor = lineColor;
    }
    //: return self;
    return self;

}
//: - (void)setType:(TKMidLineType)type {
- (void)setType:(TKMidLineType)type {

    //: _type = type;
    _type = type;
    //: [self drawMidLine];
    [self ting];

}
//: - (void)setLineWidth:(CGFloat)lineWidth {
- (void)setLineWidth:(CGFloat)lineWidth {

    //: _lineWidth = lineWidth;
    _lineWidth = lineWidth;
    //: [self drawMidLine];
    [self ting];

}
//: - (void)setLineColor:(UIColor *)lineColor {
- (void)setLineColor:(UIColor *)lineColor {

    //: _lineColor = lineColor;
    _lineColor = lineColor;
    //: _lineLayer.strokeColor = lineColor.CGColor;
    _lineLayer.strokeColor = lineColor.CGColor;

}
//: - (void)setLineHeight:(CGFloat)lineHeight {
- (void)setLineHeight:(CGFloat)lineHeight {

    //: _lineHeight = lineHeight;
    _lineHeight = lineHeight;
    //: _lineLayer.lineWidth = lineHeight;
    _lineLayer.lineWidth = lineHeight;

}
//: - (void)drawMidLine {
- (void)ting {

    //: if(_lineLayer && _lineLayer.superlayer) {
    if(_lineLayer && _lineLayer.superlayer) {
        //: [_lineLayer removeFromSuperlayer];
        [_lineLayer removeFromSuperlayer];
    }
    //: _lineLayer = [CAShapeLayer layer];
    _lineLayer = [CAShapeLayer layer];
    //: _lineLayer.strokeColor = _lineColor.CGColor;
    _lineLayer.strokeColor = _lineColor.CGColor;
    //: _lineLayer.lineWidth = _lineHeight;
    _lineLayer.lineWidth = _lineHeight;
    //: _lineLayer.fillColor = [UIColor clearColor].CGColor;
    _lineLayer.fillColor = [UIColor clearColor].CGColor;

    //: UIBezierPath *midLinePath = [UIBezierPath bezierPath];
    UIBezierPath *midLinePath = [UIBezierPath bezierPath];
    //: switch (_type) {
    switch (_type) {
        //: case TKMidLineTypeTop:
        case TKMidLineTypeTop:
        //: case TKMidLineTypeBottom: {
        case TKMidLineTypeBottom: {
            //: [midLinePath moveToPoint:CGPointMake((CGRectGetWidth(self.bounds) - _lineWidth) / 2.0, CGRectGetHeight(self.bounds) / 2.0)];
            [midLinePath moveToPoint:CGPointMake((CGRectGetWidth(self.bounds) - _lineWidth) / 2.0, CGRectGetHeight(self.bounds) / 2.0)];
            //: [midLinePath addLineToPoint:CGPointMake((CGRectGetWidth(self.bounds) + _lineWidth) / 2.0, CGRectGetHeight(self.bounds) / 2.0)];
            [midLinePath addLineToPoint:CGPointMake((CGRectGetWidth(self.bounds) + _lineWidth) / 2.0, CGRectGetHeight(self.bounds) / 2.0)];
            //: break;
            break;
        }
        //: case TKMidLineTypeRight:
        case TKMidLineTypeRight:
        //: case TKMidLineTypeLeft: {
        case TKMidLineTypeLeft: {
            //: [midLinePath moveToPoint:CGPointMake(CGRectGetWidth(self.bounds) / 2.0, (CGRectGetHeight(self.bounds) - _lineWidth) / 2.0)];
            [midLinePath moveToPoint:CGPointMake(CGRectGetWidth(self.bounds) / 2.0, (CGRectGetHeight(self.bounds) - _lineWidth) / 2.0)];
            //: [midLinePath addLineToPoint:CGPointMake(CGRectGetWidth(self.bounds) / 2.0, (CGRectGetHeight(self.bounds) + _lineWidth) / 2.0)];
            [midLinePath addLineToPoint:CGPointMake(CGRectGetWidth(self.bounds) / 2.0, (CGRectGetHeight(self.bounds) + _lineWidth) / 2.0)];
            //: break;
            break;
        }
        //: default:
        default:
            //: break;
            break;
    }
    //: _lineLayer.path = midLinePath.CGPath;
    _lineLayer.path = midLinePath.CGPath;
    //: [self.layer addSublayer: _lineLayer];
    [self.layer addSublayer: _lineLayer];

}
//: @end
@end

//: @interface CropAreaView : UIView
@interface DateWithView : UIView
//: @property (strong, nonatomic) CAShapeLayer *crossLineLayer;
@property (strong, nonatomic) CAShapeLayer *crossLineLayer;
//: @property (assign, nonatomic) CGFloat crossLineWidth;
@property (assign, nonatomic) CGFloat crossLineWidth;
//: @property (strong, nonatomic) UIColor *crossLineColor;
@property (strong, nonatomic) UIColor *crossLineColor;
//: @property (strong, nonatomic) UIColor *borderColor;
@property (strong, nonatomic) UIColor *borderColor;
//: @property (assign, nonatomic) CGFloat borderWidth;
@property (assign, nonatomic) CGFloat borderWidth;
//: @property (strong, nonatomic) CAShapeLayer *borderLayer;
@property (strong, nonatomic) CAShapeLayer *borderLayer;
//: @property (assign, nonatomic) BOOL showCrossLines;
@property (assign, nonatomic) BOOL showCrossLines;
//: @end
@end
//: @implementation CropAreaView
@implementation DateWithView

//: - (instancetype)init {
- (instancetype)init {

    //: self = [super init];
    self = [super init];
    //: if(self) {
    if(self) {
        //: [self createBorderLayer];
        [self user];
    }
    //: return self;
    return self;
}
//: - (void)setFrame:(CGRect)frame {
- (void)setFrame:(CGRect)frame {

    //: [super setFrame: frame];
    [super setFrame: frame];
    //: if(_showCrossLines) {
    if(_showCrossLines) {
        //: [self showCrossLineLayer];
        [self value];
    }
    //: [self resetBorderLayerPath];
    [self reset];

}
//: - (void)setBounds:(CGRect)bounds {
- (void)setBounds:(CGRect)bounds {

    //: [super setBounds:bounds];
    [super setBounds:bounds];
    //: if(_showCrossLines) {
    if(_showCrossLines) {
        //: [self showCrossLineLayer];
        [self value];
    }
    //: [self resetBorderLayerPath];
    [self reset];

}
//: - (void)showCrossLineLayer {
- (void)value {

    //: UIBezierPath *path = [UIBezierPath bezierPath];
    UIBezierPath *path = [UIBezierPath bezierPath];
    //: [path moveToPoint:CGPointMake(CGRectGetWidth(self.bounds) / 3.0, 0)];
    [path moveToPoint:CGPointMake(CGRectGetWidth(self.bounds) / 3.0, 0)];
    //: [path addLineToPoint: CGPointMake(CGRectGetWidth(self.bounds) / 3.0, CGRectGetHeight(self.bounds))];
    [path addLineToPoint: CGPointMake(CGRectGetWidth(self.bounds) / 3.0, CGRectGetHeight(self.bounds))];
    //: [path moveToPoint:CGPointMake(CGRectGetWidth(self.bounds) / 3.0 * 2.0, 0)];
    [path moveToPoint:CGPointMake(CGRectGetWidth(self.bounds) / 3.0 * 2.0, 0)];
    //: [path addLineToPoint: CGPointMake(CGRectGetWidth(self.bounds) / 3.0 * 2.0, CGRectGetHeight(self.bounds))];
    [path addLineToPoint: CGPointMake(CGRectGetWidth(self.bounds) / 3.0 * 2.0, CGRectGetHeight(self.bounds))];
    //: [path moveToPoint:CGPointMake(0, CGRectGetHeight(self.bounds) / 3.0)];
    [path moveToPoint:CGPointMake(0, CGRectGetHeight(self.bounds) / 3.0)];
    //: [path addLineToPoint: CGPointMake(CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds) / 3.0)];
    [path addLineToPoint: CGPointMake(CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds) / 3.0)];
    //: [path moveToPoint:CGPointMake(0, CGRectGetHeight(self.bounds) / 3.0 * 2.0)];
    [path moveToPoint:CGPointMake(0, CGRectGetHeight(self.bounds) / 3.0 * 2.0)];
    //: [path addLineToPoint: CGPointMake(CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds) / 3.0 * 2.0)];
    [path addLineToPoint: CGPointMake(CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds) / 3.0 * 2.0)];
    //: if(!_crossLineLayer) {
    if(!_crossLineLayer) {
        //: _crossLineLayer = [CAShapeLayer layer];
        _crossLineLayer = [CAShapeLayer layer];
        //: [self.layer addSublayer: _crossLineLayer];
        [self.layer addSublayer: _crossLineLayer];
    }
    //: _crossLineLayer.lineWidth = _crossLineWidth;
    _crossLineLayer.lineWidth = _crossLineWidth;
    //: _crossLineLayer.strokeColor = _crossLineColor.CGColor;
    _crossLineLayer.strokeColor = _crossLineColor.CGColor;
    //: _crossLineLayer.path = path.CGPath;
    _crossLineLayer.path = path.CGPath;

}
//: - (void)setCrossLineWidth:(CGFloat)crossLineWidth {
- (void)setCrossLineWidth:(CGFloat)crossLineWidth {

    //: _crossLineWidth = crossLineWidth;
    _crossLineWidth = crossLineWidth;
    //: _crossLineLayer.lineWidth = crossLineWidth;
    _crossLineLayer.lineWidth = crossLineWidth;

}
//: - (void)setCrossLineColor:(UIColor *)crossLineColor {
- (void)setCrossLineColor:(UIColor *)crossLineColor {

    //: _crossLineColor = crossLineColor;
    _crossLineColor = crossLineColor;
    //: _crossLineLayer.strokeColor = crossLineColor.CGColor;
    _crossLineLayer.strokeColor = crossLineColor.CGColor;

}
//: - (void)setShowCrossLines:(BOOL)showCrossLines {
- (void)setShowCrossLines:(BOOL)showCrossLines {

    //: if(_showCrossLines && !showCrossLines) {
    if(_showCrossLines && !showCrossLines) {
        //: [_crossLineLayer removeFromSuperlayer];
        [_crossLineLayer removeFromSuperlayer];
        //: _crossLineLayer = nil;
        _crossLineLayer = nil;
    }
    //: else if(!_showCrossLines && showCrossLines) {
    else if(!_showCrossLines && showCrossLines) {
        //: [self showCrossLineLayer];
        [self value];
    }
    //: _showCrossLines = showCrossLines;
    _showCrossLines = showCrossLines;

}
//: - (void)createBorderLayer {
- (void)user {

    //: if(_borderLayer && _borderLayer.superlayer) {
    if(_borderLayer && _borderLayer.superlayer) {
        //: [_borderLayer removeFromSuperlayer];
        [_borderLayer removeFromSuperlayer];
    }
    //: _borderLayer = [CAShapeLayer layer];
    _borderLayer = [CAShapeLayer layer];
    //: [self.layer addSublayer: _borderLayer];
    [self.layer addSublayer: _borderLayer];

}
//: - (void)resetBorderLayerPath {
- (void)reset {

    //: UIBezierPath *layerPath = [UIBezierPath bezierPathWithRect: CGRectMake(_borderWidth / 2.0f, _borderWidth / 2.0f, CGRectGetWidth(self.bounds) - _borderWidth, CGRectGetHeight(self.bounds) - _borderWidth)];
    UIBezierPath *layerPath = [UIBezierPath bezierPathWithRect: CGRectMake(_borderWidth / 2.0f, _borderWidth / 2.0f, CGRectGetWidth(self.bounds) - _borderWidth, CGRectGetHeight(self.bounds) - _borderWidth)];
    //: _borderLayer.lineWidth = _borderWidth;
    _borderLayer.lineWidth = _borderWidth;
    //: _borderLayer.fillColor = nil;
    _borderLayer.fillColor = nil;
    //: _borderLayer.path = layerPath.CGPath;
    _borderLayer.path = layerPath.CGPath;

}
//: - (void)setBorderWidth:(CGFloat)borderWidth {
- (void)setBorderWidth:(CGFloat)borderWidth {

    //: _borderWidth = borderWidth;
    _borderWidth = borderWidth;
    //: [self resetBorderLayerPath];
    [self reset];

}
//: - (void)setBorderColor:(UIColor *)borderColor {
- (void)setBorderColor:(UIColor *)borderColor {

    //: _borderColor = borderColor;
    _borderColor = borderColor;
    //: _borderLayer.strokeColor = borderColor.CGColor;
    _borderLayer.strokeColor = borderColor.CGColor;

}
//: - (UIView *) hitTest:(CGPoint) point withEvent:(UIEvent *)event {
- (UIView *) hitTest:(CGPoint) point withEvent:(UIEvent *)event {

    //: for(UIView *subView in self.subviews) {
    for(UIView *subView in self.subviews) {
        //: if(CGRectContainsPoint(subView.frame, point)) {
        if(CGRectContainsPoint(subView.frame, point)) {
            //: return subView;
            return subView;
        }
    }
    //: if(CGRectContainsPoint(self.bounds, point)) {
    if(CGRectContainsPoint(self.bounds, point)) {
        //: return self;
        return self;
    }
    //: return nil;
    return nil;

}
//: @end
@end
//: @interface TKImageView() {
@interface WithInputView() {

    //: CGFloat currentMinSpace;
    CGFloat currentMinSpace;

}
//: @property (strong, nonatomic) UIView *cropMaskView;
@property (strong, nonatomic) UIView *cropMaskView;
//: @property (strong, nonatomic) UIImageView *imageView;
@property (strong, nonatomic) UIImageView *imageView;
//: @property (strong, nonatomic) CornerView *topLeftCorner;
@property (strong, nonatomic) MaxNameView *topLeftCorner;
//: @property (strong, nonatomic) CornerView *topRightCorner;
@property (strong, nonatomic) MaxNameView *topRightCorner;
//: @property (strong, nonatomic) CornerView *bottomLeftCorner;
@property (strong, nonatomic) MaxNameView *bottomLeftCorner;
//: @property (strong, nonatomic) CornerView *bottomRightCorner;
@property (strong, nonatomic) MaxNameView *bottomRightCorner;
//: @property (strong, nonatomic) CropAreaView *cropAreaView;
@property (strong, nonatomic) DateWithView *cropAreaView;
//: @property (strong, nonatomic) UIPanGestureRecognizer *topLeftPan;
@property (strong, nonatomic) UIPanGestureRecognizer *topLeftPan;
//: @property (strong, nonatomic) UIPanGestureRecognizer *topRightPan;
@property (strong, nonatomic) UIPanGestureRecognizer *topRightPan;
//: @property (strong, nonatomic) UIPanGestureRecognizer *bottomLeftPan;
@property (strong, nonatomic) UIPanGestureRecognizer *bottomLeftPan;
//: @property (strong, nonatomic) UIPanGestureRecognizer *bottomRightPan;
@property (strong, nonatomic) UIPanGestureRecognizer *bottomRightPan;
//: @property (strong, nonatomic) UIPanGestureRecognizer *cropAreaPan;
@property (strong, nonatomic) UIPanGestureRecognizer *cropAreaPan;
//: @property (strong, nonatomic) UIPinchGestureRecognizer *cropAreaPinch;
@property (strong, nonatomic) UIPinchGestureRecognizer *cropAreaPinch;
//: @property (assign, nonatomic) CGSize pinchOriSize;
@property (assign, nonatomic) CGSize pinchOriSize;
//: @property (assign, nonatomic) CGPoint cropAreaOriCenter;
@property (assign, nonatomic) CGPoint cropAreaOriCenter;
//: @property (assign, nonatomic) CGRect cropAreaOriFrame;
@property (assign, nonatomic) CGRect cropAreaOriFrame;
//: @property (strong, nonatomic) MidLineView *topMidLine;
@property (strong, nonatomic) OnView *topMidLine;
//: @property (strong, nonatomic) MidLineView *leftMidLine;
@property (strong, nonatomic) OnView *leftMidLine;
//: @property (strong, nonatomic) MidLineView *bottomMidLine;
@property (strong, nonatomic) OnView *bottomMidLine;
//: @property (strong, nonatomic) MidLineView *rightMidLine;
@property (strong, nonatomic) OnView *rightMidLine;
//: @property (strong, nonatomic) UIPanGestureRecognizer *topMidPan;
@property (strong, nonatomic) UIPanGestureRecognizer *topMidPan;
//: @property (strong, nonatomic) UIPanGestureRecognizer *bottomMidPan;
@property (strong, nonatomic) UIPanGestureRecognizer *bottomMidPan;
//: @property (strong, nonatomic) UIPanGestureRecognizer *leftMidPan;
@property (strong, nonatomic) UIPanGestureRecognizer *leftMidPan;
//: @property (strong, nonatomic) UIPanGestureRecognizer *rightMidPan;
@property (strong, nonatomic) UIPanGestureRecognizer *rightMidPan;
//: @property (assign, nonatomic) CGFloat paddingLeftRight;
@property (assign, nonatomic) CGFloat paddingLeftRight;
//: @property (assign, nonatomic) CGFloat paddingTopBottom;
@property (assign, nonatomic) CGFloat paddingTopBottom;
//: @property (assign, nonatomic) CGFloat imageAspectRatio;
@property (assign, nonatomic) CGFloat imageAspectRatio;
//: @property (assign, nonatomic, readonly) CGFloat cornerMargin;
@property (assign, nonatomic, readonly) CGFloat cornerMargin;
//: @end
@end
//: @implementation TKImageView
@implementation WithInputView

//: - (instancetype)initWithFrame:(CGRect)frame {
- (instancetype)initWithFrame:(CGRect)frame {

    //: self = [super initWithFrame: frame];
    self = [super initWithFrame: frame];
    //: if(self) {
    if(self) {
        //: [self commonInit];
        [self commonView];
    }
    //: return self;
    return self;

}
//: - (instancetype)initWithCoder:(NSCoder *)aDecoder {
- (instancetype)initWithCoder:(NSCoder *)aDecoder {

    //: self = [super initWithCoder: aDecoder];
    self = [super initWithCoder: aDecoder];
    //: if(self) {
    if(self) {
        //: [self commonInit];
        [self commonView];
    }
    //: return self;
    return self;

}
//: - (void)commonInit {
- (void)commonView {

    //: [self setUp];
    [self action];
    //: [self createCorners];
    [self scheme];
    //: [self resetCropAreaOnCornersFrameChanged];
    [self file];
    //: [self bindPanGestures];
    [self video];

}
//: - (void)dealloc {
- (void)dealloc {

    //: [_cropAreaView removeObserver: self forKeyPath: @"frame"];
    [_cropAreaView removeObserver: self forKeyPath: StringFromHelpData(&str_goalTitle)];
    //: [_cropAreaView removeObserver: self forKeyPath: @"center"];
    [_cropAreaView removeObserver: self forKeyPath: StringFromHelpData(&str_chickenWipeName)];
    //: [_imageView removeObserver: self forKeyPath: @"frame"];
    [_imageView removeObserver: self forKeyPath: StringFromHelpData(&str_goalTitle)];

}
//: - (void)setUp {
- (void)action {

    //: _imageView = [[UIImageView alloc]initWithFrame: self.bounds];
    _imageView = [[UIImageView alloc]initWithFrame: self.bounds];
    //: _imageView.contentMode = UIViewContentModeScaleToFill;
    _imageView.contentMode = UIViewContentModeScaleToFill;
    //: _imageView.userInteractionEnabled = YES;
    _imageView.userInteractionEnabled = YES;
    //: _imageAspectRatio = 0;
    _imageAspectRatio = 0;
    //: [self addSubview: _imageView];
    [self addSubview: _imageView];

    //: _cropMaskView = [[UIView alloc]initWithFrame: _imageView.bounds];
    _cropMaskView = [[UIView alloc]initWithFrame: _imageView.bounds];
    //: _cropMaskView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.8];
    _cropMaskView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.8];
    //: _cropMaskView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    _cropMaskView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    //: [_imageView addSubview: _cropMaskView];
    [_imageView addSubview: _cropMaskView];

    //: UIColor *defaultColor = [UIColor colorWithWhite: 1 alpha: 0.8];
    UIColor *defaultColor = [UIColor colorWithWhite: 1 alpha: 0.8];
    //: _cropAreaBorderLineColor = defaultColor;
    _cropAreaBorderLineColor = defaultColor;
    //: _cropAreaCornerLineColor = [UIColor whiteColor];
    _cropAreaCornerLineColor = [UIColor whiteColor];
    //: _cropAreaBorderLineWidth = 2;
    _cropAreaBorderLineWidth = 2;
    //: _cropAreaCornerLineWidth = 4;
    _cropAreaCornerLineWidth = 4;
    //: _cropAreaCornerWidth = 20;
    _cropAreaCornerWidth = 20;
    //: _cropAreaCornerHeight = 20;
    _cropAreaCornerHeight = 20;
    //: _cropAspectRatio = 0;
    _cropAspectRatio = 0;
    //: _minSpace = 10;
    _minSpace = 10;
    //: currentMinSpace = _minSpace;
    currentMinSpace = _minSpace;
    //: _cropAreaCrossLineWidth = 2;
    _cropAreaCrossLineWidth = 2;
    //: _cropAreaCrossLineColor = defaultColor;
    _cropAreaCrossLineColor = defaultColor;
    //: _cropAreaMidLineWidth = 20;
    _cropAreaMidLineWidth = 20;
    //: _cropAreaMidLineHeight = 4;
    _cropAreaMidLineHeight = 4;
    //: _cropAreaMidLineColor = defaultColor;
    _cropAreaMidLineColor = defaultColor;

    //: _cropAreaView = [[CropAreaView alloc] init];
    _cropAreaView = [[DateWithView alloc] init];
    //: _cropAreaView.borderWidth = _cropAreaBorderLineWidth;
    _cropAreaView.borderWidth = _cropAreaBorderLineWidth;
    //: _cropAreaView.borderColor = _cropAreaBorderLineColor;
    _cropAreaView.borderColor = _cropAreaBorderLineColor;
    //: _cropAreaView.crossLineColor = _cropAreaCrossLineColor;
    _cropAreaView.crossLineColor = _cropAreaCrossLineColor;
    //: _cropAreaView.crossLineWidth = _cropAreaCrossLineWidth;
    _cropAreaView.crossLineWidth = _cropAreaCrossLineWidth;
    //: _cropAreaView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    _cropAreaView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    //: [_imageView addSubview: _cropAreaView];
    [_imageView addSubview: _cropAreaView];

    //: [_cropAreaView addObserver: self
    [_cropAreaView addObserver: self
                    //: forKeyPath: @"frame"
                    forKeyPath: StringFromHelpData(&str_goalTitle)
                       //: options: NSKeyValueObservingOptionNew | NSKeyValueObservingOptionInitial
                       options: NSKeyValueObservingOptionNew | NSKeyValueObservingOptionInitial
                       //: context: NULL];
                       context: NULL];
    //: [_cropAreaView addObserver: self
    [_cropAreaView addObserver: self
                    //: forKeyPath: @"center"
                    forKeyPath: StringFromHelpData(&str_chickenWipeName)
                       //: options: NSKeyValueObservingOptionNew | NSKeyValueObservingOptionInitial
                       options: NSKeyValueObservingOptionNew | NSKeyValueObservingOptionInitial
                       //: context: NULL];
                       context: NULL];
    //: [_imageView addObserver: self
    [_imageView addObserver: self
                    //: forKeyPath: @"frame"
                    forKeyPath: StringFromHelpData(&str_goalTitle)
                       //: options: NSKeyValueObservingOptionNew | NSKeyValueObservingOptionInitial
                       options: NSKeyValueObservingOptionNew | NSKeyValueObservingOptionInitial
                       //: context: NULL];
                       context: NULL];

}
//: #pragma mark - PanGesture Bind
#pragma mark - PanGesture Bind
//: - (void)bindPanGestures {
- (void)video {

    //: _topLeftPan = [[UIPanGestureRecognizer alloc]initWithTarget: self action: @selector(handleCornerPan:)];
    _topLeftPan = [[UIPanGestureRecognizer alloc]initWithTarget: self action: @selector(formed:)];
    //: _topRightPan = [[UIPanGestureRecognizer alloc]initWithTarget: self action: @selector(handleCornerPan:)];
    _topRightPan = [[UIPanGestureRecognizer alloc]initWithTarget: self action: @selector(formed:)];
    //: _bottomLeftPan = [[UIPanGestureRecognizer alloc]initWithTarget: self action: @selector(handleCornerPan:)];
    _bottomLeftPan = [[UIPanGestureRecognizer alloc]initWithTarget: self action: @selector(formed:)];
    //: _bottomRightPan = [[UIPanGestureRecognizer alloc]initWithTarget: self action: @selector(handleCornerPan:)];
    _bottomRightPan = [[UIPanGestureRecognizer alloc]initWithTarget: self action: @selector(formed:)];
    //: _cropAreaPan = [[UIPanGestureRecognizer alloc]initWithTarget: self action: @selector(handleCropAreaPan:)];
    _cropAreaPan = [[UIPanGestureRecognizer alloc]initWithTarget: self action: @selector(roasters:)];

    //: [_topLeftCorner addGestureRecognizer: _topLeftPan];
    [_topLeftCorner addGestureRecognizer: _topLeftPan];
    //: [_topRightCorner addGestureRecognizer: _topRightPan];
    [_topRightCorner addGestureRecognizer: _topRightPan];
    //: [_bottomLeftCorner addGestureRecognizer: _bottomLeftPan];
    [_bottomLeftCorner addGestureRecognizer: _bottomLeftPan];
    //: [_bottomRightCorner addGestureRecognizer: _bottomRightPan];
    [_bottomRightCorner addGestureRecognizer: _bottomRightPan];
    //: [_cropAreaView addGestureRecognizer: _cropAreaPan];
    [_cropAreaView addGestureRecognizer: _cropAreaPan];

}
//: #pragma mark - PinchGesture CallBack
#pragma mark - PinchGesture CallBack
//: - (void)handleCropAreaPinch: (UIPinchGestureRecognizer *)pinchGesture {
- (void)nimPinch: (UIPinchGestureRecognizer *)pinchGesture {

    //: switch (pinchGesture.state) {
    switch (pinchGesture.state) {
        //: case UIGestureRecognizerStateBegan: {
        case UIGestureRecognizerStateBegan: {
            //: _pinchOriSize = _cropAreaView.frame.size;
            _pinchOriSize = _cropAreaView.frame.size;
            //: break;
            break;
        }
        //: case UIGestureRecognizerStateChanged: {
        case UIGestureRecognizerStateChanged: {
            //: [self resetCropAreaByScaleFactor: pinchGesture.scale];
            [self rf: pinchGesture.scale];
            //: break;
            break;
        }
        //: default:
        default:
            //: break;
            break;
    }

}
//: #pragma mark - PanGesture CallBack
#pragma mark - PanGesture CallBack
//: - (void)handleCropAreaPan: (UIPanGestureRecognizer *)panGesture {
- (void)roasters: (UIPanGestureRecognizer *)panGesture {

    //: switch (panGesture.state) {
    switch (panGesture.state) {
        //: case UIGestureRecognizerStateBegan: {
        case UIGestureRecognizerStateBegan: {
            //: _cropAreaOriCenter = _cropAreaView.center;
            _cropAreaOriCenter = _cropAreaView.center;
            //: break;
            break;
        }
        //: case UIGestureRecognizerStateChanged: {
        case UIGestureRecognizerStateChanged: {
            //: CGPoint translation = [panGesture translationInView: _imageView];
            CGPoint translation = [panGesture translationInView: _imageView];
            //: CGPoint willCenter = CGPointMake(_cropAreaOriCenter.x + translation.x, _cropAreaOriCenter.y + translation.y);
            CGPoint willCenter = CGPointMake(_cropAreaOriCenter.x + translation.x, _cropAreaOriCenter.y + translation.y);
            //: CGFloat centerMinX = CGRectGetWidth(_cropAreaView.bounds) / 2.0f + self.cornerMargin * _cornerBorderInImage ;
            CGFloat centerMinX = CGRectGetWidth(_cropAreaView.bounds) / 2.0f + self.cornerMargin * _cornerBorderInImage ;
            //: CGFloat centerMaxX = CGRectGetWidth(_imageView.bounds) - CGRectGetWidth(_cropAreaView.bounds) / 2.0f - self.cornerMargin * _cornerBorderInImage;
            CGFloat centerMaxX = CGRectGetWidth(_imageView.bounds) - CGRectGetWidth(_cropAreaView.bounds) / 2.0f - self.cornerMargin * _cornerBorderInImage;
            //: CGFloat centerMinY = CGRectGetHeight(_cropAreaView.bounds) / 2.0f + self.cornerMargin * _cornerBorderInImage;
            CGFloat centerMinY = CGRectGetHeight(_cropAreaView.bounds) / 2.0f + self.cornerMargin * _cornerBorderInImage;
            //: CGFloat centerMaxY = CGRectGetHeight(_imageView.bounds) - CGRectGetHeight(_cropAreaView.bounds) / 2.0f - self.cornerMargin * _cornerBorderInImage;
            CGFloat centerMaxY = CGRectGetHeight(_imageView.bounds) - CGRectGetHeight(_cropAreaView.bounds) / 2.0f - self.cornerMargin * _cornerBorderInImage;
            //: _cropAreaView.center = CGPointMake(((((centerMinX) > (willCenter.x) ? (centerMinX) : (willCenter.x))) < (centerMaxX) ? (((centerMinX) > (willCenter.x) ? (centerMinX) : (willCenter.x))) : (centerMaxX)), ((((centerMinY) > (willCenter.y) ? (centerMinY) : (willCenter.y))) < (centerMaxY) ? (((centerMinY) > (willCenter.y) ? (centerMinY) : (willCenter.y))) : (centerMaxY)));
            _cropAreaView.center = CGPointMake(((((centerMinX) > (willCenter.x) ? (centerMinX) : (willCenter.x))) < (centerMaxX) ? (((centerMinX) > (willCenter.x) ? (centerMinX) : (willCenter.x))) : (centerMaxX)), ((((centerMinY) > (willCenter.y) ? (centerMinY) : (willCenter.y))) < (centerMaxY) ? (((centerMinY) > (willCenter.y) ? (centerMinY) : (willCenter.y))) : (centerMaxY)));
            //: [self resetCornersOnCropAreaFrameChanged];
            [self changed];
            //: break;
            break;
        }
        //: default:
        default:
            //: break;
            break;
    }

}
//: - (void)handleMidPan: (UIPanGestureRecognizer *)panGesture {
- (void)midses: (UIPanGestureRecognizer *)panGesture {

    //: MidLineView *midLineView = (MidLineView *)panGesture.view;
    OnView *midLineView = (OnView *)panGesture.view;
    //: switch (panGesture.state) {
    switch (panGesture.state) {
        //: case UIGestureRecognizerStateBegan: {
        case UIGestureRecognizerStateBegan: {
            //: _cropAreaOriFrame = _cropAreaView.frame;
            _cropAreaOriFrame = _cropAreaView.frame;
            //: break;
            break;
        }
        //: case UIGestureRecognizerStateChanged: {
        case UIGestureRecognizerStateChanged: {
            //: CGPoint translation = [panGesture translationInView: _cropAreaView];
            CGPoint translation = [panGesture translationInView: _cropAreaView];
            //: switch (midLineView.type) {
            switch (midLineView.type) {
                //: case TKMidLineTypeTop: {
                case TKMidLineTypeTop: {
                    //: CGFloat minHeight = currentMinSpace + (_cropAreaCornerHeight - _cropAreaCornerLineWidth + _cropAreaBorderLineWidth) * 2;
                    CGFloat minHeight = currentMinSpace + (_cropAreaCornerHeight - _cropAreaCornerLineWidth + _cropAreaBorderLineWidth) * 2;
                    //: CGFloat maxHeight = CGRectGetMaxY(_cropAreaOriFrame) - (_cropAreaCornerLineWidth - _cropAreaBorderLineWidth) * self.cornerBorderInImage;
                    CGFloat maxHeight = CGRectGetMaxY(_cropAreaOriFrame) - (_cropAreaCornerLineWidth - _cropAreaBorderLineWidth) * self.cornerBorderInImage;
                    //: CGFloat willHeight = ((((minHeight) > (CGRectGetHeight(_cropAreaOriFrame) - translation.y) ? (minHeight) : (CGRectGetHeight(_cropAreaOriFrame) - translation.y))) < (maxHeight) ? (((minHeight) > (CGRectGetHeight(_cropAreaOriFrame) - translation.y) ? (minHeight) : (CGRectGetHeight(_cropAreaOriFrame) - translation.y))) : (maxHeight));
                    CGFloat willHeight = ((((minHeight) > (CGRectGetHeight(_cropAreaOriFrame) - translation.y) ? (minHeight) : (CGRectGetHeight(_cropAreaOriFrame) - translation.y))) < (maxHeight) ? (((minHeight) > (CGRectGetHeight(_cropAreaOriFrame) - translation.y) ? (minHeight) : (CGRectGetHeight(_cropAreaOriFrame) - translation.y))) : (maxHeight));
                    //: CGFloat deltaY = willHeight - CGRectGetHeight(_cropAreaOriFrame);
                    CGFloat deltaY = willHeight - CGRectGetHeight(_cropAreaOriFrame);
                    //: _cropAreaView.frame = CGRectMake(CGRectGetMinX(_cropAreaOriFrame), CGRectGetMinY(_cropAreaOriFrame) - deltaY, CGRectGetWidth(_cropAreaOriFrame), willHeight);
                    _cropAreaView.frame = CGRectMake(CGRectGetMinX(_cropAreaOriFrame), CGRectGetMinY(_cropAreaOriFrame) - deltaY, CGRectGetWidth(_cropAreaOriFrame), willHeight);
                    //: break;
                    break;
                }
                //: case TKMidLineTypeBottom: {
                case TKMidLineTypeBottom: {
                    //: CGFloat minHeight = currentMinSpace + (_cropAreaCornerHeight - _cropAreaCornerLineWidth + _cropAreaBorderLineWidth) * 2;
                    CGFloat minHeight = currentMinSpace + (_cropAreaCornerHeight - _cropAreaCornerLineWidth + _cropAreaBorderLineWidth) * 2;
                    //: CGFloat maxHeight = CGRectGetHeight(_imageView.bounds) - CGRectGetMinY(_cropAreaOriFrame) - (_cropAreaCornerLineWidth - _cropAreaBorderLineWidth) * self.cornerBorderInImage;
                    CGFloat maxHeight = CGRectGetHeight(_imageView.bounds) - CGRectGetMinY(_cropAreaOriFrame) - (_cropAreaCornerLineWidth - _cropAreaBorderLineWidth) * self.cornerBorderInImage;
                    //: CGFloat willHeight = ((((minHeight) > (CGRectGetHeight(_cropAreaOriFrame) + translation.y) ? (minHeight) : (CGRectGetHeight(_cropAreaOriFrame) + translation.y))) < (maxHeight) ? (((minHeight) > (CGRectGetHeight(_cropAreaOriFrame) + translation.y) ? (minHeight) : (CGRectGetHeight(_cropAreaOriFrame) + translation.y))) : (maxHeight));
                    CGFloat willHeight = ((((minHeight) > (CGRectGetHeight(_cropAreaOriFrame) + translation.y) ? (minHeight) : (CGRectGetHeight(_cropAreaOriFrame) + translation.y))) < (maxHeight) ? (((minHeight) > (CGRectGetHeight(_cropAreaOriFrame) + translation.y) ? (minHeight) : (CGRectGetHeight(_cropAreaOriFrame) + translation.y))) : (maxHeight));
                    //: _cropAreaView.frame = CGRectMake(CGRectGetMinX(_cropAreaOriFrame), CGRectGetMinY(_cropAreaOriFrame), CGRectGetWidth(_cropAreaOriFrame), willHeight);
                    _cropAreaView.frame = CGRectMake(CGRectGetMinX(_cropAreaOriFrame), CGRectGetMinY(_cropAreaOriFrame), CGRectGetWidth(_cropAreaOriFrame), willHeight);
                    //: break;
                    break;
                }
                //: case TKMidLineTypeLeft: {
                case TKMidLineTypeLeft: {
                    //: CGFloat minWidth = currentMinSpace + (_cropAreaCornerWidth - _cropAreaCornerLineWidth + _cropAreaBorderLineWidth) * 2;
                    CGFloat minWidth = currentMinSpace + (_cropAreaCornerWidth - _cropAreaCornerLineWidth + _cropAreaBorderLineWidth) * 2;
                    //: CGFloat maxWidth = CGRectGetMaxX(_cropAreaOriFrame) - (_cropAreaCornerLineWidth - _cropAreaBorderLineWidth) * self.cornerBorderInImage;
                    CGFloat maxWidth = CGRectGetMaxX(_cropAreaOriFrame) - (_cropAreaCornerLineWidth - _cropAreaBorderLineWidth) * self.cornerBorderInImage;
                    //: CGFloat willWidth = ((((minWidth) > (CGRectGetWidth(_cropAreaOriFrame) - translation.x) ? (minWidth) : (CGRectGetWidth(_cropAreaOriFrame) - translation.x))) < (maxWidth) ? (((minWidth) > (CGRectGetWidth(_cropAreaOriFrame) - translation.x) ? (minWidth) : (CGRectGetWidth(_cropAreaOriFrame) - translation.x))) : (maxWidth));
                    CGFloat willWidth = ((((minWidth) > (CGRectGetWidth(_cropAreaOriFrame) - translation.x) ? (minWidth) : (CGRectGetWidth(_cropAreaOriFrame) - translation.x))) < (maxWidth) ? (((minWidth) > (CGRectGetWidth(_cropAreaOriFrame) - translation.x) ? (minWidth) : (CGRectGetWidth(_cropAreaOriFrame) - translation.x))) : (maxWidth));
                    //: CGFloat deltaX = willWidth - CGRectGetWidth(_cropAreaOriFrame);
                    CGFloat deltaX = willWidth - CGRectGetWidth(_cropAreaOriFrame);
                    //: _cropAreaView.frame = CGRectMake(CGRectGetMinX(_cropAreaOriFrame) - deltaX, CGRectGetMinY(_cropAreaOriFrame), willWidth, CGRectGetHeight(_cropAreaOriFrame));
                    _cropAreaView.frame = CGRectMake(CGRectGetMinX(_cropAreaOriFrame) - deltaX, CGRectGetMinY(_cropAreaOriFrame), willWidth, CGRectGetHeight(_cropAreaOriFrame));
                    //: break;
                    break;
                }
                //: case TKMidLineTypeRight: {
                case TKMidLineTypeRight: {
                    //: CGFloat minWidth = currentMinSpace + (_cropAreaCornerWidth - _cropAreaCornerLineWidth + _cropAreaBorderLineWidth) * 2;
                    CGFloat minWidth = currentMinSpace + (_cropAreaCornerWidth - _cropAreaCornerLineWidth + _cropAreaBorderLineWidth) * 2;
                    //: CGFloat maxWidth = CGRectGetWidth(_imageView.bounds) - CGRectGetMinX(_cropAreaOriFrame) - (_cropAreaCornerLineWidth - _cropAreaBorderLineWidth) * self.cornerBorderInImage;
                    CGFloat maxWidth = CGRectGetWidth(_imageView.bounds) - CGRectGetMinX(_cropAreaOriFrame) - (_cropAreaCornerLineWidth - _cropAreaBorderLineWidth) * self.cornerBorderInImage;
                    //: CGFloat willWidth = ((((minWidth) > (CGRectGetWidth(_cropAreaOriFrame) + translation.x) ? (minWidth) : (CGRectGetWidth(_cropAreaOriFrame) + translation.x))) < (maxWidth) ? (((minWidth) > (CGRectGetWidth(_cropAreaOriFrame) + translation.x) ? (minWidth) : (CGRectGetWidth(_cropAreaOriFrame) + translation.x))) : (maxWidth));
                    CGFloat willWidth = ((((minWidth) > (CGRectGetWidth(_cropAreaOriFrame) + translation.x) ? (minWidth) : (CGRectGetWidth(_cropAreaOriFrame) + translation.x))) < (maxWidth) ? (((minWidth) > (CGRectGetWidth(_cropAreaOriFrame) + translation.x) ? (minWidth) : (CGRectGetWidth(_cropAreaOriFrame) + translation.x))) : (maxWidth));
                    //: _cropAreaView.frame = CGRectMake(CGRectGetMinX(_cropAreaOriFrame), CGRectGetMinY(_cropAreaOriFrame), willWidth, CGRectGetHeight(_cropAreaOriFrame));
                    _cropAreaView.frame = CGRectMake(CGRectGetMinX(_cropAreaOriFrame), CGRectGetMinY(_cropAreaOriFrame), willWidth, CGRectGetHeight(_cropAreaOriFrame));
                    //: break;
                    break;
                }
                //: default:
                default:
                    //: break;
                    break;
            }
            //: [self resetCornersOnCropAreaFrameChanged];
            [self changed];
            //: break;
            break;
        }
        //: default:
        default:
            //: break;
            break;
    }

}
//: - (void)handleCornerPan: (UIPanGestureRecognizer *)panGesture {
- (void)formed: (UIPanGestureRecognizer *)panGesture {

    //: CornerView *panView = (CornerView *)panGesture.view;
    MaxNameView *panView = (MaxNameView *)panGesture.view;
    //: CornerView *relativeViewX = panView.relativeViewX;
    MaxNameView *relativeViewX = panView.relativeViewX;
    //: CornerView *relativeViewY = panView.relativeViewY;
    MaxNameView *relativeViewY = panView.relativeViewY;
    //: CGPoint locationInImageView = [panGesture locationInView: _imageView];
    CGPoint locationInImageView = [panGesture locationInView: _imageView];
    //: NSInteger xFactor = CGRectGetMinX(relativeViewY.frame) > CGRectGetMinX(panView.frame) ? -1 : 1;
    NSInteger xFactor = CGRectGetMinX(relativeViewY.frame) > CGRectGetMinX(panView.frame) ? -1 : 1;
    //: NSInteger yFactor = CGRectGetMinY(relativeViewX.frame) > CGRectGetMinY(panView.frame) ? -1 : 1;
    NSInteger yFactor = CGRectGetMinY(relativeViewX.frame) > CGRectGetMinY(panView.frame) ? -1 : 1;
    //: CGFloat approachAspectRatio = 0;
    CGFloat approachAspectRatio = 0;
    //: if(panView == _topLeftCorner) {
    if(panView == _topLeftCorner) {
        //: approachAspectRatio = (CGRectGetMinX(panView.frame) + self.cornerMargin) / (CGRectGetMinY(panView.frame) + self.cornerMargin);
        approachAspectRatio = (CGRectGetMinX(panView.frame) + self.cornerMargin) / (CGRectGetMinY(panView.frame) + self.cornerMargin);
    }
    //: else if(panView == _topRightCorner) {
    else if(panView == _topRightCorner) {
        //: approachAspectRatio = (CGRectGetWidth(_imageView.bounds) - CGRectGetMaxX(panView.frame) + self.cornerMargin) / (CGRectGetMinY(panView.frame) + self.cornerMargin);
        approachAspectRatio = (CGRectGetWidth(_imageView.bounds) - CGRectGetMaxX(panView.frame) + self.cornerMargin) / (CGRectGetMinY(panView.frame) + self.cornerMargin);
    }
    //: else if(panView == _bottomLeftCorner) {
    else if(panView == _bottomLeftCorner) {
        //: approachAspectRatio = (CGRectGetMinX(panView.frame) + self.cornerMargin) / (CGRectGetHeight(_imageView.bounds) - CGRectGetMaxY(panView.frame) + self.cornerMargin);
        approachAspectRatio = (CGRectGetMinX(panView.frame) + self.cornerMargin) / (CGRectGetHeight(_imageView.bounds) - CGRectGetMaxY(panView.frame) + self.cornerMargin);
    }
    //: else if(panView == _bottomRightCorner) {
    else if(panView == _bottomRightCorner) {
        //: approachAspectRatio = (CGRectGetWidth(_imageView.bounds) - CGRectGetMaxX(panView.frame) + self.cornerMargin) /(CGRectGetHeight(_imageView.bounds) - CGRectGetMaxY(panView.frame) + self.cornerMargin);
        approachAspectRatio = (CGRectGetWidth(_imageView.bounds) - CGRectGetMaxX(panView.frame) + self.cornerMargin) /(CGRectGetHeight(_imageView.bounds) - CGRectGetMaxY(panView.frame) + self.cornerMargin);
    }

    //: CGFloat spaceX = (((((locationInImageView.x - relativeViewY.center.x) * xFactor + _cropAreaCornerWidth - self.cornerMargin * 2) > (currentMinSpace + _cropAreaCornerWidth * 2 - self.cornerMargin * 2) ? ((locationInImageView.x - relativeViewY.center.x) * xFactor + _cropAreaCornerWidth - self.cornerMargin * 2) : (currentMinSpace + _cropAreaCornerWidth * 2 - self.cornerMargin * 2))) < (xFactor < 0 ? relativeViewY.center.x + _cropAreaCornerWidth / 2.0 - self.cornerMargin * 2 + self.cornerMargin * !_cornerBorderInImage : CGRectGetWidth(_imageView.bounds) - relativeViewY.center.x + _cropAreaCornerWidth / 2.0 - self.cornerMargin * 2 + self.cornerMargin * !_cornerBorderInImage) ? ((((locationInImageView.x - relativeViewY.center.x) * xFactor + _cropAreaCornerWidth - self.cornerMargin * 2) > (currentMinSpace + _cropAreaCornerWidth * 2 - self.cornerMargin * 2) ? ((locationInImageView.x - relativeViewY.center.x) * xFactor + _cropAreaCornerWidth - self.cornerMargin * 2) : (currentMinSpace + _cropAreaCornerWidth * 2 - self.cornerMargin * 2))) : (xFactor < 0 ? relativeViewY.center.x + _cropAreaCornerWidth / 2.0 - self.cornerMargin * 2 + self.cornerMargin * !_cornerBorderInImage : CGRectGetWidth(_imageView.bounds) - relativeViewY.center.x + _cropAreaCornerWidth / 2.0 - self.cornerMargin * 2 + self.cornerMargin * !_cornerBorderInImage));
    CGFloat spaceX = (((((locationInImageView.x - relativeViewY.center.x) * xFactor + _cropAreaCornerWidth - self.cornerMargin * 2) > (currentMinSpace + _cropAreaCornerWidth * 2 - self.cornerMargin * 2) ? ((locationInImageView.x - relativeViewY.center.x) * xFactor + _cropAreaCornerWidth - self.cornerMargin * 2) : (currentMinSpace + _cropAreaCornerWidth * 2 - self.cornerMargin * 2))) < (xFactor < 0 ? relativeViewY.center.x + _cropAreaCornerWidth / 2.0 - self.cornerMargin * 2 + self.cornerMargin * !_cornerBorderInImage : CGRectGetWidth(_imageView.bounds) - relativeViewY.center.x + _cropAreaCornerWidth / 2.0 - self.cornerMargin * 2 + self.cornerMargin * !_cornerBorderInImage) ? ((((locationInImageView.x - relativeViewY.center.x) * xFactor + _cropAreaCornerWidth - self.cornerMargin * 2) > (currentMinSpace + _cropAreaCornerWidth * 2 - self.cornerMargin * 2) ? ((locationInImageView.x - relativeViewY.center.x) * xFactor + _cropAreaCornerWidth - self.cornerMargin * 2) : (currentMinSpace + _cropAreaCornerWidth * 2 - self.cornerMargin * 2))) : (xFactor < 0 ? relativeViewY.center.x + _cropAreaCornerWidth / 2.0 - self.cornerMargin * 2 + self.cornerMargin * !_cornerBorderInImage : CGRectGetWidth(_imageView.bounds) - relativeViewY.center.x + _cropAreaCornerWidth / 2.0 - self.cornerMargin * 2 + self.cornerMargin * !_cornerBorderInImage));

    //: CGFloat spaceY = (((((locationInImageView.y - relativeViewX.center.y) * yFactor + _cropAreaCornerHeight - self.cornerMargin * 2) > (currentMinSpace + _cropAreaCornerHeight * 2 - self.cornerMargin * 2) ? ((locationInImageView.y - relativeViewX.center.y) * yFactor + _cropAreaCornerHeight - self.cornerMargin * 2) : (currentMinSpace + _cropAreaCornerHeight * 2 - self.cornerMargin * 2))) < (yFactor < 0 ? relativeViewX.center.y + _cropAreaCornerHeight / 2.0 - self.cornerMargin * 2 + self.cornerMargin * !_cornerBorderInImage : CGRectGetHeight(_imageView.bounds) - relativeViewX.center.y + _cropAreaCornerHeight / 2.0 - self.cornerMargin * 2 + self.cornerMargin * !_cornerBorderInImage) ? ((((locationInImageView.y - relativeViewX.center.y) * yFactor + _cropAreaCornerHeight - self.cornerMargin * 2) > (currentMinSpace + _cropAreaCornerHeight * 2 - self.cornerMargin * 2) ? ((locationInImageView.y - relativeViewX.center.y) * yFactor + _cropAreaCornerHeight - self.cornerMargin * 2) : (currentMinSpace + _cropAreaCornerHeight * 2 - self.cornerMargin * 2))) : (yFactor < 0 ? relativeViewX.center.y + _cropAreaCornerHeight / 2.0 - self.cornerMargin * 2 + self.cornerMargin * !_cornerBorderInImage : CGRectGetHeight(_imageView.bounds) - relativeViewX.center.y + _cropAreaCornerHeight / 2.0 - self.cornerMargin * 2 + self.cornerMargin * !_cornerBorderInImage));
    CGFloat spaceY = (((((locationInImageView.y - relativeViewX.center.y) * yFactor + _cropAreaCornerHeight - self.cornerMargin * 2) > (currentMinSpace + _cropAreaCornerHeight * 2 - self.cornerMargin * 2) ? ((locationInImageView.y - relativeViewX.center.y) * yFactor + _cropAreaCornerHeight - self.cornerMargin * 2) : (currentMinSpace + _cropAreaCornerHeight * 2 - self.cornerMargin * 2))) < (yFactor < 0 ? relativeViewX.center.y + _cropAreaCornerHeight / 2.0 - self.cornerMargin * 2 + self.cornerMargin * !_cornerBorderInImage : CGRectGetHeight(_imageView.bounds) - relativeViewX.center.y + _cropAreaCornerHeight / 2.0 - self.cornerMargin * 2 + self.cornerMargin * !_cornerBorderInImage) ? ((((locationInImageView.y - relativeViewX.center.y) * yFactor + _cropAreaCornerHeight - self.cornerMargin * 2) > (currentMinSpace + _cropAreaCornerHeight * 2 - self.cornerMargin * 2) ? ((locationInImageView.y - relativeViewX.center.y) * yFactor + _cropAreaCornerHeight - self.cornerMargin * 2) : (currentMinSpace + _cropAreaCornerHeight * 2 - self.cornerMargin * 2))) : (yFactor < 0 ? relativeViewX.center.y + _cropAreaCornerHeight / 2.0 - self.cornerMargin * 2 + self.cornerMargin * !_cornerBorderInImage : CGRectGetHeight(_imageView.bounds) - relativeViewX.center.y + _cropAreaCornerHeight / 2.0 - self.cornerMargin * 2 + self.cornerMargin * !_cornerBorderInImage));

    //: if(_cropAspectRatio > 0) {
    if(_cropAspectRatio > 0) {
        //: if(_cropAspectRatio >= approachAspectRatio) {
        if(_cropAspectRatio >= approachAspectRatio) {
            //: spaceY = ((spaceX / _cropAspectRatio) > (currentMinSpace + _cropAreaCornerHeight * 2 - self.cornerMargin * 2) ? (spaceX / _cropAspectRatio) : (currentMinSpace + _cropAreaCornerHeight * 2 - self.cornerMargin * 2));
            spaceY = ((spaceX / _cropAspectRatio) > (currentMinSpace + _cropAreaCornerHeight * 2 - self.cornerMargin * 2) ? (spaceX / _cropAspectRatio) : (currentMinSpace + _cropAreaCornerHeight * 2 - self.cornerMargin * 2));
            //: spaceX = spaceY * _cropAspectRatio;
            spaceX = spaceY * _cropAspectRatio;
        }
        //: else {
        else {
            //: spaceX = ((spaceY * _cropAspectRatio) > (currentMinSpace + _cropAreaCornerWidth * 2 - self.cornerMargin * 2) ? (spaceY * _cropAspectRatio) : (currentMinSpace + _cropAreaCornerWidth * 2 - self.cornerMargin * 2));
            spaceX = ((spaceY * _cropAspectRatio) > (currentMinSpace + _cropAreaCornerWidth * 2 - self.cornerMargin * 2) ? (spaceY * _cropAspectRatio) : (currentMinSpace + _cropAreaCornerWidth * 2 - self.cornerMargin * 2));
            //: spaceY = spaceX / _cropAspectRatio;
            spaceY = spaceX / _cropAspectRatio;
        }
    }

    //: CGFloat centerX = (spaceX - _cropAreaCornerWidth + self.cornerMargin * 2) * xFactor + relativeViewY.center.x;
    CGFloat centerX = (spaceX - _cropAreaCornerWidth + self.cornerMargin * 2) * xFactor + relativeViewY.center.x;
    //: CGFloat centerY = (spaceY - _cropAreaCornerHeight + self.cornerMargin * 2) * yFactor + relativeViewX.center.y;
    CGFloat centerY = (spaceY - _cropAreaCornerHeight + self.cornerMargin * 2) * yFactor + relativeViewX.center.y;
    //: panView.center = CGPointMake(centerX, centerY);
    panView.center = CGPointMake(centerX, centerY);
    //: relativeViewX.frame = CGRectMake(CGRectGetMinX(panView.frame), CGRectGetMinY(relativeViewX.frame), CGRectGetWidth(relativeViewX.bounds), CGRectGetHeight(relativeViewX.bounds));
    relativeViewX.frame = CGRectMake(CGRectGetMinX(panView.frame), CGRectGetMinY(relativeViewX.frame), CGRectGetWidth(relativeViewX.bounds), CGRectGetHeight(relativeViewX.bounds));
    //: relativeViewY.frame = CGRectMake(CGRectGetMinX(relativeViewY.frame), CGRectGetMinY(panView.frame), CGRectGetWidth(relativeViewY.bounds), CGRectGetHeight(relativeViewY.bounds));
    relativeViewY.frame = CGRectMake(CGRectGetMinX(relativeViewY.frame), CGRectGetMinY(panView.frame), CGRectGetWidth(relativeViewY.bounds), CGRectGetHeight(relativeViewY.bounds));
    //: [self resetCropAreaOnCornersFrameChanged];
    [self file];
    //: [self resetCropTransparentArea];
    [self recording];

}
//: #pragma mark - Position/Resize Corners&CropArea
#pragma mark - Position/Resize Corners&CropArea
//: - (void)resetCornersOnCropAreaFrameChanged {
- (void)changed {

    //: _topLeftCorner.frame = CGRectMake(CGRectGetMinX(_cropAreaView.frame) - _cropAreaCornerLineWidth + _cropAreaBorderLineWidth, CGRectGetMinY(_cropAreaView.frame) - _cropAreaCornerLineWidth + _cropAreaBorderLineWidth, _cropAreaCornerWidth, _cropAreaCornerHeight);
    _topLeftCorner.frame = CGRectMake(CGRectGetMinX(_cropAreaView.frame) - _cropAreaCornerLineWidth + _cropAreaBorderLineWidth, CGRectGetMinY(_cropAreaView.frame) - _cropAreaCornerLineWidth + _cropAreaBorderLineWidth, _cropAreaCornerWidth, _cropAreaCornerHeight);
    //: _topRightCorner.frame = CGRectMake(CGRectGetMaxX(_cropAreaView.frame) - _cropAreaCornerWidth + _cropAreaCornerLineWidth - _cropAreaBorderLineWidth, CGRectGetMinY(_cropAreaView.frame) - _cropAreaCornerLineWidth + _cropAreaBorderLineWidth, _cropAreaCornerWidth, _cropAreaCornerHeight);
    _topRightCorner.frame = CGRectMake(CGRectGetMaxX(_cropAreaView.frame) - _cropAreaCornerWidth + _cropAreaCornerLineWidth - _cropAreaBorderLineWidth, CGRectGetMinY(_cropAreaView.frame) - _cropAreaCornerLineWidth + _cropAreaBorderLineWidth, _cropAreaCornerWidth, _cropAreaCornerHeight);
    //: _bottomLeftCorner.frame = CGRectMake(CGRectGetMinX(_cropAreaView.frame) - _cropAreaCornerLineWidth + _cropAreaBorderLineWidth, CGRectGetMaxY(_cropAreaView.frame) - _cropAreaCornerHeight + _cropAreaCornerLineWidth - _cropAreaBorderLineWidth, _cropAreaCornerWidth, _cropAreaCornerHeight);
    _bottomLeftCorner.frame = CGRectMake(CGRectGetMinX(_cropAreaView.frame) - _cropAreaCornerLineWidth + _cropAreaBorderLineWidth, CGRectGetMaxY(_cropAreaView.frame) - _cropAreaCornerHeight + _cropAreaCornerLineWidth - _cropAreaBorderLineWidth, _cropAreaCornerWidth, _cropAreaCornerHeight);
    //: _bottomRightCorner.frame = CGRectMake(CGRectGetMaxX(_cropAreaView.frame) - _cropAreaCornerWidth + _cropAreaCornerLineWidth - _cropAreaBorderLineWidth, CGRectGetMaxY(_cropAreaView.frame) - _cropAreaCornerHeight + _cropAreaCornerLineWidth - _cropAreaBorderLineWidth, _cropAreaCornerWidth, _cropAreaCornerHeight);
    _bottomRightCorner.frame = CGRectMake(CGRectGetMaxX(_cropAreaView.frame) - _cropAreaCornerWidth + _cropAreaCornerLineWidth - _cropAreaBorderLineWidth, CGRectGetMaxY(_cropAreaView.frame) - _cropAreaCornerHeight + _cropAreaCornerLineWidth - _cropAreaBorderLineWidth, _cropAreaCornerWidth, _cropAreaCornerHeight);

}

//: - (void)resetCropAreaOnCornersFrameChanged {
- (void)file {

    //: _cropAreaView.frame = CGRectMake(CGRectGetMinX(_topLeftCorner.frame) + self.cornerMargin, CGRectGetMinY(_topLeftCorner.frame) + self.cornerMargin, CGRectGetMaxX(_topRightCorner.frame) - CGRectGetMinX(_topLeftCorner.frame) - self.cornerMargin * 2, CGRectGetMaxY(_bottomLeftCorner.frame) - CGRectGetMinY(_topLeftCorner.frame) - self.cornerMargin * 2);
    _cropAreaView.frame = CGRectMake(CGRectGetMinX(_topLeftCorner.frame) + self.cornerMargin, CGRectGetMinY(_topLeftCorner.frame) + self.cornerMargin, CGRectGetMaxX(_topRightCorner.frame) - CGRectGetMinX(_topLeftCorner.frame) - self.cornerMargin * 2, CGRectGetMaxY(_bottomLeftCorner.frame) - CGRectGetMinY(_topLeftCorner.frame) - self.cornerMargin * 2);

}
//: - (void)resetMinSpaceIfNeeded {
- (void)state {

    //: CGFloat willMinSpace = ((CGRectGetWidth(_cropAreaView.bounds) - _cropAreaCornerWidth * 2 + self.cornerMargin * 2) < (CGRectGetHeight(_cropAreaView.bounds) - _cropAreaCornerHeight * 2 + self.cornerMargin * 2) ? (CGRectGetWidth(_cropAreaView.bounds) - _cropAreaCornerWidth * 2 + self.cornerMargin * 2) : (CGRectGetHeight(_cropAreaView.bounds) - _cropAreaCornerHeight * 2 + self.cornerMargin * 2));
    CGFloat willMinSpace = ((CGRectGetWidth(_cropAreaView.bounds) - _cropAreaCornerWidth * 2 + self.cornerMargin * 2) < (CGRectGetHeight(_cropAreaView.bounds) - _cropAreaCornerHeight * 2 + self.cornerMargin * 2) ? (CGRectGetWidth(_cropAreaView.bounds) - _cropAreaCornerWidth * 2 + self.cornerMargin * 2) : (CGRectGetHeight(_cropAreaView.bounds) - _cropAreaCornerHeight * 2 + self.cornerMargin * 2));
    //: currentMinSpace = ((willMinSpace) < (_minSpace) ? (willMinSpace) : (_minSpace));
    currentMinSpace = ((willMinSpace) < (_minSpace) ? (willMinSpace) : (_minSpace));

}
//: - (void)resetCropTransparentArea {
- (void)recording {

    //: UIBezierPath *path = [UIBezierPath bezierPathWithRect: _imageView.bounds];
    UIBezierPath *path = [UIBezierPath bezierPathWithRect: _imageView.bounds];
    //: UIBezierPath *clearPath = [[UIBezierPath bezierPathWithRect: _cropAreaView.frame] bezierPathByReversingPath];
    UIBezierPath *clearPath = [[UIBezierPath bezierPathWithRect: _cropAreaView.frame] bezierPathByReversingPath];
    //: [path appendPath: clearPath];
    [path appendPath: clearPath];
    //: CAShapeLayer *shapeLayer = (CAShapeLayer *)_cropMaskView.layer.mask;
    CAShapeLayer *shapeLayer = (CAShapeLayer *)_cropMaskView.layer.mask;
    //: if(!shapeLayer) {
    if(!shapeLayer) {
        //: shapeLayer = [CAShapeLayer layer];
        shapeLayer = [CAShapeLayer layer];
        //: [_cropMaskView.layer setMask: shapeLayer];
        [_cropMaskView.layer setMask: shapeLayer];
    }
    //: shapeLayer.path = path.CGPath;
    shapeLayer.path = path.CGPath;

}
//: - (void)resetCornersOnSizeChanged {
- (void)blue {

    //: [_topLeftCorner updateSizeWithWidth: _cropAreaCornerWidth height: _cropAreaCornerHeight];
    [_topLeftCorner languageHeight: _cropAreaCornerWidth key: _cropAreaCornerHeight];
    //: [_topRightCorner updateSizeWithWidth: _cropAreaCornerWidth height: _cropAreaCornerHeight];
    [_topRightCorner languageHeight: _cropAreaCornerWidth key: _cropAreaCornerHeight];
    //: [_bottomLeftCorner updateSizeWithWidth: _cropAreaCornerWidth height: _cropAreaCornerHeight];
    [_bottomLeftCorner languageHeight: _cropAreaCornerWidth key: _cropAreaCornerHeight];
    //: [_bottomRightCorner updateSizeWithWidth: _cropAreaCornerWidth height: _cropAreaCornerHeight];
    [_bottomRightCorner languageHeight: _cropAreaCornerWidth key: _cropAreaCornerHeight];

}
//: - (void)createCorners {
- (void)scheme {
    //: _topLeftCorner = [[CornerView alloc]initWithFrame: CGRectMake(0, 0, _cropAreaCornerWidth, _cropAreaCornerHeight) lineColor:_cropAreaCornerLineColor lineWidth: _cropAreaCornerLineWidth];
    _topLeftCorner = [[MaxNameView alloc]initWithBlue: CGRectMake(0, 0, _cropAreaCornerWidth, _cropAreaCornerHeight) than:_cropAreaCornerLineColor searched: _cropAreaCornerLineWidth];
    //: _topLeftCorner.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleRightMargin;
    _topLeftCorner.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleRightMargin;
    //: _topLeftCorner.cornerPosition = TKCropAreaCornerPositionTopLeft;
    _topLeftCorner.cornerPosition = TKCropAreaCornerPositionTopLeft;

    //: _topRightCorner = [[CornerView alloc]initWithFrame: CGRectMake(CGRectGetWidth(_imageView.bounds) - _cropAreaCornerWidth, 0, _cropAreaCornerWidth, _cropAreaCornerHeight) lineColor: _cropAreaCornerLineColor lineWidth: _cropAreaCornerLineWidth];
    _topRightCorner = [[MaxNameView alloc]initWithBlue: CGRectMake(CGRectGetWidth(_imageView.bounds) - _cropAreaCornerWidth, 0, _cropAreaCornerWidth, _cropAreaCornerHeight) than: _cropAreaCornerLineColor searched: _cropAreaCornerLineWidth];
    //: _topRightCorner.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleLeftMargin;
    _topRightCorner.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleLeftMargin;
    //: _topRightCorner.cornerPosition = TKCropAreaCornerPositionTopRight;
    _topRightCorner.cornerPosition = TKCropAreaCornerPositionTopRight;

    //: _bottomLeftCorner = [[CornerView alloc]initWithFrame: CGRectMake(0, CGRectGetHeight(_imageView.bounds) - _cropAreaCornerHeight, _cropAreaCornerWidth, _cropAreaCornerHeight) lineColor: _cropAreaCornerLineColor lineWidth: _cropAreaCornerLineWidth];
    _bottomLeftCorner = [[MaxNameView alloc]initWithBlue: CGRectMake(0, CGRectGetHeight(_imageView.bounds) - _cropAreaCornerHeight, _cropAreaCornerWidth, _cropAreaCornerHeight) than: _cropAreaCornerLineColor searched: _cropAreaCornerLineWidth];
    //: _bottomLeftCorner.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleRightMargin;
    _bottomLeftCorner.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleRightMargin;
    //: _bottomLeftCorner.cornerPosition = TKCropAreaCornerPositionBottomLeft;
    _bottomLeftCorner.cornerPosition = TKCropAreaCornerPositionBottomLeft;

    //: _bottomRightCorner = [[CornerView alloc]initWithFrame: CGRectMake(CGRectGetWidth(_imageView.bounds) - _cropAreaCornerWidth, CGRectGetHeight(_imageView.bounds) - _cropAreaCornerHeight, _cropAreaCornerWidth, _cropAreaCornerHeight) lineColor: _cropAreaCornerLineColor lineWidth: _cropAreaCornerLineWidth];
    _bottomRightCorner = [[MaxNameView alloc]initWithBlue: CGRectMake(CGRectGetWidth(_imageView.bounds) - _cropAreaCornerWidth, CGRectGetHeight(_imageView.bounds) - _cropAreaCornerHeight, _cropAreaCornerWidth, _cropAreaCornerHeight) than: _cropAreaCornerLineColor searched: _cropAreaCornerLineWidth];
    //: _bottomRightCorner.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleLeftMargin;
    _bottomRightCorner.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleLeftMargin;
    //: _bottomRightCorner.cornerPosition = TKCropAreaCornerPositionBottomRight;
    _bottomRightCorner.cornerPosition = TKCropAreaCornerPositionBottomRight;

    //: _topLeftCorner.relativeViewX = _bottomLeftCorner;
    _topLeftCorner.relativeViewX = _bottomLeftCorner;
    //: _topLeftCorner.relativeViewY = _topRightCorner;
    _topLeftCorner.relativeViewY = _topRightCorner;

    //: _topRightCorner.relativeViewX = _bottomRightCorner;
    _topRightCorner.relativeViewX = _bottomRightCorner;
    //: _topRightCorner.relativeViewY = _topLeftCorner;
    _topRightCorner.relativeViewY = _topLeftCorner;

    //: _bottomLeftCorner.relativeViewX = _topLeftCorner;
    _bottomLeftCorner.relativeViewX = _topLeftCorner;
    //: _bottomLeftCorner.relativeViewY = _bottomRightCorner;
    _bottomLeftCorner.relativeViewY = _bottomRightCorner;

    //: _bottomRightCorner.relativeViewX = _topRightCorner;
    _bottomRightCorner.relativeViewX = _topRightCorner;
    //: _bottomRightCorner.relativeViewY = _bottomLeftCorner;
    _bottomRightCorner.relativeViewY = _bottomLeftCorner;

    //: [_imageView addSubview: _topLeftCorner];
    [_imageView addSubview: _topLeftCorner];
    //: [_imageView addSubview: _topRightCorner];
    [_imageView addSubview: _topRightCorner];
    //: [_imageView addSubview: _bottomLeftCorner];
    [_imageView addSubview: _bottomLeftCorner];
    //: [_imageView addSubview: _bottomRightCorner];
    [_imageView addSubview: _bottomRightCorner];

}
//: - (void)createMidLines {
- (void)drop {

    //: if(_topMidLine && _bottomMidLine && _leftMidLine && _rightMidLine) return;
    if(_topMidLine && _bottomMidLine && _leftMidLine && _rightMidLine) return;
    //: _topMidLine = [[MidLineView alloc]initWithLineWidth: _cropAreaMidLineWidth lineHeight: _cropAreaMidLineHeight lineColor: _cropAreaMidLineColor];
    _topMidLine = [[OnView alloc]initWithTeam: _cropAreaMidLineWidth reloadity: _cropAreaMidLineHeight lineBubble: _cropAreaMidLineColor];
    //: _topMidLine.type = TKMidLineTypeTop;
    _topMidLine.type = TKMidLineTypeTop;

    //: _bottomMidLine = [[MidLineView alloc]initWithLineWidth: _cropAreaMidLineWidth lineHeight: _cropAreaMidLineHeight lineColor: _cropAreaMidLineColor];
    _bottomMidLine = [[OnView alloc]initWithTeam: _cropAreaMidLineWidth reloadity: _cropAreaMidLineHeight lineBubble: _cropAreaMidLineColor];
    //: _bottomMidLine.type = TKMidLineTypeBottom;
    _bottomMidLine.type = TKMidLineTypeBottom;

    //: _leftMidLine = [[MidLineView alloc]initWithLineWidth: _cropAreaMidLineWidth lineHeight: _cropAreaMidLineHeight lineColor: _cropAreaMidLineColor];
    _leftMidLine = [[OnView alloc]initWithTeam: _cropAreaMidLineWidth reloadity: _cropAreaMidLineHeight lineBubble: _cropAreaMidLineColor];
    //: _leftMidLine.type = TKMidLineTypeLeft;
    _leftMidLine.type = TKMidLineTypeLeft;

    //: _rightMidLine = [[MidLineView alloc]initWithLineWidth: _cropAreaMidLineWidth lineHeight: _cropAreaMidLineHeight lineColor: _cropAreaMidLineColor];
    _rightMidLine = [[OnView alloc]initWithTeam: _cropAreaMidLineWidth reloadity: _cropAreaMidLineHeight lineBubble: _cropAreaMidLineColor];
    //: _rightMidLine.type = TKMidLineTypeRight;
    _rightMidLine.type = TKMidLineTypeRight;

    //: _topMidPan = [[UIPanGestureRecognizer alloc]initWithTarget:self action: @selector(handleMidPan:)];
    _topMidPan = [[UIPanGestureRecognizer alloc]initWithTarget:self action: @selector(midses:)];
    //: [_topMidLine addGestureRecognizer: _topMidPan];
    [_topMidLine addGestureRecognizer: _topMidPan];

    //: _bottomMidPan = [[UIPanGestureRecognizer alloc]initWithTarget:self action: @selector(handleMidPan:)];
    _bottomMidPan = [[UIPanGestureRecognizer alloc]initWithTarget:self action: @selector(midses:)];
    //: [_bottomMidLine addGestureRecognizer: _bottomMidPan];
    [_bottomMidLine addGestureRecognizer: _bottomMidPan];

    //: _leftMidPan = [[UIPanGestureRecognizer alloc]initWithTarget:self action: @selector(handleMidPan:)];
    _leftMidPan = [[UIPanGestureRecognizer alloc]initWithTarget:self action: @selector(midses:)];
    //: [_leftMidLine addGestureRecognizer: _leftMidPan];
    [_leftMidLine addGestureRecognizer: _leftMidPan];

    //: _rightMidPan = [[UIPanGestureRecognizer alloc]initWithTarget:self action: @selector(handleMidPan:)];
    _rightMidPan = [[UIPanGestureRecognizer alloc]initWithTarget:self action: @selector(midses:)];
    //: [_rightMidLine addGestureRecognizer: _rightMidPan];
    [_rightMidLine addGestureRecognizer: _rightMidPan];

    //: [_cropAreaView addSubview: _topMidLine];
    [_cropAreaView addSubview: _topMidLine];
    //: [_cropAreaView addSubview: _bottomMidLine];
    [_cropAreaView addSubview: _bottomMidLine];
    //: [_cropAreaView addSubview: _leftMidLine];
    [_cropAreaView addSubview: _leftMidLine];
    //: [_cropAreaView addSubview: _rightMidLine];
    [_cropAreaView addSubview: _rightMidLine];

}
//: - (void)removeMidLines {
- (void)joint {

    //: [_topMidLine removeFromSuperview];
    [_topMidLine removeFromSuperview];
    //: [_bottomMidLine removeFromSuperview];
    [_bottomMidLine removeFromSuperview];
    //: [_leftMidLine removeFromSuperview];
    [_leftMidLine removeFromSuperview];
    //: [_rightMidLine removeFromSuperview];
    [_rightMidLine removeFromSuperview];

    //: _topMidLine = nil;
    _topMidLine = nil;
    //: _bottomMidLine = nil;
    _bottomMidLine = nil;
    //: _leftMidLine = nil;
    _leftMidLine = nil;
    //: _rightMidLine = nil;
    _rightMidLine = nil;

}
//: - (void)resetMidLines {
- (void)cellInfo {

    //: CGFloat lineMargin = _cropAreaMidLineHeight / 2.0 - _cropAreaBorderLineWidth;
    CGFloat lineMargin = _cropAreaMidLineHeight / 2.0 - _cropAreaBorderLineWidth;
    //: _topMidLine.frame = CGRectMake((CGRectGetWidth(_cropAreaView.bounds) - 44) / 2.0, - 44 / 2.0 - lineMargin, 44, 44);
    _topMidLine.frame = CGRectMake((CGRectGetWidth(_cropAreaView.bounds) - 44) / 2.0, - 44 / 2.0 - lineMargin, 44, 44);
    //: _bottomMidLine.frame = CGRectMake((CGRectGetWidth(_cropAreaView.bounds) - 44) / 2.0, CGRectGetHeight(_cropAreaView.bounds) - 44 / 2.0 + lineMargin, 44, 44);
    _bottomMidLine.frame = CGRectMake((CGRectGetWidth(_cropAreaView.bounds) - 44) / 2.0, CGRectGetHeight(_cropAreaView.bounds) - 44 / 2.0 + lineMargin, 44, 44);
    //: _leftMidLine.frame = CGRectMake(- 44 / 2.0 - lineMargin, (CGRectGetHeight(_cropAreaView.bounds) - 44) / 2.0, 44, 44);
    _leftMidLine.frame = CGRectMake(- 44 / 2.0 - lineMargin, (CGRectGetHeight(_cropAreaView.bounds) - 44) / 2.0, 44, 44);
    //: _rightMidLine.frame = CGRectMake(CGRectGetWidth(_cropAreaView.bounds) - 44 / 2.0 + lineMargin, (CGRectGetHeight(_cropAreaView.bounds) - 44) / 2.0, 44, 44);
    _rightMidLine.frame = CGRectMake(CGRectGetWidth(_cropAreaView.bounds) - 44 / 2.0 + lineMargin, (CGRectGetHeight(_cropAreaView.bounds) - 44) / 2.0, 44, 44);

}
//: - (void)resetImageView {
- (void)value {

    //: CGFloat selfAspectRatio = CGRectGetWidth(self.bounds) / CGRectGetHeight(self.bounds);
    CGFloat selfAspectRatio = CGRectGetWidth(self.bounds) / CGRectGetHeight(self.bounds);
    //: if(_imageAspectRatio > selfAspectRatio) {
    if(_imageAspectRatio > selfAspectRatio) {
        //: _paddingLeftRight = 0;
        _paddingLeftRight = 0;
        //: _paddingTopBottom = floor((CGRectGetHeight(self.bounds) - CGRectGetWidth(self.bounds) / _imageAspectRatio) / 2.0);
        _paddingTopBottom = floor((CGRectGetHeight(self.bounds) - CGRectGetWidth(self.bounds) / _imageAspectRatio) / 2.0);
        //: _imageView.frame = CGRectMake(0, _paddingTopBottom, CGRectGetWidth(self.bounds), floor(CGRectGetWidth(self.bounds) / _imageAspectRatio));
        _imageView.frame = CGRectMake(0, _paddingTopBottom, CGRectGetWidth(self.bounds), floor(CGRectGetWidth(self.bounds) / _imageAspectRatio));
    }
    //: else {
    else {
        //: _paddingTopBottom = 0;
        _paddingTopBottom = 0;
        //: _paddingLeftRight = floor((CGRectGetWidth(self.bounds) - CGRectGetHeight(self.bounds) * _imageAspectRatio) / 2.0);
        _paddingLeftRight = floor((CGRectGetWidth(self.bounds) - CGRectGetHeight(self.bounds) * _imageAspectRatio) / 2.0);
        //: _imageView.frame = CGRectMake(_paddingLeftRight, 0, floor(CGRectGetHeight(self.bounds) * _imageAspectRatio), CGRectGetHeight(self.bounds));
        _imageView.frame = CGRectMake(_paddingLeftRight, 0, floor(CGRectGetHeight(self.bounds) * _imageAspectRatio), CGRectGetHeight(self.bounds));
    }

}
//: - (void)resetCropAreaByAspectRatio {
- (void)reset {

    //: if(_imageAspectRatio == 0) return;
    if(_imageAspectRatio == 0) return;
    //: CGFloat tmpCornerMargin = self.cornerMargin * _cornerBorderInImage;
    CGFloat tmpCornerMargin = self.cornerMargin * _cornerBorderInImage;
    //: CGFloat width, height;
    CGFloat width, height;
    //: if(_cropAspectRatio == 0) {
    if(_cropAspectRatio == 0) {
        //: width = (CGRectGetWidth(_imageView.bounds) - 2 * tmpCornerMargin) * _initialScaleFactor;
        width = (CGRectGetWidth(_imageView.bounds) - 2 * tmpCornerMargin) * _initialScaleFactor;
        //: height = (CGRectGetHeight(_imageView.bounds) - 2 * tmpCornerMargin) * _initialScaleFactor;
        height = (CGRectGetHeight(_imageView.bounds) - 2 * tmpCornerMargin) * _initialScaleFactor;
        //: if(_showMidLines) {
        if(_showMidLines) {
            //: [self createMidLines];
            [self drop];
            //: [self resetMidLines];
            [self cellInfo];
        }
    }
    //: else {
    else {
        //: [self removeMidLines];
        [self joint];
        //: if(_imageAspectRatio > _cropAspectRatio) {
        if(_imageAspectRatio > _cropAspectRatio) {
            //: height = (CGRectGetHeight(_imageView.bounds) - 2 * tmpCornerMargin) * _initialScaleFactor;
            height = (CGRectGetHeight(_imageView.bounds) - 2 * tmpCornerMargin) * _initialScaleFactor;
            //: width = height * _cropAspectRatio;
            width = height * _cropAspectRatio;
        }
        //: else {
        else {
            //: width = (CGRectGetWidth(_imageView.bounds) - 2 * tmpCornerMargin) * _initialScaleFactor;
            width = (CGRectGetWidth(_imageView.bounds) - 2 * tmpCornerMargin) * _initialScaleFactor;
            //: height = width / _cropAspectRatio;
            height = width / _cropAspectRatio;
        }
    }
    //: _cropAreaView.frame = CGRectMake((CGRectGetWidth(_imageView.bounds) - width) / 2.0, (CGRectGetHeight(_imageView.bounds) - height) / 2.0, width, height);
    _cropAreaView.frame = CGRectMake((CGRectGetWidth(_imageView.bounds) - width) / 2.0, (CGRectGetHeight(_imageView.bounds) - height) / 2.0, width, height);
    //: [self resetCornersOnCropAreaFrameChanged];
    [self changed];
    //: [self resetCropTransparentArea];
    [self recording];
    //: [self resetMinSpaceIfNeeded];
    [self state];
}
//: - (void)resetCropAreaByScaleFactor: (CGFloat)scaleFactor {
- (void)rf: (CGFloat)scaleFactor {

    //: CGPoint center = _cropAreaView.center;
    CGPoint center = _cropAreaView.center;
    //: CGFloat tmpCornerMargin = self.cornerMargin * _cornerBorderInImage;
    CGFloat tmpCornerMargin = self.cornerMargin * _cornerBorderInImage;
    //: CGFloat width = _pinchOriSize.width * scaleFactor;
    CGFloat width = _pinchOriSize.width * scaleFactor;
    //: CGFloat height = _pinchOriSize.height * scaleFactor;
    CGFloat height = _pinchOriSize.height * scaleFactor;
    //: CGFloat widthMax = ((CGRectGetWidth(_imageView.bounds) - center.x - tmpCornerMargin) < (center.x - tmpCornerMargin) ? (CGRectGetWidth(_imageView.bounds) - center.x - tmpCornerMargin) : (center.x - tmpCornerMargin)) * 2;
    CGFloat widthMax = ((CGRectGetWidth(_imageView.bounds) - center.x - tmpCornerMargin) < (center.x - tmpCornerMargin) ? (CGRectGetWidth(_imageView.bounds) - center.x - tmpCornerMargin) : (center.x - tmpCornerMargin)) * 2;
    //: CGFloat widthMin = currentMinSpace + _cropAreaCornerWidth * 2.0 - tmpCornerMargin * 2.0;
    CGFloat widthMin = currentMinSpace + _cropAreaCornerWidth * 2.0 - tmpCornerMargin * 2.0;
    //: CGFloat heightMax = ((CGRectGetHeight(_imageView.bounds) - center.y - tmpCornerMargin) < (center.y - tmpCornerMargin) ? (CGRectGetHeight(_imageView.bounds) - center.y - tmpCornerMargin) : (center.y - tmpCornerMargin)) * 2;
    CGFloat heightMax = ((CGRectGetHeight(_imageView.bounds) - center.y - tmpCornerMargin) < (center.y - tmpCornerMargin) ? (CGRectGetHeight(_imageView.bounds) - center.y - tmpCornerMargin) : (center.y - tmpCornerMargin)) * 2;
    //: CGFloat heightMin = currentMinSpace + _cropAreaCornerWidth * 2.0 - tmpCornerMargin * 2;
    CGFloat heightMin = currentMinSpace + _cropAreaCornerWidth * 2.0 - tmpCornerMargin * 2;

    //: BOOL isMinimum = NO;
    BOOL isMinimum = NO;
    //: if(_cropAspectRatio > 1) {
    if(_cropAspectRatio > 1) {
        //: if(height <= heightMin) {
        if(height <= heightMin) {
            //: height = heightMin;
            height = heightMin;
            //: width = height * _cropAspectRatio;
            width = height * _cropAspectRatio;
            //: isMinimum = YES;
            isMinimum = YES;
        }
    }
    //: else {
    else {
        //: if(width <= widthMin) {
        if(width <= widthMin) {
            //: width = widthMin;
            width = widthMin;
            //: height = width / (_cropAspectRatio == 0 ? 1 : _cropAspectRatio);
            height = width / (_cropAspectRatio == 0 ? 1 : _cropAspectRatio);
            //: isMinimum = YES;
            isMinimum = YES;
        }
    }
    //: if(!isMinimum) {
    if(!isMinimum) {
        //: if(_cropAspectRatio == 0) {
        if(_cropAspectRatio == 0) {
            //: if(width >= widthMax) {
            if(width >= widthMax) {
                //: width = ((width) < (CGRectGetWidth(_imageView.bounds) - 2 * tmpCornerMargin) ? (width) : (CGRectGetWidth(_imageView.bounds) - 2 * tmpCornerMargin));
                width = ((width) < (CGRectGetWidth(_imageView.bounds) - 2 * tmpCornerMargin) ? (width) : (CGRectGetWidth(_imageView.bounds) - 2 * tmpCornerMargin));
                //: center.x = center.x > CGRectGetWidth(_imageView.bounds) / 2.0 ? CGRectGetWidth(_imageView.bounds) - width / 2.0 - tmpCornerMargin : width / 2.0 + tmpCornerMargin;
                center.x = center.x > CGRectGetWidth(_imageView.bounds) / 2.0 ? CGRectGetWidth(_imageView.bounds) - width / 2.0 - tmpCornerMargin : width / 2.0 + tmpCornerMargin;
            }
            //: if(height > heightMax) {
            if(height > heightMax) {
                //: height = ((height) < (CGRectGetHeight(_imageView.bounds) - 2 * tmpCornerMargin) ? (height) : (CGRectGetHeight(_imageView.bounds) - 2 * tmpCornerMargin));
                height = ((height) < (CGRectGetHeight(_imageView.bounds) - 2 * tmpCornerMargin) ? (height) : (CGRectGetHeight(_imageView.bounds) - 2 * tmpCornerMargin));
                //: center.y = center.y > CGRectGetHeight(_imageView.bounds) / 2.0 ? CGRectGetHeight(_imageView.bounds) - height / 2.0 - tmpCornerMargin : height / 2.0 + tmpCornerMargin;
                center.y = center.y > CGRectGetHeight(_imageView.bounds) / 2.0 ? CGRectGetHeight(_imageView.bounds) - height / 2.0 - tmpCornerMargin : height / 2.0 + tmpCornerMargin;
            }

        }
        //: else if(_imageAspectRatio > _cropAspectRatio) {
        else if(_imageAspectRatio > _cropAspectRatio) {
            //: if(height >= heightMax) {
            if(height >= heightMax) {
                //: height = ((height) < (CGRectGetHeight(_imageView.bounds) - 2 * tmpCornerMargin) ? (height) : (CGRectGetHeight(_imageView.bounds) - 2 * tmpCornerMargin));
                height = ((height) < (CGRectGetHeight(_imageView.bounds) - 2 * tmpCornerMargin) ? (height) : (CGRectGetHeight(_imageView.bounds) - 2 * tmpCornerMargin));
                //: center.y = center.y > CGRectGetHeight(_imageView.bounds) / 2.0 ? CGRectGetHeight(_imageView.bounds) - height / 2.0 - tmpCornerMargin : height / 2.0 + tmpCornerMargin;
                center.y = center.y > CGRectGetHeight(_imageView.bounds) / 2.0 ? CGRectGetHeight(_imageView.bounds) - height / 2.0 - tmpCornerMargin : height / 2.0 + tmpCornerMargin;
            }
            //: width = height * _cropAspectRatio;
            width = height * _cropAspectRatio;
            //: if(width > widthMax) {
            if(width > widthMax) {
                //: center.x = center.x > CGRectGetWidth(_imageView.bounds) / 2.0 ? CGRectGetWidth(_imageView.bounds) - width / 2.0 - tmpCornerMargin : width / 2.0 + tmpCornerMargin;
                center.x = center.x > CGRectGetWidth(_imageView.bounds) / 2.0 ? CGRectGetWidth(_imageView.bounds) - width / 2.0 - tmpCornerMargin : width / 2.0 + tmpCornerMargin;
            }
        }
        //: else {
        else {
            //: if(width >= widthMax) {
            if(width >= widthMax) {
                //: width = ((width) < (CGRectGetWidth(_imageView.bounds) - 2 * tmpCornerMargin) ? (width) : (CGRectGetWidth(_imageView.bounds) - 2 * tmpCornerMargin));
                width = ((width) < (CGRectGetWidth(_imageView.bounds) - 2 * tmpCornerMargin) ? (width) : (CGRectGetWidth(_imageView.bounds) - 2 * tmpCornerMargin));
                //: center.x = center.x > CGRectGetWidth(_imageView.bounds) / 2.0 ? CGRectGetWidth(_imageView.bounds) - width / 2.0 - tmpCornerMargin : width / 2.0 + tmpCornerMargin;
                center.x = center.x > CGRectGetWidth(_imageView.bounds) / 2.0 ? CGRectGetWidth(_imageView.bounds) - width / 2.0 - tmpCornerMargin : width / 2.0 + tmpCornerMargin;
            }
            //: height = width / _cropAspectRatio;
            height = width / _cropAspectRatio;
            //: if(height > heightMax) {
            if(height > heightMax) {
                //: center.y = center.y > CGRectGetHeight(_imageView.bounds) / 2.0 ? CGRectGetHeight(_imageView.bounds) - height / 2.0 - tmpCornerMargin : height / 2.0 + tmpCornerMargin;
                center.y = center.y > CGRectGetHeight(_imageView.bounds) / 2.0 ? CGRectGetHeight(_imageView.bounds) - height / 2.0 - tmpCornerMargin : height / 2.0 + tmpCornerMargin;
            }
        }
    }
    //: _cropAreaView.bounds = CGRectMake(0, 0, width, height);
    _cropAreaView.bounds = CGRectMake(0, 0, width, height);
    //: _cropAreaView.center = center;
    _cropAreaView.center = center;
    //: [self resetCornersOnCropAreaFrameChanged];
    [self changed];

}
//: #pragma mark - Setter & Getters
#pragma mark - Setter & Getters
//: - (void)setInitialScaleFactor:(CGFloat)initialScaleFactor {
- (void)setInitialScaleFactor:(CGFloat)initialScaleFactor {

    //: _initialScaleFactor = ((1.0f) < (initialScaleFactor) ? (1.0f) : (initialScaleFactor));
    _initialScaleFactor = ((1.0f) < (initialScaleFactor) ? (1.0f) : (initialScaleFactor));

}
//: - (CGFloat)cornerMargin {
- (CGFloat)cornerMargin {

    //: return _cropAreaCornerLineWidth - _cropAreaBorderLineWidth;
    return _cropAreaCornerLineWidth - _cropAreaBorderLineWidth;

}
//: - (void)setMaskColor:(UIColor *)maskColor {
- (void)setMaskColor:(UIColor *)maskColor {

    //: _maskColor = maskColor;
    _maskColor = maskColor;
    //: _cropMaskView.backgroundColor = maskColor;
    _cropMaskView.backgroundColor = maskColor;

}
//: - (void)setMinSpace:(CGFloat)minSpace {
- (void)setMinSpace:(CGFloat)minSpace {

    //: _minSpace = minSpace;
    _minSpace = minSpace;
    //: currentMinSpace = minSpace;
    currentMinSpace = minSpace;

}
//: - (void)setToCropImage:(UIImage *)toCropImage {
- (void)setToCropImage:(UIImage *)toCropImage {

    //: _toCropImage = toCropImage;
    _toCropImage = toCropImage;
    //: _imageAspectRatio = toCropImage.size.width / toCropImage.size.height;
    _imageAspectRatio = toCropImage.size.width / toCropImage.size.height;
    //: _imageView.image = toCropImage;
    _imageView.image = toCropImage;
    //: [self resetImageView];
    [self value];
    //: [self resetCropAreaByAspectRatio];
    [self reset];

}
//: - (void)setNeedScaleCrop:(BOOL)needScaleCrop {
- (void)setNeedScaleCrop:(BOOL)needScaleCrop {

    //: if(!_needScaleCrop && needScaleCrop) {
    if(!_needScaleCrop && needScaleCrop) {
        //: _cropAreaPinch = [[UIPinchGestureRecognizer alloc]initWithTarget: self action:@selector(handleCropAreaPinch:)];
        _cropAreaPinch = [[UIPinchGestureRecognizer alloc]initWithTarget: self action:@selector(nimPinch:)];
        //: [_cropAreaView addGestureRecognizer: _cropAreaPinch];
        [_cropAreaView addGestureRecognizer: _cropAreaPinch];
    }
    //: else if(_needScaleCrop && !needScaleCrop){
    else if(_needScaleCrop && !needScaleCrop){
        //: [_cropAreaView removeGestureRecognizer: _cropAreaPinch];
        [_cropAreaView removeGestureRecognizer: _cropAreaPinch];
        //: _cropAreaPinch = nil;
        _cropAreaPinch = nil;
    }
    //: _needScaleCrop = needScaleCrop;
    _needScaleCrop = needScaleCrop;

}
//: - (void)setCropAreaCrossLineWidth:(CGFloat)cropAreaCrossLineWidth {
- (void)setCropAreaCrossLineWidth:(CGFloat)cropAreaCrossLineWidth {

    //: _cropAreaCrossLineWidth = cropAreaCrossLineWidth;
    _cropAreaCrossLineWidth = cropAreaCrossLineWidth;
    //: _cropAreaView.crossLineWidth = cropAreaCrossLineWidth;
    _cropAreaView.crossLineWidth = cropAreaCrossLineWidth;

}
//: - (void)setCropAreaCrossLineColor:(UIColor *)cropAreaCrossLineColor {
- (void)setCropAreaCrossLineColor:(UIColor *)cropAreaCrossLineColor {

    //: _cropAreaCrossLineColor = cropAreaCrossLineColor;
    _cropAreaCrossLineColor = cropAreaCrossLineColor;
    //: _cropAreaView.crossLineColor = cropAreaCrossLineColor;
    _cropAreaView.crossLineColor = cropAreaCrossLineColor;

}
//: - (void)setCropAreaMidLineWidth:(CGFloat)cropAreaMidLineWidth {
- (void)setCropAreaMidLineWidth:(CGFloat)cropAreaMidLineWidth {

    //: _cropAreaMidLineWidth = cropAreaMidLineWidth;
    _cropAreaMidLineWidth = cropAreaMidLineWidth;
    //: _topMidLine.lineWidth = cropAreaMidLineWidth;
    _topMidLine.lineWidth = cropAreaMidLineWidth;
    //: _bottomMidLine.lineWidth = cropAreaMidLineWidth;
    _bottomMidLine.lineWidth = cropAreaMidLineWidth;
    //: _leftMidLine.lineWidth = cropAreaMidLineWidth;
    _leftMidLine.lineWidth = cropAreaMidLineWidth;
    //: _rightMidLine.lineWidth = cropAreaMidLineWidth;
    _rightMidLine.lineWidth = cropAreaMidLineWidth;
    //: if(_showMidLines) {
    if(_showMidLines) {
        //: [self resetMidLines];
        [self cellInfo];
    }

}
//: - (void)setCropAreaMidLineHeight:(CGFloat)cropAreaMidLineHeight {
- (void)setCropAreaMidLineHeight:(CGFloat)cropAreaMidLineHeight {

    //: _cropAreaMidLineHeight = cropAreaMidLineHeight;
    _cropAreaMidLineHeight = cropAreaMidLineHeight;
    //: _topMidLine.lineHeight = cropAreaMidLineHeight;
    _topMidLine.lineHeight = cropAreaMidLineHeight;
    //: _bottomMidLine.lineHeight = cropAreaMidLineHeight;
    _bottomMidLine.lineHeight = cropAreaMidLineHeight;
    //: _leftMidLine.lineHeight = cropAreaMidLineHeight;
    _leftMidLine.lineHeight = cropAreaMidLineHeight;
    //: _rightMidLine.lineHeight = cropAreaMidLineHeight;
    _rightMidLine.lineHeight = cropAreaMidLineHeight;
    //: if(_showMidLines) {
    if(_showMidLines) {
        //: [self resetMidLines];
        [self cellInfo];
    }

}
//: - (void)setCropAreaMidLineColor:(UIColor *)cropAreaMidLineColor {
- (void)setCropAreaMidLineColor:(UIColor *)cropAreaMidLineColor {

    //: _cropAreaMidLineColor = cropAreaMidLineColor;
    _cropAreaMidLineColor = cropAreaMidLineColor;
    //: _topMidLine.lineColor = cropAreaMidLineColor;
    _topMidLine.lineColor = cropAreaMidLineColor;
    //: _bottomMidLine.lineColor = cropAreaMidLineColor;
    _bottomMidLine.lineColor = cropAreaMidLineColor;
    //: _leftMidLine.lineColor = cropAreaMidLineColor;
    _leftMidLine.lineColor = cropAreaMidLineColor;
    //: _rightMidLine.lineColor = cropAreaMidLineColor;
    _rightMidLine.lineColor = cropAreaMidLineColor;

}
//: - (void)setCropAreaBorderLineWidth:(CGFloat)cropAreaBorderLineWidth {
- (void)setCropAreaBorderLineWidth:(CGFloat)cropAreaBorderLineWidth {

    //: _cropAreaBorderLineWidth = cropAreaBorderLineWidth;
    _cropAreaBorderLineWidth = cropAreaBorderLineWidth;
    //: _cropAreaView.borderWidth = cropAreaBorderLineWidth;
    _cropAreaView.borderWidth = cropAreaBorderLineWidth;
    //: [self resetCropAreaOnCornersFrameChanged];
    [self file];

}
//: - (void)setCropAreaBorderLineColor:(UIColor *)cropAreaBorderLineColor {
- (void)setCropAreaBorderLineColor:(UIColor *)cropAreaBorderLineColor {

    //: _cropAreaBorderLineColor = cropAreaBorderLineColor;
    _cropAreaBorderLineColor = cropAreaBorderLineColor;
    //: _cropAreaView.borderColor = cropAreaBorderLineColor;
    _cropAreaView.borderColor = cropAreaBorderLineColor;

}
//: - (void)setCropAreaCornerLineColor:(UIColor *)cropAreaCornerLineColor {
- (void)setCropAreaCornerLineColor:(UIColor *)cropAreaCornerLineColor {

    //: _cropAreaCrossLineColor = cropAreaCornerLineColor;
    _cropAreaCrossLineColor = cropAreaCornerLineColor;
    //: _topLeftCorner.lineColor = cropAreaCornerLineColor;
    _topLeftCorner.lineColor = cropAreaCornerLineColor;
    //: _topRightCorner.lineColor = cropAreaCornerLineColor;
    _topRightCorner.lineColor = cropAreaCornerLineColor;
    //: _bottomLeftCorner.lineColor = cropAreaCornerLineColor;
    _bottomLeftCorner.lineColor = cropAreaCornerLineColor;
    //: _bottomRightCorner.lineColor = cropAreaCornerLineColor;
    _bottomRightCorner.lineColor = cropAreaCornerLineColor;

}
//: - (void)setCropAreaCornerLineWidth:(CGFloat)cropAreaCornerLineWidth {
- (void)setCropAreaCornerLineWidth:(CGFloat)cropAreaCornerLineWidth {

    //: _cropAreaCornerLineWidth = cropAreaCornerLineWidth;
    _cropAreaCornerLineWidth = cropAreaCornerLineWidth;
    //: _topLeftCorner.lineWidth = cropAreaCornerLineWidth;
    _topLeftCorner.lineWidth = cropAreaCornerLineWidth;
    //: _topRightCorner.lineWidth = cropAreaCornerLineWidth;
    _topRightCorner.lineWidth = cropAreaCornerLineWidth;
    //: _bottomLeftCorner.lineWidth = cropAreaCornerLineWidth;
    _bottomLeftCorner.lineWidth = cropAreaCornerLineWidth;
    //: _bottomRightCorner.lineWidth = cropAreaCornerLineWidth;
    _bottomRightCorner.lineWidth = cropAreaCornerLineWidth;
    //: [self resetCropAreaByAspectRatio];
    [self reset];

}
//: - (void)setCropAreaCornerWidth:(CGFloat)cropAreaCornerWidth {
- (void)setCropAreaCornerWidth:(CGFloat)cropAreaCornerWidth {

    //: _cropAreaCornerWidth = cropAreaCornerWidth;
    _cropAreaCornerWidth = cropAreaCornerWidth;
    //: [self resetCornersOnSizeChanged];
    [self blue];

}
//: - (void)setCropAreaCornerHeight:(CGFloat)cropAreaCornerHeight {
- (void)setCropAreaCornerHeight:(CGFloat)cropAreaCornerHeight {

    //: _cropAreaCornerHeight = cropAreaCornerHeight;
    _cropAreaCornerHeight = cropAreaCornerHeight;
    //: [self resetCornersOnSizeChanged];
    [self blue];

}
//: - (void)setCropAspectRatio:(CGFloat)cropAspectRatio {
- (void)setCropAspectRatio:(CGFloat)cropAspectRatio {

    //: _cropAspectRatio = ((cropAspectRatio) > (0) ? (cropAspectRatio) : (0));
    _cropAspectRatio = ((cropAspectRatio) > (0) ? (cropAspectRatio) : (0));
    //: [self resetCropAreaByAspectRatio];
    [self reset];

}
//: - (void)setShowMidLines:(BOOL)showMidLines {
- (void)setShowMidLines:(BOOL)showMidLines {

    //: if(_cropAspectRatio == 0) {
    if(_cropAspectRatio == 0) {
        //: if(!_showMidLines && showMidLines) {
        if(!_showMidLines && showMidLines) {
            //: [self createMidLines];
            [self drop];
            //: [self resetMidLines];
            [self cellInfo];
        }
        //: else if(_showMidLines && !showMidLines) {
        else if(_showMidLines && !showMidLines) {
            //: [self removeMidLines];
            [self joint];
        }
    }
    //: _showMidLines = showMidLines;
    _showMidLines = showMidLines;

}
//: - (void)setShowCrossLines:(BOOL)showCrossLines {
- (void)setShowCrossLines:(BOOL)showCrossLines {

    //: _showCrossLines = showCrossLines;
    _showCrossLines = showCrossLines;
    //: _cropAreaView.showCrossLines = _showCrossLines;
    _cropAreaView.showCrossLines = _showCrossLines;

}
//: - (void)setCornerBorderInImage:(BOOL)cornerBorderInImage {
- (void)setCornerBorderInImage:(BOOL)cornerBorderInImage {

    //: _cornerBorderInImage = cornerBorderInImage;
    _cornerBorderInImage = cornerBorderInImage;
    //: [self resetCropAreaByAspectRatio];
    [self reset];

}
//: - (void)setFrame:(CGRect)frame {
- (void)setFrame:(CGRect)frame {

    //: [super setFrame: frame];
    [super setFrame: frame];
    //: [self resetImageView];
    [self value];

}
//: - (void)setCenter:(CGPoint)center {
- (void)setCenter:(CGPoint)center {

    //: [super setCenter: center];
    [super setCenter: center];
    //: [self resetImageView];
    [self value];

}
//: #pragma mark - KVO CallBack
#pragma mark - KVO CallBack
//: - (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {

    //: if([object isEqual: _cropAreaView]) {
    if([object isEqual: _cropAreaView]) {
        //: if(_showMidLines){
        if(_showMidLines){
            //: [self resetMidLines];
            [self cellInfo];
        }
        //: [self resetCropTransparentArea];
        [self recording];
        //: return;
        return;
    }
    //: if([object isEqual: _imageView]) {
    if([object isEqual: _imageView]) {
        //: [self resetCropAreaByAspectRatio];
        [self reset];
    }

}
//: #pragma Instance Methods
#pragma Instance Methods
//: - (UIImage *)currentCroppedImage {
- (UIImage *)greenOffInterval {

    //: CGFloat scaleFactor = CGRectGetWidth(_imageView.bounds) / _toCropImage.size.width;
    CGFloat scaleFactor = CGRectGetWidth(_imageView.bounds) / _toCropImage.size.width;
    //: return [_toCropImage imageAtRect: CGRectMake((CGRectGetMinX(_cropAreaView.frame) + _cropAreaBorderLineWidth) / scaleFactor, (CGRectGetMinY(_cropAreaView.frame) + _cropAreaBorderLineWidth) / scaleFactor, (CGRectGetWidth(_cropAreaView.bounds) - 2 * _cropAreaBorderLineWidth) / scaleFactor, (CGRectGetHeight(_cropAreaView.bounds) - 2 * _cropAreaBorderLineWidth) / scaleFactor)];
    return [_toCropImage range: CGRectMake((CGRectGetMinX(_cropAreaView.frame) + _cropAreaBorderLineWidth) / scaleFactor, (CGRectGetMinY(_cropAreaView.frame) + _cropAreaBorderLineWidth) / scaleFactor, (CGRectGetWidth(_cropAreaView.bounds) - 2 * _cropAreaBorderLineWidth) / scaleFactor, (CGRectGetHeight(_cropAreaView.bounds) - 2 * _cropAreaBorderLineWidth) / scaleFactor)];

}
//: @end
@end

Byte *HelpDataToByte(HelpData *data) {
    if (data->weekendRide) return data->wasteExcited;
    for (int i = 0; i < data->hareEye; i++) {
        data->wasteExcited[i] ^= data->goalMathematicMarble;
    }
    data->wasteExcited[data->hareEye] = 0;
    data->weekendRide = true;
	if (data->hareEye >= 1) {
		data->byScheme = data->wasteExcited[0];
	}
    return data->wasteExcited;
}

NSString *StringFromHelpData(HelpData *data) {
    return [NSString stringWithUTF8String:(char *)HelpDataToByte(data)];
}
