//
//  GHPhotoThumbnailPreviewBar.m
//  GHImagePicker
//
//  Created by Rong on 2018/2/26.
//  Copyright © 2018年 Rong. All rights reserved.
//

#import "GHPhotoThumbnailPreviewBar.h"
#import "GHPhotoThumbnailPreviewFlowLayout.h"
#import "GHPhotoThumbnailPreviewCell.h"
#import "GHDefine.h"

@interface GHPhotoThumbnailPreviewBar () <UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray *photos;

@end

@implementation GHPhotoThumbnailPreviewBar

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self createCollectionView];
    }
    return self;
}

- (void)createCollectionView {
    GHPhotoThumbnailPreviewFlowLayout *flowLayout = [GHPhotoThumbnailPreviewFlowLayout new];
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    self.collectionView.backgroundColor = GHRGBColor(45, 45, 45);
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    [self addSubview:self.collectionView];
    
    [self.collectionView registerClass:[GHPhotoThumbnailPreviewCell class] forCellWithReuseIdentifier:[GHPhotoThumbnailPreviewCell reuseIdentifier]];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.collectionView.frame = self.bounds;
}

#pragma mark - Public

- (void)setupPhotos:(NSArray *)photos {
    self.photos = photos.mutableCopy;
    [self.collectionView reloadData];
}

#pragma mark - UICollectionViewDataSource,UICollectionViewDelegateFlowLayout

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.photos.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    GHPhotoThumbnailPreviewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[GHPhotoThumbnailPreviewCell reuseIdentifier] forIndexPath:indexPath];
    cell.photo = self.photos[indexPath.row];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(13, 7.5, 13, 7.5);
}

#pragma mark - Getter,Setter

- (NSMutableArray *)photos {
    if (!_photos) {
        _photos = [NSMutableArray array];
    }
    return _photos;
}

@end
