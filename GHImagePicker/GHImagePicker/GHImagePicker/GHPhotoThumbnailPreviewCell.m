//
//  GHPhotoThumbnailPreviewCell.m
//  GHImagePicker
//
//  Created by Rong on 2018/2/26.
//  Copyright © 2018年 Rong. All rights reserved.
//

#import "GHPhotoThumbnailPreviewCell.h"

@interface GHPhotoThumbnailPreviewCell ()

@property (nonatomic, strong) UIImageView *photoView;

@end

@implementation GHPhotoThumbnailPreviewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    self.photoView = [UIImageView new];
    self.photoView.frame = self.bounds;
    [self addSubview:self.photoView];
}

#pragma mark - Public

+ (NSString *)reuseIdentifier {
    return NSStringFromClass([self class]);
}

#pragma mark - Getter,Setter

- (void)setPhoto:(UIImage *)photo {
    _photo = photo;
    
    self.photoView.image = photo;
}

@end
