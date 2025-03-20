// __DEBUG__
// __CLOSE_PRINT__
//
//  BubbleScrollView.m
// Indicator
//
//  Created by chris on 16/3/27.
//  Copyright © 2016年 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import "AAAGrowingInternalTextView.h"
#import "BubbleScrollView.h"

//: @interface AAAGrowingInternalTextView()
@interface BubbleScrollView()

//: @property (nonatomic,assign) BOOL displayPlaceholder;
@property (nonatomic,assign) BOOL displayPlaceholder;

//: @end
@end

//: @implementation AAAGrowingInternalTextView
@implementation BubbleScrollView

//: - (instancetype)initWithFrame:(CGRect)frame textContainer:(NSTextContainer *)textContainer
- (instancetype)initWithFrame:(CGRect)frame textContainer:(NSTextContainer *)textContainer
{
    //: self = [super initWithFrame:frame textContainer:textContainer];
    self = [super initWithFrame:frame textContainer:textContainer];
    //: if (self) {
    if (self) {
        //: [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textDidChangeNotification:) name:UITextViewTextDidChangeNotification object:self];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(sends:) name:UITextViewTextDidChangeNotification object:self];
    }
    //: return self;
    return self;
}

//: - (void)dealloc
- (void)dealloc
{
    //: [[NSNotificationCenter defaultCenter] removeObserver:self];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

//: - (void)setText:(NSString *)text
- (void)setText:(NSString *)text
{
    //: [super setText:text];
    [super setText:text];
    //: [self updatePlaceholder];
    [self modifyTitlePlaceholder];
}

//: - (BOOL)canPerformAction:(SEL)action withSender:(id)sender
- (BOOL)canPerformAction:(SEL)action withSender:(id)sender
{
    //: if(action ==@selector(copy:) ||
    if(action ==@selector(copy:) ||

       //: action ==@selector(selectAll:)||
       action ==@selector(selectAll:)||

       //: action ==@selector(cut:)||
       action ==@selector(cut:)||

       //: action ==@selector(select:)||
       action ==@selector(select:)||

       //: action ==@selector(paste:)) {
       action ==@selector(paste:)) {

        //: return[super canPerformAction:action withSender:sender];
        return[super canPerformAction:action withSender:sender];
    }
    //: return NO;
    return NO;
}

//: - (void)setPlaceholderAttributedText:(NSAttributedString *)placeholderAttributedText
- (void)setPlaceholderAttributedText:(NSAttributedString *)placeholderAttributedText
{
    //: _placeholderAttributedText = placeholderAttributedText;
    _placeholderAttributedText = placeholderAttributedText;
    //: [self setNeedsDisplay];
    [self setNeedsDisplay];
}

//: - (void)layoutSubviews
- (void)layoutSubviews
{
    //: [super layoutSubviews];
    [super layoutSubviews];
    //: [self setNeedsDisplay];
    [self setNeedsDisplay];
}



//: #pragma mark - Private
#pragma mark - Private

//: - (void)setDisplayPlaceholder:(BOOL)displayPlaceholder
- (void)setDisplayPlaceholder:(BOOL)displayPlaceholder
{
    //: BOOL oldValue = _displayPlaceholder;
    BOOL oldValue = _displayPlaceholder;
    //: _displayPlaceholder = displayPlaceholder;
    _displayPlaceholder = displayPlaceholder;
    //: if (oldValue != self.displayPlaceholder) {
    if (oldValue != self.displayPlaceholder) {
        //: [self setNeedsDisplay];
        [self setNeedsDisplay];
    }
}

//: - (void)updatePlaceholder
- (void)modifyTitlePlaceholder
{
    //: self.displayPlaceholder = self.text.length == 0;
    self.displayPlaceholder = self.text.length == 0;
}

//: - (void)textDidChangeNotification:(NSNotification *)notification
- (void)sends:(NSNotification *)notification
{
    //: [self updatePlaceholder];
    [self modifyTitlePlaceholder];
}


//: - (void)drawRect:(CGRect)rect
- (void)drawRect:(CGRect)rect
{
    //: [super drawRect:rect];
    [super drawRect:rect];
    //: if (!self.displayPlaceholder) {
    if (!self.displayPlaceholder) {
        //: return;
        return;
    }
    //: NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    //: paragraphStyle.alignment = self.textAlignment;
    paragraphStyle.alignment = self.textAlignment;

    //: CGRect targetRect = CGRectMake(5, 8 + self.contentInset.top, self.frame.size.width - self.contentInset.left, self.frame.size.height - self.contentInset.top);
    CGRect targetRect = CGRectMake(5, 8 + self.contentInset.top, self.frame.size.width - self.contentInset.left, self.frame.size.height - self.contentInset.top);

    //: NSAttributedString *attributedString = self.placeholderAttributedText;
    NSAttributedString *attributedString = self.placeholderAttributedText;
    //: [attributedString drawInRect:targetRect];
    [attributedString drawInRect:targetRect];
}


//: @end
@end