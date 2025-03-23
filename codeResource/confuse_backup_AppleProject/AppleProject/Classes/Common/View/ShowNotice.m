//
//  ShowNotice.m
//  天天网
//
//  Created by zhaoweibing on 14-4-25.
//  Copyright (c) 2014年 Ios. All rights reserved.
//

#import "ShowNotice.h"

@interface ShowNotice ()

@property (nonatomic, retain) UIView *viewBg;//黑色半透明背景色
@property (weak, nonatomic) UIImageView *gifView;

@end

@implementation ShowNotice

- (id)init
{
    return [self initWithFrame:CGRectZero];
}

- (id)initWithFrame:(CGRect)frame
{
    frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        self.backgroundColor = [UIColor clearColor];

        //黑色透明背景
        _viewBg = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
        _viewBg.backgroundColor = [UIColor whiteColor];
        _viewBg.center = CGPointMake(self.width/2, self.height/2);
        _viewBg.layer.masksToBounds = YES;
        _viewBg.layer.cornerRadius = 8;
        _viewBg.layer.shadowColor = [UIColor blackColor].CGColor;
        _viewBg.layer.opacity = 0.85f;
        [self addSubview:_viewBg];
        

    }
    return self;
}

- (UIImageView *)gifView
{
    if (!_gifView) {
        UIImageView *gifView = [[UIImageView alloc] init];
        [self.viewBg addSubview:_gifView = gifView];
    }
    return _gifView;
}

+ (ShowNotice *)showNoticeTo:(UIView *)view animated:(BOOL)animated 
{
    ShowNotice *notice = [[ShowNotice alloc] init];
    [view addSubview:notice];
    
        //设置即将刷新状态的动画图片
        NSMutableArray *refreshingImages = [NSMutableArray array];
        for (NSInteger i = 0; i<30; i++) {
            UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"loading_%zd",i]];
            [refreshingImages addObject:image];
        }
        
        [notice.gifView stopAnimating];
  
            notice.gifView.animationImages = refreshingImages;
            notice.gifView.animationDuration = refreshingImages.count * 0.1;
            [notice.gifView startAnimating];
        
        
        notice.gifView.frame = CGRectMake(0, 0, 100, 100);
        
    
    return notice;
}





- (void)hideNoticeAnimated:(BOOL)animated
{
    if (animated == NO) {
      
        [self removeFromSuperview];
        return ;
    }
    
    [UIView animateWithDuration:0.2f animations:^{
        self.alpha = 0;
    } completion:^(BOOL finished) {
    
        [self removeFromSuperview];
    }];
}


@end
