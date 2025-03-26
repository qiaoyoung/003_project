// __DEBUG__
// __CLOSE_PRINT__
//
//  PassWordTextView.m
//  TextFieldTest
//
//  Created by Tpphha on 15/12/16.
//  Copyright © 2015年 Tpphha. All rights reserved.
//

// __M_A_C_R_O__
//: #import "TPPasswordTextView.h"
#import "RawDataView.h"

//: @interface TPPasswordTextView ()
@interface RawDataView ()
//: @property(nonatomic, weak) UITextField *textField;
@property(nonatomic, weak) UITextField *textField;
//: @property (nonatomic, strong) NSMutableArray<UITextField *> *dataSource;
@property (nonatomic, strong) NSMutableArray<UITextField *> *dataSource;
//: @end
@end
//: @implementation TPPasswordTextView
@implementation RawDataView

//: #pragma mark - lazy
#pragma mark - lazy
//: - (NSMutableArray *)dataSource {
- (NSMutableArray *)dataSource {
    //: if (_dataSource == nil) {
    if (_dataSource == nil) {
        //: _dataSource = [NSMutableArray array];
        _dataSource = [NSMutableArray array];
    }
    //: return _dataSource;
    return _dataSource;
}


//: #pragma mark - initialization
#pragma mark - initialization
//: - (instancetype)initWithFrame:(CGRect)frame
- (instancetype)initWithFrame:(CGRect)frame
{
    //: self = [super initWithFrame:frame];
    self = [super initWithFrame:frame];
    //: if (self) {
    if (self) {
        //: UITextField *textField = [[UITextField alloc] initWithFrame:self.bounds];
        UITextField *textField = [[UITextField alloc] initWithFrame:self.bounds];
        //: textField.hidden = YES;
        textField.hidden = YES;
        //: textField.keyboardType = UIKeyboardTypeNumberPad;
        textField.keyboardType = UIKeyboardTypeNumberPad;
        //: [textField addTarget:self action:@selector(textChange:) forControlEvents:UIControlEventEditingChanged];
        [textField addTarget:self action:@selector(created:) forControlEvents:UIControlEventEditingChanged];
        //: [self addSubview:textField];
        [self addSubview:textField];
        //: self.textField = textField;
        self.textField = textField;
        //: self.autoHideKeyboard = YES;
        self.autoHideKeyboard = YES;
        //: self.elementBorderColor = [UIColor blackColor];
        self.elementBorderColor = [UIColor blackColor];
        //: self.backgroundColor = [UIColor whiteColor];
        self.backgroundColor = [UIColor whiteColor];
        //: self.elementBorderWidth = 1;
        self.elementBorderWidth = 1;
    }
    //: return self;
    return self;
}

//: - (void)setElementCount:(NSInteger)elementCount {
- (void)setElementCount:(NSInteger)elementCount {
    //: _elementCount = elementCount;
    _elementCount = elementCount;
    //: if (elementCount <= 0) {
    if (elementCount <= 0) {
        //: return;
        return;
    }

    //: if (self.dataSource.count > 0) {
    if (self.dataSource.count > 0) {
        //: [self.dataSource enumerateObjectsUsingBlock:^(id _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [self.dataSource enumerateObjectsUsingBlock:^(id _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            //: [NSObject cancelPreviousPerformRequestsWithTarget:obj selector:@selector(removeFromSuperview) object:nil];
            [NSObject cancelPreviousPerformRequestsWithTarget:obj selector:@selector(removeFromSuperview) object:nil];
        //: }];
        }];

        //: [self.dataSource makeObjectsPerformSelector:@selector(removeFromSuperview)];
        [self.dataSource makeObjectsPerformSelector:@selector(removeFromSuperview)];

        //: [self.dataSource removeAllObjects];
        [self.dataSource removeAllObjects];
    }

    //: for (int i = 0; i < self.elementCount; i++)
    for (int i = 0; i < self.elementCount; i++)
    {
        //: UITextField *pwdTextField = [[UITextField alloc] init];
        UITextField *pwdTextField = [[UITextField alloc] init];
        //: pwdTextField.enabled = NO;
        pwdTextField.enabled = NO;
        //: pwdTextField.textAlignment = NSTextAlignmentCenter;
        pwdTextField.textAlignment = NSTextAlignmentCenter;//居中
        //: pwdTextField.secureTextEntry = YES;
        pwdTextField.secureTextEntry = YES;//设置密码模式
        //: pwdTextField.userInteractionEnabled = NO;
        pwdTextField.userInteractionEnabled = NO;
        //: [self insertSubview:pwdTextField belowSubview:self.textField];
        [self insertSubview:pwdTextField belowSubview:self.textField];
        //: [self.dataSource addObject:pwdTextField];
        [self.dataSource addObject:pwdTextField];
    }
}

//: - (void)setElementMargin:(CGFloat)elementMargin {
- (void)setElementMargin:(CGFloat)elementMargin {
    //: _elementMargin = elementMargin;
    _elementMargin = elementMargin;
    //: [self setNeedsLayout];
    [self setNeedsLayout];
    //: [self setNeedsDisplay];
    [self setNeedsDisplay];
}

//: #pragma mark - publick method
#pragma mark - publick method
//: - (void)clearPassword {
- (void)should {
    //: self.textField.text = nil;
    self.textField.text = nil;
    //: [self textChange:self.textField];
    [self created:self.textField];
}

//: - (void)showKeyboard {
- (void)imageAll {
    //: [self.textField becomeFirstResponder];
    [self.textField becomeFirstResponder];
}

//: - (void)hideKeyboard {
- (void)offChange {
    //: [self.textField resignFirstResponder];
    [self.textField resignFirstResponder];
}

//: #pragma mark - 文本框内容改变
#pragma mark - 文本框内容改变
//: - (void)textChange:(UITextField *)textField {
- (void)created:(UITextField *)textField {
    //: NSString *password = textField.text;
    NSString *password = textField.text;
    //: if (password.length > self.elementCount) {
    if (password.length > self.elementCount) {
        //: return;
        return;
    }

    //: for (int i = 0; i < self.dataSource.count; i++)
    for (int i = 0; i < self.dataSource.count; i++)
    {
        //: UITextField *pwdTextField= [self.dataSource objectAtIndex:i];
        UITextField *pwdTextField= [self.dataSource objectAtIndex:i];
        //: if (i < password.length) {
        if (i < password.length) {
            //: NSString *pwd = [password substringWithRange:NSMakeRange(i, 1)];
            NSString *pwd = [password substringWithRange:NSMakeRange(i, 1)];
            //: pwdTextField.text = pwd;
            pwdTextField.text = pwd;
        //: } else {
        } else {
            //: pwdTextField.text = nil;
            pwdTextField.text = nil;
        }

    }

    //: if (password.length == self.dataSource.count)
    if (password.length == self.dataSource.count)
    {
        //: if (self.autoHideKeyboard) {
        if (self.autoHideKeyboard) {
            //: [self hideKeyboard];
            [self offChange];//隐藏键盘
        }
    }

    //: !self.passwordDidChangeBlock ? : self.passwordDidChangeBlock(textField.text);
    !self.passwordDidChangeBlock ? : self.passwordDidChangeBlock(textField.text);

}

//: - (void)layoutSubviews {
- (void)layoutSubviews {
    //: [super layoutSubviews];
    [super layoutSubviews];
    //: CGFloat x = 0;
    CGFloat x = 0;
    //: CGFloat y = 0;
    CGFloat y = 0;
    //: CGFloat w = (self.bounds.size.width - (self.elementCount - 1) * self.elementMargin) / self.elementCount;
    CGFloat w = (self.bounds.size.width - (self.elementCount - 1) * self.elementMargin) / self.elementCount;
    //: CGFloat h = self.bounds.size.height;
    CGFloat h = self.bounds.size.height;
    //: for (NSUInteger i = 0; i < self.dataSource.count; i++) {
    for (NSUInteger i = 0; i < self.dataSource.count; i++) {
        //: UITextField *pwdTextField = [self.dataSource objectAtIndex:i];
        UITextField *pwdTextField = [self.dataSource objectAtIndex:i];
        //: x = i * (w + self.elementMargin);
        x = i * (w + self.elementMargin);
        //: pwdTextField.frame = CGRectMake(x, y, w, h);
        pwdTextField.frame = CGRectMake(x, y, w, h);
    }
}

//: - (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //: [self showKeyboard];
    [self imageAll];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
//: - (void)drawRect:(CGRect)rect {
- (void)drawRect:(CGRect)rect {
    //: [super drawRect:rect];
    [super drawRect:rect];
    // Drawing code

    //: CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextRef context = UIGraphicsGetCurrentContext();
    //: [self.backgroundColor set];
    [self.backgroundColor set];
    //: CGContextFillRect(context, rect);
    CGContextFillRect(context, rect);

    //: CGContextSetLineCap(context, kCGLineCapSquare);
    CGContextSetLineCap(context, kCGLineCapSquare);

    //: CGContextSetLineWidth(context, self.elementBorderWidth);
    CGContextSetLineWidth(context, self.elementBorderWidth);

    //: CGContextSetStrokeColorWithColor(context, self.elementBorderColor.CGColor);
    CGContextSetStrokeColorWithColor(context, self.elementBorderColor.CGColor);
    //: CGContextSetFillColorWithColor(context, [UIColor clearColor].CGColor);
    CGContextSetFillColorWithColor(context, [UIColor clearColor].CGColor);

    //: CGContextBeginPath(context);
    CGContextBeginPath(context);
    //: if (self.elementMargin != 0) {
    if (self.elementMargin != 0) {
        //: for (UITextField *textField in self.dataSource) {
        for (UITextField *textField in self.dataSource) {
            //: CGRect rect = CGRectInset(textField.frame, self.elementBorderWidth, self.elementBorderWidth);
            CGRect rect = CGRectInset(textField.frame, self.elementBorderWidth, self.elementBorderWidth);
            //: CGFloat left = rect.origin.x;
            CGFloat left = rect.origin.x;
            //: CGFloat right = rect.origin.x + rect.size.width;
            CGFloat right = rect.origin.x + rect.size.width;
            //: CGFloat top = rect.origin.y;
            CGFloat top = rect.origin.y;
            //: CGFloat bottom = rect.origin.y + rect.size.height;
            CGFloat bottom = rect.origin.y + rect.size.height;
            //: CGContextMoveToPoint(context, left, top);
            CGContextMoveToPoint(context, left, top);
            //: CGContextAddLineToPoint(context, right, top);
            CGContextAddLineToPoint(context, right, top);
            //: CGContextAddLineToPoint(context, right, bottom);
            CGContextAddLineToPoint(context, right, bottom);
            //: CGContextAddLineToPoint(context, left, bottom);
            CGContextAddLineToPoint(context, left, bottom);
            //: CGContextClosePath(context);
            CGContextClosePath(context);
        }
    //: }else {
    }else {
        //: CGPoint leftTopPoint, rightTopPoint, leftBottomPoint, rightBottomPoint;
        CGPoint leftTopPoint, rightTopPoint, leftBottomPoint, rightBottomPoint;
        //: for (NSUInteger i = 0; i < self.dataSource.count; i++) {
        for (NSUInteger i = 0; i < self.dataSource.count; i++) {
            //: UITextField *textField = [self.dataSource objectAtIndex:i];
            UITextField *textField = [self.dataSource objectAtIndex:i];
            //: CGRect rect = CGRectInset(textField.frame, self.elementBorderWidth, self.elementBorderWidth);
            CGRect rect = CGRectInset(textField.frame, self.elementBorderWidth, self.elementBorderWidth);
            //: CGFloat left = rect.origin.x;
            CGFloat left = rect.origin.x;
            //: CGFloat right = rect.origin.x + rect.size.width;
            CGFloat right = rect.origin.x + rect.size.width;
            //: CGFloat top = rect.origin.y;
            CGFloat top = rect.origin.y;
            //: CGFloat bottom = rect.origin.y + rect.size.height;
            CGFloat bottom = rect.origin.y + rect.size.height;

            //: CGContextMoveToPoint(context, left, top);
            CGContextMoveToPoint(context, left, top);
            //: CGContextAddLineToPoint(context, left, bottom);
            CGContextAddLineToPoint(context, left, bottom);
            //: CGContextClosePath(context);
            CGContextClosePath(context);
            //: if (self.dataSource.count - 1 == i) {
            if (self.dataSource.count - 1 == i) {
                //: CGContextMoveToPoint(context, right, top);
                CGContextMoveToPoint(context, right, top);
                //: CGContextAddLineToPoint(context, right, bottom);
                CGContextAddLineToPoint(context, right, bottom);
                //: CGContextClosePath(context);
                CGContextClosePath(context);
                //: rightTopPoint = CGPointMake(right, top);
                rightTopPoint = CGPointMake(right, top);
                //: rightBottomPoint = CGPointMake(right, bottom);
                rightBottomPoint = CGPointMake(right, bottom);
            //: }else if (0 == i) {
            }else if (0 == i) {
                //: leftTopPoint = CGPointMake(left, top);
                leftTopPoint = CGPointMake(left, top);
                //: leftBottomPoint = CGPointMake(left, bottom);
                leftBottomPoint = CGPointMake(left, bottom);
            }
        }

        //: CGContextMoveToPoint(context, leftTopPoint.x, leftTopPoint.y);
        CGContextMoveToPoint(context, leftTopPoint.x, leftTopPoint.y);
        //: CGContextAddLineToPoint(context, rightTopPoint.x, rightTopPoint.y);
        CGContextAddLineToPoint(context, rightTopPoint.x, rightTopPoint.y);
        //: CGContextClosePath(context);
        CGContextClosePath(context);

        //: CGContextMoveToPoint(context, leftBottomPoint.x, leftBottomPoint.y);
        CGContextMoveToPoint(context, leftBottomPoint.x, leftBottomPoint.y);
        //: CGContextAddLineToPoint(context, rightBottomPoint.x, rightBottomPoint.y);
        CGContextAddLineToPoint(context, rightBottomPoint.x, rightBottomPoint.y);
        //: CGContextClosePath(context);
        CGContextClosePath(context);
    }

    //: CGContextStrokePath(context);
    CGContextStrokePath(context);
}


//: @end
@end