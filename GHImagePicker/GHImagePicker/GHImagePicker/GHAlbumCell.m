//
//  GHAlbumCell.m
//  GHImagePicker
//
//  Created by Rong on 2018/2/24.
//  Copyright © 2018年 Rong. All rights reserved.
//

#import "GHAlbumCell.h"

static CGFloat const rowHeight = 55;

@implementation GHAlbumModel

@end

#pragma mark -

@interface GHAlbumCell ()

@property (nonatomic, strong) UIImageView *photoView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *countLabel;

@end

@implementation GHAlbumCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    self.photoView = [UIImageView new];
    [self addSubview:self.photoView];
    
    self.titleLabel = [UILabel new];
    //    self.titleLabel.backgroundColor = [UIColor redColor];
    self.titleLabel.font = [UIFont boldSystemFontOfSize:15];
    [self addSubview:self.titleLabel];
    
    self.countLabel = [UILabel new];
    //    self.countLabel.backgroundColor = [UIColor purpleColor];
    self.countLabel.font = [UIFont systemFontOfSize:15];
    self.countLabel.textColor = [UIColor lightGrayColor];
    [self addSubview:self.countLabel];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.photoView.frame = CGRectMake(0, 0, rowHeight, rowHeight);
    
    CGSize size1 = [self.titleLabel.text sizeWithAttributes:@{NSFontAttributeName : self.titleLabel.font}];
    self.titleLabel.frame = CGRectMake(CGRectGetMaxX(self.photoView.frame) + 8, CGRectGetHeight(self.photoView.frame) / 2 - size1.height / 2, size1.width, size1.height);
    
    CGSize size2 = [self.countLabel.text sizeWithAttributes:@{NSFontAttributeName : self.countLabel.font}];
    self.countLabel.frame = CGRectMake(CGRectGetMaxX(self.titleLabel.frame) + 15, CGRectGetMinY(self.titleLabel.frame), size2.width, size2.height);
    
}

+ (NSString *)reuseIdentifier {
    return NSStringFromClass([self class]);
}

+ (CGFloat)cellRowHeight {
    return rowHeight;
}

#pragma mark - Getter

- (void)setAlbumModel:(GHAlbumModel *)albumModel {
    _albumModel = albumModel;
    
    self.photoView.image = albumModel.lastImage;
    self.titleLabel.text = albumModel.title;
    self.countLabel.text = [NSString stringWithFormat:@"(%@)",albumModel.amount];
}

@end
