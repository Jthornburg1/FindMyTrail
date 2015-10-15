//
//  Trail.m
//  FindMyTrail
//
//  Created by jonathan thornburg on 7/21/15.
//  Copyright (c) 2015 jonathan thornburg. All rights reserved.
//

#import "Trail.h"

@implementation Trail

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        self.latitude = dict[@"lat"];
        self.longitude = dict[@"lon"];
        self.name = dict[@"name"];
        self.city = dict[@"city"];
        self.state = dict[@"state"];
        self.country = dict[@"country"];
        self.described = dict[@"description"];
        self.directions = dict[@"directions"];
        self.activities = dict[@"activity_type_name"];

    }
    return self;
}


@end
