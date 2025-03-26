// __DEBUG__
// __CLOSE_PRINT__
//
//  TeamGrowingView.h
// Indicator
//
//  Created by chris on 16/3/27.
//  Copyright © 2016年 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import <UIKit/UIKit.h>
#import <UIKit/UIKit.h>

//: @class AAAGrowingTextView;
@class TeamGrowingView;

//: @protocol AAAGrowingTextViewDelegate <NSObject>
@protocol SpectralColorDelegate <NSObject>
//: @optional
@optional

//: - (BOOL)shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)replacementText;
- (BOOL)sparkling:(NSRange)range content:(NSString *)replacementText;

//: - (BOOL)shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)range;
- (BOOL)top:(NSURL *)URL hide:(NSRange)range;

//: - (BOOL)shouldInteractWithTextAttachment:(NSTextAttachment *)textAttachment inRange:(NSRange)range;
- (BOOL)sendAmbit:(NSTextAttachment *)textAttachment time:(NSRange)range;

//: - (void)textViewDidBeginEditing:(AAAGrowingTextView *)growingTextView;
- (void)textEditing:(TeamGrowingView *)growingTextView;

//: - (void)textViewDidChangeSelection:(AAAGrowingTextView *)growingTextView;
- (void)readSub:(TeamGrowingView *)growingTextView;

//: - (void)textViewDidEndEditing:(AAAGrowingTextView *)growingTextView;
- (void)infoing:(TeamGrowingView *)growingTextView;

//: - (BOOL)textViewShouldBeginEditing:(AAAGrowingTextView *)growingTextView;
- (BOOL)maxed:(TeamGrowingView *)growingTextView;

//: - (BOOL)textViewShouldEndEditing:(AAAGrowingTextView *)growingTextView;
- (BOOL)ambitted:(TeamGrowingView *)growingTextView;

//: - (void)textViewDidChange:(AAAGrowingTextView *)growingTextView;
- (void)bars:(TeamGrowingView *)growingTextView;

//: - (void)willChangeHeight:(CGFloat)height;
- (void)changeHeight:(CGFloat)height;

//: - (void)didChangeHeight:(CGFloat)height;
- (void)attacks:(CGFloat)height;

//: @end
@end

//: @interface AAAGrowingTextView : UIScrollView
@interface TeamGrowingView : UIScrollView

//: @property (nonatomic,weak) id<AAAGrowingTextViewDelegate> textViewDelegate;
@property (nonatomic,weak) id<SpectralColorDelegate> textViewDelegate;

//: @property (nonatomic,assign) NSInteger minNumberOfLines;
@property (nonatomic,assign) NSInteger minNumberOfLines;

//: @property (nonatomic,assign) NSInteger maxNumberOfLines;
@property (nonatomic,assign) NSInteger maxNumberOfLines;

//: @property (nonatomic,strong) UIView *inputView;
@property (nonatomic,strong) UIView *inputView;

//: @end
@end

//: @interface AAAGrowingTextView(TextView)
@interface TeamGrowingView(TextView)

//: @property (nonatomic,copy) NSAttributedString *placeholderAttributedText;
@property (nonatomic,copy) NSAttributedString *placeholderAttributedText;

//: @property (nonatomic,copy) NSString *text;
@property (nonatomic,copy) NSString *text;

//: @property (nonatomic,strong) UIFont *font;
@property (nonatomic,strong) UIFont *font;

//: @property (nonatomic,strong) UIColor *textColor;
@property (nonatomic,strong) UIColor *textColor;

//: @property (nonatomic,assign) NSTextAlignment textAlignment;
@property (nonatomic,assign) NSTextAlignment textAlignment;

//: @property (nonatomic,assign) NSRange selectedRange;
@property (nonatomic,assign) NSRange selectedRange;

//: @property (nonatomic,assign) UIDataDetectorTypes dataDetectorTypes;
@property (nonatomic,assign) UIDataDetectorTypes dataDetectorTypes;

//: @property (nonatomic,assign) BOOL editable;
@property (nonatomic,assign) BOOL editable;

//: @property (nonatomic,assign) BOOL selectable;
@property (nonatomic,assign) BOOL selectable;

//: @property (nonatomic,assign) BOOL allowsEditingTextAttributes;
@property (nonatomic,assign) BOOL allowsEditingTextAttributes;

//: @property (nonatomic,copy) NSAttributedString *attributedText;
@property (nonatomic,copy) NSAttributedString *attributedText;

//: @property (nonatomic,strong) UIView *textViewInputAccessoryView;
@property (nonatomic,strong) UIView *textViewInputAccessoryView;

//: @property (nonatomic,assign) BOOL clearsOnInsertion;
@property (nonatomic,assign) BOOL clearsOnInsertion;

//: @property (nonatomic,readonly) NSTextContainer *textContainer;
@property (nonatomic,readonly) NSTextContainer *textContainer;

//: @property (nonatomic,assign) UIEdgeInsets textContainerInset;
@property (nonatomic,assign) UIEdgeInsets textContainerInset;

//: @property (nonatomic,readonly) NSLayoutManager *layoutManger;
@property (nonatomic,readonly) NSLayoutManager *layoutManger;

//: @property (nonatomic,readonly) NSTextStorage *textStorage;
@property (nonatomic,readonly) NSTextStorage *textStorage;

//: @property (nonatomic, copy) NSDictionary<NSString *, id> *linkTextAttributes;
@property (nonatomic, copy) NSDictionary<NSString *, id> *linkTextAttributes;

//: @property (nonatomic,assign) UIReturnKeyType returnKeyType;
@property (nonatomic,assign) UIReturnKeyType returnKeyType;

//: - (void)scrollRangeToVisible:(NSRange)range;
- (void)nameObject:(NSRange)range;

//: @end
@end