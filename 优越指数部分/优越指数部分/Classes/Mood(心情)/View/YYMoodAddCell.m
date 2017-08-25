//
//  YYMoodAddCell.m
//  优越指数部分
//
//  Created by fangheng on 2017/8/25.
//  Copyright © 2017年 fangheng. All rights reserved.
//

#import "YYMoodAddCell.h"

@implementation YYMoodAddCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)addBtnTouched:(UIButton *)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(yy_moodAddCell:didTouchedAddBtn:)]) {
        [self.delegate yy_moodAddCell:self didTouchedAddBtn:sender];
    }
}

@end
