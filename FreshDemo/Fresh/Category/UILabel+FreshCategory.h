//
//  UILabel+FreshCategory.h
//  FreshDemo
//
//  Created by imac on 2019/4/19.
//  Copyright © 2019 com.GodL.github. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (FreshCategory)

@property (nonatomic,assign,readonly) CGFloat contentWidth;

@property (nonatomic,assign,readonly) CGFloat contentHeight;

@property (nonatomic,strong) UIColor *originBackgroundColor;

@property (nonatomic,strong) UIColor *highlightedBackgroundColor;

@end

@interface NSArray (AutoLayoutWidth)

- (void)autoLayoutWidth;

@end

NS_ASSUME_NONNULL_END
