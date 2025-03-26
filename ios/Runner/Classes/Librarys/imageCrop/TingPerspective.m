
#import <Foundation/Foundation.h>

NSString *StringFromPlainSpareData(Byte *data);


//: position
Byte str_nearRefugeeValue[] = {34, 8, 25, 13, 69, 142, 62, 122, 209, 149, 41, 215, 167, 137, 136, 140, 130, 141, 130, 136, 135, 226};


//: bounds
Byte str_goalYardValue[] = {20, 6, 87, 13, 116, 58, 221, 100, 178, 59, 213, 88, 149, 185, 198, 204, 197, 187, 202, 248};


//: linear
Byte str_innovativeContent[] = {26, 6, 28, 12, 70, 144, 238, 114, 105, 217, 183, 56, 136, 133, 138, 129, 125, 142, 95};


//: blurRadius
Byte str_treeData[] = {53, 10, 19, 4, 117, 127, 136, 133, 101, 116, 119, 124, 136, 134, 149};


//: backgroundColor
Byte str_minPostValue[] = {25, 15, 93, 12, 32, 65, 98, 83, 30, 12, 76, 66, 191, 190, 192, 200, 196, 207, 204, 210, 203, 193, 160, 204, 201, 204, 207, 80};

// __DEBUG__
// __CLOSE_PRINT__
//
//  TingPerspective.m
//
//  Version 1.6.2
//
//  Created by Nick Lockwood on 25/08/2013.
//  Copyright (c) 2013 Charcoal Design
//
//  Distributed under the permissive zlib License
//  Get the latest version from here:
//
//  https://github.com/nicklockwood/TingPerspective
//
//  This software is provided 'as-is', without any express or implied
//  warranty.  In no event will the authors be held liable for any damages
//  arising from the use of this software.
//
//  Permission is granted to anyone to use this software for any purpose,
//  including commercial applications, and to alter it and redistribute it
//  freely, subject to the following restrictions:
//
//  1. The origin of this software must not be misrepresented; you must not
//  claim that you wrote the original software. If you use this software
//  in a product, an acknowledgment in the product documentation would be
//  appreciated but is not required.
//
//  2. Altered source versions must be plainly marked as such, and must not be
//  misrepresented as being the original software.
//
//  3. This notice may not be removed or altered from any source distribution.
//
//: #pragma GCC diagnostic ignored "-Wobjc-missing-property-synthesis"
#pragma GCC diagnostic ignored "-Wobjc-missing-property-synthesis"
//: #pragma GCC diagnostic ignored "-Wdirect-ivar-access"
#pragma GCC diagnostic ignored "-Wdirect-ivar-access"
//: #pragma GCC diagnostic ignored "-Wgnu"
#pragma GCC diagnostic ignored "-Wgnu"

// __M_A_C_R_O__
//: #import "FXBlurView.h"
#import "TingPerspective.h"
//: #import <objc/runtime.h>
#import <objc/runtime.h>
//: #import <objc/message.h>
#import <objc/message.h>
//: #import <QuartzCore/QuartzCore.h>
#import <QuartzCore/QuartzCore.h>
//: #import <Accelerate/Accelerate.h>
#import <Accelerate/Accelerate.h>
//: #import <Availability.h>
#import <Availability.h>

//: @implementation UIImage (FXBlurView)
@implementation UIImage (TingPerspective)

//: - (UIImage *)blurredImageWithRadius:(CGFloat)radius iterations:(NSUInteger)iterations tintColor:(UIColor *)tintColor
- (UIImage *)titleColor:(CGFloat)radius disableUse:(NSUInteger)iterations enable:(UIColor *)tintColor
{
    //image must be nonzero size
    //: if (floorf(self.size.width) * floorf(self.size.height) <= 0.0f) return self;
    if (floorf(self.size.width) * floorf(self.size.height) <= 0.0f) return self;

    //boxsize must be an odd integer
    //: uint32_t boxSize = (uint32_t)(radius * self.scale);
    uint32_t boxSize = (uint32_t)(radius * self.scale);
    //: if (boxSize % 2 == 0) boxSize ++;
    if (boxSize % 2 == 0) boxSize ++;

    //create image buffers
    //: CGImageRef imageRef = self.CGImage;
    CGImageRef imageRef = self.CGImage;
    //: vImage_Buffer buffer1, buffer2;
    vImage_Buffer buffer1, buffer2;
    //: buffer1.width = buffer2.width = CGImageGetWidth(imageRef);
    buffer1.width = buffer2.width = CGImageGetWidth(imageRef);
    //: buffer1.height = buffer2.height = CGImageGetHeight(imageRef);
    buffer1.height = buffer2.height = CGImageGetHeight(imageRef);
    //: buffer1.rowBytes = buffer2.rowBytes = CGImageGetBytesPerRow(imageRef);
    buffer1.rowBytes = buffer2.rowBytes = CGImageGetBytesPerRow(imageRef);
    //: size_t bytes = buffer1.rowBytes * buffer1.height;
    size_t bytes = buffer1.rowBytes * buffer1.height;
    //: buffer1.data = malloc(bytes);
    buffer1.data = malloc(bytes);
    //: buffer2.data = malloc(bytes);
    buffer2.data = malloc(bytes);

    //create temp buffer
    //: void *tempBuffer = malloc((size_t)vImageBoxConvolve_ARGB8888(&buffer1, &buffer2, NULL, 0, 0, boxSize, boxSize,
    void *tempBuffer = malloc((size_t)vImageBoxConvolve_ARGB8888(&buffer1, &buffer2, NULL, 0, 0, boxSize, boxSize,
                                                                 //: NULL, kvImageEdgeExtend + kvImageGetTempBufferSize));
                                                                 NULL, kvImageEdgeExtend + kvImageGetTempBufferSize));

    //copy image data
    //: CFDataRef dataSource = CGDataProviderCopyData(CGImageGetDataProvider(imageRef));
    CFDataRef dataSource = CGDataProviderCopyData(CGImageGetDataProvider(imageRef));
    //: memcpy(buffer1.data, CFDataGetBytePtr(dataSource), bytes);
    memcpy(buffer1.data, CFDataGetBytePtr(dataSource), bytes);
    //: CFRelease(dataSource);
    CFRelease(dataSource);

    //: for (NSUInteger i = 0; i < iterations; i++)
    for (NSUInteger i = 0; i < iterations; i++)
    {
        //perform blur
        //: vImageBoxConvolve_ARGB8888(&buffer1, &buffer2, tempBuffer, 0, 0, boxSize, boxSize, NULL, kvImageEdgeExtend);
        vImageBoxConvolve_ARGB8888(&buffer1, &buffer2, tempBuffer, 0, 0, boxSize, boxSize, NULL, kvImageEdgeExtend);

        //swap buffers
        //: void *temp = buffer1.data;
        void *temp = buffer1.data;
        //: buffer1.data = buffer2.data;
        buffer1.data = buffer2.data;
        //: buffer2.data = temp;
        buffer2.data = temp;
    }

    //free buffers
    //: free(buffer2.data);
    free(buffer2.data);
    //: free(tempBuffer);
    free(tempBuffer);

    //create image context from buffer
    //: CGContextRef ctx = CGBitmapContextCreate(buffer1.data, buffer1.width, buffer1.height,
    CGContextRef ctx = CGBitmapContextCreate(buffer1.data, buffer1.width, buffer1.height,
                                             //: 8, buffer1.rowBytes, CGImageGetColorSpace(imageRef),
                                             8, buffer1.rowBytes, CGImageGetColorSpace(imageRef),
                                             //: CGImageGetBitmapInfo(imageRef));
                                             CGImageGetBitmapInfo(imageRef));

    //apply tint
    //: if (tintColor && CGColorGetAlpha(tintColor.CGColor) > 0.0f)
    if (tintColor && CGColorGetAlpha(tintColor.CGColor) > 0.0f)
    {
        //: CGContextSetFillColorWithColor(ctx, [tintColor colorWithAlphaComponent:0.25].CGColor);
        CGContextSetFillColorWithColor(ctx, [tintColor colorWithAlphaComponent:0.25].CGColor);
        //: CGContextSetBlendMode(ctx, kCGBlendModePlusDarker);
        CGContextSetBlendMode(ctx, kCGBlendModePlusDarker);
        //: CGContextFillRect(ctx, CGRectMake(0, 0, buffer1.width, buffer1.height));
        CGContextFillRect(ctx, CGRectMake(0, 0, buffer1.width, buffer1.height));
    }

    //create image from context
    //: imageRef = CGBitmapContextCreateImage(ctx);
    imageRef = CGBitmapContextCreateImage(ctx);
    //: UIImage *image = [UIImage imageWithCGImage:imageRef scale:self.scale orientation:self.imageOrientation];
    UIImage *image = [UIImage imageWithCGImage:imageRef scale:self.scale orientation:self.imageOrientation];
    //: CGImageRelease(imageRef);
    CGImageRelease(imageRef);
    //: CGContextRelease(ctx);
    CGContextRelease(ctx);
    //: free(buffer1.data);
    free(buffer1.data);
    //: return image;
    return image;
}

//: @end
@end


//: @interface FXBlurScheduler : NSObject
@interface OfToSearch : NSObject

//: @property (nonatomic, strong) NSMutableArray *views;
@property (nonatomic, strong) NSMutableArray *views;
//: @property (nonatomic, assign) NSUInteger viewIndex;
@property (nonatomic, assign) NSUInteger viewIndex;
//: @property (nonatomic, assign) NSUInteger updatesEnabled;
@property (nonatomic, assign) NSUInteger updatesEnabled;
//: @property (nonatomic, assign) BOOL blurEnabled;
@property (nonatomic, assign) BOOL blurEnabled;
//: @property (nonatomic, assign) BOOL updating;
@property (nonatomic, assign) BOOL updating;

//: @end
@end


//: @interface FXBlurLayer: CALayer
@interface HideShouldLayer: CALayer

//: @property (nonatomic, assign) CGFloat blurRadius;
@property (nonatomic, assign) CGFloat blurRadius;

//: @end
@end


//: @implementation FXBlurLayer
@implementation HideShouldLayer

//: @dynamic blurRadius;
@dynamic blurRadius;

//: + (BOOL)needsDisplayForKey:(NSString *)key
+ (BOOL)needsDisplayForKey:(NSString *)key
{
    //: if ([@[@"blurRadius", @"bounds", @"position"] containsObject:key])
    if ([@[StringFromPlainSpareData(str_treeData), StringFromPlainSpareData(str_goalYardValue), StringFromPlainSpareData(str_nearRefugeeValue)] containsObject:key])
    {
        //: return YES;
        return YES;
    }
    //: return [super needsDisplayForKey:key];
    return [super needsDisplayForKey:key];
}

//: @end
@end


//: @interface FXBlurView ()
@interface TingPerspective ()

//: @property (nonatomic, assign) BOOL iterationsSet;
@property (nonatomic, assign) BOOL iterationsSet;
//: @property (nonatomic, assign) BOOL blurRadiusSet;
@property (nonatomic, assign) BOOL blurRadiusSet;
//: @property (nonatomic, assign) BOOL dynamicSet;
@property (nonatomic, assign) BOOL dynamicSet;
//: @property (nonatomic, assign) BOOL blurEnabledSet;
@property (nonatomic, assign) BOOL blurEnabledSet;
//: @property (nonatomic, strong) NSDate *lastUpdate;
@property (nonatomic, strong) NSDate *lastUpdate;

//: - (UIImage *)snapshotOfUnderlyingView;
- (UIImage *)ofView;
//: - (BOOL)shouldUpdate;
- (BOOL)shouldIn;

//: @end
@end


//: @implementation FXBlurScheduler
@implementation OfToSearch

//: + (instancetype)sharedInstance
+ (instancetype)at
{
    //: static FXBlurScheduler *sharedInstance = nil;
    static OfToSearch *sharedInstance = nil;
    //: if (!sharedInstance)
    if (!sharedInstance)
    {
        //: sharedInstance = [[FXBlurScheduler alloc] init];
        sharedInstance = [[OfToSearch alloc] init];
    }
    //: return sharedInstance;
    return sharedInstance;
}

//: - (instancetype)init
- (instancetype)init
{
    //: if ((self = [super init]))
    if ((self = [super init]))
    {
        //: _updatesEnabled = 1;
        _updatesEnabled = 1;
        //: _blurEnabled = YES;
        _blurEnabled = YES;
        //: _views = [[NSMutableArray alloc] init];
        _views = [[NSMutableArray alloc] init];
    }
    //: return self;
    return self;
}

//: - (void)setBlurEnabled:(BOOL)blurEnabled
- (void)setBlurEnabled:(BOOL)blurEnabled
{
    //: _blurEnabled = blurEnabled;
    _blurEnabled = blurEnabled;
    //: if (blurEnabled)
    if (blurEnabled)
    {
        //: for (FXBlurView *view in self.views)
        for (TingPerspective *view in self.views)
        {
            //: [view setNeedsDisplay];
            [view setNeedsDisplay];
        }
        //: [self updateAsynchronously];
        [self countervalAuto];
    }
}

//: - (void)setUpdatesEnabled
- (void)streetSmart
{
    //: _updatesEnabled ++;
    _updatesEnabled ++;
    //: [self updateAsynchronously];
    [self countervalAuto];
}

//: - (void)setUpdatesDisabled
- (void)touch
{
    //: _updatesEnabled --;
    _updatesEnabled --;
}

//: - (void)addView:(FXBlurView *)view
- (void)paradigmWith:(TingPerspective *)view
{
    //: if (![self.views containsObject:view])
    if (![self.views containsObject:view])
    {
        //: [self.views addObject:view];
        [self.views addObject:view];
        //: [self updateAsynchronously];
        [self countervalAuto];
    }
}

//: - (void)removeView:(FXBlurView *)view
- (void)doingMessageTeam:(TingPerspective *)view
{
    //: NSUInteger index = [self.views indexOfObject:view];
    NSUInteger index = [self.views indexOfObject:view];
    //: if (index != NSNotFound)
    if (index != NSNotFound)
    {
        //: if (index <= self.viewIndex)
        if (index <= self.viewIndex)
        {
            //: self.viewIndex --;
            self.viewIndex --;
        }
        //: [self.views removeObjectAtIndex:index];
        [self.views removeObjectAtIndex:index];
    }
}

//: - (void)updateAsynchronously
- (void)countervalAuto
{
    //: if (self.blurEnabled && !self.updating && self.updatesEnabled > 0 && [self.views count])
    if (self.blurEnabled && !self.updating && self.updatesEnabled > 0 && [self.views count])
    {
        //: NSTimeInterval timeUntilNextUpdate = 1.0 / 60;
        NSTimeInterval timeUntilNextUpdate = 1.0 / 60;

        //loop through until we find a view that's ready to be drawn
        //: self.viewIndex = self.viewIndex % [self.views count];
        self.viewIndex = self.viewIndex % [self.views count];
        //: for (NSUInteger i = self.viewIndex; i < [self.views count]; i++)
        for (NSUInteger i = self.viewIndex; i < [self.views count]; i++)
        {
            //: FXBlurView *view = self.views[i];
            TingPerspective *view = self.views[i];
            //: if (view.dynamic && !view.hidden && view.window && [view shouldUpdate])
            if (view.dynamic && !view.hidden && view.window && [view shouldIn])
            {
                //: NSTimeInterval nextUpdate = [view.lastUpdate timeIntervalSinceNow] + view.updateInterval;
                NSTimeInterval nextUpdate = [view.lastUpdate timeIntervalSinceNow] + view.updateInterval;
                //: if (!view.lastUpdate || nextUpdate <= 0)
                if (!view.lastUpdate || nextUpdate <= 0)
                {
                    //: self.updating = YES;
                    self.updating = YES;
                    //: [view updateAsynchronously:YES completion:^{
                    [view small:YES message:^{

                        //render next view
                        //: self.updating = NO;
                        self.updating = NO;
                        //: self.viewIndex = i + 1;
                        self.viewIndex = i + 1;
                        //: [self updateAsynchronously];
                        [self countervalAuto];
                    //: }];
                    }];
                    //: return;
                    return;
                }
                //: else
                else
                {
                    //: timeUntilNextUpdate = ((timeUntilNextUpdate) < (nextUpdate) ? (timeUntilNextUpdate) : (nextUpdate));
                    timeUntilNextUpdate = ((timeUntilNextUpdate) < (nextUpdate) ? (timeUntilNextUpdate) : (nextUpdate));
                }
            }
        }

        //try again, delaying until the time when the next view needs an update.
        //: self.viewIndex = 0;
        self.viewIndex = 0;
        //: [self performSelector:@selector(updateAsynchronously)
        [self performSelector:@selector(countervalAuto)
                   //: withObject:nil
                   withObject:nil
                   //: afterDelay:timeUntilNextUpdate
                   afterDelay:timeUntilNextUpdate
                      //: inModes:@[NSDefaultRunLoopMode, UITrackingRunLoopMode]];
                      inModes:@[NSDefaultRunLoopMode, UITrackingRunLoopMode]];
    }
}

//: @end
@end


//: @implementation FXBlurView
@implementation TingPerspective

//: + (void)setBlurEnabled:(BOOL)blurEnabled
+ (void)setBlurEnabled:(BOOL)blurEnabled
{
    //: [FXBlurScheduler sharedInstance].blurEnabled = blurEnabled;
    [OfToSearch at].blurEnabled = blurEnabled;
}

//: + (void)setUpdatesEnabled
+ (void)center
{
    //: [[FXBlurScheduler sharedInstance] setUpdatesEnabled];
    [[OfToSearch at] streetSmart];
}

//: + (void)setUpdatesDisabled
+ (void)alongMy
{
    //: [[FXBlurScheduler sharedInstance] setUpdatesDisabled];
    [[OfToSearch at] touch];
}

//: + (Class)layerClass
+ (Class)layerClass
{
    //: return [FXBlurLayer class];
    return [HideShouldLayer class];
}

//: - (void)setUp
- (void)screen
{
    //: if (!_iterationsSet) _iterations = 3;
    if (!_iterationsSet) _iterations = 3;
    //: if (!_blurRadiusSet) [self blurLayer].blurRadius = 40;
    if (!_blurRadiusSet) [self modeImageAt].blurRadius = 40;
    //: if (!_dynamicSet) _dynamic = YES;
    if (!_dynamicSet) _dynamic = YES;
    //: if (!_blurEnabledSet) _blurEnabled = YES;
    if (!_blurEnabledSet) _blurEnabled = YES;
    //: self.updateInterval = _updateInterval;
    self.updateInterval = _updateInterval;
    //: self.layer.magnificationFilter = @"linear"; 
    self.layer.magnificationFilter = StringFromPlainSpareData(str_innovativeContent); // kCAFilterLinear

    //: unsigned int numberOfMethods;
    unsigned int numberOfMethods;
    //: Method *methods = class_copyMethodList([UIView class], &numberOfMethods);
    Method *methods = class_copyMethodList([UIView class], &numberOfMethods);
    //: for (unsigned int i = 0; i < numberOfMethods; i++)
    for (unsigned int i = 0; i < numberOfMethods; i++)
    {
        //: Method method = methods[i];
        Method method = methods[i];
        //: SEL selector = method_getName(method);
        SEL selector = method_getName(method);
        //: if (selector == @selector(tintColor))
        if (selector == @selector(tintColor))
        {
            //: _tintColor = ((id (*)(id,SEL))method_getImplementation(method))(self, selector);
            _tintColor = ((id (*)(id,SEL))method_getImplementation(method))(self, selector);
            //: break;
            break;
        }
    }
    //: free(methods);
    free(methods);
}

//: - (id)initWithFrame:(CGRect)frame
- (id)initWithFrame:(CGRect)frame
{
    //: if ((self = [super initWithFrame:frame]))
    if ((self = [super initWithFrame:frame]))
    {
        //: [self setUp];
        [self screen];
        //: self.clipsToBounds = YES;
        self.clipsToBounds = YES;
    }
    //: return self;
    return self;
}

//: - (id)initWithCoder:(NSCoder *)aDecoder
- (id)initWithCoder:(NSCoder *)aDecoder
{
    //: if ((self = [super initWithCoder:aDecoder]))
    if ((self = [super initWithCoder:aDecoder]))
    {
        //: [self setUp];
        [self screen];
    }
    //: return self;
    return self;
}

//: - (void)dealloc
- (void)dealloc
{
    //: [[NSNotificationCenter defaultCenter] removeObserver:self];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

//: - (void)setIterations:(NSUInteger)iterations
- (void)setIterations:(NSUInteger)iterations
{
    //: _iterationsSet = YES;
    _iterationsSet = YES;
    //: _iterations = iterations;
    _iterations = iterations;
    //: [self setNeedsDisplay];
    [self setNeedsDisplay];
}

//: - (void)setBlurRadius:(CGFloat)blurRadius
- (void)setBlurRadius:(CGFloat)blurRadius
{
    //: _blurRadiusSet = YES;
    _blurRadiusSet = YES;
    //: [self blurLayer].blurRadius = blurRadius;
    [self modeImageAt].blurRadius = blurRadius;
}

//: - (CGFloat)blurRadius
- (CGFloat)blurRadius
{
    //: return [self blurLayer].blurRadius;
    return [self modeImageAt].blurRadius;
}

//: - (void)setBlurEnabled:(BOOL)blurEnabled
- (void)setBlurEnabled:(BOOL)blurEnabled
{
    //: _blurEnabledSet = YES;
    _blurEnabledSet = YES;
    //: if (_blurEnabled != blurEnabled)
    if (_blurEnabled != blurEnabled)
    {
        //: _blurEnabled = blurEnabled;
        _blurEnabled = blurEnabled;
        //: [self schedule];
        [self quickCorner];
        //: if (_blurEnabled)
        if (_blurEnabled)
        {
            //: [self setNeedsDisplay];
            [self setNeedsDisplay];
        }
    }
}

//: - (void)setDynamic:(BOOL)dynamic
- (void)setDynamic:(BOOL)dynamic
{
    //: _dynamicSet = YES;
    _dynamicSet = YES;
    //: if (_dynamic != dynamic)
    if (_dynamic != dynamic)
    {
        //: _dynamic = dynamic;
        _dynamic = dynamic;
        //: [self schedule];
        [self quickCorner];
        //: if (!dynamic)
        if (!dynamic)
        {
            //: [self setNeedsDisplay];
            [self setNeedsDisplay];
        }
    }
}

//: - (UIView *)underlyingView
- (UIView *)underlyingView
{
    //: return _underlyingView ?: self.superview;
    return _underlyingView ?: self.superview;
}

//: - (CALayer *)underlyingLayer
- (CALayer *)colorText
{
    //: return self.underlyingView.layer;
    return self.underlyingView.layer;
}

//: - (FXBlurLayer *)blurLayer
- (HideShouldLayer *)modeImageAt
{
    //: return (FXBlurLayer *)self.layer;
    return (HideShouldLayer *)self.layer;
}

//: - (FXBlurLayer *)blurPresentationLayer
- (HideShouldLayer *)dark
{
    //: FXBlurLayer *blurLayer = [self blurLayer];
    HideShouldLayer *blurLayer = [self modeImageAt];
    //: return (FXBlurLayer *)blurLayer.presentationLayer ?: blurLayer;
    return (HideShouldLayer *)blurLayer.presentationLayer ?: blurLayer;
}

//: - (void)setUpdateInterval:(NSTimeInterval)updateInterval
- (void)setUpdateInterval:(NSTimeInterval)updateInterval
{
    //: _updateInterval = updateInterval;
    _updateInterval = updateInterval;
    //: if (_updateInterval <= 0) _updateInterval = 1.0/60;
    if (_updateInterval <= 0) _updateInterval = 1.0/60;
}

//: - (void)setTintColor:(UIColor *)tintColor
- (void)setTintColor:(UIColor *)tintColor
{
    //: _tintColor = tintColor;
    _tintColor = tintColor;
    //: [self setNeedsDisplay];
    [self setNeedsDisplay];
}

//: - (void)didMoveToSuperview
- (void)didMoveToSuperview
{
    //: [super didMoveToSuperview];
    [super didMoveToSuperview];
    //: [self.layer setNeedsDisplay];
    [self.layer setNeedsDisplay];
}

//: - (void)didMoveToWindow
- (void)didMoveToWindow
{
    //: [super didMoveToWindow];
    [super didMoveToWindow];
    //: [self schedule];
    [self quickCorner];
}

//: - (void)schedule
- (void)quickCorner
{
    //: if (self.window && self.dynamic && self.blurEnabled)
    if (self.window && self.dynamic && self.blurEnabled)
    {
        //: [[FXBlurScheduler sharedInstance] addView:self];
        [[OfToSearch at] paradigmWith:self];
    }
    //: else
    else
    {
        //: [[FXBlurScheduler sharedInstance] removeView:self];
        [[OfToSearch at] doingMessageTeam:self];
    }
}

//: - (void)setNeedsDisplay
- (void)setNeedsDisplay
{
    //: [super setNeedsDisplay];
    [super setNeedsDisplay];
    //: [self.layer setNeedsDisplay];
    [self.layer setNeedsDisplay];
}

//: - (BOOL)shouldUpdate
- (BOOL)shouldIn
{
    //: __strong CALayer *underlyingLayer = [self underlyingLayer];
    __strong CALayer *underlyingLayer = [self colorText];

    //: return
    return
    //: underlyingLayer && !underlyingLayer.hidden &&
    underlyingLayer && !underlyingLayer.hidden &&
    //: self.blurEnabled && [FXBlurScheduler sharedInstance].blurEnabled &&
    self.blurEnabled && [OfToSearch at].blurEnabled &&
    //: !CGRectIsEmpty([self.layer.presentationLayer ?: self.layer bounds]) && !CGRectIsEmpty(underlyingLayer.bounds);
    !CGRectIsEmpty([self.layer.presentationLayer ?: self.layer bounds]) && !CGRectIsEmpty(underlyingLayer.bounds);
}

//: - (void)displayLayer:(__unused CALayer *)layer
- (void)displayLayer:(__unused CALayer *)layer
{
    //: [self updateAsynchronously:NO completion:NULL];
    [self small:NO message:NULL];
}

//: - (id<CAAction>)actionForLayer:(CALayer *)layer forKey:(NSString *)key
- (id<CAAction>)actionForLayer:(CALayer *)layer forKey:(NSString *)key
{
    //: if ([key isEqualToString:@"blurRadius"])
    if ([key isEqualToString:StringFromPlainSpareData(str_treeData)])
    {
        //animations are enabled
        //: CAAnimation *action = (CAAnimation *)[super actionForLayer:layer forKey:@"backgroundColor"];
        CAAnimation *action = (CAAnimation *)[super actionForLayer:layer forKey:StringFromPlainSpareData(str_minPostValue)];
        //: if ((NSNull *)action != [NSNull null])
        if ((NSNull *)action != [NSNull null])
        {
            //: CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:key];
            CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:key];
            //: animation.fromValue = [layer.presentationLayer valueForKey:key];
            animation.fromValue = [layer.presentationLayer valueForKey:key];

            //CAMediatiming attributes
            //: animation.beginTime = action.beginTime;
            animation.beginTime = action.beginTime;
            //: animation.duration = action.duration;
            animation.duration = action.duration;
            //: animation.speed = action.speed;
            animation.speed = action.speed;
            //: animation.timeOffset = action.timeOffset;
            animation.timeOffset = action.timeOffset;
            //: animation.repeatCount = action.repeatCount;
            animation.repeatCount = action.repeatCount;
            //: animation.repeatDuration = action.repeatDuration;
            animation.repeatDuration = action.repeatDuration;
            //: animation.autoreverses = action.autoreverses;
            animation.autoreverses = action.autoreverses;
            //: animation.fillMode = action.fillMode;
            animation.fillMode = action.fillMode;

            //CAAnimation attributes
            //: animation.timingFunction = action.timingFunction;
            animation.timingFunction = action.timingFunction;
            //: animation.delegate = action.delegate;
            animation.delegate = action.delegate;

            //: return animation;
            return animation;
        }
    }
    //: return [super actionForLayer:layer forKey:key];
    return [super actionForLayer:layer forKey:key];
}

//: - (UIImage *)snapshotOfUnderlyingView
- (UIImage *)ofView
{
    //: __strong FXBlurLayer *blurLayer = [self blurPresentationLayer];
    __strong HideShouldLayer *blurLayer = [self dark];
    //: __strong CALayer *underlyingLayer = [self underlyingLayer];
    __strong CALayer *underlyingLayer = [self colorText];
    //: CGRect bounds = [blurLayer convertRect:blurLayer.bounds toLayer:underlyingLayer];
    CGRect bounds = [blurLayer convertRect:blurLayer.bounds toLayer:underlyingLayer];

    //: self.lastUpdate = [NSDate date];
    self.lastUpdate = [NSDate date];
    //: CGFloat scale = 0.5;
    CGFloat scale = 0.5;
    //: if (self.iterations)
    if (self.iterations)
    {
        //: CGFloat blockSize = 12.0f/self.iterations;
        CGFloat blockSize = 12.0f/self.iterations;
        //: scale = blockSize/((blockSize * 2) > (blurLayer.blurRadius) ? (blockSize * 2) : (blurLayer.blurRadius));
        scale = blockSize/((blockSize * 2) > (blurLayer.blurRadius) ? (blockSize * 2) : (blurLayer.blurRadius));
        //: scale = 1.0f/floorf(1.0f/scale);
        scale = 1.0f/floorf(1.0f/scale);
    }
    //: CGSize size = bounds.size;
    CGSize size = bounds.size;
    //: if (self.contentMode == UIViewContentModeScaleToFill ||
    if (self.contentMode == UIViewContentModeScaleToFill ||
        //: self.contentMode == UIViewContentModeScaleAspectFill ||
        self.contentMode == UIViewContentModeScaleAspectFill ||
        //: self.contentMode == UIViewContentModeScaleAspectFit ||
        self.contentMode == UIViewContentModeScaleAspectFit ||
        //: self.contentMode == UIViewContentModeRedraw)
        self.contentMode == UIViewContentModeRedraw)
    {
        //prevents edge artefacts
        //: size.width = floorf(size.width * scale) / scale;
        size.width = floorf(size.width * scale) / scale;
        //: size.height = floorf(size.height * scale) / scale;
        size.height = floorf(size.height * scale) / scale;
    }
    //: else if ([[UIDevice currentDevice].systemVersion floatValue] < 7.0f && [UIScreen mainScreen].scale == 1.0f)
    else if ([[UIDevice currentDevice].systemVersion floatValue] < 7.0f && [UIScreen mainScreen].scale == 1.0f)
    {
        //prevents pixelation on old devices
        //: scale = 1.0f;
        scale = 1.0f;
    }
    //: UIGraphicsBeginImageContextWithOptions(size, YES, scale);
    UIGraphicsBeginImageContextWithOptions(size, YES, scale);
    //: CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextRef context = UIGraphicsGetCurrentContext();
    //: CGContextTranslateCTM(context, -bounds.origin.x, -bounds.origin.y);
    CGContextTranslateCTM(context, -bounds.origin.x, -bounds.origin.y);

    //: NSArray *hiddenViews = [self prepareUnderlyingViewForSnapshot];
    NSArray *hiddenViews = [self media];
    //: [underlyingLayer renderInContext:context];
    [underlyingLayer renderInContext:context];
    //: [self restoreSuperviewAfterSnapshot:hiddenViews];
    [self head:hiddenViews];
    //: UIImage *snapshot = UIGraphicsGetImageFromCurrentImageContext();
    UIImage *snapshot = UIGraphicsGetImageFromCurrentImageContext();
    //: UIGraphicsEndImageContext();
    UIGraphicsEndImageContext();
    //: return snapshot;
    return snapshot;
}

//: - (NSArray *)prepareUnderlyingViewForSnapshot
- (NSArray *)media
{
    //: __strong CALayer *blurlayer = [self blurLayer];
    __strong CALayer *blurlayer = [self modeImageAt];
    //: __strong CALayer *underlyingLayer = [self underlyingLayer];
    __strong CALayer *underlyingLayer = [self colorText];
    //: while (blurlayer.superlayer && blurlayer.superlayer != underlyingLayer)
    while (blurlayer.superlayer && blurlayer.superlayer != underlyingLayer)
    {
        //: blurlayer = blurlayer.superlayer;
        blurlayer = blurlayer.superlayer;
    }
    //: NSMutableArray *layers = [NSMutableArray array];
    NSMutableArray *layers = [NSMutableArray array];
    //: NSUInteger index = [underlyingLayer.sublayers indexOfObject:blurlayer];
    NSUInteger index = [underlyingLayer.sublayers indexOfObject:blurlayer];
    //: if (index != NSNotFound)
    if (index != NSNotFound)
    {
        //: for (NSUInteger i = index; i < [underlyingLayer.sublayers count]; i++)
        for (NSUInteger i = index; i < [underlyingLayer.sublayers count]; i++)
        {
            //: CALayer *layer = underlyingLayer.sublayers[i];
            CALayer *layer = underlyingLayer.sublayers[i];
            //: if (!layer.hidden)
            if (!layer.hidden)
            {
                //: layer.hidden = YES;
                layer.hidden = YES;
                //: [layers addObject:layer];
                [layers addObject:layer];
            }
        }
    }
    //: return layers;
    return layers;
}

//: - (void)restoreSuperviewAfterSnapshot:(NSArray *)hiddenLayers
- (void)head:(NSArray *)hiddenLayers
{
    //: for (CALayer *layer in hiddenLayers)
    for (CALayer *layer in hiddenLayers)
    {
        //: layer.hidden = NO;
        layer.hidden = NO;
    }
}

//: - (UIImage *)blurredSnapshot:(UIImage *)snapshot radius:(CGFloat)blurRadius
- (UIImage *)packetChild:(UIImage *)snapshot formatting:(CGFloat)blurRadius
{
    //: return [snapshot blurredImageWithRadius:blurRadius
    return [snapshot titleColor:blurRadius
                                 //: iterations:self.iterations
                                 disableUse:self.iterations
                                  //: tintColor:self.tintColor];
                                  enable:self.tintColor];
}

//: - (void)setLayerContents:(UIImage *)image
- (void)setHide:(UIImage *)image
{
    //: self.layer.contents = (id)image.CGImage;
    self.layer.contents = (id)image.CGImage;
    //: self.layer.contentsScale = image.scale;
    self.layer.contentsScale = image.scale;
}

//: - (void)updateAsynchronously:(BOOL)async completion:(void (^)())completion
- (void)small:(BOOL)async message:(void (^)())completion
{
    //: if ([self shouldUpdate])
    if ([self shouldIn])
    {
        //: UIImage *snapshot = [self snapshotOfUnderlyingView];
        UIImage *snapshot = [self ofView];
        //: if (async)
        if (async)
        {
            //: dispatch_async(dispatch_get_global_queue((-2), 0), ^{
            dispatch_async(dispatch_get_global_queue((-2), 0), ^{

                //: UIImage *blurredImage = [self blurredSnapshot:snapshot radius:self.blurRadius];
                UIImage *blurredImage = [self packetChild:snapshot formatting:self.blurRadius];
                //: dispatch_sync(dispatch_get_main_queue(), ^{
                dispatch_sync(dispatch_get_main_queue(), ^{

                    //: [self setLayerContents:blurredImage];
                    [self setHide:blurredImage];
                    //: if (completion) completion();
                    if (completion) completion();
                //: });
                });
            //: });
            });
        }
        //: else
        else
        {
            //: [self setLayerContents:[self blurredSnapshot:snapshot radius:[self blurPresentationLayer].blurRadius]];
            [self setHide:[self packetChild:snapshot formatting:[self dark].blurRadius]];
            //: if (completion) completion();
            if (completion) completion();
        }
    }
    //: else if (completion)
    else if (completion)
    {
        //: completion();
        completion();
    }
}

//: @end
@end

Byte * PlainSpareDataToCache(Byte *data) {
    int egret = data[0];
    int blackPriseMansion = data[1];
    Byte limpView = data[2];
    int agent = data[3];
    if (!egret) return data + agent;
    for (int i = agent; i < agent + blackPriseMansion; i++) {
        int value = data[i] - limpView;
        if (value < 0) {
            value += 256;
        }
        data[i] = value;
    }
    data[0] = 0;
    data[agent + blackPriseMansion] = 0;
    return data + agent;
}

NSString *StringFromPlainSpareData(Byte *data) {
    return [NSString stringWithUTF8String:(char *)PlainSpareDataToCache(data)];
}
