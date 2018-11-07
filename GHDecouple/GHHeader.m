//
//  GHHeader.m
//  GHDecouple
//
//  Created by mac on 2018/11/7.
//  Copyright © 2018年 GHome. All rights reserved.
//

#import "GHHeader.h"
#import "Masonry.h"

@interface GHHeader()
@property (nonatomic , strong) UIImageView *imageView;
@property (nonatomic , strong) UILabel *title;

@end
@implementation GHHeader

- (instancetype)initWithFrame:(CGRect)frame {
    if (self == [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}
- (void)setupUI {
    [self addSubview:self.imageView];
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.height.width.equalTo(@100);
        make.centerY.equalTo(self);

    }];
    
    [self addSubview:self.title];
    [self.title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.imageView.mas_bottom).offset(10);
        make.centerX.equalTo(self.imageView);
    
    }];
}
- (void)didClick {
    if (self.delegate && [self.delegate respondsToSelector:@selector(header:)]) {
        [self.delegate header:self];
    }
}
- (UILabel *)title{
    if (_title == nil) {
        _title = [[UILabel alloc]init];
        _title.textAlignment = NSTextAlignmentCenter;
        _title.textColor = [UIColor lightGrayColor];
        _title.font = [UIFont systemFontOfSize:15];
        _title.text = @"点击修改头像";
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didClick)];
        [self addGestureRecognizer:tap];
    }
    return _title;
}
- (UIImageView *)imageView {
    if (_imageView == nil) {
        _imageView = [[UIImageView alloc]init];
        _imageView.backgroundColor = [UIColor redColor];
        _imageView.layer.masksToBounds = YES;
        _imageView.layer.cornerRadius = 50;

    }
    return _imageView;
}

@end
