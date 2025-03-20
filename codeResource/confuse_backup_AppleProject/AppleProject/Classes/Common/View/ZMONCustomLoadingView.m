//
//  ZMONCustomLoadingView.m
//  NIM
//
//  Created by Yan Wang on 2024/8/10.
//  Copyright © 2024 Netease. All rights reserved.
//

#import "ZMONCustomLoadingView.h"

@interface ZMONCustomLoadingView ()

@property (nonatomic, strong) UIView *viewBg;
@property (strong, nonatomic) UIImageView *gifView;

@end

@implementation ZMONCustomLoadingView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
//        self.backgroundColor = [UIColor clearColor];
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
//        UITapGestureRecognizer *singleTapclose = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(animationClose)];
//        [self addGestureRecognizer:singleTapclose];
        
        [self initUI];
        
    }
    return self;
}


- (void)initUI{
    
    _viewBg = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 120, 120)];
    _viewBg.backgroundColor = [UIColor whiteColor];
    _viewBg.center = CGPointMake(self.width/2, self.height/2);
    _viewBg.layer.masksToBounds = YES;
    _viewBg.layer.cornerRadius = 8;
    [self addSubview:_viewBg];
    
    [self.viewBg addSubview:self.gifView];
    self.gifView.frame = CGRectMake(10, 10, 100, 100);
    NSMutableArray *refreshingImages = [NSMutableArray array];
    for (NSInteger i = 0; i<30; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"loading_%zd",i]];
        [refreshingImages addObject:image];
    }
    [self.gifView stopAnimating];
    self.gifView.animationImages = refreshingImages;
    self.gifView.animationDuration = refreshingImages.count * 0.1;
    [self.gifView startAnimating];
 
}

- (UIImageView *)gifView
{
    if (!_gifView) {
       _gifView = [[UIImageView alloc] init];
    }
    return _gifView;
}

- (void)animationClose
{
    self.hidden = YES;
}

- (void)animationShow
{
    self.hidden = NO;
}

@end
