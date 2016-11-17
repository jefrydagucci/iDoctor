//
//  ProfilesViewController.m
//  iDoctor
//
//  Created by Jefry Da Gucci on 11/18/16.
//  Copyright © 2016 Appslon. All rights reserved.
//

#import "ProfilesViewController.h"
#import "Profile+Request.h"
#import "ProfileTableCell.h"

@interface ProfilesViewController ()

@end

@implementation ProfilesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    insetNavBarUnhidden = UIEdgeInsetsZero;
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([ProfileTableCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([ProfileTableCell class])];
}

- (void)getContentWithRefreshContentType:(RefreshContentType)refreshContentType{
    [super getContentWithRefreshContentType:refreshContentType];
    
    [self.view showLoadingWithBlock:^{
        
        [Profile getProfileWithPathPattern:@"/test/datalist.json" success:^(ASManagedObjectRequestOperation *operation, RKMappingResult *result, NSArray *resultsArray) {
            
            [self processingSuccessWithOperation:operation result:result arrData:resultsArray refreshContentType:refreshContentType tableView:self.tableView completion:^{
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self.tableView reloadData];
                });
            }];
            
            [self.view hideActivityView];
            
        } failure:^(ASManagedObjectRequestOperation *operation, NSError *error) {
            ASLog(error.localizedDescription);
            [self.view hideActivityView];
        }];
    }];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"cellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([ProfileTableCell class])];
    if(cell == nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    Profile *p = self.arrData[indexPath.section][indexPath.row];
    if([cell isKindOfClass:[ProfileTableCell class]]){
        [(ProfileTableCell *)cell setProfile:p];
    }
    return cell;
}



@end
