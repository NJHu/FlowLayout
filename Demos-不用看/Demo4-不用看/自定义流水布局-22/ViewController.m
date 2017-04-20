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
#import "LMJGirdLayout.h"

@interface ViewController ()<UICollectionViewDataSource, UICollectionViewDelegate>

/** <#digest#> */
@property (nonatomic, strong) NSMutableArray *images;
/** <#digest#> */
@property (weak, nonatomic) UICollectionView *collectionView;
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
    
    
    LMJGirdLayout *lineFlowLayout = [[LMJGirdLayout alloc] init];
    
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 150, self.view.frame.size.width, 400) collectionViewLayout:lineFlowLayout];
    
//    collectionView.frame = self.view.bounds;
    [self.view addSubview:collectionView];
    
    [collectionView registerClass:[LMJPhotoCell class] forCellWithReuseIdentifier:photoID];
    
    
    collectionView.dataSource = self;
    collectionView.delegate = self;
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
//    if([self.collectionView.collectionViewLayout isKindOfClass:[LMJGirdLayout class]])
//    {
//        [self.collectionView setCollectionViewLayout:[[LMJLineFlowLayout alloc] init] animated:YES];
//    }else
//    {
//        [self.collectionView setCollectionViewLayout:[[LMJGirdLayout alloc] init] animated:YES];
//    }
    
    [self.collectionView deleteItemsAtIndexPaths:@[[NSIndexPath indexPathForItem:[self.collectionView numberOfItemsInSection:0]-1 inSection:0]]];
    
    [self.images removeLastObject];
    
    [self.collectionView reloadData];

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
