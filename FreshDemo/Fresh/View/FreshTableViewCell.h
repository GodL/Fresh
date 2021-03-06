//
//  FreshTableViewCell.h
//  FreshDemo
//
//  Created by imac on 2019/4/19.
//  Copyright © 2019 com.GodL.github. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FreshCellModelable.h"

NS_ASSUME_NONNULL_BEGIN

@interface FreshTableViewCell : UITableViewCell<FreshCellModelable>

@property (nonatomic,strong,readonly) UIImageView *backgroundImageView;

- (void)setupSubViews;

+ (void)registerToTableView:(UITableView *)tableView;

@end

NS_ASSUME_NONNULL_END
