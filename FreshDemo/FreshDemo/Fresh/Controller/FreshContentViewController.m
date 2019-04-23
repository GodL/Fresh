//
//  FreshContentViewController.m
//  FreshDemo
//
//  Created by imac on 2019/4/23.
//  Copyright © 2019 com.GodL.github. All rights reserved.
//

#import "FreshContentViewController.h"
#import <Masonry/Masonry.h>

@interface FreshContentViewController ()

@end

@implementation FreshContentViewController

@synthesize contentView = _contentView;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self layoutContentView];
    // Do any additional setup after lo ading the view.
}

- (UIImageView *)contentView {
    if (!_contentView) {
        _contentView = [UIImageView new];
        _contentView.userInteractionEnabled = YES;
        [self.view addSubview:_contentView];
    }
    return _contentView;
}

- (void)layoutContentView {
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsZero);
    }];
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
