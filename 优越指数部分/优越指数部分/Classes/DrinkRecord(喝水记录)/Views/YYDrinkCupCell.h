//
//  YYDrinkCupCell.h
//  优越指数部分
//
//  Created by fangheng on 2017/8/25.
//  Copyright © 2017年 fangheng. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YYDrinkCupItem;
@interface YYDrinkCupCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIView *decorateView;

- (void)relayoutSubviewWithModel:(YYDrinkCupItem *)model;
- (void)layoutSubViewWhenHighlightWithModel:(YYDrinkCupItem *)model; /// 高亮时
- (void)layoutSubViewWhenUnhighlightWithModel:(YYDrinkCupItem *)model; /// 取消高亮
@end
