//
//  LMJShopCell.m
//  瀑布流完善接口
//
//  Created by apple on 16/7/31.
//  Copyright © 2016年 NJHu. All rights reserved.
//

#import "LMJShopCell.h"
#import "LMJShop.h"
#import <UIImageView+WebCache.h>

@interface LMJShopCell ()

@property (weak, nonatomic) IBOutlet UIImageView *shopImagV;

@property (weak, nonatomic) IBOutlet UILabel *priceLabel;

@end

@implementation LMJShopCell

- (void)awakeFromNib {
    self.backgroundColor = [UIColor redColor];
}

- (void)setShop:(LMJShop *)shop
{
    _shop = shop;
    
    self.priceLabel.text = shop.name;
    
    [self.shopImagV sd_setImageWithURL:[NSURL URLWithString:shop.image1] placeholderImage:[UIImage imageNamed:@"loading"]];
}

@end
