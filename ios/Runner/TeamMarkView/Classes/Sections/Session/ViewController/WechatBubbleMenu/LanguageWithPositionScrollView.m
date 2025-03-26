
#import <Foundation/Foundation.h>

NSString *StringFromByProduceData(Byte *data);


//: menu_copy
Byte str_adderHandleValue[] = {55, 9, 13, 8, 32, 164, 95, 50, 122, 114, 123, 130, 108, 112, 124, 125, 134, 111};


//: onTapMenuItemCopy:
Byte str_adderContent[] = {8, 18, 84, 6, 75, 90, 195, 194, 168, 181, 196, 161, 185, 194, 201, 157, 200, 185, 193, 151, 195, 196, 205, 142, 151};


//: #EFFDDE
Byte str_electricalText[] = {4, 7, 64, 4, 99, 133, 134, 134, 132, 132, 133, 204};

// __DEBUG__
// __CLOSE_PRINT__
//
//  LanguageWithPositionScrollView.m
//  JYImageTextCombine
//
//  Created by JackYoung on 2022/3/31.
//  Copyright © 2022 Jack Young. All rights reserved.
//

// __M_A_C_R_O__
//: #import "CCCTextView.h"
#import "LanguageWithPositionScrollView.h"
//: #import "CCCBubbleMenuView.h"
#import "InformationHideView.h"
//: #import "CCCBubbleButtonModel.h"
#import "FromMax.h"
//: #import "CCCAppDelegate.h"
#import "AppDelegate.h"
//: #import "BBBMediaItem.h"
#import "WithMin.h"

//: @interface CCCTextView()<UITextViewDelegate, UITextInputDelegate>
@interface LanguageWithPositionScrollView()<UITextViewDelegate, UITextInputDelegate>

//: @end
@end

//: @implementation CCCTextView
@implementation LanguageWithPositionScrollView

//: - (id)initWithFrame:(CGRect)frame {
- (id)initWithFrame:(CGRect)frame {
    //: self = [super initWithFrame:frame];
    self = [super initWithFrame:frame];
    //: if (self) {
    if (self) {
//        self.tintColor = RGB_COLOR_String(@"#EFFDDE");
        //: self.font = [UIFont systemFontOfSize:15];
        self.font = [UIFont systemFontOfSize:15];
        //: self.layer.cornerRadius = 5;
        self.layer.cornerRadius = 5;
        //: self.clipsToBounds = YES;
        self.clipsToBounds = YES;
        //: self.editable = YES;
        self.editable = YES;
        //: self.delegate = self;
        self.delegate = self;
        //: self.inputDelegate = self;
        self.inputDelegate = self;
        //: self.selectable = NO;
        self.selectable = NO;

        //: if (@available(iOS 17.0, *)) {
        if (@available(iOS 17.0, *)) {
            //: [self setTintColor:[UIColor colorWithHexString:@"#EFFDDE"]];
            [self setTintColor:[UIColor direction:StringFromByProduceData(str_electricalText)]];
        //: }else{
        }else{
            //: self.tintColor = [UIColor clearColor];
            self.tintColor = [UIColor clearColor];
        }


        //: [self addGestureRecognizer:[[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(onLongPress)]];
        [self addGestureRecognizer:[[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(statusLabel)]];
    }
    //: return self;
    return self;
}

//: - (void)onLongPress {
- (void)statusLabel {
//    [self performSelector:@selector(selectAll:) withObject:nil afterDelay:0.0];

    //: CGRect startRect = [self caretRectForPosition:[self selectedTextRange].start];
    CGRect startRect = [self caretRectForPosition:[self selectedTextRange].start];
    //: CGRect endRect = [self caretRectForPosition:[self selectedTextRange].end];
    CGRect endRect = [self caretRectForPosition:[self selectedTextRange].end];

    //: CGRect resultRect = CGRectZero;
    CGRect resultRect = CGRectZero;
    //: if (startRect.origin.y == endRect.origin.y) {
    if (startRect.origin.y == endRect.origin.y) {
        //: resultRect.origin.x = startRect.origin.x;
        resultRect.origin.x = startRect.origin.x;
        //: resultRect.origin.y = startRect.origin.y;
        resultRect.origin.y = startRect.origin.y;
        //: resultRect.size.width = endRect.origin.x - startRect.origin.x + 2;
        resultRect.size.width = endRect.origin.x - startRect.origin.x + 2;
        //: resultRect.size.height = startRect.size.height;
        resultRect.size.height = startRect.size.height;
    //: } else {
    } else {
        //: resultRect.origin.x = 0;
        resultRect.origin.x = 0;
        //: resultRect.origin.y = startRect.origin.y;
        resultRect.origin.y = startRect.origin.y;
        //: resultRect.size.width = self.frame.size.width;
        resultRect.size.width = self.frame.size.width;
        //: resultRect.size.height = endRect.origin.y - startRect.origin.y + endRect.size.height;
        resultRect.size.height = endRect.origin.y - startRect.origin.y + endRect.size.height;
    }

    //: CGRect tempRect = [self convertRect:resultRect toView:((CCCAppDelegate*)([UIApplication sharedApplication].delegate)).window];
    CGRect tempRect = [self convertRect:resultRect toView:((AppDelegate*)([UIApplication sharedApplication].delegate)).window];
    //: CGRect cursorStartRectToWindow = [self convertRect:startRect toView:((CCCAppDelegate*)([UIApplication sharedApplication].delegate)).window];
    CGRect cursorStartRectToWindow = [self convertRect:startRect toView:((AppDelegate*)([UIApplication sharedApplication].delegate)).window];

    //: [[CCCBubbleMenuView shareMenuView] showViewWithButtonModels:self.selectedAllRangeButtons cursorStartRect:cursorStartRectToWindow selectionTextRectInWindow:tempRect selectBlock:^(BBBMediaItem *item) {
    [[InformationHideView pastCard] imageWithSize:self.selectedAllRangeButtons panDraftCopyMonth:cursorStartRectToWindow button:tempRect place:^(WithMin *item) {

        //: !_selectBlock ? : _selectBlock(item);
        !_selectBlock ? : _selectBlock(item);

        //: [self hideTextSelection];
        [self image];
        //: [CCCBubbleMenuView.shareMenuView removeFromSuperview];
        [InformationHideView.pastCard removeFromSuperview];

    //: }];
    }];

}

//: - (BOOL)canPerformAction:(SEL)action withSender:(id)sender {
- (BOOL)canPerformAction:(SEL)action withSender:(id)sender {
    //: return NO;
    return NO;
}

//: - (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //: [self hideTextSelection];
    [self image];
    //: [CCCBubbleMenuView.shareMenuView removeFromSuperview];
    [InformationHideView.pastCard removeFromSuperview];
    //: [super touchesEnded:touches withEvent:event];
    [super touchesEnded:touches withEvent:event];
}

//: - (void)hideTextSelection {
- (void)image {
    //: [self setSelectedRange:NSMakeRange(0, 0)];
    [self setSelectedRange:NSMakeRange(0, 0)];//去掉选择的效果。
}

//: #pragma mark delegate
#pragma mark delegate
//: -(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    //: if ([text isEqualToString:@"\n"]) {
    if ([text isEqualToString:@"\n"]) {
        //: [textView resignFirstResponder];
        [textView resignFirstResponder];
//        [self.view endEditing:true];
        //: return NO;
        return NO;
    }

    //: return true;
    return true;
}

//: - (void)selectionWillChange:(id<UITextInput>)textInput {
- (void)selectionWillChange:(id<UITextInput>)textInput {
    //: NSLog(@"选择区域 _start_ 变化。。。隐藏");
}

//: - (void)selectionDidChange:(id<UITextInput>)textInput {
- (void)selectionDidChange:(id<UITextInput>)textInput {
    //: NSLog(@"选择区域 _end_ 变化。。。显示");
}

//: - (void)textWillChange:(nullable id <UITextInput>)textInput {
- (void)textWillChange:(nullable id <UITextInput>)textInput {

}

//: - (void)textDidChange:(nullable id <UITextInput>)textInput {
- (void)textDidChange:(nullable id <UITextInput>)textInput {

}

//: - (void)textViewDidChangeSelection:(UITextView *)textView {
- (void)textViewDidChangeSelection:(UITextView *)textView {
    //: NSLog(@"光标位置%ld——%ld",textView.selectedRange.location,textView.selectedRange.length);

    //: if (textView.selectedRange.length <= 0) {
    if (textView.selectedRange.length <= 0) {
        //隐藏
        //: [[CCCBubbleMenuView shareMenuView] removeFromSuperview];
        [[InformationHideView pastCard] removeFromSuperview];
        //: return;
        return;
    }

    //: CGRect startRect = [textView caretRectForPosition:[textView selectedTextRange].start];
    CGRect startRect = [textView caretRectForPosition:[textView selectedTextRange].start];
    //: CGRect endRect = [textView caretRectForPosition:[textView selectedTextRange].end];
    CGRect endRect = [textView caretRectForPosition:[textView selectedTextRange].end];
//    NSLog(@"__👂👂👂👂%.1f,%.1f,%.1f,%.1f",startRect.origin.x, startRect.origin.y, startRect.size.width, startRect.size.height);
//    NSLog(@"__👂👂👂👂%.1f,%.1f,%.1f,%.1f",endRect.origin.x, endRect.origin.y, endRect.size.width, endRect.size.height);

    //: CGRect resultRect = CGRectZero;
    CGRect resultRect = CGRectZero;
    //: if (startRect.origin.y == endRect.origin.y) {
    if (startRect.origin.y == endRect.origin.y) {
        //: resultRect.origin.x = startRect.origin.x;
        resultRect.origin.x = startRect.origin.x;
        //: resultRect.origin.y = startRect.origin.y;
        resultRect.origin.y = startRect.origin.y;
        //: resultRect.size.width = endRect.origin.x - startRect.origin.x + 2;
        resultRect.size.width = endRect.origin.x - startRect.origin.x + 2;
        //: resultRect.size.height = startRect.size.height;
        resultRect.size.height = startRect.size.height;
    //: } else {
    } else {
        //: resultRect.origin.x = 0;
        resultRect.origin.x = 0;
        //: resultRect.origin.y = startRect.origin.y;
        resultRect.origin.y = startRect.origin.y;
        //: resultRect.size.width = textView.frame.size.width;
        resultRect.size.width = textView.frame.size.width;
        //: resultRect.size.height = endRect.origin.y - startRect.origin.y + endRect.size.height;
        resultRect.size.height = endRect.origin.y - startRect.origin.y + endRect.size.height;
    }

//    _selectedTopView.frame = resultRect;

    //: CGRect tempRect = [self convertRect:resultRect toView:((CCCAppDelegate*)([UIApplication sharedApplication].delegate)).window];
    CGRect tempRect = [self convertRect:resultRect toView:((AppDelegate*)([UIApplication sharedApplication].delegate)).window];
    //: CGRect cursorStartRectToWindow = [self convertRect:startRect toView:((CCCAppDelegate*)([UIApplication sharedApplication].delegate)).window];
    CGRect cursorStartRectToWindow = [self convertRect:startRect toView:((AppDelegate*)([UIApplication sharedApplication].delegate)).window];

    //: if (textView.selectedRange.length > 0) {
    if (textView.selectedRange.length > 0) {
        //全部选中的时候内容显示的不一样。
        //: if (textView.selectedRange.length == textView.text.length) {
        if (textView.selectedRange.length == textView.text.length) {

            //: [[CCCBubbleMenuView shareMenuView] showViewWithButtonModels:self.selectedAllRangeButtons cursorStartRect:cursorStartRectToWindow selectionTextRectInWindow:tempRect selectBlock:^(BBBMediaItem *item) {
            [[InformationHideView pastCard] imageWithSize:self.selectedAllRangeButtons panDraftCopyMonth:cursorStartRectToWindow button:tempRect place:^(WithMin *item) {

                //: !_selectBlock ? : _selectBlock(item);
                !_selectBlock ? : _selectBlock(item);

                //: [self hideTextSelection];
                [self image];
                //: [CCCBubbleMenuView.shareMenuView removeFromSuperview];
                [InformationHideView.pastCard removeFromSuperview];

            //: }];
            }];
        //: } else {
        } else {

            //: [[CCCBubbleMenuView shareMenuView] showViewWithButtonModels:self.selectedPartRangeButtons cursorStartRect:cursorStartRectToWindow selectionTextRectInWindow:tempRect selectBlock:^(BBBMediaItem *item) {
            [[InformationHideView pastCard] imageWithSize:self.selectedPartRangeButtons panDraftCopyMonth:cursorStartRectToWindow button:tempRect place:^(WithMin *item) {

                //: !_selectBlock ? : _selectBlock(item);
                !_selectBlock ? : _selectBlock(item);

                //: [self hideTextSelection];
                [self image];
                //: [CCCBubbleMenuView.shareMenuView removeFromSuperview];
                [InformationHideView.pastCard removeFromSuperview];

            //: }];
            }];
        }
    }
}

//: - (BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange interaction:(UITextItemInteraction)interaction API_AVAILABLE(ios(10.0)) {
- (BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange interaction:(UITextItemInteraction)interaction API_AVAILABLE(ios(10.0)) {
    //: return YES;
    return YES;
}

//: - (void)genMediaButtonsWithMessage:(NIMMessage *)message {
- (void)infoMonth:(NIMMessage *)message {

    //: NSMutableArray *selectedAllRangeButtons = [NSMutableArray array];
    NSMutableArray *selectedAllRangeButtons = [NSMutableArray array];
    //: NSMutableArray *selectedPartRangeButtons = [NSMutableArray array];
    NSMutableArray *selectedPartRangeButtons = [NSMutableArray array];

    //: NSArray *items;
    NSArray *items;
    //: if (!self.config)
    if (!self.config)
    {
        //: items = [[AppleProjectKit sharedKit].config defaultMenuItemsWithMessage:message];
        items = [[Indicator reach].config keySize:message];
    }
    //: else if([self.config respondsToSelector:@selector(menuItemsWithMessage:)])
    else if([self.config respondsToSelector:@selector(oned:)])
    {
        //: items = [self.config menuItemsWithMessage:message];
        items = [self.config oned:message];
    }
    //: [items enumerateObjectsUsingBlock:^(BBBMediaItem *item, NSUInteger idx, BOOL *stop) {
    [items enumerateObjectsUsingBlock:^(WithMin *item, NSUInteger idx, BOOL *stop) {

        //: CCCBubbleButtonModel *model = [[CCCBubbleButtonModel alloc] init];
        FromMax *model = [[FromMax alloc] init];
        //: model.normalImage = item.normalImage;
        model.normalImage = item.normalImage;
        //: model.name = item.title;
        model.name = item.title;
        //: model.item = item;
        model.item = item;

        //: [selectedAllRangeButtons addObject:model];
        [selectedAllRangeButtons addObject:model];

        //: if (item.selctor == @selector(onTapMenuItemCopy:)) {
        if (item.selctor == @selector(onTapMenuItemCopy:)) {
            //: [selectedPartRangeButtons addObject:model];
            [selectedPartRangeButtons addObject:model];
        }
    //: }];
    }];

    //: self.selectedAllRangeButtons = selectedAllRangeButtons;
    self.selectedAllRangeButtons = selectedAllRangeButtons;
    //: self.selectedPartRangeButtons = selectedPartRangeButtons;
    self.selectedPartRangeButtons = selectedPartRangeButtons;

}


//: - (void)new_genMediaButton {
- (void)genBubble {

    //: NSMutableArray *selectedAllRangeButtons = [NSMutableArray array];
    NSMutableArray *selectedAllRangeButtons = [NSMutableArray array];
    //: NSMutableArray *selectedPartRangeButtons = [NSMutableArray array];
    NSMutableArray *selectedPartRangeButtons = [NSMutableArray array];


    //: BBBMediaItem *copy = [BBBMediaItem item:@"onTapMenuItemCopy:"
    WithMin *copy = [WithMin more:StringFromByProduceData(str_adderContent)
                                //: normalImage:[UIImage imageNamed:@"menu_copy"]
                                title:[UIImage imageNamed:StringFromByProduceData(str_adderHandleValue)]
                              //: selectedImage:nil
                              back:nil
                                      //: title:[NTESLanguageManager getTextWithKey:@"复制"]];
                                      scheme:[MaxInformation off:@"复制"]];


    //: CCCBubbleButtonModel *model = [[CCCBubbleButtonModel alloc] init];
    FromMax *model = [[FromMax alloc] init];
    //: model.normalImage = copy.normalImage;
    model.normalImage = copy.normalImage;
    //: model.name = copy.title;
    model.name = copy.title;
    //: model.item = copy;
    model.item = copy;

    //: [selectedAllRangeButtons addObject:model];
    [selectedAllRangeButtons addObject:model];
    //: [selectedPartRangeButtons addObject:model];
    [selectedPartRangeButtons addObject:model];

    //: self.selectedAllRangeButtons = selectedAllRangeButtons;
    self.selectedAllRangeButtons = selectedAllRangeButtons;
    //: self.selectedPartRangeButtons = selectedPartRangeButtons;
    self.selectedPartRangeButtons = selectedPartRangeButtons;

}


//: @end
@end

Byte * ByProduceDataToCache(Byte *data) {
    int chantWort = data[0];
    int visionSuraImage = data[1];
    Byte leapGlobal = data[2];
    int soldierInsist = data[3];
    if (!chantWort) return data + soldierInsist;
    for (int i = soldierInsist; i < soldierInsist + visionSuraImage; i++) {
        int value = data[i] - leapGlobal;
        if (value < 0) {
            value += 256;
        }
        data[i] = value;
    }
    data[0] = 0;
    data[soldierInsist + visionSuraImage] = 0;
    return data + soldierInsist;
}

NSString *StringFromByProduceData(Byte *data) {
    return [NSString stringWithUTF8String:(char *)ByProduceDataToCache(data)];
}
