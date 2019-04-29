//
//  FreshContentViewController.h
//  FreshDemo
//
//  Created by imac on 2019/4/23.
//  Copyright © 2019 com.GodL.github. All rights reserved.
//

#import "FreshBaseController.h"

NS_ASSUME_NONNULL_BEGIN

@interface FreshContentViewController : FreshBaseController

@property (nonatomic,strong,readonly) UIImageView *contentView;

- (void)layoutContentView;

@end

NS_ASSUME_NONNULL_END
