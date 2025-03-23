//
//  FFDropDownMenuCustomCell.m
//  ZCAuctionCar
//
//  Created by 彭爽 on 2021/4/9.
//

#import "FFDropDownMenuCustomCell.h"
#import "FFDropDownMenuModel.h"

@interface FFDropDownMenuCustomCell ()
/** 图片 */
@property (weak, nonatomic) UIImageView *customImageView;

/** 标题 */
@property (weak, nonatomic) UILabel *customTitleLabel;

/** 底部分割线 */
@property (nonatomic, weak) UIView *separaterView;

@end

@implementation FFDropDownMenuCustomCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
//        UIView *bgview = [[UIView alloc]initWithFrame:CGRectMake(5, 4, 140, 42)];
//        bgview.backgroundColor = [UIColor colorWithRed:246/255.0 green:247/255.0 blue:248/255.0 alpha:1.0];
//        bgview.layer.cornerRadius = 21;
//        [self addSubview:bgview];
        
        //初始化子控件
        UIImageView *customImageView = [[UIImageView alloc] init];
        customImageView.contentMode = UIViewContentModeScaleToFill;
        [self addSubview:customImageView];
        self.customImageView = customImageView;
        
        UILabel *customTitleLabel = [[UILabel alloc] init];
        customTitleLabel.font = [UIFont systemFontOfSize:13];
        customTitleLabel.textAlignment = NSTextAlignmentLeft;
        customTitleLabel.textColor = [UIColor blackColor];
//        customTitleLabel.font = [UIFont boldSystemFontOfSize:13];
        [self addSubview:customTitleLabel];
        self.customTitleLabel = customTitleLabel;
        
        UIView *separaterView = [[UIView alloc] init];
        separaterView.backgroundColor = RGB_COLOR_String(@"#ECEEF2");
        [self addSubview:separaterView];
        self.separaterView = separaterView;
    }
    return self;
}

- (void)layoutSubviews { //这个方法的主要任务是进行子控件frame的赋值
    [super layoutSubviews];
    //frame的赋值
    CGFloat separaterHeight = 1; //底部分割线高度
    
    //图片 customImageView
    CGFloat imageViewMargin = 15;
    CGFloat imageViewH = self.frame.size.height - 2 * imageViewMargin;
    self.customImageView.frame = CGRectMake(8, imageViewMargin, imageViewH, imageViewH);
    
    //标题
    CGFloat labelX = CGRectGetMaxX(self.customImageView.frame) + 10;
    self.customTitleLabel.frame = CGRectMake(labelX, 0, self.frame.size.width - labelX - 1, self.frame.size.height - separaterHeight);
    
    //分割线
    self.separaterView.frame = CGRectMake(10, self.frame.size.height - separaterHeight, self.frame.size.width-20, separaterHeight);
}

/** 重写setMenuModel---对控件进行赋值 */
- (void)setMenuModel:(id)menuModel {
    _menuModel = menuModel;
    
    FFDropDownMenuModel *realMenuModel = (FFDropDownMenuModel *)menuModel;
    self.customTitleLabel.text = realMenuModel.menuItemTitle;
    //给imageView赋值
    self.customImageView.image = [UIImage imageNamed:realMenuModel.menuItemIconName];
}

@end
