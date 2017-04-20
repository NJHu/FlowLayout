//
//  LMJLineLayout.m
//  自动布局-1
//
//  Created by 赵帅 on 16/7/29.
//  Copyright © 2016年 97. All rights reserved.
//

#import "LMJLineLayout.h"

@implementation LMJLineLayout

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        //        self.itemSize = CGSizeMake(200, 200);
        //        self.minimumInteritemSpacing = 100;
        //        //    layout.minimumLineSpacing = 44;
        //        self.minimumLineSpacing = 0;
        //        self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
    }
    return self;
}


- (void)prepareLayout
{
    [super prepareLayout];
    self.itemSize = CGSizeMake(200, 200);
    self.minimumInteritemSpacing = 100;
    //    layout.minimumLineSpacing = 44;
    self.minimumLineSpacing = 0;
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    CGFloat inset = self.collectionView.frame.size.width - self.itemSize.width;
    self.sectionInset = UIEdgeInsetsMake(0, inset/2, 0, inset/2);
    
}

// 是否作废布局, 因为item的大小的改变
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return YES;
}

/**
 *  返回一个模型数组, 告诉系统怎么显示每个cell
 */
- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    
    NSArray *attrbs = [super layoutAttributesForElementsInRect:rect];
    
    [attrbs enumerateObjectsUsingBlock:^(UICollectionViewLayoutAttributes  *_Nonnull attrb, NSUInteger idx, BOOL * _Nonnull stop) {
        
        CGFloat itemCenterX = attrb.center.x;
        
        CGFloat collectionViewCenterX = self.collectionView.contentOffset.x + self.collectionView.frame.size.width / 2;
        
        CGFloat delta = ABS(itemCenterX - collectionViewCenterX);
        
        CGFloat scale = 1.1 - delta / self.collectionView.frame.size.width;
        
        attrb.transform = CGAffineTransformMakeScale(scale, scale);
        
        
    }];
    
    
    return attrbs;
}


/**
 *  返回的点告诉collectionview应该停留的偏移量
 *
 *  @param CGPoint 原本应该停留到的偏移量
 *
 *  @return 返回自定义的偏移量
 */
- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity
{
    
    
    // 算出系统停留后显示的范围
    CGRect rect = CGRectMake(proposedContentOffset.x, proposedContentOffset.y, self.collectionView.frame.size.width, self.collectionView.frame.size.height);
    
    // collenction的中心店x
    CGFloat collectionCenterX = proposedContentOffset.x + self.collectionView.frame.size.width / 2;
    
    // 根据范围, 拿到所有的atrbs(items) - > cell的模型
    NSArray *atrbs = [super layoutAttributesForElementsInRect:rect];
    
    
    __block CGFloat minDelta = MAXFLOAT;
    
    // 从模型中拿到距离中心点最近的模型
    [atrbs enumerateObjectsUsingBlock:^(UICollectionViewLayoutAttributes  *_Nonnull atrb, NSUInteger idx, BOOL * _Nonnull stop) {
        
        if(ABS(minDelta) > ABS(atrb.center.x - collectionCenterX))
        {
            minDelta = collectionCenterX - atrb.center.x;
        }
        
    }];
    
    // |proX |nearX |collX, 算出最终需要的偏移量
    proposedContentOffset.x -= minDelta;
    
    
    return proposedContentOffset;
}


@end
