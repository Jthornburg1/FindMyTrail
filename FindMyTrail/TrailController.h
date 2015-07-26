//
//  TrailController.h
//  FindMyTrail
//
//  Created by jonathan thornburg on 7/21/15.
//  Copyright (c) 2015 jonathan thornburg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Trail.h"


@interface TrailController : NSObject

- (void)trailByCity:(NSString *)city completion:(void (^)(NSArray * trails))completion; 

@end
