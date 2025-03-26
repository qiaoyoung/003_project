// __DEBUG__
// __CLOSE_PRINT__
//
//  GegenscheinViewCell.m
//  NIM
//
//  Created by chris on 15/7/8.
//  Copyright (c) 2015年 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import "NTESSearchMessageEntraceCell.h"
#import "GegenscheinViewCell.h"
//: #import "UIView+NTES.h"
#import "UIView+Status.h"

//: @interface NTESSearchMessageEntraceCell()
@interface GegenscheinViewCell()

//: @end
@end

//: @implementation NTESSearchMessageEntraceCell
@implementation GegenscheinViewCell

//: - (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    //: self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    //: if (self) {
    if (self) {
        //: self.textLabel.textColor = [UIColor blueColor];
        self.textLabel.textColor = [UIColor blueColor];
    }
    //: return self;
    return self;
}

//: - (void)refresh:(NTESSearchLocalHistoryObject *)object{
- (void)indexAcross:(PastLine *)object{
    //: self.textLabel.text = object.content;
    self.textLabel.text = object.content;
    //: [self.textLabel sizeToFit];
    [self.textLabel sizeToFit];
}



//: - (void)layoutSubviews{
- (void)layoutSubviews{
    //: [super layoutSubviews];
    [super layoutSubviews];
    //: self.textLabel.left = 20.f;
    self.textLabel.left = 20.f;
    //: self.textLabel.centerY = self.height * .5f;
    self.textLabel.centerY = self.height * .5f;
}

//: @end
@end