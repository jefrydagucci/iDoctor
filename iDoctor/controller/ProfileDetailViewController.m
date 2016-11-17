//
//  ProfileDetailViewController.m
//  iDoctor
//
//  Created by Jefry Da Gucci on 11/18/16.
//  Copyright © 2016 Appslon. All rights reserved.
//

#import "ProfileDetailViewController.h"
#import "Profile+Request.h"
#import <MXParallaxHeader/MXParallaxHeader.h>

@interface ProfileDetailViewController ()
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIView *headerView;
@property (strong, nonatomic) IBOutlet UILabel *labelRecommendation;
@property (strong, nonatomic) IBOutlet UILabel *labelSchedule;
@property (strong, nonatomic) IBOutlet UILabel *labelName;
@property (strong, nonatomic) IBOutlet UILabel *labelArea;
@property (strong, nonatomic) IBOutlet UILabel *labelSpeciality;
@property (strong, nonatomic) IBOutlet UILabel *labelRate;
@property (strong, nonatomic) IBOutlet UILabel *labelExperience;
@property (strong, nonatomic) IBOutlet UILabel *labelDescription;
@property (strong, nonatomic) IBOutlet UILabel *labelLocation;
@property (strong, nonatomic) IBOutlet UIImageView *imgView;

@end

@implementation ProfileDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIScrollView *scrollView = self.scrollView;
    scrollView.parallaxHeader.view = self.headerView;
    scrollView.parallaxHeader.height = CGRectGetHeight(self.headerView.bounds);
    scrollView.parallaxHeader.mode = MXParallaxHeaderModeFill;
    scrollView.parallaxHeader.minimumHeight = 0;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    NSString *profileId = self.profile.obj_id;
    [self.view showLoadingWithBlock:^{
        [Profile getProfileWithPathPattern:[NSString stringWithFormat:@"/test/profile/%@.json",
                                            profileId] success:^(ASManagedObjectRequestOperation *operation, RKMappingResult *result, NSArray *resultsArray) {
            Profile *p = resultsArray.firstObject;
            if([p isKindOfClass:[Profile class]]){
                [self updateViewWithProfile:p];
            }
            
            [self.view hideActivityView];
        } failure:^(ASManagedObjectRequestOperation *operation, NSError *error) {
            ASLog(error.localizedDescription);
            [self.view hideActivityView];
        }];
    }];
}

- (void)updateViewWithProfile:(Profile *)profile{
    _profile = profile;
    
    self.labelArea.text = profile.area;
    self.labelName.text = profile.name;
    self.labelRate.text = [NSString stringWithFormat:@"IDR %li", profile.rate.integerValue];
    self.labelSchedule.text = profile.schedule;
    self.labelExperience.text = [NSString stringWithFormat:@"%li year%@ experience", profile.experience.integerValue, profile.experience.integerValue>1?@"s":@""];
    self.labelSpeciality.text = profile.speciality;
    self.labelDescription.text = profile.obj_description;
    self.labelRecommendation.text = [NSString stringWithFormat:@"%@", profile.recommendation];
    
    NSURL *url = [NSURL URLWithString:profile.photo?profile.photo:@""];
    [self.imgView setImageWithURL:url];
}

@end
