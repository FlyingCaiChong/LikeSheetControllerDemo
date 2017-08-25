//
//  MoodModel.h
//  优越指数部分
//
//  Created by fangheng on 2017/8/25.
//  Copyright © 2017年 fangheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, MoodType) {
    MoodTypeExcited, //兴奋
    MoodTypeHappy, // 开心
    MoodTypePeace, // 平和
    MoodTypeSad, // 伤心
    MoodTypeAnger // 愤怒
};

@interface YYMoodModel : NSObject

@property (nonatomic, assign) MoodType type;// 心情类型
@property (nonatomic, copy, readonly) NSString *moodDescription; // 文字描述
@property (nonatomic, strong, readonly) UIImage *moodImage; // 对应表情图片
@property (nonatomic, strong) NSDate *time;// 添加的时间

+ (instancetype)createModelWithType:(MoodType)type;

@end
