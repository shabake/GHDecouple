//
//  GHSectionTest.h
//  GHDecouple
//
//  Created by mac on 2018/11/8.
//  Copyright © 2018年 GHome. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class GHModel,GHSectionTest;
@protocol GHSectionTestDelegate <NSObject>
@optional

- (void)sectionTest: (GHSectionTest *)sectionTest rowMData: (GHModel *)rowMData section:(NSInteger)section;

@end
@interface GHSectionTest : UITableViewHeaderFooterView
@property (nonatomic , strong) GHModel *rowMData;
@property (nonatomic , weak)id <GHSectionTestDelegate>delegate;
@property (nonatomic , assign) NSInteger section;

@end

NS_ASSUME_NONNULL_END
