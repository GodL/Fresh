//
//  Fresh2LabelView.m
//  FreshDemo
//
//  Created by imac on 2019/4/19.
//  Copyright © 2019 com.GodL.github. All rights reserved.
//

#import "Fresh2LabelView.h"
#import <Masonry/Masonry.h>

@implementation Fresh2LabelView

- (void)setupSubViews {
    [super setupSubViews];
    _leftLabelFitWidth = _rightLabelFitWidth = YES;
    self.labelInsets = UIEdgeInsetsZero;
    _leftLabel = [UILabel new];
    [self addSubview:_leftLabel];
    
    _rightLabel = [UILabel new];
    _rightLabel.textAlignment = NSTextAlignmentRight;
    [self addSubview:_rightLabel];
    
    [_leftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(self.labelInsets.left);
        make.top.offset(self.labelInsets.top);
        make.width.mas_equalTo(100);
        make.bottom.offset(-self.labelInsets.bottom);
    }];
    
    [_rightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(-self.labelInsets.right);
        make.centerY.height.equalTo(self.leftLabel);
        make.width.mas_equalTo(200);
    }];
}

- (void)setLabelInsets:(UIEdgeInsets)labelInsets {
    _labelInsets = labelInsets;
    [self setNeedsLayout];
}

- (void)setLeftLabelFitWidth:(BOOL)leftLabelFitWidth {
    _leftLabelFitWidth = leftLabelFitWidth;
    [self setNeedsLayout];
}

- (void)setRightLabelFitWidth:(BOOL)rightLabelFitWidth {
    _rightLabelFitWidth = rightLabelFitWidth;
    [self setNeedsLayout];
}

- (void)configurationLeftLabel:(void (^)(UILabel * _Nonnull))completeHandle {
    NSParameterAssert(completeHandle);
    completeHandle(self.leftLabel);
}

- (void)configurationRightLabel:(void (^)(UILabel * _Nonnull))completeHandle {
    NSParameterAssert(completeHandle);
    completeHandle(self.rightLabel);
}

- (void)configuration2Label:(void (^)(UILabel * _Nonnull))completeHandle {
    NSParameterAssert(completeHandle);
    completeHandle(self.leftLabel);
    completeHandle(self.rightLabel);
}

- (void)setLeftText:(id)text {
    NSAssert([text isKindOfClass:NSString.class] || [text isKindOfClass:NSAttributedString.class], @"text must be string");
    if ([text isKindOfClass:NSString.class]) {
        self.leftLabel.text = text;
    }else
        self.leftLabel.attributedText = text;
    [self setNeedsLayout];
}

- (void)setRightText:(id)text {
    NSAssert([text isKindOfClass:NSString.class] || [text isKindOfClass:NSAttributedString.class], @"text must be string");
    if ([text isKindOfClass:NSString.class]) {
        self.rightLabel.text = text;
    }else
        self.rightLabel.attributedText = text;
    [self setNeedsLayout];
}

- (void)setLeftText:(id)leftText rightText:(id)rightText {
    [self setLeftText:leftText];
    [self setRightText:rightText];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self.leftLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.offset(self.labelInsets.left);
        make.top.offset(self.labelInsets.top);
        make.bottom.offset(self.labelInsets.bottom);
    }];
    if (self.leftLabelFitWidth) {
        CGFloat left_width = [self.leftLabel sizeThatFits:CGSizeMake(CGFLOAT_MAX, 40)].width;
        [self.leftLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(left_width);
        }];
    }
    
    [self.rightLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.right.offset(-self.labelInsets.right);
    }];
    if (self.rightLabelFitWidth) {
        CGFloat right_width = [self.rightLabel sizeThatFits:CGSizeMake(CGFLOAT_MAX, 40)].width;
        [self.rightLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(right_width);
        }];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
