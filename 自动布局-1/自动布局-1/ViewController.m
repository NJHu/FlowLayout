//
//  ViewController.m
//  自动布局-1
//
//  Created by 赵帅 on 16/7/29.
//  Copyright © 2016年 97. All rights reserved.
//

#import "ViewController.h"
#import "LMJLineLayout.h"

@interface ViewController ()<UICollectionViewDataSource, UICollectionViewDelegate>

@end

@implementation ViewController
static NSString *const ID = @"CELL";
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    CGRect frame = CGRectMake(0, 150, self.view.frame.size.width, self.view.frame.size.width);
    
    LMJLineLayout *layout = [[LMJLineLayout alloc] init];
    layout.itemSize = CGSizeMake(200, 200);
    layout.minimumInteritemSpacing = 100;
    layout.minimumLineSpacing = 44;
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:frame collectionViewLayout:layout];
    collectionView.backgroundColor = [UIColor blackColor];
    
    collectionView.dataSource = self;
    
    [self.view addSubview:collectionView];
    
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:ID];
    

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
    
    return cell;
}


@end
