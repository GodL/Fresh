//
//  UILabel+FreshCategory.m
//  FreshDemo
//
//  Created by imac on 2019/4/19.
//  Copyright © 2019 com.GodL.github. All rights reserved.
//

#import "UILabel+FreshCategory.h"
#import <StreamKit/StreamKit.h>
#import <Masonry/Masonry.h>
#import <objc/runtime.h>

@implementation UILabel (FreshCategory)

static void *UILabelOriginBackgroundColorDisposable = &UILabelOriginBackgroundColorDisposable;


- (CGFloat)contentWidth {
    return [self sizeThatFits:CGSizeMake(CGFLOAT_MAX, 40)].width;
}

- (CGFloat)contentHeight {
    return [self sizeThatFits:CGSizeMake(CGRectGetWidth(self.frame), CGFLOAT_MAX)].height;
}

- (void)setOriginBackgroundColor:(UIColor *)originBackgroundColor {
    objc_setAssociatedObject(self, @selector(originBackgroundColor), originBackgroundColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIColor *)originBackgroundColor {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setHighlightedBackgroundColor:(UIColor *)highlightedBackgroundColor {
    SEL key = @selector(highlightedBackgroundColor);
    objc_setAssociatedObject(self, key, highlightedBackgroundColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    SKDisposable *disposable = objc_getAssociatedObject(self, UILabelOriginBackgroundColorDisposable);
    if (disposable) return;
    disposable = [[[SKObserve(self,backgroundColor) startWith:self.backgroundColor] take:1] setKeyPath:@sk_keypath(self,originBackgroundColor) onObject:self];
    objc_setAssociatedObject(self, UILabelOriginBackgroundColorDisposable, disposable, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    @unsafeify(self)
    SK(self,backgroundColor) = [SKObserve(self,highlighted) map:^id(NSNumber *x) {
        @strongify(self)
        return x.boolValue ? self.highlightedBackgroundColor : self.originBackgroundColor;
    }];
}

- (UIColor *)highlightedBackgroundColor {
    return objc_getAssociatedObject(self, _cmd);
}

@end

@implementation NSArray (AutoLayoutWidth)

- (void)autoLayoutWidth {
    [self enumerateObjectsUsingBlock:^(UILabel *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSCAssert([obj isKindOfClass:UIView.class], @"obj bust be UILabel");
        [obj mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(obj.contentWidth);
        }];
    }];
}

@end
