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
//+ (NSArray *)creatModelData{
//    NSArray *leftTitles = @[@"昵称",@"抖音ID",@"性别",@"生日",@"学校",@"地区",@"签名"];
//    NSArray *rightTitles = @[@"水冰月",@"123456",@"女",@"点击设置生日",@"点击设置学校",@"点击设置地区",@"点击设置签名"];
//    NSArray *types = @[    @(GHModelCellTypeName),
//                           @(GHModelCellTypeId),
//                           @(GHModelCellTypeSex),
//                           @(GHModelCellTypeBirthday),
//                           @(GHModelCellTypeSchool),
//                           @(GHModelCellTypeZoon),
//                           @(GHModelCellTypeSign)];
//    NSMutableArray *dataArray = [NSMutableArray array];
//    for (NSInteger index = 0; index < leftTitles.count; index++) {
//        GHModel *model = [[GHModel alloc]init];
//        model.leftTitle = [leftTitles by_ObjectAtIndex:index];
//        model.rightTitle = [rightTitles by_ObjectAtIndex:index];
//        NSNumber *typeNum = [types by_ObjectAtIndex:index];
//        model.cellType = typeNum.integerValue;
//        if (model.cellType == GHModelCellTypeId) {
//            model.cellHeight = 80;
//            model.rightDetails = @"只能修改一次,只允许包含\"字母.数字.下划线和点\".最长16个字符";
//        } else {
//            model.cellHeight = 44;
//        }
//        
//        [dataArray addObject:model];
//    }
//    return dataArray.copy;
//}

+ (NSArray *)creatModelData{
    NSMutableArray *dataArray = [NSMutableArray array];
    [dataArray addObject:[self creatFirst]];
    [dataArray addObject:[self creatSecond]];
    [dataArray addObject:[self creatFirst]];
    [dataArray addObject:[self creatSecond]];
    [dataArray addObject:[self creatFirst]];
    [dataArray addObject:[self creatSecond]];
    [dataArray addObject:[self creatFirst]];
    [dataArray addObject:[self creatSecond]];
    [dataArray addObject:[self creatFirst]];
    [dataArray addObject:[self creatSecond]];
    [dataArray addObject:[self creatFirst]];
    [dataArray addObject:[self creatSecond]];
    [dataArray addObject:[self creatFirst]];
    [dataArray addObject:[self creatSecond]];
    return dataArray.copy;
}

+ (GHModel *)creatSecond {
    GHModel *sectionModel = [[GHModel alloc]init];
    sectionModel.sectionHeaderTitle = @"GHSectionTest";
    sectionModel.sectionHeaderHeight = 100;
    sectionModel.headerIdentifier = @"GHSectionTest";
    sectionModel.sectionType = GHModelSectionTypeSecond;
    sectionModel.sectionBackGroundColor = [UIColor redColor];
    NSArray *leftTitles = @[@"第二组第一个",@"第二组第二个"];
    NSArray *rightTitles = @[@"2",@"1",@"女",@"点击设置生日",@"点击设置学校",@"点击设置地区",@"点击设置签名"];
    NSArray *types = @[
                       @(GHModelCellTypeName),
                           @(GHModelCellTypeName),
                      ];
    NSMutableArray <GHModel *>*dataArray = [NSMutableArray array];
    for (NSInteger index = 0; index < leftTitles.count; index++) {
        GHModel *model = [[GHModel alloc]init];
        model.leftTitle = [NSString stringWithFormat:@"第%d组红包",2];
        model.rightTitle = [NSString stringWithFormat:@"第%ld个",(long)index];
        NSNumber *typeNum = [types by_ObjectAtIndex:index];
        model.cellType = typeNum.integerValue;
        model.cellHeight = 44;
        [dataArray addObject:model];
    }
    sectionModel.items = dataArray.copy;
    return sectionModel;
}
+ (GHModel *)creatFirst {
    GHModel *sectionModel = [[GHModel alloc]init];
    sectionModel.sectionHeaderTitle = @"sectionHeader";
    sectionModel.sectionHeaderHeight = 44;
    sectionModel.sectionType = GHModelSectionTypeFirst;
    sectionModel.sectionBackGroundColor = [UIColor blueColor];
    sectionModel.headerIdentifier = @"sectionHeader";
    NSArray *leftTitles = @[@"第一组",@"抖音ID",@"性别",@"生日",@"学校",@"地区",@"签名"];
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
        model.leftTitle = [NSString stringWithFormat:@"第%d组红包",1];
        model.rightTitle = [NSString stringWithFormat:@"第%ld个",(long)index];
        NSNumber *typeNum = [types by_ObjectAtIndex:index];
        model.cellType = typeNum.integerValue;
        model.on = NO;
        if (model.cellType == GHModelCellTypeId) {
            model.cellHeight = 80;
            model.rightDetails = @"只能修改一次,只允许包含\"字母.数字.下划线和点\".最长16个字符";
        } else {
            model.cellHeight = 44;
        }
        [dataArray addObject:model];
    }
    sectionModel.items = dataArray.copy;
    return sectionModel;
}
@end
