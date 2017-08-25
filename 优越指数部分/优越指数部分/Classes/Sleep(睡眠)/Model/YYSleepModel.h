//
//  YYSleepModel.h
//  优越指数部分
//
//  Created by fangheng on 2017/8/25.
//  Copyright © 2017年 fangheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YYSleepModel : NSObject

/// 睡眠开始时间
@property (nonatomic, strong) NSDate *startTime;

/// 睡眠结束时间
@property (nonatomic, strong) NSDate *endTime;

@end
