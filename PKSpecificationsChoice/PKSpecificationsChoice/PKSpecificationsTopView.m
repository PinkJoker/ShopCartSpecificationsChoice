//
//  PKSpecificationsTopView.m
//  PKSpecificationsChoice
//
//  Created by pinkjoker on 2020/9/17.
//  Copyright © 2020 PK. All rights reserved.
//

#import "PKSpecificationsTopView.h"

#define kWidth  [UIScreen mainScreen].bounds.size.width
#define kHeight  [UIScreen mainScreen].bounds.size.height
@implementation PKSpecificationsTopView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self creatView];
    }
    return self;
}

-(void)creatView{
    _iconImage = [[UIImageView alloc]initWithFrame:CGRectMake(20, 20,self.frame.size.height-40, self.frame.size.height-40)];
    _iconImage.backgroundColor = [UIColor yellowColor];
    [self addSubview:_iconImage];
    _priceLabel = [[UILabel alloc]initWithFrame:CGRectMake(_iconImage.frame.size.width+20+30, 30, kWidth*0.25, 30)];
    _priceLabel.text  = @"请选择";
    [self addSubview:_priceLabel];
    _repertoryLabel = [[UILabel alloc]initWithFrame:CGRectMake(_iconImage.frame.size.width+20+20, 30+30+10, kWidth*0.4, 30)];
    _repertoryLabel.text = @"库存XX件";
    [self addSubview:_repertoryLabel];

}

-(void)setIconImage:(UIImageView *)iconImage
{

}

-(void)setPriceLabel:(UILabel *)priceLabel
{

}

-(void)setRepertoryLabel:(UILabel *)repertoryLabel
{


}



@end
