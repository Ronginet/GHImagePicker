//
//  GHPhotoThumbnailPreviewFlowLayout.m
//  GHImagePicker
//
//  Created by Rong on 2018/2/26.
//  Copyright © 2018年 Rong. All rights reserved.
//

#import "GHPhotoThumbnailPreviewFlowLayout.h"

@implementation GHPhotoThumbnailPreviewFlowLayout

- (void)prepareLayout {
    [super prepareLayout];
    
    self.minimumLineSpacing = 13;
    self.minimumInteritemSpacing = 13;
    self.itemSize = CGSizeMake(44, 44);
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
}

@end
