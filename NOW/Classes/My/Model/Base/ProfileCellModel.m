//
//  ProfileCellModel.m
//  NOW
//
//  Created by ArJun on 16/8/31.
//  Copyright © 2016年 ArJun. All rights reserved.
//

#import "ProfileCellModel.h"

@implementation ProfileCellModel
- (instancetype)initWithTitle:(NSString *)title icon:(NSString *)icon
{
    if (self = [super init]) {
        self.title = title;
        self.icon = icon;
    }
    return self;
}

@end
