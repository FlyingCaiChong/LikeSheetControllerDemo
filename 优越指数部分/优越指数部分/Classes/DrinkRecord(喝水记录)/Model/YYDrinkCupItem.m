//
//  YYDrinkCupItem.m
//  优越指数部分
//
//  Created by fangheng on 2017/8/22.
//  Copyright © 2017年 fangheng. All rights reserved.
//

#import "YYDrinkCupItem.h"

@interface YYDrinkCupItem ()

@property (nonatomic, strong, readwrite) NSString *typeName;
@property (nonatomic, strong, readwrite) UIImage *editNormalImage;
@property (nonatomic, strong, readwrite) UIImage *editSelectImage;
@property (nonatomic, strong, readwrite) UIImage *drinkNormalImage; /// 喝水界面常规图
@property (nonatomic, strong, readwrite) UIImage *drinkSelectImage; /// 喝水界面选中图
@end

@implementation YYDrinkCupItem

+ (instancetype)createItemWithType:(YYDrinkCupItemType)type capacity:(NSNumber *)capacity {
    return [[self alloc] initWithType:type capacity:capacity];
}

- (instancetype)initWithType:(YYDrinkCupItemType)type capacity:(NSNumber *)capacity {
    self = [super init];
    if (!self) {
        return nil;
    }
    
    self.type = type;
    self.capacity = capacity;
    
    return self;
}

- (void)setType:(YYDrinkCupItemType)type {
    _type = type;
    switch (type) {
        case YYDrinkCupItemTypeNormalCup:
            _typeName = @"普通杯型";
            _editNormalImage = [UIImage imageNamed:@"beixingshezhi_putongbeixing"];
            _editSelectImage = [UIImage imageNamed:@"beixingshezhi_putongbeixing_shezhi"];
            _drinkNormalImage = [UIImage imageNamed:@"heshui_putongbeixing"];
            _drinkSelectImage = [UIImage imageNamed:@"heshui_putongbeixing_dianji"];
            break;
        case YYDrinkCupItemTypeMineralWaterCup:
            _typeName = @"矿泉水类";
            _editNormalImage = [UIImage imageNamed:@"beixingshezhi_kuangquanshui"];
            _editSelectImage = [UIImage imageNamed:@"beixingshezhi_kuangquanshu_shezhii"];
            _drinkNormalImage = [UIImage imageNamed:@"heshui_kuangquanshui"];
            _drinkSelectImage = [UIImage imageNamed:@"heshui_kuangquanshui_dianji"];
            break;
        case YYDrinkCupItemTypeGoblet:
            _typeName = @"高脚杯类";
            _editNormalImage = [UIImage imageNamed:@"beixingshezhi_gaojiaobei"];
            _editSelectImage = [UIImage imageNamed:@"beixingshezhi_gaojiaobe_shezhi"];
            _drinkNormalImage = [UIImage imageNamed:@"heshui_gaojiaobei"];
            _drinkSelectImage = [UIImage imageNamed:@"heshui_gaojiaobei_dianji"];
            break;
        case YYDrinkCupItemTypeCoffeeCup:
            _typeName = @"咖啡杯类";
            _editNormalImage = [UIImage imageNamed:@"beixingshezhi_kafeibei"];
            _editSelectImage = [UIImage imageNamed:@"beixingshezhi_kafeibe_shezhii"];
            _drinkNormalImage = [UIImage imageNamed:@"heshui_kafeibei"];
            _drinkSelectImage = [UIImage imageNamed:@"heshui_kafeibei_dianji"];
            break;
            
        default:
            break;
    }
}

@end
