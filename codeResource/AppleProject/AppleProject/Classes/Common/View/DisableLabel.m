
#import <Foundation/Foundation.h>
typedef struct {
    Byte blocCombine;
    Byte *sweet;
    unsigned int possibly;
    bool changeSlat;
	int biologicalRaw;
	int arteriaCiliaris;
} TuckBasketballData;

NSString *StringFromTuckBasketballData(TuckBasketballData *data);


//: Menlo
TuckBasketballData str_sculptBrotherContent = (TuckBasketballData){54, (Byte []){123, 83, 88, 90, 89, 69}, 5, false, 77, 38};


//: %d FPS
TuckBasketballData str_joinText = (TuckBasketballData){248, (Byte []){221, 156, 216, 190, 168, 171, 201}, 6, false, 48, 197};

// __DEBUG__
// __CLOSE_PRINT__
//
//  DisableLabel.m
//  NIM
//
//  Created by chris on 15/11/16.
//  Copyright © 2015年 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import "NTESFPSLabel.h"
#import "DisableLabel.h"

//: @implementation NTESFPSLabel{
@implementation DisableLabel{
    //: CADisplayLink *_link;
    CADisplayLink *_link;
    //: NSUInteger _count;
    NSUInteger _count;
    //: NSTimeInterval _lastTime;
    NSTimeInterval _lastTime;
    //: UIFont *_font;
    UIFont *_font;
}


//: - (instancetype)initWithFrame:(CGRect)frame {
- (instancetype)initWithFrame:(CGRect)frame {
    //: if (frame.size.width == 0 && frame.size.height == 0) {
    if (frame.size.width == 0 && frame.size.height == 0) {
        //: frame.size = CGSizeMake(70, 20);
        frame.size = CGSizeMake(70, 20);
    }
    //: self = [super initWithFrame:frame];
    self = [super initWithFrame:frame];

    //: self.textAlignment = NSTextAlignmentCenter;
    self.textAlignment = NSTextAlignmentCenter;
    //: self.userInteractionEnabled = NO;
    self.userInteractionEnabled = NO;
    //: self.backgroundColor = [UIColor clearColor];
    self.backgroundColor = [UIColor clearColor];

    //: _font = [UIFont fontWithName:@"Menlo" size:13];
    _font = [UIFont fontWithName:StringFromTuckBasketballData(&str_sculptBrotherContent) size:13];
    //: _link = [CADisplayLink displayLinkWithTarget:self selector:@selector(tick:)];
    _link = [CADisplayLink displayLinkWithTarget:self selector:@selector(sumeracted:)];
    //: [_link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
    [_link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
    //: return self;
    return self;
}

//: - (void)invalidate
- (void)object
{
    //: [_link invalidate];
    [_link invalidate];
}

//: - (CGSize)sizeThatFits:(CGSize)size {
- (CGSize)sizeThatFits:(CGSize)size {
    //: return CGSizeMake(70, 20);;
    return CGSizeMake(70, 20);;
}

//: - (void)tick:(CADisplayLink *)link {
- (void)sumeracted:(CADisplayLink *)link {
    //: if (_lastTime == 0) {
    if (_lastTime == 0) {
        //: _lastTime = link.timestamp;
        _lastTime = link.timestamp;
        //: return;
        return;
    }

    //: _count++;
    _count++;
    //: NSTimeInterval delta = link.timestamp - _lastTime;
    NSTimeInterval delta = link.timestamp - _lastTime;
    //: if (delta < 1) return;
    if (delta < 1) return;
    //: _lastTime = link.timestamp;
    _lastTime = link.timestamp;
    //: float fps = _count / delta;
    float fps = _count / delta;
    //: _count = 0;
    _count = 0;


    //: self.text = [NSString stringWithFormat:@"%d FPS",(int)round(fps)];
    self.text = [NSString stringWithFormat:StringFromTuckBasketballData(&str_joinText),(int)round(fps)];
}

//: @end
@end

Byte *TuckBasketballDataToByte(TuckBasketballData *data) {
    if (data->changeSlat) return data->sweet;
    for (int i = 0; i < data->possibly; i++) {
        data->sweet[i] ^= data->blocCombine;
    }
    data->sweet[data->possibly] = 0;
    data->changeSlat = true;
	if (data->possibly >= 2) {
		data->biologicalRaw = data->sweet[0];
		data->arteriaCiliaris = data->sweet[1];
	}
    return data->sweet;
}

NSString *StringFromTuckBasketballData(TuckBasketballData *data) {
    return [NSString stringWithUTF8String:(char *)TuckBasketballDataToByte(data)];
}
