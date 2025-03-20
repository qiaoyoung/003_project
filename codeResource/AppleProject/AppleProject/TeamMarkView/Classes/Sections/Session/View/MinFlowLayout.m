// __DEBUG__
// __CLOSE_PRINT__
// Copyright (c) 2014 Giovanni Lodi
//
// Permission is hereby granted, free of charge, to any person obtaining a copy of
// this software and associated documentation files (the "Software"), to deal in
// the Software without restriction, including without limitation the rights to
// use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
// the Software, and to permit persons to whom the Software is furnished to do so,
// subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
// FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
// COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
// IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
// CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

// __M_A_C_R_O__
//: #import "CCCCollectionViewLeftAlignedLayout.h"
#import "MinFlowLayout.h"

//: @interface UICollectionViewLayoutAttributes (LeftAligned)
@interface UICollectionViewLayoutAttributes (LeftHandPressedMark)

//: - (void)nim_leftAlignFrameWithSectionInset:(UIEdgeInsets)sectionInset;
- (void)inset:(UIEdgeInsets)sectionInset;

//: @end
@end

//: @implementation UICollectionViewLayoutAttributes (LeftAligned)
@implementation UICollectionViewLayoutAttributes (LeftHandPressedMark)

//: - (void)nim_leftAlignFrameWithSectionInset:(UIEdgeInsets)sectionInset
- (void)inset:(UIEdgeInsets)sectionInset
{
    //: CGRect frame = self.frame;
    CGRect frame = self.frame;
    //: frame.origin.x = sectionInset.left;
    frame.origin.x = sectionInset.left;
    //: self.frame = frame;
    self.frame = frame;
}

//: @end
@end

//: #pragma mark -
#pragma mark -

//: @implementation CCCCollectionViewLeftAlignedLayout
@implementation MinFlowLayout

//: #pragma mark - UICollectionViewLayout
#pragma mark - UICollectionViewLayout

//: - (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect {
- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect {
    //: NSArray *originalAttributes = [super layoutAttributesForElementsInRect:rect];
    NSArray *originalAttributes = [super layoutAttributesForElementsInRect:rect];
    //: NSMutableArray *updatedAttributes = [NSMutableArray arrayWithArray:originalAttributes];
    NSMutableArray *updatedAttributes = [NSMutableArray arrayWithArray:originalAttributes];
    //: for (UICollectionViewLayoutAttributes *attributes in originalAttributes) {
    for (UICollectionViewLayoutAttributes *attributes in originalAttributes) {
        //: if (!attributes.representedElementKind) {
        if (!attributes.representedElementKind) {
            //: NSUInteger index = [updatedAttributes indexOfObject:attributes];
            NSUInteger index = [updatedAttributes indexOfObject:attributes];
            //: updatedAttributes[index] = [self layoutAttributesForItemAtIndexPath:attributes.indexPath];
            updatedAttributes[index] = [self layoutAttributesForItemAtIndexPath:attributes.indexPath];
        }
    }

    //: return updatedAttributes;
    return updatedAttributes;
}

//: - (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    //: UICollectionViewLayoutAttributes* currentItemAttributes = [[super layoutAttributesForItemAtIndexPath:indexPath] copy];
    UICollectionViewLayoutAttributes* currentItemAttributes = [[super layoutAttributesForItemAtIndexPath:indexPath] copy];
    //: UIEdgeInsets sectionInset = [self evaluatedSectionInsetForItemAtIndex:indexPath.section];
    UIEdgeInsets sectionInset = [self key:indexPath.section];

    //: BOOL isFirstItemInSection = indexPath.item == 0;
    BOOL isFirstItemInSection = indexPath.item == 0;
    //: CGFloat layoutWidth = CGRectGetWidth(self.collectionView.frame) - sectionInset.left - sectionInset.right;
    CGFloat layoutWidth = CGRectGetWidth(self.collectionView.frame) - sectionInset.left - sectionInset.right;

    //: if (isFirstItemInSection) {
    if (isFirstItemInSection) {
        //: [currentItemAttributes nim_leftAlignFrameWithSectionInset:sectionInset];
        [currentItemAttributes inset:sectionInset];
        //: return currentItemAttributes;
        return currentItemAttributes;
    }

    //: NSIndexPath* previousIndexPath = [NSIndexPath indexPathForItem:indexPath.item-1 inSection:indexPath.section];
    NSIndexPath* previousIndexPath = [NSIndexPath indexPathForItem:indexPath.item-1 inSection:indexPath.section];
    //: CGRect previousFrame = [self layoutAttributesForItemAtIndexPath:previousIndexPath].frame;
    CGRect previousFrame = [self layoutAttributesForItemAtIndexPath:previousIndexPath].frame;
    //: CGFloat previousFrameRightPoint = previousFrame.origin.x + previousFrame.size.width;
    CGFloat previousFrameRightPoint = previousFrame.origin.x + previousFrame.size.width;
    //: CGRect currentFrame = currentItemAttributes.frame;
    CGRect currentFrame = currentItemAttributes.frame;
    //: CGRect strecthedCurrentFrame = CGRectMake(sectionInset.left,
    CGRect strecthedCurrentFrame = CGRectMake(sectionInset.left,
                                              //: currentFrame.origin.y,
                                              currentFrame.origin.y,
                                              //: layoutWidth,
                                              layoutWidth,
                                              //: currentFrame.size.height);
                                              currentFrame.size.height);
    // if the current frame, once left aligned to the left and stretched to the full collection view
    // width intersects the previous frame then they are on the same line
    //: BOOL isFirstItemInRow = !CGRectIntersectsRect(previousFrame, strecthedCurrentFrame);
    BOOL isFirstItemInRow = !CGRectIntersectsRect(previousFrame, strecthedCurrentFrame);

    //: if (isFirstItemInRow) {
    if (isFirstItemInRow) {
        // make sure the first item on a line is left aligned
        //: [currentItemAttributes nim_leftAlignFrameWithSectionInset:sectionInset];
        [currentItemAttributes inset:sectionInset];
        //: return currentItemAttributes;
        return currentItemAttributes;
    }

    //: CGRect frame = currentItemAttributes.frame;
    CGRect frame = currentItemAttributes.frame;
    //: frame.origin.x = previousFrameRightPoint + [self evaluatedMinimumInteritemSpacingForSectionAtIndex:indexPath.section];
    frame.origin.x = previousFrameRightPoint + [self existEmpty:indexPath.section];
    //: currentItemAttributes.frame = frame;
    currentItemAttributes.frame = frame;
    //: return currentItemAttributes;
    return currentItemAttributes;
}

//: - (CGFloat)evaluatedMinimumInteritemSpacingForSectionAtIndex:(NSInteger)sectionIndex
- (CGFloat)existEmpty:(NSInteger)sectionIndex
{
    //: if ([self.collectionView.delegate respondsToSelector:@selector(collectionView:layout:minimumInteritemSpacingForSectionAtIndex:)]) {
    if ([self.collectionView.delegate respondsToSelector:@selector(collectionView:layout:minimumInteritemSpacingForSectionAtIndex:)]) {
        //: id<UICollectionViewDelegateLeftAlignedLayout> delegate = (id<UICollectionViewDelegateLeftAlignedLayout>)self.collectionView.delegate;
        id<DisableLayout> delegate = (id<DisableLayout>)self.collectionView.delegate;

        //: return [delegate collectionView:self.collectionView layout:self minimumInteritemSpacingForSectionAtIndex:sectionIndex];
        return [delegate collectionView:self.collectionView layout:self minimumInteritemSpacingForSectionAtIndex:sectionIndex];
    //: } else {
    } else {
        //: return self.minimumInteritemSpacing;
        return self.minimumInteritemSpacing;
    }
}

//: - (UIEdgeInsets)evaluatedSectionInsetForItemAtIndex:(NSInteger)index
- (UIEdgeInsets)key:(NSInteger)index
{
    //: if ([self.collectionView.delegate respondsToSelector:@selector(collectionView:layout:insetForSectionAtIndex:)]) {
    if ([self.collectionView.delegate respondsToSelector:@selector(temp:show:collectionForIndex:)]) {
        //: id<UICollectionViewDelegateLeftAlignedLayout> delegate = (id<UICollectionViewDelegateLeftAlignedLayout>)self.collectionView.delegate;
        id<DisableLayout> delegate = (id<DisableLayout>)self.collectionView.delegate;

        //: return [delegate collectionView:self.collectionView layout:self insetForSectionAtIndex:index];
        return [delegate collectionView:self.collectionView layout:self insetForSectionAtIndex:index];
    //: } else {
    } else {
        //: return self.sectionInset;
        return self.sectionInset;
    }
}

//: @end
@end