//
//  BBListViewController.h
//  Bulletin Board
//
//  Created by Jefry Da Gucci on 5/26/15.
//  Copyright (c) 2015 Domikado. All rights reserved.
//

#import "MRTableViewController.h"

@interface MRListViewController : MRTableViewController

@property (nonatomic, strong) NSMutableArray *arrData;
@property (nonatomic, assign) NSInteger page;
@property (nonatomic, assign) BOOL includePagination;

#pragma mark - content
- (void)resetPage;
- (void)commonInit;
- (void)getContentWithRefreshContentType:(RefreshContentType)refreshContentType;

#pragma mark - content
- (void)processingSuccessWithOperation:(ASManagedObjectRequestOperation *)operation
                                result:(RKMappingResult *)result
                               arrData:(NSArray *)arrData
                    refreshContentType:(RefreshContentType)refreshContentType
                             tableView:(UITableView *)tableView;

- (void)processingSuccessWithOperation:(ASManagedObjectRequestOperation *)operation
                                result:(RKMappingResult *)result
                               arrData:(NSArray *)arrData
                    refreshContentType:(RefreshContentType)refreshContentType
                             tableView:(UITableView *)tableView
                            completion:(void(^)(void))completion;

- (void)processingErrorWithOperation:(ASManagedObjectRequestOperation *)operation error:(NSError *)error;

@end
