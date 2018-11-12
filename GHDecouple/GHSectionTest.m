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
@property (nonatomic , strong) UISwitch *switched;

@end
@implementation GHSectionTest

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
    [self.contentView addSubview:self.title];
    [self.title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.left.equalTo(self.contentView).offset(20);
    }];
    
    [self.contentView addSubview:self.switched];
    [self.switched mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.right.equalTo(self.contentView).offset(-20);
    }];
}

- (void)switched: (UISwitch *)switched {

}
- (UISwitch *)switched {
    if (_switched == nil) {
        _switched = [[UISwitch alloc]init];
        _switched.on = NO;
        [_switched addTarget:self action:@selector(switched:) forControlEvents:UIControlEventValueChanged];
    }
    return _switched;
}
- (UILabel *)title{
    if (_title == nil) {
        _title = [[UILabel alloc]init];
        _title.textAlignment = NSTextAlignmentLeft;
        _title.textColor = [UIColor lightGrayColor];
        _title.font = [UIFont systemFontOfSize:15];
        _title.backgroundColor = [UIColor clearColor];
        _title.text = @"adadaasdasdsadasd";
    }
    return _title;
}

@end
