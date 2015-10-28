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
    city = [city stringByReplacingOccurrencesOfString:@" " withString:@"+"];
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://outdoor-data-api.herokuapp.com/api.json?api_key=d6d33ee90666c461d901c731cc104b79&q[city_cont]=%@", city]];
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSArray *trails = [[NSJSONSerialization JSONObjectWithData:data options:0 error:nil] objectForKey:@"places"];
        
        //NSLog(@"%@", error);
        
        NSMutableArray *convertedTrails = [NSMutableArray new];
        
        //NSLog(@"%@", trails[2][@"activities"][0][@"activity_type_name"]);
        //NSLog(@"%@", trails[2][@"activities"][0][@"thumbnail"]);
        
        for (NSDictionary *dictionary in trails) {
            int i = 0;
            
            Trail *trail = [[Trail alloc] initWithDictionary:dictionary];
            if (trails[i][@"activities"][0] == (id)[NSNull null]) {
                trail.activities = @": none specified";
            }else{
                trail.activities = trails[i][@"activities"][0][@"activity_type_name"];
            }
            trail.thumbnail = trails[i][@"activities"][0][@"thumbnail"];
            [convertedTrails addObject:trail];
            i++;
        }
        
        completion(convertedTrails);
        
    }];
    
    [task resume];
}

@end
