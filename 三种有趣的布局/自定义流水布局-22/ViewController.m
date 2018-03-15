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
#import "LMJCircleLayout.h"


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
    
    UICollectionViewLayout *lineFlowLayout = [[LMJCircleLayout alloc] init];
    
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height * 0.8) collectionViewLayout:lineFlowLayout];
    
    [self.view addSubview:collectionView];
    self.collectionView = collectionView;
    collectionView.dataSource = self;
    collectionView.delegate = self;
    
    [collectionView registerClass:[LMJPhotoCell class] forCellWithReuseIdentifier:photoID];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
    if([self.collectionView.collectionViewLayout isKindOfClass:[LMJGirdLayout class]])
    {
        LMJLineFlowLayout *lineLayout = [[LMJLineFlowLayout alloc] init];
        lineLayout.itemSize = CGSizeMake(100, 100);
        [self.collectionView setCollectionViewLayout:lineLayout  animated:YES];
        
    }else if ([self.collectionView.collectionViewLayout isKindOfClass:[LMJCircleLayout class]])
    {
        LMJGirdLayout *gird = [[LMJGirdLayout alloc] init];
        [self.collectionView setCollectionViewLayout:gird animated:YES];
        
    } else {
        
        [self.collectionView setCollectionViewLayout:[[LMJCircleLayout alloc] init]animated:YES];
        
    }
    
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
    [self.images removeObjectAtIndex:indexPath.item];
    [self.collectionView deleteItemsAtIndexPaths:@[indexPath]];
}


@end
