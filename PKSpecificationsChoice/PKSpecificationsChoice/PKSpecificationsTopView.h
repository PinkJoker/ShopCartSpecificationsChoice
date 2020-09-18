//
//  PKSpecificationsTopView.h
//  PKSpecificationsChoice
//
//  Created by pinkjoker on 2020/9/17.
//  Copyright © 2020 PK. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PKSpecificationsTopView : UIView
//图片
@property(nonatomic, strong)UIImageView *iconImage;
//价格
@property(nonatomic, strong)UILabel *priceLabel;
//库存
@property(nonatomic, strong)UILabel *repertoryLabel;
//关闭
@property(nonatomic, strong)UIButton *closeButton;


@end

NS_ASSUME_NONNULL_END
