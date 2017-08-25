//
//  YYSleepSettingViewController.m
//  优越指数部分
//
//  Created by fangheng on 2017/8/24.
//  Copyright © 2017年 fangheng. All rights reserved.
//

#import "YYSleepSettingViewController.h"
#import "YYSleepHistoryViewController.h"
#import "YYSleepTimeSelectSheetController.h"

@interface YYSleepSettingViewController ()

@property (weak, nonatomic) IBOutlet UILabel *dateLabel;// 日期
@property (weak, nonatomic) IBOutlet UILabel *sleepStartTimeLabel;// 入睡时间
@property (weak, nonatomic) IBOutlet UILabel *sleepEndTimeLabel; // 起床时间
@property (weak, nonatomic) IBOutlet UIButton *recordBtn; // 记录按钮
@end

@implementation YYSleepSettingViewController

+ (instancetype)createVc {
    return [[YYSleepSettingViewController alloc] initWithNibName:@"YYSleepSettingViewController" bundle:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavi];
    [self setupUI];
}

- (void)setupNavi {
    self.navigationItem.title = @"记录睡眠";
    UIBarButtonItem *historyItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"youyuezhishu_daohang_jilu"] style:(UIBarButtonItemStylePlain) target:self action:@selector(historyItemClick:)];
    self.navigationItem.rightBarButtonItem = historyItem;
    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1.0f];
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60) forBarMetrics:UIBarMetricsDefault];
}

- (void)setupUI {
    self.dateLabel.text = [self currentDateStr];
}

#pragma mark - action
- (void)historyItemClick:(UIBarButtonItem *)item {
    YYSleepHistoryViewController *vc = [[YYSleepHistoryViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)recordBtnTouched:(UIButton *)sender {
    // 上传数据
    self.recordBtn.selected = YES;
    [self.recordBtn setBackgroundColor:[UIColor colorWithRed:186/255.0 green:187/255.0 blue:188/255.0 alpha:1.0]];
    [self.recordBtn setTitle:@"已记录" forState:UIControlStateNormal];
    [self.recordBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.recordBtn.enabled = NO;
}

- (IBAction)startTimeLabelTap:(UITapGestureRecognizer *)sender {
    
    YYSleepTimeSelectSheetController *sheet = [YYSleepTimeSelectSheetController createSheetController];
    sheet.selectTime = ^(NSString *timeStr) {
        self.sleepStartTimeLabel.text = timeStr;
    };
    [self presentViewController:sheet animated:YES completion:^{
        [sheet initialDatePickerTimeWithTime:[self currentSleepTimeWithString:self.sleepStartTimeLabel.text]];
    }];
}

- (IBAction)endTimeLabelTap:(UITapGestureRecognizer *)sender {
    YYSleepTimeSelectSheetController *sheet = [YYSleepTimeSelectSheetController createSheetController];
    sheet.selectTime = ^(NSString *timeStr) {
        self.sleepEndTimeLabel.text = timeStr;
    };
    [self presentViewController:sheet animated:YES completion:^{
        [sheet initialDatePickerTimeWithTime:[self currentSleepTimeWithString:self.sleepEndTimeLabel.text]];
    }];
}

- (NSDate *)currentSleepTimeWithString:(NSString *)str {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"HH : mm"];
    NSDate *date = [dateFormatter dateFromString:str];
    return date;
}

- (NSString *)currentDateStr {
    NSDate *date = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *currentDateStr = [dateFormatter stringFromDate:date];
    return currentDateStr;
}

@end
