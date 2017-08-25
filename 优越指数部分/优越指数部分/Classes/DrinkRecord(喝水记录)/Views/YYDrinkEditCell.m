//
//  YYDrinkEditCell.m
//  优越指数部分
//
//  Created by fangheng on 2017/8/24.
//  Copyright © 2017年 fangheng. All rights reserved.
//

#import "YYDrinkEditCell.h"
#import "YYDrinkCupItem.h"

@interface YYDrinkEditCell ()
@property (weak, nonatomic) IBOutlet UIImageView *typeIconImageView;
@property (weak, nonatomic) IBOutlet UILabel *capacityLabel;
@property (weak, nonatomic) IBOutlet UILabel *typeNameLabel;

@end

@implementation YYDrinkEditCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)layoutWithModel:(YYDrinkCupItem *)model select:(BOOL)select {
    self.typeIconImageView.image = select ? model.editSelectImage : model.editNormalImage;
    self.typeNameLabel.text = model.typeName;
    self.capacityLabel.text = [NSString stringWithFormat:@"%@mL", model.capacity];
}

@end
