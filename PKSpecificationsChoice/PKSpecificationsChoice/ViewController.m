//
//  ViewController.m
//  PKSpecificationsChoice
//
//  Created by pinkjoker on 2020/9/17.
//  Copyright © 2020 PK. All rights reserved.
//

#import "ViewController.h"
#import "PKSpecificationsChoiseView.h"

///制造数据模型
#import "PKSpecificationSectionModal.h"

#define kWidth  [UIScreen mainScreen].bounds.size.width
#define kHeight  [UIScreen mainScreen].bounds.size.height

@interface ViewController ()
{
    UIView *_backView;
}
@property(nonatomic, strong)PKSpecificationsChoiseView *choiseView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

     self.choiseView = [[PKSpecificationsChoiseView alloc]init];
      self.choiseView.frame = CGRectMake(0, kHeight*0.2, kWidth, kHeight*0.8);
    [self.view addSubview:self.choiseView];
    
    
    ///创建数据模型
    PKSpecificationsALLModal *allModal = [[PKSpecificationsALLModal alloc]init];
    allModal.numMax = 12;
    allModal.priceString = @"240元";
    self.choiseView.allModal = allModal;
    NSMutableArray *array= [NSMutableArray array];
for (int i= 0; i<5; i++) {
    PKSpecificationSectionModal *modal = [[PKSpecificationSectionModal alloc]init];
     
        NSMutableArray *array1 = [NSMutableArray array];
    
    for (int j = 0; j<6; j++) {
        PKSpecificationItemModal *modal1 = [[PKSpecificationItemModal alloc]init];
        modal1.itemString = [NSString stringWithFormat:@"item--%d",j];
        modal1.isSelect = @"0";
        modal1.itemValue =[NSString stringWithFormat:@"item--%d",j];
        [array1 addObject:modal1];
    }
    
    modal.sectionTitle = [NSString stringWithFormat:@"section====%d",i];
    modal.sectionKey = [NSString stringWithFormat:@"section====%d",i];
    modal.itemArray = array1;
    [array addObject:modal];
    }
    self.choiseView.sectionArray  = array;

    
}
-(void)touchButton
{
    UIView *backView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kWidth, kHeight)];
    backView.backgroundColor = [UIColor colorWithRed:20/255.0 green:20/255.0 blue:20/255.0 alpha:0.3];
    backView.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(touchBack:)];
    [backView addGestureRecognizer:tap];
    _backView = backView;
    _backView.tag = 100;
    
    self.choiseView = [[PKSpecificationsChoiseView alloc]init];
    self.choiseView.frame = CGRectMake(0, kHeight, kWidth, 0);
//    self.choiseView.backgroundColor = [UIColor whiteColor];
    [_backView addSubview:self.choiseView];
    [self.view bringSubviewToFront:self->_backView];
    [UIView animateWithDuration:0.5 animations:^{
        [self.view addSubview:self->_backView];
         self.choiseView.frame = CGRectMake(0, kHeight*0.3, kWidth, kHeight*0.7);
        
    } completion:^(BOOL finished) {
        
    }];

    
    
    
    
}

-(void)touchBack:(UIGestureRecognizer *)view
{

//        [UIView animateWithDuration:0.5 animations:^{
//            
//            self.choiseView.frame = CGRectMake(0, kHeight, kWidth, 0.7);
//            self->_backView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0];
//        } completion:^(BOOL finished) {
//           
//               [self.choiseView removeFromSuperview];
//            [self->_backView removeFromSuperview];
//         
//        }];
    

    
    
}


@end
