//
//  GHPhotoToolBar.h
//  GHImagePicker
//
//  Created by Rong on 2018/2/24.
//  Copyright © 2018年 Rong. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, GHPhotoToolBarType) {
    GHPhotoToolBarTypePreview,  // Default
    GHPhotoToolBarTypeEdit,
};

@interface GHPhotoToolBar : UIView

- (instancetype)initWithFrame:(CGRect)frame toolBarType:(GHPhotoToolBarType)type NS_DESIGNATED_INITIALIZER;
- (instancetype)initWithCoder:(NSCoder *)aDecoder NS_UNAVAILABLE;

@property (nonatomic, assign, readonly) GHPhotoToolBarType toolBarType;
@property (nonatomic, copy) void(^previewButtonBlock)(void);
@property (nonatomic, copy) void(^originalButtonBlock)(void);
@property (nonatomic, copy) void(^sendButtonBlock)(void);

- (void)setupTitleWithSelectedCount:(NSInteger)count;

@end
