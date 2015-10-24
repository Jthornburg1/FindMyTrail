//
//  TrailCell.h
//  FindMyTrail
//
//  Created by jonathan thornburg on 9/12/15.
//  Copyright (c) 2015 jonathan thornburg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Trail.h"
#import "TrailController.h"

@interface TrailCell : UITableViewCell<UIAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *trailNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *cityLabel;
@property (weak, nonatomic) IBOutlet UIImageView *cellImage;
@property (strong, nonatomic) Trail *trail;


@end
