//
//  LMJCollectionViewController.m
//  collectionView的基本使用-1
//
//  Created by apple on 16/7/29.
//  Copyright © 2016年 NJHu. All rights reserved.
//

#import "LMJCollectionViewController.h"
#import "LMJCollectionViewCell.h"

@interface LMJCollectionViewController ()

@end

@implementation LMJCollectionViewController
static NSString *const ID = @"cell";
- (instancetype)init
{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    
    flowLayout.itemSize = CGSizeMake(100, 100); // 每个item的大小
    // 每个item之间的间距, 竖直滚动就是竖{直}间距. 水平方向滚动就是水{平}方向的间距
    flowLayout.minimumInteritemSpacing = 0;
    
    // 每个组内行间距, 竖直滚动就是水平方向的间距, 水平滚动就是竖直方向的间距
    flowLayout.minimumLineSpacing = 60;
    
    // 每个组的四周的间距
    flowLayout.sectionInset = UIEdgeInsetsMake(44, 30, 200, 30);
    // 滚动方向
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
   return [super initWithCollectionViewLayout:flowLayout];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor redColor];
    self.collectionView.backgroundColor = [UIColor grayColor];
    // 翻页功能
    self.collectionView.pagingEnabled = YES;
    // 弹簧功能
    self.collectionView.bounces = NO;
    // 水平滚动条
    self.collectionView.showsHorizontalScrollIndicator = NO;
    // 使用的时候必须注册
    [self.collectionView registerClass:[LMJCollectionViewCell class] forCellWithReuseIdentifier:ID];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 2;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 4;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    LMJCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    
    NSString *name = nil;
    if(indexPath.section == 0)
    {
        name = [NSString stringWithFormat:@"Snip20160729_%lu", indexPath.item+1];
    }
    else
    {
        name = [NSString stringWithFormat:@"Snip20160729_%lu", indexPath.item+4];
    }
    
    cell.image = [UIImage imageNamed:name];
    
    return cell;
}

@end