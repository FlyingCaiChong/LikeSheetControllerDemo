//
//  YYSleepTimeSelectSheetController.h
//  优越指数部分
//
//  Created by fangheng on 2017/8/24.
//  Copyright © 2017年 fangheng. All rights reserved.
//
/**
    设置睡眠时间控制器,类似于AlertSheet
 */

#import <UIKit/UIKit.h>

@interface YYSleepTimeSelectSheetController : UIViewController

/// 用此方法来创建，已经设置好了转场动画
+ (instancetype)createSheetController;

/// 初始化picker的显示
- (void)initialDatePickerTimeWithTime:(NSDate *)dateTime;

/// 选择时间的回调
@property (nonatomic, copy) void (^selectTime)(NSString *timeStr);

@end
