//
//  NTESCardGroupCell.m
//  NIM
//
//  Created by 彭爽 on 2021/9/27.
//  Copyright © 2021 Netease. All rights reserved.
//

#import "NTESCardGroupCell.h"

@interface NTESCardGroupCell ()
@property (nonatomic,strong) NIMCommonTableRow *rowData;

@end

@implementation NTESCardGroupCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {


//        _titleLabel = [[UILabel alloc] init];
//        _titleLabel.textColor = [UIColor lightGrayColor];
//        _titleLabel.text = @"填写验证信息";
//        _titleLabel.font = [UIFont systemFontOfSize:14];
//        [self addSubview:_titleLabel];
//        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.mas_offset(15);
//            make.top.mas_offset(-10);
//            make.width.mas_equalTo(100);
//            make.height.mas_equalTo(20);
//        }];
        
//        UIView *background = [[UIView alloc] init];
//        background.backgroundColor = [UIColor whiteColor];
//        [self addSubview:background];
//        [background mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.mas_offset(0);
//            make.right.mas_offset(0);
//            make.top.mas_offset(0);
//            make.height.mas_equalTo(100);
//        }];
//
        
//        _textView = [[UITextView alloc] init];
//        _textView.delegate = self;
//        _textView.returnKeyType = UIReturnKeyDone;
//        [self.contentView addSubview:_textView];
//        _textView.layer.masksToBounds = YES;
//        _textView.layer.cornerRadius = 6.;
//        _textView.layer.borderColor = [UIColor lightGrayColor].CGColor;
//        _textView.layer.borderWidth = 0.7;
//        [_textView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.mas_offset(15);
//            make.right.mas_offset(-15);
//            make.top.mas_offset(10);
//            make.bottom.mas_offset(-10);
//        }];
        

    }
    return self;
}


- (void)layoutSubviews{
    [super layoutSubviews];
}

- (void)refreshData:(NIMCommonTableRow *)rowData tableView:(UITableView *)tableView{
    
    _rowData = rowData;
    
}

@end
