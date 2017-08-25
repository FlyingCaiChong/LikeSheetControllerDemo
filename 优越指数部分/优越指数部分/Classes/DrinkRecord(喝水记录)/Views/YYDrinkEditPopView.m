//
//  YYDrinkEditPopView.m
//  优越指数部分
//
//  Created by fangheng on 2017/8/21.
//  Copyright © 2017年 fangheng. All rights reserved.
//

#import "YYDrinkEditPopView.h"
#import "YYDrinkCupItem.h"
#import "YYDrinkEditCell.h"

@interface YYDrinkEditPopView()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UIView *popView;
@property (weak, nonatomic) IBOutlet UILabel *editTitleLabel;
@property (weak, nonatomic) IBOutlet UIView *topEditView;

@property (weak, nonatomic) IBOutlet UILabel *selectTypeLabel;
@property (weak, nonatomic) IBOutlet UITextField *editTextField;
@property (nonatomic, strong) UIView *maskView;

@property (nonatomic, assign) YYDrinkEditType type;

@property (nonatomic, strong) NSArray *cupsArr;

@property (nonatomic, strong) UICollectionView *drinkEditCollectionView;
@property (nonatomic, strong) YYDrinkCupItem *lastEditSelectItem;

@end

@implementation YYDrinkEditPopView

+ (instancetype)createViewOnWindowWithType:(YYDrinkEditType)type cupsArr:(NSArray *)cupsArr {
    UINib *nib = [UINib nibWithNibName:@"YYDrinkEditPopView" bundle:nil];
    YYDrinkEditPopView *popView = [nib instantiateWithOwner:nil options:nil].firstObject;
    popView.cupsArr = cupsArr;
    // 默认第一个选中
    if (popView.cupsArr.count > 0) {
        popView.lastEditSelectItem = popView.cupsArr.firstObject;
        popView.lastEditSelectItem.editSelect = YES;
    }
    popView.type = type;
    [popView.editTextField becomeFirstResponder];
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [window addSubview:popView];
    return popView;
}

- (void)dismiss {
    self.lastEditSelectItem.editSelect = NO;
    [self.editTextField resignFirstResponder];
    [UIView animateWithDuration:0.5 animations:^{
        self.alpha = 0.0f;
    } completion:^(BOOL finished) {
         [self removeFromSuperview];
    }];
}
/// 添加遮罩层
- (void)addMaskView:(CGRect)frame {
    self.maskView = [[UIView alloc] initWithFrame:frame];
    [self.maskView setBackgroundColor:[UIColor colorWithRed:21/255.0 green:24/255.0 blue:40/255.0 alpha:0.6]];
    UITapGestureRecognizer *maskTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(maskTapTouch:)];
    [self.maskView addGestureRecognizer:maskTap];
    [self addSubview:self.maskView];
    [self sendSubviewToBack:self.maskView];
}

- (void)maskTapTouch:(UITapGestureRecognizer *)gesture {
    [self dismiss];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    self.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    [self addMaskView:self.frame];
    [self layoutIfNeeded];
}


- (void)setType:(YYDrinkEditType)type {
    _type = type;
    [self configViewWithType:type];
}


- (void)configViewWithType:(YYDrinkEditType)type {
    [self configTopEditViewWithType:type];
    if (type == YYDrinkEditTypeCupsCapacity) {
        self.editTitleLabel.text = @"设置杯型容量";
        self.selectTypeLabel.text = @"普通杯型";//test
    } else {
        self.editTitleLabel.text = @"编辑";
        self.selectTypeLabel.text = @"上午 10:00";//test
    }
}

- (void)configTopEditViewWithType:(YYDrinkEditType)type {
    if (type == YYDrinkEditTypeCupsCapacity) {
        [self setupAllCupsInTopEditView];
    } else {
        [self setupSingleCupInTopEditView];
    }
}

- (void)setupSingleCupInTopEditView {
   
    CGFloat labelY = self.topEditView.bounds.size.height * (1 - 20.0/240 - 40.0/240);
    CGFloat labelH = self.topEditView.bounds.size.height * (40.0/240);
    
    CGFloat imageViewY = self.topEditView.bounds.size.height * (20.0/240);
    CGFloat imageViewH = labelY-imageViewY-self.topEditView.bounds.size.height * (10.0/240);
    CGFloat imageViewW = imageViewH;
    CGFloat imageViewX = self.topEditView.bounds.size.width/2-imageViewW/2;
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(imageViewX, imageViewY, imageViewW, imageViewH)];
    UIImage *image = nil;
    
   
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, labelY, self.topEditView.bounds.size.width, labelH)];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:15];
    switch (self.type) {
        case YYDrinkEditTypeNormalCupML:
        {
            image = [UIImage imageNamed:@"beixingshezhi_putongbeixing_shezhi"];
            label.text = @"普通杯型";
        }
            break;
        case YYDrinkEditTypeMineralWaterCupML:
        {
            image = [UIImage imageNamed:@"beixingshezhi_kuangquanshu_shezhii"];
            label.text = @"矿泉水类";
        }
            break;
        case YYDrinkEditTypeGobletML:
        {
            image = [UIImage imageNamed:@"beixingshezhi_gaojiaobe_shezhi"];
            label.text = @"高脚杯类";
        }
            break;
        case YYDrinkEditTypeCoffeeCupML:
        {
            image = [UIImage imageNamed:@"beixingshezhi_kafeibe_shezhii"];
            label.text = @"咖啡杯类";
        }
            break;
            
        default:
            break;
    }
    imageView.image = image;
    [self.topEditView addSubview:imageView];
    [self.topEditView addSubview:label];
}

- (void)setupAllCupsInTopEditView {
    [self.topEditView addSubview:self.drinkEditCollectionView];
}

- (IBAction)sureBtnTouched:(UIButton *)sender {
    if ([self.editTextField.text isEqualToString:@""] || [self.editTextField.text length]==0){ // 文本框没有输入
        [self dismiss];
    } else {;
        self.lastEditSelectItem.capacity = [NSNumber numberWithInteger:self.editTextField.text.integerValue];
        [self dismiss];
        if (self.sureBlock) {
            self.sureBlock();
        }
    }
}

#pragma UICollectionViewDelegate & UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.cupsArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    YYDrinkEditCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"YYDrinkEditCell" forIndexPath:indexPath];
    YYDrinkCupItem *cupItem = self.cupsArr[indexPath.row];
    [cell layoutWithModel:cupItem select:cupItem.editSelect];
    [self reloadTypeLabelAndTextFieldWithCupItem:cupItem select:cupItem.editSelect];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    self.lastEditSelectItem.editSelect = NO;
    YYDrinkCupItem *cupItem = self.cupsArr[indexPath.row];
    cupItem.editSelect = YES;
    self.lastEditSelectItem = cupItem;
    [collectionView reloadData];
}

- (void)reloadTypeLabelAndTextFieldWithCupItem:(YYDrinkCupItem *)item select:(BOOL)select {
    if (select) {
        self.selectTypeLabel.text = item.typeName;
        self.editTextField.placeholder = [NSString stringWithFormat:@"%@mL", item.capacity];
    }
}

- (UICollectionView *)drinkEditCollectionView {
    if (!_drinkEditCollectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.itemSize = CGSizeMake(self.topEditView.bounds.size.width/4, self.topEditView.bounds.size.height);
        layout.minimumLineSpacing = 0.0f;
        layout.minimumInteritemSpacing = 0.0f;
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _drinkEditCollectionView = [[UICollectionView alloc] initWithFrame:self.topEditView.bounds collectionViewLayout:layout];
        _drinkEditCollectionView.delegate = self;
        _drinkEditCollectionView.dataSource = self;
        _drinkEditCollectionView.backgroundColor = [UIColor whiteColor];
        UINib *nib = [UINib nibWithNibName:@"YYDrinkEditCell" bundle:nil];
        [_drinkEditCollectionView registerNib:nib forCellWithReuseIdentifier:@"YYDrinkEditCell"];
    }
    return _drinkEditCollectionView;
}

@end
