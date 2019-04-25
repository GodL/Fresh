//
//  FreshBaseController.m
//  FreshDemo
//
//  Created by imac on 2019/4/19.
//  Copyright © 2019 com.GodL.github. All rights reserved.
//

#import "FreshBaseController.h"

@interface FreshBaseController ()

@end

@implementation FreshBaseController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)leftAction {}

- (void)rightAction {}

#ifdef DEBUG
- (void)dealloc {
    NSLog(@"%@ delloc",NSStringFromClass(self.class));
}
#endif

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
