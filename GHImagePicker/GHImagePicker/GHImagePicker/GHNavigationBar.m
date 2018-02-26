//
//  GHNavigationBar.m
//  GHImagePicker
//
//  Created by Rong on 2018/2/26.
//  Copyright © 2018年 Rong. All rights reserved.
//

#import "GHNavigationBar.h"

@interface GHNavigationBar ()

@property (nonatomic, strong) UIButton *backButton;
@property (nonatomic, strong) UIButton *selectButton;

@end

@implementation GHNavigationBar

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.7];
    
    self.backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.backButton setImage:[UIImage imageNamed:@"GHImagePicker.bundle/image_picker_back_arrow"] forState:UIControlStateNormal];
    [self.backButton addTarget:self action:@selector(backButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.backButton];
    
    self.selectButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.selectButton setImage:[UIImage imageNamed:@"GHImagePicker.bundle/image_picker_normal"] forState:UIControlStateNormal];
    [self.selectButton setImage:[UIImage imageNamed:@"GHImagePicker.bundle/image_picker_selected"] forState:UIControlStateSelected];
    [self.selectButton addTarget:self action:@selector(selectButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.selectButton];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGSize backImageSize = self.backButton.imageView.image.size;
    self.backButton.frame = CGRectMake(15, self.bounds.size.height / 2 - backImageSize.height / 2, backImageSize.width, backImageSize.height);
    
    CGSize selectImageSize = self.selectButton.imageView.image.size;
    self.selectButton.frame = CGRectMake(self.bounds.size.width - selectImageSize.width - 15, self.bounds.size.height / 2 - selectImageSize.height / 2, selectImageSize.width, selectImageSize.height);
}

#pragma mark - Public

#pragma mark - Private

- (void)backButtonClicked:(UIButton *)btn {
    if (self.backButtonBlock) {
        self.backButtonBlock();
    }
}

- (void)selectButtonClicked:(UIButton *)btn {
    btn.selected = !btn.isSelected;
    if (self.selectButtonBlock) {
        self.selectButtonBlock();
    }
}

@end
