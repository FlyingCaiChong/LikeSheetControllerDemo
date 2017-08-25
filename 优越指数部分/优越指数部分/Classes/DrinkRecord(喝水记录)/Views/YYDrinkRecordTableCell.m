//
//  YYDrinkRecordTableCell.m
//  优越指数部分
//
//  Created by fangheng on 2017/8/21.
//  Copyright © 2017年 fangheng. All rights reserved.
//

#import "YYDrinkRecordTableCell.h"

@interface YYDrinkRecordTableCell()
@property (weak, nonatomic) IBOutlet UIImageView *cupImageView;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *capacityLabel;

@end

@implementation YYDrinkRecordTableCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
