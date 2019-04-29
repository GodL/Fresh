//
//  FreshPageViewsController.h
//  FreshDemo
//
//  Created by imac on 2019/4/19.
//  Copyright © 2019 com.GodL.github. All rights reserved.
//

#import "FreshBaseController.h"

NS_ASSUME_NONNULL_BEGIN
@class SKSignal;

@protocol FreshSegmentedViewProtocol <NSObject>

- (SKSignal *)sk_signalForControlEvents:(UIControlEvents)controlEvents;

@property (nonatomic,assign) NSUInteger selectedSegmentIndex;

@end

@interface FreshPageViewsController : FreshBaseController

@property (nonatomic,strong,readonly) UIPageViewController *pageController;

@property (nonatomic,strong,readonly) id<FreshSegmentedViewProtocol> segmentedControl;

@property (nonatomic,copy,readonly) NSArray<UIViewController *> *controllers;

- (NSArray<UIViewController *> *)innerViewControllers;

- (id<FreshSegmentedViewProtocol>)innerSegmentedControl;

- (void)layoutPageController;

- (void)layoutSegmentedControl;

@end

NS_ASSUME_NONNULL_END
