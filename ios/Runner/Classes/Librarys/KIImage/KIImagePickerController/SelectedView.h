// __DEBUG__
// __CLOSE_PRINT__
//
//  SelectedView.h
//  Kitalker
//
//  Created by 刘 波 on 12-8-9.
//
//

// __M_A_C_R_O__
//: #import <UIKit/UIKit.h>
#import <UIKit/UIKit.h>

//: @class KICropImageMaskView;
@class MentalPictureChildView;
//: @interface KICropImageView : UIView <UIScrollViewDelegate> {
@interface SelectedView : UIView <UIScrollViewDelegate> {
    //: @private
    @private
    //: UIScrollView *_scrollView;
    UIScrollView *_scrollView;
    //: UIImageView *_imageView;
    UIImageView *_imageView;
    //: KICropImageMaskView *_maskView;
    MentalPictureChildView *_maskView;
    //: UIImage *_image;
    UIImage *_image;
    //: UIEdgeInsets _imageInset;
    UIEdgeInsets _imageInset;
    //: CGSize _cropSize;
    CGSize _cropSize;
}

//: - (void)setImage:(UIImage *)image;
- (void)setSetCounternalRepresentation:(UIImage *)image;
//: - (void)setCropSize:(CGSize)size;
- (void)setPerchForBy:(CGSize)size;

//: - (UIImage *)cropImage;
- (UIImage *)minSelected;

//: @end
@end