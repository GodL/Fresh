//
//  UITextField+FreshCategory.m
//  FreshDemo
//
//  Created by imac on 2019/4/19.
//  Copyright © 2019 com.GodL.github. All rights reserved.
//

#import "UITextField+FreshCategory.h"

@implementation UITextField (FreshCategory)

- (void)setContentInset:(UIEdgeInsets)contentInset {
    if (contentInset.left > 0) {
        UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, contentInset.left, CGRectGetHeight(self.frame))];
        paddingView.backgroundColor = [UIColor clearColor];
        self.leftView = paddingView;
        self.leftViewMode = UITextFieldViewModeAlways;
    }
    if (contentInset.right > 0) {
        UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, contentInset.right, CGRectGetHeight(self.frame))];
        paddingView.backgroundColor = [UIColor clearColor];
        self.rightView = paddingView;
        self.rightViewMode = UITextFieldViewModeAlways;
    }
}

- (UIEdgeInsets)contentInset {
    return UIEdgeInsetsZero;
}

@end
