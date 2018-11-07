//
//  GHHeader.h
//  GHDecouple
//
//  Created by mac on 2018/11/7.
//  Copyright © 2018年 GHome. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class GHHeader;
@protocol GHHeaderDelegate <NSObject>
@optional

- (void)header:(GHHeader *)headerDidClick;
@end
@interface GHHeader : UIView
@property (nonatomic , weak)id <GHHeaderDelegate>delegate;
@end

NS_ASSUME_NONNULL_END
