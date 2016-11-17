//
//  BBListViewController.m
//  Bulletin Board
//
//  Created by Jefry Da Gucci on 5/26/15.
//  Copyright (c) 2015 Domikado. All rights reserved.
//

#import "MRListViewController.h"
#import "UIViewController+MRHelper.h"
#import "MRTableViewCell.h"

@interface MRListViewController ()

@end

@implementation MRListViewController

#pragma mark - memory
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - init
- (instancetype)init{
    if(self = [super init]){
        [self commonInit];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder{
    if(self = [super initWithCoder:aDecoder]){
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    if(self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]){
        [self commonInit];
    }
    return self;
}

- (void)commonInit{
    self.arrData = [NSMutableArray new];
    [self resetPage];
}

#pragma mark - view
- (void)viewDidLoad{
    [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    if(!self.hasDoneFirstRequest){
        [self getContentWithRefreshContentType:RefreshContentTypeReplaceAll];
    }
}

#pragma mark - content
- (void)resetPage{
    self.page = 1;
}

- (void)getContentWithRefreshContentType:(RefreshContentType)refreshContentType{
    !(refreshContentType==RefreshContentTypeReplaceAll)?:[self resetPage];
}

#pragma mark - BBTableViewController
- (void)handleRefresh:(id)sender{
    [self getContentWithRefreshContentType:RefreshContentTypeReplaceAll];
}

#pragma mark - content
- (void)processingSuccessWithOperation:(ASManagedObjectRequestOperation *)operation
                                result:(RKMappingResult *)result
                               arrData:(NSArray *)arrData
                    refreshContentType:(RefreshContentType)refreshContentType
                             tableView:(UITableView *)tableView{
    
    [self processingSuccessWithOperation:operation result:result arrData:arrData refreshContentType:refreshContentType tableView:tableView completion:nil];
}

- (void)processingSuccessWithOperation:(ASManagedObjectRequestOperation *)operation
                                result:(RKMappingResult *)result
                               arrData:(NSArray *)arrData
                    refreshContentType:(RefreshContentType)refreshContentType
                             tableView:(UITableView *)tableView
                            completion:(void(^)(void))completion{
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        switch (refreshContentType) {
            case RefreshContentTypeReplaceAll:{
                NSMutableArray *arrRow      = [NSMutableArray new];
                [arrRow addObjectsFromArray:arrData];
                NSMutableArray *arrSection  = [NSMutableArray new];
                [arrSection addObject:arrRow];
                self.arrData = arrSection;
                if(result.array.count>0){
                    self.page++;
                }
            }
                break;
            case RefreshContentTypeAddToFirstIndex:{
                NSMutableArray *arrRow = [self.arrData firstObject];
                [arrRow insertObjects:arrData atIndexes:[NSIndexSet indexSetWithIndex:0]];
            }
                break;
            case RefreshContentTypeAddToLastIndex:{
                [[self.arrData firstObject] addObjectsFromArray:arrData];
                if(result.array.count>0){
                    self.page++;
                }
            }
                break;
            default:
                break;
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [tableView reloadDataWithCompletion:^{
                self.isRequestData = NO;
                [self.refreshControl endRefreshing];
                self.hasDoneFirstRequest = YES;
                
                !completion?:completion();
            }];
        });
    });
}

- (void)processingErrorWithOperation:(ASManagedObjectRequestOperation *)operation error:(NSError *)error{
    self.isRequestData = NO;
    [self showErrorMessageForOperation:operation error:error completion:nil];
    [self.refreshControl endRefreshing];
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.arrData.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(self.arrData.count>0){
        return [self.arrData[section] count];
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"cellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell == nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [[self tableView:tableView cellForRowAtIndexPath:indexPath] cellHeight];
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat offsetContent   = bottomOffsetReloadContent;
    if(self.hasDoneFirstRequest && self.includePagination){
        
        if([scrollView reachBottomWithOffset:offsetContent]){
            self.valVerticalTableMovement++;
            if(self.valVerticalTableMovement>80){
                self.valVerticalTableMovement = 0;
                [self getContentWithRefreshContentType:RefreshContentTypeAddToLastIndex];
            }
        }
    }
    
    [super scrollViewDidScroll:scrollView];
}
@end
