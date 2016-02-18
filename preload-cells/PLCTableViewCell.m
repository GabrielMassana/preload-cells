//
//  PLCTableViewCell.m
//  preload-cells
//
//  Created by GabrielMassana on 18/02/2016.
//  Copyright © 2016 GabrielMassana. All rights reserved.
//

#import "PLCTableViewCell.h"

@implementation PLCTableViewCell

#pragma mark - Identifier

+ (NSString *)reuseIdentifier
{
    return NSStringFromClass([self class]);
}

#pragma mark - Layout

- (void)layoutByApplyingConstraints
{
    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];
    
    [self setNeedsLayout];
    [self layoutIfNeeded];
}

#pragma mark - Update

- (void)updateCellWithString:(NSString *)string
{
    self.textLabel.text = string;
}

@end
