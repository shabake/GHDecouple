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

@interface ViewController ()<GHHeaderDelegate,GHTestViewControllerDelegate>
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
- (void)testViewController:(GHTestViewController *)vc testString:(nonnull NSString *)testString indexPath:(nonnull NSIndexPath *)indexPath {
    GHModel *model = self.dataSource.dataArray[indexPath.row];
    model.rightTitle = testString;
    [self.dataSource reloadData];
}
- (void)loadData {
    __weak __typeof(self) weakSelf = self;
    self.dataSource = [[GHModelHelper alloc]initWithIdentifier:@"UITableViewCellID" headerIdentifier:@"" table:self.tableView configurationSectionHeader:^(GHModel *model, NSIndexPath * _Nonnull indexPath, GHModelHelper * _Nonnull modelHelper, id sectionHeaeder) {
        modelHelper.headerIdentifier = model.headerIdentifier;
        NSLog(@"%@",model.headerIdentifier);
        if (model.sectionType == GHModelSectionTypeFirst) {
            GHSectionHeader *section = (GHSectionHeader *)sectionHeaeder;
            section.rowMData = model;
        } else if (model.sectionType == GHModelSectionTypeSecond) {
            GHSectionTest *section = (GHSectionTest *)sectionHeaeder;
            section.rowMData = model;
        } else {
            
        }
        modelHelper.sectionHeaderHeight = model.sectionHeaderHeight;
    } configurationCellCount:^(GHModel *model, NSInteger section, GHModelHelper * _Nonnull modelHelper) {
        modelHelper.count = model.items.count;
    } configurationCellHeight:^(GHModel *model, NSIndexPath *indexPath, GHModelHelper *modelHelper) {
        GHModel *rowMData = [model.items by_ObjectAtIndex:indexPath.row];
        modelHelper.cellHeight = rowMData.cellHeight;
    } configuration:^(GHTableViewCell *cell, GHModel *model, GHModelHelper * modelHelper, NSIndexPath *indexPath) {
        GHModel *rowMData = [model.items by_ObjectAtIndex:indexPath.row];
        cell.rowMData = rowMData;
    } selectBlock:^(id  _Nonnull model, NSIndexPath * _Nonnull indexPath, UITableView * _Nonnull table, GHModelHelper * _Nonnull modelHelper) {
        NSLog(@"%@",indexPath);
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
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStylePlain];
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
