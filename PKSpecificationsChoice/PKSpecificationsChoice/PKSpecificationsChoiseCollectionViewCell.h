//
//  PKSpecificationsChoiseCollectionViewCell.h
//  PKSpecificationsChoice
//
//  Created by pinkjoker on 2020/9/17.
//  Copyright © 2020 PK. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PKSpecificationsChoiseCollectionViewCell : UICollectionViewCell
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property(nonatomic, copy)NSString * isSelect;

@end

NS_ASSUME_NONNULL_END
