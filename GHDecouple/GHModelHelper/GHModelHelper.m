//
//  GHModelHelper.m
//  GHDecouple
//
//  Created by mac on 2018/11/6.
//  Copyright © 2018年 GHome. All rights reserved.
//

#import "GHModelHelper.h"
#import "NSArray+Bounds.h"
#import <objc/runtime.h>

@interface GHModelHelper()
@property (nonatomic, strong) NSString *cellIdentifier;
@property (nonatomic, copy) ConfigurationCellBlock configurationCellBlock;
@property (nonatomic, copy) ConfigurationCellCount configurationCellCount;
@property (nonatomic, copy) ConfigurationCellHeight configurationCellHeight;
@property (nonatomic, copy) SelectBlock selectBlock;
@property (nonatomic, strong) UITableView *table;

@end
@implementation GHModelHelper

- (id)initWithIdentifier:(NSString *)identifier table: (UITableView *)table
  configurationCellCount: (ConfigurationCellCount)configurationCellCount
 configurationCellHeight: (ConfigurationCellHeight)configurationCellHeight
           configuration:(ConfigurationCellBlock)configuration selectBlock: (SelectBlock)selectBlock {
    
    if(self = [super init]) {
        self.cellIdentifier = identifier;
        self.configurationCellBlock = configuration;
        self.configurationCellCount = configurationCellCount;
        self.configurationCellHeight = configurationCellHeight;
        self.selectBlock = selectBlock;
        self.table = table;
    }
    return self;
}

- (void)addDataArray:(NSArray *)dataArray {
    if(!dataArray) return;
    
    if (self.dataArray.count > 0) {
        [self.dataArray removeAllObjects];
    }
    [self.dataArray addObjectsFromArray:dataArray];
}

- (void)reloadData {
    [self.table reloadData];
}

//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
//    return self.sectionHeaderHeight > 0 ?self.sectionHeaderHeight:44.f;
//}
//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
//
//    return self.sectionHeaders.count ? [self.sectionHeaders by_ObjectAtIndex:section]: self.sectionHeader;
//}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    id model = [self.dataArray by_ObjectAtIndex:indexPath.section];
    if (self.configurationCellHeight) {
        self.configurationCellHeight(model, indexPath, self);
    }
    return self.cellHeight;
}

#pragma mark - 返回几组
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return self.dataArray.count;
}
#pragma mark - 返回每组多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    id model = [self.dataArray by_ObjectAtIndex:section];
    if(self.configurationCellCount) {
        self.configurationCellCount (model,section,self);
    }
    return self.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.cellIdentifier forIndexPath:indexPath];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:self.cellIdentifier];
    }
    id model = [self.dataArray by_ObjectAtIndex:indexPath.section];
    if(self.configurationCellBlock) {
        self.configurationCellBlock(cell, model,self,indexPath);
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    id model = [self modelsAtIndexPath:indexPath];
    if(self.selectBlock) {
        self.selectBlock(model,indexPath,tableView,self);
    }
}

- (id)modelsAtIndexPath:(NSIndexPath *)indexPath {
    return self.dataArray.count > indexPath.row ? self.dataArray[indexPath.row] : nil;
}

- (UIView *)sectionHeader {
    if (_sectionHeader == nil) {
        _sectionHeader = [[UIView alloc]init];
        _sectionHeader.backgroundColor = [UIColor whiteColor];
    }
    return _sectionHeader;
}
- (NSMutableArray *)sectionHeaders {
    if (_sectionHeaders == nil) {
        _sectionHeaders = [NSMutableArray array];

    }
    return _sectionHeaders;
}
- (NSMutableArray *)dataArray {
    if (_dataArray == nil) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}
@end
