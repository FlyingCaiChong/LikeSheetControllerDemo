//
//  YYSleepHistoryCell.m
//  优越指数部分
//
//  Created by fangheng on 2017/8/24.
//  Copyright © 2017年 fangheng. All rights reserved.
//

#import "YYSleepHistoryCell.h"

@interface YYSleepHistoryCell()

@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

@property (weak, nonatomic) IBOutlet UILabel *sleepStartTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *sleepEndTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *sleepIntervalLabel;

@end

@implementation YYSleepHistoryCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
