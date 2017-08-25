//
//  YYMoodSelectCell.m
//  优越指数部分
//
//  Created by fangheng on 2017/8/25.
//  Copyright © 2017年 fangheng. All rights reserved.
//

#import "YYMoodSelectCell.h"
#import "YYMoodModel.h"

@interface YYMoodSelectCell ()
@property (weak, nonatomic) IBOutlet UIImageView *moodImageView;
@property (weak, nonatomic) IBOutlet UILabel *moodLabel;

@end

@implementation YYMoodSelectCell

- (void)relayoutSubviewWithModel:(YYMoodModel *)model {
    self.moodImageView.image = model.moodImage;
    self.moodLabel.text = model.moodDescription;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

@end
