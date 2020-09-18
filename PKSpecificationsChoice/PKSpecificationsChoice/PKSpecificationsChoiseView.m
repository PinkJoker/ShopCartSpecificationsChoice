//
//  PKSpecificationsChoiseView.m
//  PKSpecificationsChoice
//
//  Created by pinkjoker on 2020/9/17.
//  Copyright © 2020 PK. All rights reserved.
//

#import "PKSpecificationsChoiseView.h"
#import "PKSpecificationsChoiseCollectionViewCell.h"
#import "NSString+PKString.h"
//header
#import "PKSpecificationsReusableView.h"

///数据模型
#import "PKSpecificationSectionModal.h"
//顶部图片View
#import "PKSpecificationsTopView.h"
//数量加减
#import "PPNumberButton.h"

#define kWidth  [UIScreen mainScreen].bounds.size.width
#define kHeight  [UIScreen mainScreen].bounds.size.height

@interface PKSpecificationsChoiseView ()<PPNumberButtonDelegate>
{
    NSInteger _numMax;
    NSInteger _kucunMax;
}
//用于储存选择的数据
@property(nonatomic, strong)NSMutableDictionary *selectDic;
//顶部View
@property(nonatomic, strong)PKSpecificationsTopView *topView;

//加入购物车
@property(nonatomic, strong)UIButton *cartButton;
//立即购买
@property(nonatomic, strong)UIButton *buyButton;

///数量加减
@property(nonatomic, strong)PPNumberButton *numberButton;

//数量最大值
//@property(nonatomic, assign)NSi

@end


@implementation PKSpecificationsChoiseView
{
    UICollectionView* _collectionview;
}



- (instancetype)init
{
    self = [super init];
    if (self) {
        //创建集合试图
        [self creatView];
        //创建顶部试图
        [self creatTopView];
        //创建底部加减以及加入购物车
        [self creatBottomView];
        
    }
    return self;
}
-(void)creatTopView{
    self.topView = [[PKSpecificationsTopView alloc]initWithFrame:CGRectMake(0, 0, kWidth, 120)];
    self.topView.backgroundColor = [UIColor magentaColor];
    [self addSubview:self.topView];
}
-(void)creatBottomView{
    
    _numberButton = [PPNumberButton numberButtonWithFrame:CGRectMake( kWidth-120,kHeight*0.7-70, 100, 30)];
        // 开启抖动动画
    _numberButton.shakeAnimation = YES;
    // 设置最小值
        _numberButton.minValue = 1;
        // 设置输入框中的字体大小
        _numberButton.inputFieldFont = 23;
        _numberButton.increaseTitle = @"＋";
        _numberButton.decreaseTitle = @"－";
        _numberButton.currentNumber = 1;
        _numberButton.delegate = self;
        _numberButton.longPressSpaceTime = CGFLOAT_MAX;
    _numberButton.backgroundColor = [UIColor greenColor];
        _numberButton.resultBlock = ^(PPNumberButton *ppBtn, CGFloat number, BOOL increaseStatus){
            NSLog(@"%f",number);
        };
        [self addSubview:_numberButton];
    
    self.cartButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.cartButton setTitle:@"加入购物车" forState:UIControlStateNormal];
    [self addSubview:self.cartButton];
    self.buyButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.buyButton setTitle:@"立即购买" forState:UIControlStateNormal];
    [self addSubview:self.buyButton];
    [self.cartButton addTarget:self action:@selector(touchCartButton) forControlEvents:UIControlEventTouchUpInside];
    [self.buyButton addTarget:self action:@selector(touchBuyButton) forControlEvents:UIControlEventTouchUpInside];
    self.cartButton.frame = CGRectMake(kWidth-240, kHeight*0.7-30, 100, 40);
    self.cartButton.backgroundColor = [UIColor redColor];
    self.buyButton.frame  = CGRectMake(kWidth-120, kHeight*0.7-30, 100, 40);
    self.buyButton.backgroundColor = [UIColor cyanColor];
    
    
    
}

-(void)creatView{
    //初始化布局
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc] init];
     layout.scrollDirection=UICollectionViewScrollDirectionVertical;//竖直滚动
        layout.minimumInteritemSpacing=5;//itme左右间距
        layout.minimumLineSpacing=10;//itme 上下间距
    //section 距上下左右的距离
        layout.sectionInset=UIEdgeInsetsMake(10, 20, 20, 20);
    //头部的size
        layout.headerReferenceSize = CGSizeMake(kWidth, 40);
    _collectionview = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 120, kWidth, kHeight*0.7-200) collectionViewLayout:layout];
    _collectionview.backgroundColor = [UIColor yellowColor];
    self.backgroundColor = [UIColor grayColor];
    [self addSubview:_collectionview];
        _collectionview.dataSource=self;
        _collectionview.delegate=self;
        //支持分页
//        _collectionview.pagingEnabled=NO;
//        _collectionview.scrollEnabled=NO;
        //注册cell
    [_collectionview registerNib:[UINib nibWithNibName:@"PKSpecificationsChoiseCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"PKSpecificationsChoiseCollectionViewCell"];
        //注册组头
    [_collectionview registerNib:[UINib nibWithNibName:@"PKSpecificationsReusableView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"PKSpecificationsReusableView"];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
             return self.sectionArray.count;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
//    self.parammodel=self.contentarry[section];
//    return self.parammodel.attr_values.count;
    PKSpecificationSectionModal *secModal = self.sectionArray[section];
    return secModal.itemArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
   PKSpecificationsChoiseCollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"PKSpecificationsChoiseCollectionViewCell" forIndexPath:indexPath];
    PKSpecificationSectionModal *secModal = self.sectionArray[indexPath.section];
       PKSpecificationItemModal *modal = secModal.itemArray[indexPath.row];
    cell.titleLabel.text = modal.itemString;
    
    if ([modal.isSelect isEqualToString:@"1"]) {
        cell.isSelect = modal.isSelect;
    }else{
        cell.isSelect = @"0";
    }
    
    
   
   return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    PKSpecificationSectionModal *secModal = self.sectionArray[indexPath.section];
    PKSpecificationItemModal *modal = secModal.itemArray[indexPath.row];
  
        CGSize size = [NSString sizeWithText:modal.itemString font:[UIFont systemFontOfSize:20] maxW:kWidth - 30];
        return  size;
    

}


-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
//    NSLog(@"选中%@",indexPath);
    if (indexPath.section == self.sectionArray.count) {
        return;
    }
    PKSpecificationSectionModal *secModal = self.sectionArray[indexPath.section];
    PKSpecificationItemModal *modal = secModal.itemArray[indexPath.row];
//        //如果选择的是已经选择的 则取消选择
//    //     PKSpecificationSectionModal *sec = [self.sectionArray objectAtIndex:indexPath.section];
//            for (int j = 0; j<secModal.itemArray.count; j++) {
//                     PKSpecificationItemModal *itemModal = [secModal.itemArray objectAtIndex:j];
//                        if (j == indexPath.row) {
//                            if ([itemModal.isSelect isEqualToString:@"1"]) {
//                                itemModal.isSelect = @"0";
//                            }
//                        }else{
//
//
//                        }
//        }
//

    
    [self.selectDic setObject:modal forKey:secModal.sectionKey];
    
    ///取出所有key
    NSArray *keyArr =  [self.selectDic allKeys];
    if (self.sectionArray.count == keyArr.count) {
        NSLog(@"=======%@",self.sectionArray);
        ///如果相等则 全部选择了
          NSMutableString *seleSpec = [NSMutableString stringWithString:@"已选择"];
        ///便利选择的类目
        for (int i=0; i<keyArr.count; i++) {
                   [seleSpec appendString:[NSString stringWithFormat:@" %@",[self.selectDic objectForKey:keyArr[i]]]];
               }
        //显示选择类目
        
        
        //
        
        
        
        
    }else{
        
        ///如果 没有类目没有选择全
        NSMutableString *spec = [NSMutableString stringWithString:@"请选择"];
        for (PKSpecificationSectionModal *model in self.sectionArray) {
            ///便利数组获取没有选择的类目
            for (NSString *key in keyArr) {
                if ([model.sectionKey isEqualToString:key]) {
//                    NSLog(@"已选择");
                    
                    
                }else{
                    [spec appendString:[NSString stringWithFormat:@" %@",model.sectionKey]];
                }
            }
        }
        ///赋值给显示的文本  请选择...
        
    }
    ///便利刷新状态
            PKSpecificationSectionModal *sec = [self.sectionArray objectAtIndex:indexPath.section];
            for (int j = 0; j<sec.itemArray.count; j++) {
                     PKSpecificationItemModal *itemModal = [sec.itemArray objectAtIndex:j];
                        if (j == indexPath.row) {
                            itemModal.isSelect = @"1";
                        }else{
                            itemModal.isSelect = @"0";
                        }
                        NSLog(@"%@",itemModal.isSelect);
        }
    

    
    
    
    
    
    
    
    [_collectionview reloadData];

}
///点击加入购物车
-(void)touchCartButton
{
  NSArray *keyArray =  [self.selectDic allKeys];
    if (keyArray.count != self.sectionArray.count) {
        return;
    }
    for (int i = 0; i<keyArray.count; i++) {
        [self.selectDic objectForKey:keyArray[i]];
        NSLog(@"选择的数据是%@===%@",[self.selectDic objectForKey:keyArray[i]],keyArray[i]);
    }
}

//立即购买
-(void)touchBuyButton
{
    NSArray *keyArray =  [self.selectDic allKeys];
      if (keyArray.count != self.sectionArray.count) {
          return;
      }
      for (int i = 0; i<keyArray.count; i++) {
          [self.selectDic objectForKey:keyArray[i]];
          NSLog(@"选择的数据是%@===%@",[self.selectDic objectForKey:keyArray[i]],keyArray[i]);
      }
    
    
    
}







-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    // 视图添加到 UICollectionReusableView 创建的对象中

        PKSpecificationsReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"PKSpecificationsReusableView" forIndexPath:indexPath];
    PKSpecificationSectionModal *secModal = self.sectionArray[indexPath.section];
    headerView.titleLabel.text = secModal.sectionTitle;
    headerView.backgroundColor = [UIColor whiteColor];
        return headerView;

}

-(void)setAllModal:(PKSpecificationsALLModal *)allModal
{
    _allModal = allModal;
    [self.topView.iconImage setImage:[UIImage imageNamed:_allModal.iconSting]];
    self.topView.priceLabel.text = _allModal.priceString;
    self.topView.repertoryLabel.text = [NSString stringWithFormat:@"库存%ld件",(long)_allModal.numMax];


    // 设置最大值
    _numberButton.maxValue = _allModal.numMax;
    
}






-(NSArray *)sectionArray
{
    if (!_sectionArray) {
        _sectionArray = [NSArray array];
    }
    return _sectionArray;
}
//-(NSArray *)itemArray
//{
//    if (!_itemArray) {
//        _itemArray = [NSArray array];
//    }
//    return _itemArray;
//}
-(NSMutableDictionary *)selectDic
{
    if (!_selectDic) {
        _selectDic = [NSMutableDictionary dictionary];
    }
    return _selectDic;
}


@end
