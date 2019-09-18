//
//  FreshCellModelable.h
//  FreshDemo
//
//  Created by 李浩 on 2019/9/19.
//  Copyright © 2019年 com.GodL.github. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol FreshCellModelable <NSObject>

+ (Class)cellModel;

- (void)configurationCellWithItem:(id)value;

@end

NS_ASSUME_NONNULL_END
