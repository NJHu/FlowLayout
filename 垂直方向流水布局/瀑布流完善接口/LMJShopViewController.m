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
    return 30;
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
- (CGFloat)waterflowLayout:(LMJVerticalFlowLayout *)waterflowLayout heightForItemAtIndexPath:(NSIndexPath *)indexPath itemWidth:(CGFloat)itemWidth
{
    
    return ((arc4random()) % 4 + 1) * itemWidth;
}

- (NSInteger)waterflowLayoutOfColumns:(LMJVerticalFlowLayout *)waterflowLayout
{
    return 3;
}

- (CGFloat)waterflowLayouOftMarginBetweenColumns:(LMJVerticalFlowLayout *)waterflowLayout
{
    return 10;
}

- (CGFloat)waterflowLayoutOfMarginBetweenLines:(LMJVerticalFlowLayout *)waterflowLayout
{
    return 10;
}

- (UIEdgeInsets)waterflowLayoutOfEdgeInsets:(LMJVerticalFlowLayout *)waterflowLayout
{
    return UIEdgeInsetsMake(20, 10, 10, 10);
}


- (instancetype)init
{
    
    LMJVerticalFlowLayout *layout = [[LMJVerticalFlowLayout alloc] init];

    if(self = [super initWithCollectionViewLayout:layout])
    {
        layout.delegate = self;
    }
    
    return self;
}



@end
