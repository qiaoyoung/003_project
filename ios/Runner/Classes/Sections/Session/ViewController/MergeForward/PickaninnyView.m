// __DEBUG__
// __CLOSE_PRINT__
//
//  PickaninnyView.m
//  NIM
//
//  Created by Netease on 2019/10/15.
//  Copyright © 2019 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import "NTESMulSelectFunctionBar.h"
#import "PickaninnyView.h"

//: @implementation NTESMulSelectFunctionBar
@implementation PickaninnyView

//: - (instancetype)initWithFrame:(CGRect)frame {
- (instancetype)initWithFrame:(CGRect)frame {
    //: if (self = [super initWithFrame:frame]) {
    if (self = [super initWithFrame:frame]) {
        //: self.backgroundColor = [UIColor whiteColor];
        self.backgroundColor = [UIColor whiteColor];
        //: [self addSubview:self.sureBtn];
        [self addSubview:self.sureBtn];
        //: [self addSubview:self.deleteButton];
        [self addSubview:self.deleteButton];
    }
    //: return self;
    return self;
}

//: - (void)layoutSubviews {
- (void)layoutSubviews {
    //: [super layoutSubviews];
    [super layoutSubviews];
     //: _sureBtn.frame = CGRectMake(0, 0, self.frame.size.height, 64.0);
     _sureBtn.frame = CGRectMake(0, 0, self.frame.size.height, 64.0);
    //: _deleteButton.frame = CGRectMake(CGRectGetMaxX(_sureBtn.frame), 0, self.frame.size.height, 64.0);
    _deleteButton.frame = CGRectMake(CGRectGetMaxX(_sureBtn.frame), 0, self.frame.size.height, 64.0);
}

//: - (UIButton *)sureBtn {
- (UIButton *)sureBtn {
    //: if (!_sureBtn) {
    if (!_sureBtn) {
        //: _sureBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        _sureBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        //: _sureBtn.titleLabel.font = [UIFont systemFontOfSize:13.0];
        _sureBtn.titleLabel.font = [UIFont systemFontOfSize:13.0];
        //: [_sureBtn setTitle:@"发送".ntes_localized forState:UIControlStateNormal];
        [_sureBtn setTitle:@"发送".language forState:UIControlStateNormal];
    }
    //: return _sureBtn;
    return _sureBtn;
}

//: - (UIButton *)deleteButton
- (UIButton *)deleteButton
{
    //: if (!_deleteButton) {
    if (!_deleteButton) {
        //: _deleteButton = [UIButton buttonWithType:UIButtonTypeSystem];
        _deleteButton = [UIButton buttonWithType:UIButtonTypeSystem];
        //: _deleteButton.titleLabel.font = [UIFont systemFontOfSize:13.0];
        _deleteButton.titleLabel.font = [UIFont systemFontOfSize:13.0];
        //: [_deleteButton setTitle:@"删除".ntes_localized forState:UIControlStateNormal];
        [_deleteButton setTitle:@"删除".language forState:UIControlStateNormal];
    }
    //: return _deleteButton;
    return _deleteButton;
}

//: @end
@end