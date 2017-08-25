//
//  YYSleepViewControllerTransitionAnimation.m
//  优越指数部分
//
//  Created by fangheng on 2017/8/24.
//  Copyright © 2017年 fangheng. All rights reserved.
//

#import "YYSleepViewControllerTransitionAnimation.h"
@interface YYSleepViewControllerTransitionAnimation ()

@property (nonatomic, assign) CustomAnimationType type;

@end

@implementation YYSleepViewControllerTransitionAnimation
- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext {
    return 0.25;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    UIView *containerView = [transitionContext containerView];
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
    
    // containerView里面有fromView
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    if (self.type == CustomAnimationTypePresent) {
        
        UIView *maskView = [[UIView alloc] initWithFrame:containerView.bounds];
        [maskView setBackgroundColor:[UIColor colorWithRed:21/255.0 green:24/255.0 blue:40/255.0 alpha:0.6]];
        [containerView addSubview:maskView];
    
        toView.frame = CGRectMake(0, containerView.bounds.size.height, containerView.bounds.size.width, containerView.bounds.size.height);
        [containerView addSubview:toView];
        [UIView animateWithDuration:duration animations:^{
            toView.frame = containerView.bounds;
        } completion:^(BOOL finished) {
            [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
            if (![transitionContext transitionWasCancelled]) {
                // 不移除maskView，从而实现遮罩效果
                [fromView removeFromSuperview];
            }
        }];
    } else {
        [containerView addSubview:toView];
        [UIView animateWithDuration:duration animations:^{
            fromView.frame = CGRectMake(0, containerView.bounds.size.height, containerView.bounds.size.width, containerView.bounds.size.height);
        } completion:^(BOOL finished) {
            [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
            if (![transitionContext transitionWasCancelled]) {
                [fromView removeFromSuperview];
            }
        }];
    }
}

+ (instancetype)createCustomAnimationWithType:(CustomAnimationType)type {
    return [[YYSleepViewControllerTransitionAnimation alloc] initWithType:type];
}

- (instancetype)initWithType:(CustomAnimationType)type {
    self = [super init];
    if (!self) return nil;
    
    self.type = type;
    
    return self;
}


@end
