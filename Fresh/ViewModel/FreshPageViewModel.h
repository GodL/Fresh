//
//  FreshPageViewModel.h
//  FreshDemo
//
//  Created by imac on 2019/4/19.
//  Copyright © 2019 com.GodL.github. All rights reserved.
//

#import "FreshViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@class SKCommand;
@class SKSignal;

@interface FreshPageViewModel<Element> : FreshViewModel

@property (nonatomic,assign,readonly) NSUInteger page;

@property (nonatomic,strong,readonly) SKCommand *headerCommand;

@property (nonatomic,strong,readonly) SKCommand *footerCommand;

@property (nonatomic,copy) NSArray<Element> *datas;//readonly

@property (nonatomic,strong,readonly) SKSignal *hasMoreDataSignal;

- (NSUInteger)countOfPage;

@end

NS_ASSUME_NONNULL_END