//
//  LocationViewController.m
//  iDoctor
//
//  Created by Jefry Da Gucci on 11/18/16.
//  Copyright © 2016 Appslon. All rights reserved.
//

#import "LocationViewController.h"
#import "Location+Request.h"

@interface LocationViewController ()

@end

@implementation LocationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

- (void)getContentWithRefreshContentType:(RefreshContentType)refreshContentType{
    [super getContentWithRefreshContentType:refreshContentType];
    
    [self.view showLoadingWithBlock:^{
        
        [Location getLocationWithPathPattern:@"/test/location.json" success:^(ASManagedObjectRequestOperation *operation, RKMappingResult *result, NSArray *resultsArray) {
            
            [self processingSuccessWithOperation:operation result:result arrData:resultsArray refreshContentType:refreshContentType tableView:self.tableView completion:^{
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self.view hideActivityView];
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
    UITableViewCell *cell = [super tableView:tableView cellForRowAtIndexPath:indexPath];
    if(cell == nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    Location *l = self.arrData[indexPath.section][indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%@, %@",
                           l.area?l.area:@"",
                           l.city?l.city:@""];
    
    return cell;
}

@end
