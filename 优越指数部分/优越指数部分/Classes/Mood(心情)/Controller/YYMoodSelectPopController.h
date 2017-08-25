//
//  YYModeSelectPopController.h
//  优越指数部分
//
//  Created by fangheng on 2017/8/25.
//  Copyright © 2017年 fangheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YYMoodModel;
@interface YYMoodSelectPopController : UIViewController

@property (nonatomic, copy) void (^selectMood)(YYMoodModel *model);

/// 用此方法初始化
+ (instancetype)createSelectPopController;

@end
