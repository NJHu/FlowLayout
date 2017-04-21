//
//  LMJShopViewController.m
//  瀑布流完善接口
//
//  Created by apple on 16/7/31.
//  Copyright © 2016年 NJHu. All rights reserved.
//

#import "LMJShopViewController.h"
#import "LMJVerticalFlowLayout.h"
#import "LMJShopCell.h"
#import "LMJShop.h"

#import <MJRefresh.h>
#import <MJExtension.h>
#import <AFNetworking.h>
#import <SVProgressHUD.h>

NSString *const LMJBaiSiJieHTTPAPI = @"http://api.budejie.com/api/api_open.php";
NSString *const LMJTopicType = @"10";

@interface LMJShopViewController () <LMJVerticalFlowLayoutDelegate>


@end

@implementation LMJShopViewController

static NSString *const shopId = @"shop";
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupCollectioView];
    
}


- (void)setupCollectioView
{
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([UICollectionViewCell class])];
    
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 100;
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


#pragma mark - <LMJVerticalFlowLayoutDelegate>
- (CGFloat)waterflowLayout:(LMJVerticalFlowLayout *)waterflowLayout collectionView:(UICollectionView *)collectionView heightForItemAtIndexPath:(NSIndexPath *)indexPath itemWidth:(CGFloat)itemWidth
{
    return ((arc4random()) % 7 + 1) * itemWidth;
}

/**
 *  需要显示的列数, 默认3
 */
- (NSInteger)waterflowLayout:(LMJVerticalFlowLayout *)waterflowLayout columnsInCollectionView:(UICollectionView *)collectionView
{
    return 4;
}
/**
 *  列间距, 默认10
 */
- (CGFloat)waterflowLayout:(LMJVerticalFlowLayout *)waterflowLayout columnsMarginInCollectionView:(UICollectionView *)collectionView
{
    return 10;
}
/**
 *  行间距, 默认10
 */
- (CGFloat)waterflowLayout:(LMJVerticalFlowLayout *)waterflowLayout collectionView:(UICollectionView *)collectionView linesMarginForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.item % 5) {
        return 10;
    }else
    {
        return 30;
    }
}

/**
 *  距离collectionView四周的间距, 默认{20, 10, 10, 10}
 */
- (UIEdgeInsets)waterflowLayout:(LMJVerticalFlowLayout *)waterflowLayout edgeInsetsInCollectionView:(UICollectionView *)collectionView
{
    
    return UIEdgeInsetsMake(20, 5, 40, 10);
}




- (instancetype)init
{
    
    LMJVerticalFlowLayout *layout = [[LMJVerticalFlowLayout alloc] initWithDelegate:self];

    if(self = [super initWithCollectionViewLayout:layout])
    {
        
    }
    
    return self;
}



@end
