//
//  UIScrollView+StreamKit.h
//  StreamKit
//
//  Created by 苏南 on 16/12/24.
//  Copyright © 2016年 李浩. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 Overrides the super's methods.
 */
@interface UIScrollView (StreamSuper)

- (UIScrollView* (^)(NSInteger tag))sk_tag;

- (UIScrollView* (^)(BOOL userInteractionEnabled))sk_userInteractionEnabled;

- (UIScrollView* (^)(CGRect frame))sk_frame;

- (UIScrollView* (^)(CGFloat x))sk_x;

- (UIScrollView* (^)(CGFloat y))sk_y;

- (UIScrollView* (^)(CGFloat width))sk_width;

- (UIScrollView* (^)(CGFloat height))sk_height;

- (UIScrollView* (^)(CGSize size))sk_size;

- (UIScrollView* (^)(CGRect bounds))sk_bounds;

- (UIScrollView* (^)(CGPoint point))sk_center;

- (UIScrollView* (^)(CGFloat centerX))sk_centerX;

- (UIScrollView* (^)(CGFloat centerY))sk_centerY;

- (UIScrollView* (^)(BOOL autoresizesSubviews))sk_autoresizesSubviews;

- (UIScrollView* (^)(UIViewAutoresizing autoresizingMask))sk_autoresizingMask;

- (UIScrollView* (^)(UIColor* backgroundColor))sk_backgroundColor;

- (UIScrollView* (^) (BOOL masksToBounds))sk_masksToBounds;

- (UIScrollView* (^) (CGFloat cornerRadius))sk_cornerRadius;

- (UIScrollView* (^)(CGFloat alpha))sk_alpha;

- (UIScrollView* (^)(BOOL opaque))sk_opaque;

- (UIScrollView* (^)(BOOL hidden))sk_hidden;

- (UIScrollView* (^)(UIViewContentMode mode))sk_contentMode;

- (UIScrollView* (^)(BOOL clipsToBounds))sk_clipsToBounds;

- (UIScrollView* (^)(UIColor* tintColor))sk_tintColor;

@end
