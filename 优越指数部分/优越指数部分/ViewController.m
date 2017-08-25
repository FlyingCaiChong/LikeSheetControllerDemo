//
//  ViewController.m
//  优越指数部分
//
//  Created by fangheng on 2017/8/21.
//  Copyright © 2017年 fangheng. All rights reserved.
//

#import "ViewController.h"
#import "YYDrinkRecordViewController.h"
#import "YYSleepSettingViewController.h"
#import "YYMoodRecordViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)push:(id)sender {
    YYDrinkRecordViewController *drvc = [YYDrinkRecordViewController createVC];
    [self.navigationController pushViewController:drvc animated:YES];
}
- (IBAction)pushSleepHistory:(id)sender {
    YYSleepSettingViewController *sleepvc = [YYSleepSettingViewController createVc];
    [self.navigationController pushViewController:sleepvc animated:YES];
}

- (IBAction)pushMood:(id)sender {
    YYMoodRecordViewController *moodvc = [[YYMoodRecordViewController alloc] init];
    [self.navigationController pushViewController:moodvc animated:YES];
}
@end
