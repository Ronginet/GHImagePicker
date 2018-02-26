//
//  GHPhotoPreviewFlowLayout.m
//  GHImagePicker
//
//  Created by Rong on 2018/2/26.
//  Copyright © 2018年 Rong. All rights reserved.
//

#import "GHPhotoPreviewFlowLayout.h"

@implementation GHPhotoPreviewFlowLayout

- (void)prepareLayout {
    [super prepareLayout];
    
    self.minimumLineSpacing = 0;
    self.minimumInteritemSpacing = 0;
    self.itemSize = self.collectionView.bounds.size;
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
}

@end
