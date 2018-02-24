//
//  GHAlbumCell.h
//  GHImagePicker
//
//  Created by Rong on 2018/2/24.
//  Copyright © 2018年 Rong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Photos/Photos.h>

@interface GHAlbumModel : NSObject

@property (nonatomic, strong) UIImage *lastImage;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *amount;
@property (nonatomic, strong) PHAssetCollection *assetCollection;

@end

@interface GHAlbumCell : UITableViewCell

@property (nonatomic, strong) GHAlbumModel *albumModel;

+ (NSString *)reuseIdentifier;
+ (CGFloat)cellRowHeight;

@end
