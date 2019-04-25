//
//  FreshTableViewCell.m
//  FreshDemo
//
//  Created by imac on 2019/4/19.
//  Copyright © 2019 com.GodL.github. All rights reserved.
//

#import "FreshTableViewCell.h"
#import <Masonry/Masonry.h>
@import ObjectiveC.runtime;

@implementation FreshTableViewCell

@synthesize backgroundImageView = _backgroundImageView;

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupSubViews];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setupSubViews];
    }
    return self;
}

- (void)setupSubViews {
    self.backgroundColor = [UIColor clearColor];
    self.contentView.backgroundColor = [UIColor clearColor];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (UIImageView *)backgroundImageView {
    if (!_backgroundImageView) {
        _backgroundImageView = [UIImageView new];
        _backgroundImageView.userInteractionEnabled = YES;
        [self.contentView addSubview:_backgroundImageView];
        [_backgroundImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.insets(UIEdgeInsetsZero);
        }];
    }
    return _backgroundImageView;
}

- (void)configurationCellWithItem:(id)value {}

+ (void)registerToTableView:(UITableView *)tableView {
    [tableView registerClass:self forCellReuseIdentifier:[self description]];
}

+ (NSString *)description {
    return [NSStringFromClass(self.class) stringByAppendingString:@"_reuseIdentifier"];
}

#ifdef DEBUG
- (void)dealloc {
    NSLog(@"%@ delloc",NSStringFromClass(self.class));
}
#endif

@end

