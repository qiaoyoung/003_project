// __DEBUG__
// __CLOSE_PRINT__
//
//  DistanceView.h
// Indicator
//
//  Created by chris.
//  Copyright (c) 2015年 NetEase. All rights reserved.
//

// __M_A_C_R_O__
//: #import <UIKit/UIKit.h>
#import <UIKit/UIKit.h>
//: #import "AAAGrowingTextView.h"
#import "TeamGrowingView.h"

//: typedef NS_ENUM(NSInteger,NIMInputStatus)
typedef NS_ENUM(NSInteger,NIMInputStatus)
{
    //: NIMInputStatusText,
    NIMInputStatusText,
    //: NIMInputStatusAudio,
    NIMInputStatusAudio,
    //: NIMInputStatusEmoticon,
    NIMInputStatusEmoticon,
    //: NIMInputStatusMore
    NIMInputStatusMore
//: };
};


//: @protocol AAAInputToolBarDelegate <NSObject>
@protocol TextTap <NSObject>

//: @optional
@optional

//: - (BOOL)textViewShouldBeginEditing;
- (BOOL)viewTo;

//: - (void)textViewDidEndEditing;
- (void)imageTingWindow;

//: - (BOOL)shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)replacementText;
- (BOOL)sparkling:(NSRange)range content:(NSString *)replacementText;

//: - (void)textViewDidChange;
- (void)cookieDomainChange;

//: - (void)toolBarWillChangeHeight:(CGFloat)height;
- (void)toolHolder:(CGFloat)height;

//: - (void)toolBarDidChangeHeight:(CGFloat)height;
- (void)barroomTip:(CGFloat)height;

//: @end
@end


//: @interface AAAInputToolBar : UIView
@interface DistanceView : UIView

//: @property (nonatomic,strong) UIButton *voiceButton;
@property (nonatomic,strong) UIButton *voiceButton;

//: @property (nonatomic,strong) UIButton *emoticonBtn;
@property (nonatomic,strong) UIButton *emoticonBtn;
//: @property (nonatomic,strong) UIButton *emoticonBtn2;
@property (nonatomic,strong) UIButton *emoticonBtn2;

//: @property (nonatomic,strong) UIButton *albunBtn;
@property (nonatomic,strong) UIButton *albunBtn;

//: @property (nonatomic,strong) UIButton *cameraBtn;
@property (nonatomic,strong) UIButton *cameraBtn;

//@property (nonatomic,strong) UIButton    *moreMediaBtn;
//
//@property (nonatomic,strong) UIButton    *recordButton;

//: @property (nonatomic,strong) UIButton *sendButton;
@property (nonatomic,strong) UIButton *sendButton;

//@property (nonatomic,strong) UIImageView *inputTextBkgImage;

//: @property (nonatomic,strong) UIView *bottomSep;
@property (nonatomic,strong) UIView *bottomSep;

//: @property (nonatomic,copy) NSString *contentText;
@property (nonatomic,copy) NSString *contentText;

//: @property (nonatomic,weak) id<AAAInputToolBarDelegate> delegate;
@property (nonatomic,weak) id<TextTap> delegate;

//: @property (nonatomic,assign) BOOL showsKeyboard;
@property (nonatomic,assign) BOOL showsKeyboard;

//: @property (nonatomic,assign) NSArray *inputBarItemTypes;
@property (nonatomic,assign) NSArray *inputBarItemTypes;

//: @property (nonatomic,assign) NSInteger maxNumberOfInputLines;
@property (nonatomic,assign) NSInteger maxNumberOfInputLines;

//: @property (nonatomic,strong) AAAGrowingTextView *inputTextView;
@property (nonatomic,strong) TeamGrowingView *inputTextView;

//: - (void)update:(NIMInputStatus)status;
- (void)item:(NIMInputStatus)status;

//: @end
@end

//: @interface AAAInputToolBar(InputText)
@interface DistanceView(InputText)

//: - (NSRange)selectedRange;
- (NSRange)messageKeyRange;

//: - (void)setPlaceHolder:(NSString *)placeHolder;
- (void)setHolder:(NSString *)placeHolder;
//: - (void)setPlaceHolder:(NSString *)placeHolder color:(UIColor *)placeholderColor;
- (void)nearTone:(NSString *)placeHolder straddle:(UIColor *)placeholderColor;

//: - (void)insertText:(NSString *)text;
- (void)everyPicture:(NSString *)text;

//: - (void)deleteText:(NSRange)range;
- (void)accumulation:(NSRange)range;

//// 2022年08月25日 emoji处理
//: - (void)insertAttributedText:(NSString *)text withEmoji:(BOOL)isEmoji;
- (void)sessionEmoji:(NSString *)text table:(BOOL)isEmoji;

//: @end
@end