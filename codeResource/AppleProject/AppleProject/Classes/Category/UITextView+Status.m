// __DEBUG__
// __CLOSE_PRINT__
//
//  UITextView+Status.m
//  NIM
//
//  Created by chris on 2018/3/20.
//  Copyright © 2018年 Netease. All rights reserved.
//

// __M_A_C_R_O__
//: #import "UITextView+NTES.h"
#import "UITextView+Status.h"
//: #import <objc/runtime.h>
#import <objc/runtime.h>

//: @implementation UITextView (NTES)
@implementation UITextView (Status)



//: @dynamic placeholder;
@dynamic placeholder;
//: @dynamic placeholderLabel;
@dynamic placeholderLabel;
//: @dynamic textValue;
@dynamic textValue;

//: -(void)setTextValue:(NSString *)textValue
-(void)setTextValue:(NSString *)textValue
{
    //  Change the text of our UITextView, and check whether we need to display the placeholder.
    //: self.text = textValue;
    self.text = textValue;
    //: [self checkIfNeedToDisplayPlaceholder];
    [self belowComplete];
}
//: -(NSString*)textValue
-(NSString*)textValue
{
    //: return self.text;
    return self.text;
}

//: -(void)checkIfNeedToDisplayPlaceholder
-(void)belowComplete
{
    //  If our UITextView is empty, display our Placeholder label (if we have one)
    //: if (self.placeholderLabel == nil)
    if (self.placeholderLabel == nil)
        //: return;
        return;

    //: self.placeholderLabel.hidden = (![self.text isEqualToString:@""]);
    self.placeholderLabel.hidden = (![self.text isEqualToString:@""]);
}

//: -(void)onTap
-(void)valueCenter
{
    //  When the user taps in our UITextView, we'll see if we need to remove the placeholder text.
    //: [self checkIfNeedToDisplayPlaceholder];
    [self belowComplete];

    //  Make the onscreen keyboard appear.
    //: [self becomeFirstResponder];
    [self becomeFirstResponder];
}

//: -(void)keyPressed:(NSNotification*)notification
-(void)nameOfPressed:(NSNotification*)notification
{
    //  The user has just typed a character in our UITextView (or pressed the delete key).
    //  Do we need to display our Placeholder label ?
    //: [self checkIfNeedToDisplayPlaceholder];
    [self belowComplete];
}

//: #pragma mark - Add a "placeHolder" string to the UITextView class
#pragma mark - Add a "placeHolder" string to the UITextView class

//: NSString const *kKeyPlaceHolder = @"kKeyPlaceHolder";
NSString const *k_activeName = @"kKeyPlaceHolder";
//: -(void)setPlaceholder:(NSString *)_placeholder
-(void)setPlaceholder:(NSString *)_placeholder
{
    //  Sets our "placeholder" text string, creates a new UILabel to contain it, and modifies our UITextView to cope with
    //  showing/hiding the UILabel when needed.
    //: objc_setAssociatedObject(self, &kKeyPlaceHolder, (id)_placeholder, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    objc_setAssociatedObject(self, &k_activeName, (id)_placeholder, OBJC_ASSOCIATION_RETAIN_NONATOMIC);

    //: self.placeholderLabel = [[UILabel alloc] initWithFrame:CGRectMake(8, 8, 0, 0)];
    self.placeholderLabel = [[UILabel alloc] initWithFrame:CGRectMake(8, 8, 0, 0)];
    //: self.placeholderLabel.numberOfLines = 1;
    self.placeholderLabel.numberOfLines = 1;
    //: self.placeholderLabel.text = _placeholder;
    self.placeholderLabel.text = _placeholder;
    //: self.placeholderLabel.textColor = [UIColor colorWithRed:170.0/255.0 green:170.0/255.0 blue:170.0/255.0 alpha:1.0];
    self.placeholderLabel.textColor = [UIColor colorWithRed:170.0/255.0 green:170.0/255.0 blue:170.0/255.0 alpha:1.0];
    //: self.placeholderLabel.backgroundColor = [UIColor clearColor];
    self.placeholderLabel.backgroundColor = [UIColor clearColor];
    //: self.placeholderLabel.userInteractionEnabled = true;
    self.placeholderLabel.userInteractionEnabled = true;
    //: self.placeholderLabel.font = self.font;
    self.placeholderLabel.font = self.font;
    //: [self addSubview:self.placeholderLabel];
    [self addSubview:self.placeholderLabel];

    //: [self.placeholderLabel sizeToFit];
    [self.placeholderLabel sizeToFit];

    //  Whenever the user taps within the UITextView, we'll give the textview the focus, and hide the placeholder if necessary.
    //: [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onTap)]];
    [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(valueCenter)]];

    //  Whenever the user types something in the UITextView, we'll see if we need to hide/show the placeholder label.
    //: [[NSNotificationCenter defaultCenter] addObserver:self selector: @selector(keyPressed:) name:UITextViewTextDidChangeNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector: @selector(nameOfPressed:) name:UITextViewTextDidChangeNotification object:nil];

    //: [self checkIfNeedToDisplayPlaceholder];
    [self belowComplete];
}
//: -(NSString*)placeholder
-(NSString*)placeholder
{
    //  Returns our "placeholder" text string
    //: return objc_getAssociatedObject(self, &kKeyPlaceHolder);
    return objc_getAssociatedObject(self, &k_activeName);
}

//: #pragma mark - Add a "UILabel" to this UITextView class
#pragma mark - Add a "UILabel" to this UITextView class

//: NSString const *kKeyLabel = @"kKeyLabel";
NSString const *k_cellName = @"kKeyLabel";
//: -(void)setPlaceholderLabel:(UILabel *)placeholderLabel
-(void)setPlaceholderLabel:(UILabel *)placeholderLabel
{
    //  Stores our new UILabel (which contains our placeholder string)
    //: objc_setAssociatedObject(self, &kKeyLabel, (id)placeholderLabel, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    objc_setAssociatedObject(self, &k_cellName, (id)placeholderLabel, OBJC_ASSOCIATION_RETAIN_NONATOMIC);

    //: [[NSNotificationCenter defaultCenter] addObserver:self selector: @selector(keyPressed:) name:UITextViewTextDidChangeNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector: @selector(nameOfPressed:) name:UITextViewTextDidChangeNotification object:nil];

    //: [self checkIfNeedToDisplayPlaceholder];
    [self belowComplete];
}
//: -(UILabel*)placeholderLabel
-(UILabel*)placeholderLabel
{
    //  Returns our new UILabel
    //: return objc_getAssociatedObject(self, &kKeyLabel);
    return objc_getAssociatedObject(self, &k_cellName);
}

//: @end
@end