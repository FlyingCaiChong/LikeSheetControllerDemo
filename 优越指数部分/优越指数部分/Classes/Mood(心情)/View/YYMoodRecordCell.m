//
//  YYMoodRecordCell.m
//  优越指数部分
//
//  Created by fangheng on 2017/8/25.
//  Copyright © 2017年 fangheng. All rights reserved.
//

#import "YYMoodRecordCell.h"
#import "YYMoodModel.h"

@interface YYMoodRecordCell()
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UIImageView *moodImageView;
@property (weak, nonatomic) IBOutlet UILabel *moodLabel;

@end

@implementation YYMoodRecordCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.userInteractionEnabled = NO;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)relayoutSubviewWithModel:(YYMoodModel *)model {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"a HH:mm"];// a表示显示上午／下午
    self.timeLabel.text = [dateFormatter stringFromDate:model.time];
    self.moodImageView.image = model.moodImage;
    self.moodLabel.text = model.moodDescription;
}

@end
