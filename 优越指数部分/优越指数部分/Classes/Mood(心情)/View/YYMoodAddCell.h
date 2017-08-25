//
//  YYMoodAddCell.h
//  优越指数部分
//
//  Created by fangheng on 2017/8/25.
//  Copyright © 2017年 fangheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YYMoodAddCell;
@protocol YYMoodAddCellDelegate <NSObject>

@optional
- (void)yy_moodAddCell:(YYMoodAddCell *)cell didTouchedAddBtn:(UIButton *)btn;

@end

@interface YYMoodAddCell : UITableViewCell

@property (nonatomic, weak) id<YYMoodAddCellDelegate> delegate;

@end
