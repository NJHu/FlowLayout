//
//  LMJShop.h
//  瀑布流完善接口
//
//  Created by apple on 16/7/31.
//  Copyright © 2016年 NJHu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LMJShop : NSObject
/** 高度 */
@property (assign, nonatomic) CGFloat h;

/** 宽度 */
@property (assign, nonatomic) CGFloat w;

/** 价格 */
@property (nonatomic, copy) NSString *price;

/** 图标 */
@property (nonatomic, copy) NSString *img;

/** name */
@property (nonatomic, copy) NSString *name;

/** 宽度 */
@property (assign, nonatomic) CGFloat width;

/** 高度 */
@property (assign, nonatomic) CGFloat height;

/** image1 */
@property (nonatomic, copy) NSString *image1;

@end
