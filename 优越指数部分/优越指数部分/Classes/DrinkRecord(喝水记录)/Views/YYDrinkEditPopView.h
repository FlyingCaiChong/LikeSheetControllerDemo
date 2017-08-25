//
//  YYDrinkEditPopView.h
//  优越指数部分
//
//  Created by fangheng on 2017/8/21.
//  Copyright © 2017年 fangheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, YYDrinkEditType) {
    YYDrinkEditTypeCupsCapacity, /// 设置杯型容量
    YYDrinkEditTypeNormalCupML,
    YYDrinkEditTypeMineralWaterCupML,
    YYDrinkEditTypeGobletML,
    YYDrinkEditTypeCoffeeCupML,
};

@interface YYDrinkEditPopView : UIView

@property (nonatomic, copy) void (^sureBlock)();

+ (instancetype)createViewOnWindowWithType:(YYDrinkEditType)type cupsArr:(NSArray *)cupsArr;
- (void)dismiss;
@end

