//
//  LocationViewController.m
//  iDoctor
//
//  Created by Jefry Da Gucci on 11/18/16.
//  Copyright © 2016 Appslon. All rights reserved.
//

#import "LocationViewController.h"
#import "Location+Request.h"
#import <MXParallaxHeader/MXParallaxHeader.h>

@interface LocationViewController ()
<UISearchBarDelegate>

@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;
@property (strong, nonatomic) NSArray *resultsArr;

@end

@implementation LocationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.resultsArr = [NSArray new];
    
    self.searchBar.delegate = self;
    
    UIScrollView *scrollView = self.tableView;
    scrollView.parallaxHeader.view = self.searchBar;
    scrollView.parallaxHeader.height = CGRectGetHeight(self.searchBar.bounds);
    scrollView.parallaxHeader.mode = MXParallaxHeaderModeFill;
    scrollView.parallaxHeader.minimumHeight = scrollView.parallaxHeader.height;
    
    UIToolbar* numberToolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth([[UIScreen mainScreen] bounds]), 50)];
    numberToolbar.barStyle = UIBarStyleDefault;
    numberToolbar.items = [NSArray arrayWithObjects:
                           [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(searchBarSearchButtonClicked:)],
                           nil];
    [numberToolbar sizeToFit];
    self.searchBar.inputAccessoryView = numberToolbar;
}

- (void)getContentWithRefreshContentType:(RefreshContentType)refreshContentType{
    [super getContentWithRefreshContentType:refreshContentType];
    
    [self.view showLoadingWithBlock:^{
        
        [Location getLocationWithPathPattern:[NSString stringWithFormat:@"/%@/location.json",
                                              [MRAPIManager sharedInstance].APIVersion] success:^(ASManagedObjectRequestOperation *operation, RKMappingResult *result, NSArray *resultsArray) {
            
            self.resultsArr = resultsArray;
            
            [self processingResultArray:resultsArray successWithOperation:operation result:result refreshContentType:refreshContentType completion:^{
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self.view hideActivityView];
                    [self.tableView reloadData];
                });
            }];
            
            [self.view hideActivityView];
            
        } failure:^(ASManagedObjectRequestOperation *operation, NSError *error) {
            ASLog(error.localizedDescription);
            [self.view hideActivityView];
            [CSNotificationView showInViewController:self style:CSNotificationViewStyleError message:error.localizedDescription];
        }];
    }];
}

- (void)processingResultArray:(NSArray *)array
         successWithOperation:(ASManagedObjectRequestOperation *)operation
                       result:(RKMappingResult *)result
           refreshContentType:(RefreshContentType)refreshContentType
                   completion:(void(^)(void))completion{
    [self processingSuccessWithOperation:operation result:result arrData:array refreshContentType:refreshContentType tableView:self.tableView completion:^{
        
        !completion?:completion();
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

#pragma mark - filter
- (void)filterByText:(NSString *)text{
    NSPredicate *pred       = [NSPredicate predicateWithFormat:@"(area CONTAINS[cd] %@ or area like %@) or (city like %@ or city CONTAINS[cd] %@)", text, text, text, text];
    
    NSArray *filtered = text.length>1?[self.resultsArr filteredArrayUsingPredicate:pred]:self.resultsArr;
    
    
    [self processingResultArray:filtered successWithOperation:nil result:nil refreshContentType:RefreshContentTypeReplaceAll completion:^{
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.view hideActivityView];
            [self.tableView reloadData];
        });
    }];
}

#pragma mark - UISearchBarDelegate;
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    NSString *filterText    = searchText;
    [self filterByText:filterText];
}


- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    [self.view endEditing:YES];
    NSString *filterText    = self.searchBar.text;
    [self filterByText:filterText];
}

@end
