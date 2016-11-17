//
//  ProfileTableCell.m
//  iDoctor
//
//  Created by Jefry Da Gucci on 11/18/16.
//  Copyright © 2016 Appslon. All rights reserved.
//

#import "ProfileTableCell.h"
#import "Profile.h"

@interface ProfileTableCell ()

@property (strong, nonatomic) IBOutlet UIImageView *imgView;
@property (strong, nonatomic) IBOutlet UILabel *labelName;
@property (strong, nonatomic) IBOutlet UILabel *labelArea;
@property (strong, nonatomic) IBOutlet UILabel *labelSpeciality;
@property (strong, nonatomic) IBOutlet UILabel *labelRate;

@end

@implementation ProfileTableCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setProfile:(Profile *)profile{
    _profile = profile;
    self.labelName.text = profile.name;
    self.labelArea.text = profile.area;
    self.labelSpeciality.text   = profile.speciality;
    self.labelRate.text = [NSString stringWithFormat:@"%li", profile.rate.integerValue];
    
    NSURL *imgURL = [NSURL URLWithString:profile.photo?profile.photo:@""];
    [self.imgView setImageWithURL:imgURL];
}

@end
