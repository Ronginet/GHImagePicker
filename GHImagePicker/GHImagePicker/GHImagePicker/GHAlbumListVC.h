//
//  GHAlbumListVC.h
//  GHImagePicker
//
//  Created by Rong on 2018/2/24.
//  Copyright © 2018年 Rong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GHAlbumListVC : UIViewController

- (void)presentAlbumListFromVC:(UIViewController *)vc animated:(BOOL)flag completion:(void (^)(void))completion;

@end
