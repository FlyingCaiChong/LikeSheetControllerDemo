//
//  YYModeSelectPopController.m
//  优越指数部分
//
//  Created by fangheng on 2017/8/25.
//  Copyright © 2017年 fangheng. All rights reserved.
//

#import "YYMoodSelectPopController.h"
#import "YYMoodSelectCell.h"
#import "YYSleepTimeTransitionDelegateObj.h"
#import "YYMoodModel.h"

@interface YYMoodSelectPopController ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

/// 转场动画效果与睡眠设置时间的转场动画效果类似
@property (nonatomic, strong) YYSleepTimeTransitionDelegateObj *transitionDelegateObj;

@property (nonatomic, copy) NSArray *moodAllTypes;

@end

@implementation YYMoodSelectPopController

+ (instancetype)createSelectPopController {
    YYMoodSelectPopController *pop = [[YYMoodSelectPopController alloc] init];
    pop.transitioningDelegate = pop.transitionDelegateObj;
    pop.modalPresentationStyle = UIModalPresentationCustom;
    return pop;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupCollectionView];
}

- (void)setupCollectionView {
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(self.view.bounds.size.width/5, 126);
    layout.minimumLineSpacing = 0.0f;
    layout.minimumInteritemSpacing = 0.0f;
    
    UINib *cellNib = [UINib nibWithNibName:@"YYMoodSelectCell" bundle:nil];
    [self.collectionView registerNib:cellNib forCellWithReuseIdentifier:@"YYMoodSelectCell"];
    [self.collectionView setCollectionViewLayout:layout];
}

#pragma mark - <UICollectionViewDelegate, UICollectionViewDataSource>
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.moodAllTypes.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    YYMoodSelectCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"YYMoodSelectCell" forIndexPath:indexPath];
    YYMoodModel *model = self.moodAllTypes[indexPath.row];
    [cell relayoutSubviewWithModel:model];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath  {
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    if (self.selectMood) {
        YYMoodModel *model = self.moodAllTypes[indexPath.row];
        model.time = [NSDate date];
        self.selectMood(model);
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(self.view.bounds.size.width/5.0, 126.0);
}

- (IBAction)tapMaskView:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (YYSleepTimeTransitionDelegateObj *)transitionDelegateObj {
    if (!_transitionDelegateObj) {
        _transitionDelegateObj = [[YYSleepTimeTransitionDelegateObj alloc] init];
    }
    return _transitionDelegateObj;
}

- (NSArray *)moodAllTypes {
    if (!_moodAllTypes) {
        YYMoodModel *excitedModel = [YYMoodModel createModelWithType:MoodTypeExcited];
        YYMoodModel *happyModel = [YYMoodModel createModelWithType:MoodTypeHappy];
        YYMoodModel *peaceModel = [YYMoodModel createModelWithType:MoodTypePeace];
        YYMoodModel *sadModel = [YYMoodModel createModelWithType:MoodTypeSad];
        YYMoodModel *angerModel = [YYMoodModel createModelWithType:MoodTypeAnger];
        _moodAllTypes = @[excitedModel, happyModel, peaceModel, sadModel, angerModel];
    }
    return _moodAllTypes;
}

@end
