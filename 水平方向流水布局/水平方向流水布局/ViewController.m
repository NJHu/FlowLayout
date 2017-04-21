//
//  ViewController.m
//  水平方向流水布局
//
//  Created by HuXuPeng on 2017/4/20.
//  Copyright © 2017年 HuXuPeng. All rights reserved.
//

#import "ViewController.h"
#import "LMJWaterflowLayout/LMJHorizontalFlowLayout.h"


@interface ViewController () <UICollectionViewDelegate, UICollectionViewDataSource, LMJHorizontalFlowLayoutDelegate>

/** <#digest#> */
@property (weak, nonatomic) UICollectionView *collectionView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.collectionView.backgroundColor = self.view.backgroundColor;
    
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([UICollectionViewCell class])];
    
    self.collectionView.frame = CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 300);
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
        LMJHorizontalFlowLayout *myLayout = [[LMJHorizontalFlowLayout alloc] initWithDelegate:self];
        
        
        
        UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:myLayout];
        [self.view addSubview:collectionView];
        _collectionView = collectionView;
        
        collectionView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        
        collectionView.dataSource = self;
        collectionView.delegate = self;
        
    }
    return _collectionView;
}



- (CGFloat)waterflowLayout:(LMJHorizontalFlowLayout *)waterflowLayout collectionView:(UICollectionView *)collectionView widthForItemAtIndexPath:(NSIndexPath *)indexPath itemHeight:(CGFloat)itemHeight
{
    
    return ((arc4random()) % 6 + 1)* itemHeight;
}

- (CGFloat)waterflowLayout:(LMJHorizontalFlowLayout *)waterflowLayout collectionView:(UICollectionView *)collectionView columnsMarginForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.item % 5) {
        return 30;
    }else
    {
        return 10;
    }
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
