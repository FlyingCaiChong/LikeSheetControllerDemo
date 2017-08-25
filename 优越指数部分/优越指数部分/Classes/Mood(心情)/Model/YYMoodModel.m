//
//  MoodModel.m
//  优越指数部分
//
//  Created by fangheng on 2017/8/25.
//  Copyright © 2017年 fangheng. All rights reserved.
//

#import "YYMoodModel.h"

@interface YYMoodModel ()

@property (nonatomic, copy, readwrite) NSString *moodDescription; // 文字描述
@property (nonatomic, strong, readwrite) UIImage *moodImage; // 对应表情图片

@end

@implementation YYMoodModel

+ (instancetype)createModelWithType:(MoodType)type {
    return [[self alloc] initWithMoodType:type];
}

- (instancetype)initWithMoodType:(MoodType)type {
    self = [super init];
    if (!self) return nil;
    self.type = type;
    return self;
}

- (void)setType:(MoodType)type {
    _type = type;
    switch (type) {
        case MoodTypeExcited:
        {
            self.moodImage = [UIImage imageNamed:@"xinqing_xingfen"];
            self.moodDescription = @"兴奋";
        }
            break;
        case MoodTypeHappy:
        {
            self.moodImage = [UIImage imageNamed:@"xinqing_kaixin"];
            self.moodDescription = @"开心";
        }
            break;
        case MoodTypePeace:
        {
            self.moodImage = [UIImage imageNamed:@"xinqing_pinghe"];
            self.moodDescription = @"平和";
        }
            break;
        case MoodTypeSad:
        {
            self.moodImage = [UIImage imageNamed:@"xinqing_shangxin"];
            self.moodDescription = @"伤心";
        }
            break;
        case MoodTypeAnger:
        {
            self.moodImage = [UIImage imageNamed:@"xinqing_fenlv"];
            self.moodDescription = @"愤怒";
        }
            break;
            
        default:
            break;
    }
}

@end
