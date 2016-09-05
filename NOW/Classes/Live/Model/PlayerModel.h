//
//  PlayerModel.h
//  NOW
//
//  Created by ArJun on 16/8/7.
//  Copyright © 2016年 ArJun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PlayerModel : NSObject

@property (nonatomic, strong)NSString * ID;

@property (nonatomic, strong)NSString * city;

@property (nonatomic, strong)NSString * name;

@property (nonatomic, strong)NSString * portrait;

@property (nonatomic, assign)int  online_users;

@property (nonatomic, strong)NSString * url;

- (id)initWithDictionary:(NSDictionary *)dic;

@end
