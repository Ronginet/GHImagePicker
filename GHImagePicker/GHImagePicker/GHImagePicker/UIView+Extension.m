//
//  UIView+Extension.m
//  GHImagePicker
//
//  Created by Rong on 2018/2/24.
//  Copyright © 2018年 Rong. All rights reserved.
//

#import "UIView+Extension.h"

@implementation UIView (Extension)

- (void)setGh_x:(CGFloat)gh_x {
    CGRect frame = self.frame;
    frame.origin.x = gh_x;
    self.frame = frame;
}

- (CGFloat)gh_x {
    return self.frame.origin.x;
}

- (void)setGh_y:(CGFloat)gh_y {
    CGRect frame = self.frame;
    frame.origin.y = gh_y;
    self.frame = frame;
}

- (CGFloat)gh_y {
    return self.frame.origin.y;
}

- (void)setGh_width:(CGFloat)gh_width {
    CGRect frame = self.frame;
    frame.size.width = gh_width;
    self.frame = frame;
}

- (CGFloat)gh_width {
    return self.frame.size.width;
}

- (void)setGh_height:(CGFloat)gh_height {
    CGRect frame = self.frame;
    frame.size.height = gh_height;
    self.frame = frame;
}

- (CGFloat)gh_height {
    return self.frame.size.height;
}

@end
