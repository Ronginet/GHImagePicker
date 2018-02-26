//
//  GHPhotoCell.h
//  GHImagePicker
//
//  Created by Rong on 2018/2/24.
//  Copyright © 2018年 Rong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GHPhotoCell : UICollectionViewCell

@property (nonatomic, strong) UIImage *image;
@property (nonatomic, copy) void(^selectButtonBlock)(UIImage *image, BOOL selected);

+ (NSString *)reuseIdentifier;

@end
