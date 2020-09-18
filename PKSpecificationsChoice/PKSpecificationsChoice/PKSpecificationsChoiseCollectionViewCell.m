//
//  PKSpecificationsChoiseCollectionViewCell.m
//  PKSpecificationsChoice
//
//  Created by pinkjoker on 2020/9/17.
//  Copyright © 2020 PK. All rights reserved.
//

#import "PKSpecificationsChoiseCollectionViewCell.h"

@implementation PKSpecificationsChoiseCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    UIView *selectedBackgroundView = [[UIView alloc] init];
     selectedBackgroundView.backgroundColor = [UIColor redColor];
     self.selectedBackgroundView = selectedBackgroundView;
     self.backgroundColor = [UIColor lightGrayColor];
}

-(void)setIsSelect:(NSString *)isSelect
{
    _isSelect = isSelect;
//    self.selected
    if ([_isSelect isEqualToString:@"1"]) {
        self.selected = YES;
    }else{
        self.selected = NO;
    }
    
}

@end
