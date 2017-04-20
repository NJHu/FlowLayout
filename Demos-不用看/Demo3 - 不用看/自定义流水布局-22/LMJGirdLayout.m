//
//  LMJGirdLayout.m
//  自定义流水布局-22
//
//  Created by apple on 16/7/30.
//  Copyright © 2016年 NJHu. All rights reserved.
//

#import "LMJGirdLayout.h"

@interface LMJGirdLayout ()
/** 所有的模型数据 */
@property (nonatomic, strong) NSMutableArray *array;

@end

@implementation LMJGirdLayout


- (NSMutableArray *)array
{
    if(_array == nil)
    {
        _array = [NSMutableArray array];
    }
    return _array;
}

- (void)prepareLayout
{
    [super prepareLayout];
    
    NSLog(@"------------------");

    [self.array removeAllObjects];
    
    NSUInteger count = [self.collectionView numberOfItemsInSection:0];
    

        for (NSInteger i = 0; i < count; i++)
        {
            UICollectionViewLayoutAttributes *atrb = [self layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForItem:i inSection:0]];
            
            [self.array addObject:atrb];
        }
    
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    return self.array;
}

- (CGSize)collectionViewContentSize
{
    UICollectionViewLayoutAttributes *lastAtrb = self.array.lastObject;
    
    UICollectionViewLayoutAttributes *preLastAtrb = self.array[self.array.count-2];
    
    
    
    return CGSizeMake(0, MAX(CGRectGetMaxY(lastAtrb.frame), CGRectGetMaxY(preLastAtrb.frame)));
}


- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger i = indexPath.item;
    
    UICollectionViewLayoutAttributes *atrb = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:[NSIndexPath indexPathForItem:i inSection:0]];
    
    CGFloat width = self.collectionView.frame.size.width / 2;
    
    CGFloat height = width;
    
    CGFloat x = 0;
    CGFloat y = 0;
    if(i == 0)
    {
        x = 0;
        y = 0;
    }else
    {
        
        UICollectionViewLayoutAttributes *lastAtrb = self.array.lastObject;
        
        x = lastAtrb.frame.origin.x;
        y = lastAtrb.frame.origin.y + height * 1.2;
        width = lastAtrb.frame.size.width;
        height = lastAtrb.frame.size.height;
        
    }
    
    atrb.frame = CGRectMake(x, y, width, height);

    
    return atrb;
}

@end
