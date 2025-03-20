//
//  ZMONMyQRcodeView.m
//  NIM
//
//  Created by Yan Wang on 2024/7/27.
//  Copyright © 2024 Netease. All rights reserved.
//

#import "ZMONMyQRcodeView.h"
#import "LCQRCodeUtil.h"
#import <Photos/Photos.h>

@interface ZMONMyQRcodeView ()

@property (nonatomic,strong) UIImageView *iconImageView;
@property (nonatomic,strong) UIButton *sureBtn;
@property (nonatomic,strong) UIButton *closeBtn;
@property (nonatomic,strong) UILabel *titleLabel;

@property (nonatomic,strong) UIView *box;

@end

@implementation ZMONMyQRcodeView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
        
        [self initUI];
        
    }
    return self;
}


- (void)initUI{
    _box = [[UIView alloc]initWithFrame:CGRectMake(20, (SCREEN_HEIGHT-494)/2, SCREEN_WIDTH-40, 494)];
//    _box.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"chat_bg"]];
    _box.layer.cornerRadius = 12;
    [self addSubview:_box];
    
    UIImageView *bg = [[UIImageView alloc]initWithFrame:self.box.bounds];
    bg.image = [UIImage imageNamed:@"chat_bg"];
    [_box addSubview:bg];

    NSString *userID = [[NIMSDK sharedSDK].loginManager currentAccount];
    NIMUser *me = [[NIMSDK sharedSDK].userManager userInfo:userID];
    CCCKitInfo *info = [[AppleProjectKit sharedKit] infoByUser:userID option:nil];
    
    [_box addSubview:self.iconImageView];
    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:me.userInfo.avatarUrl] placeholderImage:info.avatarImage];
    self.iconImageView.frame = CGRectMake((SCREEN_WIDTH-40-60)/2, 24, 60, 60);
    
    [_box addSubview:self.titleLabel];
    self.titleLabel.text = me.userInfo.nickName;
    self.titleLabel.frame = CGRectMake(0, self.iconImageView.bottom+12, SCREEN_WIDTH-40, 20);

    UIView *qrView = [[UIView alloc]initWithFrame:CGRectMake((SCREEN_WIDTH-40-244)/2, self.titleLabel.bottom+20, 244, 244)];
    [_box addSubview:qrView];
    qrView.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1];
    qrView.layer.borderWidth = 1;
    qrView.layer.borderColor = [UIColor colorWithRed:236/255.0 green:236/255.0 blue:236/255.0 alpha:1].CGColor;
    qrView.layer.cornerRadius = 8;
    qrView.layer.shadowColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.0800].CGColor;
    qrView.layer.shadowOffset = CGSizeMake(0,3);
    qrView.layer.shadowOpacity = 1;
    qrView.layer.shadowRadius = 0;
    
    UIImage *qrImage = [LCQRCodeUtil createQRimageString:[[NIMSDK sharedSDK].loginManager currentAccount] sizeWidth:220 fillColor:[UIColor blackColor]];
    UIImageView *qrImageView = [[UIImageView alloc] initWithFrame:CGRectMake(12, 12, 220, 220)];
    qrImageView.image = qrImage;
    [qrView addSubview:qrImageView];
    
    UILabel *contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, qrView.bottom+10, SCREEN_WIDTH-40, 20)];
    contentLabel.font = [UIFont systemFontOfSize:12];
    contentLabel.textColor = TextColor_3;
    contentLabel.textAlignment = NSTextAlignmentCenter;
    contentLabel.text = LangKey(@"activity_qrcode_scan_me");//@"扫描二维码，加我为好友";
    [_box addSubview:contentLabel];
    
  
    
    [_box addSubview:self.closeBtn];
    self.closeBtn.frame = CGRectMake(SCREEN_WIDTH-40-32-10, 10, 32, 32);
    
    [_box addSubview:self.sureBtn];
    self.sureBtn.frame = CGRectMake((SCREEN_WIDTH-40-265)/2, 494-40-24, 265, 40);
    
}

#pragma mark -- Setter && Getter
- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:16.f];
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.numberOfLines = 1;
        _titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    }
    return _titleLabel;
}

- (UIImageView *)iconImageView {
    if (!_iconImageView) {
        _iconImageView = [[UIImageView alloc] init];
        _iconImageView.layer.masksToBounds = YES;
        _iconImageView.layer.cornerRadius = 30;
        _iconImageView.contentMode = UIViewContentModeScaleToFill;
    }
    return _iconImageView;
}

- (UIButton *)closeBtn {
    if (!_closeBtn) {
        _closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_closeBtn addTarget:self action:@selector(animationClose) forControlEvents:UIControlEventTouchUpInside];
        [_closeBtn setImage:[UIImage imageNamed:@"ic_close"] forState:UIControlStateNormal];
    }
    return _closeBtn;
}

- (UIButton *)sureBtn {
    if (!_sureBtn) {
        _sureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_sureBtn addTarget:self action:@selector(saveQcImage) forControlEvents:UIControlEventTouchUpInside];
        _sureBtn.titleLabel.font = [UIFont systemFontOfSize:16];
        [_sureBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_sureBtn setTitle:LangKey(@"activity_qrcode_save_code") forState:UIControlStateNormal];
        [_sureBtn setImage:[UIImage imageNamed:@"ic_down"] forState:UIControlStateNormal];
        [_sureBtn layoutButtonWithEdgeInsetsStyle:(MKButtonEdgeInsetsStyleLeft) imageTitleSpace:10];
        _sureBtn.backgroundColor = ThemeColor;
        _sureBtn.layer.cornerRadius = 10;
        _sureBtn.layer.shadowColor = DeepBtnColor.CGColor;
        _sureBtn.layer.shadowOffset = CGSizeMake(0,3);
        _sureBtn.layer.shadowOpacity = 1;
        _sureBtn.layer.shadowRadius = 0;
        
    }
    return _sureBtn;
}

-(void)saveQcImage{
    
    CGFloat f = [UIScreen mainScreen].scale;
    CGRect rect = CGRectMake(0, SCREEN_HEIGHT*0.1*f, SCREEN_WIDTH*f, SCREEN_HEIGHT*f);
    UIImage *image = [self takeScreenshot:rect];
    
    [[PHPhotoLibrary sharedPhotoLibrary]performChanges:^{
          [PHAssetChangeRequest creationRequestForAssetFromImage:image];
      } completionHandler:^(BOOL success, NSError * _Nullable error) {
          if (error) {
              dispatch_async(dispatch_get_main_queue(), ^{
                  NSString *failed = LangKey(@"group_info_activity_update_failed");//@"保存失败"
                  [SVProgressHUD showMessage:failed];
              });
          } else {
              NSString *success = LangKey(@"group_info_activity_update_success");//保存成功
              dispatch_async(dispatch_get_main_queue(), ^{
                  [SVProgressHUD showMessage:success];
              });
          }
      }];
}

-(UIImage *)takeScreenshot:(CGRect)rect{

    UIGraphicsBeginImageContextWithOptions(CGSizeMake(self.box.frame.size.width, self.box.frame.size.height), YES, 0);
    //设置截屏大小
    [[self.box layer] renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    CGImageRef imageRef = viewImage.CGImage;
    //CGRect rect = CGRectMake(0, 0, 300, 300);//这里可以设置想要截图的区域
    CGImageRef imageRefRect =CGImageCreateWithImageInRect(imageRef, rect);
    UIImage *sendImage = [[UIImage alloc] initWithCGImage:imageRefRect];
    CGImageRelease(imageRefRect);
    return sendImage;


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
