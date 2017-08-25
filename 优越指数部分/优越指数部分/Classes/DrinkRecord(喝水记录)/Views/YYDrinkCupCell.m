//
//  YYDrinkCupCell.m
//  优越指数部分
//
//  Created by fangheng on 2017/8/25.
//  Copyright © 2017年 fangheng. All rights reserved.
//

#import "YYDrinkCupCell.h"
#import "YYDrinkCupItem.h"

@interface YYDrinkCupCell()
@property (weak, nonatomic) IBOutlet UIImageView *cupImageView;
@property (weak, nonatomic) IBOutlet UILabel *cupTypeLabel;
@property (weak, nonatomic) IBOutlet UILabel *cupCapacityLabel;


@end

@implementation YYDrinkCupCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)relayoutSubviewWithModel:(YYDrinkCupItem *)model {
    self.cupImageView.image = model.drinkNormalImage;
    self.cupTypeLabel.text = model.typeName;
    self.cupCapacityLabel.text = [NSString stringWithFormat:@"%@mL", model.capacity];
}

- (void)layoutSubViewWhenHighlightWithModel:(YYDrinkCupItem *)model {
    self.cupImageView.image = model.drinkSelectImage;
}

-(void)layoutSubViewWhenUnhighlightWithModel:(YYDrinkCupItem *)model {
    self.cupImageView.image = model.drinkNormalImage;
}

@end
