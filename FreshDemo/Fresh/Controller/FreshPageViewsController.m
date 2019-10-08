//
//  FreshPageViewsController.m
//  FreshDemo
//
//  Created by imac on 2019/4/19.
//  Copyright © 2019 com.GodL.github. All rights reserved.
//

#import "FreshPageViewsController.h"
#import <StreamKit/StreamKit.h>
#import <Masonry/Masonry.h>

@interface FreshPageViewsController ()<UIPageViewControllerDelegate,UIPageViewControllerDataSource>

@property (nonatomic,strong,readwrite) UIPageViewController *pageController;

@property (nonatomic,copy,readwrite) NSArray<UIViewController *> *controllers;

@property (nonatomic,strong,readwrite) id<FreshSegmentedViewProtocol> segmentedControl;

@property (nonatomic,assign) NSInteger currentIndex;

@end

@implementation FreshPageViewsController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self layoutSegmentedControl];
    [self layoutPageController];
    // Do any additional setup after loading the view.
}

#pragma mark- GETTER
- (NSArray<UIViewController *> *)controllers {
    if (!_controllers) {
        _controllers = [self innerViewControllers];
    }
    return _controllers;
}

- (UIPageViewController *)pageController {
    if (!_pageController) {
        _pageController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
        _pageController.delegate = self;
        _pageController.dataSource = self;
        [self addChildViewController:_pageController];
        [self.contentView addSubview:self.pageController.view];
        [_pageController setViewControllers:@[self.controllers.firstObject] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
    }
    return _pageController;
}

- (id<FreshSegmentedViewProtocol> )segmentedControl {
    if (!_segmentedControl) {
        _segmentedControl = [self innerSegmentedControl];
        NSAssert([_segmentedControl isKindOfClass:UIView.class], @"segmentedControl should be  UIView");
        SKSelector(self, setSegmentedIndex:) = [[_segmentedControl sk_signalForControlEvents:UIControlEventValueChanged] map:^id(id<FreshSegmentedViewProtocol> x) {
            return @(x.selectedSegmentIndex);
        }];
        [self.contentView addSubview:(UIView *)_segmentedControl];
    }
    return _segmentedControl;
}

#pragma mark- Publick
- (NSArray<UIViewController *> *)innerViewControllers {
    NSAssert(NO, @"should override by subclass");
    return nil;
}

- (id<FreshSegmentedViewProtocol>)innerSegmentedControl {
    NSAssert(NO, @"should override by subclass");
    return nil;
}

- (void)layoutContentView {
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsZero);
    }];
}

- (void)layoutPageController {
    [self.pageController.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsZero);
    }];
}

- (void)layoutSegmentedControl {
}

#pragma mark- Private
- (void)setSegmentedIndex:(NSInteger)index {
    UIViewController *controller = [self.controllers objectAtIndex:index];
    if (index > self.currentIndex) {
        [self.pageController setViewControllers:@[controller] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
    }else {
        [self.pageController setViewControllers:@[controller] direction:UIPageViewControllerNavigationDirectionReverse animated:YES completion:nil];
    }
    self.currentIndex = index;
}

#pragma mark- UIPageViewController
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    NSInteger index = [self.controllers indexOfObject:viewController];
    if (index == 0 || index == NSNotFound) {
        return nil;
    }
    return [self.controllers objectAtIndex:--index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    NSInteger index = [self.controllers indexOfObject:viewController];
    if (index == self.controllers.count - 1 || index == NSNotFound) {
        return nil;
    }
    return [self.controllers objectAtIndex:++index];
}

- (void)pageViewController:(UIPageViewController *)pageViewController willTransitionToViewControllers:(NSArray<UIViewController *> *)pendingViewControllers {
    UIViewController *nextVC = [pendingViewControllers firstObject];
    
    NSInteger index = [self.controllers indexOfObject:nextVC];
    
    self.currentIndex = index;
}

- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray<UIViewController *> *)previousViewControllers transitionCompleted:(BOOL)completed {
    if (completed) {
        [self.segmentedControl setSelectedSegmentIndex:self.currentIndex];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
