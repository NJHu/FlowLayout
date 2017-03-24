# FlowLayout
瀑布流的多种多样实现

###在这个文件夹:`瀑布流完善接口`

![](http://www.xker.com/xkerfiles/allimg/1109/22114Cb8-0.jpg)


```objc

@class LMJWaterflowLayout;


@protocol LMJWaterflowLayoutDelegate <NSObject>

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
- (CGFloat)waterflowLayout:(LMJWaterflowLayout *)waterflowLayout heightForItemAtIndexPath:(NSIndexPath *)indexPath itemWidth:(CGFloat)itemWidth;
@optional

/**
 *  需要显示的列数
 */
- (NSInteger)waterflowLayoutOfColumns:(LMJWaterflowLayout *)waterflowLayout;
/**
 *  竖直方向的间距
 */
- (CGFloat)waterflowLayouOftMarginBetweenColumns:(LMJWaterflowLayout *)waterflowLayout;
/**
 *  水平方向的间距
 */
- (CGFloat)waterflowLayoutOfMarginBetweenLines:(LMJWaterflowLayout *)waterflowLayout;

/**
 *  距离collectionView四周的间距
 */
- (UIEdgeInsets)waterflowLayoutOfEdgeInsets:(LMJWaterflowLayout *)waterflowLayout;


@end



@interface LMJWaterflowLayout : UICollectionViewLayout

/** layout的代理 */
@property (weak, nonatomic) id<LMJWaterflowLayoutDelegate> delegate;
@end
```
