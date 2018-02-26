//
//  GHPhotoThumbnailPreviewCell.h
//  GHImagePicker
//
//  Created by Rong on 2018/2/26.
//  Copyright © 2018年 Rong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GHPhotoThumbnailPreviewCell : UICollectionViewCell

@property (nonatomic, strong) UIImage *photo;

+ (NSString *)reuseIdentifier;

@end
