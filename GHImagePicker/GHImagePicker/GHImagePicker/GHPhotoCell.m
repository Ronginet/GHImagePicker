//
//  GHPhotoCell.m
//  GHImagePicker
//
//  Created by Rong on 2018/2/24.
//  Copyright © 2018年 Rong. All rights reserved.
//

#import "GHPhotoCell.h"
#import <QuartzCore/QuartzCore.h>

@interface GHPhotoCell ()

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIButton *selectButton;

@end

@implementation GHPhotoCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    self.imageView = [UIImageView new];
    self.imageView.frame = self.bounds;
    [self addSubview:self.imageView];
    
    self.selectButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.selectButton setImage:[UIImage imageNamed:@"GHImagePicker.bundle/image_picker_normal"] forState:UIControlStateNormal];
    [self.selectButton setImage:[UIImage imageNamed:@"GHImagePicker.bundle/image_picker_selected"] forState:UIControlStateSelected];
    [self.selectButton addTarget:self action:@selector(selectButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.selectButton];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat margin = 3;
    CGSize size = self.selectButton.imageView.image.size;
    self.selectButton.frame = CGRectMake(self.bounds.size.width - size.width - margin, margin, size.width, size.height);
}

#pragma mark - Public

+ (NSString *)reuseIdentifier {
    return NSStringFromClass([self class]);
}

#pragma mark - Private

- (void)selectButtonClicked:(UIButton *)btn {
    btn.selected = !btn.isSelected;
    if (btn.isSelected) {
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
        animation.fromValue = [NSNumber numberWithFloat:1.3];
        animation.toValue = [NSNumber numberWithFloat:0.7];
        animation.duration = 0.3;
        animation.repeatCount = 1;
        animation.fillMode = kCAFillModeForwards;
        [btn.layer addAnimation:animation forKey:nil];
    }
    if (self.selectButtonBlock) {
        self.selectButtonBlock(self.imageView.image, btn.isSelected);
    }
}

#pragma mark - Getter,Setter

- (void)setImage:(UIImage *)image {
    _image = image;
    
    self.imageView.image = image;
}

@end
