//
//  SudoThingViewController.m
//  SudoThing
//
//  Created by Romy on 8/19/15.
//  Copyright (c) 2015 Romy. All rights reserved.
//

#import "SudoThingViewController.h"
#import <Parse/Parse.h>
#import "Constants.h"
#import "SudoCareManager.h"

@interface SudoThingViewController ()

@property (strong, nonatomic) NSArray *dataSource;
@end

@implementation SudoThingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    if ([PFUser currentUser]) {
        self.profileBarBtn.title = [[PFUser currentUser] objectForKey:@"username"];
    } else {
        self.profileBarBtn.title = @"Login";
    }
    [self refreshData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Custom Methods

- (void)refreshData {
    __weak typeof(self) weakSelf = self;
    [[SudoCareManager sharedManager] fetchAllSudoRoomThings:^(NSArray *thingsArray, BOOL success, NSError *error) {
        if (success) {
            weakSelf.dataSource = thingsArray;
            [weakSelf.thingTableView reloadData];
        } else {
            NSLog(@"error: %@", [error userInfo]);
        }
    }];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

#pragma mark - Action Methods

- (IBAction)buttonPressed:(id)sender {
    if ([PFUser currentUser]) {
        [self performSegueWithIdentifier:kSegueProfileKey sender:self];
    } else {
        [self performSegueWithIdentifier:kSegueLoginKey sender:self];
    }
}

- (IBAction)addThingBtnPressed:(id)sender {
    // todo
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    PFObject *thing = self.dataSource[indexPath.row];
    NSLog(@"Thing: %@", thing);
    cell.textLabel.text = [thing objectForKey:kParseThingNameKey];
    cell.detailTextLabel.text = [thing objectForKey:kParseThingDescriptionKey];
    return cell;
}

- (void)tableView:(nonnull UITableView *)tableView didSelectRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
}

@end
