//
//  GHModelHelper.h
//  GHDecouple
//
//  Created by mac on 2018/11/6.
//  Copyright © 2018年 GHome. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class GHModelHelper;
typedef void (^ConfigurationCellCount)(id model,NSInteger section,GHModelHelper *modelHelper);
typedef void (^ConfigurationCellHeight)(id model,NSIndexPath *indexPath,GHModelHelper *modelHelper);

typedef void (^ConfigurationCellBlock)(id cell, id model,GHModelHelper *modelHelper,NSIndexPath *indexPath);
typedef void (^SelectBlock) (id model ,NSIndexPath *indexPath ,UITableView *table,GHModelHelper *modelHelper);

@interface GHModelHelper : NSObject<UITableViewDataSource,UITableViewDelegate>
/**
 
 @param identifier cell唯一标识符
 @param table tableView
 @param configuration 默认参数
 @param selectBlock 点击传参
 */
- (id)initWithIdentifier:(NSString *)identifier table: (UITableView *)table
  configurationCellCount: (ConfigurationCellCount)configurationCellCount
 configurationCellHeight: (ConfigurationCellHeight)configurationCellHeight
           configuration:(ConfigurationCellBlock)configuration selectBlock: (SelectBlock)selectBlock;

/** 动态高度 */
@property (nonatomic , assign) CGFloat cellHeight;
/** 字典数组 */
@property (nonatomic , strong) NSMutableArray *dataArray;

@property (nonatomic , strong) UIView *sectionHeader;
@property (nonatomic , strong) NSMutableArray *sectionHeaders;

/** 动态高度 */
@property (nonatomic , assign) CGFloat sectionHeaderHeight;
@property (nonatomic , assign) NSInteger count;

/** 添加数据源 */
- (void)addDataArray:(NSArray *)dataArray;
/** 刷新table */
- (void)reloadData;

@end

NS_ASSUME_NONNULL_END
