
#import <Foundation/Foundation.h>
typedef struct {
    Byte expectorate;
    Byte *heavyEnforce;
    unsigned int butCarve;
    bool sumerrelate;
	int satisfaction;
} AudioData;

NSString *StringFromAudioData(AudioData *data);


//: head_default
AudioData str_disabilityText = (AudioData){170, (Byte []){194, 207, 203, 206, 245, 206, 207, 204, 203, 223, 198, 222, 224}, 12, false, 54};

// __DEBUG__
// __CLOSE_PRINT__
//
//  AvatarControl.m
// Indicator
//
//  Created by chris on 15/2/10.
//  Copyright (c) 2015年 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import "BBBAvatarImageView.h"
#import "AvatarControl.h"
//: #import "UIViewNimKit.h"
#import "UIViewNimKit.h"
//: #import "objc/runtime.h"
#import "objc/runtime.h"
//: #import "UserKitDependency.h"
#import "UserKitDependency.h"
//: #import "AppleProjectKit.h"
#import "Indicator.h"
//: #import "BBBKitInfoFetchOption.h"
#import "TitleOption.h"
//: #import "CCCKitUrlManager.h"
#import "CloseData.h"

//: @interface BBBAvatarImageView()
@interface AvatarControl()

//: @property (nonatomic,strong) UIImageView *imageView;
@property (nonatomic,strong) UIImageView *imageView;

//: @end
@end

//: @implementation BBBAvatarImageView
@implementation AvatarControl

//: - (id)initWithFrame:(CGRect)frame
- (id)initWithFrame:(CGRect)frame
{
    //: self = [super initWithFrame:frame];
    self = [super initWithFrame:frame];
    //: if (self)
    if (self)
    {
        //: [self setup];
        [self find];
    }
    //: return self;
    return self;
}


//: - (id)initWithCoder:(NSCoder *)aDecoder
- (id)initWithCoder:(NSCoder *)aDecoder
{
    //: if (self = [super initWithCoder:aDecoder])
    if (self = [super initWithCoder:aDecoder])
    {
        //: [self setup];
        [self find];
    }
    //: return self;
    return self;
}

//: - (void)layoutSubviews
- (void)layoutSubviews
{
    //: [super layoutSubviews];
    [super layoutSubviews];
    //: [self setupRadius];
    [self reply];

    //: if (!__CGSizeEqualToSize(self.imageView.nim_size, self.nim_size))
    if (!__CGSizeEqualToSize(self.imageView.nim_size, self.nim_size))
    {
        //: self.imageView.nim_size = self.nim_size;
        self.imageView.nim_size = self.nim_size;
//        self.imageView.image = [self imageAddCorner:_image
//                                             radius:_cornerRadius
//                                            andSize:self.bounds.size];
        //: self.imageView.image = _image;
        self.imageView.image = _image;
    }

}

//: - (void)setup{
- (void)find{
    //: [self setupRadius];
    [self reply];
    //: _imageView = [[UIImageView alloc] initWithFrame:self.bounds];
    _imageView = [[UIImageView alloc] initWithFrame:self.bounds];
    //: _imageView.contentMode = UIViewContentModeScaleAspectFill;
    _imageView.contentMode = UIViewContentModeScaleAspectFill;
    //: _imageView.clipsToBounds = YES;
    _imageView.clipsToBounds = YES;
    //: [self addSubview:_imageView];
    [self addSubview:_imageView];
    //: _imageView.layer.masksToBounds = YES;
    _imageView.layer.masksToBounds = YES;
    //: _imageView.layer.cornerRadius = _cornerRadius;
    _imageView.layer.cornerRadius = _cornerRadius;
    //: self.backgroundColor = [UIColor clearColor];
    self.backgroundColor = [UIColor clearColor];

}


//: - (void)setupRadius{
- (void)reply{
    //: switch ([AppleProjectKit sharedKit].config.avatarType)
    switch ([Indicator reach].config.avatarType)
    {
        //: case NIMKitAvatarTypeNone:
        case NIMKitAvatarTypeNone:
            //: _cornerRadius = 0;
            _cornerRadius = 0;
            //: break;
            break;
        //: case NIMKitAvatarTypeRounded:
        case NIMKitAvatarTypeRounded:
            //: _cornerRadius = self.nim_width *.5f;
            _cornerRadius = self.nim_width *.5f;//self.nim_width *.5f;
            //: break;
            break;
        //: case NIMKitAvatarTypeRadiusCorner:
        case NIMKitAvatarTypeRadiusCorner:
            //: _cornerRadius = self.nim_width *.5f;
            _cornerRadius = self.nim_width *.5f;
            //: break;
            break;
        //: default:
        default:
            //: break;
            break;
    }
}


//: - (void)setImage:(UIImage *)image
- (void)setImage:(UIImage *)image
{
    //: if (_image != image)
    if (_image != image)
    {
        //: _image = image;
        _image = image;
//        UIImage *fixedImage  = [self imageAddCorner:_image
//                                             radius:_cornerRadius
//                                            andSize:self.bounds.size];
        //: self.imageView.image = image;
        self.imageView.image = image;
    }
}

//: - (UIImage*)imageAddCorner:(UIImage *)image radius:(CGFloat)radius andSize:(CGSize)size
- (UIImage*)select:(UIImage *)image holdfastFloat:(CGFloat)radius selected:(CGSize)size
{
    //: CGRect rect = CGRectMake(0, 0, size.width, size.height);
    CGRect rect = CGRectMake(0, 0, size.width, size.height);

    //: UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
    UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
    //: CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    //: CGPathRef path = self.path;
    CGPathRef path = self.text;
    //: CGContextAddPath(ctx,path);
    CGContextAddPath(ctx,path);
    //: CGContextClip(ctx);
    CGContextClip(ctx);
    //: [image drawInRect:rect];
    [image drawInRect:rect];
    //: CGContextDrawPath(ctx, kCGPathFillStroke);
    CGContextDrawPath(ctx, kCGPathFillStroke);
    //: UIImage * newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIImage * newImage = UIGraphicsGetImageFromCurrentImageContext();
    //: UIGraphicsEndImageContext();
    UIGraphicsEndImageContext();
    //: return newImage;
    return newImage;
}

//: - (CGPathRef)path
- (CGPathRef)text
{
    //: return [[UIBezierPath bezierPathWithRoundedRect:self.bounds
    return [[UIBezierPath bezierPathWithRoundedRect:self.bounds
                                       //: cornerRadius:self.cornerRadius] CGPath];
                                       cornerRadius:self.cornerRadius] CGPath];
}

//: - (void)setAvatarBySession:(NIMSession *)session
- (void)setMonth:(NIMSession *)session
{
    //: CCCKitInfo *info = nil;
    TitleInfo *info = nil;
    //: if (session.sessionType == NIMSessionTypeTeam) {
    if (session.sessionType == NIMSessionTypeTeam) {
        //: info = [[AppleProjectKit sharedKit] infoByTeam:session.sessionId option:nil];
        info = [[Indicator reach] text:session.sessionId byLabel:nil];
//        info.avatarImage = [UIImage grayImageWithName:@"contact_group_header" color:RGB_COLOR_String(kCommonBGColor_All)];
        //: info.avatarImage = [UIImage imageNamed:@"head_default"];
        info.avatarImage = [UIImage imageNamed:StringFromAudioData(&str_disabilityText)];
    //: } else if (session.sessionType == NIMSessionTypeSuperTeam) {
    } else if (session.sessionType == NIMSessionTypeSuperTeam) {
        //: info = [[AppleProjectKit sharedKit] infoBySuperTeam:session.sessionId option:nil];
        info = [[Indicator reach] noneShowOption:session.sessionId viewMedia:nil];
//        info.avatarImage = [UIImage grayImageWithName:@"contact_group_header" color:RGB_COLOR_String(kCommonBGColor_All)];
        //: info.avatarImage = [UIImage imageNamed:@"head_default"];
        info.avatarImage = [UIImage imageNamed:StringFromAudioData(&str_disabilityText)];
    //: } else {
    } else {
        //: BBBKitInfoFetchOption *option = [[BBBKitInfoFetchOption alloc] init];
        TitleOption *option = [[TitleOption alloc] init];
        //: option.session = session;
        option.session = session;
        //: info = [[AppleProjectKit sharedKit] infoByUser:session.sessionId option:option];
        info = [[Indicator reach] indoors:session.sessionId harvest:option];
    }
    //: [self setImageWithUrlString:info.avatarUrlString placeholderImage:info.avatarImage options:0];
    [self data:info.avatarUrlString recentVersion:info.avatarImage mentalImage:0];
}

//: - (void)setAvatarByMessage:(NIMMessage *)message
- (void)setTapOfMessage:(NIMMessage *)message
{
    //: BBBKitInfoFetchOption *option = [[BBBKitInfoFetchOption alloc] init];
    TitleOption *option = [[TitleOption alloc] init];
    //: option.message = message;
    option.message = message;
    //: NSString *from = message.from;
    NSString *from = message.from;
    //: CCCKitInfo *info = [[AppleProjectKit sharedKit] infoByUser:from option:option];
    TitleInfo *info = [[Indicator reach] indoors:from harvest:option];
    //: [self setImageWithUrlString:info.avatarUrlString placeholderImage:info.avatarImage options:0];
    [self data:info.avatarUrlString recentVersion:info.avatarImage mentalImage:0];
}

//: - (void)nim_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder {
- (void)title:(NSURL *)url sumeract:(UIImage *)placeholder {
    //: [self setImageWithUrlString:url.absoluteString placeholderImage:placeholder options:0];
    [self data:url.absoluteString recentVersion:placeholder mentalImage:0];
}

//: - (void)nim_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder options:(SDWebImageOptions)options {
- (void)ofOptions:(NSURL *)url complete:(UIImage *)placeholder image:(SDWebImageOptions)options {
    //: [self setImageWithUrlString:url.absoluteString placeholderImage:placeholder options:options];
    [self data:url.absoluteString recentVersion:placeholder mentalImage:options];
}

//: - (void)setImageWithUrlString:(NSString *)urlString placeholderImage:(UIImage *)placeholderImage options:(SDWebImageOptions)options {
- (void)data:(NSString *)urlString recentVersion:(UIImage *)placeholderImage mentalImage:(SDWebImageOptions)options {
    //: if (placeholderImage && self.image != placeholderImage) {
    if (placeholderImage && self.image != placeholderImage) {
        //: self.image = placeholderImage;
        self.image = placeholderImage;
    }
    //: if (urlString.length == 0) {
    if (urlString.length == 0) {
        //: return;
        return;
    }

    //查询
    //: __block NSURL *targetUrl = nil;
    __block NSURL *targetUrl = nil;
    //: __weak typeof(self) weakSelf = self;
    __weak typeof(self) weakSelf = self;
    //: [[CCCKitUrlManager shareManager] queryQriginalUrlWithShortUrl:urlString completion:^(NSString *originalUrl, NSError *error) {
    [[CloseData greenishManager] viewOf:urlString terminal:^(NSString *originalUrl, NSError *error) {
        //: if (urlString && !error) {
        if (urlString && !error) {
            //: targetUrl = [NSURL URLWithString:originalUrl];
            targetUrl = [NSURL URLWithString:originalUrl];
        //: } else {
        } else {
            //: targetUrl = [NSURL URLWithString:urlString];
            targetUrl = [NSURL URLWithString:urlString];
        }
        //: [weakSelf didSetImageUrl:targetUrl placeholderImage:placeholderImage options:options];
        [weakSelf pin:targetUrl cornerSet:placeholderImage size:options];
    //: }];
    }];
}

//: - (void)didSetImageUrl:(NSURL *)url placeholderImage:(UIImage *)placeholderImage options:(SDWebImageOptions)options {
- (void)pin:(NSURL *)url cornerSet:(UIImage *)placeholderImage size:(SDWebImageOptions)options {
    //: if (!url) {
    if (!url) {
        //: return;
        return;
    }
    //: __weak typeof(self) weakSelf = self;
    __weak typeof(self) weakSelf = self;
//    UIImage *fixedPlaceholderImage  = [self imageAddCorner:placeholderImage
//                                                    radius:_cornerRadius
//                                                   andSize:self.bounds.size];

    //: UIImage *fixedPlaceholderImage = placeholderImage;
    UIImage *fixedPlaceholderImage = placeholderImage;

    //: [_imageView sd_setImageWithURL:url
    [_imageView sd_setImageWithURL:url
                  //: placeholderImage:fixedPlaceholderImage
                  placeholderImage:fixedPlaceholderImage
                           //: options:SDWebImageAvoidAutoSetImage|SDWebImageDelayPlaceholder
                           options:SDWebImageAvoidAutoSetImage|SDWebImageDelayPlaceholder
                         //: completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
                         completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        //: if (image) {
        if (image) {
            //weakSelf.image = image;
            //: _imageView.image = image;
            _imageView.image = image;
            //: _image = image;
            _image = image;
        }

    //: }];
    }];


}
//: @end
@end

Byte *AudioDataToByte(AudioData *data) {
    if (data->sumerrelate) return data->heavyEnforce;
    for (int i = 0; i < data->butCarve; i++) {
        data->heavyEnforce[i] ^= data->expectorate;
    }
    data->heavyEnforce[data->butCarve] = 0;
    data->sumerrelate = true;
	if (data->butCarve >= 1) {
		data->satisfaction = data->heavyEnforce[0];
	}
    return data->heavyEnforce;
}

NSString *StringFromAudioData(AudioData *data) {
    return [NSString stringWithUTF8String:(char *)AudioDataToByte(data)];
}
