//
//  LMJLineLayout.m
//  自动布局-1
//
//  Created by 赵帅 on 16/7/29.
//  Copyright © 2016年 97. All rights reserved.
//

#import "LMJLineLayout.h"

@implementation LMJLineLayout

// 是否作废布局, 因为item的大小的改变
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return YES;
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    
    NSArray *attrbs = [super layoutAttributesForElementsInRect:rect];
    
    [attrbs enumerateObjectsUsingBlock:^(UICollectionViewLayoutAttributes  *_Nonnull attrb, NSUInteger idx, BOOL * _Nonnull stop) {
        
        CGFloat itemCenterX = attrb.center.x;
        
        CGFloat collectionViewCenterX = self.collectionView.contentOffset.x + self.collectionView.frame.size.width / 2;
        
        CGFloat delta = ABS(itemCenterX - collectionViewCenterX);
        
        CGFloat scale = 1.2 - delta / self.collectionView.frame.size.width;
        
        attrb.transform = CGAffineTransformMakeScale(scale, scale);
        
        
    }];
    
    
    return attrbs;
}



@end
