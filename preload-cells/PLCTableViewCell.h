//
//  PLCTableViewCell.h
//  preload-cells
//
//  Created by GabrielMassana on 18/02/2016.
//  Copyright © 2016 GabrielMassana. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PLCTableViewCell : UITableViewCell

+ (NSString *)reuseIdentifier;

- (void)layoutByApplyingConstraints;

- (void)updateCellWithString:(NSString *)string;

@end
