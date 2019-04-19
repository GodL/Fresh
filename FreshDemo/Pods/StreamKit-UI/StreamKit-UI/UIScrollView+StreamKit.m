//
//  UIScrollView+StreamKit.m
//  StreamKit
//
//  Created by 苏南 on 16/12/24.
//  Copyright © 2016年 李浩. All rights reserved.
//

#import "UIScrollView+StreamKit.h"

@implementation UIScrollView (StreamKit)

+ (UIScrollView* (^)(CGRect frame))sk_init
{
    return ^ UIScrollView* (CGRect frame) {
        return [[UIScrollView alloc] initWithFrame:frame];
    };
}

- (UIScrollView* (^)(CGPoint contentOffset))sk_contentOffset
{
    return ^ UIScrollView* (CGPoint contentOffset) {
        return self.sk_contentOffsetWithAnimated(contentOffset,NO);
    };
}

- (UIScrollView* (^)(CGPoint contentOffset,BOOL animated))sk_contentOffsetWithAnimated
{
    return ^ UIScrollView*(CGPoint contentOffset,BOOL animated) {
        return ({[self setContentOffset:contentOffset animated:animated];self;});
    };
}

- (UIScrollView* (^)(CGSize contentSize))sk_contentSize
{
    return ^ UIScrollView* (CGSize contentSize) {
        return ({self.contentSize = contentSize;self;});
    };
}

- (UIScrollView* (^)(UIEdgeInsets contentInset))sk_contentInset
{
    return ^ UIScrollView* (UIEdgeInsets contentInset) {
        return ({self.contentInset = contentInset;self;});
    };
}

- (UIScrollView* (^)(id<UIScrollViewDelegate> delegate))sk_delegate
{
    return ^ UIScrollView* (id<UIScrollViewDelegate> delegate) {
        return ({self.delegate = delegate;self;});
    };
}

- (UIScrollView* (^)(BOOL directionalLockEnabled))sk_directionalLockEnabled
{
    return ^ UIScrollView* (BOOL directionalLockEnabled) {
        return ({self.directionalLockEnabled = directionalLockEnabled;self;});
    };
}

- (UIScrollView* (^)(BOOL bounces))sk_bounces
{
    return ^ UIScrollView* (BOOL bounces) {
        return ({self.bounces = bounces;self;});
    };
}

- (UIScrollView* (^)(BOOL alwaysBounceVertical))sk_alwaysBounceVertical
{
    return ^ UIScrollView* (BOOL alwaysBounceVertical) {
        return ({self.alwaysBounceVertical = alwaysBounceVertical;self;});
    };
}

- (UIScrollView* (^)(BOOL alwaysBounceHorizontal))sk_alwaysBounceHorizontal
{
    return ^ UIScrollView* (BOOL alwaysBounceHorizontal) {
        return ({self.alwaysBounceVertical = alwaysBounceHorizontal;self;});
    };
}

- (UIScrollView* (^)(BOOL pagingEnabled))sk_pagingEnabled
{
    return ^ UIScrollView* (BOOL pagingEnabled) {
        return ({self.pagingEnabled = pagingEnabled;self;});
    };
}

- (UIScrollView* (^)(BOOL scrollEnabled))sk_scrollEnabled
{
    return ^ UIScrollView* (BOOL scrollEnabled) {
        return ({self.scrollEnabled = scrollEnabled;self;});
    };
}

- (UIScrollView* (^)(BOOL showsHorizontalScrollIndicator))sk_showsHorizontalScrollIndicator
{
    return ^ UIScrollView* (BOOL showsHorizontalScrollIndicator) {
        return ({self.showsHorizontalScrollIndicator = showsHorizontalScrollIndicator;self;});
    };
}

- (UIScrollView* (^)(BOOL showsVerticalScrollIndicator))sk_showsVerticalScrollIndicator
{
    return ^ UIScrollView* (BOOL showsVerticalScrollIndicator) {
        return ({self.showsVerticalScrollIndicator = showsVerticalScrollIndicator;self;});
    };
}

- (UIScrollView* (^)(UIEdgeInsets scrollIndicatorInsets))sk_scrollIndicatorInsets
{
    return ^ UIScrollView* (UIEdgeInsets scrollIndicatorInsets) {
        return ({self.scrollIndicatorInsets = scrollIndicatorInsets;self;});
    };
}

- (UIScrollView* (^)(CGFloat minimumZoomScale))sk_minimumZoomScale
{
    return ^ UIScrollView* (CGFloat minimumZoomScale) {
        return ({self.minimumZoomScale = minimumZoomScale;self;});
    };
}

- (UIScrollView* (^)(CGFloat maximumZoomScale))sk_maximumZoomScale
{
    return ^ UIScrollView* (CGFloat maximumZoomScale) {
        return ({self.maximumZoomScale = maximumZoomScale;self;});
    };
}

- (UIScrollView* (^)(CGFloat zoomScale))sk_zoomScale
{
    return ^ UIScrollView* (CGFloat zoomScale) {
        return self.sk_zoomScaleWithAnimated(zoomScale,NO);
    };
}

- (UIScrollView* (^)(CGFloat zoomScale,BOOL animated))sk_zoomScaleWithAnimated
{
    return ^ UIScrollView* (CGFloat zoomScale,BOOL animated) {
        return ({[self setZoomScale:zoomScale animated:animated];self;});
    };
}

- (UIScrollView* (^)(BOOL bouncesZoom))sk_bouncesZoom
{
    return ^ UIScrollView* (BOOL bouncesZoom) {
        return ({self.bouncesZoom = bouncesZoom;self;});
    };
}

- (UIScrollView* (^)(BOOL scrollsToTop))sk_scrollsToTop
{
    return ^ UIScrollView*(BOOL scrollsToTop) {
        return ({self.scrollsToTop = YES;self;});
    };
}

@end
