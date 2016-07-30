//
//  LMJWaterflowLayout.m
//  瀑布流核心计算-1
//
//  Created by apple on 16/7/30.
//  Copyright © 2016年 NJHu. All rights reserved.
//

#import "LMJWaterflowLayout.h"

static const NSInteger LMJ_cols = 4;
static const CGFloat LMJ_XMargin = 10;
static const CGFloat LMJ_YMargin = 10;
static const UIEdgeInsets LMJ_EdgeInsets = {10, 10, 10, 10};

@interface LMJWaterflowLayout ()

/** 存放所有的cell的布局属性 */
@property (nonatomic, strong) NSMutableArray *atrbsArray;

/** 存放每一列的高度数据 */
@property (nonatomic, strong) NSMutableArray *colsHeight;

@end

@implementation LMJWaterflowLayout


- (NSMutableArray *)atrbsArray
{
    if(_atrbsArray == nil)
    {
        _atrbsArray = [NSMutableArray array];
    }
    return _atrbsArray;
}


- (NSMutableArray *)colsHeight
{
    if(!_colsHeight)
    {
        _colsHeight = [NSMutableArray array];
    }
    return _colsHeight;
}

- (void)prepareLayout
{
    [super prepareLayout];
    
    // 刷新布局的时候移除所有的布局, 重新计算
    [self.atrbsArray removeAllObjects];
    
    
    // 清除以前所有储存的高度数据
    [self.colsHeight removeAllObjects];
    // 添加每一列的初始高度
    for (NSInteger i = 0; i < LMJ_cols; i++) {
        
        [self.colsHeight addObject:@(LMJ_EdgeInsets.top)];
    }
    
    // 获得所有的item的个数
    NSInteger count = [self.collectionView numberOfItemsInSection:0];
    //for循环计算
    for (NSInteger i = 0; i < count; i++) {
        
        UICollectionViewLayoutAttributes *atrbs = [self layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForItem:i inSection:0]];
        
        // 添加cell的属性
        [self.atrbsArray addObject:atrbs];
    }
    
}


- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewLayoutAttributes *atrbs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    
    // 宽度固定
    CGFloat w = (self.collectionView.frame.size.width - LMJ_EdgeInsets.left - LMJ_EdgeInsets.right - (LMJ_cols - 1) * LMJ_XMargin) / LMJ_cols;
    
    // 高度不确定
    CGFloat h = arc4random_uniform(100) + 50;
    
    // 计算x是最短的那一列的x值
    CGFloat x = 0;
    // y是最短的那一列的Y + Ymargin
    CGFloat y = 0;
    
    // 拿到最短的那一列的Y值, 和列号, 假设第一列最小
    NSInteger indexCol = 0;
    CGFloat minY = [self.colsHeight[indexCol] floatValue];
    
    for (NSInteger i = 1; i < self.colsHeight.count; i++) {
        
        if(minY > [self.colsHeight[i] floatValue])
        {
            minY = [self.colsHeight[i] floatValue];
            indexCol = i;
        }
    }
    
    x = LMJ_EdgeInsets.left + (w + LMJ_XMargin) * indexCol;
    
    // 如果是第一排,就不加Y方向上的间距, 最后加上高度
    y = minY + (minY == LMJ_EdgeInsets.top ? 0 : LMJ_YMargin);
    
    // 设置frame
    atrbs.frame = CGRectMake(x, y, w, h);
    
    // 覆盖最新的高度
    self.colsHeight[indexCol] = @(CGRectGetMaxY(atrbs.frame));
    
    
    return atrbs;
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    
    return self.atrbsArray;
}


- (CGSize)collectionViewContentSize
{
    
    CGFloat maxY = [self.colsHeight[0] floatValue];
    
    for (NSInteger i = 1; i < self.colsHeight.count; i++) {
        
        if(maxY < [self.colsHeight[i] floatValue])
        {
            maxY = [self.colsHeight[i] floatValue];
        }
    }
    
    return CGSizeMake(0, maxY + LMJ_EdgeInsets.bottom);
}

@end
