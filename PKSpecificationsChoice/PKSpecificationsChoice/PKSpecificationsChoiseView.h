//
//  PKSpecificationsChoiseView.h
//  PKSpecificationsChoice
//
//  Created by pinkjoker on 2020/9/17.
//  Copyright © 2020 PK. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PKSpecificationSectionModal;
@class PKSpecificationsALLModal;
NS_ASSUME_NONNULL_BEGIN

@interface PKSpecificationsChoiseView : UIView<UICollectionViewDelegate,UICollectionViewDataSource>
///分区模型数组
@property(nonatomic, copy)NSArray *sectionArray;
///item 模型数组
//@property(nonatomic, copy)NSArray *itemArray;


@property(nonatomic, strong)PKSpecificationsALLModal *allModal;
@end

NS_ASSUME_NONNULL_END
