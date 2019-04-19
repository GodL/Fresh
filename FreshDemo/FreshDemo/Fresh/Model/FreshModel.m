//
//  FreshModel.m
//  FreshDemo
//
//  Created by imac on 2019/4/19.
//  Copyright © 2019 com.GodL.github. All rights reserved.
//

#import "FreshModel.h"

@implementation FreshModel

@end

@implementation NSArray (Fresh)

- (void)resetSelected {
    [self makeObjectsPerformSelector:@selector(setSelected:) withObject:@NO];
}

@end
