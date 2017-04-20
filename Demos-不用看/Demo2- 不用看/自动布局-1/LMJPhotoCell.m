//
//  LMJPhotoCell.m
//  自动布局-1
//
//  Created by apple on 16/7/30.
//  Copyright © 2016年 97. All rights reserved.
//

#import "LMJPhotoCell.h"

@interface LMJPhotoCell ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation LMJPhotoCell

- (void)awakeFromNib {
    
    self.imageView.layer.borderColor = [UIColor whiteColor].CGColor;
    self.imageView.layer.borderWidth = 5;
}

- (void)setImage:(UIImage *)image
{
    _image = image;
    
    self.imageView.image = image;
}

@end
