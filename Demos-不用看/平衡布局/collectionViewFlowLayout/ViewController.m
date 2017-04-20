//
//  ViewController.m
//  collectionViewFlowLayout
//
//  Created by HuXuPeng on 2017/4/19.
//  Copyright © 2017年 HuXuPeng. All rights reserved.
//

#import "ViewController.h"
#import "LMJBalancedFlowLayout.h"

@interface ViewController () <UICollectionViewDelegate, UICollectionViewDataSource, LMJBalancedFlowLayoutDelegate>

/** <#digest#> */
@property (weak, nonatomic) UICollectionView *collectionView;

/** <#digest#> */
@property (nonatomic, strong) NSMutableArray<NSValue *> *elementsHight;

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
    return self.elementsHight.count;
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

- (CGSize)waterflowLayout:(LMJBalancedFlowLayout *)waterflowLayout collectionView:(UICollectionView *)collectionView sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return [self.elementsHight[indexPath.item] CGSizeValue];
}


#pragma mark - scrollDeleggate


- (UICollectionView *)collectionView
{
    if(_collectionView == nil)
    {
        LMJBalancedFlowLayout *myLayout = [[LMJBalancedFlowLayout alloc] init];
        
        UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:myLayout];
        [self.view addSubview:collectionView];
        _collectionView = collectionView;
        
        collectionView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        
        collectionView.dataSource = self;
        collectionView.delegate = self;
        
    }
    return _collectionView;
}



- (NSMutableArray<NSValue *> *)elementsHight
{
    if(_elementsHight == nil)
    {
        _elementsHight = [NSMutableArray array];
        
        for (NSInteger i = 0; i < 1000; i++) {
            
//            if (i == 0) {
//                
//                [_elementsHight addObject:[NSValue valueWithCGSize:CGSizeMake([UIScreen mainScreen].bounds.size.width, 150)]];
//                
//            }else if (i == 1)
//            {
//                
//                [_elementsHight addObject:[NSValue valueWithCGSize:CGSizeMake([UIScreen mainScreen].bounds.size.width - 20, 100)]];
//                
//            }else if (i == 2)
//            {
//                
//                [_elementsHight addObject:[NSValue valueWithCGSize:CGSizeMake([UIScreen mainScreen].bounds.size.width - 50, 60)]];
//                
//            }else if (i == 3)
//            {
//                
//                [_elementsHight addObject:[NSValue valueWithCGSize:CGSizeMake([UIScreen mainScreen].bounds.size.width - 10, 300)]];
//            }else
//            {
//                
//                [_elementsHight addObject:[NSValue valueWithCGSize:CGSizeMake(([UIScreen mainScreen].bounds.size.width - 30) * 0.5, ([UIScreen mainScreen].bounds.size.width - 30) * 0.5 * 0.8)]];
//            }
//            
            [_elementsHight addObject:[NSValue valueWithCGSize:CGSizeMake(arc4random() % 300 + 44, arc4random() % 300 + 44)]];
            
        }
    }
    return _elementsHight;
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
