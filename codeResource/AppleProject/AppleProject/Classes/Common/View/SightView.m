
#import <Foundation/Foundation.h>
typedef struct {
    Byte suraEdge;
    Byte *obstacle;
    unsigned int revVend;
    bool federal;
	int hesitateCell;
} GhostTownData;

NSString *StringFromGhostTownData(GhostTownData *data);


//: loading_%zd
GhostTownData str_missingShowData = (GhostTownData){29, (Byte []){113, 114, 124, 121, 116, 115, 122, 66, 56, 103, 121, 151}, 11, false, 44};

// __DEBUG__
// __CLOSE_PRINT__
//
//  SightView.m
//  NIM
//
//  Created by Yan Wang on 2024/8/10.
//  Copyright © 2024 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import "ZMONCustomLoadingView.h"
#import "SightView.h"

//: @interface ZMONCustomLoadingView ()
@interface SightView ()

//: @property (nonatomic, strong) UIView *viewBg;
@property (nonatomic, strong) UIView *viewBg;
//: @property (strong, nonatomic) UIImageView *gifView;
@property (strong, nonatomic) UIImageView *gifView;

//: @end
@end

//: @implementation ZMONCustomLoadingView
@implementation SightView

//: - (instancetype)initWithFrame:(CGRect)frame
- (instancetype)initWithFrame:(CGRect)frame
{
    //: self = [super initWithFrame:frame];
    self = [super initWithFrame:frame];
    //: if (self) {
    if (self) {
//        self.backgroundColor = [UIColor clearColor];
        //: self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
//        UITapGestureRecognizer *singleTapclose = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(animationClose)];
//        [self addGestureRecognizer:singleTapclose];

        //: [self initUI];
        [self initTo];

    }
    //: return self;
    return self;
}


//: - (void)initUI{
- (void)initTo{

    //: _viewBg = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 120, 120)];
    _viewBg = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 120, 120)];
    //: _viewBg.backgroundColor = [UIColor whiteColor];
    _viewBg.backgroundColor = [UIColor whiteColor];
    //: _viewBg.center = CGPointMake(self.width/2, self.height/2);
    _viewBg.center = CGPointMake(self.width/2, self.height/2);
    //: _viewBg.layer.masksToBounds = YES;
    _viewBg.layer.masksToBounds = YES;
    //: _viewBg.layer.cornerRadius = 8;
    _viewBg.layer.cornerRadius = 8;
    //: [self addSubview:_viewBg];
    [self addSubview:_viewBg];

    //: [self.viewBg addSubview:self.gifView];
    [self.viewBg addSubview:self.gifView];
    //: self.gifView.frame = CGRectMake(10, 10, 100, 100);
    self.gifView.frame = CGRectMake(10, 10, 100, 100);
    //: NSMutableArray *refreshingImages = [NSMutableArray array];
    NSMutableArray *refreshingImages = [NSMutableArray array];
    //: for (NSInteger i = 0; i<30; i++) {
    for (NSInteger i = 0; i<30; i++) {
        //: UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"loading_%zd",i]];
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:StringFromGhostTownData(&str_missingShowData),i]];
        //: [refreshingImages addObject:image];
        [refreshingImages addObject:image];
    }
    //: [self.gifView stopAnimating];
    [self.gifView stopAnimating];
    //: self.gifView.animationImages = refreshingImages;
    self.gifView.animationImages = refreshingImages;
    //: self.gifView.animationDuration = refreshingImages.count * 0.1;
    self.gifView.animationDuration = refreshingImages.count * 0.1;
    //: [self.gifView startAnimating];
    [self.gifView startAnimating];

}

//: - (UIImageView *)gifView
- (UIImageView *)gifView
{
    //: if (!_gifView) {
    if (!_gifView) {
       //: _gifView = [[UIImageView alloc] init];
       _gifView = [[UIImageView alloc] init];
    }
    //: return _gifView;
    return _gifView;
}

//: - (void)animationClose
- (void)iconEnable
{
    //: self.hidden = YES;
    self.hidden = YES;
}

//: - (void)animationShow
- (void)brand
{
    //: self.hidden = NO;
    self.hidden = NO;
}

//: @end
@end

Byte *GhostTownDataToByte(GhostTownData *data) {
    if (data->federal) return data->obstacle;
    for (int i = 0; i < data->revVend; i++) {
        data->obstacle[i] ^= data->suraEdge;
    }
    data->obstacle[data->revVend] = 0;
    data->federal = true;
	if (data->revVend >= 1) {
		data->hesitateCell = data->obstacle[0];
	}
    return data->obstacle;
}

NSString *StringFromGhostTownData(GhostTownData *data) {
    return [NSString stringWithUTF8String:(char *)GhostTownDataToByte(data)];
}
