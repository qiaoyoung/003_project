// __DEBUG__
// __CLOSE_PRINT__
//
//  KEKEProject
//  KEKEChat
//
//  Created by tyl.
//  Copyright © 2024 Ali. All rights reserved.
//

// __M_A_C_R_O__
//: #import "SGScanView.h"
#import "ToTitleView.h"
//: #import "SGScanViewConfigure.h"
#import "ToContainerConfigure.h"
//: #import "SGWeakProxy.h"
#import "MinProxy.h"
//: #import "SGQRCodeLog.h"
#import "MaxLog.h"

//: @interface SGScanView ()
@interface ToTitleView ()
//: @property (nonatomic, strong) SGScanViewConfigure *configure;
@property (nonatomic, strong) ToContainerConfigure *configure;
//: @property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) UIView *contentView;
//: @property (nonatomic, strong) UIImageView *scanlineImgView;
@property (nonatomic, strong) UIImageView *scanlineImgView;
//: @property (nonatomic, strong) CADisplayLink *link;
@property (nonatomic, strong) CADisplayLink *link;
//: @property (nonatomic, assign) BOOL isTop;
@property (nonatomic, assign) BOOL isTop;
//: @property (nonatomic, assign) BOOL isSelected;
@property (nonatomic, assign) BOOL isSelected;
//: @end
@end

//: @implementation SGScanView
@implementation ToTitleView

//: - (void)dealloc {
- (void)dealloc {
    //: if ([SGQRCodeLog sharedQRCodeLog].log) {
    if ([MaxLog tableLog].log) {
        //: NSLog(@"SGScanView - - dealloc");
    }
}

//: - (instancetype)initWithFrame:(CGRect)frame configure:(SGScanViewConfigure *)configure {
- (instancetype)initWithShowBy:(CGRect)frame name:(ToContainerConfigure *)configure {
    //: if (self = [super initWithFrame:frame]) {
    if (self = [super initWithFrame:frame]) {
        //: self.configure = configure;
        self.configure = configure;

        //: self.backgroundColor = [UIColor clearColor];
        self.backgroundColor = [UIColor clearColor];

        //: [self initialization];
        [self domain];
        //: [self addSubview:self.contentView];
        [self addSubview:self.contentView];

        //: UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap_action)];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(buttonObject)];
        //: tap.numberOfTapsRequired = 2;
        tap.numberOfTapsRequired = 2;
        //: [self addGestureRecognizer:tap];
        [self addGestureRecognizer:tap];
    }
    //: return self;
    return self;
}

//: + (instancetype)scanViewWithFrame:(CGRect)frame configure:(SGScanViewConfigure *)configure {
+ (instancetype)atIn:(CGRect)frame betweenQuery_strong:(ToContainerConfigure *)configure {
    //: return [[SGScanView alloc] initWithFrame:frame configure:configure];
    return [[ToTitleView alloc] initWithShowBy:frame name:configure];
}

//: - (void)initialization {
- (void)domain {
    //: CGFloat w = 0.7 * self.frame.size.width;
    CGFloat w = 0.7 * self.frame.size.width;
    //: CGFloat h = w;
    CGFloat h = w;
    //: CGFloat x = 0.5 * (self.frame.size.width - w);
    CGFloat x = 0.5 * (self.frame.size.width - w);
    //: CGFloat y = 0.5 * (self.frame.size.height - h);
    CGFloat y = 0.5 * (self.frame.size.height - h);
    //: _borderFrame = CGRectMake(x, y, w, h);
    _borderFrame = CGRectMake(x, y, w, h);
    //: _scanFrame = CGRectMake(x, y, w, h);
    _scanFrame = CGRectMake(x, y, w, h);

    //: self.isTop = YES;
    self.isTop = YES;
}

//: - (UIView *)contentView {
- (UIView *)contentView {
    //: if (!_contentView) {
    if (!_contentView) {
        //: CGFloat x = _scanFrame.origin.x;
        CGFloat x = _scanFrame.origin.x;
        //: CGFloat y = _scanFrame.origin.y;
        CGFloat y = _scanFrame.origin.y;
        //: CGFloat w = _scanFrame.size.width;
        CGFloat w = _scanFrame.size.width;
        //: CGFloat h = _scanFrame.size.height;
        CGFloat h = _scanFrame.size.height;
        //: _contentView = [[UIView alloc] initWithFrame:CGRectMake(x, y, w, h)];
        _contentView = [[UIView alloc] initWithFrame:CGRectMake(x, y, w, h)];
        //: _contentView.backgroundColor = [UIColor clearColor];
        _contentView.backgroundColor = [UIColor clearColor];
        //: _contentView.clipsToBounds = YES;
        _contentView.clipsToBounds = YES;
    }
    //: return _contentView;
    return _contentView;
}

//: - (UIImageView *)scanlineImgView {
- (UIImageView *)scanlineImgView {
    //: if (!_scanlineImgView) {
    if (!_scanlineImgView) {
        //: _scanlineImgView = [[UIImageView alloc] init];
        _scanlineImgView = [[UIImageView alloc] init];

        //: UIImage *image = [UIImage imageNamed:self.configure.scanline];
        UIImage *image = [UIImage imageNamed:self.configure.scanline];
        //: _scanlineImgView.image = image;
        _scanlineImgView.image = image;

        //: if (image) {
        if (image) {
            //: [self updateScanLineFrame];
            [self photo];
        }
    }
    //: return _scanlineImgView;
    return _scanlineImgView;
}

//: - (void)tap_action {
- (void)buttonObject {
    //: if (self.isSelected) {
    if (self.isSelected) {
        //: self.isSelected = NO;
        self.isSelected = NO;
    //: } else {
    } else {
        //: self.isSelected = YES;
        self.isSelected = YES;
    }

    //: if (self.doubleTapBlock) {
    if (self.doubleTapBlock) {
        //: self.doubleTapBlock(self.isSelected);
        self.doubleTapBlock(self.isSelected);
    }
}

//: - (void)drawRect:(CGRect)rect {
- (void)drawRect:(CGRect)rect {
    //: [super drawRect:rect];
    [super drawRect:rect];

    //: if (self.configure.isShowBorder == NO) {
    if (self.configure.isShowBorder == NO) {
        //: return;
        return;
    }

    /// 边框 frame
    //: CGFloat borderW = self.borderFrame.size.width;
    CGFloat borderW = self.borderFrame.size.width;
    //: CGFloat borderH = self.borderFrame.size.height;
    CGFloat borderH = self.borderFrame.size.height;
    //: CGFloat borderX = self.borderFrame.origin.x;
    CGFloat borderX = self.borderFrame.origin.x;
    //: CGFloat borderY = self.borderFrame.origin.y;
    CGFloat borderY = self.borderFrame.origin.y;
    //: CGFloat borderLineW = self.configure.borderWidth;
    CGFloat borderLineW = self.configure.borderWidth;

    /// 空白区域设置
    //: [self.configure.color setFill];
    [self.configure.color setFill];
    //: UIRectFill(rect);
    UIRectFill(rect);
    // 获取上下文，并设置混合模式 -> kCGBlendModeDestinationOut
    //: CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextRef context = UIGraphicsGetCurrentContext();
    //: CGContextSetBlendMode(context, kCGBlendModeDestinationOut);
    CGContextSetBlendMode(context, kCGBlendModeDestinationOut);
    // 设置空白区
    //: UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRect:CGRectMake(borderX + 0.5 * borderLineW, borderY + 0.5 *borderLineW, borderW - borderLineW, borderH - borderLineW)];
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRect:CGRectMake(borderX + 0.5 * borderLineW, borderY + 0.5 *borderLineW, borderW - borderLineW, borderH - borderLineW)];
    //: [bezierPath fill];
    [bezierPath fill];
    // 执行混合模式
    //: CGContextSetBlendMode(context, kCGBlendModeNormal);
    CGContextSetBlendMode(context, kCGBlendModeNormal);


    /// 边框设置
    //: UIBezierPath *borderPath = [UIBezierPath bezierPathWithRect:CGRectMake(borderX, borderY, borderW, borderH)];
    UIBezierPath *borderPath = [UIBezierPath bezierPathWithRect:CGRectMake(borderX, borderY, borderW, borderH)];
    //: borderPath.lineCapStyle = kCGLineCapButt;
    borderPath.lineCapStyle = kCGLineCapButt;
    //: borderPath.lineWidth = borderLineW;
    borderPath.lineWidth = borderLineW;
    //: [self.configure.borderColor set];
    [self.configure.borderColor set];
    //: [borderPath stroke];
    [borderPath stroke];


    //: CGFloat cornerLength = self.configure.cornerLength;
    CGFloat cornerLength = self.configure.cornerLength;
    //: CGFloat insideExcess = fabs(0.5 * (self.configure.cornerWidth - borderLineW));
    CGFloat insideExcess = fabs(0.5 * (self.configure.cornerWidth - borderLineW));
    //: CGFloat outsideExcess = 0.5 * (borderLineW + self.configure.cornerWidth);
    CGFloat outsideExcess = 0.5 * (borderLineW + self.configure.cornerWidth);

    /// 左上角小图标
    //: [self leftTop:borderX borderY:borderY cornerLength:cornerLength insideExcess:insideExcess outsideExcess:outsideExcess];
    [self underTime:borderX tillBy:borderY indoors:cornerLength keyWith:insideExcess colorOn:outsideExcess];

    /// 左下角小图标
    //: [self leftBottom:borderX borderY:borderY borderH:borderH cornerLength:cornerLength insideExcess:insideExcess outsideExcess:outsideExcess];
    [self versionAcross:borderX withFloat:borderY stochastic:borderH cryPush:cornerLength option:insideExcess titleFloat:outsideExcess];

    /// 右上角小图标
    //: [self rightTop:borderX borderY:borderY borderW:borderW cornerLength:cornerLength insideExcess:insideExcess outsideExcess:outsideExcess];
    [self action:borderX reason:borderY placeExcess:borderW completeExcess:cornerLength boundMax:insideExcess day:outsideExcess];

    /// 右下角小图标
    //: [self rightBottom:borderX borderY:borderY borderW:borderW borderH:borderH cornerLength:cornerLength insideExcess:insideExcess outsideExcess:outsideExcess];
    [self surplusage:borderX rightMessage:borderY far:borderW sub:borderH tool:cornerLength flush:insideExcess threadTitle:outsideExcess];
}

//: - (void)leftTop:(CGFloat)borderX borderY:(CGFloat)borderY cornerLength:(CGFloat)cornerLength insideExcess:(CGFloat) insideExcess outsideExcess:(CGFloat)outsideExcess {
- (void)underTime:(CGFloat)borderX tillBy:(CGFloat)borderY indoors:(CGFloat)cornerLength keyWith:(CGFloat) insideExcess colorOn:(CGFloat)outsideExcess {
    //: UIBezierPath *leftTopPath = [UIBezierPath bezierPath];
    UIBezierPath *leftTopPath = [UIBezierPath bezierPath];
    //: leftTopPath.lineWidth = self.configure.cornerWidth;
    leftTopPath.lineWidth = self.configure.cornerWidth;
    //: [self.configure.cornerColor set];
    [self.configure.cornerColor set];

    //: if (self.configure.cornerLocation == SGCornerLoactionInside) {
    if (self.configure.cornerLocation == SGCornerLoactionInside) {
        //: [leftTopPath moveToPoint:CGPointMake(borderX + insideExcess, borderY + cornerLength + insideExcess)];
        [leftTopPath moveToPoint:CGPointMake(borderX + insideExcess, borderY + cornerLength + insideExcess)];
        //: [leftTopPath addLineToPoint:CGPointMake(borderX + insideExcess, borderY + insideExcess)];
        [leftTopPath addLineToPoint:CGPointMake(borderX + insideExcess, borderY + insideExcess)];
        //: [leftTopPath addLineToPoint:CGPointMake(borderX + cornerLength + insideExcess, borderY + insideExcess)];
        [leftTopPath addLineToPoint:CGPointMake(borderX + cornerLength + insideExcess, borderY + insideExcess)];
    //: } else if (self.configure.cornerLocation == SGCornerLoactionOutside) {
    } else if (self.configure.cornerLocation == SGCornerLoactionOutside) {
        //: [leftTopPath moveToPoint:CGPointMake(borderX - outsideExcess, borderY + cornerLength - outsideExcess)];
        [leftTopPath moveToPoint:CGPointMake(borderX - outsideExcess, borderY + cornerLength - outsideExcess)];
        //: [leftTopPath addLineToPoint:CGPointMake(borderX - outsideExcess, borderY - outsideExcess)];
        [leftTopPath addLineToPoint:CGPointMake(borderX - outsideExcess, borderY - outsideExcess)];
        //: [leftTopPath addLineToPoint:CGPointMake(borderX + cornerLength - outsideExcess, borderY - outsideExcess)];
        [leftTopPath addLineToPoint:CGPointMake(borderX + cornerLength - outsideExcess, borderY - outsideExcess)];
    //: } else {
    } else {
        //: [leftTopPath moveToPoint:CGPointMake(borderX, borderY + cornerLength)];
        [leftTopPath moveToPoint:CGPointMake(borderX, borderY + cornerLength)];
        //: [leftTopPath addLineToPoint:CGPointMake(borderX, borderY)];
        [leftTopPath addLineToPoint:CGPointMake(borderX, borderY)];
        //: [leftTopPath addLineToPoint:CGPointMake(borderX + cornerLength, borderY)];
        [leftTopPath addLineToPoint:CGPointMake(borderX + cornerLength, borderY)];
    }

    //: [leftTopPath stroke];
    [leftTopPath stroke];
}

//: - (void)rightTop:(CGFloat)borderX borderY:(CGFloat)borderY borderW:(CGFloat)borderW cornerLength:(CGFloat)cornerLength insideExcess:(CGFloat) insideExcess outsideExcess:(CGFloat)outsideExcess {
- (void)action:(CGFloat)borderX reason:(CGFloat)borderY placeExcess:(CGFloat)borderW completeExcess:(CGFloat)cornerLength boundMax:(CGFloat) insideExcess day:(CGFloat)outsideExcess {
    //: UIBezierPath *rightTopPath = [UIBezierPath bezierPath];
    UIBezierPath *rightTopPath = [UIBezierPath bezierPath];
    //: rightTopPath.lineWidth = self.configure.cornerWidth;
    rightTopPath.lineWidth = self.configure.cornerWidth;
    //: [self.configure.cornerColor set];
    [self.configure.cornerColor set];

    //: if (self.configure.cornerLocation == SGCornerLoactionInside) {
    if (self.configure.cornerLocation == SGCornerLoactionInside) {
        //: [rightTopPath moveToPoint:CGPointMake(borderX + borderW - cornerLength - insideExcess, borderY + insideExcess)];
        [rightTopPath moveToPoint:CGPointMake(borderX + borderW - cornerLength - insideExcess, borderY + insideExcess)];
        //: [rightTopPath addLineToPoint:CGPointMake(borderX + borderW - insideExcess, borderY + insideExcess)];
        [rightTopPath addLineToPoint:CGPointMake(borderX + borderW - insideExcess, borderY + insideExcess)];
        //: [rightTopPath addLineToPoint:CGPointMake(borderX + borderW - insideExcess, borderY + cornerLength + insideExcess)];
        [rightTopPath addLineToPoint:CGPointMake(borderX + borderW - insideExcess, borderY + cornerLength + insideExcess)];
    //: } else if (self.configure.cornerLocation == SGCornerLoactionOutside) {
    } else if (self.configure.cornerLocation == SGCornerLoactionOutside) {
        //: [rightTopPath moveToPoint:CGPointMake(borderX + borderW - cornerLength + outsideExcess, borderY - outsideExcess)];
        [rightTopPath moveToPoint:CGPointMake(borderX + borderW - cornerLength + outsideExcess, borderY - outsideExcess)];
        //: [rightTopPath addLineToPoint:CGPointMake(borderX + borderW + outsideExcess, borderY - outsideExcess)];
        [rightTopPath addLineToPoint:CGPointMake(borderX + borderW + outsideExcess, borderY - outsideExcess)];
        //: [rightTopPath addLineToPoint:CGPointMake(borderX + borderW + outsideExcess, borderY + cornerLength - outsideExcess)];
        [rightTopPath addLineToPoint:CGPointMake(borderX + borderW + outsideExcess, borderY + cornerLength - outsideExcess)];
    //: } else {
    } else {
        //: [rightTopPath moveToPoint:CGPointMake(borderX + borderW - cornerLength, borderY)];
        [rightTopPath moveToPoint:CGPointMake(borderX + borderW - cornerLength, borderY)];
        //: [rightTopPath addLineToPoint:CGPointMake(borderX + borderW, borderY)];
        [rightTopPath addLineToPoint:CGPointMake(borderX + borderW, borderY)];
        //: [rightTopPath addLineToPoint:CGPointMake(borderX + borderW, borderY + cornerLength)];
        [rightTopPath addLineToPoint:CGPointMake(borderX + borderW, borderY + cornerLength)];
    }

    //: [rightTopPath stroke];
    [rightTopPath stroke];
}

//: - (void)leftBottom:(CGFloat)borderX borderY:(CGFloat)borderY borderH:(CGFloat)borderH cornerLength:(CGFloat)cornerLength insideExcess:(CGFloat) insideExcess outsideExcess:(CGFloat)outsideExcess {
- (void)versionAcross:(CGFloat)borderX withFloat:(CGFloat)borderY stochastic:(CGFloat)borderH cryPush:(CGFloat)cornerLength option:(CGFloat) insideExcess titleFloat:(CGFloat)outsideExcess {
    //: UIBezierPath *leftBottomPath = [UIBezierPath bezierPath];
    UIBezierPath *leftBottomPath = [UIBezierPath bezierPath];
    //: leftBottomPath.lineWidth = self.configure.cornerWidth;
    leftBottomPath.lineWidth = self.configure.cornerWidth;
    //: [self.configure.cornerColor set];
    [self.configure.cornerColor set];

    //: if (self.configure.cornerLocation == SGCornerLoactionInside) {
    if (self.configure.cornerLocation == SGCornerLoactionInside) {
        //: [leftBottomPath moveToPoint:CGPointMake(borderX + cornerLength + insideExcess, borderY + borderH - insideExcess)];
        [leftBottomPath moveToPoint:CGPointMake(borderX + cornerLength + insideExcess, borderY + borderH - insideExcess)];
        //: [leftBottomPath addLineToPoint:CGPointMake(borderX + insideExcess, borderY + borderH - insideExcess)];
        [leftBottomPath addLineToPoint:CGPointMake(borderX + insideExcess, borderY + borderH - insideExcess)];
        //: [leftBottomPath addLineToPoint:CGPointMake(borderX + insideExcess, borderY + borderH - cornerLength - insideExcess)];
        [leftBottomPath addLineToPoint:CGPointMake(borderX + insideExcess, borderY + borderH - cornerLength - insideExcess)];
    //: } else if (self.configure.cornerLocation == SGCornerLoactionOutside) {
    } else if (self.configure.cornerLocation == SGCornerLoactionOutside) {
        //: [leftBottomPath moveToPoint:CGPointMake(borderX + cornerLength - outsideExcess, borderY + borderH + outsideExcess)];
        [leftBottomPath moveToPoint:CGPointMake(borderX + cornerLength - outsideExcess, borderY + borderH + outsideExcess)];
        //: [leftBottomPath addLineToPoint:CGPointMake(borderX - outsideExcess, borderY + borderH + outsideExcess)];
        [leftBottomPath addLineToPoint:CGPointMake(borderX - outsideExcess, borderY + borderH + outsideExcess)];
        //: [leftBottomPath addLineToPoint:CGPointMake(borderX - outsideExcess, borderY + borderH - cornerLength + outsideExcess)];
        [leftBottomPath addLineToPoint:CGPointMake(borderX - outsideExcess, borderY + borderH - cornerLength + outsideExcess)];
    //: } else {
    } else {
        //: [leftBottomPath moveToPoint:CGPointMake(borderX + cornerLength, borderY + borderH)];
        [leftBottomPath moveToPoint:CGPointMake(borderX + cornerLength, borderY + borderH)];
        //: [leftBottomPath addLineToPoint:CGPointMake(borderX, borderY + borderH)];
        [leftBottomPath addLineToPoint:CGPointMake(borderX, borderY + borderH)];
        //: [leftBottomPath addLineToPoint:CGPointMake(borderX, borderY + borderH - cornerLength)];
        [leftBottomPath addLineToPoint:CGPointMake(borderX, borderY + borderH - cornerLength)];
    }

    //: [leftBottomPath stroke];
    [leftBottomPath stroke];
}

//: - (void)rightBottom:(CGFloat)borderX borderY:(CGFloat)borderY borderW:(CGFloat)borderW borderH:(CGFloat)borderH cornerLength:(CGFloat)cornerLength insideExcess:(CGFloat) insideExcess outsideExcess:(CGFloat)outsideExcess {
- (void)surplusage:(CGFloat)borderX rightMessage:(CGFloat)borderY far:(CGFloat)borderW sub:(CGFloat)borderH tool:(CGFloat)cornerLength flush:(CGFloat) insideExcess threadTitle:(CGFloat)outsideExcess {
    //: UIBezierPath *rightBottomPath = [UIBezierPath bezierPath];
    UIBezierPath *rightBottomPath = [UIBezierPath bezierPath];
    //: rightBottomPath.lineWidth = self.configure.cornerWidth;
    rightBottomPath.lineWidth = self.configure.cornerWidth;
    //: [self.configure.cornerColor set];
    [self.configure.cornerColor set];

    //: if (self.configure.cornerLocation == SGCornerLoactionInside) {
    if (self.configure.cornerLocation == SGCornerLoactionInside) {
        //: [rightBottomPath moveToPoint:CGPointMake(borderX + borderW - insideExcess, borderY + borderH - cornerLength - insideExcess)];
        [rightBottomPath moveToPoint:CGPointMake(borderX + borderW - insideExcess, borderY + borderH - cornerLength - insideExcess)];
        //: [rightBottomPath addLineToPoint:CGPointMake(borderX + borderW - insideExcess, borderY + borderH - insideExcess)];
        [rightBottomPath addLineToPoint:CGPointMake(borderX + borderW - insideExcess, borderY + borderH - insideExcess)];
        //: [rightBottomPath addLineToPoint:CGPointMake(borderX + borderW - cornerLength - insideExcess, borderY + borderH - insideExcess)];
        [rightBottomPath addLineToPoint:CGPointMake(borderX + borderW - cornerLength - insideExcess, borderY + borderH - insideExcess)];
    //: } else if (self.configure.cornerLocation == SGCornerLoactionOutside) {
    } else if (self.configure.cornerLocation == SGCornerLoactionOutside) {
        //: [rightBottomPath moveToPoint:CGPointMake(borderX + borderW + outsideExcess, borderY + borderH - cornerLength + outsideExcess)];
        [rightBottomPath moveToPoint:CGPointMake(borderX + borderW + outsideExcess, borderY + borderH - cornerLength + outsideExcess)];
        //: [rightBottomPath addLineToPoint:CGPointMake(borderX + borderW + outsideExcess, borderY + borderH + outsideExcess)];
        [rightBottomPath addLineToPoint:CGPointMake(borderX + borderW + outsideExcess, borderY + borderH + outsideExcess)];
        //: [rightBottomPath addLineToPoint:CGPointMake(borderX + borderW - cornerLength + outsideExcess, borderY + borderH + outsideExcess)];
        [rightBottomPath addLineToPoint:CGPointMake(borderX + borderW - cornerLength + outsideExcess, borderY + borderH + outsideExcess)];
    //: } else {
    } else {
        //: [rightBottomPath moveToPoint:CGPointMake(borderX + borderW, borderY + borderH - cornerLength)];
        [rightBottomPath moveToPoint:CGPointMake(borderX + borderW, borderY + borderH - cornerLength)];
        //: [rightBottomPath addLineToPoint:CGPointMake(borderX + borderW, borderY + borderH)];
        [rightBottomPath addLineToPoint:CGPointMake(borderX + borderW, borderY + borderH)];
        //: [rightBottomPath addLineToPoint:CGPointMake(borderX + borderW - cornerLength, borderY + borderH)];
        [rightBottomPath addLineToPoint:CGPointMake(borderX + borderW - cornerLength, borderY + borderH)];
    }

    //: [rightBottomPath stroke];
    [rightBottomPath stroke];
}

//: - (void)setBorderFrame:(CGRect)borderFrame {
- (void)setBorderFrame:(CGRect)borderFrame {
    //: _borderFrame = borderFrame;
    _borderFrame = borderFrame;
}

//: - (void)setScanFrame:(CGRect)scanFrame {
- (void)setScanFrame:(CGRect)scanFrame {
    //: _scanFrame = scanFrame;
    _scanFrame = scanFrame;

    //: self.contentView.frame = scanFrame;
    self.contentView.frame = scanFrame;

    //: if (self.scanlineImgView.image) {
    if (self.scanlineImgView.image) {
        //: [self updateScanLineFrame];
        [self photo];
    }
}

//: - (void)updateScanLineFrame {
- (void)photo {
    //: CGFloat w = _contentView.frame.size.width;
    CGFloat w = _contentView.frame.size.width;
    //: CGFloat h = (w * self.scanlineImgView.image.size.height) / self.scanlineImgView.image.size.width;
    CGFloat h = (w * self.scanlineImgView.image.size.height) / self.scanlineImgView.image.size.width;
    //: CGFloat x = 0;
    CGFloat x = 0;
    //: CGFloat y = self.configure.isFromTop ? -h : 0;
    CGFloat y = self.configure.isFromTop ? -h : 0;
    //: self.scanlineImgView.frame = CGRectMake(x, y, w, h);
    self.scanlineImgView.frame = CGRectMake(x, y, w, h);
}

//: - (void)startScanning {
- (void)line {
    //: if (self.scanlineImgView.image == nil) {
    if (self.scanlineImgView.image == nil) {
        //: return;
        return;
    }

    //: [self.contentView addSubview:self.scanlineImgView];
    [self.contentView addSubview:self.scanlineImgView];

    //: if (self.link == nil) {
    if (self.link == nil) {
        //: self.link = [CADisplayLink displayLinkWithTarget:[SGWeakProxy weakProxyWithTarget:self] selector:@selector(updateUI)];
        self.link = [CADisplayLink displayLinkWithTarget:[MinProxy lightGreen:self] selector:@selector(updateUI)];
        //: [self.link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
        [self.link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
    }
}

//: - (void)stopScanning {
- (void)infoVertical {
    //: if (self.scanlineImgView.image == nil) {
    if (self.scanlineImgView.image == nil) {
        //: return;
        return;
    }

    // 此代码防止由于外界逻辑，可能会导致多次停止
    //: if (self.link == nil) {
    if (self.link == nil) {
        //: return;
        return;
    }

    //: [self.scanlineImgView removeFromSuperview];
    [self.scanlineImgView removeFromSuperview];
    //: self.scanlineImgView = nil;
    self.scanlineImgView = nil;

    //: [self.link invalidate];
    [self.link invalidate];
    //: self.link = nil;
    self.link = nil;
}

//: - (void)updateUI {
- (void)loadPin {
    //: CGRect frame = self.scanlineImgView.frame;
    CGRect frame = self.scanlineImgView.frame;
    //: CGFloat contentViewHeight = CGRectGetHeight(self.contentView.frame);
    CGFloat contentViewHeight = CGRectGetHeight(self.contentView.frame);

    //: CGFloat scanlineY = self.scanlineImgView.frame.origin.y + (self.configure.isFromTop ? 0 : self.scanlineImgView.frame.size.height);
    CGFloat scanlineY = self.scanlineImgView.frame.origin.y + (self.configure.isFromTop ? 0 : self.scanlineImgView.frame.size.height);

    //: if (self.configure.autoreverses) {
    if (self.configure.autoreverses) {
        //: if (self.isTop) {
        if (self.isTop) {
            //: frame.origin.y += self.configure.scanlineStep;
            frame.origin.y += self.configure.scanlineStep;
            //: self.scanlineImgView.frame = frame;
            self.scanlineImgView.frame = frame;

            //: if (contentViewHeight <= scanlineY) {
            if (contentViewHeight <= scanlineY) {
                //: self.isTop = NO;
                self.isTop = NO;
            }
        //: } else {
        } else {
            //: frame.origin.y -= self.configure.scanlineStep;
            frame.origin.y -= self.configure.scanlineStep;
            //: self.scanlineImgView.frame = frame;
            self.scanlineImgView.frame = frame;

            //: if (scanlineY <= self.scanlineImgView.frame.size.height) {
            if (scanlineY <= self.scanlineImgView.frame.size.height) {
                //: self.isTop = YES;
                self.isTop = YES;
            }
        }
    //: } else {
    } else {
        //: if (contentViewHeight <= scanlineY) {
        if (contentViewHeight <= scanlineY) {
            //: CGFloat scanlineH = self.scanlineImgView.frame.size.height;
            CGFloat scanlineH = self.scanlineImgView.frame.size.height;
            //: frame.origin.y = -scanlineH + (self.configure.isFromTop ? 0 : scanlineH);
            frame.origin.y = -scanlineH + (self.configure.isFromTop ? 0 : scanlineH);

            //: self.scanlineImgView.frame = frame;
            self.scanlineImgView.frame = frame;
            //: self.scanlineImgView.alpha = 0;
            self.scanlineImgView.alpha = 0;
        //: } else {
        } else {
            //: frame.origin.y += self.configure.scanlineStep;
            frame.origin.y += self.configure.scanlineStep;
            //: self.scanlineImgView.frame = frame;
            self.scanlineImgView.frame = frame;
            //: if(frame.origin.y<=35){
            if(frame.origin.y<=35){
                //: self.scanlineImgView.alpha = frame.origin.y/35;
                self.scanlineImgView.alpha = frame.origin.y/35;
            //: }else if (frame.origin.y > contentViewHeight-100){
            }else if (frame.origin.y > contentViewHeight-100){
                //: self.scanlineImgView.alpha = 0.5 - (frame.origin.y/(contentViewHeight-100)-1);
                self.scanlineImgView.alpha = 0.5 - (frame.origin.y/(contentViewHeight-100)-1);
            //: }else{
            }else{
                //: self.scanlineImgView.alpha = 1;
                self.scanlineImgView.alpha = 1;
            }
        }
    }
}

//: @end
@end