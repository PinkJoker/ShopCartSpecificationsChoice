//
//  PKSpecificationSectionModal.h
//  PKSpecificationsChoice
//
//  Created by pinkjoker on 2020/9/17.
//  Copyright © 2020 PK. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@class PKSpecificationItemModal;
@class PKSpecificationsALLModal;

@interface PKSpecificationSectionModal : NSObject

@property(nonatomic, strong)NSString *sectionKey;
@property(nonatomic, strong)NSString *sectionTitle;
@property(nonatomic, strong)NSArray <NSMutableDictionary *>*selectArray;
@property(nonatomic, strong)NSMutableArray <PKSpecificationItemModal*>*itemArray;

@end

@interface PKSpecificationItemModal : NSObject

//@property
@property(nonatomic, copy)NSString *itemString;
@property(nonatomic, strong) NSString  *isSelect;
@property(nonatomic, copy)NSString *itemValue;
///是否有货 可选
@property(nonatomic, copy)NSString *isHave;
@end


@interface PKSpecificationsALLModal : NSObject
///商品图
@property(nonatomic, strong)NSString *iconSting;
@property(nonatomic, strong)NSString *numString;
///库存数量
@property(nonatomic, assign)NSInteger numMax;
///商品名称
@property(nonatomic, copy)NSString *nameString;
///商品基础价格
@property(nonatomic, copy)NSString *priceString;

///分区模型
@property(nonatomic, strong)NSArray <PKSpecificationSectionModal*>*sectionArray;

@end



NS_ASSUME_NONNULL_END
