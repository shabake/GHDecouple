//
//  GHTableViewCell.h
//  GHDecouple
//
//  Created by mac on 2018/11/6.
//  Copyright © 2018年 GHome. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class GHModel;
@interface GHTableViewCell : UITableViewCell
@property (nonatomic , strong) GHModel *rowMData;
@end

NS_ASSUME_NONNULL_END
