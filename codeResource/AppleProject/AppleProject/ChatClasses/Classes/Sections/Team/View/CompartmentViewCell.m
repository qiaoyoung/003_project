
#import <Foundation/Foundation.h>

NSString *StringFromCombineEyeData(Byte *data);


//: #2BBCFB
Byte str_takeValue[] = {99, 7, 13, 134, 253, 180, 90, 11, 35, 54, 206, 182, 238, 66, 70, 67, 66, 66, 50, 35, 218};

// __DEBUG__
// __CLOSE_PRINT__
//
//  NTESTeamSwitchTableViewCell.m
//  NIM
//
//  Created by amao on 5/29/15.
//  Copyright (c) 2015 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import "BBBTeamSwitchTableViewCell.h"
#import "CompartmentViewCell.h"
//: #import "UIViewNimKit.h"
#import "UIViewNimKit.h"

//: @implementation BBBTeamSwitchTableViewCell
@implementation CompartmentViewCell

//: - (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    //: self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    //: if (self) {
    if (self) {
        //: _switcher = [[UISwitch alloc] initWithFrame:CGRectZero];
        _switcher = [[UISwitch alloc] initWithFrame:CGRectZero];
        //: _switcher.onTintColor = [UIColor colorWithHexString:@"#2BBCFB"];
        _switcher.onTintColor = [UIColor direction:StringFromCombineEyeData(str_takeValue)];
        //: [_switcher addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventValueChanged];
        [_switcher addTarget:self action:@selector(metronymicing:) forControlEvents:UIControlEventValueChanged];
        //: [self.contentView addSubview:_switcher];
        [self.contentView addSubview:_switcher];
    }
    //: return self;
    return self;
}

//: - (void)valueChanged:(id)sender {
- (void)metronymicing:(id)sender {
    //: if (_switchDelegate && [_switchDelegate respondsToSelector:@selector(cell:onStateChanged:)])
    if (_switchDelegate && [_switchDelegate respondsToSelector:@selector(bubble:pressedTeam:)])
    {
        //: [_switchDelegate cell:self onStateChanged:_switcher.isOn];
        [_switchDelegate bubble:self pressedTeam:_switcher.isOn];
    }
}


//: - (void)layoutSubviews{
- (void)layoutSubviews{
    //: [super layoutSubviews];
    [super layoutSubviews];
    //: CGFloat right = 20.f;
    CGFloat right = 20.f;
    //: self.switcher.nim_right = self.nim_width - right;
    self.switcher.nim_right = self.nim_width - right;
    //: self.switcher.nim_centerY = self.nim_height * .5;
    self.switcher.nim_centerY = self.nim_height * .5;
}


//: @end
@end

Byte * CombineEyeDataToCache(Byte *data) {
    int battery = data[0];
    int snow = data[1];
    int disability = data[2];
    if (!battery) return data + disability;
    for (int i = 0; i < snow / 2; i++) {
        int begin = disability + i;
        int end = disability + snow - i - 1;
        Byte temp = data[begin];
        data[begin] = data[end];
        data[end] = temp;
    }
    data[0] = 0;
    data[disability + snow] = 0;
    return data + disability;
}

NSString *StringFromCombineEyeData(Byte *data) {
    return [NSString stringWithUTF8String:(char *)CombineEyeDataToCache(data)];
}  
