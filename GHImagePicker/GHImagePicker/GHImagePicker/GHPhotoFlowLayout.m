//
//  GHPhotoFlowLayout.m
//  GHImagePicker
//
//  Created by Rong on 2018/2/24.
//  Copyright © 2018年 Rong. All rights reserved.
//

#import "GHPhotoFlowLayout.h"

static CGFloat const count = 4;

@implementation GHPhotoFlowLayout

- (void)prepareLayout {
    [super prepareLayout];
    
    
    self.minimumLineSpacing = 5;
    self.minimumInteritemSpacing = 5;
    CGFloat width = (self.collectionView.frame.size.width - 10 - (count - 1) * self.minimumInteritemSpacing) / count;
    self.itemSize = CGSizeMake(width, width);
}

@end
