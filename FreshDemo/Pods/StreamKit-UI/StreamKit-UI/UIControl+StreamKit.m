//
//  UIControl+StreamKit.m
//  StreamKit
//
//  Created by 苏南 on 16/12/15.
//  Copyright © 2016年 苏南. All rights reserved.
//

#import "UIControl+StreamKit.h"

@implementation UIControl (StreamKit)

- (UIControl* (^)(BOOL enabled))sk_enabled
{
    return ^ UIControl* (BOOL enabled) {
        return ({self.enabled = enabled;self;});
    };
}

- (UIControl* (^)(BOOL selected))sk_selected
{
    return ^ UIControl* (BOOL selected) {
        return ({self.selected = selected;self;});
    };
}

- (UIControl* (^)(BOOL highlighted))sk_highlighted
{
    return ^ UIControl* (BOOL highlighted) {
        return ({self.highlighted = highlighted;self;});
    };
}

- (UIControl* (^)(UIControlContentVerticalAlignment contentVerticalAlignment))sk_contentVerticalAlignment
{
    return ^ UIControl* (UIControlContentVerticalAlignment contentVerticalAlignment) {
        return ({self.contentVerticalAlignment = contentVerticalAlignment;self;});
    };
}

- (UIControl* (^)(UIControlContentHorizontalAlignment contentHorizontalAlignment))sk_contentHorizontalAlignment
{
    return ^ UIControl* (UIControlContentHorizontalAlignment contentHorizontalAlignment) {
        return ({self.contentHorizontalAlignment = contentHorizontalAlignment;self;});
    };
}

@end
