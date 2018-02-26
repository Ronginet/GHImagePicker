//
//  GHNavigationBar.h
//  GHImagePicker
//
//  Created by Rong on 2018/2/26.
//  Copyright © 2018年 Rong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GHNavigationBar : UIView

@property (nonatomic, copy) void(^backButtonBlock)(void);
@property (nonatomic, copy) void(^selectButtonBlock)(void);

@end
