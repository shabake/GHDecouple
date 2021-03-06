//
//  GHSectionHeader.m
//  GHDecouple
//
//  Created by mac on 2018/11/8.
//  Copyright © 2018年 GHome. All rights reserved.
//

#import "GHSectionHeader.h"
#import "Masonry.h"
#import "GHModel.h"

@interface GHSectionHeader()
@property (nonatomic , strong) UILabel *title;
@end
@implementation GHSectionHeader

- (void)setRowMData:(GHModel *)rowMData {
    _rowMData = rowMData;
    self.title.text = rowMData.sectionHeaderTitle;;
    self.contentView.backgroundColor = rowMData.sectionBackGroundColor;
}

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    if (self == [super initWithReuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame {
    if (self == [super initWithFrame:frame]) {

    }
    return self;
}

- (void)setupUI {
    [self addSubview:self.title];
    [self.title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
}
- (UILabel *)title{
    if (_title == nil) {
        _title = [[UILabel alloc]init];
        _title.textAlignment = NSTextAlignmentLeft;
        _title.textColor = [UIColor lightGrayColor];
        _title.font = [UIFont systemFontOfSize:15];
        _title.text = @"dasda";
        _title.backgroundColor = [UIColor clearColor];
    }
    return _title;
}
@end
