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
    GHModel *model  = self.dataSource.dataArray[indexPath.row];
    model.rightTitle = testString;
    [self.dataSource reloadData];
}
- (void)loadData {
    __weak __typeof(self) weakSelf = self;
    self.dataSource = [[GHModelHelper alloc]initWithIdentifier:@"UITableViewCellID" table:self.tableView configuration:^(GHTableViewCell *cell, GHModel *model, GHModelHelper *modelHelper) {
        cell.rowMData = model;
        modelHelper.cellHeight = model.cellHeight;
    } selectBlock:^(GHModel *model, NSIndexPath * _Nonnull indexPath, UITableView * _Nonnull table, GHModelHelper * _Nonnull modelHelper) {
        if (model.cellType == GHModelCellTypeName) {
            model.rightTitle = @"真的刷新了";
            [modelHelper reloadData];
            GHTestViewController *vc = [[GHTestViewController alloc]init];
            vc.delegate = weakSelf;
            [weakSelf.navigationController pushViewController:vc animated:YES];
            NSLog(@"昵称");
        } else if (model.cellType == GHModelCellTypeId) {
            NSLog(@"id");
        } else if (model.cellType == GHModelCellTypeSex) {
            NSLog(@"性别");
        } else if (model.cellType == GHModelCellTypeBirthday) {
            NSLog(@"生日");
        } else if (model.cellType == GHModelCellTypeSchool) {
            NSLog(@"学校");
        } else if (model.cellType == GHModelCellTypeZoon) {
            NSLog(@"地区");
        } else if (model.cellType == GHModelCellTypeSign) {
            NSLog(@"签名");
        }
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
        _tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectMake(0.1f, .1f, .1f, .1f)];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor = [UIColor blackColor];
    }
    return _tableView;
}


@end
