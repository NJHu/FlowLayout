//
//  LMJShopViewController.m
//  瀑布流核心计算-1
//
//  Created by apple on 16/7/30.
//  Copyright © 2016年 NJHu. All rights reserved.
//

#import "LMJShopViewController.h"
#import "LMJWaterflowLayout.h"

@interface LMJShopViewController ()

@end

@implementation LMJShopViewController


static NSString *const ID = @"shop";
- (instancetype)init
{
    
    return [super initWithCollectionViewLayout:[[LMJWaterflowLayout alloc] init]];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor redColor];
    self.collectionView.backgroundColor = [UIColor greenColor];
    
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:ID];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 50;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor redColor];
    
    UILabel *label = [cell viewWithTag:10];
    
    if(label == nil)
    {
        label = [[UILabel alloc] init];
        label.tag = 10;
        [cell.contentView addSubview:label];
    }
    label.text = [NSString stringWithFormat:@"%zd", indexPath.item];
    [label sizeToFit];
    
    
    return cell;
}



@end