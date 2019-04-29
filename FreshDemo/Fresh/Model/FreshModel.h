//
//  FreshModel.h
//  FreshDemo
//
//  Created by imac on 2019/4/19.
//  Copyright © 2019 com.GodL.github. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FreshModel : NSObject

@property (nonatomic,assign,getter=isSelected) BOOL selected;

@end

@interface NSArray (Fresh)

- (void)resetSelected;

@end

NS_ASSUME_NONNULL_END
