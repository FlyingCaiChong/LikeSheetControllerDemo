//
//  YYSleepTimeSelectSheetController.m
//  优越指数部分
//
//  Created by fangheng on 2017/8/24.
//  Copyright © 2017年 fangheng. All rights reserved.
//

#import "YYSleepTimeSelectSheetController.h"
#import "YYSleepTimeTransitionDelegateObj.h"

@interface YYSleepTimeSelectSheetController ()

@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

@property (nonatomic, strong) YYSleepTimeTransitionDelegateObj *transitionDelegateObj;

@end

@implementation YYSleepTimeSelectSheetController

+ (instancetype)createSheetController {
    YYSleepTimeSelectSheetController *sheet = [[YYSleepTimeSelectSheetController alloc] init];
    sheet.transitioningDelegate = sheet.transitionDelegateObj;
    sheet.modalPresentationStyle = UIModalPresentationCustom;
    return sheet;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)initialDatePickerTimeWithTime:(NSDate *)dateTime {
    [self.datePicker setDate:dateTime animated:YES];
}

- (IBAction)sureBtnClick:(UIButton *)sender {
    if (self.selectTime) {
        self.selectTime([self currentSelectTimeStr]);
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)tapMaskView:(UITapGestureRecognizer *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (YYSleepTimeTransitionDelegateObj *)transitionDelegateObj {
    if (!_transitionDelegateObj) {
        _transitionDelegateObj = [[YYSleepTimeTransitionDelegateObj alloc] init];
    }
    return _transitionDelegateObj;
}

- (NSString *)currentSelectTimeStr {
    NSDate *selectedDate = [self.datePicker date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"HH : mm"];
    NSString *dateStr = [dateFormatter stringFromDate:selectedDate];
    return dateStr;
}

@end
