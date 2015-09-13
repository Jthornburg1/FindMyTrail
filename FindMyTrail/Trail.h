//
//  Trail.h
//  FindMyTrail
//
//  Created by jonathan thornburg on 7/21/15.
//  Copyright (c) 2015 jonathan thornburg. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Trail : NSObject

@property (nonatomic, assign) NSNumber *latitude;
@property (nonatomic, assign) NSNumber *longitude;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *city;
@property (strong, nonatomic) NSString *state;
@property (strong, nonatomic) NSString *country;
@property (strong, nonatomic) NSString *described;
@property (strong, nonatomic) NSString *directions;
@property (strong, nonatomic) NSString *activities;
- (instancetype)initWithDictionary:(NSDictionary *)dict;

@end
