//
//  YYMoodRecordViewController.m
//  优越指数部分
//
//  Created by fangheng on 2017/8/25.
//  Copyright © 2017年 fangheng. All rights reserved.
//

#import "YYMoodRecordViewController.h"
#import "YYMoodRecordCell.h"
#import "YYMoodAddCell.h"
#import "YYMoodSelectPopController.h"
#import "YYMoodModel.h"

@interface YYMoodRecordViewController ()<UITableViewDelegate, UITableViewDataSource, YYMoodAddCellDelegate>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *dataSource;

@end

@implementation YYMoodRecordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavi];
    [self.view addSubview:self.tableView];
    //TODO: 获取心情记录
}

- (void)setupNavi {
    self.navigationItem.title = @"记录心情";
    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1.0f];
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60) forBarMetrics:UIBarMetricsDefault];
}

#pragma mark - <UITableViewDelegate, UITableViewDataSource>
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    YYMoodRecordCell *recordCell = [tableView dequeueReusableCellWithIdentifier:@"YYMoodRecordCell"];
    YYMoodAddCell *addCell = [tableView dequeueReusableCellWithIdentifier:@"YYMoodAddCell"];
    addCell.delegate = self;
    if (indexPath.row == self.dataSource.count-1) {
        return addCell;
    } else {
         YYMoodModel *model = self.dataSource[indexPath.row];
        [recordCell relayoutSubviewWithModel:model];
        return recordCell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == self.dataSource.count-1) {
        return 140.f;
    } else {
        return 135.f;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == self.dataSource.count-1) {}
}

#pragma mark - YYMoodAddCellDelegate
- (void)yy_moodAddCell:(YYMoodAddCell *)cell didTouchedAddBtn:(UIButton *)btn {
    YYMoodSelectPopController *popController = [YYMoodSelectPopController createSelectPopController];
    popController.selectMood = ^(YYMoodModel *model) { // 添加心情回调
        // TODO: 添加心情
        [self.dataSource insertObject:model atIndex:0];
        NSArray *insertIndexPath = @[[NSIndexPath indexPathForRow:0 inSection:0]];
        [self.tableView insertRowsAtIndexPaths:insertIndexPath withRowAnimation:UITableViewRowAnimationTop];
    };
    [self presentViewController:popController animated:YES completion:^{
        
    }];
}
#pragma mark - setter and getter
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [UIView new];
        _tableView.backgroundColor = [UIColor colorWithRed:250/255.0 green:250/255.0 blue:250/255.0 alpha:1.0];
        UINib *recordCellNib = [UINib nibWithNibName:@"YYMoodRecordCell" bundle:nil];
        [_tableView registerNib:recordCellNib forCellReuseIdentifier:@"YYMoodRecordCell"];
        UINib *addCellNib = [UINib nibWithNibName:@"YYMoodAddCell" bundle:nil];
        [_tableView registerNib:addCellNib forCellReuseIdentifier:@"YYMoodAddCell"];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}

- (NSMutableArray *)dataSource {
    if (!_dataSource) {
        YYMoodModel *placeholderModel = [[YYMoodModel alloc] init];// 占位模型， 位于数组最后一个
        _dataSource = [NSMutableArray arrayWithObjects:placeholderModel, nil];
    }
    return _dataSource;
}

@end
