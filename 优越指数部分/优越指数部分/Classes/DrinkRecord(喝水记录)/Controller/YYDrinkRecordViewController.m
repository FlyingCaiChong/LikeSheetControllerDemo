//
//  YYDrinkRecordViewController.m
//  优越指数部分
//
//  Created by fangheng on 2017/8/21.
//  Copyright © 2017年 fangheng. All rights reserved.
//

#import "YYDrinkRecordViewController.h"
#import "YYDrinkRecordTableCell.h"
#import "YYDrinkEditPopView.h"
#import "YYDrinkCupItem.h"
#import "YYDrinkCupCell.h"
/* ⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️ 后台缺少总喝水量数据 */
@interface YYDrinkRecordViewController ()<UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UILabel *drinkTotalLabel;/// 今天喝水量
@property (weak, nonatomic) IBOutlet UILabel *drinkAddLabel; /// 单次增加的喝水量，隐藏 + 动画效果TODO

@property (weak, nonatomic) IBOutlet UITableView *todayRecordTableView; /// 今日记录列表

@property (nonatomic, strong) YYDrinkEditPopView *popView; /// 自定义编辑视图


@property (nonatomic, copy) NSArray *cupTypeArr; /// 编辑视图的数据源

@property (nonatomic, strong) NSNumber *drinkTotalCapacity;/// 今天喝水总量
@property (weak, nonatomic) IBOutlet UICollectionView *cupCollectionView;

@end

@implementation YYDrinkRecordViewController

+ (instancetype)createVC {
   return [[YYDrinkRecordViewController alloc] initWithNibName:@"YYDrinkRecordViewController" bundle:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
#warning test
    self.drinkTotalCapacity = @(0);
    
    [self setupTableView];
    [self reloadDrink];
    [self setupNavi];
    [self setupCupCollectionView];
    self.drinkAddLabel.alpha = 0;
    
    // TODO: 获取全部的杯型
    // TODO: 获取喝水记录
}

- (void)setupNavi {
    self.navigationItem.title = @"喝水记录";
    UIBarButtonItem *editItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"heshui_bianji"] style:(UIBarButtonItemStylePlain) target:self action:@selector(editItemClick:)];
    self.navigationItem.rightBarButtonItem = editItem;
    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1.0f];
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60) forBarMetrics:UIBarMetricsDefault];
}

- (void)setupCupCollectionView {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.minimumLineSpacing = 0.0f;
    layout.minimumInteritemSpacing = 0.0f;
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    UINib *cellNib = [UINib nibWithNibName:@"YYDrinkCupCell" bundle:nil];
    [self.cupCollectionView registerNib:cellNib forCellWithReuseIdentifier:@"YYDrinkCupCell"];
    [self.cupCollectionView setCollectionViewLayout:layout];
}

- (void)setupTableView {
    UINib *nib = [UINib nibWithNibName:@"YYDrinkRecordTableCell" bundle:nil];
    [self.todayRecordTableView registerNib:nib forCellReuseIdentifier:@"YYDrinkRecordTableCell"];
    self.todayRecordTableView.tableFooterView = [UIView new];
}

/// 点击collectionViewCell时刷新
- (void)reloadDrinkWhenDidSelectItem:(YYDrinkCupItem *)item {
    self.drinkTotalCapacity = @(self.drinkTotalCapacity.integerValue + item.capacity.integerValue);
    self.drinkAddLabel.text = [NSString stringWithFormat:@"+%@mL", item.capacity];
    [self reloadDrink];
}

/// 刷新喝水量
- (void)reloadDrink {
    [self addDrinkAnimateWithLabel:self.drinkAddLabel];
    self.drinkTotalLabel.attributedText = [self constructDrink:self.drinkTotalCapacity];
}

- (void)addDrinkAnimateWithLabel:(UILabel *)label {
    label.alpha = 0;
    [UIView animateWithDuration:0.5 animations:^{
        label.alpha = 1;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.5 animations:^{
            label.alpha = 0.0f;
        } completion:^(BOOL finished) {
            
        }];
    }];
}

- (void)editItemClick:(UIBarButtonItem *)item {
    self.popView = [YYDrinkEditPopView createViewOnWindowWithType:YYDrinkEditTypeCupsCapacity cupsArr:self.cupTypeArr];
    __weak typeof(self) _weakSelf = self;
    self.popView.sureBlock = ^{
        //TODO: 修改杯型
        [_weakSelf.cupCollectionView reloadData];
    };
}

#pragma mark - <UITableViewDelegate&UITableViewDataSource>
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning test 测试数据
    // FIXME: test
    return 3;// test
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    YYDrinkRecordTableCell *cell = [tableView dequeueReusableCellWithIdentifier:@"YYDrinkRecordTableCell"];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 55.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 44.0f;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), 44)];
    UILabel *todayRecordLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, 200, 44)];
    [headerView addSubview:todayRecordLabel];
    todayRecordLabel.text = @"今日记录";
    todayRecordLabel.font = [UIFont systemFontOfSize:13];
    return headerView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewRowAction *deleteAction = [UITableViewRowAction rowActionWithStyle:(UITableViewRowActionStyleDestructive) title:@"删除" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
       // TODO: 删除喝水记录
    }];
    UITableViewRowAction *editAction = [UITableViewRowAction rowActionWithStyle:(UITableViewRowActionStyleNormal) title:@"编辑" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
       // TODO:编辑
        // 获取模型类型
        YYDrinkCupItem *cupItem = [YYDrinkCupItem createItemWithType:YYDrinkCupItemTypeCoffeeCup capacity:@1000];
        self.popView = [YYDrinkEditPopView createViewOnWindowWithType:YYDrinkEditTypeNormalCupML cupsArr:@[cupItem]];
        self.popView.sureBlock = ^{
            // TODO: 修改喝水容量
        };
        
    }];
    return @[deleteAction, editAction];
}

#pragma mark - UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.cupTypeArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    YYDrinkCupCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"YYDrinkCupCell" forIndexPath:indexPath];
    YYDrinkCupItem *cupItem = self.cupTypeArr[indexPath.row];
    if (indexPath.row == self.cupTypeArr.count-1) {
        cell.decorateView.hidden = YES;
    }
    [cell relayoutSubviewWithModel:cupItem];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(self.cupCollectionView.bounds.size.width/4, self.cupCollectionView.bounds.size.height);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    //TODO: 记录一次喝水
    
    YYDrinkCupItem *selectItem = self.cupTypeArr[indexPath.row];
    
    // 考虑是否应该从后台获取
    [self reloadDrinkWhenDidSelectItem:selectItem];
}

- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)collectionView:(UICollectionView *)collectionView didHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
    YYDrinkCupCell *cell = (YYDrinkCupCell *)[collectionView cellForItemAtIndexPath:indexPath];
    YYDrinkCupItem *model = self.cupTypeArr[indexPath.row];
    [cell layoutSubViewWhenHighlightWithModel:model];
}

- (void)collectionView:(UICollectionView *)collectionView didUnhighlightItemAtIndexPath:(NSIndexPath *)indexPath {
    YYDrinkCupCell *cell = (YYDrinkCupCell *)[collectionView cellForItemAtIndexPath:indexPath];
    YYDrinkCupItem *model = self.cupTypeArr[indexPath.row];
    [cell layoutSubViewWhenUnhighlightWithModel:model];
}


#pragma mark - <>
- (NSAttributedString *)constructDrink:(NSNumber *)drinkNum {
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@mL",drinkNum]];
    NSRange range = [string.string rangeOfString:@"mL"];
    [string addAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:41]} range:NSMakeRange(0, string.length - range.length)];
    [string addAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]} range:range];
    return string;
}

#pragma mark - setter and getter
- (NSArray *)cupTypeArr {/// 测试数据
    if (!_cupTypeArr) {
        YYDrinkCupItem *normalItem = [YYDrinkCupItem createItemWithType:YYDrinkCupItemTypeNormalCup capacity:@350];
        YYDrinkCupItem *mineralWaterItem = [YYDrinkCupItem createItemWithType:YYDrinkCupItemTypeMineralWaterCup capacity:@550];
        YYDrinkCupItem *gobletItem = [YYDrinkCupItem createItemWithType:YYDrinkCupItemTypeGoblet capacity:@180];
        YYDrinkCupItem *coffeeItem = [YYDrinkCupItem createItemWithType:YYDrinkCupItemTypeCoffeeCup capacity:@140];
        _cupTypeArr = @[normalItem, mineralWaterItem, gobletItem, coffeeItem];
    }
    return _cupTypeArr;
}

@end

