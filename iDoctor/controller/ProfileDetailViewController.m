//
//  ProfileDetailViewController.m
//  iDoctor
//
//  Created by Jefry Da Gucci on 11/18/16.
//  Copyright © 2016 Appslon. All rights reserved.
//

#import "ProfileDetailViewController.h"
#import "Profile+Request.h"

@interface ProfileDetailViewController ()
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

@end

@implementation ProfileDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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
}

@end
