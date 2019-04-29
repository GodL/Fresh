//
//  Fresh2LabelView.h
//  FreshDemo
//
//  Created by imac on 2019/4/19.
//  Copyright © 2019 com.GodL.github. All rights reserved.
//

#import "FreshBaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface Fresh2LabelView : FreshBaseView

@property (nonatomic,strong,readonly) UILabel *leftLabel;

@property (nonatomic,strong,readonly) UILabel *rightLabel;

@property (nonatomic) UIEdgeInsets labelInsets;

@property (nonatomic,assign) BOOL leftLabelFitWidth;

@property (nonatomic,assign) BOOL rightLabelFitWidth;

- (void)configurationLeftLabel:(void(^)(UILabel *label))completeHandle;

- (void)configurationRightLabel:(void(^)(UILabel *label))completeHandle;

- (void)configuration2Label:(void(^)(UILabel *label))completeHandle;

- (void)setLeftText:(id)text;

- (void)setRightText:(id)text;

- (void)setLeftText:(id)leftText rightText:(id)rightText;

@end

NS_ASSUME_NONNULL_END
