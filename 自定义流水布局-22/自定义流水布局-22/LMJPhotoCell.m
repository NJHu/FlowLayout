//
//  LMJPhotoCell.m
//  自定义流水布局-22
//
//  Created by apple on 16/7/30.
//  Copyright © 2016年 NJHu. All rights reserved.
//

#import "LMJPhotoCell.h"

@interface LMJPhotoCell ()
/** <#digest#> */
@property (weak, nonatomic) UIImageView *imageView;
@end

@implementation LMJPhotoCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.layer.borderColor = [UIColor whiteColor].CGColor;
        imageView.layer.borderWidth = 5;
        
        [self.contentView addSubview:imageView];
        self.imageView = imageView;
        
    }
    return self;
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    self.imageView.frame = self.bounds;
}

- (void)setImage:(UIImage *)image
{
    _image = image;
    self.imageView.image = image;
}

@end
