//
//  MRTableViewController.m
//  Mandiri Reksadana
//
//  Created by Jefry Da Gucci on 10/7/15.
//  Copyright (c) 2015 Appslon http://appslon.com . All rights reserved.
//

#import "MRTableViewController.h"
#import "UIViewController+MRHelper.h"

@interface MRTableViewController ()

@end

@implementation MRTableViewController

@dynamic tableView;

- (void)setHideRefeshControl:(BOOL)hideRefeshControl{
    _hideRefeshControl = hideRefeshControl;
    !self.refreshControl?:[self.refreshControl removeFromSuperview];
    if(!hideRefeshControl){
        !self.refreshControl?:[self.refreshControl removeFromSuperview];
        UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
        [refreshControl addTarget:self action:@selector(handleRefresh:) forControlEvents:UIControlEventValueChanged];
        
        [self.tableView addSubview:refreshControl];
        self.refreshControl = refreshControl;
    }
}

#pragma mark - action
- (void)handleRefresh:(id)sender{
    
}

@end
