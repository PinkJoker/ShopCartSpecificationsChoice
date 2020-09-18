//
//  NSString+PKString.h
//  PKSpecificationsChoice
//
//  Created by pinkjoker on 2020/9/17.
//  Copyright © 2020 PK. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface NSString (PKString)

+ (CGSize)sizeWithText:(NSString *)text font:(UIFont *)font maxW:(CGFloat)maxW;

@end

NS_ASSUME_NONNULL_END
