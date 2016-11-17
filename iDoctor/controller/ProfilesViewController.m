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
<UITableViewDelegate,
UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet APLTextField *txPage;
@property (strong, nonatomic) NSArray *resultsArray;

@end

@implementation ProfilesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    insetNavBarUnhidden = UIEdgeInsetsZero;
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([ProfileTableCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([ProfileTableCell class])];
    
    self.txPage.delegate = self;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.title = @"Doctors";
}

- (void)ASTableViewReloadContentByPullingTopView:(UITableView *)tableView{
    [self getContentWithRefreshContentType:RefreshContentTypeReplaceAll];
}

- (void)processingResultWithpage:(NSInteger)page
                       operation:(ASManagedObjectRequestOperation *)operation
                          result:(RKMappingResult *)result
              refreshContentType:(RefreshContentType)refreshContentType
                       tableView:(UITableView *)tableView
                    completion:(void(^)(void))completion{
    
    [self.view showLoadingWithBlock:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            NSInteger preferencePage = page;
            NSInteger firstIndex = (preferencePage-1)*maxPerPage;
            NSArray *subArray = [self.resultsArray subarrayWithRange:NSMakeRange(firstIndex, MIN(maxPerPage, self.resultsArray.count - firstIndex))];
            
            [self processingSuccessWithOperation:operation result:result arrData:subArray refreshContentType:refreshContentType tableView:self.tableView completion:completion];
            
            [self.view hideActivityView];
        });
    }];
}

- (void)getContentWithRefreshContentType:(RefreshContentType)refreshContentType{
    [super getContentWithRefreshContentType:refreshContentType];
    
    [self.view showLoadingWithBlock:^{
        [Profile getProfileWithPathPattern:[NSString stringWithFormat:@"/%@/datalist.json",
                                            [MRAPIManager sharedInstance].APIVersion]
                                             success:^(ASManagedObjectRequestOperation *operation, RKMappingResult *result, NSArray *resultsArray) {
            
            self.resultsArray = resultsArray;
            NSInteger page = resultsArray.count/maxPerPage;
            NSInteger modPage = resultsArray.count%maxPerPage;
            if(modPage>0){page++;}
            
            NSMutableArray *pages = [NSMutableArray new];
            for(NSInteger i=1; i<=page; i++){
                [pages addObject:[NSString stringWithFormat:@"%li", i]];
            }
            [self.txPage setPickerOptions:pages];
            
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
            [CSNotificationView showInViewController:self style:CSNotificationViewStyleError message:error.localizedDescription];
            [UIAlertView showWithTitle:@"Retry?" message:@"Tap OK to retry" cancelButtonTitle:@"Cancel" otherButtonTitles:@[@"OK"] tapBlock:^(UIAlertView * _Nonnull alertView, NSInteger buttonIndex) {
                if(buttonIndex == 1){
                    [self getContentWithRefreshContentType:RefreshContentTypeReplaceAll];
                }
            }];
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

#pragma mark - UITextFieldDelegate
- (void)textFieldDidEndEditing:(UITextField *)textField{
    if(textField == self.txPage){
        NSInteger preferencePage = [self.txPage.text integerValue];
        if (preferencePage==0) preferencePage=1;
        
        [self processingResultWithpage:preferencePage operation:nil result:nil refreshContentType:RefreshContentTypeReplaceAll tableView:self.tableView completion:^{
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.tableView reloadData];
            });
        }];
        
        [self.view hideActivityView];
    }
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    return YES;
}

@end
