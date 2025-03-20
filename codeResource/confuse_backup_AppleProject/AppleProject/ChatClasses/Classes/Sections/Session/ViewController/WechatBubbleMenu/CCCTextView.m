//
//  CCCTextView.m
//  JYImageTextCombine
//
//  Created by JackYoung on 2022/3/31.
//  Copyright © 2022 Jack Young. All rights reserved.
//

#import "CCCTextView.h"
#import "CCCBubbleMenuView.h"
#import "CCCBubbleButtonModel.h"
#import "CCCAppDelegate.h"
#import "BBBMediaItem.h"

@interface CCCTextView()<UITextViewDelegate, UITextInputDelegate>

@end

@implementation CCCTextView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
//        self.tintColor = RGB_COLOR_String(@"#EFFDDE");
        self.font = [UIFont systemFontOfSize:15];
        self.layer.cornerRadius = 5;
        self.clipsToBounds = YES;
        self.editable = YES;
        self.delegate = self;
        self.inputDelegate = self;
        self.selectable = NO;
        
        if (@available(iOS 17.0, *)) {
            [self setTintColor:RGB_COLOR_String(@"#EFFDDE")];
        }else{
            self.tintColor = [UIColor clearColor];
        }
        
        
        [self addGestureRecognizer:[[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(onLongPress)]];
    }
    return self;
}

- (void)onLongPress {
//    [self performSelector:@selector(selectAll:) withObject:nil afterDelay:0.0];
    
    CGRect startRect = [self caretRectForPosition:[self selectedTextRange].start];
    CGRect endRect = [self caretRectForPosition:[self selectedTextRange].end];
    
    CGRect resultRect = CGRectZero;
    if (startRect.origin.y == endRect.origin.y) {
        resultRect.origin.x = startRect.origin.x;
        resultRect.origin.y = startRect.origin.y;
        resultRect.size.width = endRect.origin.x - startRect.origin.x + 2;
        resultRect.size.height = startRect.size.height;
    } else {
        resultRect.origin.x = 0;
        resultRect.origin.y = startRect.origin.y;
        resultRect.size.width = self.frame.size.width;
        resultRect.size.height = endRect.origin.y - startRect.origin.y + endRect.size.height;
    }
    
    CGRect tempRect = [self convertRect:resultRect toView:((CCCAppDelegate*)([UIApplication sharedApplication].delegate)).window];
    CGRect cursorStartRectToWindow = [self convertRect:startRect toView:((CCCAppDelegate*)([UIApplication sharedApplication].delegate)).window];
    
    [[CCCBubbleMenuView shareMenuView] showViewWithButtonModels:self.selectedAllRangeButtons cursorStartRect:cursorStartRectToWindow selectionTextRectInWindow:tempRect selectBlock:^(BBBMediaItem *item) {
        
        !_selectBlock ? : _selectBlock(item);

        [self hideTextSelection];
        [CCCBubbleMenuView.shareMenuView removeFromSuperview];

    }];
    
}

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender {
    return NO;
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self hideTextSelection];
    [CCCBubbleMenuView.shareMenuView removeFromSuperview];
    [super touchesEnded:touches withEvent:event];
}

- (void)hideTextSelection {
    [self setSelectedRange:NSMakeRange(0, 0)];//去掉选择的效果。
}

#pragma mark delegate
-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if ([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
//        [self.view endEditing:true];
        return NO;
    }

    return true;
}

- (void)selectionWillChange:(id<UITextInput>)textInput {
    NSLog(@"选择区域 _start_ 变化。。。隐藏");
}

- (void)selectionDidChange:(id<UITextInput>)textInput {
    NSLog(@"选择区域 _end_ 变化。。。显示");
}

- (void)textWillChange:(nullable id <UITextInput>)textInput {
    
}

- (void)textDidChange:(nullable id <UITextInput>)textInput {
    
}

- (void)textViewDidChangeSelection:(UITextView *)textView {
    NSLog(@"光标位置%ld——%ld",textView.selectedRange.location,textView.selectedRange.length);
        
    if (textView.selectedRange.length <= 0) {
        //隐藏
        [[CCCBubbleMenuView shareMenuView] removeFromSuperview];
        return;
    }
    
    CGRect startRect = [textView caretRectForPosition:[textView selectedTextRange].start];
    CGRect endRect = [textView caretRectForPosition:[textView selectedTextRange].end];
//    NSLog(@"__👂👂👂👂%.1f,%.1f,%.1f,%.1f",startRect.origin.x, startRect.origin.y, startRect.size.width, startRect.size.height);
//    NSLog(@"__👂👂👂👂%.1f,%.1f,%.1f,%.1f",endRect.origin.x, endRect.origin.y, endRect.size.width, endRect.size.height);
    
    CGRect resultRect = CGRectZero;
    if (startRect.origin.y == endRect.origin.y) {
        resultRect.origin.x = startRect.origin.x;
        resultRect.origin.y = startRect.origin.y;
        resultRect.size.width = endRect.origin.x - startRect.origin.x + 2;
        resultRect.size.height = startRect.size.height;
    } else {
        resultRect.origin.x = 0;
        resultRect.origin.y = startRect.origin.y;
        resultRect.size.width = textView.frame.size.width;
        resultRect.size.height = endRect.origin.y - startRect.origin.y + endRect.size.height;
    }
    
//    _selectedTopView.frame = resultRect;
    
    CGRect tempRect = [self convertRect:resultRect toView:((CCCAppDelegate*)([UIApplication sharedApplication].delegate)).window];
    CGRect cursorStartRectToWindow = [self convertRect:startRect toView:((CCCAppDelegate*)([UIApplication sharedApplication].delegate)).window];
        
    if (textView.selectedRange.length > 0) {
        //全部选中的时候内容显示的不一样。
        if (textView.selectedRange.length == textView.text.length) {
            
            [[CCCBubbleMenuView shareMenuView] showViewWithButtonModels:self.selectedAllRangeButtons cursorStartRect:cursorStartRectToWindow selectionTextRectInWindow:tempRect selectBlock:^(BBBMediaItem *item) {
                
                !_selectBlock ? : _selectBlock(item);

                [self hideTextSelection];
                [CCCBubbleMenuView.shareMenuView removeFromSuperview];

            }];
        } else {
            
            [[CCCBubbleMenuView shareMenuView] showViewWithButtonModels:self.selectedPartRangeButtons cursorStartRect:cursorStartRectToWindow selectionTextRectInWindow:tempRect selectBlock:^(BBBMediaItem *item) {
                
                !_selectBlock ? : _selectBlock(item);

                [self hideTextSelection];
                [CCCBubbleMenuView.shareMenuView removeFromSuperview];
                
            }];
        }
    }
}

- (BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange interaction:(UITextItemInteraction)interaction API_AVAILABLE(ios(10.0)) {
    return YES;
}

- (void)genMediaButtonsWithMessage:(NIMMessage *)message {
    
    NSMutableArray *selectedAllRangeButtons = [NSMutableArray array];
    NSMutableArray *selectedPartRangeButtons = [NSMutableArray array];

    NSArray *items;
    if (!self.config)
    {
        items = [[AppleProjectKit sharedKit].config defaultMenuItemsWithMessage:message];
    }
    else if([self.config respondsToSelector:@selector(menuItemsWithMessage:)])
    {
        items = [self.config menuItemsWithMessage:message];
    }
    [items enumerateObjectsUsingBlock:^(BBBMediaItem *item, NSUInteger idx, BOOL *stop) {
        
        CCCBubbleButtonModel *model = [[CCCBubbleButtonModel alloc] init];
        model.normalImage = item.normalImage;
        model.name = item.title;
        model.item = item;

        [selectedAllRangeButtons addObject:model];
        
        if (item.selctor == @selector(onTapMenuItemCopy:)) {
            [selectedPartRangeButtons addObject:model];
        }
    }];
   
    self.selectedAllRangeButtons = selectedAllRangeButtons;
    self.selectedPartRangeButtons = selectedPartRangeButtons;

}


- (void)new_genMediaButton {
    
    NSMutableArray *selectedAllRangeButtons = [NSMutableArray array];
    NSMutableArray *selectedPartRangeButtons = [NSMutableArray array];

    
    BBBMediaItem *copy = [BBBMediaItem item:@"onTapMenuItemCopy:"
                                normalImage:[UIImage imageNamed:@"menu_copy"]
                              selectedImage:nil
                                      title:LangKey(@"复制")];
    
    
    CCCBubbleButtonModel *model = [[CCCBubbleButtonModel alloc] init];
    model.normalImage = copy.normalImage;
    model.name = copy.title;
    model.item = copy;

    [selectedAllRangeButtons addObject:model];
    [selectedPartRangeButtons addObject:model];
    
    self.selectedAllRangeButtons = selectedAllRangeButtons;
    self.selectedPartRangeButtons = selectedPartRangeButtons;

}


@end
