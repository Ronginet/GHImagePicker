//
//  GHAlbumListVC.m
//  GHImagePicker
//
//  Created by Rong on 2018/2/24.
//  Copyright © 2018年 Rong. All rights reserved.
//

#import "GHAlbumListVC.h"
#import "GHAlbumCell.h"
#import "GHPhotoListVC.h"

#import <Photos/Photos.h>

static CGFloat const thumbImageWidthAndHeight = 55;

@interface GHAlbumListVC () <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray<GHAlbumModel *> *albums;

@end

@implementation GHAlbumListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"照片";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(cancel)];
    [self createTableView];
    [self fetchAlbumList];
}

- (void)createTableView {
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
    
    [self.tableView registerClass:[GHAlbumCell class] forCellReuseIdentifier:[GHAlbumCell reuseIdentifier]];
}

- (void)fetchAlbumList {
    PHFetchResult<PHAssetCollection *> *results = [PHAssetCollection fetchAssetCollectionsWithType:PHAssetCollectionTypeSmartAlbum subtype:PHAssetCollectionSubtypeAlbumRegular options:nil];
    [results enumerateObjectsUsingBlock:^(PHAssetCollection * _Nonnull assetCollection, NSUInteger idx, BOOL * _Nonnull stop) {
        PHFetchResult<PHAsset *> *assets = [PHAsset fetchAssetsInAssetCollection:assetCollection options:nil];
        
        __block UIImage *lastImage = nil;
        PHImageRequestOptions *options = [[PHImageRequestOptions alloc] init];
        options.synchronous = YES;
        options.deliveryMode = PHImageRequestOptionsDeliveryModeHighQualityFormat;
        options.resizeMode = PHImageRequestOptionsResizeModeExact;
        CGFloat scale = [UIScreen mainScreen].scale;
        [[PHCachingImageManager defaultManager] requestImageForAsset:assets.lastObject targetSize:CGSizeMake(thumbImageWidthAndHeight * scale, thumbImageWidthAndHeight * scale) contentMode:PHImageContentModeAspectFill options:nil resultHandler:^(UIImage * _Nullable result, NSDictionary * _Nullable info) {
            lastImage = result;
        }];
        
        GHAlbumModel *model = [GHAlbumModel new];
        model.lastImage = lastImage;
        model.title = assetCollection.localizedTitle;
        model.amount = [NSString stringWithFormat:@"%zd",assets.count];
        model.assetCollection = assetCollection;
        [self.albums addObject:model];
    }];
    [self.tableView reloadData];
}

#pragma mark - Public

- (void)presentAlbumListFromVC:(UIViewController *)vc animated:(BOOL)flag completion:(void (^)(void))completion {
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:self];
    [vc presentViewController:nav animated:flag completion:completion];
}

#pragma mark - Private

- (void)cancel {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - UITableViewDataSource,UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.albums.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GHAlbumCell *cell = [tableView dequeueReusableCellWithIdentifier:[GHAlbumCell reuseIdentifier]];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.albumModel = self.albums[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    GHAlbumModel *model = self.albums[indexPath.row];
    GHPhotoListVC *vc = [GHPhotoListVC new];
    vc.title = model.title;
    vc.assetCollection = model.assetCollection;
    [self.navigationController pushViewController:vc animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [GHAlbumCell cellRowHeight];
}

#pragma mark - Getter

- (NSMutableArray<GHAlbumModel *> *)albums {
    if (!_albums) {
        _albums = [NSMutableArray array];
    }
    return _albums;
}

@end
