//
//  MRTableViewCell.h
//  Mandiri Reksadana
//
//  Created by Jefry Da Gucci on 10/7/15.
//  Copyright (c) 2015 Appslon http://appslon.com . All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableViewCell (MRHelper)

- (CGFloat)cellHeight;

#pragma mark - Utilities
+ (NSString *)defaultCellIdentifier;

@end

@interface MRTableViewCell : UITableViewCell

@end


@interface MRSimpleMenuTableViewCell : MRTableViewCell

@end
