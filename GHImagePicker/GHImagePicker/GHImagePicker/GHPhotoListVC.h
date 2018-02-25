//
//  GHPhotoListVC.h
//  GHImagePicker
//
//  Created by Rong on 2018/2/24.
//  Copyright © 2018年 Rong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Photos/Photos.h>

@interface GHPhotoListVC : UIViewController

@property (nonatomic, strong) PHAssetCollection *assetCollection;

@end
