// __DEBUG__
// __CLOSE_PRINT__
//
//  MaskView.m
//
//  Created by Ming Yang on 7/7/12.
//

// __M_A_C_R_O__
//: #import "ImageCropView.h"
#import "MarkInputView.h"

//: static CGFloat const DEFAULT_MASK_ALPHA = 0.75;
static CGFloat const k_optionData = 0.75;
//: static BOOL const square = NO;
static BOOL const k_dataTitle = NO;
//: float IMAGE_MIN_HEIGHT = 400;
float k_entityData = 400;
//: float IMAGE_MIN_WIDTH = 400;
float k_linkTitle = 400;

//: @interface ImageCropViewController(){
@interface WithViewController(){
    //: CGRect _cropArea;
    CGRect _cropArea;
}

//: @end
@end
//: #pragma mark ImageCropViewController implementation
#pragma mark WithViewController implementation
//: @implementation ImageCropViewController
@implementation WithViewController

//: @synthesize delegate;
@synthesize delegate;
//: @synthesize cropView;
@synthesize cropView;

//: -(id)initWithImage:(UIImage*) image{
-(id)initWithDateBy:(UIImage*) image{
   //: self = [super init];
   self = [super init];
    //: if (self){
    if (self){
        //: self.image = [image fixOrientation];
        self.image = [image person];
    }

    //: return self;
    return self;
}

//: - (void)loadView
- (void)loadView
{
    //: [super loadView];
    [super loadView];
}


//: - (void)viewDidLoad
- (void)viewDidLoad
{
    //: [super viewDidLoad];
    [super viewDidLoad];
    //: if (self){
    if (self){
        //: UIView *contentView = [[UIView alloc] init];
        UIView *contentView = [[UIView alloc] init];
        //: contentView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        contentView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        //: contentView.backgroundColor = [UIColor whiteColor];
        contentView.backgroundColor = [UIColor whiteColor];

        //: self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]
                                                 //: initWithBarButtonSystemItem:UIBarButtonSystemItemCancel
                                                 initWithBarButtonSystemItem:UIBarButtonSystemItemCancel
                                                 //: target:self
                                                 target:self
                                                 //: action:@selector(cancel:)];
                                                 action:@selector(messageItem:)];

        //: self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]
                                                  //: initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                                  initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                                  //: target:self
                                                  target:self
                                                  //: action:@selector(done:)];
                                                  action:@selector(queries:)];
        //: CGSize statusBarSize = [[UIApplication sharedApplication] statusBarFrame].size;
        CGSize statusBarSize = [[UIApplication sharedApplication] statusBarFrame].size;
        //: CGRect view = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height - [[self navigationController] navigationBar].bounds.size.height - statusBarSize.height);
        CGRect view = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height - [[self navigationController] navigationBar].bounds.size.height - statusBarSize.height);

        //: self.cropView = [[ImageCropView alloc] initWithFrame:view blurOn:self.blurredBackground];
        self.cropView = [[MarkInputView alloc] initWithTag:view reply:self.blurredBackground];
        //: self.view = contentView;
        self.view = contentView;
        //: [contentView addSubview:cropView];
        [contentView addSubview:cropView];
        //: [cropView setImage:self.image];
        [cropView setImage:self.image];
        //: if (_cropArea.size.width > 0) {
        if (_cropArea.size.width > 0) {
            //: self.cropView.cropAreaInImage = _cropArea;
            self.cropView.cropAreaInImage = _cropArea;
        }
    }
}

//: - (void)cancel:(id)sender
- (void)messageItem:(id)sender
{

    //: if ([self.delegate respondsToSelector:@selector(ImageCropViewControllerDidCancel:)])
    if ([self.delegate respondsToSelector:@selector(withed:)])
    {
        //: [self.delegate ImageCropViewControllerDidCancel:self];
        [self.delegate withed:self];
    }

}

//: - (void)done:(id)sender
- (void)queries:(id)sender
{

    //: if ([self.delegate respondsToSelector:@selector(ImageCropViewControllerSuccess:didFinishCroppingImage:)])
    if ([self.delegate respondsToSelector:@selector(array:bottom:)])
    {
        //: UIImage *cropped;
        UIImage *cropped;
        //: if (self.image != nil){
        if (self.image != nil){
            //: CGRect CropRect = self.cropView.cropAreaInImage;
            CGRect CropRect = self.cropView.cropAreaInImage;
            //: CGImageRef imageRef = CGImageCreateWithImageInRect([self.image CGImage], CropRect) ;
            CGImageRef imageRef = CGImageCreateWithImageInRect([self.image CGImage], CropRect) ;
            //: cropped = [UIImage imageWithCGImage:imageRef];
            cropped = [UIImage imageWithCGImage:imageRef];
            //: CGImageRelease(imageRef);
            CGImageRelease(imageRef);
        }
        //: [self.delegate ImageCropViewControllerSuccess:self didFinishCroppingImage:cropped];
        [self.delegate array:self bottom:cropped];
    }

}

//: - (void)setCropArea:(CGRect)cropArea {
- (void)setCropArea:(CGRect)cropArea {
    //: _cropArea = cropArea;
    _cropArea = cropArea;
    //: if (self.cropView) {
    if (self.cropView) {
        //: self.cropView.cropAreaInImage = _cropArea;
        self.cropView.cropAreaInImage = _cropArea;
    }
}

//: - (CGRect)cropArea {
- (CGRect)cropArea {
    //: if (self.cropView) {
    if (self.cropView) {
        //: return self.cropView.cropAreaInImage;
        return self.cropView.cropAreaInImage;
    //: } else {
    } else {
        //: return CGRectZero;
        return CGRectZero;
    }
}

//: @end
@end


//: #pragma mark ControlPointView implementation
#pragma mark OfView implementation

//: @implementation ControlPointView
@implementation OfView

//: - (id)initWithFrame:(CGRect)frame
- (id)initWithFrame:(CGRect)frame
{
    //: self = [super initWithFrame:frame];
    self = [super initWithFrame:frame];
    //: if (self) {
    if (self) {
        // Initialization code
        //: self.color = [UIColor colorWithRed:18.0/255.0 green:173.0/255.0 blue:251.0/255.0 alpha:1];
        self.color = [UIColor colorWithRed:18.0/255.0 green:173.0/255.0 blue:251.0/255.0 alpha:1];
        //: self.opaque = NO;
        self.opaque = NO;
    }
    //: return self;
    return self;
}

//: - (void)setColor:(UIColor *)_color {
- (void)setColor:(UIColor *)_color {
    //: [_color getRed:&red green:&green blue:&blue alpha:&alpha];
    [_color getRed:&red green:&green blue:&blue alpha:&alpha];
    //: [self setNeedsDisplay];
    [self setNeedsDisplay];
}

//: - (UIColor*)color {
- (UIColor*)color {
    //: return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

//: - (void)drawRect:(CGRect)rect {
- (void)drawRect:(CGRect)rect {
    //: CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextRef context = UIGraphicsGetCurrentContext();
    //: CGContextClearRect(context, rect);
    CGContextClearRect(context, rect);
    //: CGContextSetRGBFillColor(context, red, green, blue, alpha);
    CGContextSetRGBFillColor(context, red, green, blue, alpha);
    //: CGContextFillEllipseInRect(context, rect);
    CGContextFillEllipseInRect(context, rect);
}

//: @end
@end

//: #pragma mark - MaskView implementation
#pragma mark - MaskView implementation

//: @implementation ShadeView
@implementation ShadowView

//: - (id)initWithFrame:(CGRect)frame
- (id)initWithFrame:(CGRect)frame
{
    //: self = [super initWithFrame:frame];
    self = [super initWithFrame:frame];
    //: if (self) {
    if (self) {
        // Initialization code
        //: self.opaque = NO;
        self.opaque = NO;
        //: self.blurredImageView = [[UIImageView alloc] init];
        self.blurredImageView = [[UIImageView alloc] init];
    }
    //: return self;
    return self;
}

//: - (void)setCropBorderColor:(UIColor *)_color {
- (void)setCropBorderColor:(UIColor *)_color {
    //: [_color getRed:&cropBorderRed green:&cropBorderGreen blue:&cropBorderBlue alpha:&cropBorderAlpha];
    [_color getRed:&cropBorderRed green:&cropBorderGreen blue:&cropBorderBlue alpha:&cropBorderAlpha];
    //: [self setNeedsDisplay];
    [self setNeedsDisplay];
}

//: - (UIColor*)cropBorderColor {
- (UIColor*)cropBorderColor {
    //: return [UIColor colorWithRed:cropBorderRed green:cropBorderGreen blue:cropBorderBlue alpha:cropBorderAlpha];
    return [UIColor colorWithRed:cropBorderRed green:cropBorderGreen blue:cropBorderBlue alpha:cropBorderAlpha];
}

//: - (void)setCropArea:(CGRect)_cropArea {
- (void)setCropArea:(CGRect)_cropArea {
    //: cropArea = _cropArea;
    cropArea = _cropArea;
    //: [self setNeedsDisplay];
    [self setNeedsDisplay];
}

//: - (CGRect)cropArea {
- (CGRect)cropArea {
    //: return cropArea;
    return cropArea;
}

//: - (void)setShadeAlpha:(CGFloat)_alpha {
- (void)setShadeAlpha:(CGFloat)_alpha {
    //: shadeAlpha = _alpha;
    shadeAlpha = _alpha;
    //: [self setNeedsDisplay];
    [self setNeedsDisplay];
}

//: - (CGFloat)shadeAlpha {
- (CGFloat)shadeAlpha {
    //: return shadeAlpha;
    return shadeAlpha;
}

//: - (void)drawRect:(CGRect)rect
- (void)drawRect:(CGRect)rect
{
    //: CALayer* layer = self.blurredImageView.layer;
    CALayer* layer = self.blurredImageView.layer;

    //: UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    //: CGContextRef c = UIGraphicsGetCurrentContext();
    CGContextRef c = UIGraphicsGetCurrentContext();
    //: CGContextAddRect(c, self.cropArea);
    CGContextAddRect(c, self.cropArea);
    //: CGContextAddRect(c, rect);
    CGContextAddRect(c, rect);
    //: CGContextEOClip(c);
    CGContextEOClip(c);
    //: CGContextSetFillColorWithColor(c, [UIColor blackColor].CGColor);
    CGContextSetFillColorWithColor(c, [UIColor blackColor].CGColor);
    //: CGContextFillRect(c, rect);
    CGContextFillRect(c, rect);
    //: UIImage* maskim = UIGraphicsGetImageFromCurrentImageContext();
    UIImage* maskim = UIGraphicsGetImageFromCurrentImageContext();
    //: UIGraphicsEndImageContext();
    UIGraphicsEndImageContext();

    //: CALayer* mask = [CALayer layer];
    CALayer* mask = [CALayer layer];
    //: mask.frame = rect;
    mask.frame = rect;
    //: mask.contents = (id)maskim.CGImage;
    mask.contents = (id)maskim.CGImage;
    //: layer.mask = mask;
    layer.mask = mask;
}

//: @end
@end

//: #pragma mark - MaskImageView implementation
#pragma mark - MaskImageView implementation

//: static CGFloat const DEFAULT_CONTROL_POINT_SIZE = 5;
static CGFloat const k_keyData = 5;

//: CGRect SquareCGRectAtCenter(CGFloat centerX, CGFloat centerY, CGFloat size) {
CGRect SquareCGRectAtCenter(CGFloat centerX, CGFloat centerY, CGFloat size) {
    //: CGFloat x = centerX - size / 2.0;
    CGFloat x = centerX - size / 2.0;
    //: CGFloat y = centerY - size / 2.0;
    CGFloat y = centerY - size / 2.0;
    //: return CGRectMake(x, y, size, size);
    return CGRectMake(x, y, size, size);
}

//: @implementation ImageCropView
@implementation MarkInputView

//: @synthesize cropAreaInImage;
@synthesize cropAreaInImage;
//: @synthesize imageScale;
@synthesize imageScale;

//: - (id)initWithFrame:(CGRect)frame
- (id)initWithFrame:(CGRect)frame
{
    //: self = [super initWithFrame:frame];
    self = [super initWithFrame:frame];
    //: if (self) {
    if (self) {
        //: [self initViews];
        [self initTintViews];
    }
    //: return self;
    return self;
}

//: - (id)initWithFrame:(CGRect)frame blurOn:(BOOL)blurOn
- (id)initWithTag:(CGRect)frame reply:(BOOL)blurOn
{
    //: self = [super initWithFrame:frame];
    self = [super initWithFrame:frame];
    //: if (self) {
    if (self) {
        //: self.blurred = blurOn;
        self.blurred = blurOn;
        //: [self initViews];
        [self initTintViews];
    }
    //: return self;
    return self;
}

//: - (id)initWithCoder:(NSCoder *)aDecoder {
- (id)initWithCoder:(NSCoder *)aDecoder {
    //: if (self=[super initWithCoder:aDecoder]) {
    if (self=[super initWithCoder:aDecoder]) {
        //: [self initViews];
        [self initTintViews];
    }
    //: return self;
    return self;
}

//: - (void)initViews {
- (void)initTintViews {
    //: CGRect subviewFrame = self.bounds;
    CGRect subviewFrame = self.bounds;

    //the shade
    //: self.shadeView = [[ShadeView alloc] initWithFrame:subviewFrame];
    self.shadeView = [[ShadowView alloc] initWithFrame:subviewFrame];

    //the image
    //: imageView = [[UIImageView alloc] initWithFrame:subviewFrame];
    imageView = [[UIImageView alloc] initWithFrame:subviewFrame];
    //: imageView.contentMode = UIViewContentModeScaleAspectFill;
    imageView.contentMode = UIViewContentModeScaleAspectFill;


    //control points
    //: controlPointSize = DEFAULT_CONTROL_POINT_SIZE;
    controlPointSize = k_keyData;
    //: int initialCropAreaSize = self.frame.size.width / 5;
    int initialCropAreaSize = self.frame.size.width / 5;
    //: CGPoint centerInView = CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2);
    CGPoint centerInView = CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2);
    //: topLeftPoint = [self createControlPointAt:SquareCGRectAtCenter(centerInView.x - initialCropAreaSize,
    topLeftPoint = [self info:SquareCGRectAtCenter(centerInView.x - initialCropAreaSize,
                                                                   //: centerInView.y - initialCropAreaSize,
                                                                   centerInView.y - initialCropAreaSize,
                                                                   //: controlPointSize)];
                                                                   controlPointSize)];

    //: bottomLeftPoint = [self createControlPointAt:SquareCGRectAtCenter(centerInView.x - initialCropAreaSize,
    bottomLeftPoint = [self info:SquareCGRectAtCenter(centerInView.x - initialCropAreaSize,
                                                                      //: centerInView.y + initialCropAreaSize,
                                                                      centerInView.y + initialCropAreaSize,
                                                                      //: controlPointSize)];
                                                                      controlPointSize)];

    //: bottomRightPoint = [self createControlPointAt:SquareCGRectAtCenter(centerInView.x + initialCropAreaSize,
    bottomRightPoint = [self info:SquareCGRectAtCenter(centerInView.x + initialCropAreaSize,
                                                                       //: centerInView.y + initialCropAreaSize, controlPointSize) ];
                                                                       centerInView.y + initialCropAreaSize, controlPointSize) ];

    //: topRightPoint = [self createControlPointAt:SquareCGRectAtCenter(centerInView.x + initialCropAreaSize,
    topRightPoint = [self info:SquareCGRectAtCenter(centerInView.x + initialCropAreaSize,
                                                                    //: centerInView.y - initialCropAreaSize, controlPointSize)];
                                                                    centerInView.y - initialCropAreaSize, controlPointSize)];

    //the "hole"
    //: CGRect cropArea = [self cropAreaFromControlPoints];
    CGRect cropArea = [self bar];
    //: cropAreaView = [[UIView alloc] initWithFrame:cropArea];
    cropAreaView = [[UIView alloc] initWithFrame:cropArea];
    //: cropAreaView.opaque = NO;
    cropAreaView.opaque = NO;
    //: cropAreaView.backgroundColor = [UIColor clearColor];
    cropAreaView.backgroundColor = [UIColor clearColor];
    //: UIPanGestureRecognizer* dragRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handleDrag:)];
    UIPanGestureRecognizer* dragRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(commandBackground:)];
    //: dragRecognizer.view.multipleTouchEnabled = YES;
    dragRecognizer.view.multipleTouchEnabled = YES;
    //: dragRecognizer.minimumNumberOfTouches = 1;
    dragRecognizer.minimumNumberOfTouches = 1;
    //: dragRecognizer.maximumNumberOfTouches = 2;
    dragRecognizer.maximumNumberOfTouches = 2;
    //: [self.viewForFirstBaselineLayout addGestureRecognizer:dragRecognizer];
    [self.viewForFirstBaselineLayout addGestureRecognizer:dragRecognizer];

    //: [self addSubview:imageView];
    [self addSubview:imageView];
    //: [self addSubview:self.shadeView];
    [self addSubview:self.shadeView];
    //: [self addSubview:self.shadeView.blurredImageView];
    [self addSubview:self.shadeView.blurredImageView];
    //: [self addSubview:cropAreaView];
    [self addSubview:cropAreaView];
    //: [self addSubview:topRightPoint];
    [self addSubview:topRightPoint];
    //: [self addSubview:bottomRightPoint];
    [self addSubview:bottomRightPoint];
    //: [self addSubview:topLeftPoint];
    [self addSubview:topLeftPoint];
    //: [self addSubview:bottomLeftPoint];
    [self addSubview:bottomLeftPoint];

    //: PointsArray = [[NSArray alloc] initWithObjects:topRightPoint, bottomRightPoint, topLeftPoint, bottomLeftPoint, nil];
    PointsArray = [[NSArray alloc] initWithObjects:topRightPoint, bottomRightPoint, topLeftPoint, bottomLeftPoint, nil];

    //: self.maskAlpha = DEFAULT_MASK_ALPHA;
    self.maskAlpha = k_optionData;

    //: imageFrameInView = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    imageFrameInView = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    //: imageView.frame = imageFrameInView;
    imageView.frame = imageFrameInView;

}

//: - (ControlPointView*)createControlPointAt:(CGRect)frame {
- (OfView*)info:(CGRect)frame {
    //: ControlPointView* point = [[ControlPointView alloc] initWithFrame:frame];
    OfView* point = [[OfView alloc] initWithFrame:frame];
    //: return point;
    return point;
}

//: - (CGRect)cropAreaFromControlPoints {
- (CGRect)bar {
    //: CGFloat width = topRightPoint.center.x - topLeftPoint.center.x;
    CGFloat width = topRightPoint.center.x - topLeftPoint.center.x;
    //: CGFloat height = bottomRightPoint.center.y - topRightPoint.center.y;
    CGFloat height = bottomRightPoint.center.y - topRightPoint.center.y;
    //: CGRect hole = CGRectMake(topLeftPoint.center.x, topLeftPoint.center.y, width, height);
    CGRect hole = CGRectMake(topLeftPoint.center.x, topLeftPoint.center.y, width, height);
    //: return hole;
    return hole;
}

//: - (CGRect)controllableAreaFromControlPoints {
- (CGRect)media {
    //: CGFloat width = topRightPoint.center.x - topLeftPoint.center.x - controlPointSize;
    CGFloat width = topRightPoint.center.x - topLeftPoint.center.x - controlPointSize;
    //: CGFloat height = bottomRightPoint.center.y - topRightPoint.center.y - controlPointSize;
    CGFloat height = bottomRightPoint.center.y - topRightPoint.center.y - controlPointSize;
    //: CGRect hole = CGRectMake(topLeftPoint.center.x + controlPointSize / 2, topLeftPoint.center.y + controlPointSize / 2, width, height);
    CGRect hole = CGRectMake(topLeftPoint.center.x + controlPointSize / 2, topLeftPoint.center.y + controlPointSize / 2, width, height);
    //: return hole;
    return hole;
}

//: - (void)boundingBoxForTopLeft:(CGPoint)topLeft bottomLeft:(CGPoint)bottomLeft bottomRight:(CGPoint)bottomRight topRight:(CGPoint)topRight {
- (void)digitiser:(CGPoint)topLeft image:(CGPoint)bottomLeft bottom:(CGPoint)bottomRight numberBox:(CGPoint)topRight {
    //: CGRect box = CGRectMake(topLeft.x - controlPointSize / 2, topLeft.y - controlPointSize / 2 , topRight.x - topLeft.x + controlPointSize , bottomRight.y - topRight.y + controlPointSize );
    CGRect box = CGRectMake(topLeft.x - controlPointSize / 2, topLeft.y - controlPointSize / 2 , topRight.x - topLeft.x + controlPointSize , bottomRight.y - topRight.y + controlPointSize );
    //If not square - crop cropView =-)
    //: if (!square){
    if (!k_dataTitle){
        //: box = CGRectIntersection(imageFrameInView, box);
        box = CGRectIntersection(imageFrameInView, box);
    }

    //: if (CGRectContainsRect(imageFrameInView, box)) {
    if (CGRectContainsRect(imageFrameInView, box)) {
        //: bottomLeftPoint.center = CGPointMake(box.origin.x + controlPointSize / 2, box.origin.y + box.size.height - controlPointSize / 2);
        bottomLeftPoint.center = CGPointMake(box.origin.x + controlPointSize / 2, box.origin.y + box.size.height - controlPointSize / 2);
        //: bottomRightPoint.center = CGPointMake(box.origin.x + box.size.width - controlPointSize / 2, box.origin.y + box.size.height - controlPointSize / 2);;
        bottomRightPoint.center = CGPointMake(box.origin.x + box.size.width - controlPointSize / 2, box.origin.y + box.size.height - controlPointSize / 2);;
        //: topLeftPoint.center = CGPointMake(box.origin.x + controlPointSize / 2, box.origin.y + controlPointSize / 2);
        topLeftPoint.center = CGPointMake(box.origin.x + controlPointSize / 2, box.origin.y + controlPointSize / 2);
        //: topRightPoint.center = CGPointMake(box.origin.x + box.size.width - controlPointSize / 2, box.origin.y + controlPointSize / 2);
        topRightPoint.center = CGPointMake(box.origin.x + box.size.width - controlPointSize / 2, box.origin.y + controlPointSize / 2);
    }
}

//: - (UIView*)checkHit:(CGPoint)point {
- (UIView*)can:(CGPoint)point {
    //: UIView* view = cropAreaView;
    UIView* view = cropAreaView;
    //: for (int i = 0; i < PointsArray.count; i++) {
    for (int i = 0; i < PointsArray.count; i++) {
        //: CGFloat x = [(ControlPointView *)PointsArray[i] center].x;
        CGFloat x = [(OfView *)PointsArray[i] center].x;
        //: CGFloat y = [(ControlPointView *)PointsArray[i] center].y;
        CGFloat y = [(OfView *)PointsArray[i] center].y;

        //: if (sqrt(pow((point.x - view.center.x), 2) + pow((point.y - view.center.y), 2)) >
        if (sqrt(pow((point.x - view.center.x), 2) + pow((point.y - view.center.y), 2)) >
            //: sqrt(pow((point.x - x), 2) + pow((point.y - y), 2)))
            sqrt(pow((point.x - x), 2) + pow((point.y - y), 2)))
        {
            //: view = PointsArray[i];
            view = PointsArray[i];
        }
    }
    //: return view;
    return view;
}

// Overriding this method to create a larger touch surface area without changing view
//: - (UIView*)hitTest:(CGPoint)point withEvent:(UIEvent*)event
- (UIView*)hitTest:(CGPoint)point withEvent:(UIEvent*)event
{
    //: CGRect frame = CGRectInset(cropAreaView.frame, -30, -30);
    CGRect frame = CGRectInset(cropAreaView.frame, -30, -30);
    //: return CGRectContainsPoint(frame, point) ? cropAreaView : nil;
    return CGRectContainsPoint(frame, point) ? cropAreaView : nil;
}

//: - (void)handleDrag:(UIPanGestureRecognizer*)recognizer
- (void)commandBackground:(UIPanGestureRecognizer*)recognizer
{
    //: NSUInteger count = [recognizer numberOfTouches];
    NSUInteger count = [recognizer numberOfTouches];
    //: if (recognizer.state == UIGestureRecognizerStateBegan || multiDragPoint.lastCount != count) {
    if (recognizer.state == UIGestureRecognizerStateBegan || multiDragPoint.lastCount != count) {
        //: if (count > 1)
        if (count > 1)
            //: [self prepMultiTouchPan:recognizer withCount:count];
            [self continuingEducationWithToteUp:recognizer show:count];
        //: else
        else
            //: [self prepSingleTouchPan:recognizer];
            [self tillCellRead:recognizer];
        //: multiDragPoint.lastCount = count;
        multiDragPoint.lastCount = count;
        //: return;
        return;
    //: } else if (recognizer.state == UIGestureRecognizerStateEnded) {
    } else if (recognizer.state == UIGestureRecognizerStateEnded) {
        //: return; 
        return; // no-op
    }

    //: if (count > 1) {
    if (count > 1) {
        // Transforms crop box based on the two dragPoints.
        //: for (int i = 0; i < count; i++) {
        for (int i = 0; i < count; i++) {
            //: dragPoint = i == 0 ? multiDragPoint.mainPoint : multiDragPoint.optionalPoint;
            dragPoint = i == 0 ? multiDragPoint.mainPoint : multiDragPoint.optionalPoint;
            //: [self beginCropBoxTransformForPoint:[recognizer locationOfTouch:i inView:self] atView:(i == 0 ? dragViewOne : dragViewTwo)];
            [self background:[recognizer locationOfTouch:i inView:self] bottom:(i == 0 ? dragViewOne : dragViewTwo)];
            // Assign point centers that could have changed in previous transform
            //: multiDragPoint.optionalPoint.topLeftCenter = topLeftPoint.center;
            multiDragPoint.optionalPoint.topLeftCenter = topLeftPoint.center;
            //: multiDragPoint.optionalPoint.bottomLeftCenter = bottomLeftPoint.center;
            multiDragPoint.optionalPoint.bottomLeftCenter = bottomLeftPoint.center;
            //: multiDragPoint.optionalPoint.bottomRightCenter = bottomRightPoint.center;
            multiDragPoint.optionalPoint.bottomRightCenter = bottomRightPoint.center;
            //: multiDragPoint.optionalPoint.topRightCenter = topRightPoint.center;
            multiDragPoint.optionalPoint.topRightCenter = topRightPoint.center;
            //: multiDragPoint.optionalPoint.cropAreaCenter = cropAreaView.center;
            multiDragPoint.optionalPoint.cropAreaCenter = cropAreaView.center;
        }
    //: } else {
    } else {
        //: [self beginCropBoxTransformForPoint:[recognizer locationInView:self] atView:dragViewOne];
        [self background:[recognizer locationInView:self] bottom:dragViewOne];
    }
    // Used to reset multiDragPoint when changing from 1 to 2 touches.
    //: multiDragPoint.lastCount = count;
    multiDragPoint.lastCount = count;
}

/**
 * Records current values and points for multi-finger pan gestures
 * @params recognizer The pan gesuture with current point values
 * @params count The number of touches on view
 */
//: - (void)prepMultiTouchPan:(UIPanGestureRecognizer*)recognizer withCount:(NSUInteger)count
- (void)continuingEducationWithToteUp:(UIPanGestureRecognizer*)recognizer show:(NSUInteger)count
{
    //: for (int i = 0; i < count; i++) {
    for (int i = 0; i < count; i++) {
        //: if (i == 0) {
        if (i == 0) {
            //: dragViewOne = [self checkHit:[recognizer locationOfTouch:i inView:self]];
            dragViewOne = [self can:[recognizer locationOfTouch:i inView:self]];
            //: multiDragPoint.mainPoint.dragStart = [recognizer locationOfTouch:i inView:self];
            multiDragPoint.mainPoint.dragStart = [recognizer locationOfTouch:i inView:self];
        //: } else {
        } else {
            //: dragViewTwo = [self checkHit:[recognizer locationOfTouch:i inView:self]];
            dragViewTwo = [self can:[recognizer locationOfTouch:i inView:self]];
            //: multiDragPoint.optionalPoint.dragStart = [recognizer locationOfTouch:i inView:self];
            multiDragPoint.optionalPoint.dragStart = [recognizer locationOfTouch:i inView:self];
        }
    }
    //: multiDragPoint.mainPoint.topLeftCenter = topLeftPoint.center;
    multiDragPoint.mainPoint.topLeftCenter = topLeftPoint.center;
    //: multiDragPoint.mainPoint.bottomLeftCenter = bottomLeftPoint.center;
    multiDragPoint.mainPoint.bottomLeftCenter = bottomLeftPoint.center;
    //: multiDragPoint.mainPoint.bottomRightCenter = bottomRightPoint.center;
    multiDragPoint.mainPoint.bottomRightCenter = bottomRightPoint.center;
    //: multiDragPoint.mainPoint.topRightCenter = topRightPoint.center;
    multiDragPoint.mainPoint.topRightCenter = topRightPoint.center;
    //: multiDragPoint.mainPoint.cropAreaCenter = cropAreaView.center;
    multiDragPoint.mainPoint.cropAreaCenter = cropAreaView.center;
}

/**
 * Records current values and points for single finger pan gestures
 * @params recognizer The pan gesuture with current point values
 */
//: - (void)prepSingleTouchPan:(UIPanGestureRecognizer*)recognizer
- (void)tillCellRead:(UIPanGestureRecognizer*)recognizer
{
    //: dragViewOne = [self checkHit:[recognizer locationInView:self]];
    dragViewOne = [self can:[recognizer locationInView:self]];
    //: dragPoint.dragStart = [recognizer locationInView:self];
    dragPoint.dragStart = [recognizer locationInView:self];
    //: dragPoint.topLeftCenter = topLeftPoint.center;
    dragPoint.topLeftCenter = topLeftPoint.center;
    //: dragPoint.bottomLeftCenter = bottomLeftPoint.center;
    dragPoint.bottomLeftCenter = bottomLeftPoint.center;
    //: dragPoint.bottomRightCenter = bottomRightPoint.center;
    dragPoint.bottomRightCenter = bottomRightPoint.center;
    //: dragPoint.topRightCenter = topRightPoint.center;
    dragPoint.topRightCenter = topRightPoint.center;
    //: dragPoint.cropAreaCenter = cropAreaView.center;
    dragPoint.cropAreaCenter = cropAreaView.center;
}

//: - (void)setCropAreaForViews:(CGRect)cropArea
- (void)setAirt:(CGRect)cropArea
{
    //: cropAreaView.frame = cropArea;
    cropAreaView.frame = cropArea;
    // Create offset to make frame within imageView
    //: cropArea.origin.y = cropArea.origin.y - imageFrameInView.origin.y;
    cropArea.origin.y = cropArea.origin.y - imageFrameInView.origin.y;
    //: cropArea.origin.x = cropArea.origin.x - imageFrameInView.origin.x;
    cropArea.origin.x = cropArea.origin.x - imageFrameInView.origin.x;
    //: [self.shadeView setCropArea:cropArea];
    [self.shadeView setCropArea:cropArea];
}

//: - (void)beginCropBoxTransformForPoint:(CGPoint)location atView:(UIView*)view
- (void)background:(CGPoint)location bottom:(UIView*)view
{
    //: if (view == topLeftPoint) {
    if (view == topLeftPoint) {
        //: [self handleDragTopLeft:location];
        [self textLeft:location];
    //: } else if (view == bottomLeftPoint) {
    } else if (view == bottomLeftPoint) {
        //: [self handleDragBottomLeft:location];
        [self name:location];
    //: } else if (view == bottomRightPoint) {
    } else if (view == bottomRightPoint) {
        //: [self handleDragBottomRight:location];
        [self buttonRight:location];
    //: } else if (view == topRightPoint) {
    } else if (view == topRightPoint) {
        //: [self handleDragTopRight:location];
        [self sumRight:location];
    //: } else if (view == cropAreaView) {
    } else if (view == cropAreaView) {
        //: [self handleDragCropArea:location];
        [self pin:location];
    }

    //: CGRect cropArea = [self cropAreaFromControlPoints];
    CGRect cropArea = [self bar];
    //: [self setCropAreaForViews:cropArea];
    [self setAirt:cropArea];
}

//: - (CGSize)deriveDisplacementFromDragLocation:(CGPoint)dragLocation draggedPoint:(CGPoint)draggedPoint oppositePoint:(CGPoint)oppositePoint {
- (CGSize)sumWith:(CGPoint)dragLocation view:(CGPoint)draggedPoint size:(CGPoint)oppositePoint {
    //: CGFloat dX = dragLocation.x - dragPoint.dragStart.x;
    CGFloat dX = dragLocation.x - dragPoint.dragStart.x;
    //: CGFloat dY = dragLocation.y - dragPoint.dragStart.y;
    CGFloat dY = dragLocation.y - dragPoint.dragStart.y;
    //: CGPoint tempDraggedPoint = CGPointMake(draggedPoint.x + dX, draggedPoint.y + dY);
    CGPoint tempDraggedPoint = CGPointMake(draggedPoint.x + dX, draggedPoint.y + dY);
    //: CGFloat width = (tempDraggedPoint.x - oppositePoint.x);
    CGFloat width = (tempDraggedPoint.x - oppositePoint.x);
    //: CGFloat height = (tempDraggedPoint.y - oppositePoint.y);
    CGFloat height = (tempDraggedPoint.y - oppositePoint.y);
    //: CGFloat size = fabs(width)>=fabs(height) ? width : height;
    CGFloat size = fabs(width)>=fabs(height) ? width : height;
    //: CGFloat xDir = draggedPoint.x<=oppositePoint.x ? 1 : -1;
    CGFloat xDir = draggedPoint.x<=oppositePoint.x ? 1 : -1;
    //: CGFloat yDir = draggedPoint.y<=oppositePoint.y ? 1 : -1;
    CGFloat yDir = draggedPoint.y<=oppositePoint.y ? 1 : -1;
    //: CGFloat newX = 0, newY = 0;
    CGFloat newX = 0, newY = 0;
    //: if (xDir>=0) {
    if (xDir>=0) {
        //on the right
        //: if(square)
        if(k_dataTitle)
        //: newX = oppositePoint.x - fabs(size);
        newX = oppositePoint.x - fabs(size);
        //: else
        else
        //: newX = oppositePoint.x - fabs(width);
        newX = oppositePoint.x - fabs(width);
     }
    //: else {
    else {
        //on the left
    //: if(square )
    if(k_dataTitle )
        //: newX = oppositePoint.x + fabs(size);
        newX = oppositePoint.x + fabs(size);
    //: else
    else
        //: newX = oppositePoint.x + fabs(width);
        newX = oppositePoint.x + fabs(width);
     }

    //: if (yDir>=0) {
    if (yDir>=0) {
        //on the top
    //: if(square)
    if(k_dataTitle)
        //: newY = oppositePoint.y - fabs(size);
        newY = oppositePoint.y - fabs(size);
    //: else
    else
        //: newY = oppositePoint.y - fabs(height);
        newY = oppositePoint.y - fabs(height);
      }
    //: else {
    else {
        //on the bottom
    //: if(square)
    if(k_dataTitle)
        //: newY = oppositePoint.y + fabs(size);
        newY = oppositePoint.y + fabs(size);
    //: else
    else
        //: newY = oppositePoint.y + fabs(height);
        newY = oppositePoint.y + fabs(height);
    }

    //: CGSize displacement = CGSizeMake(newX - draggedPoint.x, newY - draggedPoint.y);
    CGSize displacement = CGSizeMake(newX - draggedPoint.x, newY - draggedPoint.y);
    //: return displacement;
    return displacement;
}

//: - (void)handleDragTopLeft:(CGPoint)dragLocation {
- (void)textLeft:(CGPoint)dragLocation {
    //: CGSize disp = [self deriveDisplacementFromDragLocation:dragLocation draggedPoint:dragPoint.topLeftCenter oppositePoint:dragPoint.bottomRightCenter];
    CGSize disp = [self sumWith:dragLocation view:dragPoint.topLeftCenter size:dragPoint.bottomRightCenter];
    //: CGPoint topLeft = CGPointMake(dragPoint.topLeftCenter.x + disp.width, dragPoint.topLeftCenter.y + disp.height);
    CGPoint topLeft = CGPointMake(dragPoint.topLeftCenter.x + disp.width, dragPoint.topLeftCenter.y + disp.height);
    //: CGPoint topRight = CGPointMake(dragPoint.topRightCenter.x, dragPoint.topLeftCenter.y + disp.height);
    CGPoint topRight = CGPointMake(dragPoint.topRightCenter.x, dragPoint.topLeftCenter.y + disp.height);
    //: CGPoint bottomLeft = CGPointMake(dragPoint.bottomLeftCenter.x + disp.width, dragPoint.bottomLeftCenter.y);
    CGPoint bottomLeft = CGPointMake(dragPoint.bottomLeftCenter.x + disp.width, dragPoint.bottomLeftCenter.y);

    // Make sure that the new cropping area will not be smaller than the minimum image size
    //: CGFloat width = topRight.x - topLeft.x;
    CGFloat width = topRight.x - topLeft.x;
    //: CGFloat height = bottomLeft.y - topLeft.y;
    CGFloat height = bottomLeft.y - topLeft.y;
    //: width = width * self.imageScale;
    width = width * self.imageScale;
    //: height = height * self.imageScale;
    height = height * self.imageScale;

    // If the crop area is too small, set the points at the minimum spacing.
    //: CGRect cropArea = [self cropAreaFromControlPoints];
    CGRect cropArea = [self bar];
    //: if (width >= IMAGE_MIN_WIDTH && height < IMAGE_MIN_HEIGHT) {
    if (width >= k_linkTitle && height < k_entityData) {
        //: topLeft.y = cropArea.origin.y + (((cropArea.size.height * self.imageScale) - IMAGE_MIN_HEIGHT) / self.imageScale);
        topLeft.y = cropArea.origin.y + (((cropArea.size.height * self.imageScale) - k_entityData) / self.imageScale);
        //: topRight.y = topLeft.y;
        topRight.y = topLeft.y;
    //: } else if (width < IMAGE_MIN_WIDTH && height >= IMAGE_MIN_HEIGHT) {
    } else if (width < k_linkTitle && height >= k_entityData) {
        //: topLeft.x = cropArea.origin.x + (((cropArea.size.width * self.imageScale) - IMAGE_MIN_WIDTH) / self.imageScale);
        topLeft.x = cropArea.origin.x + (((cropArea.size.width * self.imageScale) - k_linkTitle) / self.imageScale);
        //: bottomLeft.x = topLeft.x;
        bottomLeft.x = topLeft.x;
    //: } else if (width < IMAGE_MIN_WIDTH && height < IMAGE_MIN_HEIGHT) {
    } else if (width < k_linkTitle && height < k_entityData) {
        //: topLeft.x = cropArea.origin.x + (((cropArea.size.width * self.imageScale) - IMAGE_MIN_WIDTH) / self.imageScale);
        topLeft.x = cropArea.origin.x + (((cropArea.size.width * self.imageScale) - k_linkTitle) / self.imageScale);
        //: topLeft.y = cropArea.origin.y + (((cropArea.size.height * self.imageScale) - IMAGE_MIN_HEIGHT) / self.imageScale);
        topLeft.y = cropArea.origin.y + (((cropArea.size.height * self.imageScale) - k_entityData) / self.imageScale);
        //: topRight.y = topLeft.y;
        topRight.y = topLeft.y;
        //: bottomLeft.x = topLeft.x;
        bottomLeft.x = topLeft.x;
    }

    //: [self boundingBoxForTopLeft:topLeft bottomLeft:bottomLeft bottomRight:dragPoint.bottomRightCenter topRight:topRight];
    [self digitiser:topLeft image:bottomLeft bottom:dragPoint.bottomRightCenter numberBox:topRight];
}
//: - (void)handleDragBottomLeft:(CGPoint)dragLocation {
- (void)name:(CGPoint)dragLocation {
    //: CGSize disp = [self deriveDisplacementFromDragLocation:dragLocation draggedPoint:dragPoint.bottomLeftCenter oppositePoint:dragPoint.topRightCenter];
    CGSize disp = [self sumWith:dragLocation view:dragPoint.bottomLeftCenter size:dragPoint.topRightCenter];
    //: CGPoint bottomLeft = CGPointMake(dragPoint.bottomLeftCenter.x + disp.width, dragPoint.bottomLeftCenter.y + disp.height);
    CGPoint bottomLeft = CGPointMake(dragPoint.bottomLeftCenter.x + disp.width, dragPoint.bottomLeftCenter.y + disp.height);
    //: CGPoint topLeft = CGPointMake(dragPoint.topLeftCenter.x + disp.width, dragPoint.topLeftCenter.y);
    CGPoint topLeft = CGPointMake(dragPoint.topLeftCenter.x + disp.width, dragPoint.topLeftCenter.y);
    //: CGPoint bottomRight = CGPointMake(dragPoint.bottomRightCenter.x, dragPoint.bottomRightCenter.y + disp.height);
    CGPoint bottomRight = CGPointMake(dragPoint.bottomRightCenter.x, dragPoint.bottomRightCenter.y + disp.height);

    // Make sure that the new cropping area will not be smaller than the minimum image size
    //: CGFloat width = bottomRight.x - bottomLeft.x;
    CGFloat width = bottomRight.x - bottomLeft.x;
    //: CGFloat height = bottomLeft.y - topLeft.y;
    CGFloat height = bottomLeft.y - topLeft.y;
    //: width = width * self.imageScale;
    width = width * self.imageScale;
    //: height = height * self.imageScale;
    height = height * self.imageScale;

    // If the crop area is too small, set the points at the minimum spacing.
    //: CGRect cropArea = [self cropAreaFromControlPoints];
    CGRect cropArea = [self bar];
    //: if (width >= IMAGE_MIN_WIDTH && height < IMAGE_MIN_HEIGHT) {
    if (width >= k_linkTitle && height < k_entityData) {
        //: bottomLeft.y = cropArea.origin.y + (IMAGE_MIN_HEIGHT / self.imageScale);
        bottomLeft.y = cropArea.origin.y + (k_entityData / self.imageScale);
        //: bottomRight.y = bottomLeft.y;
        bottomRight.y = bottomLeft.y;
    //: } else if (width < IMAGE_MIN_WIDTH && height >= IMAGE_MIN_HEIGHT) {
    } else if (width < k_linkTitle && height >= k_entityData) {
        //: bottomLeft.x = cropArea.origin.x + (((cropArea.size.width * self.imageScale) - IMAGE_MIN_WIDTH) / self.imageScale);
        bottomLeft.x = cropArea.origin.x + (((cropArea.size.width * self.imageScale) - k_linkTitle) / self.imageScale);
        //: topLeft.x = bottomLeft.x;
        topLeft.x = bottomLeft.x;
    //: } else if (width < IMAGE_MIN_WIDTH && height < IMAGE_MIN_HEIGHT) {
    } else if (width < k_linkTitle && height < k_entityData) {
        //: bottomLeft.x = cropArea.origin.x + (((cropArea.size.width * self.imageScale) - IMAGE_MIN_WIDTH) / self.imageScale);
        bottomLeft.x = cropArea.origin.x + (((cropArea.size.width * self.imageScale) - k_linkTitle) / self.imageScale);
        //: bottomLeft.y = cropArea.origin.y + (IMAGE_MIN_HEIGHT / self.imageScale);
        bottomLeft.y = cropArea.origin.y + (k_entityData / self.imageScale);
        //: topLeft.x = bottomLeft.x;
        topLeft.x = bottomLeft.x;
        //: bottomRight.y = bottomLeft.y;
        bottomRight.y = bottomLeft.y;
    }

    //: [self boundingBoxForTopLeft:topLeft bottomLeft:bottomLeft bottomRight:bottomRight topRight:dragPoint.topRightCenter];
    [self digitiser:topLeft image:bottomLeft bottom:bottomRight numberBox:dragPoint.topRightCenter];
}

//: - (void)handleDragBottomRight:(CGPoint)dragLocation {
- (void)buttonRight:(CGPoint)dragLocation {
    //: CGSize disp = [self deriveDisplacementFromDragLocation:dragLocation draggedPoint:dragPoint.bottomRightCenter oppositePoint:dragPoint.topLeftCenter];
    CGSize disp = [self sumWith:dragLocation view:dragPoint.bottomRightCenter size:dragPoint.topLeftCenter];
    //: CGPoint bottomRight = CGPointMake(dragPoint.bottomRightCenter.x + disp.width, dragPoint.bottomRightCenter.y + disp.height);
    CGPoint bottomRight = CGPointMake(dragPoint.bottomRightCenter.x + disp.width, dragPoint.bottomRightCenter.y + disp.height);
    //: CGPoint topRight = CGPointMake(dragPoint.topRightCenter.x + disp.width, dragPoint.topRightCenter.y);
    CGPoint topRight = CGPointMake(dragPoint.topRightCenter.x + disp.width, dragPoint.topRightCenter.y);
    //: CGPoint bottomLeft = CGPointMake(dragPoint.bottomLeftCenter.x, dragPoint.bottomLeftCenter.y + disp.height);
    CGPoint bottomLeft = CGPointMake(dragPoint.bottomLeftCenter.x, dragPoint.bottomLeftCenter.y + disp.height);

    // Make sure that the new cropping area will not be smaller than the minimum image size
    //: CGFloat width = bottomRight.x - bottomLeft.x;
    CGFloat width = bottomRight.x - bottomLeft.x;
    //: CGFloat height = bottomRight.y - topRight.y;
    CGFloat height = bottomRight.y - topRight.y;
    //: width = width * self.imageScale;
    width = width * self.imageScale;
    //: height = height * self.imageScale;
    height = height * self.imageScale;

    // If the crop area is too small, set the points at the minimum spacing.
    //: CGRect cropArea = [self cropAreaFromControlPoints];
    CGRect cropArea = [self bar];
    //: if (width >= IMAGE_MIN_WIDTH && height < IMAGE_MIN_HEIGHT) {
    if (width >= k_linkTitle && height < k_entityData) {
        //: bottomRight.y = cropArea.origin.y + (IMAGE_MIN_HEIGHT / self.imageScale);
        bottomRight.y = cropArea.origin.y + (k_entityData / self.imageScale);
        //: bottomLeft.y = bottomRight.y;
        bottomLeft.y = bottomRight.y;
    //: } else if (width < IMAGE_MIN_WIDTH && height >= IMAGE_MIN_HEIGHT) {
    } else if (width < k_linkTitle && height >= k_entityData) {
        //: bottomRight.x = cropArea.origin.x + (IMAGE_MIN_WIDTH / self.imageScale);
        bottomRight.x = cropArea.origin.x + (k_linkTitle / self.imageScale);
        //: topRight.x = bottomRight.x;
        topRight.x = bottomRight.x;
    //: } else if (width < IMAGE_MIN_WIDTH && height < IMAGE_MIN_HEIGHT) {
    } else if (width < k_linkTitle && height < k_entityData) {
        //: bottomRight.x = cropArea.origin.x + (IMAGE_MIN_WIDTH / self.imageScale);
        bottomRight.x = cropArea.origin.x + (k_linkTitle / self.imageScale);
        //: bottomRight.y = cropArea.origin.y + (IMAGE_MIN_HEIGHT / self.imageScale);
        bottomRight.y = cropArea.origin.y + (k_entityData / self.imageScale);
        //: topRight.x = bottomRight.x;
        topRight.x = bottomRight.x;
        //: bottomLeft.y = bottomRight.y;
        bottomLeft.y = bottomRight.y;
    }

    //: [self boundingBoxForTopLeft:dragPoint.topLeftCenter bottomLeft:bottomLeft bottomRight:bottomRight topRight:topRight];
    [self digitiser:dragPoint.topLeftCenter image:bottomLeft bottom:bottomRight numberBox:topRight];
}

//: - (void)handleDragTopRight:(CGPoint)dragLocation {
- (void)sumRight:(CGPoint)dragLocation {
    //: CGSize disp = [self deriveDisplacementFromDragLocation:dragLocation draggedPoint:dragPoint.topRightCenter oppositePoint:dragPoint.bottomLeftCenter];
    CGSize disp = [self sumWith:dragLocation view:dragPoint.topRightCenter size:dragPoint.bottomLeftCenter];
    //: CGPoint topRight = CGPointMake(dragPoint.topRightCenter.x + disp.width, dragPoint.topRightCenter.y + disp.height);
    CGPoint topRight = CGPointMake(dragPoint.topRightCenter.x + disp.width, dragPoint.topRightCenter.y + disp.height);
    //: CGPoint topLeft = CGPointMake(dragPoint.topLeftCenter.x, dragPoint.topLeftCenter.y + disp.height);
    CGPoint topLeft = CGPointMake(dragPoint.topLeftCenter.x, dragPoint.topLeftCenter.y + disp.height);
    //: CGPoint bottomRight = CGPointMake(dragPoint.bottomRightCenter.x + disp.width, dragPoint.bottomRightCenter.y);
    CGPoint bottomRight = CGPointMake(dragPoint.bottomRightCenter.x + disp.width, dragPoint.bottomRightCenter.y);

    // Make sure that the new cropping area will not be smaller than the minimum image size
    //: CGFloat width = topRight.x - topLeft.x;
    CGFloat width = topRight.x - topLeft.x;
    //: CGFloat height = bottomRight.y - topRight.y;
    CGFloat height = bottomRight.y - topRight.y;
    //: width = width * self.imageScale;
    width = width * self.imageScale;
    //: height = height * self.imageScale;
    height = height * self.imageScale;

    // If the crop area is too small, set the points at the minimum spacing.
    //: CGRect cropArea = [self cropAreaFromControlPoints];
    CGRect cropArea = [self bar];
    //: if (width >= IMAGE_MIN_WIDTH && height < IMAGE_MIN_HEIGHT) {
    if (width >= k_linkTitle && height < k_entityData) {
        //: topRight.y = cropArea.origin.y + (((cropArea.size.height * self.imageScale) - IMAGE_MIN_HEIGHT) / self.imageScale);
        topRight.y = cropArea.origin.y + (((cropArea.size.height * self.imageScale) - k_entityData) / self.imageScale);
        //: topLeft.y = topRight.y;
        topLeft.y = topRight.y;
    //: } else if (width < IMAGE_MIN_WIDTH && height >= IMAGE_MIN_HEIGHT) {
    } else if (width < k_linkTitle && height >= k_entityData) {
        //: topRight.x = cropArea.origin.x + (IMAGE_MIN_WIDTH / self.imageScale);
        topRight.x = cropArea.origin.x + (k_linkTitle / self.imageScale);
        //: bottomRight.x = topRight.x;
        bottomRight.x = topRight.x;
    //: } else if (width < IMAGE_MIN_WIDTH && height < IMAGE_MIN_HEIGHT) {
    } else if (width < k_linkTitle && height < k_entityData) {
        //: topRight.x = cropArea.origin.x + (IMAGE_MIN_WIDTH / self.imageScale);
        topRight.x = cropArea.origin.x + (k_linkTitle / self.imageScale);
        //: topRight.y = cropArea.origin.y + (((cropArea.size.height * self.imageScale) - IMAGE_MIN_HEIGHT) / self.imageScale);
        topRight.y = cropArea.origin.y + (((cropArea.size.height * self.imageScale) - k_entityData) / self.imageScale);
        //: topLeft.y = topRight.y;
        topLeft.y = topRight.y;
        //: bottomRight.x = topRight.x;
        bottomRight.x = topRight.x;
    }

    //: [self boundingBoxForTopLeft:topLeft bottomLeft:dragPoint.bottomLeftCenter bottomRight:bottomRight topRight:topRight];
    [self digitiser:topLeft image:dragPoint.bottomLeftCenter bottom:bottomRight numberBox:topRight];
}

//: - (void)handleDragCropArea:(CGPoint)dragLocation {
- (void)pin:(CGPoint)dragLocation {
    //: CGFloat dX = dragLocation.x - dragPoint.dragStart.x;
    CGFloat dX = dragLocation.x - dragPoint.dragStart.x;
    //: CGFloat dY = dragLocation.y - dragPoint.dragStart.y;
    CGFloat dY = dragLocation.y - dragPoint.dragStart.y;

    //: CGPoint newTopLeft = CGPointMake(dragPoint.topLeftCenter.x + dX, dragPoint.topLeftCenter.y + dY);
    CGPoint newTopLeft = CGPointMake(dragPoint.topLeftCenter.x + dX, dragPoint.topLeftCenter.y + dY);
    //: CGPoint newBottomLeft = CGPointMake(dragPoint.bottomLeftCenter.x + dX, dragPoint.bottomLeftCenter.y + dY);
    CGPoint newBottomLeft = CGPointMake(dragPoint.bottomLeftCenter.x + dX, dragPoint.bottomLeftCenter.y + dY);
    //: CGPoint newBottomRight = CGPointMake(dragPoint.bottomRightCenter.x + dX, dragPoint.bottomRightCenter.y + dY);
    CGPoint newBottomRight = CGPointMake(dragPoint.bottomRightCenter.x + dX, dragPoint.bottomRightCenter.y + dY);
    //: CGPoint newTopRight = CGPointMake(dragPoint.topRightCenter.x + dX, dragPoint.topRightCenter.y + dY);
    CGPoint newTopRight = CGPointMake(dragPoint.topRightCenter.x + dX, dragPoint.topRightCenter.y + dY);

    //: CGFloat cropAreaWidth = dragPoint.topRightCenter.x - dragPoint.topLeftCenter.x;
    CGFloat cropAreaWidth = dragPoint.topRightCenter.x - dragPoint.topLeftCenter.x;
    //: CGFloat cropAreaHeight = dragPoint.bottomLeftCenter.y - dragPoint.topLeftCenter.y;
    CGFloat cropAreaHeight = dragPoint.bottomLeftCenter.y - dragPoint.topLeftCenter.y;

    //: CGFloat minX = imageFrameInView.origin.x;
    CGFloat minX = imageFrameInView.origin.x;
    //: CGFloat maxX = imageFrameInView.origin.x + imageFrameInView.size.width;
    CGFloat maxX = imageFrameInView.origin.x + imageFrameInView.size.width;
    //: CGFloat minY = imageFrameInView.origin.y;
    CGFloat minY = imageFrameInView.origin.y;
    //: CGFloat maxY = imageFrameInView.origin.y + imageFrameInView.size.height;
    CGFloat maxY = imageFrameInView.origin.y + imageFrameInView.size.height;

    //: if (newTopLeft.x<minX) {
    if (newTopLeft.x<minX) {
        //: newTopLeft.x = minX;
        newTopLeft.x = minX;
        //: newBottomLeft.x = minX;
        newBottomLeft.x = minX;
        //: newTopRight.x = newTopLeft.x + cropAreaWidth;
        newTopRight.x = newTopLeft.x + cropAreaWidth;
        //: newBottomRight.x = newTopRight.x;
        newBottomRight.x = newTopRight.x;
    }

    //: if(newTopLeft.y<minY) {
    if(newTopLeft.y<minY) {
        //: newTopLeft.y = minY;
        newTopLeft.y = minY;
        //: newTopRight.y = minY;
        newTopRight.y = minY;
        //: newBottomLeft.y = newTopLeft.y + cropAreaHeight;
        newBottomLeft.y = newTopLeft.y + cropAreaHeight;
        //: newBottomRight.y = newBottomLeft.y;
        newBottomRight.y = newBottomLeft.y;
    }

    //: if (newBottomRight.x>maxX) {
    if (newBottomRight.x>maxX) {
        //: newBottomRight.x = maxX;
        newBottomRight.x = maxX;
        //: newTopRight.x = maxX;
        newTopRight.x = maxX;
        //: newTopLeft.x = newBottomRight.x - cropAreaWidth;
        newTopLeft.x = newBottomRight.x - cropAreaWidth;
        //: newBottomLeft.x = newTopLeft.x;
        newBottomLeft.x = newTopLeft.x;
    }

    //: if (newBottomRight.y>maxY) {
    if (newBottomRight.y>maxY) {
        //: newBottomRight.y = maxY;
        newBottomRight.y = maxY;
        //: newBottomLeft.y = maxY;
        newBottomLeft.y = maxY;
        //: newTopRight.y = newBottomRight.y - cropAreaHeight;
        newTopRight.y = newBottomRight.y - cropAreaHeight;
        //: newTopLeft.y = newTopRight.y;
        newTopLeft.y = newTopRight.y;
    }
    //: topLeftPoint.center = newTopLeft;
    topLeftPoint.center = newTopLeft;
    //: bottomLeftPoint.center = newBottomLeft;
    bottomLeftPoint.center = newBottomLeft;
    //: bottomRightPoint.center = newBottomRight;
    bottomRightPoint.center = newBottomRight;
    //: topRightPoint.center = newTopRight;
    topRightPoint.center = newTopRight;

}

//: - (void)setControlPointSize:(CGFloat)_controlPointSize {
- (void)setControlPointSize:(CGFloat)_controlPointSize {
    //: CGFloat halfSize = _controlPointSize;
    CGFloat halfSize = _controlPointSize;
    //: CGRect topLeftPointFrame = CGRectMake(topLeftPoint.center.x - halfSize, topLeftPoint.center.y - halfSize, controlPointSize, controlPointSize);
    CGRect topLeftPointFrame = CGRectMake(topLeftPoint.center.x - halfSize, topLeftPoint.center.y - halfSize, controlPointSize, controlPointSize);
    //: CGRect bottomLeftPointFrame = CGRectMake(bottomLeftPoint.center.x - halfSize, bottomLeftPoint.center.y - halfSize, controlPointSize, controlPointSize);
    CGRect bottomLeftPointFrame = CGRectMake(bottomLeftPoint.center.x - halfSize, bottomLeftPoint.center.y - halfSize, controlPointSize, controlPointSize);
    //: CGRect bottomRightPointFrame = CGRectMake(bottomRightPoint.center.x - halfSize, bottomRightPoint.center.y - halfSize, controlPointSize, controlPointSize);
    CGRect bottomRightPointFrame = CGRectMake(bottomRightPoint.center.x - halfSize, bottomRightPoint.center.y - halfSize, controlPointSize, controlPointSize);
    //: CGRect topRightPointFrame = CGRectMake(topRightPoint.center.x - halfSize, topRightPoint.center.y - halfSize, controlPointSize, controlPointSize);
    CGRect topRightPointFrame = CGRectMake(topRightPoint.center.x - halfSize, topRightPoint.center.y - halfSize, controlPointSize, controlPointSize);

    //: topLeftPoint.frame = topLeftPointFrame;
    topLeftPoint.frame = topLeftPointFrame;
    //: bottomLeftPoint.frame = bottomLeftPointFrame;
    bottomLeftPoint.frame = bottomLeftPointFrame;
    //: bottomRightPoint.frame = bottomRightPointFrame;
    bottomRightPoint.frame = bottomRightPointFrame;
    //: topRightPoint.frame = topRightPointFrame;
    topRightPoint.frame = topRightPointFrame;

    //: [self setNeedsDisplay];
    [self setNeedsDisplay];
}

//: - (CGFloat)controlPointSize {
- (CGFloat)controlPointSize {
    //: return controlPointSize;
    return controlPointSize;
}

//: - (void)setMaskAlpha:(CGFloat)alpha {
- (void)setMaskAlpha:(CGFloat)alpha {
    //: self.shadeView.shadeAlpha = alpha;
    self.shadeView.shadeAlpha = alpha;
}

//: - (CGFloat)maskAlpha {
- (CGFloat)maskAlpha {
    //: return self.shadeView.shadeAlpha;
    return self.shadeView.shadeAlpha;
}

//: - (CGRect)cropAreaInImage {
- (CGRect)cropAreaInImage {
    //: CGRect _cropArea = self.cropAreaInView;
    CGRect _cropArea = self.cropAreaInView;
    //: CGRect r = CGRectMake((int)((_cropArea.origin.x - imageFrameInView.origin.x) * self.imageScale),
    CGRect r = CGRectMake((int)((_cropArea.origin.x - imageFrameInView.origin.x) * self.imageScale),
                          //: (int)((_cropArea.origin.y - imageFrameInView.origin.y) * self.imageScale),
                          (int)((_cropArea.origin.y - imageFrameInView.origin.y) * self.imageScale),
                          //: (int)(_cropArea.size.width * self.imageScale),
                          (int)(_cropArea.size.width * self.imageScale),
                          //: (int)(_cropArea.size.height * self.imageScale));
                          (int)(_cropArea.size.height * self.imageScale));
    //: return r;
    return r;
}

//: - (void)setCropAreaInImage:(CGRect)_cropAreaInImage {
- (void)setCropAreaInImage:(CGRect)_cropAreaInImage {
    //: CGRect r = CGRectMake(_cropAreaInImage.origin.x/self.imageScale + imageFrameInView.origin.x,
    CGRect r = CGRectMake(_cropAreaInImage.origin.x/self.imageScale + imageFrameInView.origin.x,
                          //: _cropAreaInImage.origin.y/self.imageScale + imageFrameInView.origin.y,
                          _cropAreaInImage.origin.y/self.imageScale + imageFrameInView.origin.y,
                          //: _cropAreaInImage.size.width/self.imageScale,
                          _cropAreaInImage.size.width/self.imageScale,
                          //: _cropAreaInImage.size.height/self.imageScale);
                          _cropAreaInImage.size.height/self.imageScale);
    //: [self setCropAreaInView:r];
    [self setCropAreaInView:r];
}

//: - (CGRect)cropAreaInView {
- (CGRect)cropAreaInView {
    //: CGRect cropArea = [self cropAreaFromControlPoints];
    CGRect cropArea = [self bar];
    //: return cropArea;
    return cropArea;
}

//: - (void)setCropAreaInView:(CGRect)cropArea {
- (void)setCropAreaInView:(CGRect)cropArea {
    //: CGPoint topLeft = cropArea.origin;
    CGPoint topLeft = cropArea.origin;
    //: CGPoint bottomLeft = CGPointMake(cropArea.origin.x, cropArea.origin.y + cropArea.size.height);
    CGPoint bottomLeft = CGPointMake(cropArea.origin.x, cropArea.origin.y + cropArea.size.height);
    //: CGPoint bottomRight = CGPointMake(cropArea.origin.x + cropArea.size.width, cropArea.origin.y + cropArea.size.height);
    CGPoint bottomRight = CGPointMake(cropArea.origin.x + cropArea.size.width, cropArea.origin.y + cropArea.size.height);
    //: CGPoint topRight = CGPointMake(cropArea.origin.x + cropArea.size.width, cropArea.origin.y);
    CGPoint topRight = CGPointMake(cropArea.origin.x + cropArea.size.width, cropArea.origin.y);
    //: topLeftPoint.center = topLeft;
    topLeftPoint.center = topLeft;
    //: bottomLeftPoint.center = bottomLeft;
    bottomLeftPoint.center = bottomLeft;
    //: bottomRightPoint.center = bottomRight;
    bottomRightPoint.center = bottomRight;
    //: topRightPoint.center = topRight;
    topRightPoint.center = topRight;

    //: [self setCropAreaForViews:cropArea];
    [self setAirt:cropArea];
    //: [self setNeedsDisplay];
    [self setNeedsDisplay];
}

//: - (void)setImage:(UIImage *)image {
- (void)setImage:(UIImage *)image {
    //: CGFloat frameWidth = self.frame.size.width;
    CGFloat frameWidth = self.frame.size.width;
    //: CGFloat frameHeight = self.frame.size.height;
    CGFloat frameHeight = self.frame.size.height;
    //: CGFloat imageWidth = image.size.width;
    CGFloat imageWidth = image.size.width;
    //: CGFloat imageHeight = image.size.height;
    CGFloat imageHeight = image.size.height;
    //: BOOL isPortrait = imageHeight / frameHeight > imageWidth/frameWidth;
    BOOL isPortrait = imageHeight / frameHeight > imageWidth/frameWidth;
    //: int x, y;
    int x, y;
    //: int scaledImageWidth, scaledImageHeight;
    int scaledImageWidth, scaledImageHeight;
    //: if (isPortrait) {
    if (isPortrait) {
        //: imageScale = imageHeight / frameHeight;
        imageScale = imageHeight / frameHeight;
        //: scaledImageWidth = imageWidth / imageScale;
        scaledImageWidth = imageWidth / imageScale;
        //: scaledImageHeight = frameHeight;
        scaledImageHeight = frameHeight;
        //: x = (frameWidth - scaledImageWidth) / 2;
        x = (frameWidth - scaledImageWidth) / 2;
        //: y = 0;
        y = 0;
    }
    //: else {
    else {
        //: imageScale = imageWidth / frameWidth;
        imageScale = imageWidth / frameWidth;
        //: scaledImageWidth = frameWidth;
        scaledImageWidth = frameWidth;
        //: scaledImageHeight = imageHeight / imageScale;
        scaledImageHeight = imageHeight / imageScale;
        //: x = 0;
        x = 0;
        //: y = (frameHeight - scaledImageHeight) / 2;
        y = (frameHeight - scaledImageHeight) / 2;
    }
    //: imageFrameInView = CGRectMake(x, y, scaledImageWidth, scaledImageHeight);
    imageFrameInView = CGRectMake(x, y, scaledImageWidth, scaledImageHeight);
    //: imageView.frame = imageFrameInView;
    imageView.frame = imageFrameInView;
    //: imageView.image = image;
    imageView.image = image;

    /* prepare imageviews and their frame */
    //: self.shadeView.blurredImageView.contentMode = UIViewContentModeScaleAspectFill;
    self.shadeView.blurredImageView.contentMode = UIViewContentModeScaleAspectFill;
    //: imageView.contentMode = UIViewContentModeScaleAspectFill;
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    //: imageView.clipsToBounds = YES;
    imageView.clipsToBounds = YES;
    //: self.shadeView.blurredImageView.clipsToBounds = YES;
    self.shadeView.blurredImageView.clipsToBounds = YES;

    //: CGRect blurFrame;
    CGRect blurFrame;
    //: if (imageFrameInView.origin.x < 0 && (imageFrameInView.size.width - fabs(imageFrameInView.origin.x) >= 320)) {
    if (imageFrameInView.origin.x < 0 && (imageFrameInView.size.width - fabs(imageFrameInView.origin.x) >= 320)) {
        //: blurFrame = self.frame;
        blurFrame = self.frame;
    //: } else {
    } else {
        //: blurFrame = imageFrameInView;
        blurFrame = imageFrameInView;
    }
    //: imageView.frame = imageFrameInView;
    imageView.frame = imageFrameInView;

    // blurredimageview is on top of shadeview so shadeview needs the same frame as imageView.
    //: self.shadeView.frame = imageFrameInView;
    self.shadeView.frame = imageFrameInView;
    //: self.shadeView.blurredImageView.frame = blurFrame;
    self.shadeView.blurredImageView.frame = blurFrame;

    // perform image blur
    //: UIImage *blur;
    UIImage *blur;
    //: if (self.blurred) {
    if (self.blurred) {
        //: blur = [image blurredImageWithRadius:30 iterations:1 tintColor:[UIColor blackColor]];
        blur = [image titleColor:30 disableUse:1 enable:[UIColor blackColor]];
    //: } else {
    } else {
        //: blur = [image blurredImageWithRadius:0 iterations:1 tintColor:[UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:1.0]];
        blur = [image titleColor:0 disableUse:1 enable:[UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:1.0]];
    }
    //: [self.shadeView.blurredImageView setImage:blur];
    [self.shadeView.blurredImageView setImage:blur];

    //Special fix. If scaledImageWidth or scaledImageHeight < cropArea.width of cropArea.Height.
    //: [self boundingBoxForTopLeft:topLeftPoint.center bottomLeft:bottomLeftPoint.center bottomRight:bottomRightPoint.center topRight:topRightPoint.center];
    [self digitiser:topLeftPoint.center image:bottomLeftPoint.center bottom:bottomRightPoint.center numberBox:topRightPoint.center];
    //: CGRect cropArea = [self cropAreaFromControlPoints];
    CGRect cropArea = [self bar];
    //: cropAreaView.frame = cropArea;
    cropAreaView.frame = cropArea;
    //: cropArea.origin.y = cropArea.origin.y - imageFrameInView.origin.y;
    cropArea.origin.y = cropArea.origin.y - imageFrameInView.origin.y;
    //: cropArea.origin.x = cropArea.origin.x - imageFrameInView.origin.x;
    cropArea.origin.x = cropArea.origin.x - imageFrameInView.origin.x;
    //: [self.shadeView setCropArea:cropArea];
    [self.shadeView setCropArea:cropArea];

}

//: - (UIColor*)controlColor {
- (UIColor*)controlColor {
    //: return controlColor;
    return controlColor;
}

//: - (void)setControlColor:(UIColor *)_color {
- (void)setControlColor:(UIColor *)_color {
    //: controlColor = _color;
    controlColor = _color;
    //: self.shadeView.cropBorderColor = _color;
    self.shadeView.cropBorderColor = _color;
    //: topLeftPoint.color = _color;
    topLeftPoint.color = _color;
    //: bottomLeftPoint.color = _color;
    bottomLeftPoint.color = _color;
    //: bottomRightPoint.color = _color;
    bottomRightPoint.color = _color;
    //: topRightPoint.color = _color;
    topRightPoint.color = _color;
}

//: - (void)setUserInteractionEnabled:(BOOL)_userInteractionEnabled {
- (void)setUserInteractionEnabled:(BOOL)_userInteractionEnabled {
    //: if (!_userInteractionEnabled) {
    if (!_userInteractionEnabled) {
        //: [topLeftPoint setHidden:YES];
        [topLeftPoint setHidden:YES];
        //: [bottomLeftPoint setHidden:YES];
        [bottomLeftPoint setHidden:YES];
        //: [bottomRightPoint setHidden:YES];
        [bottomRightPoint setHidden:YES];
        //: [topRightPoint setHidden:YES];
        [topRightPoint setHidden:YES];
    }
    //: [super setUserInteractionEnabled:_userInteractionEnabled];
    [super setUserInteractionEnabled:_userInteractionEnabled];
}

//: @end
@end

//: @implementation UIImage (fixOrientation)
@implementation UIImage (Position)

//: - (UIImage *)fixOrientation {
- (UIImage *)person {

    // No-op if the orientation is already correct
    //: if (self.imageOrientation == UIImageOrientationUp) return self;
    if (self.imageOrientation == UIImageOrientationUp) return self;

    // We need to calculate the proper transformation to make the image upright.
    // We do it in 2 steps: Rotate if Left/Right/Down, and then flip if Mirrored.
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
        //: case UIImageOrientationUp:
        case UIImageOrientationUp:
        //: case UIImageOrientationUpMirrored:
        case UIImageOrientationUpMirrored:
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
        //: case UIImageOrientationUp:
        case UIImageOrientationUp:
        //: case UIImageOrientationDown:
        case UIImageOrientationDown:
        //: case UIImageOrientationLeft:
        case UIImageOrientationLeft:
        //: case UIImageOrientationRight:
        case UIImageOrientationRight:
            //: break;
            break;
    }

    // Now we draw the underlying CGImage into a new context, applying the transform
    // calculated above.
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
            // Grr...
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

    // And now we just create a new UIImage from the drawing context
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
//: @end
@end