
#import <Foundation/Foundation.h>

NSString *StringFromBackgroundData(Byte *data);


//: GIF
Byte str_withKickValue[] = {67, 3, 4, 95, 70, 73, 71, 76};


//: MMVideoPreviewPlay
Byte str_ambleMessageData[] = {97, 18, 13, 90, 10, 84, 110, 235, 176, 106, 207, 174, 188, 121, 97, 108, 80, 119, 101, 105, 118, 101, 114, 80, 111, 101, 100, 105, 86, 77, 77, 105};


//: photo_delete
Byte str_ambleName[] = {86, 12, 6, 67, 216, 191, 101, 116, 101, 108, 101, 100, 95, 111, 116, 111, 104, 112, 207};


//: filename
Byte str_curiousAttractName[] = {73, 8, 13, 52, 225, 26, 63, 227, 18, 5, 66, 45, 194, 101, 109, 97, 110, 101, 108, 105, 102, 43};

// __DEBUG__
// __CLOSE_PRINT__
//
//  TextReusableView.m
//  TZImagePickerController
//
//  Created by 谭真 on 16/1/3.
//  Copyright © 2016年 谭真. All rights reserved.
//

// __M_A_C_R_O__
//: #import "TZTestCell.h"
#import "TextReusableView.h"
//: #import "UIView+TZLayout.h"
#import "UIView+TZLayout.h"
//: #import <Photos/Photos.h>
#import <Photos/Photos.h>
//: #import "TZImagePickerController.h"
#import "TZImagePickerController.h"

//: @implementation TZTestCell
@implementation TextReusableView

//: - (instancetype)initWithFrame:(CGRect)frame {
- (instancetype)initWithFrame:(CGRect)frame {
    //: self = [super initWithFrame:frame];
    self = [super initWithFrame:frame];
    //: if (self) {
    if (self) {
        //: self.backgroundColor = [UIColor whiteColor];
        self.backgroundColor = [UIColor whiteColor];
        //: _imageView = [[UIImageView alloc] init];
        _imageView = [[UIImageView alloc] init];
        //: _imageView.backgroundColor = [UIColor colorWithWhite:1.000 alpha:0.500];
        _imageView.backgroundColor = [UIColor colorWithWhite:1.000 alpha:0.500];
        //: _imageView.contentMode = UIViewContentModeScaleAspectFit;
        _imageView.contentMode = UIViewContentModeScaleAspectFit;
        //: [self addSubview:_imageView];
        [self addSubview:_imageView];
        //: self.clipsToBounds = YES;
        self.clipsToBounds = YES;

        //: _videoImageView = [[UIImageView alloc] init];
        _videoImageView = [[UIImageView alloc] init];
        //: _videoImageView.image = [UIImage tz_imageNamedFromMyBundle:@"MMVideoPreviewPlay"];
        _videoImageView.image = [UIImage tz_imageNamedFromMyBundle:StringFromBackgroundData(str_ambleMessageData)];
        //: _videoImageView.contentMode = UIViewContentModeScaleAspectFill;
        _videoImageView.contentMode = UIViewContentModeScaleAspectFill;
        //: _videoImageView.hidden = YES;
        _videoImageView.hidden = YES;
        //: [self addSubview:_videoImageView];
        [self addSubview:_videoImageView];

        //: _deleteBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _deleteBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        //: [_deleteBtn setImage:[UIImage imageNamed:@"photo_delete"] forState:UIControlStateNormal];
        [_deleteBtn setImage:[UIImage imageNamed:StringFromBackgroundData(str_ambleName)] forState:UIControlStateNormal];
        //: _deleteBtn.imageEdgeInsets = UIEdgeInsetsMake(-10, 0, 0, -10);
        _deleteBtn.imageEdgeInsets = UIEdgeInsetsMake(-10, 0, 0, -10);
        //: _deleteBtn.alpha = 0.6;
        _deleteBtn.alpha = 0.6;
        //: [self addSubview:_deleteBtn];
        [self addSubview:_deleteBtn];

        //: _gifLable = [[UILabel alloc] init];
        _gifLable = [[UILabel alloc] init];
        //: _gifLable.text = @"GIF";
        _gifLable.text = StringFromBackgroundData(str_withKickValue);
        //: _gifLable.textColor = [UIColor whiteColor];
        _gifLable.textColor = [UIColor whiteColor];
        //: _gifLable.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.8];
        _gifLable.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.8];
        //: _gifLable.textAlignment = NSTextAlignmentCenter;
        _gifLable.textAlignment = NSTextAlignmentCenter;
        //: _gifLable.font = [UIFont systemFontOfSize:10];
        _gifLable.font = [UIFont systemFontOfSize:10];
        //: [self addSubview:_gifLable];
        [self addSubview:_gifLable];
    }
    //: return self;
    return self;
}

//: - (void)layoutSubviews {
- (void)layoutSubviews {
    //: [super layoutSubviews];
    [super layoutSubviews];
    //: _imageView.frame = self.bounds;
    _imageView.frame = self.bounds;
    //: _gifLable.frame = CGRectMake(self.tz_width - 25, self.tz_height - 14, 25, 14);
    _gifLable.frame = CGRectMake(self.tz_width - 25, self.tz_height - 14, 25, 14);
    //: _deleteBtn.frame = CGRectMake(self.tz_width - 36, 0, 36, 36);
    _deleteBtn.frame = CGRectMake(self.tz_width - 36, 0, 36, 36);
    //: CGFloat width = self.tz_width / 3.0;
    CGFloat width = self.tz_width / 3.0;
    //: _videoImageView.frame = CGRectMake(width, width, width, width);
    _videoImageView.frame = CGRectMake(width, width, width, width);
}

//: - (void)setAsset:(PHAsset *)asset {
- (void)setAsset:(PHAsset *)asset {
    //: _asset = asset;
    _asset = asset;
    //: _videoImageView.hidden = asset.mediaType != PHAssetMediaTypeVideo;
    _videoImageView.hidden = asset.mediaType != PHAssetMediaTypeVideo;
    //: _gifLable.hidden = ![[asset valueForKey:@"filename"] containsString:@"GIF"];
    _gifLable.hidden = ![[asset valueForKey:StringFromBackgroundData(str_curiousAttractName)] containsString:StringFromBackgroundData(str_withKickValue)];
}

//: - (void)setRow:(NSInteger)row {
- (void)setRow:(NSInteger)row {
    //: _row = row;
    _row = row;
    //: _deleteBtn.tag = row;
    _deleteBtn.tag = row;
}

//: - (UIView *)snapshotView {
- (UIView *)broadcast {
    //: UIView *snapshotView = [[UIView alloc]init];
    UIView *snapshotView = [[UIView alloc]init];

    //: UIView *cellSnapshotView = nil;
    UIView *cellSnapshotView = nil;

    //: if ([self respondsToSelector:@selector(snapshotViewAfterScreenUpdates:)]) {
    if ([self respondsToSelector:@selector(snapshotViewAfterScreenUpdates:)]) {
        //: cellSnapshotView = [self snapshotViewAfterScreenUpdates:NO];
        cellSnapshotView = [self snapshotViewAfterScreenUpdates:NO];
    //: } else {
    } else {
        //: CGSize size = CGSizeMake(self.bounds.size.width + 20, self.bounds.size.height + 20);
        CGSize size = CGSizeMake(self.bounds.size.width + 20, self.bounds.size.height + 20);
        //: UIGraphicsBeginImageContextWithOptions(size, self.opaque, 0);
        UIGraphicsBeginImageContextWithOptions(size, self.opaque, 0);
        //: [self.layer renderInContext:UIGraphicsGetCurrentContext()];
        [self.layer renderInContext:UIGraphicsGetCurrentContext()];
        //: UIImage * cellSnapshotImage = UIGraphicsGetImageFromCurrentImageContext();
        UIImage * cellSnapshotImage = UIGraphicsGetImageFromCurrentImageContext();
        //: UIGraphicsEndImageContext();
        UIGraphicsEndImageContext();
        //: cellSnapshotView = [[UIImageView alloc] initWithImage:cellSnapshotImage];
        cellSnapshotView = [[UIImageView alloc] initWithImage:cellSnapshotImage];
    }

    //: snapshotView.frame = CGRectMake(0, 0, cellSnapshotView.frame.size.width, cellSnapshotView.frame.size.height);
    snapshotView.frame = CGRectMake(0, 0, cellSnapshotView.frame.size.width, cellSnapshotView.frame.size.height);
    //: cellSnapshotView.frame = CGRectMake(0, 0, cellSnapshotView.frame.size.width, cellSnapshotView.frame.size.height);
    cellSnapshotView.frame = CGRectMake(0, 0, cellSnapshotView.frame.size.width, cellSnapshotView.frame.size.height);

    //: [snapshotView addSubview:cellSnapshotView];
    [snapshotView addSubview:cellSnapshotView];
    //: return snapshotView;
    return snapshotView;
}

//: @end
@end

Byte * BackgroundDataToCache(Byte *data) {
    int frequently = data[0];
    int halfBrother = data[1];
    int questionStatus = data[2];
    if (!frequently) return data + questionStatus;
    for (int i = 0; i < halfBrother / 2; i++) {
        int begin = questionStatus + i;
        int end = questionStatus + halfBrother - i - 1;
        Byte temp = data[begin];
        data[begin] = data[end];
        data[end] = temp;
    }
    data[0] = 0;
    data[questionStatus + halfBrother] = 0;
    return data + questionStatus;
}

NSString *StringFromBackgroundData(Byte *data) {
    return [NSString stringWithUTF8String:(char *)BackgroundDataToCache(data)];
}  
