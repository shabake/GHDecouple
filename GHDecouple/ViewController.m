//
//  ViewController.m
//  GHDecouple
//
//  Created by mac on 2018/11/6.
//  Copyright © 2018年 GHome. All rights reserved.
//

#import "ViewController.h"
#import "GHModelHelper.h"
#import "GHModel.h"
#import "GHTableViewCell.h"
#import "GHHeader.h"
#import "GHTestViewController.h"
#import "NSArray+Bounds.h"
#import "GHSectionHeader.h"
#import "GHSectionTest.h"

@interface ViewController ()<GHHeaderDelegate,GHTestViewControllerDelegate,GHSectionTestDelegate>
@property (nonatomic , strong) UITableView *tableView;
@property (nonatomic , strong) GHModelHelper *dataSource;
@property (nonatomic , strong) GHHeader *header;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
    [self loadData];
}
- (void)sectionTest:(GHSectionTest *)sectionTest rowMData:(nonnull GHModel *)rowMData section:(NSInteger)section {
    GHModel *model = self.dataSource.dataArray[section];
    model.on = rowMData.on;
    [self.dataSource reloadData];
}
- (void)testViewController:(GHTestViewController *)vc testString:(nonnull NSString *)testString indexPath:(nonnull NSIndexPath *)indexPath {
    GHModel *model = self.dataSource.dataArray[indexPath.row];
    model.rightTitle = testString;
    [self.dataSource reloadData];
}

- (void)loadData {
    self.dataSource = [[GHModelHelper alloc]initWithIdentifier:@"UITableViewCellID" headerIdentifier:@"" table:self.tableView configurationSectionHeaderHeight:^(GHModel *model, GHModelHelper * _Nonnull modelHelper) {
        modelHelper.sectionHeaderHeight = model.sectionHeaderHeight;
    } configurationSectionHeader:^(GHModel *model, NSInteger section, GHModelHelper * _Nonnull modelHelper, id  _Nonnull view) {
        modelHelper.headerIdentifier = model.headerIdentifier;

        if (model.sectionType == GHModelSectionTypeFirst) {
            if ([view isKindOfClass:[GHSectionHeader class]]) {
                GHSectionHeader *sectionHeader = (GHSectionHeader *)view;
                sectionHeader.rowMData = model;
            }
        } else if (model.sectionType == GHModelSectionTypeSecond) {
            if ([view isKindOfClass:[GHSectionTest class]]) {
                GHSectionTest *sectionHeader = (GHSectionTest *)view;
                sectionHeader.rowMData = model;
                sectionHeader.delegate = self;
            }
        }
    } configurationCellCount:^(GHModel *model, NSInteger section, GHModelHelper * _Nonnull modelHelper) {
        modelHelper.count = model.items.count;
    } configurationCellHeight:^(GHModel *model, NSIndexPath * _Nonnull indexPath, GHModelHelper * _Nonnull modelHelper) {
        GHModel *rowMData = [model.items by_ObjectAtIndex:indexPath.row];
        modelHelper.cellHeight = rowMData.cellHeight;
    } configuration:^(GHTableViewCell *cell, GHModel *model, GHModelHelper * _Nonnull modelHelper, NSIndexPath * _Nonnull indexPath) {
        GHModel *rowMData = [model.items by_ObjectAtIndex:indexPath.row];
        cell.rowMData = rowMData;
    } selectBlock:^(GHModel *model, NSIndexPath * _Nonnull indexPath, UITableView * _Nonnull table, GHModelHelper * _Nonnull modelHelper) {
    }];
    [self.dataSource addDataArray:[GHModel creatModelData]];
    self.tableView.dataSource = self.dataSource;
    self.tableView.delegate = self.dataSource;
}
- (void)setupUI {
    self.tableView.tableHeaderView = self.header;
    self.view.backgroundColor = [UIColor blackColor];
    [self.view addSubview:self.tableView];
}
- (void)header:(GHHeader *)headerDidClick {
    NSLog(@"修改头像");
}
- (GHHeader *)header {
    if (_header == nil) {
        _header = [[GHHeader alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 200)];
        _header.delegate = self;
    }
    return _header;
}
- (UITableView *)tableView {
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStyleGrouped];
        [_tableView registerClass:[GHTableViewCell class] forCellReuseIdentifier:@"UITableViewCellID"];
        [_tableView registerClass:[GHSectionHeader class] forHeaderFooterViewReuseIdentifier:@"sectionHeader"];
        [_tableView registerClass:[GHSectionTest class] forHeaderFooterViewReuseIdentifier:@"GHSectionTest"];
        _tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectMake(0.1f, .1f, .1f, .1f)];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor = [UIColor blackColor];
    }
    return _tableView;
}


@end
