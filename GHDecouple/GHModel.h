//
//  GHModel.h
//  GHDecouple
//
//  Created by mac on 2018/11/6.
//  Copyright © 2018年 GHome. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef NS_ENUM (NSUInteger,GHModelSectionType) {
    GHModelSectionTypeFirst,
    GHModelSectionTypeSecond,

};
typedef NS_ENUM (NSUInteger,GHModelCellType) {
    GHModelCellTypeName = 0,
    GHModelCellTypeId,
    GHModelCellTypeSex,
    GHModelCellTypeBirthday,
    GHModelCellTypeSchool,
    GHModelCellTypeZoon,
    GHModelCellTypeSign,
};
@interface GHModel : NSObject
@property (nonatomic , assign) GHModelSectionType sectionType;

/** cell类型 */
@property (nonatomic , assign) GHModelCellType cellType;
@property (nonatomic , copy)NSString *sectionHeaderTitle;
@property (nonatomic , assign)CGFloat sectionHeaderHeight;
@property (nonatomic , copy)NSString *headerIdentifier;
@property (nonatomic , copy)NSString *leftTitle;
@property (nonatomic , copy)NSString *rightTitle;
@property (nonatomic , copy)NSString *rightDetails;
@property (nonatomic , assign)CGFloat cellHeight;
@property (nonatomic , assign)BOOL hiddenLine;
@property (nonatomic , strong)UIColor *sectionHeaderBackGroundColor;
@property (nonatomic , strong)NSArray *items;

+ (NSArray *)creatModelData;
@end

NS_ASSUME_NONNULL_END
