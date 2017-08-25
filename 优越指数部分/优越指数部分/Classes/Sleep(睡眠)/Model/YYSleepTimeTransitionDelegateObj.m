//
//  YYSleepTimeTransitionDelegateObj.m
//  优越指数部分
//
//  Created by fangheng on 2017/8/24.
//  Copyright © 2017年 fangheng. All rights reserved.
//

#import "YYSleepTimeTransitionDelegateObj.h"
#import "YYSleepViewControllerTransitionAnimation.h"

@implementation YYSleepTimeTransitionDelegateObj
- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    return [YYSleepViewControllerTransitionAnimation createCustomAnimationWithType:(CustomAnimationTypePresent)];
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController: (UIViewController *)dismissed {
    return [YYSleepViewControllerTransitionAnimation createCustomAnimationWithType:(CustomAnimationTypeDismiss)];
}
@end
