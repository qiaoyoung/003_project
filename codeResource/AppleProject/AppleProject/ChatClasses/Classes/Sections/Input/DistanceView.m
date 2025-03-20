
#import <Foundation/Foundation.h>
typedef struct {
    Byte limpArtistic;
    Byte *earth;
    unsigned int ourThree;
    bool balanceCurious;
	int goalBalance;
	int indexAnimal;
} SignerData;

NSString *StringFromSignerData(SignerData *data);


//: icon_toolview_voice_normal
SignerData str_weaponViewName = (SignerData){83, (Byte []){58, 48, 60, 61, 12, 39, 60, 60, 63, 37, 58, 54, 36, 12, 37, 60, 58, 48, 54, 12, 61, 60, 33, 62, 50, 63, 216}, 26, false, 158, 93};


//: icon_toolview_emotion2_normal
SignerData str_immuneViewName = (SignerData){95, (Byte []){54, 60, 48, 49, 0, 43, 48, 48, 51, 41, 54, 58, 40, 0, 58, 50, 48, 43, 54, 48, 49, 109, 0, 49, 48, 45, 50, 62, 51, 113}, 29, false, 239, 173};


//: icon_toolview_emotion_normal
SignerData str_achingName = (SignerData){175, (Byte []){198, 204, 192, 193, 240, 219, 192, 192, 195, 217, 198, 202, 216, 240, 202, 194, 192, 219, 198, 192, 193, 240, 193, 192, 221, 194, 206, 195, 233}, 28, false, 107, 255};


//: icon_toolview_camera_normal
SignerData str_compriseContent = (SignerData){71, (Byte []){46, 36, 40, 41, 24, 51, 40, 40, 43, 49, 46, 34, 48, 24, 36, 38, 42, 34, 53, 38, 24, 41, 40, 53, 42, 38, 43, 49}, 27, false, 208, 254};


//: icon_toolview_send
SignerData str_twoQuitKeyValue = (SignerData){22, (Byte []){127, 117, 121, 120, 73, 98, 121, 121, 122, 96, 127, 115, 97, 73, 101, 115, 120, 114, 23}, 18, false, 54, 116};


//: icon_toolview_keyboard_normal
SignerData str_nessValue = (SignerData){105, (Byte []){0, 10, 6, 7, 54, 29, 6, 6, 5, 31, 0, 12, 30, 54, 2, 12, 16, 11, 6, 8, 27, 13, 54, 7, 6, 27, 4, 8, 5, 71}, 29, false, 21, 11};


//: icon_toolview_keybord
SignerData str_administrativeName = (SignerData){18, (Byte []){123, 113, 125, 124, 77, 102, 125, 125, 126, 100, 123, 119, 101, 77, 121, 119, 107, 112, 125, 96, 118, 176}, 21, false, 28, 14};


//: icon_toolview_album_normal
SignerData str_conditionTitle = (SignerData){249, (Byte []){144, 154, 150, 151, 166, 141, 150, 150, 149, 143, 144, 156, 142, 166, 152, 149, 155, 140, 148, 166, 151, 150, 139, 148, 152, 149, 233}, 26, false, 27, 201};

// __DEBUG__
// __CLOSE_PRINT__
//
//  DistanceView.m
// Indicator
//
//  Created by chris
//  Copyright (c) 2015年 NetEase. All rights reserved.
//

// __M_A_C_R_O__
//: #import "AAAInputToolBar.h"
#import "DistanceView.h"
//: #import "UIViewNimKit.h"
#import "UIViewNimKit.h"
//: #import "UIImage+AppleProjectKit.h"
#import "UIImage+Indicator.h"
//: #import "UserInputBarItemType.h"
#import "UserInputBarItemType.h"
//: #import "AAAInputEmoticonManager.h"
#import "DataOf.h"
//: #import "YYText.h"
#import "YYText.h"
//: #import "SNTextHighlight.h"
#import "ImageNameHighlight.h"
//: #import "BBBKitKeyboardInfo.h"
#import "TeamInfo.h"

//: @interface AAAInputToolBar()<AAAGrowingTextViewDelegate>
@interface DistanceView()<SpectralColorDelegate>

//: @property (nonatomic,copy) NSArray<NSNumber *> *types;
@property (nonatomic,copy) NSArray<NSNumber *> *types;

//: @property (nonatomic,copy) NSDictionary *dict;
@property (nonatomic,copy) NSDictionary *dict;

//: @property (nonatomic,assign) NIMInputStatus status;
@property (nonatomic,assign) NIMInputStatus status;

//: @end
@end

//: @implementation AAAInputToolBar
@implementation DistanceView

//: - (instancetype)initWithFrame:(CGRect)frame{
- (instancetype)initWithFrame:(CGRect)frame{
    //: self = [super initWithFrame:frame];
    self = [super initWithFrame:frame];
    //: if (self) {
    if (self) {
        //: [self setBackgroundColor:[UIColor whiteColor]];
        [self setBackgroundColor:[UIColor whiteColor]];

        //: _voiceButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _voiceButton = [UIButton buttonWithType:UIButtonTypeCustom];
        //: [_voiceButton setImage:[UIImage imageNamed:@"icon_toolview_voice_normal"] forState:UIControlStateNormal];
        [_voiceButton setImage:[UIImage imageNamed:StringFromSignerData(&str_weaponViewName)] forState:UIControlStateNormal];
//        [_voiceButton sizeToFit];
        //: [self addSubview:_voiceButton];
        [self addSubview:_voiceButton];


        //: _emoticonBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _emoticonBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        //: [_emoticonBtn setImage:[UIImage imageNamed:@"icon_toolview_emotion_normal"] forState:UIControlStateNormal];
        [_emoticonBtn setImage:[UIImage imageNamed:StringFromSignerData(&str_achingName)] forState:UIControlStateNormal];
//        [_emoticonBtn sizeToFit];
        //: [self addSubview:_emoticonBtn];
        [self addSubview:_emoticonBtn];

        //: _emoticonBtn2 = [UIButton buttonWithType:UIButtonTypeCustom];
        _emoticonBtn2 = [UIButton buttonWithType:UIButtonTypeCustom];
        //: [_emoticonBtn2 setImage:[UIImage imageNamed:@"icon_toolview_emotion2_normal"] forState:UIControlStateNormal];
        [_emoticonBtn2 setImage:[UIImage imageNamed:StringFromSignerData(&str_immuneViewName)] forState:UIControlStateNormal];
        //: [_emoticonBtn2 setImage:[UIImage imageNamed:@"icon_toolview_keybord"] forState:UIControlStateSelected];
        [_emoticonBtn2 setImage:[UIImage imageNamed:StringFromSignerData(&str_administrativeName)] forState:UIControlStateSelected];
        //: _emoticonBtn2.hidden = YES;
        _emoticonBtn2.hidden = YES;
        //: [self addSubview:_emoticonBtn2];
        [self addSubview:_emoticonBtn2];

        //: _albunBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _albunBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        //: [_albunBtn setImage:[UIImage imageNamed:@"icon_toolview_album_normal"] forState:UIControlStateNormal];
        [_albunBtn setImage:[UIImage imageNamed:StringFromSignerData(&str_conditionTitle)] forState:UIControlStateNormal];
//        [_albunBtn sizeToFit];
        //: [self addSubview:_albunBtn];
        [self addSubview:_albunBtn];

        //: _cameraBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _cameraBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        //: [_cameraBtn setImage:[UIImage imageNamed:@"icon_toolview_camera_normal"] forState:UIControlStateNormal];
        [_cameraBtn setImage:[UIImage imageNamed:StringFromSignerData(&str_compriseContent)] forState:UIControlStateNormal];
//        [_cameraBtn sizeToFit];
        //: [self addSubview:_cameraBtn];
        [self addSubview:_cameraBtn];

//        _moreMediaBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//        [_moreMediaBtn setImage:[UIImage imageNamed:@"icon_toolview_add_normal"] forState:UIControlStateNormal];
//        [_moreMediaBtn sizeToFit];

//        _recordButton = [UIButton buttonWithType:UIButtonTypeCustom];
//        [_recordButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//        [_recordButton.titleLabel setFont:[UIFont systemFontOfSize:14.f]];
//        [_recordButton setBackgroundImage:[[UIImage imageNamed:@"icon_input_text_bg"] resizableImageWithCapInsets:UIEdgeInsetsMake(15,80,15,80) resizingMode:UIImageResizingModeStretch] forState:UIControlStateNormal];
//        _recordButton.exclusiveTouch = YES;
//        [_recordButton sizeToFit];

        //: _sendButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _sendButton = [UIButton buttonWithType:UIButtonTypeCustom];
        //: [_sendButton setImage:[UIImage imageNamed:@"icon_toolview_send"] forState:UIControlStateNormal];
        [_sendButton setImage:[UIImage imageNamed:StringFromSignerData(&str_twoQuitKeyValue)] forState:UIControlStateNormal];
        //: _sendButton.hidden = YES;
        _sendButton.hidden = YES;
        //: [self addSubview:_sendButton];
        [self addSubview:_sendButton];
//        [_sendButton sizeToFit];
//        _sendButton.hitTestEdgeInsets = UIEdgeInsetsMake(-10, -10, -10, -10);

//        _inputTextBkgImage = [[UIImageView alloc] initWithFrame:CGRectZero];
//        [_inputTextBkgImage setImage:[[UIImage imageNamed:@"icon_input_text_bg_"] resizableImageWithCapInsets:UIEdgeInsetsMake(15,80,15,80) resizingMode:UIImageResizingModeStretch]];

        //: _inputTextView = [[AAAGrowingTextView alloc] initWithFrame:CGRectZero];
        _inputTextView = [[TeamGrowingView alloc] initWithFrame:CGRectZero];
        //: _inputTextView.font = [UIFont systemFontOfSize:14.0f];
        _inputTextView.font = [UIFont systemFontOfSize:14.0f];
        //: _inputTextView.maxNumberOfLines = _maxNumberOfInputLines?:4;
        _inputTextView.maxNumberOfLines = _maxNumberOfInputLines?:4;
        //: _inputTextView.minNumberOfLines = 1;
        _inputTextView.minNumberOfLines = 1;
        //: _inputTextView.textColor = [UIColor blackColor];
        _inputTextView.textColor = [UIColor blackColor];
        //: _inputTextView.backgroundColor = [UIColor clearColor];
        _inputTextView.backgroundColor = [UIColor clearColor];
        //: _inputTextView.nim_size = [_inputTextView intrinsicContentSize];
        _inputTextView.nim_size = [_inputTextView intrinsicContentSize];
        //: _inputTextView.layer.cornerRadius = _inputTextView.nim_height/2;
        _inputTextView.layer.cornerRadius = _inputTextView.nim_height/2;

        //: _inputTextView.textViewDelegate = self;
        _inputTextView.textViewDelegate = self;
//        _inputTextView.returnKeyType = UIReturnKeySend;
        //: _inputTextView.returnKeyType = UIReturnKeyDefault;
        _inputTextView.returnKeyType = UIReturnKeyDefault;
        //: [self addSubview:self.inputTextView];
        [self addSubview:self.inputTextView];

        //顶部分割线
//        UIView *sep = [[UIView alloc] initWithFrame:CGRectZero];
//        sep.backgroundColor = [UIColor lightGrayColor];
//        sep.nim_size = CGSizeMake(self.nim_width, .5f);
//        sep.autoresizingMask = UIViewAutoresizingFlexibleWidth;
//        [self addSubview:sep];
//
//        //底部分割线
//        _bottomSep = [[UIView alloc] initWithFrame:CGRectZero];
//        _bottomSep.backgroundColor = [UIColor lightGrayColor];
//        [self addSubview:_bottomSep];

        //: self.types = @[
        self.types = @[
//            @(UserInputBarItemTypeMore),
//            @(UserInputBarItemTypeEmoticon),
//                         @(UserInputBarItemTypeVoice),
                         //: @(UserInputBarItemTypeTextAndRecord),
                         @(UserInputBarItemTypeTextAndRecord),
                         //: @(UserInputBarItemTypeSend),
                         @(UserInputBarItemTypeSend),

                       //: ];
                       ];



    }
    //: return self;
    return self;
}



//: - (void)setInputBarItemTypes:(NSArray<NSNumber *> *)types{
- (void)setInputBarItemTypes:(NSArray<NSNumber *> *)types{
    //: self.types = types;
    self.types = types;
    //: [self setNeedsLayout];
    [self setNeedsLayout];
}

//: - (NSString *)contentText
- (NSString *)contentText
{
    //: return self.inputTextView.text;
    return self.inputTextView.text;
}

//: - (void)setContentText:(NSString *)contentText
- (void)setContentText:(NSString *)contentText
{
    //: self.inputTextView.text = contentText;
    self.inputTextView.text = contentText;
}

//: - (NSArray *)inputBarItemTypes
- (NSArray *)inputBarItemTypes
{
    //: return self.types;
    return self.types;
}


//: - (CGSize)sizeThatFits:(CGSize)size
- (CGSize)sizeThatFits:(CGSize)size
{
    //: CGFloat viewHeight = 0.0f;
    CGFloat viewHeight = 0.0f;
    //: if (self.status == NIMInputStatusAudio) {
    if (self.status == NIMInputStatusAudio) {
        //: viewHeight = 51+50;
        viewHeight = 51+50;
        //: self.emoticonBtn.hidden = NO;
        self.emoticonBtn.hidden = NO;
        //: self.albunBtn.hidden = NO;
        self.albunBtn.hidden = NO;
        //: self.cameraBtn.hidden = NO;
        self.cameraBtn.hidden = NO;
        //: self.voiceButton.hidden = NO;
        self.voiceButton.hidden = NO;
    //: }else if(self.status == NIMInputStatusText){
    }else if(self.status == NIMInputStatusText){
        //算出 TextView 的宽度
        //: [self adjustTextViewWidth:size.width];
        [self along:size.width];
        // TextView 自适应高度
        //: [self.inputTextView layoutIfNeeded];
        [self.inputTextView layoutIfNeeded];
        //: viewHeight = (int)self.inputTextView.frame.size.height;
        viewHeight = (int)self.inputTextView.frame.size.height;
        //得到 ToolBar 自身高度

        //: if([BBBKitKeyboardInfo instance].keyboardHeight){
        if([TeamInfo margin].keyboardHeight){
            //: viewHeight = viewHeight + 2 * self.spacing + 2 * self.textViewPadding;
            viewHeight = viewHeight + 2 * self.evidenceCell + 2 * self.from;
            //: self.emoticonBtn.hidden = YES;
            self.emoticonBtn.hidden = YES;
            //: self.albunBtn.hidden = YES;
            self.albunBtn.hidden = YES;
            //: self.cameraBtn.hidden = YES;
            self.cameraBtn.hidden = YES;
            //: self.voiceButton.hidden = YES;
            self.voiceButton.hidden = YES;
        //: }else{
        }else{
            //: viewHeight = viewHeight + 2 * self.spacing + 2 * self.textViewPadding +50;
            viewHeight = viewHeight + 2 * self.evidenceCell + 2 * self.from +50;
            //: self.emoticonBtn.hidden = NO;
            self.emoticonBtn.hidden = NO;
            //: self.albunBtn.hidden = NO;
            self.albunBtn.hidden = NO;
            //: self.cameraBtn.hidden = NO;
            self.cameraBtn.hidden = NO;
            //: self.voiceButton.hidden = NO;
            self.voiceButton.hidden = NO;
        }

    //: }else {
    }else {
        //: viewHeight = 51;
        viewHeight = 51;
        //: self.emoticonBtn.hidden = YES;
        self.emoticonBtn.hidden = YES;
        //: self.albunBtn.hidden = YES;
        self.albunBtn.hidden = YES;
        //: self.cameraBtn.hidden = YES;
        self.cameraBtn.hidden = YES;
        //: self.voiceButton.hidden = YES;
        self.voiceButton.hidden = YES;
    }

    //: return CGSizeMake(size.width,viewHeight);
    return CGSizeMake(size.width,viewHeight);
}

//: - (void)adjustTextViewWidth:(CGFloat)width
- (void)along:(CGFloat)width
{
//    CGFloat textViewWidth = 0;
//    for (NSNumber *type in self.types) {
//        if (type.integerValue == UserInputBarItemTypeTextAndRecord) {
//            continue;
//        }
//        UIView *view = [self subViewForType:type.integerValue];
//        textViewWidth += view.nim_width;
//    }
//    textViewWidth += (self.spacing * (self.types.count + 1));
    //: self.inputTextView.nim_width = width - 100 - 4*self.textViewPadding;
    self.inputTextView.nim_width = width - 100 - 4*self.from;
}


//: - (void)layoutSubviews{
- (void)layoutSubviews{
    //: [super layoutSubviews];
    [super layoutSubviews];

//    if ([self.types containsObject:@(UserInputBarItemTypeTextAndRecord)]) {
//        self.inputTextBkgImage.nim_width  = self.inputTextView.nim_width  + 2 * self.textViewPadding;
//        self.inputTextBkgImage.nim_height = self.inputTextView.nim_height + 2 * self.textViewPadding;
//    }
//    CGFloat left = 0;
//    for (NSNumber *type in self.types) {
//        UIView *view  = [self subViewForType:type.integerValue];
//        if (!view.superview)
//        {
//            [self addSubview:view];
//        }
//
//        view.nim_left = left + self.spacing;
//        view.nim_centerY = self.nim_height * .5f;
//        left = view.nim_right;
//    }
//
//    [self adjustTextAndRecordView];

//    //底部分割线
//    CGFloat sepHeight = .5f;
//    _bottomSep.nim_size     = CGSizeMake(self.nim_width, sepHeight);
//    _bottomSep.nim_bottom   = self.nim_height - sepHeight;

    //: self.sendButton.frame = CGRectMake([[UIScreen mainScreen] bounds].size.width-15-25, self.spacing, 25, 25);
    self.sendButton.frame = CGRectMake([[UIScreen mainScreen] bounds].size.width-15-25, self.evidenceCell, 25, 25);
    //: self.emoticonBtn2.frame = CGRectMake([[UIScreen mainScreen] bounds].size.width-15-25-25-15, self.spacing, 25, 25);
    self.emoticonBtn2.frame = CGRectMake([[UIScreen mainScreen] bounds].size.width-15-25-25-15, self.evidenceCell, 25, 25);

    //: self.inputTextView.nim_left = self.spacing;
    self.inputTextView.nim_left = self.evidenceCell;
    //: self.inputTextView.nim_top = self.spacing;
    self.inputTextView.nim_top = self.evidenceCell;

    //: self.sendButton.nim_centerY = self.inputTextView.nim_centerY;
    self.sendButton.nim_centerY = self.inputTextView.nim_centerY;
    //: self.emoticonBtn2.nim_centerY = self.inputTextView.nim_centerY;
    self.emoticonBtn2.nim_centerY = self.inputTextView.nim_centerY;

    //: CGFloat width = [[UIScreen mainScreen] bounds].size.width/4;
    CGFloat width = [[UIScreen mainScreen] bounds].size.width/4;
    //: CGFloat spaeHeight = 12;
    CGFloat spaeHeight = 12;
    //: self.emoticonBtn.frame = CGRectMake(0, self.inputTextView.bottom + spaeHeight, width, 32);
    self.emoticonBtn.frame = CGRectMake(0, self.inputTextView.bottom + spaeHeight, width, 32);
    //: self.albunBtn.frame = CGRectMake(width, self.inputTextView.bottom + spaeHeight, width, 32);
    self.albunBtn.frame = CGRectMake(width, self.inputTextView.bottom + spaeHeight, width, 32);
    //: self.cameraBtn.frame = CGRectMake(2*width, self.inputTextView.bottom + spaeHeight, width, 32);
    self.cameraBtn.frame = CGRectMake(2*width, self.inputTextView.bottom + spaeHeight, width, 32);
    //: self.voiceButton.frame = CGRectMake(3*width, self.inputTextView.bottom + spaeHeight, width, 32);
    self.voiceButton.frame = CGRectMake(3*width, self.inputTextView.bottom + spaeHeight, width, 32);



}


//: - (void)adjustTextAndRecordView
- (void)sessionMin
{
    //: if ([self.types containsObject:@(UserInputBarItemTypeTextAndRecord)])
    if ([self.types containsObject:@(UserInputBarItemTypeTextAndRecord)])
    {
//        self.inputTextView.center  = self.inputTextBkgImage.center;

        //: if (!self.inputTextView.superview)
        if (!self.inputTextView.superview)
        {
            //输入框
            //: [self addSubview:self.inputTextView];
            [self addSubview:self.inputTextView];
        }
//        if (!self.recordButton.superview)
//        {
//            //中间点击录音按钮
//            self.recordButton.frame    = self.inputTextBkgImage.frame;
//            [self addSubview:self.recordButton];
//        }
    }
}

//: - (BOOL)showsKeyboard
- (BOOL)showsKeyboard
{
    //: return [self.inputTextView isFirstResponder];
    return [self.inputTextView isFirstResponder];
}


//: - (void)setShowsKeyboard:(BOOL)showsKeyboard
- (void)setShowsKeyboard:(BOOL)showsKeyboard
{
    //: if (showsKeyboard)
    if (showsKeyboard)
    {
        //: [self.inputTextView becomeFirstResponder];
        [self.inputTextView becomeFirstResponder];
//        self.emoticonBtn.hidden = YES;
//        self.albunBtn.hidden = YES;
//        self.cameraBtn.hidden = YES;
//        self.voiceButton.hidden = YES;
    }
    //: else
    else
    {
        //: [self.inputTextView resignFirstResponder];
        [self.inputTextView resignFirstResponder];
//        self.emoticonBtn.hidden = NO;
//        self.albunBtn.hidden = NO;
//        self.cameraBtn.hidden = NO;
//        self.voiceButton.hidden = NO;
    }
}


//: - (void)update:(NIMInputStatus)status
- (void)item:(NIMInputStatus)status
{
    //: self.status = status;
    self.status = status;
    //: [self sizeToFit];
    [self sizeToFit];

    //: if (status == NIMInputStatusText || status == NIMInputStatusMore)
    if (status == NIMInputStatusText || status == NIMInputStatusMore)
    {
//        [self.recordButton setHidden:YES];
        //: [self.inputTextView setHidden:NO];
        [self.inputTextView setHidden:NO];
//        [self.inputTextBkgImage setHidden:NO];
//        [self updateVoiceBtnImages:YES];
//        [self updateEmotAndTextBtnImages:YES];
        //: [self updateEmotAndTextBtnImages:YES];
        [self green:YES];
    }
    //: else if(status == NIMInputStatusAudio)
    else if(status == NIMInputStatusAudio)
    {
//        [self.recordButton setHidden:NO];
        //: [self.inputTextView setHidden:YES];
        [self.inputTextView setHidden:YES];
//        [self.inputTextBkgImage setHidden:YES];
//        [self updateVoiceBtnImages:NO];
        //: [self updateEmotAndTextBtnImages:YES];
        [self green:YES];
    }
//    else if (status == NIMInputStatusEmoticon)
//    {
//        [self.inputTextView setHidden:NO];
//        [self updateEmotAndTextBtnImages:YES];
//    }
    //: else
    else
    {
//        [self.recordButton setHidden:YES];
        //: [self.inputTextView setHidden:NO];
        [self.inputTextView setHidden:NO];
//        [self.inputTextBkgImage setHidden:NO];
//        [self updateVoiceBtnImages:YES];
        //: [self updateEmotAndTextBtnImages:NO];
        [self green:NO];
    }
}

//: - (void)updateVoiceBtnImages:(BOOL)selected
- (void)tip:(BOOL)selected
{
    //: [self.voiceButton setImage:selected?[UIImage imageNamed:@"icon_toolview_voice_normal"]:[UIImage imageNamed:@"icon_toolview_keyboard_normal"] forState:UIControlStateNormal];
    [self.voiceButton setImage:selected?[UIImage imageNamed:StringFromSignerData(&str_weaponViewName)]:[UIImage imageNamed:StringFromSignerData(&str_nessValue)] forState:UIControlStateNormal];
}

//: - (void)updateEmotAndTextBtnImages:(BOOL)selected
- (void)green:(BOOL)selected
{
    //: [self.emoticonBtn2 setImage:selected?[UIImage imageNamed:@"icon_toolview_emotion2_normal"]:[UIImage imageNamed:@"icon_toolview_keybord"] forState:UIControlStateNormal];
    [self.emoticonBtn2 setImage:selected?[UIImage imageNamed:StringFromSignerData(&str_immuneViewName)]:[UIImage imageNamed:StringFromSignerData(&str_administrativeName)] forState:UIControlStateNormal];
}


//: #pragma mark - AAAGrowingTextViewDelegate
#pragma mark - SpectralColorDelegate
//: - (BOOL)shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)replacementText
- (BOOL)sparkling:(NSRange)range content:(NSString *)replacementText
{
    //: BOOL should = YES;
    BOOL should = YES;
    //: if ([self.delegate respondsToSelector:@selector(shouldChangeTextInRange:replacementText:)]) {
    if ([self.delegate respondsToSelector:@selector(sparkling:content:)]) {
        //: should = [self.delegate shouldChangeTextInRange:range replacementText:replacementText];
        should = [self.delegate sparkling:range content:replacementText];
    }
    //: return should;
    return should;
}


//: - (BOOL)textViewShouldBeginEditing:(AAAGrowingTextView *)growingTextView
- (BOOL)maxed:(TeamGrowingView *)growingTextView
{
    //: BOOL should = YES;
    BOOL should = YES;
    //: if ([self.delegate respondsToSelector:@selector(textViewShouldBeginEditing)]) {
    if ([self.delegate respondsToSelector:@selector(viewTo)]) {
        //: should = [self.delegate textViewShouldBeginEditing];
        should = [self.delegate viewTo];
    }
    //: return should;
    return should;
}

//: - (void)textViewDidEndEditing:(AAAGrowingTextView *)growingTextView
- (void)infoing:(TeamGrowingView *)growingTextView
{
    //: if ([self.delegate respondsToSelector:@selector(textViewDidEndEditing)]) {
    if ([self.delegate respondsToSelector:@selector(imageTingWindow)]) {
        //: [self.delegate textViewDidEndEditing];
        [self.delegate imageTingWindow];
    }
}


//: - (void)textViewDidChange:(AAAGrowingTextView *)growingTextView
- (void)bars:(TeamGrowingView *)growingTextView
{
    //: if ([self.delegate respondsToSelector:@selector(textViewDidChange)]) {
    if ([self.delegate respondsToSelector:@selector(cookieDomainChange)]) {
        //: [self.delegate textViewDidChange];
        [self.delegate cookieDomainChange];
    }

    //: if (_inputTextView.text.length > 0) {
    if (_inputTextView.text.length > 0) {
        //: self.sendButton.hidden = NO;
        self.sendButton.hidden = NO;
        //: self.emoticonBtn2.hidden = NO;
        self.emoticonBtn2.hidden = NO;
    //: } else {
    } else {
        //: self.sendButton.hidden = YES;
        self.sendButton.hidden = YES;
        //: self.emoticonBtn2.hidden = YES;
        self.emoticonBtn2.hidden = YES;
    }
}

//: - (void)willChangeHeight:(CGFloat)height
- (void)changeHeight:(CGFloat)height
{
    //: CGFloat toolBarHeight = height + 2 * self.spacing +50 ;
    CGFloat toolBarHeight = height + 2 * self.evidenceCell +50 ;
    //: if ([self.delegate respondsToSelector:@selector(toolBarWillChangeHeight:)]) {
    if ([self.delegate respondsToSelector:@selector(toolHolder:)]) {
        //: [self.delegate toolBarWillChangeHeight:toolBarHeight];
        [self.delegate toolHolder:toolBarHeight];
    }
}

//: - (void)didChangeHeight:(CGFloat)height
- (void)attacks:(CGFloat)height
{
    //去掉了+50
    //: self.nim_height = height + 2 * self.spacing + 2 * self.textViewPadding +50;
    self.nim_height = height + 2 * self.evidenceCell + 2 * self.from +50;
//    self.nim_height = height + 2 * self.spacing + 2 * self.textViewPadding ;
    //: if ([self.delegate respondsToSelector:@selector(toolBarDidChangeHeight:)]) {
    if ([self.delegate respondsToSelector:@selector(barroomTip:)]) {
        //: [self.delegate toolBarDidChangeHeight:self.nim_height];
        [self.delegate barroomTip:self.nim_height];
    }
}


//: #pragma mark - Get
#pragma mark - Get
//: - (UIView *)subViewForType:(UserInputBarItemType)type{
- (UIView *)center:(UserInputBarItemType)type{
    //: if (!_dict) {
    if (!_dict) {
        //: _dict = @{
        _dict = @{
                  //: @(UserInputBarItemTypeVoice) : self.voiceButton,
                  @(UserInputBarItemTypeVoice) : self.voiceButton,
//                  @(UserInputBarItemTypeTextAndRecord)  : self.inputTextBkgImage,
                  //: @(UserInputBarItemTypeEmoticon) : self.emoticonBtn,
                  @(UserInputBarItemTypeEmoticon) : self.emoticonBtn,
//                  @(UserInputBarItemTypeMore)     : self.moreMediaBtn,
                  //: @(UserInputBarItemTypeSend) : self.sendButton,
                  @(UserInputBarItemTypeSend) : self.sendButton,
                //: };
                };
    }
    //: return _dict[@(type)];
    return _dict[@(type)];
}

//: - (CGFloat)spacing{
- (CGFloat)evidenceCell{
    //: return 6.f;
    return 6.f;
}

//: - (CGFloat)textViewPadding
- (CGFloat)from
{
    //: return 3.f;
    return 3.f;
}


//: @end
@end


//: @implementation AAAInputToolBar(InputText)
@implementation DistanceView(InputText)

//: - (NSRange)selectedRange
- (NSRange)messageKeyRange
{
    //: return self.inputTextView.selectedRange;
    return self.inputTextView.selectedRange;
}

//: - (void)setPlaceHolder:(NSString *)placeHolder
- (void)setHolder:(NSString *)placeHolder
{
    //: self.inputTextView.placeholderAttributedText = [[NSAttributedString alloc] initWithString:placeHolder attributes:@{NSForegroundColorAttributeName:[UIColor grayColor]}];
    self.inputTextView.placeholderAttributedText = [[NSAttributedString alloc] initWithString:placeHolder attributes:@{NSForegroundColorAttributeName:[UIColor grayColor]}];
}

//: - (void)setPlaceHolder:(NSString *)placeHolder color:(UIColor *)placeholderColor
- (void)nearTone:(NSString *)placeHolder straddle:(UIColor *)placeholderColor
{
    //: self.inputTextView.placeholderAttributedText = [[NSAttributedString alloc] initWithString:placeHolder attributes:@{NSForegroundColorAttributeName:placeholderColor}];
    self.inputTextView.placeholderAttributedText = [[NSAttributedString alloc] initWithString:placeHolder attributes:@{NSForegroundColorAttributeName:placeholderColor}];
}

//: - (void)insertText:(NSString *)text
- (void)everyPicture:(NSString *)text
{
//    NSRange range = self.inputTextView.selectedRange;
//    NSString *replaceText = [self.inputTextView.text stringByReplacingCharactersInRange:range withString:text];
//    range = NSMakeRange(range.location + text.length, 0);
//    self.inputTextView.text = replaceText;
//    self.inputTextView.selectedRange = range;

    //: [self insertAttributedText:text withEmoji:NO];
    [self sessionEmoji:text table:NO];
}

//: - (void)deleteText:(NSRange)range
- (void)accumulation:(NSRange)range
{
    //: NSString *text = self.contentText;
    NSString *text = self.contentText;
    //: if (range.location + range.length <= [text length]
    if (range.location + range.length <= [text length]
        //: && range.location != NSNotFound && range.length != 0)
        && range.location != NSNotFound && range.length != 0)
    {
        //: NSString *newText = [text stringByReplacingCharactersInRange:range withString:@""];
        NSString *newText = [text stringByReplacingCharactersInRange:range withString:@""];
        //: NSRange newSelectRange = NSMakeRange(range.location, 0);
        NSRange newSelectRange = NSMakeRange(range.location, 0);
        //: [self.inputTextView setText:newText];
        [self.inputTextView setText:newText];
        //: self.inputTextView.selectedRange = newSelectRange;
        self.inputTextView.selectedRange = newSelectRange;
    }
}

//// 2022年08月25日 emoji处理
//: - (void)insertAttributedText:(NSString *)text withEmoji:(BOOL)isEmoji {
- (void)sessionEmoji:(NSString *)text table:(BOOL)isEmoji {

//    if (text.length > 0) {
//        self.inputTextView.placeholderAttributedText = nil;
//    }
    //: if (text.length > 0) {
    if (text.length > 0) {
        //: self.sendButton.hidden = NO;
        self.sendButton.hidden = NO;
        //: self.emoticonBtn2.hidden = NO;
        self.emoticonBtn2.hidden = NO;
        //: self.inputTextView.placeholderAttributedText = nil;
        self.inputTextView.placeholderAttributedText = nil;
    //: } else {
    } else {
        //: self.sendButton.hidden = YES;
        self.sendButton.hidden = YES;
        //: self.emoticonBtn2.hidden = YES;
        self.emoticonBtn2.hidden = YES;
    }

    //: if (isEmoji) {
    if (isEmoji) {

        //: NSRange range = self.inputTextView.selectedRange;
        NSRange range = self.inputTextView.selectedRange;
        //: self.inputTextView.attributedText = [self nim_setText:text];
        self.inputTextView.attributedText = [self tvText:text];
        //: range = NSMakeRange(range.location + 2, 0);
        range = NSMakeRange(range.location + 2, 0);
        //: self.inputTextView.selectedRange = range;
        self.inputTextView.selectedRange = range;
        //: [self.inputTextView scrollRangeToVisible:self.inputTextView.selectedRange];
        [self.inputTextView nameObject:self.inputTextView.selectedRange];

        //: return;
        return;
    }


    //: NSRange range = self.inputTextView.selectedRange;
    NSRange range = self.inputTextView.selectedRange;
    //: NSString *replaceText = [self.inputTextView.text stringByReplacingCharactersInRange:range withString:text];
    NSString *replaceText = [self.inputTextView.text stringByReplacingCharactersInRange:range withString:text];
    //: range = NSMakeRange(range.location + text.length, 0);
    range = NSMakeRange(range.location + text.length, 0);

    //: NSMutableAttributedString *attributedStringM = [[NSMutableAttributedString alloc] initWithString:replaceText];
    NSMutableAttributedString *attributedStringM = [[NSMutableAttributedString alloc] initWithString:replaceText];
    //: self.inputTextView.attributedText = attributedStringM;
    self.inputTextView.attributedText = attributedStringM;
    //: self.inputTextView.selectedRange = range;
    self.inputTextView.selectedRange = range;
}

//: - (NSMutableAttributedString *)nim_setText:(NSString *)text
- (NSMutableAttributedString *)tvText:(NSString *)text
{

    //: NSMutableAttributedString *attributedStringM = [[NSMutableAttributedString alloc] initWithAttributedString:self.inputTextView.attributedText];
    NSMutableAttributedString *attributedStringM = [[NSMutableAttributedString alloc] initWithAttributedString:self.inputTextView.attributedText];

    //: NIMInputEmoticon *emoticon = [[AAAInputEmoticonManager sharedManager] emoticonByTag:text];
    LiquidEcstasyEmoticon *emoticon = [[DataOf telegram] popAt:text];
    //: UIImage *image = nil;
    UIImage *image = nil;

    //: if(emoticon.filename &&
    if(emoticon.filename &&
       //: emoticon.filename.length>0 &&
       emoticon.filename.length>0 &&
        //: (image = [UIImage nim_emoticonInKit:emoticon.filename])!= nil) {
        (image = [UIImage pickings:emoticon.filename])!= nil) {

        //: NSTextAttachment *attachment = [[NSTextAttachment alloc] init];
        NSTextAttachment *attachment = [[NSTextAttachment alloc] init];
        //: attachment.image = image;
        attachment.image = image;
        //: CGFloat emojiHeight = _inputTextView.font.lineHeight;
        CGFloat emojiHeight = _inputTextView.font.lineHeight;
        //: attachment.bounds = CGRectMake(0, _inputTextView.font.descender, emojiHeight, emojiHeight);
        attachment.bounds = CGRectMake(0, _inputTextView.font.descender, emojiHeight, emojiHeight);

        //: NSMutableAttributedString *emojiAtt = [[NSMutableAttributedString alloc] initWithString:YYTextAttachmentToken];
        NSMutableAttributedString *emojiAtt = [[NSMutableAttributedString alloc] initWithString:YYTextAttachmentToken];
        //: [emojiAtt appendAttributedString:[[NSAttributedString alloc] initWithString:@" "]];
        [emojiAtt appendAttributedString:[[NSAttributedString alloc] initWithString:@" "]];
        //: [emojiAtt yy_setAttribute:NSKernAttributeName value:@(-1)];
        [emojiAtt yy_setAttribute:NSKernAttributeName value:@(-1)];
        //: [emojiAtt yy_setAttachment:attachment range:emojiAtt.yy_rangeOfAll];
        [emojiAtt yy_setAttachment:attachment range:emojiAtt.yy_rangeOfAll];

        //: [attributedStringM insertAttributedString:emojiAtt atIndex:_inputTextView.selectedRange.location];
        [attributedStringM insertAttributedString:emojiAtt atIndex:_inputTextView.selectedRange.location];

        //: SNTextHighlight *highlight = [[SNTextHighlight alloc] init];
        ImageNameHighlight *highlight = [[ImageNameHighlight alloc] init];
        //: highlight.type = SNTextHighlightTypeEmoji;
        highlight.type = SNTextHighlightTypeEmoji;
        //: highlight.text = emoticon.tag;
        highlight.text = emoticon.tag;

        //: [attributedStringM yy_setTextHighlight:highlight range:NSMakeRange(_inputTextView.selectedRange.location, emojiAtt.length)];
        [attributedStringM yy_setTextHighlight:highlight range:NSMakeRange(_inputTextView.selectedRange.location, emojiAtt.length)];
        //: attributedStringM.yy_font = _inputTextView.font;
        attributedStringM.yy_font = _inputTextView.font;

    }

    //: else {
    else {

        //: NSMutableAttributedString *emojiAtt = [[NSMutableAttributedString alloc] initWithString:emoticon.unicode];
        NSMutableAttributedString *emojiAtt = [[NSMutableAttributedString alloc] initWithString:emoticon.unicode];
        //: [emojiAtt yy_setAttribute:NSKernAttributeName value:@(-1)];
        [emojiAtt yy_setAttribute:NSKernAttributeName value:@(-1)];

        //: [attributedStringM insertAttributedString:emojiAtt atIndex:_inputTextView.selectedRange.location];
        [attributedStringM insertAttributedString:emojiAtt atIndex:_inputTextView.selectedRange.location];

        //: SNTextHighlight *highlight = [[SNTextHighlight alloc] init];
        ImageNameHighlight *highlight = [[ImageNameHighlight alloc] init];
        //: highlight.type = SNTextHighlightTypeEmoji;
        highlight.type = SNTextHighlightTypeEmoji;
        //: highlight.text = emoticon.tag;
        highlight.text = emoticon.tag;

        //: [attributedStringM yy_setTextHighlight:highlight range:NSMakeRange(_inputTextView.selectedRange.location, emojiAtt.length)];
        [attributedStringM yy_setTextHighlight:highlight range:NSMakeRange(_inputTextView.selectedRange.location, emojiAtt.length)];
        //: attributedStringM.yy_font = _inputTextView.font;
        attributedStringM.yy_font = _inputTextView.font;
    }

    //: return attributedStringM;
    return attributedStringM;
}

//: @end
@end

Byte *SignerDataToByte(SignerData *data) {
    if (data->balanceCurious) return data->earth;
    for (int i = 0; i < data->ourThree; i++) {
        data->earth[i] ^= data->limpArtistic;
    }
    data->earth[data->ourThree] = 0;
    data->balanceCurious = true;
	if (data->ourThree >= 2) {
		data->goalBalance = data->earth[0];
		data->indexAnimal = data->earth[1];
	}
    return data->earth;
}

NSString *StringFromSignerData(SignerData *data) {
    return [NSString stringWithUTF8String:(char *)SignerDataToByte(data)];
}
