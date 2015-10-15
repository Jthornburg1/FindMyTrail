//
//  DetailViewController.m
//  FindMyTrail
//
//  Created by jonathan thornburg on 7/21/15.
//  Copyright (c) 2015 jonathan thornburg. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UITextView *textView1;
@property (weak, nonatomic) IBOutlet UITextView *textView2;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self updateWithTrail:self.trail];
    NSLog(@"coordinates of %@ are %f latitude and %f longitude.", self.trail, [self.trail.latitude doubleValue], [self.trail.longitude doubleValue]);
}

- (void)updateWithTrail:(Trail *)trail
{
    if (self.trail.directions == (id)[NSNull null]) {
        self.textView2.text = @"Sorry, no directions available for this trail";
        self.textView1.text = @"";
    }else{
        self.textView1.text = [NSString stringWithFormat:@"Directions to %@:", self.trail.name];
        self.textView2.text = self.trail.directions;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
