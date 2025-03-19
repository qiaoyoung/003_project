//
//  AAAInputEmoticonButton.m
// AppleProjectKit
//
//  Created by chris.
//  Copyright (c) 2015年 NetEase. All rights reserved.
//

#import "AAAInputEmoticonButton.h"
#import "UIImage+AppleProjectKit.h"
#import "AAAInputEmoticonManager.h"
#import "CCCInputEmoticonDefine.h"
#import "AppleProjectKit.h"
#import "AAAKitDevice.h"
#import "NSBundle+AppleProjectKit.h"
#import "SSZipArchiveManager.h"

@implementation AAAInputEmoticonButton

+ (AAAInputEmoticonButton*)iconButtonWithData:(NIMInputEmoticon*)data catalogID:(NSString*)catalogID delegate:( id<NIMEmoticonButtonTouchDelegate>)delegate{
    AAAInputEmoticonButton* icon = [[AAAInputEmoticonButton alloc] init];
    [icon addTarget:icon action:@selector(onIconSelected:) forControlEvents:UIControlEventTouchUpInside];
    
    
    icon.emoticonData    = data;
    icon.catalogID              = catalogID;
    icon.userInteractionEnabled = YES;
    icon.exclusiveTouch         = YES;
    icon.contentMode            = UIViewContentModeScaleToFill;
    icon.delegate               = delegate;
    
    switch (data.type) {
        case NIMEmoticonTypeUnicode:
        {
            [icon setTitle:data.unicode forState:UIControlStateNormal];
            [icon setTitle:data.unicode forState:UIControlStateHighlighted];
            icon.titleLabel.font = [UIFont systemFontOfSize:32];
            break;
        }
        case NIMEmoticonTypeGif:
        {
//            NSBundle *bundle = [AppleProjectKit sharedKit].emoticonBundle;
//            NSData *imageData = [NSData dataWithContentsOfFile:[bundle pathForResource:data.filename ofType:nil inDirectory:NEEKIT_EmojiPath]];
            NSString *emojiPath = [[SSZipArchiveManager sharedManager] getEmojiPath];
            NSString *imagePath = [emojiPath stringByAppendingPathComponent:data.filename];
            NSData *imageData = [NSData dataWithContentsOfFile:imagePath];
            UIImage *gif = [UIImage sd_imageWithGIFData:imageData];
            [icon setImage:gif forState:UIControlStateNormal];
            [icon setImage:gif forState:UIControlStateHighlighted];
            
            break;
        }
        case NIMEmoticonTypeFile:
        default:
        {
            UIImage *image = [UIImage nim_emoticonInKit:data.filename];
            [icon setImage:image forState:UIControlStateNormal];
            [icon setImage:image forState:UIControlStateHighlighted];
            break;
        }
    }
    return icon;
}



- (void)onIconSelected:(id)sender
{
    if ([self.delegate respondsToSelector:@selector(selectedEmoticon:catalogID:)])
    {
        [self.delegate selectedEmoticon:self.emoticonData catalogID:self.catalogID];
    }
}

@end
