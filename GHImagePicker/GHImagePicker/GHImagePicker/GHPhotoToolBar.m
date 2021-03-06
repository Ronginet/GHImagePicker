//
//  GHPhotoToolBar.m
//  GHImagePicker
//
//  Created by Rong on 2018/2/24.
//  Copyright © 2018年 Rong. All rights reserved.
//

#import "GHPhotoToolBar.h"

#define GHRGBColor(r,g,b)  [UIColor colorWithRed:(r) / 255.0 green:(g) / 255.0 blue:(b) / 255.0 alpha:1.0]

@interface GHPhotoToolBar ()

@property (nonatomic, strong) UIButton *previewButton;
@property (nonatomic, strong) UIButton *originalButton;
@property (nonatomic, strong) UIButton *sendButton;

@end

@implementation GHPhotoToolBar

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.7];
    
    self.previewButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.previewButton setTitle:@"预览" forState:UIControlStateNormal];
    [self.previewButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.previewButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateDisabled];
    self.previewButton.titleLabel.font = [UIFont systemFontOfSize:16];
    self.previewButton.enabled = NO;
    [self.previewButton addTarget:self action:@selector(previewButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.previewButton];
    
    self.originalButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.originalButton setTitle:@"原图" forState:UIControlStateNormal];
    [self.originalButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.originalButton setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    [self.originalButton setImage:[UIImage imageNamed:@""] forState:UIControlStateSelected];
    self.originalButton.titleLabel.font = [UIFont systemFontOfSize:12];
    [self.originalButton addTarget:self action:@selector(originalButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.originalButton];
    
    self.sendButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.sendButton setTitle:@"发送" forState:UIControlStateNormal];
    [self.sendButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.sendButton setTitleColor:[UIColor colorWithWhite:1 alpha:0.5] forState:UIControlStateDisabled];
    self.sendButton.titleLabel.font = [UIFont systemFontOfSize:15];
    // GHRGBColor(38, 171, 40)
    [self.sendButton setBackgroundColor:GHRGBColor(26, 81, 26)];
    self.sendButton.layer.cornerRadius = 6.0;
    [self.sendButton.layer masksToBounds];
    self.sendButton.enabled = NO;
    [self.sendButton addTarget:self action:@selector(sendButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.sendButton];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat margin = 12;
    CGSize size = [self.previewButton.titleLabel.text sizeWithAttributes:@{NSFontAttributeName : self.previewButton.titleLabel.font}];
    self.previewButton.frame = CGRectMake(margin, self.bounds.size.height / 2 - size.height / 2, size.width, size.height);
    
    self.originalButton.frame = CGRectMake(self.bounds.size.width / 2 - 60 / 2, self.bounds.size.height / 2 - self.originalButton.imageView.image.size.height / 2, 60, self.originalButton.imageView.image.size.height);
    
    size = [self.sendButton.titleLabel.text sizeWithAttributes:@{NSFontAttributeName : self.sendButton.titleLabel.font}];
    CGFloat sendButtonWidth = size.width + 30;
    CGFloat sendButtonHeight = size.height + 15;
    self.sendButton.frame = CGRectMake(self.bounds.size.width - margin - sendButtonWidth, self.bounds.size.height / 2 - sendButtonHeight / 2, sendButtonWidth, sendButtonHeight);
}

#pragma mark - Public

#pragma mark - Private

- (void)previewButtonClicked:(UIButton *)btn {
    
}

- (void)originalButtonClicked:(UIButton *)btn {
    
}

- (void)sendButtonClicked:(UIButton *)btn {
    
}

@end
