//
//  GHSectionTest.m
//  GHDecouple
//
//  Created by mac on 2018/11/8.
//  Copyright © 2018年 GHome. All rights reserved.
//

#import "GHSectionTest.h"
#import "Masonry.h"
#import "GHModel.h"
@interface GHSectionTest()
@property (nonatomic , strong) UILabel *title;

@end
@implementation GHSectionTest

- (void)setRowMData:(GHModel *)rowMData {
    _rowMData = rowMData;
    self.title.text = rowMData.sectionHeaderTitle;;
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
    }
    return _title;
}

@end
