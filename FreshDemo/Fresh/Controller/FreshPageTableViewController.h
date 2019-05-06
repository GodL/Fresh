//
//  FreshPageTableViewController.h
//  FreshDemo
//
//  Created by imac on 2019/5/6.
//  Copyright © 2019 com.GodL.github. All rights reserved.
//

#import "FreshTableViewController.h"

NS_ASSUME_NONNULL_BEGIN

@class MJRefreshFooter;

@interface FreshPageTableViewController : FreshTableViewController

- (__kindof MJRefreshFooter *)initializationRefreshFooter;

@end

NS_ASSUME_NONNULL_END
