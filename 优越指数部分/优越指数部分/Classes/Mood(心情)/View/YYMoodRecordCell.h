//
//  YYMoodRecordCell.h
//  优越指数部分
//
//  Created by fangheng on 2017/8/25.
//  Copyright © 2017年 fangheng. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YYMoodModel;
@interface YYMoodRecordCell : UITableViewCell

- (void)relayoutSubviewWithModel:(YYMoodModel *)model;

@end
