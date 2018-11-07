//
//  GHModelHelper.m
//  GHDecouple
//
//  Created by mac on 2018/11/6.
//  Copyright © 2018年 GHome. All rights reserved.
//

#import "GHModelHelper.h"
@interface GHModelHelper()
@property (nonatomic, strong) NSString *cellIdentifier;
@property (nonatomic, copy) ConfigurationCellBlock configurationCellBlock;
@property (nonatomic, copy) SelectBlock selectBlock;
@property (nonatomic, strong) UITableView *table;

@end
@implementation GHModelHelper
+ (instancetype)sharedManager {
    
    static GHModelHelper *_instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
       
        _instance = [[self alloc] init];
    });
    return _instance;
}
- (id)initWithIdentifier:(NSString *)identifier table: (UITableView *)table configuration:(ConfigurationCellBlock)configuration selectBlock: (SelectBlock)selectBlock   {
    if(self = [super init]) {
        self.cellIdentifier = identifier;
        self.configurationCellBlock = configuration;
        self.selectBlock = selectBlock;
        self.table = table;
    }
    return self;
}

- (void)addDataArray:(NSArray *)dataArray {
    if(!dataArray) return;
    
    if (self.dataArray.count>0) {
        [self.dataArray removeAllObjects];
    }
    
    [self.dataArray addObjectsFromArray:dataArray];
}
- (void)reloadData {
    [self.table reloadData];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    return self.cellHeight;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return !self.dataArray? 0: self.dataArray.count;
}
- (id)modelsAtIndexPath:(NSIndexPath *)indexPath {
    return self.dataArray.count > indexPath.row ? self.dataArray[indexPath.row] : nil;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.cellIdentifier forIndexPath:indexPath];
    id model = [self modelsAtIndexPath:indexPath];
    if(self.configurationCellBlock) {
        self.configurationCellBlock(cell, model,self);
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    id model = [self modelsAtIndexPath:indexPath];
    if(self.selectBlock) {
        self.selectBlock(model,indexPath,tableView,self);
    }
}

- (NSMutableArray *)dataArray {
    if (_dataArray == nil) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}
@end
