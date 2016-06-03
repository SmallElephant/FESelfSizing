//
//  FECollectionViewFlowLayout.m
//  FEAutoCollectionView
//
//  Created by FlyElephant on 16/6/3.
//  Copyright © 2016年 FlyElephant. All rights reserved.
//

#import "FECollectionViewFlowLayout.h"

#define ITEM_SPACING 0.0f

@implementation FECollectionViewFlowLayout

//1.正常的size 可以实现需求
//-(NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
//    NSMutableArray *attributes = [[super layoutAttributesForElementsInRect:rect] mutableCopy];
//
//    for(int i = 1; i < [attributes count]; ++i){
//        //当前attributes
//        UICollectionViewLayoutAttributes *currentLayoutAttributes = attributes[i];
//        //上一个attributes
//        UICollectionViewLayoutAttributes *prevLayoutAttributes = attributes[i - 1];
//        //我们想设置的最大间距，可根据需要改
//        NSInteger maximumSpacing = 0;
//        //前一个cell的最右边
//        NSInteger origin = CGRectGetMaxX(prevLayoutAttributes.frame);
//        //如果当前一个cell的最右边加上我们想要的间距加上当前cell的宽度依然在contentSize中，我们改变当前cell的原点位置
//        //不加这个判断的后果是，UICollectionView只显示一行，原因是下面所有cell的x值都被加到第一行最后一个元素的后面了
//        if(origin + maximumSpacing + currentLayoutAttributes.frame.size.width < self.collectionViewContentSize.width){
//            CGRect frame = currentLayoutAttributes.frame;
//            frame.origin.x = origin + maximumSpacing;
//            currentLayoutAttributes.frame = frame;
//
//            NSLog(@"currentLayoutAttributes.frame =%@",NSStringFromCGRect(currentLayoutAttributes.frame));
//        }
//    }
//
//    return attributes;
//}

//2.方式

//- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect {
//
//    NSArray *attributesForElementsInRect = [super layoutAttributesForElementsInRect:rect];
//    NSMutableArray *newAttributesForElementsInRect = [[NSMutableArray alloc] initWithCapacity:attributesForElementsInRect.count];
//
//    CGFloat leftMargin = self.sectionInset.left; //initalized to silence compiler, and actaully safer, but not planning to use.
//
//    //this loop assumes attributes are in IndexPath order
//    for (UICollectionViewLayoutAttributes *attributes in attributesForElementsInRect) {
//        if (attributes.frame.origin.x == self.sectionInset.left) {
//            leftMargin = self.sectionInset.left; //will add outside loop
//        } else {
//            CGRect newLeftAlignedFrame = attributes.frame;
//            newLeftAlignedFrame.origin.x = leftMargin;
//            attributes.frame = newLeftAlignedFrame;
//        }
//
//        leftMargin += attributes.frame.size.width + ITEM_SPACING;
//
//        NSLog(@"currentLayoutAttributes.frame =%@",NSStringFromCGRect(attributes.frame));
//        [newAttributesForElementsInRect addObject:attributes];
//    }
//
//    return newAttributesForElementsInRect;
//}






// 2.
//
//-(UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath{
//    UICollectionViewLayoutAttributes* currentItemAttributes = [[super layoutAttributesForItemAtIndexPath:indexPath] copy];
//    UIEdgeInsets sectionInset = [self evaluatedSectionInsetForItemAtIndex:indexPath.section];
//
//    BOOL isFirstItemInSection = indexPath.item == 0;
//    CGFloat layoutWidth = CGRectGetWidth(self.collectionView.frame) - sectionInset.left - sectionInset.right;
//
//    if (isFirstItemInSection) {
//        [currentItemAttributes leftAlignFrameWithSectionInset:sectionInset];
//        return currentItemAttributes;
//    }
//
//    NSIndexPath* previousIndexPath = [NSIndexPath indexPathForItem:indexPath.item-1 inSection:indexPath.section];
//    CGRect previousFrame = [self layoutAttributesForItemAtIndexPath:previousIndexPath].frame;
//    CGFloat previousFrameRightPoint = previousFrame.origin.x + previousFrame.size.width;
//    CGRect currentFrame = currentItemAttributes.frame;
//    CGRect strecthedCurrentFrame = CGRectMake(sectionInset.left,
//                                              currentFrame.origin.y,
//                                              layoutWidth,
//                                              currentFrame.size.height);
//    // if the current frame, once left aligned to the left and stretched to the full collection view
//    // widht intersects the previous frame then they are on the same line
//    BOOL isFirstItemInRow = !CGRectIntersectsRect(previousFrame, strecthedCurrentFrame);
//
//    if (isFirstItemInRow) {
//        // make sure the first item on a line is left aligned
//        [currentItemAttributes leftAlignFrameWithSectionInset:sectionInset];
//        return currentItemAttributes;
//    }
//
//    CGRect frame = currentItemAttributes.frame;
//    frame.origin.x = previousFrameRightPoint + [self evaluatedMinimumInteritemSpacingForSectionAtIndex:indexPath.section];
//    currentItemAttributes.frame = frame;
//    return currentItemAttributes;
//}

//private override func layoutAttributesForItemAtIndexPath(indexPath: NSIndexPath) -> UICollectionViewLayoutAttributes? {
//    let layoutAttribute = super.layoutAttributesForItemAtIndexPath(indexPath)?.copy() as? UICollectionViewLayoutAttributes
//
//    // First in a row.
//    if layoutAttribute?.frame.origin.x == sectionInset.left {
//        return layoutAttribute
//    }
//
//    // We need to align it to the previous item.
//    let previousIndexPath = NSIndexPath(forItem: indexPath.item - 1, inSection: indexPath.section)
//    guard let previousLayoutAttribute = self.layoutAttributesForItemAtIndexPath(previousIndexPath) else {
//        return layoutAttribute
//    }
//
//    layoutAttribute?.frame.origin.x = previousLayoutAttribute.frame.maxX + self.minimumInteritemSpacing
//
//    return layoutAttribute
//}
//
//- (UIEdgeInsets)evaluatedSectionInsetForItemAtIndex:(NSInteger)index
//{
//    if ([self.collectionView.delegate respondsToSelector:@selector(collectionView:layout:insetForSectionAtIndex:)]) {
//        id<UICollectionViewDelegateLeftAlignedLayout> delegate = (id<UICollectionViewDelegateLeftAlignedLayout>)self.collectionView.delegate;
//
//        return [delegate collectionView:self.collectionView layout:self insetForSectionAtIndex:index];
//    } else {
//        return self.sectionInset;
//    }
//}
//
//- (CGFloat)evaluatedMinimumInteritemSpacingForSectionAtIndex:(NSInteger)sectionIndex
//{
//    if ([self.collectionView.delegate respondsToSelector:@selector(collectionView:layout:minimumInteritemSpacingForSectionAtIndex:)]) {
//        id<UICollectionViewDelegateLeftAlignedLayout> delegate = (id<UICollectionViewDelegateLeftAlignedLayout>)self.collectionView.delegate;
//
//        return [delegate collectionView:self.collectionView layout:self minimumInteritemSpacingForSectionAtIndex:sectionIndex];
//    } else {
//        return self.minimumInteritemSpacing;
//    }
//}
//
//- (void)leftAlignFrameWithSectionInset:(UIEdgeInsets)sectionInset
//{
//    CGRect frame = self.frame;
//    frame.origin.x = sectionInset.left;
//    self.frame = frame;
//}




- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewLayoutAttributes *layoutAttribute = [super layoutAttributesForItemAtIndexPath:indexPath];
    if (layoutAttribute.frame.origin.x == self.sectionInset.left) {
         NSLog(@"之前的为nil:%ld--%ld",(long)indexPath.section,(long)indexPath.row);
        return layoutAttribute;
    }
    
    NSIndexPath *previousIndexPath = [NSIndexPath indexPathForRow:indexPath.row-1 inSection:indexPath.section];
    
    UICollectionViewLayoutAttributes *previousLayoutAttribute = [self layoutAttributesForItemAtIndexPath:previousIndexPath];
    CGRect frame = layoutAttribute.frame;
    frame.origin.x        = CGRectGetMaxX(previousLayoutAttribute.frame)+0;
    layoutAttribute.frame = frame;
    
    
    
    NSLog(@"currentLayoutAttributes.frame =%@---indexPath的row:%ld---section:%ld",NSStringFromCGRect(layoutAttribute.frame),indexPath.row,indexPath.section);
    return layoutAttribute;
    
}

//private override func layoutAttributesForItemAtIndexPath(indexPath: NSIndexPath) -> UICollectionViewLayoutAttributes? {
//    let layoutAttribute = super.layoutAttributesForItemAtIndexPath(indexPath)?.copy() as? UICollectionViewLayoutAttributes
//
//    // First in a row.
//    if layoutAttribute?.frame.origin.x == sectionInset.left {
//        return layoutAttribute
//    }
//
//    // We need to align it to the previous item.
//    let previousIndexPath = NSIndexPath(forItem: indexPath.item - 1, inSection: indexPath.section)
//    guard let previousLayoutAttribute = self.layoutAttributesForItemAtIndexPath(previousIndexPath) else {
//        return layoutAttribute
//    }
//
//    layoutAttribute?.frame.origin.x = previousLayoutAttribute.frame.maxX + self.minimumInteritemSpacing
//
//    return layoutAttribute
//}
//}


@end
