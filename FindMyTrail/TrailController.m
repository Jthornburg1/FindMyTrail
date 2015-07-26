//
//  TrailController.m
//  FindMyTrail
//
//  Created by jonathan thornburg on 7/21/15.
//  Copyright (c) 2015 jonathan thornburg. All rights reserved.
//

#import "TrailController.h"

@implementation TrailController

- (void)trailByCity:(NSString *)city completion:(void (^)(NSArray *))completion
{
    city = [city stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://outdoor-data-api.herokuapp.com/api.json?api_key=d6d33ee90666c461d901c731cc104b79&q[city_cont]=%@", city]];
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSArray *trails = [[NSJSONSerialization JSONObjectWithData:data options:0 error:nil] objectForKey:@"places"];
        
        NSLog(@"%@", error);
        
        NSMutableArray *convertedTrails = [NSMutableArray new];
        
        NSLog(@"%@", trails);
        
        for (NSDictionary *dictionary in trails) {
            Trail *trail = [[Trail alloc] initWithDictionary:dictionary];
            
            [convertedTrails addObject:trail];
        }
        
        completion(convertedTrails);
        
    }];
    
    [task resume];
}

@end
