//
//  FreshDatasViewModel.h
//  FreshDemo
//
//  Created by imac on 2019/4/23.
//  Copyright © 2019 com.GodL.github. All rights reserved.
//

#import "FreshViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface FreshDatasViewModel<__covariant Element> : FreshViewModel

@property (nonatomic,copy) NSArray<Element> *datas;

@end

NS_ASSUME_NONNULL_END
