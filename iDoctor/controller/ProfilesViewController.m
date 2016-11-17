//
//  ProfilesViewController.m
//  iDoctor
//
//  Created by Jefry Da Gucci on 11/18/16.
//  Copyright © 2016 Appslon. All rights reserved.
//

static NSInteger maxPerPage = 10;

#import "ProfilesViewController.h"
#import "Profile+Request.h"
#import "ProfileTableCell.h"

#import "ProfileDetailViewController.h"
#import <APLTextField/APLTextField.h>

@interface ProfilesViewController ()
<UITableViewDelegate>

@property (strong, nonatomic) IBOutlet APLTextField *txPage;
@property (strong, nonatomic) NSArray *resultsArray;

@end

@implementation ProfilesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    insetNavBarUnhidden = UIEdgeInsetsZero;
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([ProfileTableCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([ProfileTableCell class])];
}

- (void)processingResultWithpage:(NSInteger)page
                       operation:(ASManagedObjectRequestOperation *)operation
                          result:(RKMappingResult *)result
              refreshContentType:(RefreshContentType)refreshContentType
                       tableView:(UITableView *)tableView
                    completion:(void(^)(void))completion{
    
    NSInteger preferencePage = page;
    NSArray *subArray = [self.resultsArray subarrayWithRange:NSMakeRange((preferencePage-1)*maxPerPage, maxPerPage)];
    
    [self processingSuccessWithOperation:operation result:result arrData:subArray refreshContentType:refreshContentType tableView:self.tableView completion:completion];
}

- (void)getContentWithRefreshContentType:(RefreshContentType)refreshContentType{
    [super getContentWithRefreshContentType:refreshContentType];
    
    [self.view showLoadingWithBlock:^{
        
        [Profile getProfileWithPathPattern:@"/test/datalist.json" success:^(ASManagedObjectRequestOperation *operation, RKMappingResult *result, NSArray *resultsArray) {
            
            self.resultsArray = resultsArray;
            NSInteger page = resultsArray.count/maxPerPage;
            NSInteger modPage = resultsArray.count%maxPerPage;
            if(modPage>0){page++;}
            
            NSInteger preferencePage = [self.txPage.text integerValue];
            if (preferencePage==0) preferencePage=1;
            
            [self processingResultWithpage:preferencePage operation:operation result:result refreshContentType:refreshContentType tableView:self.tableView completion:^{
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

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    Profile *p = self.arrData[indexPath.section][indexPath.row];
    ProfileDetailViewController *nextVC = [[ProfileDetailViewController alloc]initWithNibName:NSStringFromClass([ProfileDetailViewController class]) bundle:nil];
    [nextVC setProfile:p];
    [self.navigationController pushViewController:nextVC animated:YES];
}

@end
