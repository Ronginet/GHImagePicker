//
//  GHPhotoListVC.m
//  GHImagePicker
//
//  Created by Rong on 2018/2/24.
//  Copyright © 2018年 Rong. All rights reserved.
//

#import "GHPhotoListVC.h"
#import "GHPhotoCell.h"
#import "GHPhotoToolBar.h"
#import "GHPhotoFlowLayout.h"
#import "UIView+Extension.h"
#import "GHPhotoPreviewVC.h"

static CGFloat const toolBarHeight = 45.0;

@interface GHPhotoListVC () <UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) GHPhotoToolBar *toolBar;
@property (nonatomic, strong) NSMutableArray *photos;

@end

@implementation GHPhotoListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(cancel)];
    [self createCollectionView];
    [self createToolBar];
}

- (void)createCollectionView {
    GHPhotoFlowLayout *flowLayout = [GHPhotoFlowLayout new];
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
    self.collectionView.gh_height = self.view.bounds.size.height - toolBarHeight;
    self.collectionView.backgroundColor = [UIColor clearColor];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    [self.view addSubview:self.collectionView];
    
    [self.collectionView registerClass:[GHPhotoCell class] forCellWithReuseIdentifier:[GHPhotoCell reuseIdentifier]];
}

- (void)createToolBar {
    self.toolBar = [GHPhotoToolBar new];
    self.toolBar.frame = CGRectMake(0, self.view.bounds.size.height - toolBarHeight, self.view.bounds.size.width, toolBarHeight);
    [self.view addSubview:self.toolBar];
}

#pragma mark - Private

- (void)cancel {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - UICollectionViewDataSource,UICollectionViewDelegateFlowLayout

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.photos.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    GHPhotoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[GHPhotoCell reuseIdentifier] forIndexPath:indexPath];
    cell.image = self.photos[indexPath.item];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    GHPhotoPreviewVC *vc = [GHPhotoPreviewVC new];
    [vc setupPhotos:self.photos.copy];
    [self.navigationController pushViewController:vc animated:YES];
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(5, 5, 5, 5);
}

#pragma mark - Getter,Setter

- (NSMutableArray *)photos {
    if (!_photos) {
        _photos = [NSMutableArray array];
    }
    return _photos;
}

- (void)setAssetCollection:(PHAssetCollection *)assetCollection {
    _assetCollection = assetCollection;
    
    PHFetchResult<PHAsset *> *assetResults = [PHAsset fetchAssetsInAssetCollection:assetCollection options:nil];
    [assetResults enumerateObjectsUsingBlock:^(PHAsset * _Nonnull asset, NSUInteger idx, BOOL * _Nonnull stop) {
        PHImageRequestOptions *options = [[PHImageRequestOptions alloc] init];
        options.synchronous = YES;
        options.deliveryMode = PHImageRequestOptionsDeliveryModeHighQualityFormat;
        options.resizeMode = PHImageRequestOptionsResizeModeExact;
        
        //        CGFloat scale = [UIScreen mainScreen].scale;
        [[PHCachingImageManager defaultManager] requestImageForAsset:asset targetSize:CGSizeMake(200, 200) contentMode:PHImageContentModeAspectFill options:nil resultHandler:^(UIImage * _Nullable result, NSDictionary * _Nullable info) {
            [self.photos addObject:result];
        }];
    }];
    
    [self.collectionView reloadData];
}

@end
