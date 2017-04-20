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

/** 所有的模型数据 */
@property (nonatomic, strong) NSMutableArray *shops;

/** manager */
@property (nonatomic, strong) AFHTTPSessionManager *manager;

/** 以最后一次的请求为准 */
@property (nonatomic, strong) NSDictionary *params;

/** 第几页的数据 */
@property (assign, nonatomic) NSInteger page;

/** 记录上次返回的maxtime, 加载下一页 */
@property (nonatomic, copy) NSString *maxtime;

@end

@implementation LMJShopViewController

static NSString *const shopId = @"shop";
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupCollectioView];
    
    [self addHeaderFooterView];
}


- (void)addHeaderFooterView
{
    self.collectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(headerPull)];
    self.collectionView.mj_header.automaticallyChangeAlpha = YES;
    
    [self.collectionView.mj_header beginRefreshing];
    
    
    self.collectionView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(footerPull)];
    self.collectionView.mj_footer.automaticallyHidden = YES;
    self.collectionView.mj_footer.automaticallyChangeAlpha = YES;

}

- (void)headerPull
{
    if(self.collectionView.mj_footer.isRefreshing) [self.collectionView.mj_footer endRefreshing];
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    params[@"a"] = @"list";
    params[@"c"] = @"data";
    params[@"type"] = LMJTopicType;
    
    // 记录操作
    self.params = params;
    // 第一次加载帖子时候不需要传入此关键字，当需要加载下一页时：需要传入加载上一页时返回值字段“maxtime”中的内容
//    params[@"maxtime"] = @"";
//    当前所加载的页码数，默认为0
//    params[@"page"] = @"0";
    
    
    [self.manager GET:LMJBaiSiJieHTTPAPI parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
        if (self.params != params) return ;
        
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (self.params != params) return ;
        
        // 清空数据, 并且添加最新的数据
        self.shops = [LMJShop mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        // 记录返回的maxtime
        self.maxtime = responseObject[@"info"][@"maxtime"];
        
        // 页码归零
        self.page = 0;
        
        // 刷新collection
        [self.collectionView reloadData];
        
        // 结束header的刷新
        [self.collectionView.mj_header endRefreshing];
        
        // 判断有没有更多的数据
        if(self.shops.count >= [responseObject[@"info"][@"count"] integerValue])
        {
            [self.collectionView.mj_footer setState:MJRefreshStateNoMoreData];
        }else
        {
            [self.collectionView.mj_footer setState:MJRefreshStateIdle];
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (self.params != params) return ;
        
        //请求数据失败后, 提示用户
        [SVProgressHUD showErrorWithStatus:@"加载新数据失败"];
        
        // 结束刷新
        [self.collectionView.mj_header endRefreshing];
        
    }];
    
    
}

- (void)footerPull
{
    // 防止用户快速上下拖拽, 造成上下的视图都在刷新
    if(self.collectionView.mj_header.isRefreshing) [self.collectionView.mj_header endRefreshing];
    
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    params[@"a"] = @"list";
    params[@"c"] = @"data";
    params[@"type"] = LMJTopicType;
    // 第一次加载帖子时候不需要传入此关键字，当需要加载下一页时：需要传入加载上一页时返回值字段“maxtime”中的内容
    params[@"maxtime"] = self.maxtime;
    //    当前所加载的页码数，默认为0
    params[@"page"] = @(self.page + 1);
    
    // 记录操作
    self.params = params;
    
    
    [self.manager GET:LMJBaiSiJieHTTPAPI parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
        if(self.params != params) return ;
        
    
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if(self.params != params) return ;
        
        // 添加数据
        [self.shops addObjectsFromArray:[LMJShop mj_objectArrayWithKeyValuesArray:responseObject[@"list"]]];
        
        // 记录页码
        self.page += 1;
        
        // 记录需要加载下一页的数据
        self.maxtime = responseObject[@"info"][@"maxtime"];
        
        
        // 刷新collection
        [self.collectionView reloadData];
        
        // 结束尾部的刷新
        [self.collectionView.mj_footer endRefreshing];
        
        // 判断数据是否加载完毕
        if(self.shops.count >= [responseObject[@"info"][@"count"] integerValue])
        {
            [self.collectionView.mj_footer setState:MJRefreshStateNoMoreData];
        }else
        {
            [self.collectionView.mj_footer setState:MJRefreshStateIdle];
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if(self.params != params) return ;
        
        // 加载更多数据失败
        [SVProgressHUD showErrorWithStatus:@"加载更多数据失败"];
        
        [self.collectionView.mj_footer endRefreshing];
        
    }];

    
}



- (void)setupCollectioView
{
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([LMJShopCell class]) bundle:nil] forCellWithReuseIdentifier:shopId];
    
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.shops.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    LMJShopCell *shopCell = [collectionView dequeueReusableCellWithReuseIdentifier:shopId forIndexPath:indexPath];
    
    shopCell.shop = self.shops[indexPath.item];
    return shopCell;
    
}


#pragma mark - <LMJVerticalFlowLayoutDelegate>
- (CGFloat)waterflowLayout:(LMJVerticalFlowLayout *)waterflowLayout heightForItemAtIndexPath:(NSIndexPath *)indexPath itemWidth:(CGFloat)itemWidth
{
    
    LMJShop *shop = self.shops[indexPath.item];
    
    
    CGFloat height = itemWidth * shop.height / shop.width;
    
    height = height > 200 ? 200 : height;
    
    return height;
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

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [self.shops removeObjectAtIndex:indexPath.item];
    
    [self.collectionView deleteItemsAtIndexPaths:@[indexPath]];
    
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

- (AFHTTPSessionManager *)manager
{
    if(_manager == nil)
    {
        _manager = [AFHTTPSessionManager manager];
    }
    return _manager;
}

- (void)dealloc
{
    self.params = nil;
    [self.manager.operationQueue cancelAllOperations];
}

@end
