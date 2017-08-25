//
//  YYSleepViewControllerTransitionAnimation.h
//  优越指数部分
//
//  Created by fangheng on 2017/8/24.
//  Copyright © 2017年 fangheng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, CustomAnimationType) {
    CustomAnimationTypePresent,
    CustomAnimationTypeDismiss
};

@interface YYSleepViewControllerTransitionAnimation : NSObject<UIViewControllerAnimatedTransitioning>
+ (instancetype)createCustomAnimationWithType:(CustomAnimationType)type;
@end
