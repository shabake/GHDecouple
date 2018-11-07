//
//  GHTestViewController.h
//  GHDecouple
//
//  Created by mac on 2018/11/7.
//  Copyright © 2018年 GHome. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class GHTestViewController;
@protocol GHTestViewControllerDelegate <NSObject>
@optional

- (void)testViewController: (GHTestViewController *)vc testString: (NSString *)testString indexPath: (NSIndexPath *)indexPath;

@end
@interface GHTestViewController : UIViewController
@property (nonatomic , weak)id <GHTestViewControllerDelegate>delegate;
@property (nonatomic , strong)NSIndexPath * indexPath;

@end

NS_ASSUME_NONNULL_END
