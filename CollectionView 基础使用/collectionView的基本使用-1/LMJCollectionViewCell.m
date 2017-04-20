//
//  LMJCollectionViewCell.m
//  collectionView的基本使用-1
//
//  Created by apple on 16/7/29.
//  Copyright © 2016年 NJHu. All rights reserved.
//

#import "LMJCollectionViewCell.h"

@interface LMJCollectionViewCell ()

/** <#digest#> */
@property (weak, nonatomic) UIImageView *imageView;
@end


@implementation LMJCollectionViewCell

- (UIImageView *)imageView
{
    if(_imageView == nil)
    {
        UIImageView *imageView = [[UIImageView alloc] init];
        
        [self.contentView addSubview:imageView];
        
        _imageView = imageView;
    }
    return _imageView;
}

- (void)setImage:(UIImage *)image
{
    _image = image;
    
    self.imageView.image = image;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.imageView.frame = self.bounds;
}

@end
