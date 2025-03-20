//
//  HMDataPicker.m
//  HuaxiajiaboApp
//
//  Created by HuamoMac on 15/10/10.
//  Copyright © 2015年 HuaMo. All rights reserved.
//

#import "HMDataPicker.h"

#define PickHeight 206
@interface HMDataPicker () <UIPickerViewDataSource, UIPickerViewDelegate>{
    
}
@property (nonatomic,weak) id<HMDataPickerDelegate> delegate;
@property (nonatomic,strong) UIView *backView;
@property (nonatomic,strong) UIView *pickerBackView;
@property (nonatomic,strong) UIPickerView *pickerView;
@property (nonatomic,strong) NSArray *dataArray;
@property (nonatomic,strong) NSDictionary *dataDict;
@property (nonatomic,strong) NSDictionary *selectedDict;
@property (nonatomic,strong) NSDictionary *tempDict;
@property (nonatomic,strong) NSString *jsonNode;
@property (nonatomic,strong) UILabel *titleLabel;

@end



@implementation HMDataPicker


- (id)initWithDelegate:(id<HMDataPickerDelegate>)delegate dataDict:(NSDictionary *)dataDict selectedDict:(NSDictionary *)selectedDict jsonNode:(NSString *)jsonNode{
    if (self = [super init]) {
        self.frame = [[UIScreen mainScreen] bounds];
        _delegate = delegate;
        
        _dataDict = [[NSDictionary alloc]initWithDictionary:dataDict];
        _dataArray = [[NSArray alloc]initWithArray:[dataDict valueObjectForKey:@"item_data"]];
        _selectedDict = selectedDict;
        _jsonNode = jsonNode;
        
        [self customInit];
    }
    return self;
}

- (void)setTitle:(NSString *)title{
    _titleLabel.text = title;
}

- (void)customInit{
    
    
    
    _backView = [[UIView alloc] init];
    _backView.frame = [[UIScreen mainScreen] bounds];
    _backView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.3];
    _backView.userInteractionEnabled = YES;
    [self addSubview:_backView];
    
    UIButton *disButton = [UIButton buttonWithType:UIButtonTypeCustom];
    disButton.frame = _backView.bounds;
    [disButton addTarget:self action:@selector(dismissPicker) forControlEvents:UIControlEventTouchUpInside];
    [_backView addSubview:disButton];
    
    UIView *backView = [[UIView alloc] init];
    backView.frame = CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, 60 + 246+SCREEN_BOTTOM_HEIGHT);
    backView.backgroundColor = [UIColor whiteColor];
    //backView.center = _backView.center;
    [_backView addSubview:backView];
    _pickerBackView = backView;
    
    UIView *headerView = [[UIView alloc] init];
    headerView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 40);
    headerView.backgroundColor = RGB_COLOR_String(@"#EDEEEF");
    [backView addSubview:headerView];
    
//    UIView *lineView = [[UIView alloc] init];
//    lineView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 2);
//    lineView.backgroundColor = RGB_COLOR_String(@"#DCDDDE");
//    [backView addSubview:lineView];

    UILabel *titleLab = [[UILabel alloc] init];
    titleLab.frame = CGRectMake(30, 0, backView.frame.size.width-60, 40);
    titleLab.textAlignment = NSTextAlignmentCenter;
    titleLab.font = [UIFont systemFontOfSize:16];
    titleLab.textColor = TextColor_2;
    [backView addSubview:titleLab];
    titleLab.text = [NSString stringWithFormat:@"%@", @"请选择".nim_localized];
    _titleLabel = titleLab;
    
    UIButton *button =[UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(SCREEN_WIDTH-60, 0, 60, 40);
    [button setTitle:@"完成".nim_localized forState:UIControlStateNormal];
    [button setTitleColor:RGB_COLOR_String(@"#0092de") forState:UIControlStateNormal];
    button.tag = 100;
    button.titleLabel.font = [UIFont systemFontOfSize:14];
    [button addTarget:self action:@selector(buttonClick1:) forControlEvents:UIControlEventTouchUpInside];
    [backView addSubview:button];
    
    UIPickerView *pickView = [[UIPickerView alloc] init];
    pickView.tag = 1;
    pickView.frame = CGRectMake(0, 60, backView.frame.size.width, PickHeight);
    pickView.delegate = self;
    pickView.dataSource = self;
    pickView.backgroundColor = [UIColor whiteColor];
    pickView.showsSelectionIndicator=YES;
    [backView addSubview:pickView];
    pickView.userInteractionEnabled = _dataArray.count>0;
    _pickerView = pickView;
    
    
    [_pickerBackView setHeight:40+PickHeight+SCREEN_BOTTOM_HEIGHT];
    
    
    if (_selectedDict) {
        _tempDict = _selectedDict;
        for (NSInteger i=0; i<_dataArray.count; i++) {
            NSDictionary *dict = [_dataArray objectAtIndex:i];
            
            if ([[dict newStringValueForKey:_jsonNode] isEqualToString:[_tempDict newStringValueForKey:_jsonNode]]) {
                [pickView selectRow:i inComponent:0 animated:YES];
                break;
            }
        }
        
    }else{
        if (_dataArray.count > 0)
            _tempDict = [_dataArray objectAtIndex:0];
    }
}

-(void)buttonClick1:(UIButton*)sender{
    if (_tempDict && _delegate && [_delegate respondsToSelector:@selector(dataPicker:selectedDict:)]) {
        [_delegate dataPicker:self selectedDict:_tempDict];
    }
    
    
    [self dismissPicker];
    
}

- (void)show{
    
    UIWindow *window = [[[UIApplication sharedApplication]delegate]window];
    [window addSubview:self];
    
    [UIView animateWithDuration:0.3 animations:^{
        
        [self->_pickerBackView setOriginY:SCREEN_HEIGHT - (40 + PickHeight + SCREEN_BOTTOM_HEIGHT)];
    }];
}

- (void)dismissPicker{
    [UIView animateWithDuration:0.3 animations:^{
        [self->_pickerBackView setOriginY:SCREEN_HEIGHT];
    } completion:^(BOOL finished) {
        
        self.hidden = YES;
        [self removeFromSuperview];
    }];
    
    
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return _dataArray.count;
}



- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(nullable UIView *)view{
    UILabel* pickerLabel = (UILabel*)view;
    if (!pickerLabel){
        pickerLabel = [[UILabel alloc] init];
        pickerLabel.adjustsFontSizeToFitWidth = YES;
        pickerLabel.textAlignment = NSTextAlignmentCenter;
        pickerLabel.textColor = TextColor_1;
        [pickerLabel setBackgroundColor:[UIColor clearColor]];
        [pickerLabel setFont:[UIFont systemFontOfSize:17]];
    }
    
    NSDictionary *dic = [_dataArray objectAtIndex:row];
    NSString *brandAddressStr = [dic objectForKey:_jsonNode];
    pickerLabel.text = brandAddressStr;
    return pickerLabel;
}

-(CGFloat) pickerView:(UIPickerView *)pickerView rowHeightForComponent: (NSInteger) component
{
    return 40;
}

-(void) pickerView: (UIPickerView *)pickerView didSelectRow: (NSInteger)row inComponent: (NSInteger)component{
    
    _tempDict = [_dataArray objectAtIndex:row];
}



@end
