// __DEBUG__
// __CLOSE_PRINT__
//
//  AddViewLayout.h
//  LxGridView
//

// __M_A_C_R_O__
//: #import <UIKit/UIKit.h>
#import <UIKit/UIKit.h>

/*
 此类来源于DeveloperLx的优秀开源项目：LxGridView
 github链接：https://github.com/DeveloperLx/LxGridView
 我对这个类的代码做了一些修改；
 感谢DeveloperLx的优秀代码~
 */

//: @interface LxGridViewFlowLayout : UICollectionViewFlowLayout
@interface AddViewLayout : UICollectionViewFlowLayout

//: @property (nonatomic,assign) BOOL panGestureRecognizerEnable;
@property (nonatomic,assign) BOOL panGestureRecognizerEnable;

//: @end
@end

//: @protocol LxGridViewDataSource <UICollectionViewDataSource>
@protocol ShouldSource <UICollectionViewDataSource>

//: @optional
@optional

//: - (void)collectionView:(UICollectionView *)collectionView
- (void)light:(UICollectionView *)collectionView
       //: itemAtIndexPath:(NSIndexPath *)sourceIndexPath
       red:(NSIndexPath *)sourceIndexPath
   //: willMoveToIndexPath:(NSIndexPath *)destinationIndexPath;
   of:(NSIndexPath *)destinationIndexPath;
//: - (void)collectionView:(UICollectionView *)collectionView
- (void)view_strong:(UICollectionView *)collectionView
       //: itemAtIndexPath:(NSIndexPath *)sourceIndexPath
       rushAlong:(NSIndexPath *)sourceIndexPath
    //: didMoveToIndexPath:(NSIndexPath *)destinationIndexPath;
    data:(NSIndexPath *)destinationIndexPath;

//: - (BOOL)collectionView:(UICollectionView *)collectionView
- (BOOL)collectionView:(UICollectionView *)collectionView
//: canMoveItemAtIndexPath:(NSIndexPath *)indexPath;
canMoveItemAtIndexPath:(NSIndexPath *)indexPath;
//: - (BOOL)collectionView:(UICollectionView *)collectionView
- (BOOL)bubble_strong:(UICollectionView *)collectionView
       //: itemAtIndexPath:(NSIndexPath *)sourceIndexPath
       blue:(NSIndexPath *)sourceIndexPath
    //: canMoveToIndexPath:(NSIndexPath *)destinationIndexPath;
    tableButton:(NSIndexPath *)destinationIndexPath;

//: @end
@end

//: @protocol LxGridViewDelegateFlowLayout <UICollectionViewDelegateFlowLayout>
@protocol RestoreColor <UICollectionViewDelegateFlowLayout>

//: @optional
@optional

//: - (void)collectionView:(UICollectionView *)collectionView
- (void)with:(UICollectionView *)collectionView
                //: layout:(UICollectionViewLayout *)collectionViewLayout
                query:(UICollectionViewLayout *)collectionViewLayout
//: willBeginDraggingItemAtIndexPath:(NSIndexPath *)indexPath;
velleity:(NSIndexPath *)indexPath;
//: - (void)collectionView:(UICollectionView *)collectionView
- (void)content:(UICollectionView *)collectionView
                //: layout:(UICollectionViewLayout *)collectionViewLayout
                sum:(UICollectionViewLayout *)collectionViewLayout
//: didBeginDraggingItemAtIndexPath:(NSIndexPath *)indexPath;
bottomTo:(NSIndexPath *)indexPath;
//: - (void)collectionView:(UICollectionView *)collectionView
- (void)send:(UICollectionView *)collectionView
                //: layout:(UICollectionViewLayout *)collectionViewLayout
                parent:(UICollectionViewLayout *)collectionViewLayout
//: willEndDraggingItemAtIndexPath:(NSIndexPath *)indexPath;
number:(NSIndexPath *)indexPath;
//: - (void)collectionView:(UICollectionView *)collectionView
- (void)image:(UICollectionView *)collectionView
                //: layout:(UICollectionViewLayout *)collectionViewLayout
                content:(UICollectionViewLayout *)collectionViewLayout
//: didEndDraggingItemAtIndexPath:(NSIndexPath *)indexPath;
marginView:(NSIndexPath *)indexPath;

//: @end
@end