//
//  ViewController.m
//  自定义流水布局-22
//
//  Created by apple on 16/7/30.
//  Copyright © 2016年 NJHu. All rights reserved.
//

#import "ViewController.h"
#import "LMJLineFlowLayout.h"
#import "LMJPhotoCell.h"

@interface ViewController ()<UICollectionViewDataSource, UICollectionViewDelegate>

/** <#digest#> */
@property (nonatomic, strong) NSMutableArray *images;

@end

@implementation ViewController


- (NSMutableArray *)images
{
    if(_images == nil)
    {
        _images = [NSMutableArray array];
        
        for (NSInteger i = 1; i < 21; i++) {
            
            [_images addObject:[UIImage imageNamed:[NSString stringWithFormat:@"%zd", i]]];
        }
    }
    return _images;
}

static NSString *const photoID = @"photo";
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    LMJLineFlowLayout *lineFlowLayout = [[LMJLineFlowLayout alloc] init];
    
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 150, self.view.frame.size.width, 250) collectionViewLayout:lineFlowLayout];
    [self.view addSubview:collectionView];
    
    [collectionView registerClass:[LMJPhotoCell class] forCellWithReuseIdentifier:photoID];
    
    
    collectionView.dataSource = self;
    collectionView.delegate = self;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.images.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    LMJPhotoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:photoID forIndexPath:indexPath];
    
    cell.image = self.images[indexPath.item];
    
    return cell;
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
}


@end
