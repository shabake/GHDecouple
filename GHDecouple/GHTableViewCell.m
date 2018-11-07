//
//  GHTableViewCell.m
//  GHDecouple
//
//  Created by mac on 2018/11/6.
//  Copyright © 2018年 GHome. All rights reserved.
//

#import "GHTableViewCell.h"
#import "GHModel.h"
#import "Masonry.h"

@interface GHTableViewCell()
@property (nonatomic, strong)UILabel *leftTitle;
@property (nonatomic, strong)UILabel *rightTitle;
@property (nonatomic, strong)UIView *line;
@property (nonatomic, strong)UILabel *rightDetails;

@end
@implementation GHTableViewCell

- (void)setRowMData:(GHModel *)rowMData {
    _rowMData = rowMData;
    self.leftTitle.text = rowMData.leftTitle;
    NSLog(@"leftTitle%@",rowMData.leftTitle);
    self.rightTitle.text = rowMData.rightTitle;
    self.rightDetails.text = rowMData.rightDetails;
    if (rowMData.cellType == GHModelCellTypeId) {
        self.rightDetails.hidden = NO;
    } else {
        self.rightDetails.hidden = YES;
    }
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
        [self configuration];
    }
    return self;
}
- (void)configuration {
    self.backgroundColor = [UIColor clearColor];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}
- (void)setupUI{
    [self.contentView addSubview:self.leftTitle];
    [self.leftTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(50);
        make.top.equalTo(self.contentView).offset(10);
        make.width.equalTo(@80);
    }];
    [self.contentView addSubview:self.rightTitle];
    [self.rightTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.leftTitle.mas_right).offset(20);
        make.centerY.equalTo(self.leftTitle);
        make.right.equalTo(self.contentView.mas_right).offset(-50);

    }];
    
    [self.contentView addSubview:self.rightDetails];
    [self.rightDetails mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.rightTitle);
        make.top.equalTo(self.rightTitle.mas_bottom).offset(5);
        make.right.equalTo(self.rightTitle);
    }];
    
    [self.contentView addSubview:self.line];
    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.leftTitle);
        make.right.equalTo(self.rightTitle);
        make.bottom.equalTo(self.contentView);

        make.height.equalTo(@(1));
    }];
}
- (UIView *)line {
    if (_line == nil) {
        _line = [[UIView alloc]init];
        _line.backgroundColor = [UIColor lightGrayColor];
    }
    return _line;
}

- (UILabel *)rightDetails{
    if (_rightDetails == nil) {
        _rightDetails = [[UILabel alloc]init];
        _rightDetails.textAlignment = NSTextAlignmentLeft;
        _rightDetails.hidden = YES;
        _rightDetails.numberOfLines = 0;
        _rightDetails.textColor = [UIColor lightGrayColor];
        _rightDetails.font = [UIFont systemFontOfSize:12];
    }
    return _rightDetails;
}
- (UILabel *)rightTitle{
    if (_rightTitle == nil) {
        _rightTitle = [[UILabel alloc]init];
        _rightTitle.textAlignment = NSTextAlignmentLeft;
        _rightTitle.textColor = [UIColor whiteColor];
        _rightTitle.font = [UIFont systemFontOfSize:15];

    }
    return _rightTitle;
}
- (UILabel *)leftTitle{
    if (_leftTitle == nil) {
        _leftTitle = [[UILabel alloc]init];
        _leftTitle.textAlignment = NSTextAlignmentLeft;
        _leftTitle.textColor = [UIColor lightGrayColor];
        _leftTitle.font = [UIFont systemFontOfSize:15];
    }
    return _leftTitle;
}
@end
