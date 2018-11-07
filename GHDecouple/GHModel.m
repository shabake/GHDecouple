//
//  GHModel.m
//  GHDecouple
//
//  Created by mac on 2018/11/6.
//  Copyright © 2018年 GHome. All rights reserved.
//

#import "GHModel.h"
#import "NSArray+Bounds.h"

@implementation GHModel
+ (NSArray *)creatModelData{
    NSArray *leftTitles = @[@"昵称",@"抖音ID",@"性别",@"生日",@"学校",@"地区",@"签名"];
    NSArray *rightTitles = @[@"水冰月",@"123456",@"女",@"点击设置生日",@"点击设置学校",@"点击设置地区",@"点击设置签名"];
    NSArray *types = @[    @(GHModelCellTypeName),
                           @(GHModelCellTypeId),
                           @(GHModelCellTypeSex),
                           @(GHModelCellTypeBirthday),
                           @(GHModelCellTypeSchool),
                           @(GHModelCellTypeZoon),
                           @(GHModelCellTypeSign)];
    NSMutableArray *dataArray = [NSMutableArray array];
    for (NSInteger index = 0; index < leftTitles.count; index++) {
        GHModel *model = [[GHModel alloc]init];
        model.leftTitle = [leftTitles by_ObjectAtIndex:index];
        model.rightTitle = [rightTitles by_ObjectAtIndex:index];
        NSNumber *typeNum = [types by_ObjectAtIndex:index];
        model.cellType = typeNum.integerValue;
        if (model.cellType == GHModelCellTypeId) {
            model.cellHeight = 80;
            model.rightDetails = @"只能修改一次,只允许包含\"字母.数字.下划线和点\".最长16个字符";
        } else {
            model.cellHeight = 44;
        }
        if (leftTitles.count - 1 == index) {
            model.hiddenLine = YES;
        }
        [dataArray addObject:model];
    }
    return dataArray.copy;
}
@end
