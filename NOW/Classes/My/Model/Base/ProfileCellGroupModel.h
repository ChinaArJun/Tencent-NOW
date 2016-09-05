//
//  ProfileCellGroupModel.h
//  NOW
//
//  Created by ArJun on 16/8/31.
//  Copyright © 2016年 ArJun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ProfileCellModel.h"

@interface ProfileCellGroupModel : NSObject

@property (nonatomic, strong) NSArray *cells;
@property (nonatomic, copy) NSString *headerTitle;
@property (nonatomic, copy) NSString *footerTitle;
- (instancetype)initWithCells:(NSArray *)cells;
@end
