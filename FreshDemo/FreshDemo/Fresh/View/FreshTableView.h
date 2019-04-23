//
//  FreshTableView.h
//  FreshDemo
//
//  Created by imac on 2019/4/19.
//  Copyright © 2019 com.GodL.github. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FreshTableView : UITableView

@property (nonatomic,strong,nullable) UIRefreshControl *refreshView;

- (void)beginRefresh;

@end

NS_ASSUME_NONNULL_END
