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
    self.activityLabel.text = [NSString stringWithFormat:@"%@ is most commonly used for %@", self.trail.name, self.trail.activities];
}

- (void)updateWithTrail:(Trail *)trail
{
    if (self.trail.described == (id)[NSNull null]) {
        self.textView2.text = @"Sorry, no description available for this trail";
        self.textView1.text = @"";
    }else{
        self.textView1.text = [NSString stringWithFormat:@"Description of %@:", self.trail.name];
        self.textView2.text = self.trail.described;
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
