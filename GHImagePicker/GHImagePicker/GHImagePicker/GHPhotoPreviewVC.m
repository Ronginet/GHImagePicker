//
//  GHPhotoPreviewVC.m
//  GHImagePicker
//
//  Created by Rong on 2018/2/26.
//  Copyright © 2018年 Rong. All rights reserved.
//

#import "GHPhotoPreviewVC.h"
#import "GHNavigationBar.h"
#import "GHPhotoToolBar.h"
#import "GHPhotoPreviewCell.h"
#import "GHPhotoPreviewFlowLayout.h"
#import "GHPhotoThumbnailPreviewBar.h"
#import "UIView+Extension.h"

static CGFloat const toolBarHeight = 45.0;
static CGFloat const previewBarHeight = 70.0;

@interface GHPhotoPreviewVC () <UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) GHNavigationBar *navigationBar;
@property (nonatomic, strong) GHPhotoThumbnailPreviewBar *previewBar;
@property (nonatomic, strong) GHPhotoToolBar *toolBar;
@property (nonatomic, strong) NSMutableArray *photos;

@end

@implementation GHPhotoPreviewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self createCollectionView];
    [self createNavigationBar];
    [self createToolBar];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self.navigationBar setNeedsLayout];
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}

- (void)createNavigationBar {
    __weak typeof(self) weakSelf = self;
    self.navigationBar = [GHNavigationBar new];
    self.navigationBar.frame = CGRectMake(0, 0, self.view.bounds.size.width, 64);
    [self.view addSubview:self.navigationBar];
    [self.navigationBar setBackButtonBlock:^{
        [weakSelf.navigationController popViewControllerAnimated:YES];
    }];
}

- (void)createToolBar {
    self.toolBar = [[GHPhotoToolBar alloc] initWithFrame:CGRectZero toolBarType:GHPhotoToolBarTypeEdit];
    self.toolBar.frame = CGRectMake(0, self.view.bounds.size.height - toolBarHeight, self.view.bounds.size.width, toolBarHeight);
    [self.view addSubview:self.toolBar];
    
    self.previewBar = [GHPhotoThumbnailPreviewBar new];
    self.previewBar.frame = CGRectMake(0, self.toolBar.gh_y - previewBarHeight, self.view.bounds.size.width, previewBarHeight);
    [self.previewBar setupPhotos:self.photos];
    [self.view addSubview:self.previewBar];
}

- (void)createCollectionView {
    GHPhotoPreviewFlowLayout *flowLayout = [GHPhotoPreviewFlowLayout new];
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    self.collectionView.frame = self.view.bounds;
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    self.collectionView.pagingEnabled = YES;
    [self.view addSubview:self.collectionView];
    
    [self.collectionView registerClass:[GHPhotoPreviewCell class] forCellWithReuseIdentifier:[GHPhotoPreviewCell reuseIdentifier]];
}

#pragma mark - Public

- (void)setupPhotos:(NSArray *)photos {
    self.photos = photos.mutableCopy;
}

#pragma mark - UICollectionViewDataSource,UICollectionViewDelegateFlowLayout

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.photos.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    GHPhotoPreviewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[GHPhotoPreviewCell reuseIdentifier] forIndexPath:indexPath];
    cell.photo = self.photos[indexPath.row];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
}

#pragma mark - Getter,Setter

- (NSMutableArray *)photos {
    if (!_photos) {
        _photos = [NSMutableArray array];
    }
    return _photos;
}

@end
