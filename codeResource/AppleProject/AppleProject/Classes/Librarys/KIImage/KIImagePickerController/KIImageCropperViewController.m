//
//  KIImageCropperViewController.m
//  ChineseTastes
//
//  Created by 刘 波 on 13-7-8.
//  Copyright (c) 2013年 beartech. All rights reserved.
//

#import "KIImageCropperViewController.h"

@interface KIImageCropperViewController ()

@end

@implementation KIImageCropperViewController

- (id)initWithImage:(UIImage *)image cropSize:(CGSize)cropSize {
    if (self = [super init]) {
        _image = image;
        _cropSize = cropSize;
    }
    return self;
}

- (void)loadView {
    [super loadView];
    _imageCropperView = [[KIImageCropperView alloc] initWithFrame:CGRectMake(0,
                                                                             0,
                                                                             CGRectGetWidth(self.view.bounds),
                                                                             CGRectGetHeight(self.view.bounds))];
    [_imageCropperView setCropSize:_cropSize];
    [self.view setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.6]];
    [self.view addSubview:_imageCropperView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    
    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"裁切".nim_localized
                                                                           style:UIBarButtonItemStylePlain
                                                                          target:self
                                                                          action:@selector(croppedImage)];
    self.navigationItem.rightBarButtonItem = rightBarButtonItem;
    rightBarButtonItem.tintColor = [UIColor whiteColor];
    
    [self setNavLeftItem:@selector(left) image:[UIImage imageNamed:@"back_white"] imageH:nil];
}

- (void)left {
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [_imageCropperView setImage:_image];
    [_imageCropperView setFrame:CGRectMake(0,
                                           0,
                                           CGRectGetWidth(self.view.bounds),
                                           CGRectGetHeight(self.view.bounds))];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    
    
    
}

- (void)setCroppedImage:(void(^)(UIImage *image))block {
    if (_croppedImage != block) {
        _croppedImage = [block copy];
    }
}

- (void)croppedImage {
    [self.navigationController dismissViewControllerAnimated:NO completion:nil];
    if (_croppedImage != nil) {
        _croppedImage(_imageCropperView.croppedImage);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
