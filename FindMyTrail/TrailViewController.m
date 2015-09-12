//
//  ViewController.m
//  FindMyTrail
//
//  Created by jonathan thornburg on 7/21/15.
//  Copyright (c) 2015 jonathan thornburg. All rights reserved.
//

#import "TrailViewController.h"
#import "TrailController.h"
#import "DetailViewController.h"

@interface TrailViewController ()<UITableViewDataSource, UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *cityText;
@property (strong, nonatomic) NSArray *trails;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) TrailController *trailController;

@end

@implementation TrailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    NSIndexPath *selected = [self.tableView indexPathForSelectedRow];
    if (selected) {
        [self.tableView deselectRowAtIndexPath:selected animated:YES];
    }
}

- (IBAction)clearButtonTapped:(id)sender {
    self.cityText.text = @"";
}

#pragma mark - data retrieval

- (void)loadTrails:(NSString *)string
{
    self.trailController = [TrailController new];
    [self.trailController trailByCity:string completion:^(NSArray *trails) {
        self.trails = trails;
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
    }];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self loadTrails:textField.text];
    [self.cityText resignFirstResponder];
    
    return YES;
}

#pragma mark - TableView DataSource methods

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"trailCell"];
    
    Trail *trail = self.trails[indexPath.row];
    
    cell.textLabel.text = trail.name;
    
    if (trail.state == (id)[NSNull null]) {
        cell.detailTextLabel.text = @"N/A";
    }else{
        cell.detailTextLabel.text = trail.state;

    }
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.trails.count;
}

#pragma mark - segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier  isEqual: @"pushDirections"]) {
        DetailViewController *viewController = [segue destinationViewController];
        NSIndexPath *path = [self.tableView indexPathForCell:sender];
        
        Trail *trail = self.trails[path.row];
        viewController.trail = trail;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
