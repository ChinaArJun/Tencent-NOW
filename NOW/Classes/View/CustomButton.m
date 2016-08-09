//
//  CustomButton.m
//  NOW
//
//  Created by ArJun on 16/8/9.
//  Copyright © 2016年 ArJun. All rights reserved.
//

#import "CustomButton.h"

@implementation CustomButton

- (instancetype)init{
    if (self = [super init]) {
        self.layer.cornerRadius = 25;
        self.layer.masksToBounds = YES;
    }
    return self;
}

- (void)setHighlighted:(BOOL)highlighted{
    
}

@end
