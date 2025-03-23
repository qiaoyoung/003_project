//
//  CCCSessionShareCardContentView.m
// AppleProjectKit
//
//  Created by 田玉龙 on 2022/8/22.
//  Copyright © 2022 NetEase. All rights reserved.
//

#import "CCCSessionShareCardContentView.h"
#import "BBBMessageModel.h"
#import "UIViewNimKit.h"
#import "BBBLoadProgressView.h"
#import "CCCKitDependency.h"
#import <YYImage/YYImage.h>
#import "AppleProjectKit.h"
#import "CCCKitDataProviderImpl.h"
#import "BBBKitInfoFetchOption.h"
#import "UIImage+AppleProjectKit.h"
#import "NSString+AppleProjectKit.h"
#import <SDWebImage/SDWebImage.h>
#import <objc/runtime.h>
#import <objc/message.h>

@interface CCCSessionShareCardContentView()

@property (nonatomic,strong) NIMUser                 *user;

@property (nonatomic,strong) UIImageView         * imageView;

@property (nonatomic,strong) UILabel             * nameLabel;
@property (nonatomic,strong) UIView              * breakLabel;
@property (nonatomic,strong) UILabel             * tagLabel;

@end

@implementation CCCSessionShareCardContentView

- (instancetype)initSessionMessageContentView{
    self = [super initSessionMessageContentView];
    if (self) {
        self.opaque = YES;
        _imageView  = [[UIImageView alloc] initWithFrame:CGRectZero];
        _imageView.backgroundColor = [UIColor whiteColor];
        _imageView.contentMode = UIViewContentModeScaleAspectFill;
        [self addSubview:_imageView];
        
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _nameLabel.textColor = [UIColor blackColor];
        [self addSubview:_nameLabel];

        _breakLabel = [[UIView alloc] initWithFrame:CGRectZero];
        _breakLabel.backgroundColor = [UIColor grayColor];
        [self addSubview:_breakLabel];

        _tagLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _tagLabel.textColor = [UIColor grayColor];
        _tagLabel.font = [UIFont systemFontOfSize:12];
        [self addSubview:_tagLabel];

    }
    return self;
}

- (void)refresh:(BBBMessageModel *)data
{
    [super refresh:data];
    _imageView.image = nil;
    NIMCustomObject * cardObject = (NIMCustomObject*)self.model.message.messageObject;
    
    NSString *userid = cardObject.message.session.sessionId;
    self.user = [[NIMSDK sharedSDK].userManager userInfo:userid];
    
    NSString *content = [cardObject.attachment encodeAttachment];
    NSData *dataaaaa = [content dataUsingEncoding:NSUTF8StringEncoding];
    if (dataaaaa) {
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:dataaaaa
                                                             options:0
                                                               error:nil];
        if ([dict isKindOfClass:[NSDictionary class]])
        {
            NSInteger type     = [[dict objectForKey:@"type"] intValue];
            NSDictionary *datatyl = [dict objectForKey:@"data"];
            if (type == 105) {
                                
                NSString *cardname = [datatyl objectForKey:CMRedPacketContent];;
                
                NSString *cardid = [datatyl stringValueForKey:CMPersonCardId defaultValue:@""];
                
                if ([[datatyl stringValueForKey:CMPersonCardtype defaultValue:kConstant_0] boolValue]) {
                    _tagLabel.text = @"群名片".nim_localized;
                    
                    NIMTeam *team = [[NIMSDK sharedSDK].teamManager teamById:cardid];
                    [_imageView sd_setImageWithURL:[NSURL URLWithString:team.avatarUrl?:@""] placeholderImage:[UIImage imageNamed:@"head_default"]];
                    _nameLabel.text = team.teamName ? : LangKey(@"group_info_activity_group_already_jiesan");
                   
                } else {
                    _tagLabel.text = @"个人名片".nim_localized;
                    @weakify(self);
                    [[NIMSDK sharedSDK].userManager fetchUserInfos:@[cardid] completion:^(NSArray<NIMUser *> * _Nullable users, NSError * _Nullable error) {
                        
                        if (users.count) {
                            @strongify(self);
                            self.user = users.firstObject;
                            [_imageView sd_setImageWithURL:[NSURL URLWithString:self.user.userInfo.avatarUrl] placeholderImage:[UIImage imageNamed:@"head_default"]];
                            _nameLabel.text = self.user.userInfo.nickName ? : cardname;
                        }
                    }];
                    
                }
            }
        }
    }
 
}

- (void)layoutSubviews{
    [super layoutSubviews];
    UIEdgeInsets contentInsets = self.model.contentViewInsets;
    CGFloat tableViewWidth = self.superview.nim_width;
    CGSize contentSize = [self.model contentSize:tableViewWidth];
    CGRect imageViewFrame = CGRectMake(contentInsets.left, contentInsets.top, 50, 50);
    self.imageView.frame  = imageViewFrame;
    
    CALayer *maskLayer = [CALayer layer];
    maskLayer.cornerRadius = 13.0;
    maskLayer.backgroundColor = [UIColor blackColor].CGColor;
    maskLayer.frame = self.imageView.bounds;
    self.imageView.layer.mask = maskLayer;
    
    self.nameLabel.frame = CGRectMake(contentInsets.left + 60, contentInsets.top + 16, 150, 20);
    
    self.tagLabel.frame = CGRectMake(contentInsets.left, contentInsets.top + 60 + 15, 200, 10);
    
    self.breakLabel.frame = CGRectMake(contentInsets.left, contentInsets.top + 60, contentSize.width, 0.5);
}


- (void)onTouchUpInside:(id)sender
{
    BBBKitEvent *event = [[BBBKitEvent alloc] init];
    event.eventName = BBBKitEventNameTapContent;
    event.messageModel = self.model;
    [self.delegate onCatchEvent:event];
}

@end
