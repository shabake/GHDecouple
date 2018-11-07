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
typedef void (^ConfigurationCellBlock)(id cell, id model,GHModelHelper *modelHelper);
typedef void (^SelectBlock) (id model ,NSIndexPath *indexPath ,UITableView *table,GHModelHelper *modelHelper);
typedef void (^CellHeightBlock)(id model);

@interface GHModelHelper : NSObject<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, copy)CellHeightBlock cellHeightBlock;

+ (instancetype)sharedManager;
- (id)initWithIdentifier:(NSString *)identifier table: (UITableView *)table configuration:(ConfigurationCellBlock)configuration selectBlock: (SelectBlock)selectBlock ;

@property (nonatomic, strong)NSMutableArray *dataArray;
/** 添加数据源 */
- (void)addDataArray:(NSArray *)dataArray;
/** 刷新table */
- (void)reloadData;
@property (nonatomic , assign) CGFloat cellHeight;

@end

NS_ASSUME_NONNULL_END
