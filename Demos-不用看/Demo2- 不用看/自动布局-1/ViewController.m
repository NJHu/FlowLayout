//
//  ViewController.m
//  自动布局-1
//
//  Created by 赵帅 on 16/7/29.
//  Copyright © 2016年 97. All rights reserved.
//

#import "ViewController.h"
#import "LMJLineLayout.h"
#import "LMJPhotoCell.h"

@interface ViewController ()<UICollectionViewDataSource, UICollectionViewDelegate>

@end

@implementation ViewController
static NSString *const ID = @"photo";
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
    LMJLineLayout *layout = [[LMJLineLayout alloc] init];
//    layout.itemSize = CGSizeMake(200, 200);
//    layout.minimumInteritemSpacing = 100;
////    layout.minimumLineSpacing = 44;
//    layout.minimumLineSpacing = 0;
////    layout.sectionInset = UIEdgeInsetsMake(0, 100, 0, 100);
//    
//    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;

    
    CGRect frame = CGRectMake(0, 150, self.view.frame.size.width, self.view.frame.size.width);
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:frame collectionViewLayout:layout];

    collectionView.backgroundColor = [UIColor blackColor];
    
    collectionView.dataSource = self;
    
    [self.view addSubview:collectionView];
    
//    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:ID];
    
//    CGFloat inset = collectionView.frame.size.width - layout.itemSize.width;
//    layout.sectionInset = UIEdgeInsetsMake(0, inset/2, 0, inset/2);
    
    
    UINib *nib = [UINib nibWithNibName:NSStringFromClass([LMJPhotoCell class]) bundle:nil];
    
    [collectionView registerNib:nib forCellWithReuseIdentifier:@"photo"];
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
    LMJPhotoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    
//    cell.backgroundColor = [UIColor redColor];
    
    NSString *imageName = [NSString stringWithFormat:@"%zd", arc4random_uniform(20)+1];
    
    cell.image = [UIImage imageNamed:imageName];
    
    return cell;
}


@end
