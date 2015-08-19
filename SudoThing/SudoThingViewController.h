//
//  SudoThingViewController.h
//  SudoThing
//
//  Created by Romy on 8/19/15.
//  Copyright (c) 2015 Romy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SudoThingViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UIButton *addThing;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *profileBarBtn;
@property (weak, nonatomic) IBOutlet UITableView *thingTableView;

- (IBAction)buttonPressed:(id)sender;

- (IBAction)addThingBtnPressed:(id)sender;

@end
