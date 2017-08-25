//
//  YYDrinkCupItem.h
//  优越指数部分
//
//  Created by fangheng on 2017/8/22.
//  Copyright © 2017年 fangheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, YYDrinkCupItemType) {
    YYDrinkCupItemTypeNormalCup,
    YYDrinkCupItemTypeMineralWaterCup,
    YYDrinkCupItemTypeGoblet,
    YYDrinkCupItemTypeCoffeeCup,
};

@interface YYDrinkCupItem : NSObject

@property (nonatomic, assign) YYDrinkCupItemType type; /// 杯子类型
@property (nonatomic, strong, readonly) NSString *typeName; /// 类型名称
@property (nonatomic, strong) NSNumber *capacity; /// 水量
@property (nonatomic, strong, readonly) UIImage *editNormalImage; /// 编辑时常规图
@property (nonatomic, strong, readonly) UIImage *editSelectImage; /// 编辑时选中图
@property (nonatomic, assign) BOOL editSelect; /// 编辑时是否选中
@property (nonatomic, strong, readonly) UIImage *drinkNormalImage; /// 喝水界面常规图
@property (nonatomic, strong, readonly) UIImage *drinkSelectImage; /// 喝水界面选中图

/// 创建模型
+ (instancetype)createItemWithType:(YYDrinkCupItemType)type capacity:(NSNumber *)capacity;

@end
