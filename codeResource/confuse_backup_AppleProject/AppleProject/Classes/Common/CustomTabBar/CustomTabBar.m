//
//  CustomTabBar.m
//  AppleProject
//
//  Created by AI Assistant on 2023-05-12.
//  Copyright © 2023 Netease. All rights reserved.
//

#import "CustomTabBar.h"

// 确保 IsiPhoneX 宏定义存在
#ifndef IsiPhoneX
#define IsiPhoneX ({\
    BOOL isPhoneX = NO;\
    if (@available(iOS 11.0, *)) {\
        isPhoneX = [[UIApplication sharedApplication] delegate].window.safeAreaInsets.bottom > 0.0;\
    }\
    isPhoneX;\
})
#endif

@interface CustomTabBarItemView : UIView

@property (nonatomic, strong) UITabBarItem *item;
@property (nonatomic, strong) UIImageView *iconImageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *badgeLabel;
@property (nonatomic, assign) BOOL selected;
@property (nonatomic, strong) UIColor *tintColor;
@property (nonatomic, strong) UIColor *selectedTintColor;

- (void)updateAppearance;

@end

@implementation CustomTabBarItemView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    self.tintColor = RGB_COLOR_String(@"#888888");
    self.selectedTintColor = RGB_COLOR_String(@"#000000");
    
    // 图标
    _iconImageView = [[UIImageView alloc] init];
    _iconImageView.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:_iconImageView];
    
    // 标题
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.font = [UIFont systemFontOfSize:10];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_titleLabel];
    
    // 红点标记
    _badgeLabel = [[UILabel alloc] init];
    _badgeLabel.textAlignment = NSTextAlignmentCenter;
    _badgeLabel.textColor = [UIColor whiteColor];
    _badgeLabel.backgroundColor = [UIColor redColor];
    _badgeLabel.font = [UIFont systemFontOfSize:11];
    _badgeLabel.layer.cornerRadius = 8;
    _badgeLabel.layer.masksToBounds = YES;
    _badgeLabel.hidden = YES;
    [self addSubview:_badgeLabel];
    
    self.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    [self addGestureRecognizer:tap];
}

- (void)handleTap:(UITapGestureRecognizer *)tap {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"CustomTabBarItemTapped" object:self];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat itemWidth = self.bounds.size.width;
    CGFloat itemHeight = self.bounds.size.height;
    
    // 布局图标 - 稍微调整一下位置，使其与系统TabBar一致
    CGFloat iconSize = 24.0;
    CGFloat iconY = IsiPhoneX ? 8 : 6; // 针对刘海屏做适配
    _iconImageView.frame = CGRectMake((itemWidth - iconSize) / 2, iconY, iconSize, iconSize);
    
    // 布局标题 - 增加与图标的间距
    _titleLabel.frame = CGRectMake(0, CGRectGetMaxY(_iconImageView.frame) + 4, itemWidth, 14); // 间距从2增加到4
    
    // 布局badge
    [self layoutBadge];
}

- (void)layoutBadge {
    if (_badgeLabel.hidden) {
        return;
    }
    
    CGSize badgeSize = [_badgeLabel.text sizeWithAttributes:@{NSFontAttributeName: _badgeLabel.font}];
    CGFloat badgeWidth = MAX(16, badgeSize.width + 8);
    
    // 调整badge位置，更像系统TabBar
    CGFloat badgeX = CGRectGetMaxX(_iconImageView.frame) - 10;
    CGFloat badgeY = _iconImageView.frame.origin.y - 5;
    
    _badgeLabel.frame = CGRectMake(badgeX, badgeY, badgeWidth, 16);
}

- (void)setItem:(UITabBarItem *)item {
    _item = item;
    [self updateAppearance];
}

- (void)setBadgeValue:(NSString *)badgeValue {
    _item.badgeValue = badgeValue;
    
    if (badgeValue && badgeValue.length > 0) {
        _badgeLabel.text = badgeValue;
        _badgeLabel.hidden = NO;
    } else {
        _badgeLabel.hidden = YES;
    }
    
    [self layoutBadge];
}

- (void)setSelected:(BOOL)selected {
    _selected = selected;
    [self updateAppearance];
}

- (void)updateAppearance {
    if (!_item) {
        return;
    }
    
    if (_selected) {
        _iconImageView.image = _item.selectedImage;
        _titleLabel.textColor = self.selectedTintColor;
    } else {
        _iconImageView.image = _item.image;
        _titleLabel.textColor = self.tintColor;
    }
    
    _titleLabel.text = _item.title;
    
    // 更新badge
    [self setBadgeValue:_item.badgeValue];
}

@end

@interface CustomTabBar ()

@property (nonatomic, strong) NSMutableArray<CustomTabBarItemView *> *itemViews;

@end

@implementation CustomTabBar

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    self.backgroundColor = [UIColor whiteColor];
    self.itemViews = [NSMutableArray array];
    
    // 添加通知监听
    [[NSNotificationCenter defaultCenter] addObserver:self 
                                             selector:@selector(tabBarItemTapped:) 
                                                 name:@"CustomTabBarItemTapped" 
                                               object:nil];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    if (self.itemViews.count == 0) {
        return;
    }
    
    CGFloat itemWidth = self.bounds.size.width / self.itemViews.count;
    CGFloat itemHeight = self.bounds.size.height;
    
    for (NSInteger i = 0; i < self.itemViews.count; i++) {
        CustomTabBarItemView *itemView = self.itemViews[i];
        itemView.frame = CGRectMake(i * itemWidth, 0, itemWidth, itemHeight);
    }
}

- (void)setItems:(NSArray<UITabBarItem *> *)items {
    _items = items;
    
    // 清除现有的itemViews
    for (UIView *subview in self.itemViews) {
        [subview removeFromSuperview];
    }
    [self.itemViews removeAllObjects];
    
    // 创建新的itemViews
    for (UITabBarItem *item in items) {
        CustomTabBarItemView *itemView = [[CustomTabBarItemView alloc] init];
        itemView.item = item;
        if (_itemTintColor) {
            itemView.tintColor = _itemTintColor;
        }
        if (_selectedItemTintColor) {
            itemView.selectedTintColor = _selectedItemTintColor;
        }
        [self addSubview:itemView];
        [self.itemViews addObject:itemView];
    }
    
    [self setNeedsLayout];
    
    // 设置默认选中项
    if (self.selectedIndex < self.itemViews.count) {
        self.itemViews[self.selectedIndex].selected = YES;
    }
}

- (void)setSelectedIndex:(NSInteger)selectedIndex {
    if (_selectedIndex == selectedIndex || selectedIndex >= self.itemViews.count) {
        return;
    }
    
    if (_selectedIndex < self.itemViews.count) {
        self.itemViews[_selectedIndex].selected = NO;
    }
    
    _selectedIndex = selectedIndex;
    
    if (_selectedIndex < self.itemViews.count) {
        self.itemViews[_selectedIndex].selected = YES;
    }
}

- (void)tabBarItemTapped:(NSNotification *)notification {
    CustomTabBarItemView *tappedItem = notification.object;
    NSInteger index = [self.itemViews indexOfObject:tappedItem];
    
    if (index != NSNotFound && index != self.selectedIndex) {
        self.selectedIndex = index;
        if ([self.delegate respondsToSelector:@selector(tabBar:didSelectItemAtIndex:)]) {
            [self.delegate tabBar:self didSelectItemAtIndex:index];
        }
    }
}

- (void)setBadgeValue:(NSString *)badgeValue atIndex:(NSInteger)index {
    if (index < self.itemViews.count) {
        [self.itemViews[index] setBadgeValue:badgeValue];
    }
}

- (void)setItemTintColor:(UIColor *)itemTintColor {
    _itemTintColor = itemTintColor;
    
    for (CustomTabBarItemView *itemView in self.itemViews) {
        itemView.tintColor = itemTintColor;
        [itemView updateAppearance];
    }
}

- (void)setSelectedItemTintColor:(UIColor *)selectedItemTintColor {
    _selectedItemTintColor = selectedItemTintColor;
    
    for (CustomTabBarItemView *itemView in self.itemViews) {
        itemView.selectedTintColor = selectedItemTintColor;
        [itemView updateAppearance];
    }
}

- (void)refreshTabBarItems {
    for (CustomTabBarItemView *itemView in self.itemViews) {
        [itemView updateAppearance];
    }
}

@end 