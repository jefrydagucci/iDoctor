//
//  MRTableViewController.h
//  Mandiri Reksadana
//
//  Created by Jefry Da Gucci on 10/7/15.
//  Copyright (c) 2015 Appslon http://appslon.com . All rights reserved.
//

#import "ASTableViewController.h"

@interface MRTableViewController : ASTableViewController

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, assign) BOOL hideRefeshControl;
@property (nonatomic, strong) UIRefreshControl *refreshControl;

#pragma mark - action
- (void)handleRefresh:(id)sender;

@end
