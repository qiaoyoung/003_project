// __DEBUG__
// __CLOSE_PRINT__
//
//  KIImageCropView.m
//  Kitalker
//
//  Created by chen on 13-7-11.
//  
//

// __M_A_C_R_O__
//: #import "KIImageCropperView.h"
#import "MeanSolarDayView.h"

//: @interface KIImageCropperMaskView : UIView {
@interface LineupView : UIView {
//: @private
@private
    //: CGRect _maskRect;
    CGRect _maskRect;
}
//: - (void)setMaskSize:(CGSize)size;
- (void)setRow:(CGSize)size;
//: - (CGSize)maskSize;
- (CGSize)row;
//: @end
@end

//: @interface KIImageCropperView() {
@interface MeanSolarDayView() {
    //: KIImageCropperMaskView *_maskView;
    LineupView *_maskView;
    //: UIEdgeInsets _imageViewInsets;
    UIEdgeInsets _imageViewInsets;
    //: CGFloat _maskViewZoomScale;
    CGFloat _maskViewZoomScale;
    //: CGSize _maskViewSize;
    CGSize _maskViewSize;
}

//: @end
@end

//: @implementation KIImageCropperView
@implementation MeanSolarDayView

//: @synthesize cropRatio = _cropRatio;
@synthesize cropRatio = _cropRatio;
//: @synthesize cropSize = _cropSize;
@synthesize cropSize = _cropSize;
//: @synthesize image = _image;
@synthesize image = _image;
//: @synthesize padding = _padding;
@synthesize padding = _padding;


//: - (KIImageCropperMaskView *)maskView {
- (LineupView *)maskView {
    //: if (_maskView == nil) {
    if (_maskView == nil) {
        //: _maskView = [[KIImageCropperMaskView alloc] initWithFrame:self.bounds];
        _maskView = [[LineupView alloc] initWithFrame:self.bounds];
        //: [_maskView setBackgroundColor:[UIColor clearColor]];
        [_maskView setBackgroundColor:[UIColor clearColor]];
        //: [_maskView setUserInteractionEnabled:NO];
        [_maskView setUserInteractionEnabled:NO];
        //: [self addSubview:_maskView];
        [self addSubview:_maskView];

        //: [self setBackgroundColor:[UIColor lightGrayColor]];
        [self setBackgroundColor:[UIColor lightGrayColor]];
    }
    //: [self bringSubviewToFront:_maskView];
    [self bringSubviewToFront:_maskView];
    //: return _maskView;
    return _maskView;
}

//: - (UIImageView *)imageView {
- (UIImageView *)imaginationImage {
    //: if (_imageView == nil) {
    if (_imageView == nil) {
        //: _imageView = [[UIImageView alloc] init];
        _imageView = [[UIImageView alloc] init];
        //: [[self scrollView] addSubview:_imageView];
        [[self tableApp] addSubview:_imageView];
    }
    //: return _imageView;
    return _imageView;
}

//: - (UIScrollView *)scrollView {
- (UIScrollView *)tableApp {
    //: if (_scrollView == nil) {
    if (_scrollView == nil) {
        //: _scrollView = [[UIScrollView alloc] init];
        _scrollView = [[UIScrollView alloc] init];
        //: [_scrollView setBackgroundColor:[UIColor clearColor]];
        [_scrollView setBackgroundColor:[UIColor clearColor]];
        //: [_scrollView setDelegate:self];
        [_scrollView setDelegate:self];
        //: [_scrollView setShowsHorizontalScrollIndicator:NO];
        [_scrollView setShowsHorizontalScrollIndicator:NO];
        //: [_scrollView setShowsVerticalScrollIndicator:NO];
        [_scrollView setShowsVerticalScrollIndicator:NO];
        //: [self addSubview:_scrollView];
        [self addSubview:_scrollView];
    }
    //: return _scrollView;
    return _scrollView;
}

//: - (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    //: return [self imageView];
    return [self imaginationImage];
}

//: - (CGFloat)width {
- (CGFloat)width {
    //: return CGRectGetWidth(self.bounds);
    return CGRectGetWidth(self.bounds);
}

//: - (CGFloat)height {
- (CGFloat)height {
    //: return CGRectGetHeight(self.bounds);
    return CGRectGetHeight(self.bounds);
}

//: - (void)setCropRatio:(KIImageCropRatio)cropRatio {
- (void)setCropRatio:(KIImageCropRatio)cropRatio {
    //: if (cropRatio != _cropRatio) {
    if (cropRatio != _cropRatio) {
        //: _cropRatio = cropRatio;
        _cropRatio = cropRatio;
        //: [self updateCropSizeWithRatio:_cropRatio];
        [self groupDiscussion:_cropRatio];
    }
}

//: #pragma mark ****************************************
#pragma mark ****************************************
//: #pragma mark 【根据比例换算出尺寸】
#pragma mark 【根据比例换算出尺寸】
//: #pragma mark ****************************************
#pragma mark ****************************************

//: - (void)updateCropSizeWithRatio:(KIImageCropRatio)ratio {
- (void)groupDiscussion:(KIImageCropRatio)ratio {
    //: CGSize size = CGSizeZero;
    CGSize size = CGSizeZero;
    /*将宽度和高度分别减去maskView的边框*/
    //: CGFloat width = [self width];
    CGFloat width = [self width];
    //: CGFloat height = [self height];
    CGFloat height = [self height];

    //: switch (ratio) {
    switch (ratio) {
        //: case KIImageCropRatio1_1: {
        case KIImageCropRatio1_1: {
            //: height = width;
            height = width;
        }
            //: break;
            break;
        //: case KIImageCropRatio1_2: {
        case KIImageCropRatio1_2: {
            //: width = height / 2.0f;
            width = height / 2.0f;
        }
            //: break;
            break;
        //: case KIImageCropRatio2_1: {
        case KIImageCropRatio2_1: {
            //: height = width / 2.0f;
            height = width / 2.0f;
        }
            //: break;
            break;
        //: case KIImageCropRatio16_9: {
        case KIImageCropRatio16_9: {
            //: height = width / (16.0f / 9.0f);
            height = width / (16.0f / 9.0f);
        }
            //: break;
            break;
        //: case KIImageCropRatio16_10: {
        case KIImageCropRatio16_10: {
            //: height = width / (16.0f / 10.0f);
            height = width / (16.0f / 10.0f);
        }
            //: break;
            break;
        //: default:
        default:
            //: height = width;
            height = width;
            //: break;
            break;
    }

    //: size = CGSizeMake(width, height);
    size = CGSizeMake(width, height);
    //: _cropSize = size;
    _cropSize = size;
    //: [self setNeedsLayout];
    [self setNeedsLayout];
}

//: #pragma mark ****************************************
#pragma mark ****************************************
//: #pragma mark 【算出实际的尺寸，除去边距】
#pragma mark 【算出实际的尺寸，除去边距】
//: #pragma mark ****************************************
#pragma mark ****************************************

//: - (void)setCropSize:(CGSize)cropSize {
- (void)setCropSize:(CGSize)cropSize {
    //: if (!__CGSizeEqualToSize(cropSize, _cropSize)) {
    if (!__CGSizeEqualToSize(cropSize, _cropSize)) {
        //: _cropSize = cropSize;
        _cropSize = cropSize;
        //: _cropRatio = 0;
        _cropRatio = 0;
        //: [self setNeedsLayout];
        [self setNeedsLayout];
    }
}

//: - (CGSize)cropSize {
- (CGSize)cropSize {
    //: if (__CGSizeEqualToSize(_cropSize, CGSizeZero)) {
    if (__CGSizeEqualToSize(_cropSize, CGSizeZero)) {
        //: _cropSize = CGSizeMake(100, 100);
        _cropSize = CGSizeMake(100, 100);
    }
    //: return _cropSize;
    return _cropSize;
}

//: #pragma mark ****************************************
#pragma mark ****************************************
//: #pragma mark 【计算出maskView的尺寸】
#pragma mark 【计算出maskView的尺寸】
//: #pragma mark ****************************************
#pragma mark ****************************************

//: - (CGSize)maskViewSize {
- (CGSize)minSize {
    /*先算出view除去边框和边距剩下的大小*/
    //: CGFloat viewWidth = [self width]-2.0f*2-self.padding.left-self.padding.right;;
    CGFloat viewWidth = [self width]-2.0f*2-self.padding.left-self.padding.right;;
    //: CGFloat viewHeight = [self height]-2.0f*2-self.padding.top-self.padding.bottom;
    CGFloat viewHeight = [self height]-2.0f*2-self.padding.top-self.padding.bottom;

    /*取得实际的裁剪尺寸*/
    //: CGFloat cropWidth = self.cropSize.width;
    CGFloat cropWidth = self.cropSize.width;
    //: CGFloat cropHeight = self.cropSize.height;
    CGFloat cropHeight = self.cropSize.height;

    //: CGFloat scaleWidth = viewWidth / cropWidth;
    CGFloat scaleWidth = viewWidth / cropWidth;
    //: CGFloat scaleHeight = viewHeight / cropHeight;
    CGFloat scaleHeight = viewHeight / cropHeight;

    //: CGFloat minScale = ((scaleWidth) < (scaleHeight) ? (scaleWidth) : (scaleHeight));
    CGFloat minScale = ((scaleWidth) < (scaleHeight) ? (scaleWidth) : (scaleHeight));
    //: if (scaleWidth < 1 && scaleHeight < 1) {
    if (scaleWidth < 1 && scaleHeight < 1) {
        //: minScale = ((scaleWidth) > (scaleHeight) ? (scaleWidth) : (scaleHeight));
        minScale = ((scaleWidth) > (scaleHeight) ? (scaleWidth) : (scaleHeight));
    }
    //: minScale = minScale > 1?1:minScale;
    minScale = minScale > 1?1:minScale;

    //: _maskViewZoomScale = minScale;
    _maskViewZoomScale = minScale;

    /*取出view和crop两者间最小的尺寸*/
    //: CGFloat minWidth = ((viewWidth) < (cropWidth) ? (viewWidth) : (cropWidth))+0.5;
    CGFloat minWidth = ((viewWidth) < (cropWidth) ? (viewWidth) : (cropWidth))+0.5;
    //: CGFloat minHeight = ((viewHeight) < (cropHeight) ? (viewHeight) : (cropHeight))+0.5;
    CGFloat minHeight = ((viewHeight) < (cropHeight) ? (viewHeight) : (cropHeight))+0.5;

    //: if (scaleWidth < scaleHeight) {
    if (scaleWidth < scaleHeight) {
        //: minHeight *= minScale;
        minHeight *= minScale;
    //: } else {
    } else {
        //: minWidth *= minScale;
        minWidth *= minScale;
    }

    //: _maskViewSize = CGSizeMake((int)minWidth, (int)minHeight);
    _maskViewSize = CGSizeMake((int)minWidth, (int)minHeight);
    //: if (self.cropSize.width == self.cropSize.height) {
    if (self.cropSize.width == self.cropSize.height) {
        /*如果实际裁剪尺寸的长宽相等，则取出最小的一个*/
        //: _maskViewSize = CGSizeMake((int)((minWidth) < (minHeight) ? (minWidth) : (minHeight)), (int)((minWidth) < (minHeight) ? (minWidth) : (minHeight)));
        _maskViewSize = CGSizeMake((int)((minWidth) < (minHeight) ? (minWidth) : (minHeight)), (int)((minWidth) < (minHeight) ? (minWidth) : (minHeight)));
    }

    //: CGFloat left = (CGRectGetWidth(self.bounds) - _maskViewSize.width) / 2;
    CGFloat left = (CGRectGetWidth(self.bounds) - _maskViewSize.width) / 2;
    //: CGFloat top = (CGRectGetHeight(self.bounds) - _maskViewSize.height) / 2;
    CGFloat top = (CGRectGetHeight(self.bounds) - _maskViewSize.height) / 2;
    //: CGFloat bottom = CGRectGetHeight(self.bounds) - _maskViewSize.height - top;
    CGFloat bottom = CGRectGetHeight(self.bounds) - _maskViewSize.height - top;
    //: CGFloat right = CGRectGetWidth(self.bounds) - _maskViewSize.width - left;
    CGFloat right = CGRectGetWidth(self.bounds) - _maskViewSize.width - left;

    //: _imageViewInsets = UIEdgeInsetsMake(top, left, bottom, right);
    _imageViewInsets = UIEdgeInsetsMake(top, left, bottom, right);

    //: return _maskViewSize;
    return _maskViewSize;
}

//: - (UIEdgeInsets)padding {
- (UIEdgeInsets)padding {
    //: if (UIEdgeInsetsEqualToEdgeInsets(_padding, UIEdgeInsetsZero)) {
    if (UIEdgeInsetsEqualToEdgeInsets(_padding, UIEdgeInsetsZero)) {
        //: _padding = UIEdgeInsetsMake(5, 5, 5, 5);
        _padding = UIEdgeInsetsMake(5, 5, 5, 5);
    }
    //: return _padding;
    return _padding;
}

//: - (void)setPadding:(UIEdgeInsets)padding {
- (void)setPadding:(UIEdgeInsets)padding {
    //: if (!UIEdgeInsetsEqualToEdgeInsets(_padding, padding)) {
    if (!UIEdgeInsetsEqualToEdgeInsets(_padding, padding)) {
        //: _padding = padding;
        _padding = padding;

        //: [self setNeedsLayout];
        [self setNeedsLayout];
    }
}

//: - (void)setImage:(UIImage *)image {
- (void)setImage:(UIImage *)image {
    //: if (_image != image) {
    if (_image != image) {
        //: _image = image;
        _image = image;

        //: [[self imageView] setImage:_image];
        [[self imaginationImage] setImage:_image];

        //: [[self imageView] setFrame:CGRectMake(0, 0, _image.size.width, _image.size.height)];
        [[self imaginationImage] setFrame:CGRectMake(0, 0, _image.size.width, _image.size.height)];

        //: [self setNeedsLayout];
        [self setNeedsLayout];
    }
}

//: - (void)updateZoomScale {
- (void)infoBy {
    //: CGFloat width = _image.size.width;
    CGFloat width = _image.size.width;
    //: CGFloat height = _image.size.height;
    CGFloat height = _image.size.height;

    //: CGFloat xScale = _maskViewSize.width / width;
    CGFloat xScale = _maskViewSize.width / width;
    //: CGFloat yScale = _maskViewSize.height / height;
    CGFloat yScale = _maskViewSize.height / height;

    //: CGFloat min = ((xScale) > (yScale) ? (xScale) : (yScale));
    CGFloat min = ((xScale) > (yScale) ? (xScale) : (yScale));
    //: CGFloat max = 1.0;
    CGFloat max = 1.0;
    //: if (min > max) {
    if (min > max) {
        //: min = max;
        min = max;
    }

    //: [[self scrollView] setMinimumZoomScale:min];
    [[self tableApp] setMinimumZoomScale:min];
    //: [[self scrollView] setMaximumZoomScale:max+5.0f];
    [[self tableApp] setMaximumZoomScale:max+5.0f];

    //: [[self scrollView] setZoomScale:min animated:YES];
    [[self tableApp] setZoomScale:min animated:YES];

    //: [[self scrollView] setContentInset:_imageViewInsets];
    [[self tableApp] setContentInset:_imageViewInsets];
    //: [[self scrollView] setContentOffset:CGPointMake(-_imageViewInsets.left, -_imageViewInsets.top) animated:YES];
    [[self tableApp] setContentOffset:CGPointMake(-_imageViewInsets.left, -_imageViewInsets.top) animated:YES];
}

//: - (void)layoutSubviews {
- (void)layoutSubviews {
    //: [super layoutSubviews];
    [super layoutSubviews];
    //: [[self maskView] setFrame:self.bounds];
    [[self maskView] setFrame:self.bounds];
    //: [(KIImageCropperMaskView*)[self maskView] setMaskSize:[self maskViewSize]];
    [(LineupView*)[self maskView] setRow:[self minSize]];
    //: [[self scrollView] setFrame:self.bounds];
    [[self tableApp] setFrame:self.bounds];
    //: [self updateZoomScale];
    [self infoBy];
}

//: - (UIImage *)croppedImage {
- (UIImage *)weValue {
    //: CGFloat zoomScale = [self scrollView].zoomScale;
    CGFloat zoomScale = [self tableApp].zoomScale;

    //: CGFloat offsetX = [self scrollView].contentOffset.x;
    CGFloat offsetX = [self tableApp].contentOffset.x;
    //: CGFloat offsetY = [self scrollView].contentOffset.y;
    CGFloat offsetY = [self tableApp].contentOffset.y;
    //: CGFloat aX = offsetX>=0 ? offsetX + _imageViewInsets.left : (_imageViewInsets.left - ((offsetX) < 0 ? (-(offsetX)) : (offsetX)));
    CGFloat aX = offsetX>=0 ? offsetX + _imageViewInsets.left : (_imageViewInsets.left - ((offsetX) < 0 ? (-(offsetX)) : (offsetX)));
    //: CGFloat aY = offsetY>=0 ? offsetY + _imageViewInsets.top : (_imageViewInsets.top - ((offsetY) < 0 ? (-(offsetY)) : (offsetY)));
    CGFloat aY = offsetY>=0 ? offsetY + _imageViewInsets.top : (_imageViewInsets.top - ((offsetY) < 0 ? (-(offsetY)) : (offsetY)));

    //: aX = aX / zoomScale;
    aX = aX / zoomScale;
    //: aY = aY / zoomScale;
    aY = aY / zoomScale;

    //: CGFloat aWidth = ((_cropSize.width / zoomScale) < (_cropSize.width) ? (_cropSize.width / zoomScale) : (_cropSize.width));
    CGFloat aWidth = ((_cropSize.width / zoomScale) < (_cropSize.width) ? (_cropSize.width / zoomScale) : (_cropSize.width));
    //: CGFloat aHeight = ((_cropSize.height / zoomScale) < (_cropSize.height) ? (_cropSize.height / zoomScale) : (_cropSize.height));
    CGFloat aHeight = ((_cropSize.height / zoomScale) < (_cropSize.height) ? (_cropSize.height / zoomScale) : (_cropSize.height));
    //: if (zoomScale < 1) {
    if (zoomScale < 1) {
        //: aWidth = ((_cropSize.width / zoomScale) > (_cropSize.width) ? (_cropSize.width / zoomScale) : (_cropSize.width));
        aWidth = ((_cropSize.width / zoomScale) > (_cropSize.width) ? (_cropSize.width / zoomScale) : (_cropSize.width));
        //: aHeight = ((_cropSize.height / zoomScale) > (_cropSize.height) ? (_cropSize.height / zoomScale) : (_cropSize.height));
        aHeight = ((_cropSize.height / zoomScale) > (_cropSize.height) ? (_cropSize.height / zoomScale) : (_cropSize.height));
    }

    //: aWidth *= _maskViewZoomScale;
    aWidth *= _maskViewZoomScale;
    //: aHeight *= _maskViewZoomScale;
    aHeight *= _maskViewZoomScale;

    //: CGFloat screenScale = [UIScreen mainScreen].scale;
    CGFloat screenScale = [UIScreen mainScreen].scale;


    //: NSLog(@"%f--%f", _image.size.width, _image.size.height);
    //: NSLog(@"%f--%f--%f--%f", aX, aY, aWidth, aHeight);


    //: UIImage *image = [_image cropImageWithX:aX y:aY width:aWidth height:aHeight];
    UIImage *image = [_image archipelagoPlace:aX show:aY bar:aWidth beggarMyNeighbourPolicy:aHeight];


    // MARK: - 处理图片
    //: CGSize imgSize = image.size;
    CGSize imgSize = image.size;
    //所有上传照片最大像素等比例压缩
    //: CGFloat maxPix = 160;
    CGFloat maxPix = 160;

    //: if (imgSize.width > imgSize.height) {
    if (imgSize.width > imgSize.height) {
        //: CGFloat scale = imgSize.height/imgSize.width;
        CGFloat scale = imgSize.height/imgSize.width;
        //: if (imgSize.width > maxPix) {
        if (imgSize.width > maxPix) {
            //: imgSize.width = maxPix;
            imgSize.width = maxPix;
            //: imgSize.height = scale * maxPix;
            imgSize.height = scale * maxPix;
        }
    //: }else {
    }else {
        //: CGFloat scale = imgSize.width/imgSize.height;
        CGFloat scale = imgSize.width/imgSize.height;
        //: if (imgSize.height > maxPix) {
        if (imgSize.height > maxPix) {
            //: imgSize.height = maxPix;
            imgSize.height = maxPix;
            //: imgSize.width = scale * maxPix;
            imgSize.width = scale * maxPix;
        }
    }

    //: image = [self imageWithImage:image scaledToSize:imgSize opaque:YES];
    image = [self streetwiseImage:image max:imgSize by:YES];


//    if (_cropRatio == 0) {
//        image = [image resizeToWidth:_cropSize.width/screenScale height:_cropSize.height/screenScale];
//    } else {
//        image = [image resizeToWidth:image.size.width/screenScale height:image.size.height/screenScale];
//    }

    //: return image;
    return image;
}

//: - (UIImage*)imageWithImage:(UIImage*)image scaledToSize:(CGSize)newSize opaque:(BOOL)opaque
- (UIImage*)streetwiseImage:(UIImage*)image max:(CGSize)newSize by:(BOOL)opaque
{
    //: NSInteger newSizeW = (NSInteger)newSize.width; 
    NSInteger newSizeW = (NSInteger)newSize.width; //  转化为整型,不然像素补全会出现黑边
    //: NSInteger newSizeH = (NSInteger)newSize.height;
    NSInteger newSizeH = (NSInteger)newSize.height;

    //: UIGraphicsBeginImageContext(newSize);
    UIGraphicsBeginImageContext(newSize);

    //: [image drawInRect:CGRectMake(0,0,newSizeW,newSizeH)];
    [image drawInRect:CGRectMake(0,0,newSizeW,newSizeH)];
    //: UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    //: UIGraphicsEndImageContext();
    UIGraphicsEndImageContext();

    //: return newImage;
    return newImage;
}


//: @end
@end


//: #pragma mark ****************************************
#pragma mark ****************************************
//: #pragma mark 【KIImageCropMaskView】
#pragma mark 【KIImageCropMaskView】
//: #pragma mark ****************************************
#pragma mark ****************************************

//: @implementation KIImageCropperMaskView
@implementation LineupView

//: - (void)setMaskSize:(CGSize)size {
- (void)setRow:(CGSize)size {
    //: CGFloat x = (CGRectGetWidth(self.bounds) - size.width) / 2;
    CGFloat x = (CGRectGetWidth(self.bounds) - size.width) / 2;
    //: CGFloat y = (CGRectGetHeight(self.bounds) - size.height) / 2;
    CGFloat y = (CGRectGetHeight(self.bounds) - size.height) / 2;
    //: _maskRect = CGRectMake(x, y, size.width, size.height);
    _maskRect = CGRectMake(x, y, size.width, size.height);

    //: [self setNeedsDisplay];
    [self setNeedsDisplay];
}

//: - (CGSize)maskSize {
- (CGSize)row {
    //: return _maskRect.size;
    return _maskRect.size;
}

//: - (void)drawRect:(CGRect)rect {
- (void)drawRect:(CGRect)rect {
    //: [super drawRect:rect];
    [super drawRect:rect];
    //: CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    //: CGContextSetRGBFillColor(ctx, 0, 0, 0, .6);
    CGContextSetRGBFillColor(ctx, 0, 0, 0, .6);
    //: CGContextFillRect(ctx, self.bounds);
    CGContextFillRect(ctx, self.bounds);

    //: CGContextSetStrokeColorWithColor(ctx, [UIColor whiteColor].CGColor);
    CGContextSetStrokeColorWithColor(ctx, [UIColor whiteColor].CGColor);
    //: CGContextStrokeRectWithWidth(ctx, _maskRect, 2.0f);
    CGContextStrokeRectWithWidth(ctx, _maskRect, 2.0f);

    //: CGContextClearRect(ctx, _maskRect);
    CGContextClearRect(ctx, _maskRect);
}
//: @end
@end