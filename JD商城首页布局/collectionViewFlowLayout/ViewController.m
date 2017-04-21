//
//  ViewController.m
//  collectionViewFlowLayout
//
//  Created by HuXuPeng on 2017/4/19.
//  Copyright © 2017年 HuXuPeng. All rights reserved.
//

#import "ViewController.h"
#import "LMJElementsFlowLayout.h"

@interface ViewController () <UICollectionViewDelegate, UICollectionViewDataSource, LMJElementsFlowLayoutDelegate>

/** <#digest#> */
@property (weak, nonatomic) UICollectionView *collectionView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.collectionView.backgroundColor = self.view.backgroundColor;
    
        [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([UICollectionViewCell class])];
}

#pragma mark - delegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 50;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([UICollectionViewCell class]) forIndexPath:indexPath];
    
    cell.contentView.backgroundColor = [UIColor yellowColor];
    
    
    if (![cell.contentView viewWithTag:100]) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
        label.tag = 100;
        label.textColor = [UIColor redColor];
        label.font = [UIFont boldSystemFontOfSize:17];
        [cell.contentView addSubview:label];
    }
    
    UILabel *label = [cell.contentView viewWithTag:100];
    
    label.text = [NSString stringWithFormat:@"%zd", indexPath.item];
    
    
    return cell;
}


#pragma mark - scrollDeleggate


- (UICollectionView *)collectionView
{
    if(_collectionView == nil)
    {
        LMJElementsFlowLayout *myLayout = [[LMJElementsFlowLayout alloc] initWithDelegate:self];

        
        UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:myLayout];
        [self.view addSubview:collectionView];
        _collectionView = collectionView;
        
        collectionView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        
        collectionView.dataSource = self;
        collectionView.delegate = self;
        
    }
    return _collectionView;
}


#pragma mark - LMJElementsFlowLayoutDelegate

- (CGSize)waterflowLayout:(LMJElementsFlowLayout *)waterflowLayout collectionView:(UICollectionView *)collectionView sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
//    return CGSizeMake((indexPath.item % 10 + 1) * 30, (indexPath.item % 10 + 1) * 30);
    
    if (indexPath.item == 0) {
        
        return CGSizeMake([UIScreen mainScreen].bounds.size.width, 150);
        
    }else if (indexPath.item == 1)
    {
        return CGSizeMake([UIScreen mainScreen].bounds.size.width - 20, 100);
        
    }else if (indexPath.item == 2)
    {
        return CGSizeMake([UIScreen mainScreen].bounds.size.width * 0.38, 60);
        
    }else if (indexPath.item == 3)
    {
        return CGSizeMake([UIScreen mainScreen].bounds.size.width - 10, 300);
    }else
    {
        return CGSizeMake(([UIScreen mainScreen].bounds.size.width - 5) * 0.5, ([UIScreen mainScreen].bounds.size.width - 5) * 0.5 / 0.8);
    }
}


- (CGFloat)waterflowLayout:(LMJElementsFlowLayout *)waterflowLayout collectionView:(UICollectionView *)collectionView linesMarginForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.item <= 3) {
        return 5;
    }else
    {
        return 15;
    }
}

- (CGFloat)waterflowLayout:(LMJElementsFlowLayout *)waterflowLayout collectionView:(UICollectionView *)collectionView columnsMarginForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return 5;
}

- (UIEdgeInsets)waterflowLayout:(LMJElementsFlowLayout *)waterflowLayout edgeInsetsInCollectionView:(UICollectionView *)collectionView
{
    return UIEdgeInsetsMake(20, 0, 20, 0);
}





@end



@implementation UIColor (Random)
+ (UIColor *)RandomColor {
    NSInteger aRedValue = arc4random() % 255;
    NSInteger aGreenValue = arc4random() % 255;
    NSInteger aBlueValue = arc4random() % 255;
    UIColor *randColor = [UIColor colorWithRed:aRedValue / 255.0f green:aGreenValue / 255.0f blue:aBlueValue / 255.0f alpha:1.0f];
    return randColor;
}
@end
