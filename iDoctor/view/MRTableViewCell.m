//
//  MRTableViewCell.m
//  Mandiri Reksadana
//
//  Created by Jefry Da Gucci on 10/7/15.
//  Copyright (c) 2015 Appslon http://appslon.com . All rights reserved.
//

#import "MRTableViewCell.h"

@implementation UITableViewCell (MRHelper)

- (CGFloat)cellHeight{
    [self setNeedsLayout];
    [self layoutIfNeeded];
    CGSize size;
    if([self respondsToSelector:@selector(systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:)]){
        size = [self.contentView systemLayoutSizeFittingSize:self.frame.size withHorizontalFittingPriority:UILayoutPriorityRequired verticalFittingPriority:UILayoutPriorityFittingSizeLevel];
    }
    else if([self respondsToSelector:@selector(systemLayoutSizeFittingSize:)]){
        size = [self.contentView systemLayoutSizeFittingSize:self.frame.size];
    }
    return MAX(size.height, 40);
}

#pragma mark - Utilities
+ (NSString *)defaultCellIdentifier{
    return NSStringFromClass([self class]);
}

@end
@implementation MRTableViewCell

@end




@implementation MRSimpleMenuTableViewCell

- (void)layoutSubviews{
    [super layoutSubviews];
    UIFont *fontTitle = [UIFont systemFontOfSize:12];
    UIFont *fontDetail  = [UIFont systemFontOfSize:10];
    
    self.textLabel.font         = fontTitle;
    self.textLabel.textColor    = [UIColor whiteColor];
    self.detailTextLabel.font         = fontDetail;
    self.detailTextLabel.textColor    = [UIColor whiteColor];
    
    self.backgroundColor        = [UIColor clearColor];
    self.selectionStyle         = UITableViewCellSelectionStyleNone;
}

@end
