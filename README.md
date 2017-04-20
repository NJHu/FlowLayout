# UICollectionViewLayout各种布局

## 主要是以代理的方式去实现

### JD京东商城首页布局

<img src="./images/jdHome.png" width="200" height="300">

```objc


@class LMJElementsFlowLayout;


@protocol LMJElementsFlowLayoutDelegate <NSObject>

@required
/**
 *  要求实现
 *
 *  @param waterflowLayout 哪个布局需要代理返回大小
 *  @param  indexPath          对应的cell, 的indexPath, 但是indexPath.section == 0
 *
 *  @return 需要代理高度对应的cell的高度
 */
- (CGSize)waterflowLayout:(LMJElementsFlowLayout *)waterflowLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath;



@optional

/**
 *  竖直方向的间距, 默认10
 */
- (CGFloat)waterflowLayouOftMarginBetweenColumns:(LMJElementsFlowLayout *)waterflowLayout;
/**
 *  水平方向的间距, 默认10
 */
- (CGFloat)waterflowLayoutOfMarginBetweenLines:(LMJElementsFlowLayout *)waterflowLayout;

/**
 *  距离collectionView四周的间距, 默认10, 顶部是20
 */
- (UIEdgeInsets)waterflowLayoutOfEdgeInsets:(LMJElementsFlowLayout *)waterflowLayout;


@end


@interface LMJElementsFlowLayout : UICollectionViewLayout

/** layout的代理 */
@property (weak, nonatomic) id<LMJElementsFlowLayoutDelegate> delegate;
@end

```

###  水平流水布局

<img src="./images/HL.png" width="200" height="300">

```objc

@class LMJHorizontalFlowLayout;


@protocol LMJHorizontalFlowLayoutDelegate <NSObject>

@required
/**
 *  要求实现
 *
 *  @param waterflowLayout 哪个布局需要代理返回高度
 *  @param  indexPath          对应的cell, 的indexPath, 但是indexPath.section == 0
 *  @param itemHeight           layout内部计算的高度
 *
 *  @return 需要代理高度对应的cell的高度
 */
- (CGFloat)waterflowLayout:(LMJHorizontalFlowLayout *)waterflowLayout widthForItemAtIndexPath:(NSIndexPath *)indexPath itemHeight:(CGFloat)itemHeight;
@optional

/**
 *  需要显示的行数, 默认3
 */
- (NSInteger)waterflowLayoutOfLines:(LMJHorizontalFlowLayout *)waterflowLayout;
/**
 *  竖直方向的间距, 默认10
 */
- (CGFloat)waterflowLayouOftMarginBetweenColumns:(LMJHorizontalFlowLayout *)waterflowLayout;
/**
 *  水平方向的间距, 默认10
 */
- (CGFloat)waterflowLayoutOfMarginBetweenLines:(LMJHorizontalFlowLayout *)waterflowLayout;

/**
 *  距离collectionView四周的间距, 默认{10, 10, 10, 10}
 */
- (UIEdgeInsets)waterflowLayoutOfEdgeInsets:(LMJHorizontalFlowLayout *)waterflowLayout;


@end



@interface LMJHorizontalFlowLayout : UICollectionViewLayout

/** layout的代理 */
@property (weak, nonatomic) id<LMJHorizontalFlowLayoutDelegate> delegate;
@end


```

### 垂直流水布局

<img src="./images/vL.png" width="200" height="300">

```

@class LMJVerticalFlowLayout;


@protocol LMJVerticalFlowLayoutDelegate <NSObject>

@required
/**
 *  要求实现
 *
 *  @param waterflowLayout 哪个布局需要代理返回高度
 *  @param  indexPath          对应的cell, 的indexPath, 但是indexPath.section == 0
 *  @param width           layout内部计算的宽度
 *
 *  @return 需要代理高度对应的cell的高度
 */
- (CGFloat)waterflowLayout:(LMJVerticalFlowLayout *)waterflowLayout heightForItemAtIndexPath:(NSIndexPath *)indexPath itemWidth:(CGFloat)itemWidth;
@optional

/**
 *  需要显示的列数, 默认3
 */
- (NSInteger)waterflowLayoutOfColumns:(LMJVerticalFlowLayout *)waterflowLayout;
/**
 *  竖直方向的间距, 默认10
 */
- (CGFloat)waterflowLayouOftMarginBetweenColumns:(LMJVerticalFlowLayout *)waterflowLayout;
/**
 *  水平方向的间距, 默认10
 */
- (CGFloat)waterflowLayoutOfMarginBetweenLines:(LMJVerticalFlowLayout *)waterflowLayout;

/**
 *  距离collectionView四周的间距, 默认{20, 10, 10, 10}
 */
- (UIEdgeInsets)waterflowLayoutOfEdgeInsets:(LMJVerticalFlowLayout *)waterflowLayout;


@end



@interface LMJVerticalFlowLayout : UICollectionViewLayout

/** layout的代理 */
@property (weak, nonatomic) id<LMJVerticalFlowLayoutDelegate> delegate;
@end

```

### 百思不得姐图片流水布局和网络加载

<img src="./images/b1.png" width="200" height="300">


### 其他布局Demos
<img src="./images/d1.png" width="200" height="300">
<img src="./images/d2.png" width="200" height="300">
<img src="./images/d3.png" width="200" height="300">
